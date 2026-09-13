seg045		segment	byte public 'CODE' use16
		assume cs:seg045
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,328L — trace un segment de droite (x1,y1)-(x2,y2) avec clipping contre un rectangle :
; échange les points si nécessaire, calcule delta X/Y et signe, borne aux limites : primitive
; de tracé de ligne (algorithme de Bresenham avec clipping), même famille que le rasterizer du
; seg037/044.
; ==============================================================================================
Render_LineClipped	proc far		; CODE XREF: seg042:0D82P

var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		enter	1Ch, 0

loc_25BA8:				; DATA XREF: seg216:0226o
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_C]

loc_25BB3:
		mov	cx, 6

loc_25BB6:
		rep movsw

loc_25BB8:
		mov	bx, [bp+var_A]
		mov	ax, [bx+2]

loc_25BBE:
		sub	ax, [bx]
		mov	[bp+var_E], ax

loc_25BC3:
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, bx
		jle	short loc_25BE6
		xchg	ax, bx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	cx, [bp+arg_2]
		xchg	cx, [bp+arg_6]
		mov	[bp+arg_2], cx
		mov	cx, [bp+arg_A]
		xchg	cx, [bp+arg_C]
		mov	[bp+arg_A], cx

loc_25BE6:				; CODE XREF: Render_LineClipped+27j
		mov	cx, [bp+arg_8]
		sub	cx, [bp+arg_4]
		jo	short loc_25C42
		mov	[bp+var_12], cx
		mov	cx, [bp+arg_6]
		sub	cx, [bp+arg_2]
		jo	short loc_25C42
		mov	[bp+var_10], cx
		mov	cx, [bp+arg_C]
		sub	cx, [bp+arg_A]
		jo	short loc_25C42
		mov	[bp+var_14], cx
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		cmp	cx, dx
		mov	[bp+var_16], 0
		jz	short loc_25C22
		mov	[bp+var_16], 1
		jle	short loc_25C22
		xchg	cx, dx
		neg	[bp+var_16]

loc_25C22:				; CODE XREF: Render_LineClipped+70j
					; Render_LineClipped+77j
		mov	[bp+var_18], dx
		sub	[bp+var_18], cx
		mov	ax, [bp+arg_4]
		cmp	ax, [bp+var_2]
		jg	short loc_25C42
		mov	bx, [bp+arg_8]
		cmp	bx, [bp+var_6]
		jl	short loc_25C42
		cmp	cx, [bp+var_4]
		jg	short loc_25C42
		cmp	dx, [bp+var_8]
		jge	short loc_25C45

loc_25C42:				; CODE XREF: Render_LineClipped+48j
					; Render_LineClipped+53j ...
		jmp	loc_25DF5
; ���������������������������������������������������������������������������

loc_25C45:				; CODE XREF: Render_LineClipped+9Cj
		mov	cx, [bp+var_6]
		mov	dx, [bp+arg_4]
		mov	ax, cx
		sub	ax, dx
		jle	short loc_25C75
		mov	[bp+arg_4], cx
		mov	cx, [bp+arg_8]
		sub	cx, dx
		push	ax
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		imul	dx
		idiv	cx
		add	[bp+arg_2], ax
		pop	ax
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_A]
		imul	dx
		idiv	cx
		add	[bp+arg_A], ax

loc_25C75:				; CODE XREF: Render_LineClipped+ABj
		mov	cx, [bp+var_8]
		mov	dx, [bp+arg_2]
		mov	ax, cx
		sub	ax, dx
		jg	short loc_25C8A

loc_25C81:
		mov	cx, [bp+var_4]
		mov	ax, cx
		sub	ax, dx
		jge	short loc_25CB8

loc_25C8A:				; CODE XREF: Render_LineClipped+DBj
		mov	[bp+arg_2], cx
		mov	cx, [bp+arg_6]
		sub	cx, dx
		push	ax

loc_25C93:
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		imul	dx
		idiv	cx
		add	[bp+arg_4], ax
		pop	ax
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_A]
		imul	dx
		idiv	cx
		add	[bp+arg_A], ax
		mov	ax, [bp+arg_4]
		cmp	ax, [bp+var_2]
		jg	loc_25DF5

loc_25CB8:				; CODE XREF: Render_LineClipped+E4j
		mov	cx, [bp+var_2]
		mov	dx, [bp+arg_8]
		mov	ax, dx
		sub	ax, cx
		jle	short loc_25CE8
		mov	[bp+arg_8], cx
		mov	cx, dx
		sub	cx, [bp+arg_4]
		push	ax
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		imul	dx
		idiv	cx
		sub	[bp+arg_6], ax
		pop	ax
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_A]
		imul	dx
		idiv	cx
		sub	[bp+arg_C], ax

loc_25CE8:				; CODE XREF: Render_LineClipped+11Ej
		mov	cx, [bp+var_8]
		mov	dx, [bp+arg_6]
		mov	ax, dx
		sub	ax, cx
		jl	short loc_25CFD
		mov	cx, [bp+var_4]
		mov	ax, dx
		sub	ax, cx
		jle	short loc_25D2B

loc_25CFD:				; CODE XREF: Render_LineClipped+14Ej
		mov	[bp+arg_6], cx
		mov	cx, dx
		sub	cx, [bp+arg_2]
		push	ax
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		imul	dx
		idiv	cx
		sub	[bp+arg_8], ax
		pop	ax
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_A]
		imul	dx
		idiv	cx
		sub	[bp+arg_C], ax
		mov	ax, [bp+arg_8]
		cmp	ax, [bp+var_6]
		jl	loc_25DF5

loc_25D2B:				; CODE XREF: Render_LineClipped+157j
		mov	ax, [bp+arg_8]
		sub	ax, [bp+arg_4]
		mov	[bp+var_12], ax
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+arg_C]
		sub	ax, [bp+arg_A]
		mov	[bp+var_14], ax
		mov	es, [bp+var_C]
		mov	bx, [bp+arg_4]
		shl	bx, 1
		add	bx, [bp+var_A]
		mov	di, [bx]
		add	di, [bp+arg_2]
		mov	ax, [bp+var_18]
		cmp	ax, [bp+var_12]
		jb	short loc_25DAC

loc_25D63:
		movsx	ecx, [bp+var_18]
		or	cx, cx
		jle	short loc_25D7C
		mov	ax, [bp+var_14]
		shl	eax, 10h
		cdq
		idiv	ecx
		mov	[bp+var_1C], eax

loc_25D7C:				; CODE XREF: Render_LineClipped+1C6j
		mov	si, [bp+var_18]
		mov	dx, [bp+var_12]

loc_25D82:
		mov	ax, [bp+arg_A]

loc_25D85:
		shl	eax, 10h
		mov	ax, 8000h
		jmp	short loc_25D94
; ���������������������������������������������������������������������������

loc_25D8E:				; CODE XREF: Render_LineClipped+1FEj
					; Render_LineClipped+206j
		add	di, [bp+var_16]
		dec	cx

loc_25D92:
		jle	short loc_25DF5

loc_25D94:				; CODE XREF: Render_LineClipped+1E8j
		shld	ebx, eax, 10h
		mov	es:[di], bl
		add	eax, [bp+var_1C]
		sub	si, dx
		jg	short loc_25D8E
		add	di, [bp+var_E]
		add	si, [bp+var_18]
		jmp	short loc_25D8E
; ���������������������������������������������������������������������������

loc_25DAC:				; CODE XREF: Render_LineClipped+1BDj
		movsx	ecx, [bp+var_12]
		or	cx, cx
		jle	short loc_25DC5
		mov	ax, [bp+var_14]
		shl	eax, 10h
		cdq
		idiv	ecx

loc_25DC1:
		mov	[bp+var_1C], eax

loc_25DC5:				; CODE XREF: Render_LineClipped+20Fj
		mov	si, [bp+var_12]
		mov	dx, [bp+var_18]
		mov	ax, [bp+arg_A]
		shl	eax, 10h
		mov	ax, 8000h
		jmp	short loc_25DDD
; ���������������������������������������������������������������������������

loc_25DD7:				; CODE XREF: Render_LineClipped+247j
					; Render_LineClipped+24Fj
		add	di, [bp+var_E]
		dec	cx
		jle	short loc_25DF5

loc_25DDD:				; CODE XREF: Render_LineClipped+231j
		shld	ebx, eax, 10h
		mov	es:[di], bl
		add	eax, [bp+var_1C]
		sub	si, dx
		jg	short loc_25DD7
		add	di, [bp+var_16]

loc_25DF0:
		add	si, [bp+var_12]
		jmp	short loc_25DD7
; ���������������������������������������������������������������������������

loc_25DF5:				; CODE XREF: Render_LineClipped:loc_25C42j
					; Render_LineClipped+110j ...
		pop	di
		pop	si
		leave
		retf
Render_LineClipped	endp

seg045		ends
