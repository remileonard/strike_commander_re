seg026		segment	para public 'CODE' use16
		assume cs:seg026
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_139F0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5AF76, 0
		jz	short loc_13A63
		cmp	word_5FD6B, 0
		jz	short loc_13A19
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CC3
		add	sp, 4
		jmp	short loc_13A19

loc_13A19:
		push	604Bh
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		cmp	byte_5FD66, 0
		jz	short loc_13A47
		cmp	dword_5FD61, 0
		jz	short loc_13A47
		push	0
		mov	al, byte_5FD65
		push	ax
		push	6041h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_13A47

loc_13A47:
		mov	dword_5FD61, 0
		mov	byte_5FD66, 0
		mov	dword_5FD67, 0
		mov	byte_5AF76, 0

loc_13A63:
		pop	bp
		retf
sub_139F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13A65		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		mov	al, byte_5CF9C
		mov	[bp+var_2], al
		cmp	[bp+var_2], 0
		jz	short loc_13A89
		push	word_5CF9D
		push	604Bh
		call	sub_1A714
		add	sp, 4

loc_13A89:
		leave
		retf
sub_13A65		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextCycler_AllocateA_CE661 (sub_CE661 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à TextCycler_AllocateA_A7566 (sub_A7566 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658).
; ==============================================================================================
TextCycler_AllocateA_13A8B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_13AA4
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_13AA9

loc_13AA4:
		mov	al, byte_5AF7B
		mov	[si], al

loc_13AA9:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextCycler_AllocateA_13A8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13AAE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_13AF0
		mov	al, [si]
		cmp	al, byte_5AF7B
		jz	short loc_13AE3
		cmp	byte ptr [si], 0FFh
		jnz	short loc_13AD7
		push	si
		push	cs
		call	near ptr sub_139F0
		pop	cx
		mov	byte_5AF7B, 0FFh
		jmp	short loc_13AE3

loc_13AD7:
		mov	al, [si]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Music_LoadTune_13AF4
		add	sp, 4

loc_13AE3:
		test	di, 1
		jz	short loc_13AF0
		push	si
		call	sub_33B
		pop	cx

loc_13AF0:
		pop	di
		pop	si
		pop	bp
		retf
sub_13AAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far (lecteur, n) : charge le morceau n depuis AMUSIC.PAK ou RMUSIC.PAK (dossier midgames) ;
; commande EFCT 24 (avec sub_13BB6).
; ==============================================================================================
Music_LoadTune_13AF4		proc far

var_CA		= word ptr -0CAh
var_52		= word ptr -52h
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0CAh
		mov	dx, [bp+arg_0]
		cmp	byte_5AF76, 0
		jz	short loc_13B13
		mov	al, [bp+arg_2]
		cmp	al, byte_5AF7B
		jnz	short loc_13B13

loc_13B0E:
		mov	al, 1
		jmp	loc_13BB4

loc_13B13:
		push	dx
		push	cs
		call	near ptr sub_139F0
		pop	cx
		mov	al, byte_5CF9C
		mov	[bp+var_2], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13B28
		jmp	loc_13BB2

loc_13B28:
		mov	al, [bp+var_2]
		mov	ah, 0
		cmp	ax, 3
		jnz	short loc_13B3C
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		jmp	short loc_13B44

loc_13B3C:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic

loc_13B44:
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		mov	dl, 1
		mov	al, [bp+arg_2]
		mov	byte_5AF7B, al
		or	dl, dl
		jz	short loc_13BB2
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	3
		push	6041h
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	0
		push	6041h
		push	604Bh
		call	sub_1A769
		add	sp, 6
		mov	byte_5AF76, 1
		push	2
		lea	ax, [bp+var_CA]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		jmp	loc_13B0E

loc_13BB2:
		mov	al, 0

loc_13BB4:
		leave
		retf
Music_LoadTune_13AF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13BB6		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_0]
		cmp	byte_5AF76, 0
		jz	short loc_13C36
		cmp	word_5FD6B, 0
		jz	short loc_13BEE
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_13BEA
		mov	ax, 1
		jmp	short loc_13BEC

loc_13BEA:
		xor	ax, ax

loc_13BEC:
		jmp	short loc_13BF0

loc_13BEE:
		mov	al, 0

loc_13BF0:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13C36
		mov	ax, word_5AF77
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0
		cmp	word_5FD6B, 0
		jz	short loc_13C36
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CBD
		add	sp, 4
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CE1
		add	sp, 8
		jmp	short loc_13C36

loc_13C36:
		leave
		retf
sub_13BB6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13C38		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	byte_5AF76, 0
		jz	short loc_13CB1
		or	dx, dx
		jz	short loc_13C95
		mov	[bp+var_2], dx
		cmp	word_5FD6B, 0
		jz	short loc_13C73
		push	[bp+var_2]
		push	0
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CE1
		add	sp, 8
		jmp	short loc_13C73

loc_13C73:
		cmp	word_5FD6B, 0
		jz	short loc_13C8F
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CD5
		add	sp, 4
		jmp	short loc_13C91

loc_13C8F:
		xor	ax, ax

loc_13C91:
		or	ax, ax
		jnz	short loc_13C73

loc_13C95:
		cmp	word_5FD6B, 0
		jz	short loc_13CB1
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CC3
		add	sp, 4
		jmp	short loc_13CB1

loc_13CB1:
		leave
		retf
sub_13C38		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13CB3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		cmp	byte_5AF76, 0
		jz	short loc_13CE8
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		cmp	word_5FD6B, 0
		jz	short loc_13CE8
		push	ax
		push	0
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CE1
		add	sp, 8
		jmp	short loc_13CE8

loc_13CE8:
		leave
		retf
sub_13CB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13CEA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5AF76, 0
		jz	short loc_13D27

loc_13CF7:
		cmp	word_5FD6B, 0
		jz	short loc_13D1F
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_13D1B
		mov	ax, 1
		jmp	short loc_13D1D

loc_13D1B:
		xor	ax, ax

loc_13D1D:
		jmp	short loc_13D21

loc_13D1F:
		mov	al, 1

loc_13D21:
		mov	ah, 0
		or	ax, ax
		jz	short loc_13CF7

loc_13D27:
		pop	bp
		retf
sub_13CEA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13D29		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5AF76, 0
		jz	short loc_13D58

loc_13D36:
		cmp	word_5FD6B, 0
		jz	short loc_13D52
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CD5
		add	sp, 4
		jmp	short loc_13D54

loc_13D52:
		xor	ax, ax

loc_13D54:
		or	ax, ax
		jnz	short loc_13D36

loc_13D58:
		pop	bp
		retf
sub_13D29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13D5A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5AF76, 0
		jz	short loc_13D93
		cmp	word_5FD6B, 0
		jz	short loc_13D8F
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_13D8B
		mov	ax, 1
		jmp	short loc_13D8D

loc_13D8B:
		xor	ax, ax

loc_13D8D:
		jmp	short loc_13D91

loc_13D8F:
		mov	al, 1

loc_13D91:
		jmp	short loc_13D95

loc_13D93:
		mov	al, 1

loc_13D95:
		pop	bp
		retf
sub_13D5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13D97		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		mov	word_5AF77, 0
		mov	byte_5AF7C, 0
		mov	ax, word_5AF77
		mov	[bp+var_2], ax
		cmp	word_5FD6B, 0
		jz	short loc_13DD0
		push	0
		push	ax
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CE1
		add	sp, 8
		jmp	short loc_13DD0

loc_13DD0:
		leave
		retf
sub_13D97		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13DD2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		mov	ax, word_5AF79
		mov	word_5AF77, ax
		mov	byte_5AF7C, 1
		mov	[bp+var_2], ax
		cmp	word_5FD6B, 0
		jz	short loc_13E08
		push	0
		push	ax
		push	word_5FD6D
		mov	bx, word_5FD6B
		push	word ptr [bx+4]
		call	sub_9CE1
		add	sp, 8
		jmp	short loc_13E08

loc_13E08:
		leave
		retf
sub_13DD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13E0A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5AF7C, 0
		jz	short loc_13E1E
		push	ax
		push	cs
		call	near ptr sub_13D97
		jmp	short loc_13E23

loc_13E1E:
		push	ax
		push	cs
		call	near ptr sub_13DD2

loc_13E23:
		pop	cx
		pop	bp
		retf
sub_13E0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13E26		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		mov	al, byte_5CF9C
		mov	[bp+var_2], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13E3F
		mov	al, 0
		jmp	short loc_13E41

loc_13E3F:
		mov	al, 1

loc_13E41:
		leave
		retf
sub_13E26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13E43		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5AF7C, 0
		jz	short loc_13E66
		cmp	word_5AF79, 0Ah
		jbe	short loc_13E66
		sub	word_5AF79, 0Ah
		push	ax
		push	cs
		call	near ptr sub_13DD2
		pop	cx
		mov	al, 1
		jmp	short loc_13E68

loc_13E66:
		mov	al, 0

loc_13E68:
		pop	bp
		retf
sub_13E43		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13E6A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	byte_5AF7C, 0
		jz	short loc_13E91
		mov	ax, word_5AF79
		add	ax, 0Ah
		cmp	ax, 0C7h
		ja	short loc_13E91
		add	word_5AF79, 0Ah
		push	dx
		push	cs
		call	near ptr sub_13DD2
		pop	cx
		mov	al, 1
		jmp	short loc_13E93

loc_13E91:
		mov	al, 0

loc_13E93:
		pop	bp
		retf
sub_13E6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13E95		proc far
		push	bp
		mov	bp, sp
		push	6040h
		push	cs
		call	near ptr TextCycler_AllocateA_13A8B
		pop	cx
		mov	dword_5FD61, 0
		mov	byte_5FD65, 2
		mov	byte_5FD66, 0
		mov	dword_5FD67, 0
		mov	word_5FD6F, 96Dh
		mov	ax, word_5DD68
		mov	word_5FD71, ax
		mov	word_5DD68, 604Fh
		mov	word_5FD6F, 975h
		mov	dword_5FD73, 0
		mov	byte_5FD77, 0
		mov	word_5FD6B, 0
		mov	word_5FD6D, 0FFFFh
		pop	bp
		retf
sub_13E95		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13EF0		proc far
		push	bp
		mov	bp, sp
		push	604Bh
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		push	604Fh
		call	sub_19116
		add	sp, 4
		cmp	byte_5FD66, 0
		jz	short loc_13F2E
		cmp	dword_5FD61, 0
		jz	short loc_13F2E
		push	0
		mov	al, byte_5FD65
		push	ax
		push	6041h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_13F2E

loc_13F2E:
		mov	dword_5FD61, 0
		mov	byte_5FD66, 0
		mov	dword_5FD67, 0
		push	2
		push	6040h
		push	cs
		call	near ptr sub_13AAE
sub_13EF0		endp

; START OF FUNCTION CHUNK FOR sub_13EF0
		db 83h, 0C4h
; END OF FUNCTION CHUNK FOR sub_13EF0
seg026		ends
