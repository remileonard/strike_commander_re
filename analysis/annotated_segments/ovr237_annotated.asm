ovr237		segment	para public 'OVERLAY' use16
		assume cs:ovr237
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Joystick_GetAxisMin_67BC9/GetAxisMax_67BD8/TestButtonMasked_67B6C (seg208) —
; lecture combinée des axes et boutons joystick.
; ==============================================================================================
Input_ReadJoystickButtons_7AC70	proc far		; CODE XREF: VROOMM_StubThunk_6AD40J

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_7AC73:
		sub	sp, 4

loc_7AC76:
		push	si

loc_7AC77:
		mov	si, [bp+arg_0]

loc_7AC7A:
		cmp	byte_722D4, 0
		jz	short loc_7ACC0
		push	0

loc_7AC83:
		call	Joystick_GetAxisMin_67BC9
		pop	cx
		sar	ax, 1
		mov	[bp+var_4], ax
		push	0
		call	Joystick_GetAxisMax_67BD8
		pop	cx
		sar	ax, 1
		mov	[bp+var_2], ax
		push	[bp+arg_2]
		push	[bp+var_4]
		push	ax
		push	si
		call	VROOMM_StubThunk_6ACBA
		add	sp, 8
		push	1
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jz	short loc_7ACC0
		mov	byte ptr [si+1BDh], 1

loc_7ACC0:				; CODE XREF: Input_ReadJoystickButtons_7AC70+Fj
					; Input_ReadJoystickButtons_7AC70+49j
		pop	si
		leave
		retf
Input_ReadJoystickButtons_7AC70	endp

ovr237		ends
