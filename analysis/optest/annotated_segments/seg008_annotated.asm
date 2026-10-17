seg008		segment	byte public 'CODE' use16
		assume cs:seg008
		;org 4
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_6964:				; DATA XREF: seg170:00FEo
		push	bp
		mov	bp, sp
		cmp	dword_4442B, 0
		jz	short loc_698B
		cmp	byte_48E5D, 2
		jb	short loc_698B
		cmp	byte_48E5D, 0Bh
		ja	short loc_698B
		mov	eax, dword_4442B
		cmp	eax, [bp+6]
		jz	short loc_698B
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_698B:				; CODE XREF: seg008:000Dj seg008:0014j ...
		mov	al, byte_48E5D
		mov	ah, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_6994	proc far		; CODE XREF: seg008:00A4p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_48E5D
		mov	ah, 0
		mov	word_44423, ax
		push	1
		push	5E3Ch
		call	Keyboard_QueryAndDispatch_3E5C7
		add	sp, 4
		call	Keyboard_DrainBufferBIOS_3FA5E
		pop	si
		pop	bp
		retf
sub_6994	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_69B8	proc far		; CODE XREF: sub_5E851+173P
		push	bp
		mov	bp, sp
		push	64h ; 'd'
		push	140h
		call	TextScrollDisplay_RegisterEntries_3EBDD
		add	sp, 4
		call	TextScroll_ApplyHelperC_3EA08
		call	sub_3ECA5
		mov	word_44425, ax
		call	sub_3ECBD
		mov	word_44427, ax
		pop	bp
		retf
sub_69B8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_69DF	proc far		; CODE XREF: seg008:00ACp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_69DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_69E7	proc far		; CODE XREF: seg008:00C2p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		call	Joystick_UpdateCalibration_3F331
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_69E7	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		push	cs
		call	near ptr sub_6994
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_69DF
		add	sp, 2
		push	0
		call	sub_3F3A6
		add	sp, 2
		or	al, al
		jz	short loc_6A28
		push	si
		push	cs
		call	near ptr sub_69E7
		add	sp, 2

loc_6A28:				; CODE XREF: seg008:00BEj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		xor	si, si
		jmp	short loc_6A45
; ���������������������������������������������������������������������������

loc_6A33:				; CODE XREF: seg008:00E8j
		cmp	byte ptr [si+5E40h], 0
		jz	short loc_6A44
		mov	byte ptr [si+5E40h], 0
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_6A44:				; CODE XREF: seg008:00D8j
		inc	si

loc_6A45:				; CODE XREF: seg008:00D1j
		cmp	si, 2
		jl	short loc_6A33
		mov	ax, 0FFFFh
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_6A72
		les	bx, [bp+6]
		mov	bx, es:[bx]
		mov	byte ptr [bx+5E40h], 1
		les	bx, [bp+6]
		mov	word ptr es:[bx], 0FFFFh

loc_6A72:				; CODE XREF: seg008:00FDj
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	al, byte_48E5D
		mov	ah, 0
		mov	si, ax
		or	si, si
		jz	short loc_6A8A
		jmp	loc_6BF1
; ���������������������������������������������������������������������������

loc_6A8A:				; CODE XREF: seg008:0125j
		push	0
		call	sub_3F3A6
		add	sp, 2
		or	al, al
		jnz	short loc_6A9B
		jmp	loc_6B65
; ���������������������������������������������������������������������������

loc_6A9B:				; CODE XREF: seg008:0136j
		mov	eax, dword_48E6A
		add	eax, dword_48E6E
		cmp	eax, dword_47ABB
		ja	short loc_6AB0
		mov	ax, 1
		jmp	short loc_6AB2
; ���������������������������������������������������������������������������

loc_6AB0:				; CODE XREF: seg008:0149j
		xor	ax, ax

loc_6AB2:				; CODE XREF: seg008:014Ej
		or	al, al
		jnz	short loc_6AB9
		jmp	loc_6B65
; ���������������������������������������������������������������������������

loc_6AB9:				; CODE XREF: seg008:0154j
		mov	dword_48E6E, 5
		mov	eax, dword_47ABB
		mov	dword_48E6A, eax
		push	0
		call	Joystick_UpdateCalibration_3F331
		add	sp, 2
		push	2
		push	0
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	ah, 0
		shl	ax, 1
		push	ax
		push	1
		push	0
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	ah, 0
		pop	dx
		add	dx, ax
		mov	di, dx
		or	di, di
		jz	short loc_6B0C
		test	di, 1
		jz	short loc_6B07
		mov	si, 1Ch
		jmp	short loc_6B0A
; ���������������������������������������������������������������������������

loc_6B07:				; CODE XREF: seg008:01A0j
		mov	si, 1

loc_6B0A:				; CODE XREF: seg008:01A5j
		jmp	short loc_6B65
; ���������������������������������������������������������������������������

loc_6B0C:				; CODE XREF: seg008:019Aj
		push	0
		call	sub_3F3ED
		add	sp, 2
		mov	[bp-2],	ax
		push	0
		call	sub_3F3FC
		add	sp, 2
		mov	[bp-4],	ax
		cmp	word ptr [bp-2], 10h
		jle	short loc_6B31
		mov	si, 4Dh	; 'M'
		jmp	short loc_6B50
; ���������������������������������������������������������������������������

loc_6B31:				; CODE XREF: seg008:01CAj
		cmp	word ptr [bp-2], 0FFF0h
		jge	short loc_6B3C
		mov	si, 4Bh	; 'K'
		jmp	short loc_6B50
; ���������������������������������������������������������������������������

loc_6B3C:				; CODE XREF: seg008:01D5j
		cmp	word ptr [bp-4], 10h
		jle	short loc_6B47
		mov	si, 50h	; 'P'
		jmp	short loc_6B50
; ���������������������������������������������������������������������������

loc_6B47:				; CODE XREF: seg008:01E0j
		cmp	word ptr [bp-4], 0FFF0h
		jge	short loc_6B50
		mov	si, 48h	; 'H'

loc_6B50:				; CODE XREF: seg008:01CFj seg008:01DAj ...
		or	si, si
		jz	short loc_6B65
		mov	dword_48E6E, 1Eh
		mov	eax, dword_47ABB
		mov	dword_48E6A, eax

loc_6B65:				; CODE XREF: seg008:0138j seg008:0156j ...
		or	si, si
		jz	short loc_6B6C
		jmp	loc_6BF1
; ���������������������������������������������������������������������������

loc_6B6C:				; CODE XREF: seg008:0207j
		mov	byte ptr [bp-8], 0
		lea	ax, [bp-8]
		push	ax
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte ptr [bp-8], 3
		jnz	short loc_6BDD
		call	sub_3ECA5
		mov	di, ax
		call	sub_3ECBD
		mov	[bp-0Ah], ax
		mov	ax, word_44425
		add	ax, 60h	; '`'
		cmp	ax, di
		jge	short loc_6BA0
		mov	si, 4Dh	; 'M'
		jmp	short loc_6BCD
; ���������������������������������������������������������������������������

loc_6BA0:				; CODE XREF: seg008:0239j
		mov	ax, word_44425
		add	ax, 0FFA0h
		cmp	ax, di
		jle	short loc_6BAF
		mov	si, 4Bh	; 'K'
		jmp	short loc_6BCD
; ���������������������������������������������������������������������������

loc_6BAF:				; CODE XREF: seg008:0248j
		mov	ax, word_44427
		add	ax, 30h	; '0'
		cmp	ax, [bp-0Ah]
		jge	short loc_6BBF
		mov	si, 50h	; 'P'
		jmp	short loc_6BCD
; ���������������������������������������������������������������������������

loc_6BBF:				; CODE XREF: seg008:0258j
		mov	ax, word_44427
		add	ax, 0FFD0h
		cmp	ax, [bp-0Ah]
		jle	short loc_6BCD
		mov	si, 48h	; 'H'

loc_6BCD:				; CODE XREF: seg008:023Ej seg008:024Dj ...
		or	si, si
		jz	short loc_6BDB
		mov	word_44425, di
		mov	ax, [bp-0Ah]
		mov	word_44427, ax

loc_6BDB:				; CODE XREF: seg008:026Fj
		jmp	short loc_6BF1
; ���������������������������������������������������������������������������

loc_6BDD:				; CODE XREF: seg008:0220j
		cmp	byte ptr [bp-8], 2
		jnz	short loc_6BF1
		test	byte ptr [bp-7], 1
		jz	short loc_6BEE
		mov	si, 1Ch
		jmp	short loc_6BF1
; ���������������������������������������������������������������������������

loc_6BEE:				; CODE XREF: seg008:0287j
		mov	si, 1

loc_6BF1:				; CODE XREF: seg008:0127j seg008:0209j ...
		mov	ax, si
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

sub_6BFB	proc far		; CODE XREF: sub_502B+26DP
					; Input_Flush_CDDC+36P	...

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	di, word_47AB4
		mov	ax, word_47AB6
		mov	[bp+var_4], ax
		mov	eax, dword_48E62
		add	eax, dword_48E66
		cmp	eax, dword_47ABB
		ja	short loc_6C29
		mov	ax, 1
		jmp	short loc_6C2B
; ���������������������������������������������������������������������������

loc_6C29:				; CODE XREF: sub_6BFB+27j
		xor	ax, ax

loc_6C2B:				; CODE XREF: sub_6BFB+2Cj
		or	al, al
		jnz	short loc_6C32
		jmp	loc_6DA0
; ���������������������������������������������������������������������������

loc_6C32:				; CODE XREF: sub_6BFB+32j
		movsx	eax, word_4442F
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	dword_48E66, eax
		mov	eax, dword_47ABB
		mov	dword_48E62, eax
		push	0FFh
		push	[bp+arg_2]
		call	Keyboard_QueryAndDispatch_3E5C7
		add	sp, 4
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx+1], 1Ch
		jz	short loc_6C66
		jmp	loc_6CE5
; ���������������������������������������������������������������������������

loc_6C66:				; CODE XREF: sub_6BFB+66j
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx], 1
		jnz	short loc_6CA6
		mov	al, byte_44433
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6CA6
		mov	byte ptr [si], 1
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_A], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_A]
		mov	[si+2],	ax
		mov	ax, [bp+var_C]
		mov	[si+4],	ax
		mov	[bp+var_1], 1
		mov	byte_44433, 1
		jmp	short loc_6CE2
; ���������������������������������������������������������������������������

loc_6CA6:				; CODE XREF: sub_6BFB+71j sub_6BFB+7Aj
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx], 2
		jnz	short loc_6CE2
		cmp	byte_44433, 0
		jz	short loc_6CE2
		mov	byte ptr [si], 2
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_E], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_E]
		mov	[si+2],	ax
		mov	ax, [bp+var_10]
		mov	[si+4],	ax
		mov	byte_44433, 0
		mov	[bp+var_1], 1

loc_6CE2:				; CODE XREF: sub_6BFB+A9j sub_6BFB+B1j ...
		jmp	loc_6DA0
; ���������������������������������������������������������������������������

loc_6CE5:				; CODE XREF: sub_6BFB+68j
		cmp	byte_49760, 1
		jnz	short loc_6CFA
		cmp	[bp+var_4], 0
		jle	short loc_6CFA
		sub	[bp+var_4], 3
		mov	[bp+var_1], 1

loc_6CFA:				; CODE XREF: sub_6BFB+EFj sub_6BFB+F5j
		cmp	byte_49768, 1
		jnz	short loc_6D10
		cmp	[bp+var_4], 0C7h ; '�'
		jge	short loc_6D10
		add	[bp+var_4], 3
		mov	[bp+var_1], 1

loc_6D10:				; CODE XREF: sub_6BFB+104j
					; sub_6BFB+10Bj
		cmp	byte_49763, 1
		jnz	short loc_6D22
		or	di, di
		jle	short loc_6D22
		sub	di, 3
		mov	[bp+var_1], 1

loc_6D22:				; CODE XREF: sub_6BFB+11Aj
					; sub_6BFB+11Ej
		cmp	byte_49765, 1
		jnz	short loc_6D36
		cmp	di, 13Fh
		jge	short loc_6D36
		add	di, 3
		mov	[bp+var_1], 1

loc_6D36:				; CODE XREF: sub_6BFB+12Cj
					; sub_6BFB+132j
		cmp	[bp+var_1], 0
		jz	short loc_6D9A
		dec	word_4442F
		cmp	word_4442F, 1
		jg	short loc_6D4D
		mov	word_4442F, 1

loc_6D4D:				; CODE XREF: sub_6BFB+14Aj
		mov	byte ptr [si], 3
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_12], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_12]
		mov	[si+2],	ax
		mov	ax, [bp+var_14]
		mov	[si+4],	ax
		push	[bp+var_4]
		mov	ax, di
		shl	ax, 1
		push	ax
		call	TextScrollDisplay_RegisterEntries_3EBDD
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_16], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_18], ax
		push	[bp+var_18]
		push	[bp+var_16]
		push	0
		push	0
		call	TextScrollDisplayB_ApplyHelperB_3F704
		add	sp, 8
		jmp	short loc_6DA0
; ���������������������������������������������������������������������������

loc_6D9A:				; CODE XREF: sub_6BFB+13Fj
		mov	word_4442F, 5

loc_6DA0:				; CODE XREF: sub_6BFB+34j
					; sub_6BFB:loc_6CE2j ...
		cmp	byte_44433, 0
		jz	short loc_6DAF
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1

loc_6DAF:				; CODE XREF: sub_6BFB+1AAj
		mov	ax, 0C00h
		int	21h		; DOS -	CLEAR KEYBOARD BUFFER
					; AL must be 01h, 06h, 07h, 08h, or 0Ah.
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_6BFB	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_6DBF	proc far		; CODE XREF: sub_502B+257P
					; Input_Flush_CDDC+20P	...

var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	0
		call	sub_3F3A6
		add	sp, 2
		or	al, al
		jnz	short loc_6DDF
		jmp	loc_6FDF
; ���������������������������������������������������������������������������

loc_6DDF:				; CODE XREF: sub_6DBF+1Bj
		mov	di, word_47AB4
		mov	ax, word_47AB6
		mov	[bp+var_4], ax
		mov	eax, dword_48E6A
		add	eax, dword_48E6E
		cmp	eax, dword_47ABB
		ja	short loc_6DFE
		mov	ax, 1
		jmp	short loc_6E00
; ���������������������������������������������������������������������������

loc_6DFE:				; CODE XREF: sub_6DBF+38j
		xor	ax, ax

loc_6E00:				; CODE XREF: sub_6DBF+3Dj
		or	al, al
		jnz	short loc_6E07
		jmp	loc_6FDF
; ���������������������������������������������������������������������������

loc_6E07:				; CODE XREF: sub_6DBF+43j
		movsx	eax, word_44431
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	dword_48E6E, eax
		mov	eax, dword_47ABB
		mov	dword_48E6A, eax
		push	0
		call	Joystick_UpdateCalibration_3F331
		add	sp, 2
		mov	[bp+var_A], 0
		mov	[bp+var_C], 0
		push	1
		push	0
		call	Joystick_TestButtonMasked_3F390
		add	sp, 4
		mov	[bp+var_D], al
		cmp	[bp+var_D], 0
		jz	short loc_6E83
		mov	al, byte_44434
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6E83
		mov	byte ptr [si], 1
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_10], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_10]
		mov	[si+2],	ax
		mov	ax, [bp+var_12]
		mov	[si+4],	ax
		mov	[bp+var_1], 1
		mov	byte_44434, 1
		jmp	loc_6FDF
; ���������������������������������������������������������������������������

loc_6E83:				; CODE XREF: sub_6DBF+89j sub_6DBF+92j
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6EC3
		cmp	byte_44434, 0
		jz	short loc_6EC3
		mov	byte ptr [si], 2
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_14], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_16], ax
		mov	ax, [bp+var_14]
		mov	[si+2],	ax
		mov	ax, [bp+var_16]
		mov	[si+4],	ax
		mov	[bp+var_1], 1
		mov	byte_44434, 0
		jmp	loc_6FDF
; ���������������������������������������������������������������������������

loc_6EC3:				; CODE XREF: sub_6DBF+CBj sub_6DBF+D2j
		push	0
		call	sub_3F3ED
		add	sp, 2
		mov	[bp+var_C], ax
		push	0
		call	sub_3F3FC
		add	sp, 2
		mov	[bp+var_A], ax
		cmp	[bp+var_C], 0
		jnz	short loc_6EE9
		cmp	[bp+var_A], 0
		jz	short loc_6EEE

loc_6EE9:				; CODE XREF: sub_6DBF+122j
		mov	ax, 1
		jmp	short loc_6EF0
; ���������������������������������������������������������������������������

loc_6EEE:				; CODE XREF: sub_6DBF+128j
		xor	ax, ax

loc_6EF0:				; CODE XREF: sub_6DBF+12Dj
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_6EFC
		jmp	loc_6FD9
; ���������������������������������������������������������������������������

loc_6EFC:				; CODE XREF: sub_6DBF+138j
		cmp	[bp+var_C], 0
		jle	short loc_6F0D
		cmp	di, 13Fh
		jge	short loc_6F0D
		add	di, 3
		jmp	short loc_6F1A
; ���������������������������������������������������������������������������

loc_6F0D:				; CODE XREF: sub_6DBF+141j
					; sub_6DBF+147j
		cmp	[bp+var_C], 0
		jge	short loc_6F1A
		or	di, di
		jle	short loc_6F1A
		sub	di, 3

loc_6F1A:				; CODE XREF: sub_6DBF+14Cj
					; sub_6DBF+152j ...
		cmp	[bp+var_A], 0
		jle	short loc_6F2D
		cmp	[bp+var_4], 0C7h ; '�'
		jge	short loc_6F2D
		add	[bp+var_4], 3
		jmp	short loc_6F3D
; ���������������������������������������������������������������������������

loc_6F2D:				; CODE XREF: sub_6DBF+15Fj
					; sub_6DBF+166j
		cmp	[bp+var_A], 0
		jge	short loc_6F3D
		cmp	[bp+var_4], 0
		jle	short loc_6F3D
		sub	[bp+var_4], 3

loc_6F3D:				; CODE XREF: sub_6DBF+16Cj
					; sub_6DBF+172j ...
		mov	ax, [bp+var_C]
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_1A]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_1E]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_20], ax
		mov	ax, [bp+var_1C]
		cmp	ax, [bp+var_20]
		jle	short loc_6F6C
		mov	ax, [bp+var_1C]
		jmp	short loc_6F6F
; ���������������������������������������������������������������������������

loc_6F6C:				; CODE XREF: sub_6DBF+1A6j
		mov	ax, [bp+var_20]

loc_6F6F:				; CODE XREF: sub_6DBF+1ABj
		mov	[bp+var_18], ax
		mov	[bp+var_22], 4
		mov	ax, [bp+var_22]
		imul	[bp+var_18]
		mov	bx, 20h	; ' '
		cwd
		idiv	bx
		mov	dx, 5
		sub	dx, ax
		mov	word_44431, dx
		mov	byte ptr [si], 3
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_24], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_26], ax
		mov	ax, [bp+var_24]
		mov	[si+2],	ax
		mov	ax, [bp+var_26]
		mov	[si+4],	ax
		push	[bp+var_4]
		mov	ax, di
		shl	ax, 1
		push	ax
		call	TextScrollDisplay_RegisterEntries_3EBDD
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_28], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_2A], ax
		push	[bp+var_2A]
		push	[bp+var_28]
		push	0
		push	0
		call	TextScrollDisplayB_ApplyHelperB_3F704
		add	sp, 8
		jmp	short loc_6FDF
; ���������������������������������������������������������������������������

loc_6FD9:				; CODE XREF: sub_6DBF+13Aj
		mov	word_44431, 5

loc_6FDF:				; CODE XREF: sub_6DBF+1Dj sub_6DBF+45j ...
		cmp	byte_44434, 0
		jz	short loc_6FEE
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1

loc_6FEE:				; CODE XREF: sub_6DBF+225j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_6DBF	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_6FF9:				; DATA XREF: dseg:58D4o
		push	bp
		mov	bp, sp
		push	5E3Ah
		call	TextScrollDisplayB_ConstructAndReset_3F619
		add	sp, 2
		xor	eax, eax
		mov	dword_48E66, eax
		mov	dword_48E62, eax
		xor	eax, eax
		mov	dword_48E6E, eax
		mov	dword_48E6A, eax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_701F:				; DATA XREF: dseg:59A0o
		push	bp
		mov	bp, sp
		push	5E3Ah
		call	ResourceHandle_IsValid_3ED7F
		add	sp, 2
		pop	bp
		retf
seg008		ends
