seg443		segment	para public 'OVERLAY' use16
		assume cs:seg443
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 83 lignes, NON DÉTAILLÉE — dispatch vtable [bx+0x18], libère un style existant
; (TextFormat_ReleaseStyleList_5E526, sub_338), construit un widget stylé
; (Widget_ApplyStyleAndAllocate_607E1, Widget_Method_Dispatch8_6083F, seg163).
; ==============================================================================================
PaletteScreen_ConstructAndBindWidget_A2C30	proc far		; CODE XREF: VROOMM_StubThunk_6C870J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_2]
		mov	word_6FEDA, ax
		mov	[bp+var_2], 0
		jmp	short loc_A2C61
; ���������������������������������������������������������������������������

loc_A2C43:				; CODE XREF: PaletteScreen_ConstructAndBindWidget_A2C30+36j
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	word_6FEDA
		mov	bx, word_6FEDA
		mov	bx, [bx]

loc_A2C51:
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, [bp+var_2]
		mov	[bx+585Ah], al
		inc	[bp+var_2]

loc_A2C61:				; CODE XREF: PaletteScreen_ConstructAndBindWidget_A2C30+11j
		cmp	[bp+var_2], 100h
		jl	short loc_A2C43
		mov	ax, word_6FEDC
		cmp	ax, word_6E343
		jz	short loc_A2C8E

loc_A2C71:
		cmp	word_6FEDC, 0
		jz	short loc_A2C8E
		add	ax, 2
		push	ax

loc_A2C7C:
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx

loc_A2C82:
		push	word_6FEDC
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_A2C8E:				; CODE XREF: PaletteScreen_ConstructAndBindWidget_A2C30+3Fj
					; PaletteScreen_ConstructAndBindWidget_A2C30+46j
		push	word_6FEDA
		push	[bp+arg_0]
		push	0

loc_A2C97:
		call	Widget_ApplyStyleAndAllocate_607E1

loc_A2C9C:
		add	sp, 6
		mov	word_6FEDC, ax

loc_A2CA2:
		push	0
		push	ax

loc_A2CA5:
		call	Widget_Method_Dispatch8_6083F

loc_A2CAA:
		add	sp, 4
		mov	bx, word_6FEDC

loc_A2CB1:
		mov	byte ptr [bx+16h], 4
		leave

locret_A2CB6:
		retf
PaletteScreen_ConstructAndBindWidget_A2C30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
PaletteScreen_Helper_A2CB7	proc far		; CODE XREF: VROOMM_StubThunk_6C875J

arg_0		= word ptr  6

		push	bp

loc_A2CB8:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_A2CBE:
		xor	cx, cx
		xor	dx, dx

loc_A2CC2:
		jmp	short loc_A2CD2
; ���������������������������������������������������������������������������

loc_A2CC4:				; CODE XREF: PaletteScreen_Helper_A2CB7+23j
		mov	al, [si]
		cbw
		mov	bx, ax
		mov	al, [bx+585Ah]
		cbw
		add	cx, ax
		inc	si
		inc	dx

loc_A2CD2:				; CODE XREF: PaletteScreen_Helper_A2CB7:loc_A2CC2j
		cmp	byte ptr [si], 0

loc_A2CD5:
		jz	short loc_A2CDC
		cmp	byte ptr [si], 0Ah
		jnz	short loc_A2CC4

loc_A2CDC:				; CODE XREF: PaletteScreen_Helper_A2CB7:loc_A2CD5j
		mov	bx, word_6FEDA
		mov	ax, [bx+10h]
		imul	dx
		add	cx, ax
		mov	ax, cx
		pop	si
		pop	bp
		retf
PaletteScreen_Helper_A2CB7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, accesseur de table indexée (256 octets, base 0x585A).
; ==============================================================================================
PaletteScreen_LookupByteTable_A2CEC	proc far		; CODE XREF: VROOMM_StubThunk_6C87AJ

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		cbw
		mov	bx, ax
		mov	al, [bx+585Ah]
		cbw
		pop	bp
		retf
PaletteScreen_LookupByteTable_A2CEC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Widget_Method_Dispatch8_6083F (×2, seg163) et
; Widget_RenderComplexLayoutWrapper_60DD1.
; ==============================================================================================
PaletteScreen_DispatchWidgetLayoutA_A2CFC	proc far		; CODE XREF: VROOMM_StubThunk_6C87FJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, word_6FEDC
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_A2D27
		mov	al, [si+17h]
		mov	ah, 0
		mov	di, ax
		cmp	di, [bp+arg_2]
		jz	short loc_A2D27
		mov	al, byte ptr [bp+arg_2]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		mov	[bp+arg_2], di

loc_A2D27:				; CODE XREF: PaletteScreen_DispatchWidgetLayoutA_A2CFC+Dj
					; PaletteScreen_DispatchWidgetLayoutA_A2CFC+19j
		push	[bp+arg_0]
		push	si
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4

loc_A2D33:
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_A2D46
		mov	al, byte ptr [bp+arg_2]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4

loc_A2D46:				; CODE XREF: PaletteScreen_DispatchWidgetLayoutA_A2CFC+3Bj
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_DispatchWidgetLayoutA_A2CFC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 72 lignes, NON DÉTAILLÉE — combine Widget_Method_Dispatch8_6083F (×2),
; Widget_ComputeBoundsExtent_60AEB, Widget_RenderComplexLayoutWrapper_60DD1 (seg163).
; ==============================================================================================
PaletteScreen_DispatchWidgetLayoutB_A2D4A	proc far		; CODE XREF: VROOMM_StubThunk_6C884J PaletteScreen_SwitchModeAndDispatch_A2DA6+35p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_A2D4F:
		mov	si, [bp+arg_8]
		cmp	[bp+arg_6], 0FFFFh
		jz	short loc_A2D74
		mov	al, [si+17h]
		mov	ah, 0
		mov	di, ax
		cmp	di, [bp+arg_6]

loc_A2D62:
		jz	short loc_A2D74

loc_A2D64:
		mov	al, byte ptr [bp+arg_6]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		mov	[bp+arg_6], di

loc_A2D74:				; CODE XREF: PaletteScreen_DispatchWidgetLayoutB_A2D4A+Cj
					; PaletteScreen_DispatchWidgetLayoutB_A2D4A:loc_A2D62j
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	si
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6

loc_A2D83:
		push	[bp+arg_4]
		push	si
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4

loc_A2D8F:
		cmp	[bp+arg_6], 0FFFFh

loc_A2D93:
		jz	short loc_A2DA2
		mov	al, byte ptr [bp+arg_6]
		push	ax
		push	si

loc_A2D9A:
		call	Widget_Method_Dispatch8_6083F

loc_A2D9F:
		add	sp, 4

loc_A2DA2:				; CODE XREF: PaletteScreen_DispatchWidgetLayoutB_A2D4A:loc_A2D93j
		pop	di

loc_A2DA3:
		pop	si

loc_A2DA4:
		pop	bp
		retf
PaletteScreen_DispatchWidgetLayoutB_A2D4A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, bascule le mode vidéo (sub_2962) puis appelle
; PaletteScreen_DispatchWidgetLayoutB_A2D4A.
; ==============================================================================================
PaletteScreen_SwitchModeAndDispatch_A2DA6	proc far		; CODE XREF: VROOMM_StubThunk_6C889J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2

loc_A2DAC:
		mov	dx, [bp+arg_6]

loc_A2DAF:
		cmp	dx, word_70EA2

loc_A2DB3:
		jz	short loc_A2DC9
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_70EA2
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_A2DC9:				; CODE XREF: PaletteScreen_SwitchModeAndDispatch_A2DA6:loc_A2DB3j
		push	word_6FEDC
		push	[bp+arg_4]
		push	word_70EA2

loc_A2DD4:
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr PaletteScreen_DispatchWidgetLayoutB_A2D4A
		add	sp, 0Ah
		leave
		retf
PaletteScreen_SwitchModeAndDispatch_A2DA6	endp

seg443		ends
