seg123		segment	byte public 'CODE' use16
		assume cs:seg123
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Sequencer_AdvanceActiveSlot_59F1D'. far, 65L, LUE 2026-10-06. Arrete et libere la
; sequence d'un canal musical (struct canal : +0 pilote (+4 = handle AIL), +2 handle de
; sequence, -1 si aucune, +4 table d'etat) : si AIL_sequence_status_603DE == 1 (en cours) ->
; AIL_stop_sequence_603D2 ; puis AIL_release_sequence_handle_6039C et handle = -1. Canaux du
; jeu : 5BE3h (principal) et 5BF5h (transition).
; ==============================================================================================
Music_ChannelStopSequence_59F1D	proc far		; CODE XREF: Music_TuneTransitionResolve_595C2+C9P
					; Music_TuneTransitionResolve_595C2+124P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_59F84
		cmp	word ptr [si], 0
		jz	short loc_59F4C
		push	word ptr [si+2]
		mov	bx, [si]

loc_59F33:
		push	word ptr [bx+4]
		call	AIL_sequence_status_603DE
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_59F48
		mov	ax, 1
		jmp	short loc_59F4A
; ���������������������������������������������������������������������������

loc_59F48:				; CODE XREF: Music_ChannelStopSequence_59F1D+24j
		xor	ax, ax

loc_59F4A:				; CODE XREF: Music_ChannelStopSequence_59F1D+29j
		jmp	short loc_59F4E
; ���������������������������������������������������������������������������

loc_59F4C:				; CODE XREF: Music_ChannelStopSequence_59F1D+Fj
		mov	al, 0

loc_59F4E:				; CODE XREF: Music_ChannelStopSequence_59F1D:loc_59F4Aj
		or	al, al
		jz	short loc_59F69
		cmp	word ptr [si], 0
		jz	short loc_59F69
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_603D2
		add	sp, 4
		jmp	short $+2

loc_59F69:				; CODE XREF: Music_ChannelStopSequence_59F1D+33j
					; Music_ChannelStopSequence_59F1D+38j
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_59F84
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_release_sequence_handle_6039C
		add	sp, 4
		mov	word ptr [si+2], 0FFFFh

loc_59F84:				; CODE XREF: Music_ChannelStopSequence_59F1D+Aj
					; Music_ChannelStopSequence_59F1D+50j
		pop	si
		pop	bp
		retf
Music_ChannelStopSequence_59F1D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Sequencer_ReleaseSlot_59F87'. far, 49L, LUE 2026-10-06. Initialise un canal musical pour
; un pilote : canal+0 = pilote, handle = -1, alloue la table d'etat XMIDI de
; AIL_state_table_size_60390 octets (pool 5C44h) en canal+4, taille en +0xA.
; ==============================================================================================
Music_ChannelInit_59F87	proc far		; CODE XREF: TextRenderer_Main+843P
					; TextRenderer_Main+852P ...

var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	short loc_59FF2
		mov	[si], dx
		mov	word ptr [si+2], 0FFFFh
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_state_table_size_60390
		pop	cx
		mov	[bp+var_2], ax
		movzx	eax, [bp+var_2]
		mov	[bp+var_6], eax
		push	37E4h
		push	1
		push	1
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		mov	eax, [bp+var_A]
		mov	[si+4],	eax
		mov	byte ptr [si+8], 2
		mov	byte ptr [si+9], 1
		mov	dword ptr [si+0Ah], 0
		mov	eax, [bp+var_6]
		mov	[si+0Ah], eax

loc_59FF2:				; CODE XREF: Music_ChannelInit_59F87+Fj
		pop	si
		leave
		retf
Music_ChannelInit_59F87	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Sequencer_ProcessQueue_59FF5'. far, 135L, LUE 2026-10-06. Charge une piste dans un canal
; : si le descripteur est de type 3 (donnees en memoire paginee), la projette d'abord
; (PagedMemory_ReleaseRange_5BD80, echec -> byte_7084A = 6) ;
; AIL_register_sequence_60396(pilote, donnees XMIDI, numero de sequence arg_4, table d'etat,
; 0) -> handle (-1 -> byte_7084A = 3, -2 -> 5) ; puis boucle AIL_timbre_request_603AE ->
; Music_InstallTimbre_5A62A(banque, patch) jusqu'a 0xFFFF (tous les timbres necessaires
; installes). Le demarrage se fait ensuite par AIL_start_sequence_603CC.
; ==============================================================================================
Music_ChannelRegisterSequence_59FF5	proc far		; CODE XREF: seg121:058AP
					; Music_TuneTransitionResolve_595C2+EAP ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si], 0
		jnz	short loc_5A00B
		jmp	loc_5A0EF
; ���������������������������������������������������������������������������

loc_5A00B:				; CODE XREF: Music_ChannelRegisterSequence_59FF5+11j
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_5A014
		jmp	loc_5A0EF
; ���������������������������������������������������������������������������

loc_5A014:				; CODE XREF: Music_ChannelRegisterSequence_59FF5+1Aj
		cmp	byte ptr [di+4], 3
		jnz	short loc_5A01F
		mov	ax, 1
		jmp	short loc_5A021
; ���������������������������������������������������������������������������

loc_5A01F:				; CODE XREF: Music_ChannelRegisterSequence_59FF5+23j
		xor	ax, ax

loc_5A021:				; CODE XREF: Music_ChannelRegisterSequence_59FF5+28j
		mov	[bp+var_3], al

loc_5A024:
		mov	[bp+var_8], 0
		cmp	[bp+var_3], 0
		jz	short loc_5A083
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	[bp+var_8], eax
		and	eax, 0FFFFFEh
		add	eax, 10h
		shld	edx, eax, 10h
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	PagedMemory_ReleaseRange_5BD80
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5A06D
		mov	byte_7084A, 6
		jmp	loc_5A0EF
; ���������������������������������������������������������������������������

loc_5A06D:				; CODE XREF: Music_ChannelRegisterSequence_59FF5+6Ej
		mov	al, [bp+var_3]
		mov	ah, 0
		push	ax
		push	large 0
		push	large dword ptr	[si+4]
		push	[bp+arg_4]
		push	large [bp+var_10]
		jmp	short loc_5A096
; ���������������������������������������������������������������������������

loc_5A083:				; CODE XREF: Music_ChannelRegisterSequence_59FF5+3Bj
		mov	al, [bp+var_3]
		mov	ah, 0
		push	ax
		push	large 0
		push	large dword ptr	[si+4]
		push	[bp+arg_4]
		push	large dword ptr	[di]

loc_5A096:				; CODE XREF: Music_ChannelRegisterSequence_59FF5+8Cj
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_register_sequence_60396
		add	sp, 12h
		mov	[si+2],	ax
		cmp	word ptr [si+2], 0FFFFh
		jnz	short loc_5A0B3
		mov	byte_7084A, 3
		jmp	short loc_5A0EF
; ���������������������������������������������������������������������������

loc_5A0B3:				; CODE XREF: Music_ChannelRegisterSequence_59FF5+B5j
		cmp	word ptr [si+2], 0FFFEh
		jnz	short loc_5A0C0
		mov	byte_7084A, 5
		jmp	short loc_5A0EF
; ���������������������������������������������������������������������������

loc_5A0C0:				; CODE XREF: Music_ChannelRegisterSequence_59FF5+C2j
					; Music_ChannelRegisterSequence_59FF5+F8j
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_timbre_request_603AE
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_5A0EF
		shr	ax, 8
		mov	byte ptr [bp+var_2+1], al
		mov	byte ptr [bp+var_2], dl
		push	[bp+var_2]
		push	word ptr [si]
		call	Music_InstallTimbre_5A62A
		add	sp, 4
		jmp	short loc_5A0C0
; ���������������������������������������������������������������������������

loc_5A0EF:				; CODE XREF: Music_ChannelRegisterSequence_59FF5+13j
					; Music_ChannelRegisterSequence_59FF5+1Cj ...
		pop	di

loc_5A0F0:
		pop	si
		leave
		retf
Music_ChannelRegisterSequence_59FF5	endp

seg123		ends
