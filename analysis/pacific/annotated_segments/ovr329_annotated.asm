ovr329		segment	para public 'OVERLAY' use16
		assume cs:ovr329
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B5070		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_77535
		mov	word_79260, ax
		pop	bp
		retf
sub_B5070		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B507B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	word_7925E, 0
		jz	short loc_B508E
		mov	ax, word_7925E
		mov	word_79262, ax

loc_B508E:
		mov	ax, [bp+arg_2]
		mov	word_7925E, ax
		mov	[bp+var_2], 0
		jmp	short loc_B50BF

loc_B509B:
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	word_7925E
		mov	bx, word_7925E
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	dx, seg seg229
		mov	bx, [bp+var_2]
		mov	es, dx
		mov	es:[bx], al
		inc	[bp+var_2]

loc_B50BF:
		cmp	[bp+var_2], 100h
		jl	short loc_B509B
		mov	ax, word_79260
		cmp	ax, word_77535
		jz	short loc_B50EC
		cmp	word_79260, 0
		jz	short loc_B50EC
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	word_79260
		call	sub_3B2
		pop	cx
		jmp	short loc_B50EC

loc_B50EC:
		push	word_7925E
		push	[bp+arg_0]
		push	0
		call	sub_75D04
		add	sp, 6
		mov	word_79260, ax
		push	0
		push	ax
		call	sub_75D09
		add	sp, 4
		mov	bx, word_79260
		mov	byte ptr [bx+16h], 4
		leave
		retf
sub_B507B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B5115		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	cx, cx
		xor	di, di
		jmp	short loc_B5137

loc_B5123:
		mov	al, [si]
		cbw
		mov	dx, seg seg229
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx]
		cbw
		add	cx, ax
		inc	si
		inc	di

loc_B5137:
		cmp	byte ptr [si], 0
		jz	short loc_B5141
		cmp	byte ptr [si], 0Ah
		jnz	short loc_B5123

loc_B5141:
		mov	bx, word_7925E
		mov	ax, [bx+10h]
		imul	di
		add	cx, ax
		mov	ax, cx
		pop	di
		pop	si
		pop	bp
		retf
sub_B5115		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B5152		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		cbw
		mov	dx, seg seg229
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx]
		cbw
		pop	bp
		retf
sub_B5152		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DispatchWidgetLayoutA_A2CFC (sub_A2CFC de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Widget_Method_Dispatch8_6083F (×2, seg163) et Widget_RenderComplexLayoutWrapper_60DD1.
; ==============================================================================================
PaletteScreen_DispatchWidgetLayoutA_B5168		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, word_79260
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_B5193
		mov	al, [si+17h]
		mov	ah, 0
		mov	di, ax
		cmp	di, [bp+arg_2]
		jz	short loc_B5193
		mov	al, byte ptr [bp+arg_2]
		push	ax
		push	si
		call	sub_75D09
		add	sp, 4
		mov	[bp+arg_2], di

loc_B5193:
		push	[bp+arg_0]
		push	si
		call	sub_75D4A
		add	sp, 4
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_B51B2
		mov	al, byte ptr [bp+arg_2]
		push	ax
		push	si
		call	sub_75D09
		add	sp, 4

loc_B51B2:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_DispatchWidgetLayoutA_B5168		endp

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
PaletteScreen_DispatchWidgetLayoutB_B51B6		proc far

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
		jz	short loc_B51E0
		mov	al, [si+17h]
		mov	ah, 0
		mov	di, ax
		cmp	di, [bp+arg_6]
		jz	short loc_B51E0
		mov	al, byte ptr [bp+arg_6]
		push	ax
		push	si
		call	sub_75D09
		add	sp, 4
		mov	[bp+arg_6], di

loc_B51E0:
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	si
		call	sub_75D27
		add	sp, 6
		push	[bp+arg_4]
		push	si
		call	sub_75D4A
		add	sp, 4
		cmp	[bp+arg_6], 0FFFFh
		jz	short loc_B520E
		mov	al, byte ptr [bp+arg_6]
		push	ax
		push	si
		call	sub_75D09
		add	sp, 4

loc_B520E:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_DispatchWidgetLayoutB_B51B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_SwitchModeAndDispatch_A2DA6 (sub_A2DA6 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, bascule le mode vidéo (sub_2962)
; puis appelle PaletteScreen_DispatchWidgetLayoutB_A2D4A.
; ==============================================================================================
PaletteScreen_SwitchModeAndDispatch_B5212		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+arg_6]
		cmp	dx, word_7AB7A
		jz	short loc_B5235
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_7AB7A
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_B5235:
		push	word_79260
		push	[bp+arg_4]
		push	word_7AB7A
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr PaletteScreen_DispatchWidgetLayoutB_B51B6
		add	sp, 0Ah
		leave
		retf
PaletteScreen_SwitchModeAndDispatch_B5212		endp
ovr329		ends
