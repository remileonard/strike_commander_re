seg036		segment	para public 'CODE' use16
		assume cs:seg036
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ah, 0B6h, 2, 0E6h, 18h, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Music_ChannelStopSequence_5C915 (sub_5C915 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Music_ChannelStopSequence_783A (sub_783A de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Music_ChannelStopSequence_59F1D (sub_59F1D de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Sequencer_AdvanceActiveSlot_59F1D'. far, 65L, LUE 2026-10-06. Arrete et libere la
; sequence d'un canal musical (struct canal : +0 pilote (+4 = handle AIL), +2 handle de
; sequence, -1 si aucune, +4 table d'etat) : si AIL_sequence_status_603DE == 1 (en cours) ->
; AIL_stop_sequence_603D2 ; puis AIL_release_sequence_handle_6039C et handle = -1. Canaux du
; jeu : 5BE3h (principal) et 5BF5h (transition).
; ==============================================================================================
Music_ChannelStopSequence_1A6AA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_1A711
		cmp	word ptr [si], 0
		jz	short loc_1A6D9
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_1A6D5
		mov	ax, 1
		jmp	short loc_1A6D7

loc_1A6D5:
		xor	ax, ax

loc_1A6D7:
		jmp	short loc_1A6DB

loc_1A6D9:
		mov	al, 0

loc_1A6DB:
		or	al, al
		jz	short loc_1A6F6
		cmp	word ptr [si], 0
		jz	short loc_1A6F6
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9CC3
		add	sp, 4
		jmp	short loc_1A6F6

loc_1A6F6:
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_1A711
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9C8D
		add	sp, 4
		mov	word ptr [si+2], 0FFFFh

loc_1A711:
		pop	si
		pop	bp
		retf
Music_ChannelStopSequence_1A6AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A714		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_1A765
		cmp	word ptr [di+6], 3
		jz	short loc_1A736
		push	word_5B600
		call	sub_9D78
		pop	cx

loc_1A736:
		mov	[si], di
		mov	word ptr [si+2], 0FFFFh
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9C81
		pop	cx
		mov	[bp+var_2], ax
		push	1948h
		push	1
		movzx	eax, [bp+var_2]
		push	eax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1914B
		add	sp, 0Ah

loc_1A765:
		pop	di
		pop	si
		leave
		retf
sub_1A714		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A769		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte_5B606, 0
		jnz	short loc_1A7A8
		inc	byte_5B606
		mov	word_5FE00, 96Dh
		mov	ax, word_5DD68
		mov	word_5FE02, ax
		mov	word_5DD68, 60E0h
		mov	word_5FE00, 975h
		mov	dword_5FE04, 0
		mov	byte_5FE08, 0

loc_1A7A8:
		cmp	byte_5CF9C, 5
		jnz	short loc_1A81A
		les	bx, word_5D974
		mov	al, es:[bx]
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_1A7C4
		call	PagedMemory_DetectDriverSignatureA_42BF9

loc_1A7C4:
		push	large [di+6]
		cmp	byte ptr [di+4], 3
		jnz	short loc_1A7E4
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1A7E9

loc_1A7E4:
		mov	dx, [di+2]
		mov	ax, [di]

loc_1A7E9:
		push	dx
		push	ax
		push	60D4h
		call	sub_19287
		pop	cx
		push	dx
		push	ax
		call	sub_4375D
		add	sp, 0Ch
		push	[bp+arg_4]
		push	60D4h
		push	si
		nop
		push	cs
		call	near ptr sub_1A839
		add	sp, 6
		cmp	[bp+var_1], 0
		jz	short loc_1A835
		call	PagedMemory_DetectDriverSignatureB_42C0A
		jmp	short loc_1A835

loc_1A81A:
		push	di
		push	60E0h
		call	sub_191B8
		add	sp, 4
		push	[bp+arg_4]
		push	60E0h
		push	si
		nop
		push	cs
		call	near ptr sub_1A839
		add	sp, 6

loc_1A835:
		pop	di
		pop	si
		leave
		retf
sub_1A769		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A839		proc far

var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si], 0
		jnz	short loc_1A84F
		jmp	loc_1A913

loc_1A84F:
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_1A858
		jmp	loc_1A913

loc_1A858:
		cmp	byte ptr [di+8], 4
		jz	short loc_1A864
		cmp	byte ptr [di+8], 3
		jnz	short loc_1A869

loc_1A864:
		mov	ax, 1
		jmp	short loc_1A86B

loc_1A869:
		xor	ax, ax

loc_1A86B:
		mov	[bp+var_3], al
		cmp	[bp+var_3], 0
		jz	short loc_1A886
		push	di
		call	sub_1932F
		push	dx
		push	ax
		pop	eax
		pop	cx
		shld	edx, eax, 10h
		jmp	short loc_1A88D

loc_1A886:
		push	di
		call	sub_19287
		pop	cx

loc_1A88D:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	al, [bp+var_3]
		mov	ah, 0
		push	ax
		push	large 0
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_19287
		pop	cx
		push	dx
		push	ax
		push	[bp+arg_4]
		push	large [bp+var_8]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9C87
		add	sp, 12h
		mov	[si+2], ax
		cmp	word ptr [si+2], 0FFFFh
		jnz	short loc_1A8D2
		push	large 1966h

loc_1A8CA:
		call	sub_9D78
		pop	cx
		jmp	short loc_1A913

loc_1A8D2:
		cmp	word ptr [si+2], 0FFFEh
		jnz	short loc_1A8DD
		push	1986h
		jmp	short loc_1A8CA

loc_1A8DD:
		push	di
		call	sub_19287
		pop	cx
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_9C9F
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_1A913
		shr	ax, 8
		mov	byte ptr [bp+var_2+1], al
		mov	byte ptr [bp+var_2], dl
		push	[bp+var_2]
		push	word ptr [si]
		call	sub_1A3C1
		add	sp, 4
		jmp	short loc_1A8DD

loc_1A913:
		pop	di
		pop	si
		leave
		retf
sub_1A839		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A917		proc far
		push	bp
		mov	bp, sp
		cmp	byte_5B606, 0
		jz	short loc_1A92E
		push	2
		push	60E0h
		call	sub_19116
		add	sp, 4

loc_1A92E:
		pop	bp
		retf
sub_1A917		endp
seg036		ends
