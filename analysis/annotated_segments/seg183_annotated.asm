seg183		segment	byte public 'CODE' use16
		assume cs:seg183
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 369 lignes, NON DÉTAILLÉE — même motif que Render_ClipAndDrawLine_613B0 (seg168) :
; clippe un segment de ligne contre un rectangle de bornage. Référencée deux fois par
; sub_A1375. Identité exacte vis-à-vis de sub_613B0 non vérifiée.
; ==============================================================================================
Render_ClipAndDrawLineVariant_62EC8	proc far		; CODE XREF: PaletteScreen_DrawCurveShape_A1375+2FP
					; PaletteScreen_DrawCurveShape_A1375+4AP ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		cld
		mov	si, [bp+arg_0]

loc_62ED4:
		mov	ax, [si]

loc_62ED6:
		mov	es, ax

loc_62ED8:
		mov	bx, [si+2]
		mov	ax, [bx+2]

loc_62EDE:
		sub	ax, [bx]
		mov	[bp+var_2], ax

loc_62EE3:
		mov	ax, [bp+arg_2]
		mov	bx, [bp+arg_6]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_8]
		cmp	bx, ax
		jge	short loc_62EF6

loc_62EF3:
		xchg	ax, bx
		xchg	cx, dx

loc_62EF6:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+29j
		mov	[bp+arg_2], ax
		mov	[bp+arg_6], bx
		mov	[bp+arg_4], cx
		mov	[bp+arg_8], dx
		cmp	dx, cx

loc_62F04:
		jge	short loc_62F12
		xchg	cx, dx
		neg	[bp+var_2]
		mov	[bp+var_8], 1

loc_62F10:
		jmp	short loc_62F17
; ���������������������������������������������������������������������������

loc_62F12:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8:loc_62F04j
		mov	[bp+var_8], 0

loc_62F17:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8:loc_62F10j
		cmp	bx, [si+4]
		jge	short loc_62F1F
		jmp	loc_630B4
; ���������������������������������������������������������������������������

loc_62F1F:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+52j
		cmp	ax, [si+8]
		jle	short loc_62F27
		jmp	loc_630B4
; ���������������������������������������������������������������������������

loc_62F27:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+5Aj
		cmp	dx, [si+6]

loc_62F2A:
		jge	short loc_62F2F
		jmp	loc_630B4
; ���������������������������������������������������������������������������

loc_62F2F:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8:loc_62F2Aj
		cmp	cx, [si+0Ah]
		jle	short loc_62F37

loc_62F34:
		jmp	loc_630B4
; ���������������������������������������������������������������������������

loc_62F37:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+6Aj
		cmp	bx, [si+8]
		jle	short loc_62F5E

loc_62F3C:
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]

loc_62F42:
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]

loc_62F48:
		mov	ax, [si+8]
		sub	ax, [bp+arg_2]
		imul	dx

loc_62F50:
		idiv	bx

loc_62F52:
		add	ax, [bp+arg_4]

loc_62F55:
		mov	[bp+arg_8], ax

loc_62F58:
		mov	ax, [si+8]

loc_62F5B:
		mov	[bp+arg_6], ax

loc_62F5E:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+72j
		mov	ax, [bp+arg_2]
		cmp	ax, [si+4]
		jge	short loc_62F88
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]

loc_62F72:
		mov	ax, [si+4]
		sub	ax, [bp+arg_2]

loc_62F78:
		imul	dx
		idiv	bx

loc_62F7C:
		add	ax, [bp+arg_4]
		mov	[bp+arg_4], ax

loc_62F82:
		mov	ax, [si+4]

loc_62F85:
		mov	[bp+arg_2], ax

loc_62F88:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+9Cj
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]

loc_62F8E:
		mov	cx, [bp+arg_2]

loc_62F91:
		mov	dx, [bp+arg_6]

loc_62F94:
		test	[bp+var_8], 0FFh
		jz	short loc_62FAA
		xchg	ax, bx
		xchg	cx, dx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_62FAA:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+D1j
		cmp	bx, [si+6]
		jge	short loc_62FB2
		jmp	loc_630B4
; ���������������������������������������������������������������������������

loc_62FB2:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+E5j
		cmp	ax, [si+0Ah]
		jle	short loc_62FBA
		jmp	loc_630B4
; ���������������������������������������������������������������������������

loc_62FBA:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+EDj
		cmp	bx, [si+0Ah]
		jle	short loc_62FDD

loc_62FBF:
		sub	bx, ax

loc_62FC1:
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]

loc_62FC7:
		mov	ax, [si+0Ah]
		sub	ax, [bp+arg_4]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+arg_8], ax

loc_62FDD:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+F5j
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, [si+6]
		jge	short loc_6300A
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	dx, [bp+arg_6]

loc_62FF1:
		sub	dx, [bp+arg_2]
		mov	ax, [si+6]

loc_62FF7:
		sub	ax, [bp+arg_4]
		imul	dx

loc_62FFC:
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_2], ax
		mov	ax, [si+6]
		mov	[bp+arg_4], ax

loc_6300A:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+11Ej
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	[bp+var_6], bx

loc_63013:
		test	[bp+var_8], 0FFh
		jz	short loc_63035

loc_6301A:
		mov	ax, [bp+arg_4]

loc_6301D:
		mov	bx, [bp+arg_8]

loc_63020:
		mov	cx, [bp+arg_2]

loc_63023:
		mov	dx, [bp+arg_6]
		xchg	ax, bx

loc_63027:
		xchg	cx, dx

loc_63029:
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx

loc_63032:
		mov	[bp+arg_6], dx

loc_63035:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+150j
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	[bp+var_4], bx
		xor	al, al

loc_63040:
		mov	ah, byte ptr [bp+arg_4]

loc_63043:
		shr	ax, 1
		shr	ax, 1

loc_63047:
		add	ah, byte ptr [bp+arg_4]
		add	ax, [bp+arg_2]

loc_6304D:
		mov	di, ax
		mov	al, [bp+arg_A]

loc_63052:
		xor	cx, cx
		mov	bx, [bp+arg_2]
		cmp	bx, [bp+arg_6]
		jz	short loc_6309C
		mov	bx, [bp+arg_4]
		cmp	bx, [bp+arg_8]
		jz	short loc_630AA

loc_63064:
		mov	bx, [bp+var_4]
		mov	dx, [bp+var_6]
		cmp	dx, bx
		jg	short loc_63085
		mov	si, bx
		inc	si

loc_63071:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+1B4j
					; Render_ClipAndDrawLineVariant_62EC8:loc_63083j
		xor	es:[di], al
		inc	di
		dec	si
		jz	short loc_630B4
		add	cx, dx
		cmp	cx, bx
		jl	short loc_63071
		add	di, [bp+var_2]
		sub	cx, bx

loc_63083:
		jmp	short loc_63071
; ���������������������������������������������������������������������������

loc_63085:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+1A4j
		mov	si, dx
		inc	si

loc_63088:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+1CDj
					; Render_ClipAndDrawLineVariant_62EC8+1D2j
		xor	es:[di], al

loc_6308B:
		add	di, [bp+var_2]
		dec	si
		jz	short loc_630B4
		add	cx, bx
		cmp	cx, dx
		jl	short loc_63088
		inc	di
		sub	cx, dx
		jmp	short loc_63088
; ���������������������������������������������������������������������������

loc_6309C:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+192j
		mov	cx, [bp+var_6]
		inc	cx

loc_630A0:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+1DEj
		xor	es:[di], al
		add	di, [bp+var_2]
		loop	loc_630A0
		jmp	short loc_630B4
; ���������������������������������������������������������������������������

loc_630AA:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+19Aj
		mov	cx, [bp+var_4]
		inc	cx

loc_630AE:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+1EAj
		xor	es:[di], al
		inc	di
		loop	loc_630AE

loc_630B4:				; CODE XREF: Render_ClipAndDrawLineVariant_62EC8+54j
					; Render_ClipAndDrawLineVariant_62EC8+5Cj ...
		pop	di
		pop	si
		mov	sp, bp
		pop	bp

locret_630B9:
		retf
Render_ClipAndDrawLineVariant_62EC8	endp

seg183		ends
