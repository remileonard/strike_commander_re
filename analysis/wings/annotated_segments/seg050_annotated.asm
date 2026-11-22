seg050		segment	para public 'CODE' use16
		assume cs:seg050
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ah, 3Bh, 3, 0, 0, 59h, 0EBh, 0

loc_231B8:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ConstructAndBindWidget_A2C30 (sub_A2C30
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️
; far, 83 lignes, NON DÉTAILLÉE — dispatch vtable [bx+0x18], libère un style existant
; (TextFormat_ReleaseStyleList_5E526, sub_338), construit un widget stylé
; (Widget_ApplyStyleAndAllocate_607E1, Widget_Method_Dispatch8_6083F, seg163).
; ==============================================================================================
PaletteScreen_ConstructAndBindWidget_231BC		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_2]
		mov	word_5BF72, ax
		mov	[bp+var_2], 0
		jmp	short loc_231ED

loc_231CF:
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	word_5BF72
		mov	bx, word_5BF72
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, [bp+var_2]
		mov	[bx+6132h], al
		inc	[bp+var_2]

loc_231ED:
		cmp	[bp+var_2], 100h
		jl	short loc_231CF
		mov	ax, word_5BF74
		cmp	ax, word_5B3E3
		jz	short loc_2321A
		cmp	word_5BF74, 0
		jz	short loc_2321A
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	word_5BF74
		call	sub_33B
		pop	cx
		jmp	short loc_2321A

loc_2321A:
		push	word_5BF72
		push	[bp+arg_0]
		push	0
		call	Widget_ApplyStyleAndAllocate_48C4D
		add	sp, 6
		mov	word_5BF74, ax
		push	0
		push	ax
		call	Widget_Method_Dispatch8_48CAB
		add	sp, 4
		mov	bx, word_5BF74
		mov	byte ptr [bx+16h], 4
		leave
		retf
PaletteScreen_ConstructAndBindWidget_231BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23243		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		xor	cx, cx
		xor	dx, dx
		mov	si, [bp+arg_0]
		jmp	short loc_2325F

loc_23250:
		mov	al, [si]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+6132h]
		cbw
		add	cx, ax
		inc	si
		inc	dx

loc_2325F:
		cmp	byte ptr [si], 0
		jz	short loc_23269
		cmp	byte ptr [si], 0Ah
		jnz	short loc_23250

loc_23269:
		mov	bx, word_5BF72
		mov	ax, [bx+10h]
		imul	dx
		add	cx, ax
		mov	ax, cx
		pop	si
		pop	bp
		retf
sub_23243		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_LookupByteTable_A2CEC (sub_A2CEC de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; accesseur de table indexée (256 octets, base 0x585A).
; ==============================================================================================
PaletteScreen_LookupByteTable_23279		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		cbw
		mov	bx, ax
		mov	al, [bx+6132h]
		cbw
		pop	bp
		retf
PaletteScreen_LookupByteTable_23279		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DispatchWidgetLayoutA_B5168 (sub_B5168 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_DispatchWidgetLayoutA_A2CFC (sub_A2CFC
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Widget_Method_Dispatch8_6083F (×2, seg163) et
; Widget_RenderComplexLayoutWrapper_60DD1.
; ==============================================================================================
PaletteScreen_DispatchWidgetLayoutA_23289		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, word_5BF74
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_232B4
		mov	al, [si+17h]
		mov	ah, 0
		mov	di, ax
		cmp	di, [bp+arg_2]
		jz	short loc_232B4
		mov	al, byte ptr [bp+arg_2]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_48CAB
		add	sp, 4
		mov	[bp+arg_2], di

loc_232B4:
		push	[bp+arg_0]
		push	si
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_232D3
		mov	al, byte ptr [bp+arg_2]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_48CAB
		add	sp, 4

loc_232D3:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_DispatchWidgetLayoutA_23289		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_DispatchWidgetLayoutB_B51B6 (sub_B51B6 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à PaletteScreen_DispatchWidgetLayoutB_11363 (sub_11363
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DispatchWidgetLayoutB_A2D4A (sub_A2D4A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 72 lignes, NON DÉTAILLÉE —
; combine Widget_Method_Dispatch8_6083F (×2), Widget_ComputeBoundsExtent_60AEB,
; Widget_RenderComplexLayoutWrapper_60DD1 (seg163).
; ==============================================================================================
PaletteScreen_DispatchWidgetLayoutB_232D7		proc far

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
		jz	short loc_23301
		mov	al, [si+17h]
		mov	ah, 0
		mov	di, ax
		cmp	di, [bp+arg_6]
		jz	short loc_23301
		mov	al, byte ptr [bp+arg_6]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_48CAB
		add	sp, 4
		mov	[bp+arg_6], di

loc_23301:
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	si
		call	Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		push	[bp+arg_4]
		push	si
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 4
		cmp	[bp+arg_6], 0FFFFh
		jz	short loc_2332F
		mov	al, byte ptr [bp+arg_6]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_48CAB
		add	sp, 4

loc_2332F:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_DispatchWidgetLayoutB_232D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PaletteScreen_SwitchModeAndDispatch_B5212 (sub_B5212 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PaletteScreen_SwitchModeAndDispatch_A2DA6 (sub_A2DA6
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; bascule le mode vidéo (sub_2962) puis appelle PaletteScreen_DispatchWidgetLayoutB_A2D4A.
; ==============================================================================================
PaletteScreen_SwitchModeAndDispatch_23333		proc far

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
		cmp	dx, word_5D91C
		jz	short loc_23356
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_5D91C
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_23356:
		push	word_5BF74
		push	[bp+arg_4]
		push	word_5D91C
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		leave
		retf
PaletteScreen_SwitchModeAndDispatch_23333		endp
seg050		ends
