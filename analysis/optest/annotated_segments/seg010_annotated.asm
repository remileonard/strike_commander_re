seg010		segment	byte public 'CODE' use16
		assume cs:seg010
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Music_ChannelStopSequence_59F1D (sub_59F1D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'Sequencer_AdvanceActiveSlot_59F1D'. far, 65L,
; LUE 2026-10-06. Arrete et libere la sequence d'un canal musical (struct canal : +0 pilote
; (+4 = handle AIL), +2 handle de sequence, -1 si aucune, +4 table d'etat) : si
; AIL_sequence_status_603DE == 1 (en cours) -> AIL_stop_sequence_603D2 ; puis
; AIL_release_sequence_handle_6039C et handle = -1. Canaux du jeu : 5BE3h (principal) et 5BF5h
; (transition).
; ==============================================================================================
Music_ChannelStopSequence_783A	proc far		; CODE XREF: sub_702F+430P
					; sub_8705+A7P	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_783E:				; DATA XREF: seg170:010Eo
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_78A1
		cmp	word ptr [si], 0
		jz	short loc_7869
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_30C54
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_7865
		mov	ax, 1
		jmp	short loc_7867
; ���������������������������������������������������������������������������

loc_7865:				; CODE XREF: Music_ChannelStopSequence_783A+24j
		xor	ax, ax

loc_7867:				; CODE XREF: Music_ChannelStopSequence_783A+29j
		jmp	short loc_786B
; ���������������������������������������������������������������������������

loc_7869:				; CODE XREF: Music_ChannelStopSequence_783A+Fj
		mov	al, 0

loc_786B:				; CODE XREF: Music_ChannelStopSequence_783A:loc_7867j
		or	al, al
		jz	short loc_7886
		cmp	word ptr [si], 0
		jz	short loc_7886
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_30C48
		add	sp, 4
		jmp	short $+2

loc_7886:				; CODE XREF: Music_ChannelStopSequence_783A+33j Music_ChannelStopSequence_783A+38j
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_78A1
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_30C12
		add	sp, 4
		mov	word ptr [si+2], 0FFFFh

loc_78A1:				; CODE XREF: Music_ChannelStopSequence_783A+Aj Music_ChannelStopSequence_783A+50j
		pop	si
		pop	bp
		retf
Music_ChannelStopSequence_783A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Initialise un canal musical : +0 pilote (arg_2), +2 séquence = -1,
; table d'état allouée selon la taille demandée au pilote (sub_30C06), descripteur en +4. Même
; rôle que Music_ChannelInit_59F87 de STRIKE.EXE (code différent).
; ==============================================================================================
MusicChannel_Init_78A4	proc far		; CODE XREF: sub_702F+3C2P
					; sub_4E660+344P ...

var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_7914
		mov	[si], di
		mov	word ptr [si+2], 0FFFFh
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_30C06
		add	sp, 2
		mov	[bp+var_2], ax
		movzx	eax, [bp+var_2]
		mov	[bp+var_6], eax
		push	1528h
		push	1
		push	1
		push	2
		push	large [bp+var_6]
		push	661Ah
		call	Memory_TypedFreeWrapperB_2B862
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

loc_7914:				; CODE XREF: MusicChannel_Init_78A4+10j
		pop	di
		pop	si
		leave
		retf
MusicChannel_Init_78A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Si le canal a un pilote et aucune séquence : enregistre la séquence
; XMIDI du bloc donné (sub_30C0C ; bloc de type 3 verrouillé par sub_2AE6E, sinon pointeur
; direct ; échec : byte_4457C = 6), puis installe chaque timbre demandé par le pilote
; (sub_30C24 renvoie banque × 256 + patch, installé par sub_75AF) jusqu'à -1. Même rôle que
; Music_ChannelRegisterSequence_59FF5 de STRIKE.EXE (code différent).
; ==============================================================================================
MusicChannel_RegisterSequence_7918	proc far		; CODE XREF: sub_702F+3D5P
					; sub_8609+A5P	...

var_10		= word ptr -10h
var_E		= word ptr -0Eh
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
		jnz	short loc_792E
		jmp	loc_7A39
; ���������������������������������������������������������������������������

loc_792E:				; CODE XREF: MusicChannel_RegisterSequence_7918+11j
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_7937
		jmp	loc_7A39
; ���������������������������������������������������������������������������

loc_7937:				; CODE XREF: MusicChannel_RegisterSequence_7918+1Aj
		cmp	byte ptr [di+4], 3
		jnz	short loc_7942
		mov	ax, 1
		jmp	short loc_7944
; ���������������������������������������������������������������������������

loc_7942:				; CODE XREF: MusicChannel_RegisterSequence_7918+23j
		xor	ax, ax

loc_7944:				; CODE XREF: MusicChannel_RegisterSequence_7918+28j
		mov	[bp+var_3], al
		mov	[bp+var_8], 0
		cmp	[bp+var_3], 0
		jz	short loc_79C4
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		and	eax, 0FFFFFEh
		add	eax, 10h
		shld	edx, eax, 10h
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	PagedMemory_ReleaseRange_2AE6E
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7999
		mov	byte_4457C, 6
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_7999:				; CODE XREF: MusicChannel_RegisterSequence_7918+76j
		mov	al, [bp+var_3]
		mov	ah, 0
		push	ax
		push	0
		push	0
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	[bp+arg_4]
		push	[bp+var_E]
		push	[bp+var_10]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_30C0C
		add	sp, 12h
		mov	[si+2],	ax
		jmp	short loc_79EC
; ���������������������������������������������������������������������������

loc_79C4:				; CODE XREF: MusicChannel_RegisterSequence_7918+3Bj
		mov	al, [bp+var_3]
		mov	ah, 0
		push	ax
		push	0
		push	0
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	[bp+arg_4]
		push	word ptr [di+2]
		push	word ptr [di]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_30C0C
		add	sp, 12h
		mov	[si+2],	ax

loc_79EC:				; CODE XREF: MusicChannel_RegisterSequence_7918+AAj
		cmp	word ptr [si+2], 0FFFFh
		jnz	short loc_79F4
		jmp	short loc_7A39
; ���������������������������������������������������������������������������

loc_79F4:				; CODE XREF: MusicChannel_RegisterSequence_7918+D8j
		cmp	word ptr [si+2], 0FFFEh
		jnz	short loc_79FC
		jmp	short loc_7A39
; ���������������������������������������������������������������������������

loc_79FC:				; CODE XREF: MusicChannel_RegisterSequence_7918+E0j
					; MusicChannel_RegisterSequence_7918:loc_7A37j
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_30C24
		add	sp, 4
		mov	[bp+var_E], ax
		cmp	[bp+var_E], 0FFFFh
		jz	short loc_7A35
		mov	ax, [bp+var_E]
		shr	ax, 8
		mov	byte ptr [bp+var_2+1], al
		mov	al, byte ptr [bp+var_E]
		and	al, 0FFh
		mov	byte ptr [bp+var_2], al
		push	[bp+var_2]
		push	word ptr [si]
		call	sub_75AF
		add	sp, 4
		jmp	short loc_7A37
; ���������������������������������������������������������������������������

loc_7A35:				; CODE XREF: MusicChannel_RegisterSequence_7918+FBj
		jmp	short loc_7A39
; ���������������������������������������������������������������������������

loc_7A37:				; CODE XREF: MusicChannel_RegisterSequence_7918+11Bj
		jmp	short loc_79FC
; ���������������������������������������������������������������������������

loc_7A39:				; CODE XREF: MusicChannel_RegisterSequence_7918+13j MusicChannel_RegisterSequence_7918+1Cj ...
		pop	di
		pop	si
		leave
		retf
MusicChannel_RegisterSequence_7918	endp

seg010		ends
