seg024		segment	byte public 'CODE' use16
		assume cs:seg024
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_11233	proc far		; CODE XREF: sub_1220C+370P
					; sub_4C62A+2CP ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2

loc_11239:				; DATA XREF: seg170:017Eo
		mov	ax, [bp+arg_2]
		mov	word_45B52, ax
		mov	[bp+var_2], 0
		jmp	short loc_11264
; ���������������������������������������������������������������������������

loc_11246:				; CODE XREF: sub_11233+36j
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	word_45B52
		mov	bx, word_45B52
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, [bp+var_2]
		mov	[bx+5F64h], al
		inc	[bp+var_2]

loc_11264:				; CODE XREF: sub_11233+11j
		cmp	[bp+var_2], 100h
		jl	short loc_11246
		mov	ax, word_45B54
		cmp	ax, word_443B9
		jz	short loc_11298
		cmp	word_45B54, 0
		jz	short loc_11298
		mov	ax, word_45B54
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	word_45B54
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_11298:				; CODE XREF: sub_11233+3Fj
					; sub_11233+46j
		push	word_45B52
		push	[bp+arg_0]
		push	0
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	word_45B54, ax
		push	0
		push	word_45B54
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	bx, word_45B54
		mov	byte ptr [bx+16h], 4
		leave
		retf
sub_11233	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_112C4	proc far		; CODE XREF: seg023:1580P seg023:15C3P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	cx, cx
		xor	di, di
		jmp	short loc_112E0
; ���������������������������������������������������������������������������

loc_112D2:				; CODE XREF: sub_112C4+24j
		mov	al, [si]
		cbw
		mov	bx, ax
		mov	al, [bx+5F64h]
		cbw
		add	cx, ax
		inc	si
		inc	di

loc_112E0:				; CODE XREF: sub_112C4+Cj
		cmp	byte ptr [si], 0
		jz	short loc_112EA
		cmp	byte ptr [si], 0Ah
		jnz	short loc_112D2

loc_112EA:				; CODE XREF: sub_112C4+1Fj
		mov	bx, word_45B52
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
sub_112C4	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_LookupByteTable_A2CEC (sub_A2CEC de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; accesseur de table indexée (256 octets, base 0x585A).
; ==============================================================================================
PaletteScreen_LookupByteTable_11303	proc far		; CODE XREF: seg023:15F2P seg023:1938P ...

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		cbw
		mov	bx, ax
		mov	al, [bx+5F64h]
		cbw
		pop	bp
		retf
PaletteScreen_LookupByteTable_11303	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, word_45B54
		cmp	word ptr [bp+8], 0FFFFh
		jz	short loc_11340
		mov	al, [si+17h]
		mov	ah, 0
		mov	di, ax
		cmp	di, [bp+8]
		jz	short loc_11340
		mov	al, [bp+8]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+8],	di

loc_11340:				; CODE XREF: seg024:00F2j seg024:00FEj
		push	word ptr [bp+6]
		push	si
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		cmp	word ptr [bp+8], 0FFFFh
		jz	short loc_1135F
		mov	al, [bp+8]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4

loc_1135F:				; CODE XREF: seg024:0120j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DispatchWidgetLayoutB_A2D4A (sub_A2D4A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 72 lignes, NON DÉTAILLÉE —
; combine Widget_Method_Dispatch8_6083F (×2), Widget_ComputeBoundsExtent_60AEB,
; Widget_RenderComplexLayoutWrapper_60DD1 (seg163).
; ==============================================================================================
PaletteScreen_DispatchWidgetLayoutB_11363	proc far		; CODE XREF: seg023:110CP seg023:16B8P ...

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
		jz	short loc_1138D
		mov	al, [si+17h]
		mov	ah, 0
		mov	di, ax
		cmp	di, [bp+arg_6]
		jz	short loc_1138D
		mov	al, byte ptr [bp+arg_6]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4
		mov	[bp+arg_6], di

loc_1138D:				; CODE XREF: PaletteScreen_DispatchWidgetLayoutB_11363+Cj
					; PaletteScreen_DispatchWidgetLayoutB_11363+18j
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	si
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		push	[bp+arg_4]
		push	si
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 4
		cmp	[bp+arg_6], 0FFFFh
		jz	short loc_113BB
		mov	al, byte ptr [bp+arg_6]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_314A9
		add	sp, 4

loc_113BB:				; CODE XREF: PaletteScreen_DispatchWidgetLayoutB_11363+49j
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_DispatchWidgetLayoutB_11363	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+0Ch]
		cmp	si, word_47034
		jz	short loc_113E5
		lea	ax, [bp+0Eh]
		mov	[bp-2],	ax
		push	word ptr [bp-2]
		push	si
		push	word_47034
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_113E5:				; CODE XREF: seg024:019Dj
		push	word_45B54
		push	word ptr [bp+0Ah]
		push	word_47034
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	cs
		call	near ptr PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		pop	si
		leave
		retf
seg024		ends
