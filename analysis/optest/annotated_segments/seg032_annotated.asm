seg032		segment	byte public 'CODE' use16
		assume cs:seg032
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Render_LineClipped
; (sub_25BA4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,328L — trace un segment de droite (x1,y1)-(x2,y2) avec clipping contre un
; rectangle : échange les points si nécessaire, calcule delta X/Y et signe, borne aux limites
; : primitive de tracé de ligne (algorithme de Bresenham avec clipping), même famille que le
; rasterizer du seg037/044.
; ==============================================================================================
Render_LineClipped	proc far		; CODE XREF: seg028:1031P

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
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_C]
		mov	cx, 6
		rep movsw
		mov	bx, [bp+var_A]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_E], ax
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, bx
		jle	short loc_16FEE
		xchg	ax, bx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	cx, [bp+arg_2]
		xchg	cx, [bp+arg_6]
		mov	[bp+arg_2], cx
		mov	cx, [bp+arg_A]
		xchg	cx, [bp+arg_C]
		mov	[bp+arg_A], cx

loc_16FEE:				; CODE XREF: Render_LineClipped+27j
		mov	cx, [bp+arg_8]
		sub	cx, [bp+arg_4]
		jo	short loc_1704A
		mov	[bp+var_12], cx
		mov	cx, [bp+arg_6]
		sub	cx, [bp+arg_2]
		jo	short loc_1704A
		mov	[bp+var_10], cx
		mov	cx, [bp+arg_C]
		sub	cx, [bp+arg_A]
		jo	short loc_1704A
		mov	[bp+var_14], cx
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		cmp	cx, dx
		mov	[bp+var_16], 0
		jz	short loc_1702A
		mov	[bp+var_16], 1
		jle	short loc_1702A
		xchg	cx, dx
		neg	[bp+var_16]

loc_1702A:				; CODE XREF: Render_LineClipped+70j
					; Render_LineClipped+77j
		mov	[bp+var_18], dx
		sub	[bp+var_18], cx
		mov	ax, [bp+arg_4]
		cmp	ax, [bp+var_2]
		jg	short loc_1704A
		mov	bx, [bp+arg_8]
		cmp	bx, [bp+var_6]
		jl	short loc_1704A
		cmp	cx, [bp+var_4]
		jg	short loc_1704A
		cmp	dx, [bp+var_8]
		jge	short loc_1704D

loc_1704A:				; CODE XREF: Render_LineClipped+48j
					; Render_LineClipped+53j ...
		jmp	loc_171FD
; ���������������������������������������������������������������������������

loc_1704D:				; CODE XREF: Render_LineClipped+9Cj
		mov	cx, [bp+var_6]
		mov	dx, [bp+arg_4]
		mov	ax, cx
		sub	ax, dx
		jle	short loc_1707D
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

loc_1707D:				; CODE XREF: Render_LineClipped+ABj
		mov	cx, [bp+var_8]
		mov	dx, [bp+arg_2]
		mov	ax, cx
		sub	ax, dx
		jg	short loc_17092
		mov	cx, [bp+var_4]
		mov	ax, cx
		sub	ax, dx
		jge	short loc_170C0

loc_17092:				; CODE XREF: Render_LineClipped+DBj
		mov	[bp+arg_2], cx
		mov	cx, [bp+arg_6]
		sub	cx, dx
		push	ax
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
		jg	loc_171FD

loc_170C0:				; CODE XREF: Render_LineClipped+E4j
		mov	cx, [bp+var_2]
		mov	dx, [bp+arg_8]
		mov	ax, dx
		sub	ax, cx
		jle	short loc_170F0
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

loc_170F0:				; CODE XREF: Render_LineClipped+11Ej
		mov	cx, [bp+var_8]
		mov	dx, [bp+arg_6]
		mov	ax, dx
		sub	ax, cx
		jl	short loc_17105
		mov	cx, [bp+var_4]
		mov	ax, dx
		sub	ax, cx
		jle	short loc_17133

loc_17105:				; CODE XREF: Render_LineClipped+14Ej
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
		jl	loc_171FD

loc_17133:				; CODE XREF: Render_LineClipped+157j
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
		jb	short loc_171B4
		movsx	ecx, [bp+var_18]
		or	cx, cx
		jle	short loc_17184
		mov	ax, [bp+var_14]
		shl	eax, 10h
		cdq
		idiv	ecx
		mov	[bp+var_1C], eax

loc_17184:				; CODE XREF: Render_LineClipped+1C6j
		mov	si, [bp+var_18]
		mov	dx, [bp+var_12]
		mov	ax, [bp+arg_A]
		shl	eax, 10h
		mov	ax, 8000h
		jmp	short loc_1719C
; ���������������������������������������������������������������������������

loc_17196:				; CODE XREF: Render_LineClipped+1FEj
					; Render_LineClipped+206j
		add	di, [bp+var_16]
		dec	cx
		jle	short loc_171FD

loc_1719C:				; CODE XREF: Render_LineClipped+1E8j
		shld	ebx, eax, 10h
		mov	es:[di], bl
		add	eax, [bp+var_1C]
		sub	si, dx
		jg	short loc_17196
		add	di, [bp+var_E]
		add	si, [bp+var_18]
		jmp	short loc_17196
; ���������������������������������������������������������������������������

loc_171B4:				; CODE XREF: Render_LineClipped+1BDj
		movsx	ecx, [bp+var_12]
		or	cx, cx
		jle	short loc_171CD
		mov	ax, [bp+var_14]
		shl	eax, 10h
		cdq
		idiv	ecx
		mov	[bp+var_1C], eax

loc_171CD:				; CODE XREF: Render_LineClipped+20Fj
		mov	si, [bp+var_12]
		mov	dx, [bp+var_18]
		mov	ax, [bp+arg_A]
		shl	eax, 10h
		mov	ax, 8000h
		jmp	short loc_171E5
; ���������������������������������������������������������������������������

loc_171DF:				; CODE XREF: Render_LineClipped+247j
					; Render_LineClipped+24Fj
		add	di, [bp+var_E]
		dec	cx
		jle	short loc_171FD

loc_171E5:				; CODE XREF: Render_LineClipped+231j
		shld	ebx, eax, 10h
		mov	es:[di], bl
		add	eax, [bp+var_1C]
		sub	si, dx
		jg	short loc_171DF
		add	di, [bp+var_16]
		add	si, [bp+var_12]
		jmp	short loc_171DF
; ���������������������������������������������������������������������������

loc_171FD:				; CODE XREF: Render_LineClipped:loc_1704Aj
					; Render_LineClipped+110j ...
		pop	di
		pop	si
		leave
		retf
Render_LineClipped	endp

seg032		ends
