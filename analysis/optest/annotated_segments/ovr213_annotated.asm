ovr213		segment	para public 'OVERLAY' use16
		assume cs:ovr213
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BF0B0	proc far		; CODE XREF: sub_42703J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_BF0B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BF0B8	proc far		; CODE XREF: sub_42708J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_BF0B8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BF0C0	proc far		; CODE XREF: sub_4270DJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_BF0C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BF0C8	proc far		; CODE XREF: sub_426F4J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	cx, cx
		mov	ax, [si+39h]
		or	ax, ax
		jz	short loc_BF0E7
		cmp	ax, 1
		jz	short loc_BF0F8
		cmp	ax, 2
		jz	short loc_BF14D
		jmp	short loc_BF15C
; ���������������������������������������������������������������������������

loc_BF0E7:				; CODE XREF: sub_BF0C8+11j
		cmp	dx, 30h	; '0'
		jl	short loc_BF0F6
		cmp	dx, 39h	; '9'
		jg	short loc_BF0F6
		mov	cx, 1
		jmp	short loc_BF0F8
; ���������������������������������������������������������������������������

loc_BF0F6:				; CODE XREF: sub_BF0C8+22j
					; sub_BF0C8+27j
		jmp	short loc_BF15C
; ���������������������������������������������������������������������������

loc_BF0F8:				; CODE XREF: sub_BF0C8+16j
					; sub_BF0C8+2Cj
		cmp	dx, 30h	; '0'
		jl	short loc_BF107
		cmp	dx, 39h	; '9'
		jg	short loc_BF107
		mov	cx, 1
		jmp	short loc_BF14B
; ���������������������������������������������������������������������������

loc_BF107:				; CODE XREF: sub_BF0C8+33j
					; sub_BF0C8+38j
		cmp	dx, 41h	; 'A'
		jl	short loc_BF116
		cmp	dx, 5Ah	; 'Z'
		jg	short loc_BF116
		mov	cx, 1
		jmp	short loc_BF14B
; ���������������������������������������������������������������������������

loc_BF116:				; CODE XREF: sub_BF0C8+42j
					; sub_BF0C8+47j
		cmp	dx, 61h	; 'a'
		jl	short loc_BF125
		cmp	dx, 7Ah	; 'z'
		jg	short loc_BF125
		mov	cx, 1
		jmp	short loc_BF14B
; ���������������������������������������������������������������������������

loc_BF125:				; CODE XREF: sub_BF0C8+51j
					; sub_BF0C8+56j
		cmp	dx, 2Eh	; '.'
		jz	short loc_BF148
		cmp	dx, 2Dh	; '-'
		jz	short loc_BF148
		cmp	dx, 3Ah	; ':'
		jz	short loc_BF148
		cmp	dx, 5Ch	; '\'
		jz	short loc_BF148
		cmp	dx, 2Ah	; '*'
		jz	short loc_BF148
		cmp	dx, 24h	; '$'
		jz	short loc_BF148
		cmp	dx, 5Fh	; '_'
		jnz	short loc_BF14B

loc_BF148:				; CODE XREF: sub_BF0C8+60j
					; sub_BF0C8+65j ...
		mov	cx, 1

loc_BF14B:				; CODE XREF: sub_BF0C8+3Dj
					; sub_BF0C8+4Cj ...
		jmp	short loc_BF15C
; ���������������������������������������������������������������������������

loc_BF14D:				; CODE XREF: sub_BF0C8+1Bj
		cmp	dx, 20h	; ' '
		jl	short loc_BF15A
		cmp	dx, 7Fh	; ''
		jge	short loc_BF15A
		mov	cx, 1

loc_BF15A:				; CODE XREF: sub_BF0C8+88j
					; sub_BF0C8+8Dj
		jmp	short $+2

loc_BF15C:				; CODE XREF: sub_BF0C8+1Dj
					; sub_BF0C8:loc_BF0F6j	...
		mov	ax, cx
		pop	si
		pop	bp
		retf
sub_BF0C8	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BF164	proc far		; CODE XREF: sub_426EAJ

var_4C		= word ptr -4Ch
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+33h], 0
		jz	short loc_BF17B
		mov	byte ptr [si+30h], 5Fh ; '_'
		jmp	short loc_BF17F
; ���������������������������������������������������������������������������

loc_BF17B:				; CODE XREF: sub_BF164+Fj
		mov	byte ptr [si+30h], 23h ; '#'

loc_BF17F:				; CODE XREF: sub_BF164+15j
		push	si
		call	sub_101C8
		add	sp, 2
		lea	ax, [bp+var_4C]
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp+var_2], dx
		cmp	word ptr [si+2Eh], 0FFFFh
		jz	short loc_BF1F8
		push	word ptr [si+1Eh]
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [si+2Eh]
		cmp	ax, [bp+var_4]
		jle	short loc_BF1BF
		mov	ax, [bp+var_4]
		mov	[si+2Eh], ax

loc_BF1BF:				; CODE XREF: sub_BF164+53j
		push	word ptr [si+2Eh]
		push	word ptr [si+1Eh]
		push	di
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	al, [si+30h]
		mov	bx, [si+2Eh]
		mov	[bx+di], al
		mov	bx, [si+2Eh]
		add	bx, di
		mov	byte ptr [bx+1], 0
		mov	ax, [bp+var_4]
		sub	ax, [si+2Eh]
		push	ax
		mov	ax, [si+1Eh]
		add	ax, [si+2Eh]
		push	ax
		push	di
		call	sub_2789
		add	sp, 6
		jmp	short loc_BF23B
; ���������������������������������������������������������������������������

loc_BF1F8:				; CODE XREF: sub_BF164+3Dj
		cmp	word ptr [si+22h], 0
		jz	short loc_BF213
		mov	bx, [si+22h]
		push	word ptr [bx]
		push	2B20h
		push	word ptr [si+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 6
		jmp	short loc_BF22F
; ���������������������������������������������������������������������������

loc_BF213:				; CODE XREF: sub_BF164+98j
		cmp	word ptr [si+24h], 0
		jz	short loc_BF22F
		mov	bx, [si+24h]
		push	large dword ptr	[bx]
		push	2B23h
		push	word ptr [si+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short $+2

loc_BF22F:				; CODE XREF: sub_BF164+ADj
					; sub_BF164+B3j
		push	word ptr [si+1Eh]
		push	di
		call	CRT_Strcpy
		add	sp, 4

loc_BF23B:				; CODE XREF: sub_BF164+92j
		mov	word ptr [si+31h], 0
		push	di
		call	sub_112C4
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jg	short loc_BF257
		jmp	loc_BF326
; ���������������������������������������������������������������������������

loc_BF257:				; CODE XREF: sub_BF164+EEj
		cmp	word ptr [si+2Eh], 0FFFFh
		jnz	short loc_BF299
		push	di
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		mov	[bp+var_6], ax
		jmp	short loc_BF288
; ���������������������������������������������������������������������������

loc_BF26C:				; CODE XREF: sub_BF164+130j
		mov	bx, [bp+var_6]
		mov	al, [bx+di]
		cbw
		mov	bx, ax
		mov	al, [bx+5F64h]
		cbw
		add	ax, 2
		sub	[bp+var_4], ax
		mov	bx, [bp+var_6]
		mov	byte ptr [bx+di], 0
		dec	[bp+var_6]

loc_BF288:				; CODE XREF: sub_BF164+106j
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jle	short loc_BF296
		cmp	[bp+var_6], 0
		jge	short loc_BF26C

loc_BF296:				; CODE XREF: sub_BF164+12Aj
		jmp	loc_BF326
; ���������������������������������������������������������������������������

loc_BF299:				; CODE XREF: sub_BF164+F7j
		mov	bx, [si+2Eh]
		add	bx, di
		mov	al, [bx+1]
		cbw
		mov	[bp+var_6], ax
		mov	bx, [si+2Eh]
		add	bx, di
		mov	byte ptr [bx+1], 0
		push	di
		call	sub_112C4
		add	sp, 2
		mov	[bp+var_8], ax
		mov	ax, [bp+var_8]
		cmp	ax, [bp+var_2]
		jle	short loc_BF2E5

loc_BF2C2:				; CODE XREF: sub_BF164+17Aj
		inc	word ptr [si+31h]
		mov	ax, [si+31h]
		mov	dx, di
		add	dx, ax
		push	dx
		call	sub_112C4
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jg	short loc_BF2C2
		add	di, [si+31h]
		jmp	short loc_BF326
; ���������������������������������������������������������������������������

loc_BF2E5:				; CODE XREF: sub_BF164+15Cj
		mov	ax, [si+2Eh]
		inc	ax
		mov	[bp+var_C], ax

loc_BF2EC:				; CODE XREF: sub_BF164+1BAj
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		inc	[bp+var_C]
		mov	bx, [bp+var_A]
		mov	al, byte ptr [bp+var_6]
		mov	[bx+di], al
		mov	bx, [bp+var_C]
		mov	al, [bx+di]
		cbw
		mov	[bp+var_6], ax
		mov	bx, [bp+var_C]
		mov	byte ptr [bx+di], 0
		push	di
		call	sub_112C4
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jl	short loc_BF2EC
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+di], 0

loc_BF326:				; CODE XREF: sub_BF164+F0j
					; sub_BF164:loc_BF296j	...
		push	si
		call	sub_F859
		add	sp, 2
		push	word_45B54
		push	0FFFFh
		push	di
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+6]
		push	ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+4]
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_BF164	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BF35F	proc far		; CODE XREF: sub_426E5J sub_BF3ED+3Ap	...

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
		mov	ax, [si+31h]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+4]
		add	dx, ax
		inc	dx
		mov	di, dx
		add	[bp+arg_2], 2

loc_BF383:				; CODE XREF: sub_BF35F+6Aj
		mov	bx, [si+1Eh]
		inc	[bp+var_2]
		mov	ax, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		cbw
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_BF39C
		jmp	short loc_BF3CB
; ���������������������������������������������������������������������������

loc_BF39C:				; CODE XREF: sub_BF35F+39j
		mov	ax, [si+2Eh]
		cmp	ax, [bp+var_2]
		jnz	short loc_BF3B5
		mov	al, [si+30h]
		push	ax
		call	PaletteScreen_LookupByteTable_11303
		add	sp, 2
		add	ax, 2
		add	di, ax

loc_BF3B5:				; CODE XREF: sub_BF35F+43j
		mov	al, byte ptr [bp+var_4]
		push	ax
		call	PaletteScreen_LookupByteTable_11303
		add	sp, 2
		add	ax, 2
		add	di, ax
		cmp	di, [bp+arg_2]
		jl	short loc_BF383

loc_BF3CB:				; CODE XREF: sub_BF35F+3Bj
		mov	ax, [bp+var_2]
		mov	[si+2Eh], ax
		mov	ax, [si+2Eh]
		cmp	ax, [si+20h]
		jle	short loc_BF3DF
		mov	ax, [si+20h]
		mov	[si+2Eh], ax

loc_BF3DF:				; CODE XREF: sub_BF35F+78j
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_BF35F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BF3ED	proc far		; CODE XREF: sub_426EFJ

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

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	[bp+arg_8], 0
		jz	short loc_BF402
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BF402:				; CODE XREF: sub_BF3ED+Fj
		push	di
		call	sub_F878
		add	sp, 2
		mov	word ptr [di+37h], 0
		mov	ax, [di+4]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [di+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr sub_BF35F
		add	sp, 4
		mov	[bp+arg_6], 0
		mov	[bp+var_6], 0

loc_BF437:				; CODE XREF: sub_BF3ED+36Aj
		push	5F58h
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte_48F78, 0
		jnz	short loc_BF46C
		push	5F58h
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BF46A
		push	5F5Fh
		push	5F58h
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_BF46A:				; CODE XREF: sub_BF3ED+6Bj
		jmp	short $+2

loc_BF46C:				; CODE XREF: sub_BF3ED+5Aj
		mov	al, byte_48F78
		mov	ah, 0
		or	ax, ax
		jz	short loc_BF4DF
		mov	ax, word_48F7A
		sar	ax, 1
		mov	[bp+var_2], ax
		mov	ax, word_48F7C
		mov	[bp+var_4], ax
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_BF492
		mov	[bp+arg_6], 1

loc_BF492:				; CODE XREF: sub_BF3ED+9Ej
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_BF4CB
		mov	[bp+arg_6], 0
		mov	ax, [di+4]
		cmp	ax, [bp+var_2]
		jg	short loc_BF4C1
		mov	ax, [di+6]
		cmp	ax, [bp+var_4]
		jg	short loc_BF4C1
		mov	ax, [di+8]
		cmp	ax, [bp+var_2]
		jl	short loc_BF4C1
		mov	ax, [di+0Ah]
		cmp	ax, [bp+var_4]
		jge	short loc_BF4CB

loc_BF4C1:				; CODE XREF: sub_BF3ED+BAj
					; sub_BF3ED+C2j ...
		mov	word ptr [di+37h], 1
		mov	[bp+var_6], 0FFFFh

loc_BF4CB:				; CODE XREF: sub_BF3ED+ADj
					; sub_BF3ED+D2j
		cmp	[bp+arg_6], 0
		jz	short loc_BF4DC
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr sub_BF35F
		add	sp, 4

loc_BF4DC:				; CODE XREF: sub_BF3ED+E2j
		jmp	loc_BF751
; ���������������������������������������������������������������������������

loc_BF4DF:				; CODE XREF: sub_BF3ED+86j
		mov	al, byte_48F7F
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_BF4EC
		jmp	loc_BF751
; ���������������������������������������������������������������������������

loc_BF4EC:				; CODE XREF: sub_BF3ED+FAj
		mov	ax, 0C00h
		int	21h		; DOS -	CLEAR KEYBOARD BUFFER
					; AL must be 01h, 06h, 07h, 08h, or 0Ah.
		mov	al, byte_48F80
		mov	ah, 0
		mov	[bp+arg_8], ax
		mov	[bp+var_A], 0
		push	word ptr [di+1Eh]
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_C], ax
		mov	bx, [bp+arg_8]
		cmp	bx, 4Fh	; 'O'
		jnz	short loc_BF517
		jmp	loc_BF659	; case 0x62
; ���������������������������������������������������������������������������

loc_BF517:				; CODE XREF: sub_BF3ED+125j
		jg	short loc_BF55D
		cmp	bx, 3Ah	; ':'
		jz	short loc_BF572	; case 0x55
		jg	short loc_BF54B
		cmp	bx, 1Dh
		jz	short loc_BF572	; case 0x55
		jg	short loc_BF539
		cmp	bx, 1
		jz	short loc_BF575
		cmp	bx, 0Eh
		jz	short loc_BF5AB
		cmp	bx, 1Ch
		jz	short loc_BF5A3
		jmp	loc_BF67B	; default
; ���������������������������������������������������������������������������

loc_BF539:				; CODE XREF: sub_BF3ED+138j
		cmp	bx, 2Ah	; '*'
		jz	short loc_BF572	; case 0x55
		cmp	bx, 36h	; '6'
		jz	short loc_BF572	; case 0x55
		cmp	bx, 38h	; '8'
		jz	short loc_BF572	; case 0x55
		jmp	loc_BF67B	; default
; ���������������������������������������������������������������������������

loc_BF54B:				; CODE XREF: sub_BF3ED+131j
		sub	bx, 42h		; switch 12 cases
		cmp	bx, 0Bh
		jbe	short loc_BF556
		jmp	loc_BF67B	; default
; ���������������������������������������������������������������������������

loc_BF556:				; CODE XREF: sub_BF3ED+164j
		shl	bx, 1
		jmp	cs:off_BF8AE[bx] ; switch jump
; ���������������������������������������������������������������������������

loc_BF55D:				; CODE XREF: sub_BF3ED:loc_BF517j
		sub	bx, 50h		; switch 43 cases
		cmp	bx, 2Ah	; '*'
		jbe	short loc_BF568
		jmp	loc_BF67B	; default
; ���������������������������������������������������������������������������

loc_BF568:				; CODE XREF: sub_BF3ED+176j
		shl	bx, 1
		jmp	cs:off_BF858[bx] ; switch jump
; ���������������������������������������������������������������������������

loc_BF56F:				; CODE XREF: sub_BF3ED+16Bj
					; DATA XREF: ovr213:off_BF8AEo
		jmp	loc_BF682	; case 0x42
; ���������������������������������������������������������������������������

loc_BF572:				; CODE XREF: sub_BF3ED+12Fj
					; sub_BF3ED+136j ...
		jmp	loc_BF682	; case 0x55
; ���������������������������������������������������������������������������

loc_BF575:				; CODE XREF: sub_BF3ED+13Dj
		mov	bx, [di+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_BF596
		mov	bx, [di+1Eh]
		xor	ax, ax
		mov	[di+2Eh], ax
		add	bx, ax
		mov	byte ptr [bx], 0
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_BF5A0
; ���������������������������������������������������������������������������

loc_BF596:				; CODE XREF: sub_BF3ED+18Ej
		mov	word ptr [di+37h], 1
		mov	[bp+var_6], 1

loc_BF5A0:				; CODE XREF: sub_BF3ED+1A7j
		jmp	loc_BF682
; ���������������������������������������������������������������������������

loc_BF5A3:				; CODE XREF: sub_BF3ED+147j
		mov	word ptr [di+37h], 1
		jmp	loc_BF682
; ���������������������������������������������������������������������������

loc_BF5AB:				; CODE XREF: sub_BF3ED+142j
		cmp	word ptr [di+2Eh], 0
		jle	short loc_BF5E2
		mov	si, [di+2Eh]
		jmp	short loc_BF5C4
; ���������������������������������������������������������������������������

loc_BF5B6:				; CODE XREF: sub_BF3ED+1DAj
		mov	bx, [di+1Eh]
		add	bx, si
		mov	al, [bx]
		mov	bx, [di+1Eh]
		mov	[bx+si-1], al
		inc	si

loc_BF5C4:				; CODE XREF: sub_BF3ED+1C7j
		cmp	si, [bp+var_C]
		jl	short loc_BF5B6
		dec	[bp+var_C]
		mov	bx, [di+1Eh]
		add	bx, [bp+var_C]
		mov	byte ptr [bx], 0
		dec	word ptr [di+2Eh]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_BF5E2:				; CODE XREF: sub_BF3ED+1C2j
		jmp	loc_BF682
; ���������������������������������������������������������������������������

loc_BF5E5:				; CODE XREF: sub_BF3ED+17Dj
					; DATA XREF: ovr213:off_BF858o
		cmp	[bp+var_C], 0	; case 0x53
		jle	short loc_BF619
		mov	si, [di+2Eh]
		jmp	short loc_BF5FE
; ���������������������������������������������������������������������������

loc_BF5F0:				; CODE XREF: sub_BF3ED+214j
		mov	bx, [di+1Eh]
		mov	al, [bx+si+1]
		mov	bx, [di+1Eh]
		add	bx, si
		mov	[bx], al
		inc	si

loc_BF5FE:				; CODE XREF: sub_BF3ED+201j
		cmp	si, [bp+var_C]
		jl	short loc_BF5F0
		dec	[bp+var_C]
		mov	bx, [di+1Eh]
		add	bx, [bp+var_C]
		mov	byte ptr [bx], 0
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_BF619:				; CODE XREF: sub_BF3ED+1FCj
		jmp	short loc_BF682
; ���������������������������������������������������������������������������

loc_BF61B:				; CODE XREF: sub_BF3ED+16Bj
					; sub_BF3ED+17Dj
					; DATA XREF: ...
		cmp	word ptr [di+2Eh], 0 ; case 0x48
		jle	short loc_BF624
		dec	word ptr [di+2Eh]

loc_BF624:				; CODE XREF: sub_BF3ED+232j
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_BF682
; ���������������������������������������������������������������������������

loc_BF630:				; CODE XREF: sub_BF3ED+16Bj
					; sub_BF3ED+17Dj
					; DATA XREF: ...
		mov	ax, [di+20h]	; case 0x4D
		dec	ax
		cmp	[di+2Eh], ax
		jge	short loc_BF63C
		inc	word ptr [di+2Eh]

loc_BF63C:				; CODE XREF: sub_BF3ED+24Aj
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_BF682
; ���������������������������������������������������������������������������

loc_BF648:				; CODE XREF: sub_BF3ED+16Bj
					; sub_BF3ED+17Dj
					; DATA XREF: ...
		mov	word ptr [di+2Eh], 0 ; case 0x47
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_BF682
; ���������������������������������������������������������������������������

loc_BF659:				; CODE XREF: sub_BF3ED+127j
					; sub_BF3ED+17Dj
					; DATA XREF: ...
		mov	ax, [bp+var_C]	; case 0x62
		mov	[di+2Eh], ax
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_BF682
; ���������������������������������������������������������������������������

loc_BF66B:				; CODE XREF: sub_BF3ED+17Dj
					; DATA XREF: ovr213:off_BF858o
		xor	word ptr [di+33h], 1 ; case 0x52
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_BF682
; ���������������������������������������������������������������������������

loc_BF67B:				; CODE XREF: sub_BF3ED+149j
					; sub_BF3ED+15Bj ...
		mov	[bp+var_A], 1	; default
		jmp	short $+2

loc_BF682:				; CODE XREF: sub_BF3ED:loc_BF56Fj
					; sub_BF3ED:loc_BF572j	...
		cmp	[bp+var_A], 0
		jnz	short loc_BF68B
		jmp	loc_BF751
; ���������������������������������������������������������������������������

loc_BF68B:				; CODE XREF: sub_BF3ED+299j
		mov	ax, [bp+arg_8]
		mov	[bp+var_E], ax
		cmp	byte_48F81, 0
		jz	short loc_BF69D
		add	[bp+var_E], 100h

loc_BF69D:				; CODE XREF: sub_BF3ED+2A9j
		mov	bx, [bp+var_E]
		mov	al, [bx+4ACEh]
		cbw
		mov	[bp+var_10], ax
		cmp	word ptr [di+35h], 0
		jz	short loc_BF6BE
		cmp	[bp+var_10], 61h ; 'a'
		jl	short loc_BF6BE
		cmp	[bp+var_10], 7Ah ; 'z'
		jg	short loc_BF6BE
		sub	[bp+var_10], 20h ; ' '

loc_BF6BE:				; CODE XREF: sub_BF3ED+2BFj
					; sub_BF3ED+2C5j ...
		push	[bp+var_10]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 4
		or	ax, ax
		jnz	short loc_BF6D2
		jmp	loc_BF751
; ���������������������������������������������������������������������������

loc_BF6D2:				; CODE XREF: sub_BF3ED+2E0j
		cmp	word ptr [di+33h], 0
		jz	short loc_BF71D
		mov	ax, [di+20h]
		dec	ax
		cmp	[di+2Eh], ax
		jl	short loc_BF6EA
		mov	ax, [di+20h]
		dec	ax
		mov	[di+2Eh], ax
		jmp	short loc_BF71B
; ���������������������������������������������������������������������������

loc_BF6EA:				; CODE XREF: sub_BF3ED+2F2j
		mov	ax, [di+20h]
		add	ax, 0FFFEh
		mov	dx, ax
		jmp	short loc_BF706
; ���������������������������������������������������������������������������

loc_BF6F4:				; CODE XREF: sub_BF3ED+31Cj
		mov	ax, dx
		add	ax, [di+1Eh]
		mov	bx, ax
		mov	al, [bx-1]
		mov	bx, [di+1Eh]
		add	bx, dx
		mov	[bx], al
		dec	dx

loc_BF706:				; CODE XREF: sub_BF3ED+305j
		cmp	[di+2Eh], dx
		jl	short loc_BF6F4
		mov	ax, [di+2Eh]
		inc	word ptr [di+2Eh]
		mov	bx, [di+1Eh]
		add	bx, ax
		mov	al, byte ptr [bp+var_10]
		mov	[bx], al

loc_BF71B:				; CODE XREF: sub_BF3ED+2FBj
		jmp	short loc_BF747
; ���������������������������������������������������������������������������

loc_BF71D:				; CODE XREF: sub_BF3ED+2E9j
		mov	ax, [di+20h]
		add	ax, 0FFFEh
		cmp	[di+2Eh], ax
		jl	short loc_BF731
		mov	ax, [di+20h]
		add	ax, 0FFFEh
		mov	[di+2Eh], ax

loc_BF731:				; CODE XREF: sub_BF3ED+339j
		cmp	word ptr [di+2Eh], 0
		jl	short loc_BF744
		mov	ax, [di+1Eh]
		add	ax, [di+2Eh]
		mov	dl, byte ptr [bp+var_10]
		mov	bx, ax
		mov	[bx], dl

loc_BF744:				; CODE XREF: sub_BF3ED+348j
		inc	word ptr [di+2Eh]

loc_BF747:				; CODE XREF: sub_BF3ED:loc_BF71Bj
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_BF751:				; CODE XREF: sub_BF3ED:loc_BF4DCj
					; sub_BF3ED+FCj ...
		cmp	word ptr [di+37h], 0
		jnz	short loc_BF75A
		jmp	loc_BF437
; ���������������������������������������������������������������������������

loc_BF75A:				; CODE XREF: sub_BF3ED+368j
		push	di
		call	sub_F859
		add	sp, 2
		mov	word ptr [di+2Eh], 0FFFFh
		cmp	word ptr [di+22h], 0
		jnz	short loc_BF777
		cmp	word ptr [di+24h], 0
		jnz	short loc_BF777
		jmp	loc_BF7FF
; ���������������������������������������������������������������������������

loc_BF777:				; CODE XREF: sub_BF3ED+37Fj
					; sub_BF3ED+385j
		cmp	[bp+var_6], 1
		jnz	short loc_BF7B6
		cmp	word ptr [di+22h], 0
		jz	short loc_BF798
		mov	bx, [di+22h]
		push	word ptr [bx]
		push	2B27h
		push	word ptr [di+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 6
		jmp	short loc_BF7B4
; ���������������������������������������������������������������������������

loc_BF798:				; CODE XREF: sub_BF3ED+394j
		cmp	word ptr [di+24h], 0
		jz	short loc_BF7B4
		mov	bx, [di+24h]
		push	large dword ptr	[bx]
		push	2B2Ah
		push	word ptr [di+1Eh]
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short $+2

loc_BF7B4:				; CODE XREF: sub_BF3ED+3A9j
					; sub_BF3ED+3AFj
		jmp	short loc_BF7FF
; ���������������������������������������������������������������������������

loc_BF7B6:				; CODE XREF: sub_BF3ED+38Ej
		cmp	word ptr [di+22h], 0
		jz	short loc_BF7D4
		mov	ax, [di+1Eh]
		mov	[bp+var_8], ax
		push	[bp+var_8]
		call	sub_1CBD
		add	sp, 2
		mov	bx, [di+22h]
		mov	[bx], ax
		jmp	short loc_BF7F6
; ���������������������������������������������������������������������������

loc_BF7D4:				; CODE XREF: sub_BF3ED+3CDj
		cmp	word ptr [di+24h], 0
		jz	short loc_BF7F6
		push	word ptr [di+1Eh]
		call	sub_1CBD
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	bx, [di+24h]
		mov	[bx], eax
		jmp	short $+2

loc_BF7F6:				; CODE XREF: sub_BF3ED+3E5j
					; sub_BF3ED+3EBj
		push	di
		nop
		push	cs
		call	near ptr sub_BF945
		add	sp, 2

loc_BF7FF:				; CODE XREF: sub_BF3ED+387j
					; sub_BF3ED:loc_BF7B4j
		cmp	[bp+var_6], 0
		jnz	short loc_BF841
		cmp	word ptr [di+22h], 0
		jz	short loc_BF81C
		mov	bx, [di+22h]
		push	word ptr [bx]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+3Ch]
		add	sp, 4
		jmp	short loc_BF841
; ���������������������������������������������������������������������������

loc_BF81C:				; CODE XREF: sub_BF3ED+41Cj
		cmp	word ptr [di+24h], 0
		jz	short loc_BF834
		mov	bx, [di+24h]
		push	large dword ptr	[bx]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+40h]
		add	sp, 6
		jmp	short loc_BF841
; ���������������������������������������������������������������������������

loc_BF834:				; CODE XREF: sub_BF3ED+433j
		push	word ptr [di+1Eh]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+38h]
		add	sp, 4

loc_BF841:				; CODE XREF: sub_BF3ED+416j
					; sub_BF3ED+42Dj ...
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		push	di
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_BF3ED	endp

; ���������������������������������������������������������������������������
off_BF858	dw offset loc_BF630	; DATA XREF: sub_BF3ED+17Dr
		dw offset loc_BF67B	; jump table for switch	statement
		dw offset loc_BF66B
		dw offset loc_BF5E5
		dw offset loc_BF67B
		dw offset loc_BF572
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF572
		dw offset loc_BF648
		dw offset loc_BF61B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF61B
		dw offset loc_BF67B
		dw offset loc_BF630
		dw offset loc_BF67B
		dw offset loc_BF659
		dw offset loc_BF630
		dw offset loc_BF67B
		dw offset loc_BF66B
		dw offset loc_BF5E5
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF572
off_BF8AE	dw offset loc_BF56F	; DATA XREF: sub_BF3ED+16Br
		dw offset loc_BF56F	; jump table for switch	statement
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF648
		dw offset loc_BF61B
		dw offset loc_BF67B
		dw offset loc_BF67B
		dw offset loc_BF61B
		dw offset loc_BF67B
		dw offset loc_BF630

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BF8C6	proc far		; CODE XREF: sub_426F9J sub_BF9B7+69p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+22h], 0
		jz	short loc_BF8FD
		mov	word ptr [bp+var_4], di
		push	word ptr [bp+var_4]
		call	sub_1CBD
		add	sp, 2
		mov	word ptr [bp+var_4+2], ax
		movsx	eax, word ptr [bp+var_4+2]
		push	eax
		push	si
		nop
		push	cs
		call	near ptr sub_BF9B7
		add	sp, 6
		jmp	short loc_BF941
; ���������������������������������������������������������������������������

loc_BF8FD:				; CODE XREF: sub_BF8C6+12j
		cmp	word ptr [si+24h], 0
		jz	short loc_BF928
		push	di
		call	sub_1CBD
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr sub_BF9B7
		add	sp, 6
		jmp	short loc_BF941
; ���������������������������������������������������������������������������

loc_BF928:				; CODE XREF: sub_BF8C6+3Bj
		push	word ptr [si+20h]
		push	di
		push	word ptr [si+1Eh]
		call	CRT_Strncpy_Pad
		add	sp, 6
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_BF941:				; CODE XREF: sub_BF8C6+35j
					; sub_BF8C6+60j
		pop	di
		pop	si
		leave
		retf
sub_BF8C6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BF945	proc far		; CODE XREF: sub_426E0J sub_BF3ED+40Cp ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+22h], 0
		jz	short loc_BF980
		mov	bx, [si+22h]
		movsx	eax, word ptr [bx]
		cmp	eax, [si+26h]
		jge	short loc_BF969
		mov	ax, [si+26h]
		mov	bx, [si+22h]
		mov	[bx], ax
		jmp	short loc_BF97E
; ���������������������������������������������������������������������������

loc_BF969:				; CODE XREF: sub_BF945+18j
		mov	bx, [si+22h]
		movsx	eax, word ptr [bx]
		cmp	eax, [si+2Ah]
		jle	short loc_BF97E
		mov	ax, [si+2Ah]
		mov	bx, [si+22h]
		mov	[bx], ax

loc_BF97E:				; CODE XREF: sub_BF945+22j
					; sub_BF945+2Fj
		jmp	short loc_BF9B4
; ���������������������������������������������������������������������������

loc_BF980:				; CODE XREF: sub_BF945+Bj
		cmp	word ptr [si+24h], 0
		jz	short loc_BF9B4
		mov	bx, [si+24h]
		mov	eax, [bx]
		cmp	eax, [si+26h]
		jge	short loc_BF99E
		mov	eax, [si+26h]
		mov	bx, [si+24h]
		mov	[bx], eax
		jmp	short loc_BF9B4
; ���������������������������������������������������������������������������

loc_BF99E:				; CODE XREF: sub_BF945+4Bj
		mov	bx, [si+24h]
		mov	eax, [bx]
		cmp	eax, [si+2Ah]
		jle	short loc_BF9B4
		mov	eax, [si+2Ah]
		mov	bx, [si+24h]
		mov	[bx], eax

loc_BF9B4:				; CODE XREF: sub_BF945:loc_BF97Ej
					; sub_BF945+3Fj ...
		pop	si
		pop	bp
		retf
sub_BF945	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BF9B7	proc far		; CODE XREF: sub_426FEJ sub_BF8C6+2Fp	...

var_10		= word ptr -10h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+22h], 0
		jz	short loc_BF9E3
		mov	bx, [si+22h]
		mov	ax, [bp+arg_2]
		mov	[bx], ax
		push	si
		push	cs
		call	near ptr sub_BF945
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_BFA26
; ���������������������������������������������������������������������������

loc_BF9E3:				; CODE XREF: sub_BF9B7+Ej
		cmp	word ptr [si+24h], 0
		jz	short loc_BFA07
		mov	bx, [si+24h]
		mov	eax, dword ptr [bp+arg_2]
		mov	[bx], eax
		push	si
		push	cs
		call	near ptr sub_BF945
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short loc_BFA26
; ���������������������������������������������������������������������������

loc_BFA07:				; CODE XREF: sub_BF9B7+30j
		push	large dword ptr	[bp+arg_2]
		push	2B2Eh
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_10]
		push	ax
		push	si
		push	cs
		call	near ptr sub_BF8C6
		add	sp, 4

loc_BFA26:				; CODE XREF: sub_BF9B7+2Aj
					; sub_BF9B7+4Ej
		pop	si
		leave
		retf
sub_BF9B7	endp

ovr213		ends
