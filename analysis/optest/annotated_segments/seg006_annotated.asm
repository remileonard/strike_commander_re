seg006		segment	byte public 'CODE' use16
		assume cs:seg006
		;org 5
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_6305	proc far		; CODE XREF: sub_5AA4E+AEP
					; DATA XREF: dseg:125Co

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_630A:				; DATA XREF: seg170:00EEo
		mov	dx, [bp+arg_0]
		mov	di, [bp+arg_2]
		xor	cx, cx
		jmp	short loc_6325
; ���������������������������������������������������������������������������

loc_6314:				; CODE XREF: sub_6305+23j
		les	bx, [di+4]
		inc	word ptr [di+4]
		mov	al, es:[bx]
		mov	bx, dx
		add	bx, cx
		mov	[bx+3],	al
		inc	cx

loc_6325:				; CODE XREF: sub_6305+Dj
		cmp	cx, 9
		jl	short loc_6314
		pop	di
		pop	si
		pop	bp
		retf
sub_6305	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_632E	proc far		; CODE XREF: sub_5AA4E+9DFP
					; sub_5AA4E+E3DP
					; DATA XREF: ...

var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [di+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_6345
		jmp	loc_63EA
; ���������������������������������������������������������������������������

loc_6345:				; CODE XREF: sub_632E+12j
		xor	cx, cx
		jmp	short loc_635B
; ���������������������������������������������������������������������������

loc_6349:				; CODE XREF: sub_632E+30j
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, cx
		mov	[bx+di+3], al
		inc	cx

loc_635B:				; CODE XREF: sub_632E+19j
		cmp	cx, 9
		jl	short loc_6349
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+0Ch], al
		xor	cx, cx
		jmp	short loc_6385
; ���������������������������������������������������������������������������

loc_6373:				; CODE XREF: sub_632E+5Aj
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, cx
		mov	[bx+di+0Dh], al
		inc	cx

loc_6385:				; CODE XREF: sub_632E+43j
		cmp	cx, 9
		jl	short loc_6373
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_7], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_8], al
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	dl, [bp+var_8]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+16h], ax
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_7], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_8], al
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	dl, [bp+var_8]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+18h], ax

loc_63EA:				; CODE XREF: sub_632E+14j
		mov	bx, [bp+arg_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		call	CRT_MemFamily_Extra6
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+1Ah]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		push	[bp+var_2]
		call	Runtime_StackOverflowCheck_2C319
		add	sp, 2
		mov	[di+1Ah], ax
		mov	ax, [di+1Ah]
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	short loc_643C
; ���������������������������������������������������������������������������

loc_6425:				; CODE XREF: sub_632E+114j
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_4]
		mov	[bx], al
		inc	[bp+var_4]
		inc	[bp+var_6]

loc_643C:				; CODE XREF: sub_632E+F5j
		mov	ax, [bp+var_6]
		cmp	ax, [bp+var_2]
		jl	short loc_6425
		mov	al, [di+1Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_645C
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+1Ch], al

loc_645C:				; CODE XREF: sub_632E+11Dj
		mov	byte ptr [di+1Dh], 1
		pop	di
		pop	si
		leave
		retf
sub_632E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_6464	proc far		; CODE XREF: sub_5AA4E+252P
					; DATA XREF: dseg:124Co

var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_6485
; ���������������������������������������������������������������������������

loc_6473:				; CODE XREF: sub_6464+24j
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, cx
		mov	[bx+di+3], al
		inc	cx

loc_6485:				; CODE XREF: sub_6464+Dj
		cmp	cx, 9
		jl	short loc_6473
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_1], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	dl, [bp+var_2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Ch], ax
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_1], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	dl, [bp+var_2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_6464	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_64EE	proc far		; CODE XREF: sub_5AA4E+3C4P
					; DATA XREF: dseg:1244o

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6515
; ���������������������������������������������������������������������������

loc_6500:				; CODE XREF: sub_64EE+2Bj
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_2]
		mov	[bx+di+3], al
		inc	[bp+var_2]

loc_6515:				; CODE XREF: sub_64EE+10j
		cmp	[bp+var_2], 9
		jl	short loc_6500
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_3], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_4], al
		mov	al, [bp+var_3]
		mov	ah, 0
		mov	dl, [bp+var_4]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Ch], ax
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_3], al
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_4], al
		mov	al, [bp+var_3]
		mov	ah, 0
		mov	dl, [bp+var_4]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+0Eh], ax
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+10h], al
		mov	bx, [bp+arg_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		call	CRT_MemFamily_Extra6
		add	sp, 4
		inc	ax
		mov	[bp+var_6], ax
		push	word ptr [di+11h]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		push	[bp+var_6]
		call	Runtime_StackOverflowCheck_2C319
		add	sp, 2
		mov	[di+11h], ax
		mov	ax, [di+11h]
		mov	[bp+var_8], ax
		mov	[bp+var_2], 0
		jmp	short loc_65DC
; ���������������������������������������������������������������������������

loc_65C5:				; CODE XREF: sub_64EE+F4j
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_8]
		mov	[bx], al
		inc	[bp+var_8]
		inc	[bp+var_2]

loc_65DC:				; CODE XREF: sub_64EE+D5j
		mov	ax, [bp+var_2]
		cmp	ax, [bp+var_6]
		jl	short loc_65C5
		pop	di
		pop	si
		leave
		retf
sub_64EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_65E8	proc far		; CODE XREF: sub_5AA4E+568P
					; sub_5AA4E+C22P
					; DATA XREF: ...

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+3],	al
		mov	bx, [bp+arg_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		call	CRT_MemFamily_Extra6
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	word ptr [di+4]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		push	[bp+var_2]
		call	Runtime_StackOverflowCheck_2C319
		add	sp, 2
		mov	[di+4],	ax
		mov	ax, [di+4]
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	short loc_6654
; ���������������������������������������������������������������������������

loc_663D:				; CODE XREF: sub_65E8+72j
		mov	bx, [bp+arg_2]
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	bx, [bp+var_4]
		mov	[bx], al
		inc	[bp+var_4]
		inc	[bp+var_6]

loc_6654:				; CODE XREF: sub_65E8+53j
		mov	ax, [bp+var_6]
		cmp	ax, [bp+var_2]
		jl	short loc_663D
		pop	di
		pop	si
		leave
		retf
sub_65E8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_6660	proc far		; CODE XREF: sub_5AA4E+F8DP
					; DATA XREF: dseg:11ACo

var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	bx, cx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_1], al
		mov	bx, cx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	dl, [bp+var_2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+3],	ax
		pop	di
		pop	si
		leave
		retf
sub_6660	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_66A0	proc far		; CODE XREF: sub_5AA4E+238FP
					; DATA XREF: dseg:119Co

var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	bx, cx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_1], al
		mov	bx, cx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	dl, [bp+var_2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[di+3],	ax
		pop	di
		pop	si
		leave
		retf
sub_66A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_66E0	proc far		; CODE XREF: sub_5AA4E+156EP
					; DATA XREF: dseg:11A4o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	bx, dx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+3],	al
		mov	bx, dx
		les	si, [bx+4]
		inc	word ptr [bx+4]
		mov	al, es:[si]
		mov	[di+4],	al
		pop	di
		pop	si
		pop	bp
		retf
sub_66E0	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+6]
		mov	di, [bp+8]
		xor	cx, cx
		jmp	short loc_672B
; ���������������������������������������������������������������������������

loc_671A:				; CODE XREF: seg006:042Ej
		les	bx, [di+4]
		inc	word ptr [di+4]
		mov	al, es:[bx]
		mov	bx, dx
		add	bx, cx
		mov	[bx+3],	al
		inc	cx

loc_672B:				; CODE XREF: seg006:0418j
		cmp	cx, 9
		jl	short loc_671A
		pop	di
		pop	si
		pop	bp
		retf
seg006		ends
