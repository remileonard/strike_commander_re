seg168		segment	byte public 'CODE' use16
		assume cs:seg168
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 428 lignes, NON DÉTAILLÉE EN PROFONDEUR — référencée via vtable (DATA XREF seg216),
; clippe un segment de ligne (arg_2/arg_4 → arg_6/arg_8) contre un rectangle de bornage
; (structure pointée par si, champs +4/+8/+0xA) en recalculant les points d'intersection par
; interpolation linéaire, avant tracé. Référencée par sub_1B304 et depuis seg025 (framework
; UI). Candidat pour session dédiée si la précision du clipping doit être vérifiée.
; ==============================================================================================
Render_ClipAndDrawLine_613B0	proc far		; CODE XREF: UI_ComputeAnchoredRect:loc_1B3CCP
					; seg025:0C08P

var_C		= byte ptr -0Ch
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
arg_A		= byte ptr  10h
arg_C		= byte ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		cld
		mov	si, [bp+arg_0]
		mov	ax, [si]

loc_613BE:				; DATA XREF: seg216:off_6A3E6o
		mov	es, ax

loc_613C0:
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_2]
		mov	bx, [bp+arg_6]

loc_613D1:
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_8]

loc_613D7:
		cmp	bx, ax
		jge	short loc_613DE
		xchg	ax, bx

loc_613DC:
		xchg	cx, dx

loc_613DE:				; CODE XREF: Render_ClipAndDrawLine_613B0+29j
		mov	[bp+arg_2], ax
		mov	[bp+arg_6], bx

loc_613E4:
		mov	[bp+arg_4], cx
		mov	[bp+arg_8], dx
		push	ax
		mov	ax, [bp+var_A]
		cmp	dx, cx

loc_613F0:
		jge	short loc_613FD
		xchg	cx, dx
		neg	ax
		mov	[bp+var_8], 1
		jmp	short loc_61405
; ���������������������������������������������������������������������������

loc_613FD:				; CODE XREF: Render_ClipAndDrawLine_613B0:loc_613F0j
		mov	ax, [bp+var_A]
		mov	[bp+var_8], 0

loc_61405:				; CODE XREF: Render_ClipAndDrawLine_613B0+4Bj
		mov	[bp+var_2], ax
		pop	ax
		cmp	bx, [si+4]
		jge	short loc_61411
		jmp	loc_6160B
; ���������������������������������������������������������������������������

loc_61411:				; CODE XREF: Render_ClipAndDrawLine_613B0+5Cj
		cmp	ax, [si+8]
		jle	short loc_61419
		jmp	loc_6160B
; ���������������������������������������������������������������������������

loc_61419:				; CODE XREF: Render_ClipAndDrawLine_613B0+64j
		cmp	dx, [si+6]
		jge	short loc_61421
		jmp	loc_6160B
; ���������������������������������������������������������������������������

loc_61421:				; CODE XREF: Render_ClipAndDrawLine_613B0+6Cj
		cmp	cx, [si+0Ah]
		jle	short loc_61429
		jmp	loc_6160B
; ���������������������������������������������������������������������������

loc_61429:				; CODE XREF: Render_ClipAndDrawLine_613B0+74j
		cmp	bx, [si+8]
		jle	short loc_61450
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]

loc_6143A:
		mov	ax, [si+8]
		sub	ax, [bp+arg_2]

loc_61440:
		imul	dx

loc_61442:
		idiv	bx
		add	ax, [bp+arg_4]

loc_61447:
		mov	[bp+arg_8], ax

loc_6144A:
		mov	ax, [si+8]
		mov	[bp+arg_6], ax

loc_61450:				; CODE XREF: Render_ClipAndDrawLine_613B0+7Cj
		mov	ax, [bp+arg_2]
		cmp	ax, [si+4]
		jge	short loc_6147A
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		mov	ax, [si+4]
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]

loc_61471:
		mov	[bp+arg_4], ax
		mov	ax, [si+4]
		mov	[bp+arg_2], ax

loc_6147A:				; CODE XREF: Render_ClipAndDrawLine_613B0+A6j
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]

loc_61486:
		test	[bp+var_8], 0FFh

loc_6148B:
		jz	short loc_6149C
		xchg	ax, bx
		xchg	cx, dx

loc_61490:
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_6149C:				; CODE XREF: Render_ClipAndDrawLine_613B0:loc_6148Bj
		cmp	bx, [si+6]
		jge	short loc_614A4
		jmp	loc_6160B
; ���������������������������������������������������������������������������

loc_614A4:				; CODE XREF: Render_ClipAndDrawLine_613B0+EFj
		cmp	ax, [si+0Ah]
		jle	short loc_614AC
		jmp	loc_6160B
; ���������������������������������������������������������������������������

loc_614AC:				; CODE XREF: Render_ClipAndDrawLine_613B0+F7j
		cmp	bx, [si+0Ah]
		jle	short loc_614CF
		sub	bx, ax
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+0Ah]
		sub	ax, [bp+arg_4]
		imul	dx

loc_614C1:
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+arg_8], ax

loc_614CF:				; CODE XREF: Render_ClipAndDrawLine_613B0+FFj
		mov	ax, [bp+arg_4]

loc_614D2:
		mov	bx, [bp+arg_8]
		cmp	ax, [si+6]

loc_614D8:
		jge	short loc_614FC
		mov	bx, [bp+arg_8]

loc_614DD:
		sub	bx, [bp+arg_4]
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+6]
		sub	ax, [bp+arg_4]
		imul	dx
		idiv	bx

loc_614F0:
		add	ax, [bp+arg_2]

loc_614F3:
		mov	[bp+arg_2], ax

loc_614F6:
		mov	ax, [si+6]

loc_614F9:
		mov	[bp+arg_4], ax

loc_614FC:				; CODE XREF: Render_ClipAndDrawLine_613B0:loc_614D8j
		mov	bx, [bp+arg_8]

loc_614FF:
		sub	bx, [bp+arg_4]

loc_61502:
		mov	[bp+var_6], bx
		test	[bp+var_8], 0FFh
		jz	short loc_61527
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

loc_61527:				; CODE XREF: Render_ClipAndDrawLine_613B0+15Aj
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	[bp+var_4], bx
		mov	ax, [bp+arg_4]

loc_61533:
		mul	[bp+var_A]

loc_61536:
		add	ax, [bp+arg_2]

loc_61539:
		mov	bx, [si+2]
		mov	di, [bx]
		add	di, ax

loc_61540:
		mov	al, [bp+arg_A]
		xor	cx, cx

loc_61545:
		mov	bx, [bp+arg_2]

loc_61548:
		cmp	bx, [bp+arg_6]
		jz	short loc_615C3
		mov	bx, [bp+arg_4]
		cmp	bx, [bp+arg_8]
		jnz	short loc_61558
		jmp	loc_615E9
; ���������������������������������������������������������������������������

loc_61558:				; CODE XREF: Render_ClipAndDrawLine_613B0+1A3j
		mov	bx, [bp+var_4]
		mov	dx, [bp+var_6]
		cmp	dx, bx
		jg	short loc_61594
		mov	si, bx
		inc	si
		mov	ah, [bp+arg_C]
		mov	[bp+var_C], 1

loc_6156C:				; CODE XREF: Render_ClipAndDrawLine_613B0+1DBj
					; Render_ClipAndDrawLine_613B0+1E2j
		test	[bp+var_C], 0FFh
		jz	short loc_61575
		stosb
		jmp	short loc_61576
; ���������������������������������������������������������������������������

loc_61575:				; CODE XREF: Render_ClipAndDrawLine_613B0+1C0j
		inc	di

loc_61576:				; CODE XREF: Render_ClipAndDrawLine_613B0+1C3j
		dec	ah
		jnz	short loc_61581
		xor	[bp+var_C], 1
		mov	ah, [bp+arg_C]

loc_61581:				; CODE XREF: Render_ClipAndDrawLine_613B0+1C8j
		dec	si

loc_61582:
		jnz	short loc_61587
		jmp	loc_6160B
; ���������������������������������������������������������������������������

loc_61587:				; CODE XREF: Render_ClipAndDrawLine_613B0:loc_61582j
		add	cx, dx
		cmp	cx, bx
		jl	short loc_6156C

loc_6158D:
		add	di, [bp+var_2]

loc_61590:
		sub	cx, bx
		jmp	short loc_6156C
; ���������������������������������������������������������������������������

loc_61594:				; CODE XREF: Render_ClipAndDrawLine_613B0+1B0j
		mov	si, dx
		inc	si
		mov	ah, [bp+arg_C]
		mov	[bp+var_C], 1

loc_6159E:				; CODE XREF: Render_ClipAndDrawLine_613B0+20Cj
					; Render_ClipAndDrawLine_613B0+211j
		test	[bp+var_C], 0FFh
		jz	short loc_615A7
		mov	es:[di], al

loc_615A7:				; CODE XREF: Render_ClipAndDrawLine_613B0+1F2j
		dec	ah
		jnz	short loc_615B2
		xor	[bp+var_C], 1
		mov	ah, [bp+arg_C]

loc_615B2:				; CODE XREF: Render_ClipAndDrawLine_613B0+1F9j
		add	di, [bp+var_2]
		dec	si
		jz	short loc_6160B
		add	cx, bx
		cmp	cx, dx
		jl	short loc_6159E
		inc	di
		sub	cx, dx
		jmp	short loc_6159E
; ���������������������������������������������������������������������������

loc_615C3:				; CODE XREF: Render_ClipAndDrawLine_613B0+19Bj
		mov	cx, [bp+var_6]

loc_615C6:
		inc	cx

loc_615C7:
		mov	ah, [bp+arg_C]

loc_615CA:
		mov	[bp+var_C], 1

loc_615CE:				; CODE XREF: Render_ClipAndDrawLine_613B0+235j
		test	[bp+var_C], 0FFh

loc_615D2:
		jz	short loc_615D7

loc_615D4:
		mov	es:[di], al

loc_615D7:				; CODE XREF: Render_ClipAndDrawLine_613B0:loc_615D2j
		dec	ah
		jnz	short loc_615E2
		xor	[bp+var_C], 1
		mov	ah, [bp+arg_C]

loc_615E2:				; CODE XREF: Render_ClipAndDrawLine_613B0+229j
		add	di, [bp+var_2]
		loop	loc_615CE
		jmp	short loc_6160B
; ���������������������������������������������������������������������������

loc_615E9:				; CODE XREF: Render_ClipAndDrawLine_613B0+1A5j
		mov	cx, [bp+var_4]
		inc	cx
		mov	ah, [bp+arg_C]

loc_615F0:
		mov	[bp+var_C], 1

loc_615F4:				; CODE XREF: Render_ClipAndDrawLine_613B0:loc_61609j
		test	[bp+var_C], 0FFh

loc_615F8:
		jz	short loc_615FD
		stosb
		jmp	short loc_615FE
; ���������������������������������������������������������������������������

loc_615FD:				; CODE XREF: Render_ClipAndDrawLine_613B0:loc_615F8j
		inc	di

loc_615FE:				; CODE XREF: Render_ClipAndDrawLine_613B0+24Bj
		dec	ah
		jnz	short loc_61609
		xor	[bp+var_C], 1
		mov	ah, [bp+arg_C]

loc_61609:				; CODE XREF: Render_ClipAndDrawLine_613B0+250j
		loop	loc_615F4

loc_6160B:				; CODE XREF: Render_ClipAndDrawLine_613B0+5Ej
					; Render_ClipAndDrawLine_613B0+66j ...
		pop	di
		pop	si
		mov	sp, bp
		pop	bp

locret_61610:
		retf
Render_ClipAndDrawLine_613B0	endp

seg168		ends
