ovr238		segment	para public 'OVERLAY' use16
		assume cs:ovr238
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Joystick_TestButtonMasked_67B6C 4 fois (150 lignes) — teste plusieurs boutons
; joystick.
; ==============================================================================================
Input_ReadJoystickButtonsExtended_7ACD0	proc far		; CODE XREF: VROOMM_StubThunk_6AD70J

var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		push	1
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		mov	di, ax

loc_7ACF3:
		push	2
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		add	di, ax
		push	1
		push	1
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		shl	ax, 2
		add	di, ax
		push	2
		push	1
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		shl	ax, 2
		add	di, ax
		mov	[bp+var_4], di
		mov	bx, [bp+var_4]
		sub	bx, 3		; switch 13 cases
		cmp	bx, 0Ch
		ja	short loc_7ADAC	; default
		shl	bx, 1
		jmp	cs:off_7ADE2[bx] ; switch jump

loc_7AD3E:				; DATA XREF: ovr238:off_7ADE2o
		cmp	word ptr [si+18Dh], 0 ;	case 0xF
		jge	short loc_7AD47
		jmp	short loc_7AD5F
; ���������������������������������������������������������������������������

loc_7AD47:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+73j
		cmp	word ptr [si+18Dh], 10h
		jge	short loc_7AD52
		inc	word ptr [si+18Dh]

loc_7AD52:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+7Cj
					; Input_ReadJoystickButtonsExtended_7ACD0+95j ...
		mov	[bp+var_1], 1
		jmp	short loc_7ADAC	; default
; ���������������������������������������������������������������������������

loc_7AD58:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+69j
					; DATA XREF: ovr238:off_7ADE2o
		cmp	word ptr [si+18Dh], 0 ;	case 0x7
		jle	short loc_7AD67

loc_7AD5F:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+75j
		mov	word ptr [si+18Dh], 0
		jmp	short loc_7AD52
; ���������������������������������������������������������������������������

loc_7AD67:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+8Dj
		cmp	word ptr [si+18Dh], 0FFF0h
		jle	short loc_7AD52
		dec	word ptr [si+18Dh]
		jmp	short loc_7AD52
; ���������������������������������������������������������������������������
		jmp	short loc_7AD52
; ���������������������������������������������������������������������������

loc_7AD76:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+69j
					; DATA XREF: ovr238:off_7ADE2o
		cmp	word ptr [si+18Fh], 0 ;	case 0xB
		jge	short loc_7AD85

loc_7AD7D:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+CBj
		mov	word ptr [si+18Fh], 0
		jmp	short loc_7ADA8
; ���������������������������������������������������������������������������

loc_7AD85:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+ABj
		cmp	word ptr [si+18Fh], 10h
		jge	short loc_7ADA8
		inc	word ptr [si+18Fh]
		jmp	short loc_7ADA8
; ���������������������������������������������������������������������������
		jmp	short loc_7ADA8
; ���������������������������������������������������������������������������

loc_7AD94:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+69j
					; DATA XREF: ovr238:off_7ADE2o
		cmp	word ptr [si+18Fh], 0 ;	case 0x3
		jle	short loc_7AD9D
		jmp	short loc_7AD7D
; ���������������������������������������������������������������������������

loc_7AD9D:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+C9j
		cmp	word ptr [si+18Fh], 0FFF0h
		jle	short loc_7ADA8
		dec	word ptr [si+18Fh]

loc_7ADA8:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+B3j
					; Input_ReadJoystickButtonsExtended_7ACD0+BAj ...
		mov	[bp+var_2], 1

loc_7ADAC:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+65j
					; Input_ReadJoystickButtonsExtended_7ACD0+69j ...
		mov	al, [bp+var_1]	; default
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7ADBB
		mov	word ptr [si+18Dh], 0

loc_7ADBB:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+E3j
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7ADCA
		mov	word ptr [si+18Fh], 0

loc_7ADCA:				; CODE XREF: Input_ReadJoystickButtonsExtended_7ACD0+F2j
		push	[bp+arg_2]
		push	word ptr [si+18Fh]
		push	word ptr [si+18Dh]
		push	si
		call	VROOMM_StubThunk_6ACBA
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
Input_ReadJoystickButtonsExtended_7ACD0	endp

; ���������������������������������������������������������������������������
off_7ADE2	dw offset loc_7AD94	; DATA XREF: Input_ReadJoystickButtonsExtended_7ACD0+69r
		dw offset loc_7ADAC	; jump table for switch	statement
		dw offset loc_7ADAC
		dw offset loc_7ADAC
		dw offset loc_7AD58
		dw offset loc_7ADAC
		dw offset loc_7ADAC
		dw offset loc_7ADAC
		dw offset loc_7AD76
		dw offset loc_7ADAC
		dw offset loc_7ADAC
		dw offset loc_7ADAC
		dw offset loc_7AD3E

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Joystick_GetAxisMax_67BD8 (128 lignes).
; ==============================================================================================
Input_ReadJoystickAxisMax_7ADFC	proc far		; CODE XREF: VROOMM_StubThunk_6AD75J

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		push	1
		call	Joystick_GetAxisMax_67BD8
		pop	cx
		cwd
		idiv	word_6E475
		mov	[bp+var_6], ax
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		cmp	bx, 3		; switch 4 cases
		ja	short loc_7AE9E	; default
		shl	bx, 1
		jmp	cs:off_7AED3[bx] ; switch jump

loc_7AE30:				; DATA XREF: ovr238:off_7AED3o
		cmp	word ptr [si+18Dh], 0 ;	case 0x0
		jge	short loc_7AE39
		jmp	short loc_7AE51
; ���������������������������������������������������������������������������

loc_7AE39:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+39j
		cmp	word ptr [si+18Dh], 10h
		jge	short loc_7AE44
		inc	word ptr [si+18Dh]

loc_7AE44:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+42j
					; Input_ReadJoystickAxisMax_7ADFC+5Bj ...
		mov	[bp+var_1], 1
		jmp	short loc_7AE9E	; default
; ���������������������������������������������������������������������������

loc_7AE4A:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+2Fj
					; DATA XREF: ovr238:off_7AED3o
		cmp	word ptr [si+18Dh], 0 ;	case 0x2
		jle	short loc_7AE59

loc_7AE51:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+3Bj
		mov	word ptr [si+18Dh], 0
		jmp	short loc_7AE44
; ���������������������������������������������������������������������������

loc_7AE59:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+53j
		cmp	word ptr [si+18Dh], 0FFF0h
		jle	short loc_7AE44
		dec	word ptr [si+18Dh]
		jmp	short loc_7AE44
; ���������������������������������������������������������������������������
		jmp	short loc_7AE44
; ���������������������������������������������������������������������������

loc_7AE68:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+2Fj
					; DATA XREF: ovr238:off_7AED3o
		cmp	word ptr [si+18Fh], 0 ;	case 0x1
		jge	short loc_7AE77

loc_7AE6F:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+91j
		mov	word ptr [si+18Fh], 0
		jmp	short loc_7AE9A
; ���������������������������������������������������������������������������

loc_7AE77:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+71j
		cmp	word ptr [si+18Fh], 10h
		jge	short loc_7AE9A
		inc	word ptr [si+18Fh]

loc_7AE82:
		jmp	short loc_7AE9A
; ���������������������������������������������������������������������������
		jmp	short loc_7AE9A
; ���������������������������������������������������������������������������

loc_7AE86:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+2Fj
					; DATA XREF: ovr238:off_7AED3o
		cmp	word ptr [si+18Fh], 0 ;	case 0x3
		jle	short loc_7AE8F
		jmp	short loc_7AE6F
; ���������������������������������������������������������������������������

loc_7AE8F:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+8Fj
		cmp	word ptr [si+18Fh], 0FFF0h
		jle	short loc_7AE9A
		dec	word ptr [si+18Fh]

loc_7AE9A:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+79j
					; Input_ReadJoystickAxisMax_7ADFC+80j ...
		mov	[bp+var_2], 1

loc_7AE9E:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+2Bj
					; Input_ReadJoystickAxisMax_7ADFC+4Cj
		mov	al, [bp+var_1]	; default
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7AEAD
		mov	word ptr [si+18Dh], 0

loc_7AEAD:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+A9j
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7AEBC
		mov	word ptr [si+18Fh], 0

loc_7AEBC:				; CODE XREF: Input_ReadJoystickAxisMax_7ADFC+B8j
		push	[bp+arg_2]
		push	word ptr [si+18Fh]
		push	word ptr [si+18Dh]
		push	si
		call	VROOMM_StubThunk_6ACBA
		add	sp, 8
		pop	si
		leave
		retf
Input_ReadJoystickAxisMax_7ADFC	endp

; ���������������������������������������������������������������������������
off_7AED3	dw offset loc_7AE30	; DATA XREF: Input_ReadJoystickAxisMax_7ADFC+2Fr
		dw offset loc_7AE68	; jump table for switch	statement
		dw offset loc_7AE4A
		dw offset loc_7AE86
ovr238		ends
