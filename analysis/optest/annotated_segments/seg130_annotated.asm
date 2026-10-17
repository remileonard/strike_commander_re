seg130		segment	byte public 'CODE' use16
		assume cs:seg130
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_ClipAndDrawLineVariant_62EC8 (sub_62EC8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 369 lignes, NON DÉTAILLÉE — même motif que
; Render_ClipAndDrawLine_613B0 (seg168) : clippe un segment de ligne contre un rectangle de
; bornage. Référencée deux fois par sub_A1375. Identité exacte vis-à-vis de sub_613B0 non
; vérifiée.
; ==============================================================================================
Render_ClipAndDrawLineVariant_33E78	proc far		; CODE XREF: PaletteScreen_DrawCurveShape_F9A4+2FP PaletteScreen_DrawCurveShape_F9A4+4AP ...

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

loc_33E7B:				; DATA XREF: seg170:04E6o
		sub	sp, 8
		push	si
		push	di
		cld
		mov	si, [bp+arg_0]
		mov	ax, [si]
		mov	es, ax
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		mov	bx, [bp+arg_6]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_8]
		cmp	bx, ax
		jge	short loc_33EA6
		xchg	ax, bx
		xchg	cx, dx

loc_33EA6:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+29j
		mov	[bp+arg_2], ax
		mov	[bp+arg_6], bx
		mov	[bp+arg_4], cx
		mov	[bp+arg_8], dx
		cmp	dx, cx
		jge	short loc_33EC2
		xchg	cx, dx
		neg	[bp+var_2]
		mov	[bp+var_8], 1
		jmp	short loc_33EC7
; ���������������������������������������������������������������������������

loc_33EC2:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+3Cj
		mov	[bp+var_8], 0

loc_33EC7:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+48j
		cmp	bx, [si+4]
		jge	short loc_33ECF
		jmp	loc_34064
; ���������������������������������������������������������������������������

loc_33ECF:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+52j
		cmp	ax, [si+8]
		jle	short loc_33ED7
		jmp	loc_34064
; ���������������������������������������������������������������������������

loc_33ED7:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+5Aj
		cmp	dx, [si+6]
		jge	short loc_33EDF
		jmp	loc_34064
; ���������������������������������������������������������������������������

loc_33EDF:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+62j
		cmp	cx, [si+0Ah]
		jle	short loc_33EE7
		jmp	loc_34064
; ���������������������������������������������������������������������������

loc_33EE7:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+6Aj
		cmp	bx, [si+8]
		jle	short loc_33F0E
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		mov	ax, [si+8]
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]
		mov	[bp+arg_8], ax
		mov	ax, [si+8]
		mov	[bp+arg_6], ax

loc_33F0E:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+72j
		mov	ax, [bp+arg_2]
		cmp	ax, [si+4]
		jge	short loc_33F38
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		mov	ax, [si+4]
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]
		mov	[bp+arg_4], ax
		mov	ax, [si+4]
		mov	[bp+arg_2], ax

loc_33F38:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+9Cj
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		test	[bp+var_8], 0FFh
		jz	short loc_33F5A
		xchg	ax, bx
		xchg	cx, dx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_33F5A:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+D1j
		cmp	bx, [si+6]
		jge	short loc_33F62
		jmp	loc_34064
; ���������������������������������������������������������������������������

loc_33F62:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+E5j
		cmp	ax, [si+0Ah]
		jle	short loc_33F6A
		jmp	loc_34064
; ���������������������������������������������������������������������������

loc_33F6A:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+EDj
		cmp	bx, [si+0Ah]
		jle	short loc_33F8D
		sub	bx, ax
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+0Ah]
		sub	ax, [bp+arg_4]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+arg_8], ax

loc_33F8D:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+F5j
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, [si+6]
		jge	short loc_33FBA
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+6]
		sub	ax, [bp+arg_4]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_2], ax
		mov	ax, [si+6]
		mov	[bp+arg_4], ax

loc_33FBA:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+11Ej
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	[bp+var_6], bx
		test	[bp+var_8], 0FFh
		jz	short loc_33FE5
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		xchg	ax, bx
		xchg	cx, dx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_33FE5:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+150j
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	[bp+var_4], bx
		xor	al, al
		mov	ah, byte ptr [bp+arg_4]
		shr	ax, 1
		shr	ax, 1
		add	ah, byte ptr [bp+arg_4]
		add	ax, [bp+arg_2]
		mov	di, ax
		mov	al, [bp+arg_A]
		xor	cx, cx
		mov	bx, [bp+arg_2]
		cmp	bx, [bp+arg_6]
		jz	short loc_3404C
		mov	bx, [bp+arg_4]
		cmp	bx, [bp+arg_8]
		jz	short loc_3405A
		mov	bx, [bp+var_4]
		mov	dx, [bp+var_6]
		cmp	dx, bx
		jg	short loc_34035
		mov	si, bx
		inc	si

loc_34021:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+1B4j
					; Render_ClipAndDrawLineVariant_33E78+1BBj
		xor	es:[di], al
		inc	di
		dec	si
		jz	short loc_34064
		add	cx, dx
		cmp	cx, bx
		jl	short loc_34021
		add	di, [bp+var_2]
		sub	cx, bx
		jmp	short loc_34021
; ���������������������������������������������������������������������������

loc_34035:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+1A4j
		mov	si, dx
		inc	si

loc_34038:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+1CDj
					; Render_ClipAndDrawLineVariant_33E78+1D2j
		xor	es:[di], al
		add	di, [bp+var_2]
		dec	si
		jz	short loc_34064
		add	cx, bx
		cmp	cx, dx
		jl	short loc_34038
		inc	di
		sub	cx, dx
		jmp	short loc_34038
; ���������������������������������������������������������������������������

loc_3404C:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+192j
		mov	cx, [bp+var_6]
		inc	cx

loc_34050:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+1DEj
		xor	es:[di], al
		add	di, [bp+var_2]
		loop	loc_34050
		jmp	short loc_34064
; ���������������������������������������������������������������������������

loc_3405A:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+19Aj
		mov	cx, [bp+var_4]
		inc	cx

loc_3405E:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+1EAj
		xor	es:[di], al
		inc	di
		loop	loc_3405E

loc_34064:				; CODE XREF: Render_ClipAndDrawLineVariant_33E78+54j
					; Render_ClipAndDrawLineVariant_33E78+5Cj ...
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Render_ClipAndDrawLineVariant_33E78	endp

seg130		ends
