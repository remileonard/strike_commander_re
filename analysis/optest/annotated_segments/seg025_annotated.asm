seg025		segment	byte public 'CODE' use16
		assume cs:seg025
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_11400:				; DATA XREF: dseg:2C2Ao
		push	bp
		mov	bp, sp

loc_11403:				; DATA XREF: seg170:0186o
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		cmp	word ptr [di], 0
		jnz	short loc_11419
		mov	ax, [si+4]
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_11421
; ���������������������������������������������������������������������������

loc_11419:				; CODE XREF: seg025:000Ej
		dec	word ptr [di]
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11421:				; CODE XREF: seg025:0017j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11425:				; DATA XREF: dseg:2C2Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Ah]
		push	word ptr [si+4]
		push	word ptr [bp+8]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_1144A
		mov	al, 1
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_11452
; ���������������������������������������������������������������������������

loc_1144A:				; CODE XREF: seg025:0040j
		inc	word ptr [di]
		mov	al, 0
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11452:				; CODE XREF: seg025:0048j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11456:				; DATA XREF: dseg:2C1Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	ax, [di]
		cmp	ax, [si+7]
		jl	short loc_11473
		mov	ax, [si+7]
		sub	[di], ax
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11473:				; CODE XREF: seg025:0066j
		mov	dx, [si+4]
		jmp	short loc_1147D
; ���������������������������������������������������������������������������

loc_11478:				; CODE XREF: seg025:0080j
		add	dx, [si+9]
		dec	word ptr [di]

loc_1147D:				; CODE XREF: seg025:0076j
		cmp	word ptr [di], 0
		jg	short loc_11478
		mov	ax, dx
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1148C:				; DATA XREF: dseg:2C22o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [si+4]
		mov	word ptr [bp-2], 0
		jmp	short loc_114C2
; ���������������������������������������������������������������������������

loc_114A1:				; CODE XREF: seg025:00C8j
		push	di
		push	word ptr [bp+8]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_114B7
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_114B7:				; CODE XREF: seg025:00AFj
		mov	bx, [bp+0Ah]
		inc	word ptr [bx]
		inc	word ptr [bp-2]
		add	di, [si+9]

loc_114C2:				; CODE XREF: seg025:009Fj
		mov	ax, [si+7]
		cmp	ax, [bp-2]
		jg	short loc_114A1
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_114D4	proc far		; CODE XREF: seg025:0927p
					; sub_4C58B+76P

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	word ptr [si+6], 0
		jnz	short loc_11501
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_1169A
		add	sp, 4
		cmp	ax, 0FFFFh
		jz	short loc_11501
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_11501:				; CODE XREF: sub_114D4+14j
					; sub_114D4+25j
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	7
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_1153A
		mov	word ptr [di], 5CEh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 2C26h
		push	[bp+var_4]
		call	CRT_Strdup
		add	sp, 2
		mov	[di+4],	ax
		mov	byte ptr [di+6], 1
		mov	ax, di
		jmp	short loc_1153C
; ���������������������������������������������������������������������������

loc_1153A:				; CODE XREF: sub_114D4+41j
		mov	ax, di

loc_1153C:				; CODE XREF: sub_114D4+64j
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_11551
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_2FDF4
		add	sp, 4

loc_11551:				; CODE XREF: sub_114D4+6Fj
		cmp	[bp+var_2], 0
		jz	short loc_1155C
		mov	ax, 1
		jmp	short loc_1155E
; ���������������������������������������������������������������������������

loc_1155C:				; CODE XREF: sub_114D4+81j
		xor	ax, ax

loc_1155E:				; CODE XREF: sub_114D4+86j
		pop	di
		pop	si
		leave
		retf
sub_114D4	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_11566	proc far		; CODE XREF: seg025:09ABp

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_8], ax
		push	0Bh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_115CC
		mov	word ptr [di], 5CEh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 2C26h
		mov	word ptr [di+4], 0
		mov	byte ptr [di+6], 0
		mov	word ptr [di], 2C1Ah
		mov	ax, [bp+var_6]
		mov	[di+7],	ax
		mov	ax, [bp+var_8]
		mov	[di+9],	ax
		mov	ax, [bp+var_4]
		mov	[di+4],	ax
		mov	byte ptr [di+6], 0
		mov	ax, di
		jmp	short loc_115CE
; ���������������������������������������������������������������������������

loc_115CC:				; CODE XREF: sub_11566+30j
		mov	ax, di

loc_115CE:				; CODE XREF: sub_11566+64j
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_115E3
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_2FDF4
		add	sp, 4

loc_115E3:				; CODE XREF: sub_11566+6Fj
		cmp	[bp+var_2], 0
		jz	short loc_115EE
		mov	ax, 1
		jmp	short loc_115F0
; ���������������������������������������������������������������������������

loc_115EE:				; CODE XREF: sub_11566+81j
		xor	ax, ax

loc_115F0:				; CODE XREF: sub_11566+86j
		pop	di
		pop	si
		leave
		retf
sub_11566	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_115F8	proc far		; CODE XREF: seg025:0965p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_11634
; ���������������������������������������������������������������������������

loc_1160D:				; CODE XREF: sub_115F8+4Bj
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_11634
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_11634:				; CODE XREF: sub_115F8+13j
					; sub_115F8+26j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_1160D
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_115F8	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1164F	proc far		; CODE XREF: seg025:0341p
					; sub_11840+61p ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1167F
; ���������������������������������������������������������������������������

loc_11661:				; CODE XREF: sub_1164F+3Fj
		lea	ax, [bp+arg_2]
		push	ax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_1167F
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1167F:				; CODE XREF: sub_1164F+10j
					; sub_1164F+28j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_11661
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_1164F	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1169A	proc far		; CODE XREF: sub_114D4+1Cp
					; seg025:09E7p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_116D2
; ���������������������������������������������������������������������������

loc_116B4:				; CODE XREF: sub_1169A+47j
		lea	ax, [bp+var_4]
		push	ax
		push	di
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 6
		or	al, al
		jz	short loc_116D2
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_116D2:				; CODE XREF: sub_1169A+18j
					; sub_1169A+2Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_116B4
		mov	ax, 0FFFFh
		pop	di
		pop	si
		leave
		retf
sub_1169A	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_116EE	proc far		; CODE XREF: sub_4E541+14P
					; sub_4E5A6+1AP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_116EE	endp

; ���������������������������������������������������������������������������

loc_116F6:				; DATA XREF: dseg:0860o
		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [si+4]
		add	ax, [si+1Eh]
		mov	[bp-2],	ax
		mov	ax, [si+6]
		add	ax, [si+1Eh]
		mov	di, ax
		mov	ax, [si+8]
		sub	ax, [si+1Eh]
		mov	[bp-4],	ax
		push	si
		call	sub_F859
		add	sp, 2
		mov	word ptr [bp-0Ah], 0
		jmp	loc_117B4
; ���������������������������������������������������������������������������

loc_1172C:				; CODE XREF: seg025:03BCj
		mov	bx, [si+2Eh]
		mov	ax, [bx]
		add	ax, [bp-0Ah]
		mov	[bp-0Ch], ax
		push	word ptr [bp-0Ch]
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		push	cs
		call	near ptr sub_1164F
		add	sp, 4
		mov	[bp-0Eh], ax
		cmp	word ptr [si+2Ch], 0
		jz	short loc_11766
		mov	ax, [si+2Ch]
		cmp	ax, [bp-0Eh]
		jnz	short loc_11766
		mov	ax, word_45AE0
		mov	[bp-6],	ax
		mov	ax, word_45AFE
		mov	[bp-8],	ax
		jmp	short loc_11772
; ���������������������������������������������������������������������������

loc_11766:				; CODE XREF: seg025:034Ej seg025:0356j
		mov	ax, word_45B08
		mov	[bp-6],	ax
		mov	ax, word_45B02
		mov	[bp-8],	ax

loc_11772:				; CODE XREF: seg025:0364j
		mov	al, [bp-6]
		push	ax
		mov	ax, di
		add	ax, [si+20h]
		dec	ax
		push	ax
		push	word ptr [bp-4]
		push	di
		push	word ptr [bp-2]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		cmp	word ptr [bp-0Eh], 0
		jz	short loc_117AE
		push	word_45B54
		push	word ptr [bp-8]
		push	word ptr [bp-0Eh]
		push	di
		mov	ax, [bp-2]
		inc	ax
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah

loc_117AE:				; CODE XREF: seg025:0394j
		inc	word ptr [bp-0Ah]
		add	di, [si+20h]

loc_117B4:				; CODE XREF: seg025:0329j
		mov	ax, [si+30h]
		cmp	ax, [bp-0Ah]
		jle	short loc_117BF
		jmp	loc_1172C
; ���������������������������������������������������������������������������

loc_117BF:				; CODE XREF: seg025:03BAj
		mov	al, byte ptr word_45B0A
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B0A
		push	ax
		mov	ax, [si+0Ah]
		dec	ax
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B04
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		mov	ax, [si+6]
		inc	ax
		push	ax
		push	word ptr [si+8]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B04
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+0Ah]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_11840	proc far		; CODE XREF: sub_4C4A0+1AP
					; DATA XREF: dseg:0874o

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_4]
		sub	ax, [si+1Eh]
		cwd
		idiv	word ptr [si+20h]
		mov	di, ax
		mov	bx, [si+2Eh]
		mov	ax, [bx]
		add	ax, di
		mov	[bp+var_2], ax
		mov	ax, [si+22h]
		cmp	ax, [bp+var_2]
		jle	short loc_118CF
		mov	ax, [si+4]
		add	ax, [si+1Eh]
		mov	[bp+var_4], ax
		mov	ax, [si+6]
		add	ax, [si+1Eh]
		push	ax
		mov	ax, di
		imul	word ptr [si+20h]
		pop	dx
		add	dx, ax
		mov	[bp+var_6], dx
		mov	ax, [si+8]
		sub	ax, [si+1Eh]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		add	ax, [si+20h]
		dec	ax
		mov	[bp+var_A], ax
		push	[bp+var_2]
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		push	cs
		call	near ptr sub_1164F
		add	sp, 4
		mov	[bp+var_C], ax
		mov	ax, [si+2Ch]
		cmp	ax, [bp+var_C]
		jnz	short loc_118BF
		mov	bx, [si+32h]
		mov	word ptr [bx], 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_118C5
; ���������������������������������������������������������������������������

loc_118BF:				; CODE XREF: sub_11840+70j
		mov	ax, [bp+var_C]
		mov	[si+2Ch], ax

loc_118C5:				; CODE XREF: sub_11840+7Dj
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_118CF:				; CODE XREF: sub_11840+27j
		pop	di
		pop	si
		leave
		retf
sub_11840	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	word ptr [si+83h], 0
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+35h], 0
		jz	short loc_118F9
		push	si
		call	sub_DFCA
		add	sp, 2

loc_118F9:				; CODE XREF: seg025:04EEj
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_118FC	proc far		; CODE XREF: seg025:057Cp

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+79h], 0
		jz	short loc_11960
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_2], ax
		mov	di, ax
		push	word ptr [si+79h]
		call	sub_112C4
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [si+1Ah]
		sub	ax, di
		sub	ax, di
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_6]
		jge	short loc_11942
		mov	ax, [bp+var_6]
		sub	ax, [bp+var_4]
		sar	ax, 1
		add	di, ax

loc_11942:				; CODE XREF: sub_118FC+3Aj
		push	word_45B54
		push	0FFFFh
		push	word ptr [si+79h]
		mov	ax, [si+6]
		add	ax, [bp+var_2]
		push	ax
		mov	ax, [si+4]
		add	ax, di
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah

loc_11960:				; CODE XREF: sub_118FC+Fj
		pop	di
		pop	si
		leave
		retf
sub_118FC	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	sub_101C8
		add	sp, 2
		cmp	word ptr [si+79h], 0
		jz	short loc_11982
		push	si
		push	cs
		call	near ptr sub_118FC
		add	sp, 2

loc_11982:				; CODE XREF: seg025:0578j
		push	si
		nop
		push	cs
		call	near ptr sub_11CEF
		add	sp, 2
		push	si
		call	sub_D998
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		jmp	short loc_119AF
; ���������������������������������������������������������������������������

loc_119A4:				; CODE XREF: seg025:05B3j
		push	1
		push	si
		call	GaugeWidget_QueryAndFormat_E256
		add	sp, 4

loc_119AF:				; CODE XREF: seg025:05A2j
		cmp	word ptr [si+7Bh], 0
		jz	short loc_119A4
		mov	bx, [si+83h]
		cmp	word ptr [bx+2Ch], 0
		jz	short loc_119DA
		mov	bx, [si+83h]
		push	word ptr [bx+2Ch]
		push	di
		call	CRT_Strcpy
		add	sp, 4
		push	di
		call	CRT_Strupr
		add	sp, 2
		jmp	short loc_119DD
; ���������������������������������������������������������������������������

loc_119DA:				; CODE XREF: seg025:05BDj
		mov	byte ptr [di], 0

loc_119DD:				; CODE XREF: seg025:05D8j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	si, [bp+6]
		push	si
		call	GaugeWidget_AllocateRenderBufferWrapper_E0B7
		add	sp, 2
		mov	word ptr [bp-0Ah], 2
		mov	word ptr [bp-0Ch], 0Ah
		mov	ax, [si+1Ah]
		add	ax, 0FFFCh
		mov	[bp-0Eh], ax
		mov	ax, [si+1Ch]
		add	ax, 0FFE2h
		mov	[bp-10h], ax
		mov	ax, [bp-0Ah]
		mov	[bp-12h], ax
		mov	ax, [bp-0Ch]
		add	ax, [bp-10h]
		add	ax, 8
		mov	[bp-14h], ax
		mov	ax, [si+1Ah]
		add	ax, 0FFFCh
		mov	[bp-16h], ax
		mov	ax, [si+1Ch]
		sub	ax, [bp-14h]
		mov	[bp-18h], ax
		mov	ax, [bp-0Ah]
		add	ax, 0Bh
		mov	[bp-2],	ax
		mov	ax, [bp-0Ch]
		mov	[bp-4],	ax
		mov	ax, [bp-10h]
		mov	[bp-8],	ax
		mov	ax, [bp-0Eh]
		add	ax, 0FFF5h
		mov	[bp-6],	ax
		mov	ax, [bp-8]
		add	ax, 0FFFEh
		mov	bx, 8
		cwd
		idiv	bx
		mov	[si+75h], ax
		mov	ax, [bp-2]
		mov	[bp-1Ah], ax
		mov	ax, [bp-4]
		mov	[bp-1Ch], ax
		mov	ax, [bp-6]
		mov	[bp-1Eh], ax
		mov	ax, [bp-8]
		mov	[bp-20h], ax
		mov	ax, [si+75h]
		mov	[bp-22h], ax
		mov	ax, si
		add	ax, 73h	; 's'
		mov	[bp-24h], ax
		mov	ax, si
		add	ax, 7Bh	; '{'
		mov	[bp-26h], ax
		push	34h ; '4'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_11AFF
		push	word ptr [bp-20h]
		push	word ptr [bp-1Eh]
		push	word ptr [bp-1Ch]
		push	word ptr [bp-1Ah]
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 848h
		mov	word ptr [di+24h], 2BDh
		xor	ax, ax
		mov	[di+28h], ax
		mov	[di+26h], ax
		mov	word ptr [di+24h], 844h
		mov	word ptr [di+2Ah], 0
		mov	word ptr [di+2Ch], 0
		and	byte ptr [di+10h], 0FDh
		mov	word ptr [di+16h], 0
		mov	ax, [bp-22h]
		mov	[di+30h], ax
		mov	ax, [bp-26h]
		mov	[di+32h], ax
		mov	ax, [bp-24h]
		mov	[di+2Eh], ax
		mov	word ptr [di+1Eh], 2
		mov	word ptr [di+20h], 8
		mov	ax, di
		jmp	short loc_11B01
; ���������������������������������������������������������������������������

loc_11AFF:				; CODE XREF: seg025:069Ej
		mov	ax, di

loc_11B01:				; CODE XREF: seg025:06FDj
		mov	[si+83h], ax
		push	0
		push	word ptr [si+83h]
		push	si
		call	sub_E1FF
		add	sp, 6
		mov	ax, [bp-0Ah]
		mov	[bp-2],	ax
		mov	ax, [bp-0Ch]
		mov	[bp-4],	ax
		mov	word ptr [bp-6], 0Bh
		mov	ax, [bp-10h]
		mov	[bp-8],	ax
		push	0
		mov	ax, [bp-2]
		mov	[bp-28h], ax
		mov	ax, [bp-4]
		mov	[bp-2Ah], ax
		mov	ax, [bp-6]
		mov	[bp-2Ch], ax
		mov	ax, [bp-8]
		mov	[bp-2Eh], ax
		push	58h ; 'X'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-30h], ax
		or	ax, ax
		jz	short loc_11BAC
		push	word ptr [bp-2Eh]
		push	word ptr [bp-2Ch]
		push	word ptr [bp-2Ah]
		push	word ptr [bp-28h]
		push	word ptr [bp-30h]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp-30h]
		mov	word ptr [bx+0Eh], 2BA2h
		push	word ptr [bp-30h]
		call	sub_E96C
		add	sp, 2
		mov	bx, [bp-30h]
		mov	word ptr [bx+0Eh], 2BDEh
		mov	bx, [bp-30h]
		mov	byte ptr [bx+1Eh], 1
		mov	bx, [bp-30h]
		mov	ax, [bp-2Ch]
		mov	[bx+1Fh], ax
		mov	bx, [bp-30h]
		mov	ax, [bx+1Fh]
		add	ax, 0FFFEh
		mov	bx, [bp-30h]
		mov	[bx+45h], ax
		mov	ax, [bp-30h]
		jmp	short loc_11BAF
; ���������������������������������������������������������������������������

loc_11BAC:				; CODE XREF: seg025:0754j
		mov	ax, [bp-30h]

loc_11BAF:				; CODE XREF: seg025:07AAj
		mov	[si+7Dh], ax
		push	ax
		push	si
		call	sub_E1FF
		add	sp, 6
		push	word ptr [si+83h]
		mov	ax, si
		add	ax, 73h	; 's'
		push	ax
		push	word ptr [si+75h]
		push	word ptr [si+77h]
		push	word ptr [si+7Dh]
		mov	bx, [si+7Dh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+38h]
		add	sp, 0Ah
		mov	ax, [bp-12h]
		add	ax, [bp-16h]
		add	ax, 0FFE7h
		mov	[bp-2],	ax
		mov	ax, [bp-14h]
		mov	[bp-4],	ax
		mov	word ptr [bp-6], 18h
		mov	word ptr [bp-8], 0Ah
		mov	al, [si+72h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_11C03
		jmp	loc_11CBD
; ���������������������������������������������������������������������������

loc_11C03:				; CODE XREF: seg025:07FEj
		push	1
		mov	ax, [bp-2]
		mov	[bp-32h], ax
		mov	ax, [bp-4]
		mov	[bp-34h], ax
		mov	ax, [bp-6]
		mov	[bp-36h], ax
		mov	ax, [bp-8]
		mov	[bp-38h], ax
		mov	ax, si
		add	ax, 7Bh	; '{'
		mov	[bp-3Ah], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-3Ch], ax
		or	ax, ax
		jz	short loc_11CB0
		push	word ptr [bp-38h]
		push	word ptr [bp-36h]
		push	word ptr [bp-34h]
		push	word ptr [bp-32h]
		push	word ptr [bp-3Ch]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp-3Ch]
		mov	word ptr [bx+0Eh], 2B3Ah
		mov	bx, [bp-3Ch]
		mov	word ptr [bx+24h], 0
		push	2B36h
		push	word ptr [bp-3Ch]
		call	sub_10F3B
		add	sp, 4
		mov	bx, [bp-3Ch]
		mov	word ptr [bx+1Eh], 0
		mov	bx, [bp-3Ch]
		mov	word ptr [bx+20h], 0
		mov	bx, [bp-3Ch]
		mov	ax, word_45B02
		mov	[bx+28h], ax
		mov	bx, [bp-3Ch]
		mov	[bx+26h], ax
		mov	bx, [bp-3Ch]
		mov	word ptr [bx+22h], 0FFFFh
		mov	bx, [bp-3Ch]
		mov	word ptr [bx+0Eh], 2B6Eh
		mov	bx, [bp-3Ch]
		mov	ax, [bp-3Ah]
		mov	[bx+2Ah], ax
		mov	bx, [bp-3Ch]
		mov	word ptr [bx+2Ch], 1
		mov	ax, [bp-3Ch]
		jmp	short loc_11CB3
; ���������������������������������������������������������������������������

loc_11CB0:				; CODE XREF: seg025:0834j
		mov	ax, [bp-3Ch]

loc_11CB3:				; CODE XREF: seg025:08AEj
		push	ax
		push	si
		call	sub_E1FF
		add	sp, 6

loc_11CBD:				; CODE XREF: seg025:0800j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_11CC1	proc far		; CODE XREF: seg025:0946p seg025:0984p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+83h]
		mov	ax, si
		add	ax, 73h	; 's'
		push	ax
		push	word ptr [si+75h]
		push	word ptr [si+77h]
		push	word ptr [si+7Dh]
		mov	bx, [si+7Dh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+38h]
		add	sp, 0Ah
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_11CC1	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_11CEF	proc far		; CODE XREF: seg025:0585p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+83h], 0
		jz	short loc_11D0E
		push	word ptr [si+83h]
		mov	bx, [si+83h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_11D0E:				; CODE XREF: sub_11CEF+Cj
		pop	si
		pop	bp
		retf
sub_11CEF	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		mov	ax, [si+83h]
		add	ax, 24h	; '$'
		push	ax
		push	cs
		call	near ptr sub_114D4
		add	sp, 4
		or	al, al
		jz	short loc_11D34
		inc	word ptr [si+77h]

loc_11D34:				; CODE XREF: seg025:092Fj
		mov	ax, [si+77h]
		mov	[bp-2],	ax
		mov	bx, [si+83h]
		mov	ax, [bp-2]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_11CC1
		add	sp, 2
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		mov	ax, [si+83h]
		add	ax, 24h	; '$'
		push	ax
		push	cs
		call	near ptr sub_115F8
		add	sp, 4
		or	al, al
		jz	short loc_11D72
		dec	word ptr [si+77h]

loc_11D72:				; CODE XREF: seg025:096Dj
		mov	ax, [si+77h]
		mov	[bp-2],	ax
		mov	bx, [si+83h]
		mov	ax, [bp-2]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_11CC1
		add	sp, 2
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Ah]
		push	word ptr [bp+0Ch]
		push	di
		push	word ptr [bp+8]
		mov	ax, [si+83h]
		add	ax, 24h	; '$'
		push	ax
		push	cs
		call	near ptr sub_11566
		add	sp, 8
		or	al, al
		jz	short loc_11DB8
		add	[si+77h], di

loc_11DB8:				; CODE XREF: seg025:09B3j
		mov	ax, [si+77h]
		mov	[bp-2],	ax
		mov	bx, [si+83h]
		mov	ax, [bp-2]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_11CC1
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		mov	ax, [si+83h]
		add	ax, 24h	; '$'
		push	ax
		push	cs
		call	near ptr sub_1169A
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11DF3:				; DATA XREF: dseg:2B6Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_11E2F
		mov	word ptr [si+0Eh], 2B3Ah
		push	word ptr [si+24h]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_11E2F
		push	si
		call	sub_308
		add	sp, 2

loc_11E2F:				; CODE XREF: seg025:0A00j seg025:0A24j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11E33:				; DATA XREF: dseg:2B9Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_11E73
		mov	word ptr [si+0Eh], 2B3Ah
		push	word ptr [si+24h]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_11E71
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_11E71:				; CODE XREF: seg025:0A64j
		jmp	short $+2

loc_11E73:				; CODE XREF: seg025:0A40j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11E7B:				; DATA XREF: dseg:2BD2o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_11EA6
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_11EA4
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_11EA4:				; CODE XREF: seg025:0A97j
		jmp	short $+2

loc_11EA6:				; CODE XREF: seg025:0A88j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11EAE:				; DATA XREF: dseg:2C0Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_11ED9
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_11ED7
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_11ED7:				; CODE XREF: seg025:0ACAj
		jmp	short $+2

loc_11ED9:				; CODE XREF: seg025:0ABBj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11EE1:				; DATA XREF: dseg:2C1Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_11F1F
		mov	word ptr [si], 2C1Ah
		mov	word ptr [si], 2C26h
		cmp	byte ptr [si+6], 0
		jz	short loc_11F0B
		push	word ptr [si+4]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_11F0B:				; CODE XREF: seg025:0AFCj
		mov	word ptr [si+4], 0
		test	di, 1
		jz	short loc_11F1F
		push	si
		call	sub_308
		add	sp, 2

loc_11F1F:				; CODE XREF: seg025:0AEEj seg025:0B14j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_11F23:				; DATA XREF: dseg:2C26o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_11F5D
		mov	word ptr [si], 2C26h
		cmp	byte ptr [si+6], 0
		jz	short loc_11F49
		push	word ptr [si+4]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_11F49:				; CODE XREF: seg025:0B3Aj
		mov	word ptr [si+4], 0
		test	di, 1
		jz	short loc_11F5D
		push	si
		call	sub_308
		add	sp, 2

loc_11F5D:				; CODE XREF: seg025:0B30j seg025:0B52j
		pop	di
		pop	si
		pop	bp
		retf
seg025		ends
