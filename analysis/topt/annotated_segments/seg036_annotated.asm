seg036		segment	para public 'CODE' use16
		assume cs:seg036
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 5Dh, 0CBh, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15DB7		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_2]
		mov	word_4BD02, ax
		mov	[bp+var_2], 0
		jmp	short loc_15DE8

loc_15DCA:
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	word_4BD02
		mov	bx, word_4BD02
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, [bp+var_2]
		mov	[bx+6676h], al
		inc	[bp+var_2]

loc_15DE8:
		cmp	[bp+var_2], 100h
		jl	short loc_15DCA
		mov	ax, word_4BD04
		cmp	ax, word_49DFA
		jz	short loc_15E1C
		cmp	word_4BD04, 0
		jz	short loc_15E1C
		mov	ax, word_4BD04
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	word_4BD04
		call	sub_39C
		add	sp, 2
		jmp	short loc_15E1C

loc_15E1C:
		push	word_4BD02
		push	[bp+arg_0]
		push	0
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	word_4BD04, ax
		push	0
		push	word_4BD04
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	bx, word_4BD04
		mov	byte ptr [bx+16h], 4
		leave
		retf
sub_15DB7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15E48		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	cx, cx
		xor	di, di
		jmp	short loc_15E64

loc_15E56:
		mov	al, [si]
		cbw
		mov	bx, ax
		mov	al, [bx+6676h]
		cbw
		add	cx, ax
		inc	si
		inc	di

loc_15E64:
		cmp	byte ptr [si], 0
		jz	short loc_15E6E
		cmp	byte ptr [si], 0Ah
		jnz	short loc_15E56

loc_15E6E:
		mov	bx, word_4BD02
		mov	ax, [bx+10h]
		imul	di
		mov	dx, cx
		add	dx, ax
		mov	cx, dx
		mov	ax, cx
		pop	di
		pop	si
		pop	bp
		retf
sub_15E48		endp

; START OF FUNCTION CHUNK FOR sub_15E48
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_15E48

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_LookupByteTable_11303 (sub_11303 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à PaletteScreen_LookupByteTable_A2CEC (sub_A2CEC de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, accesseur de
; table indexée (256 octets, base 0x585A).
; ==============================================================================================
PaletteScreen_LookupByteTable_15E87		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		cbw
		mov	bx, ax
		mov	al, [bx+6676h]
		cbw
		pop	bp
		retf
PaletteScreen_LookupByteTable_15E87		endp

; START OF FUNCTION CHUNK FOR PaletteScreen_LookupByteTable_15E87
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR PaletteScreen_LookupByteTable_15E87

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DispatchWidgetLayoutA_A2CFC (sub_A2CFC de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Widget_Method_Dispatch8_6083F (×2, seg163) et Widget_RenderComplexLayoutWrapper_60DD1.
; ==============================================================================================
PaletteScreen_DispatchWidgetLayoutA_15E99		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, word_4BD04
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_15EC4
		mov	al, [si+17h]
		mov	ah, 0
		mov	di, ax
		cmp	di, [bp+arg_2]
		jz	short loc_15EC4
		mov	al, byte ptr [bp+arg_2]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+arg_2], di

loc_15EC4:
		push	[bp+arg_0]
		push	si
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_15EE3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_37030
		add	sp, 4

loc_15EE3:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_DispatchWidgetLayoutA_15E99		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; PaletteScreen_DispatchWidgetLayoutB_11363 (sub_11363 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_DispatchWidgetLayoutB_A2D4A (sub_A2D4A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️
; far, 72 lignes, NON DÉTAILLÉE — combine Widget_Method_Dispatch8_6083F (×2),
; Widget_ComputeBoundsExtent_60AEB, Widget_RenderComplexLayoutWrapper_60DD1 (seg163).
; ==============================================================================================
PaletteScreen_DispatchWidgetLayoutB_15EE7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_8]
		cmp	[bp+arg_6], 0FFFFh
		jz	short loc_15F11
		mov	al, [si+17h]
		mov	ah, 0
		mov	di, ax
		cmp	di, [bp+arg_6]
		jz	short loc_15F11
		mov	al, byte ptr [bp+arg_6]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		mov	[bp+arg_6], di

loc_15F11:
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	si
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		push	[bp+arg_4]
		push	si
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		cmp	[bp+arg_6], 0FFFFh
		jz	short loc_15F3F
		mov	al, byte ptr [bp+arg_6]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_37030
		add	sp, 4

loc_15F3F:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_DispatchWidgetLayoutB_15EE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15F43		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_6]
		cmp	si, word_4CE02
		jz	short loc_15F69
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		push	word_4CE02
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_15F69:
		push	word_4BD04
		push	[bp+arg_4]
		push	word_4CE02
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr PaletteScreen_DispatchWidgetLayoutB_15EE7
sub_15F43		endp

; START OF FUNCTION CHUNK FOR sub_15F43
		db 83h, 0C4h
; END OF FUNCTION CHUNK FOR sub_15F43
seg036		ends
