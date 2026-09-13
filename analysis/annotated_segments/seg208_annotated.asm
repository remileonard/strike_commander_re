seg208		segment	byte public 'CODE' use16
		assume cs:seg208
		;org 5
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 117 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise les paramètres de
; calibration (Joystick_InitCalibrationDefaults_67B92) et lit les axes
; (Joystick_ReadAxesAndButtons_6638B, seg199).
; ==============================================================================================
Joystick_ReadAndScaleAxes_67835	proc far		; CODE XREF: seg201:0247P
					; InputSystem_InitAll_8F47A+68P

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp

loc_67836:
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di

loc_6783D:				; DATA XREF: seg216:off_6A526o
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_67855
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_67855

loc_67852:
		jmp	loc_678E4
; ���������������������������������������������������������������������������

loc_67855:				; CODE XREF: Joystick_ReadAndScaleAxes_67835+Dj
					; Joystick_ReadAndScaleAxes_67835+1Bj
		mov	al, byte_711FA
		mov	ah, 0
		or	ax, ax
		jz	short loc_67861
		jmp	loc_678E4
; ���������������������������������������������������������������������������

loc_67861:				; CODE XREF: Joystick_ReadAndScaleAxes_67835+27j
		push	large 0C0000h
		push	5DC4h
		call	CRT_Memset_Public
		add	sp, 6
		nop
		push	cs
		call	near ptr Joystick_InitCalibrationDefaults_67B92
		push	5DC4h

loc_6787A:
		push	word_72EA4
		call	Joystick_ReadAxesAndButtons_6638B
		xor	di, di
		jmp	short loc_678DA
; ���������������������������������������������������������������������������

loc_67887:				; CODE XREF: Joystick_ReadAndScaleAxes_67835+A8j
		mov	bx, di
		imul	bx, 6
		cmp	word ptr [bx+5DC4h], 0
		jnz	short loc_678A4

loc_67893:
		mov	bx, di
		imul	bx, 6
		cmp	word ptr [bx+5DC6h], 0
		jnz	short loc_678A4
		mov	ax, 1
		jmp	short loc_678A6
; ���������������������������������������������������������������������������

loc_678A4:				; CODE XREF: Joystick_ReadAndScaleAxes_67835+5Cj
					; Joystick_ReadAndScaleAxes_67835+68j
		xor	ax, ax

loc_678A6:				; CODE XREF: Joystick_ReadAndScaleAxes_67835+6Dj
		mov	[bp+var_1], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_678D4
		mov	bx, di
		imul	bx, 6
		mov	ax, [bx+5DC4h]
		cmp	ax, word_72EA4
		jnb	short loc_678D4
		mov	bx, di
		imul	bx, 6
		mov	ax, [bx+5DC6h]

loc_678C7:
		cmp	ax, word_72EA4
		jnb	short loc_678D4
		mov	byte ptr [di+5DD0h], 1
		jmp	short loc_678D9
; ���������������������������������������������������������������������������

loc_678D4:				; CODE XREF: Joystick_ReadAndScaleAxes_67835+78j
					; Joystick_ReadAndScaleAxes_67835+87j ...
		mov	byte ptr [di+5DD0h], 0

loc_678D9:				; CODE XREF: Joystick_ReadAndScaleAxes_67835+9Dj
		inc	di

loc_678DA:				; CODE XREF: Joystick_ReadAndScaleAxes_67835+50j
		cmp	di, 2
		jl	short loc_67887

loc_678DF:
		mov	byte_711FA, 1

loc_678E4:				; CODE XREF: Joystick_ReadAndScaleAxes_67835:loc_67852j
					; Joystick_ReadAndScaleAxes_67835+29j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Joystick_ReadAndScaleAxes_67835	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère l'objet (sub_338).
; ==============================================================================================
Joystick_ReleaseCalibration_678EA	proc far		; CODE XREF: InputSystem_ReleaseAll_8F5E0+66P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_678EB:
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]

loc_678F3:
		or	ax, ax
		jz	short loc_67904

loc_678F7:
		test	dx, 1
		jz	short loc_67904
		push	ax

loc_678FE:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_67904:				; CODE XREF: Joystick_ReleaseCalibration_678EA+Bj
					; Joystick_ReleaseCalibration_678EA+11j
		pop	bp
		retf
Joystick_ReleaseCalibration_678EA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe appelant Joystick_ReadButtonsOnly_663BD (seg199). Référencée depuis seg201.
; ==============================================================================================
Joystick_ReadButtonsWrapper_67906	proc far		; CODE XREF: seg201:00F0P
		push	bp
		mov	bp, sp
		call	Joystick_ReadButtonsOnly_663BD
		pop	bp
		retf
Joystick_ReadButtonsWrapper_67906	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, échantillonne les 2 axes du joystick (Joystick_ReadAxesAndButtons_6638B) et stocke les
; valeurs min/max courantes dans des tables indexées (0x5DC4/5DC6 → 0x5DF6/5DFA).
; ==============================================================================================
Joystick_SampleAxesToTable_67910	proc far		; CODE XREF: Joystick_UpdateCalibration_67B0D:loc_67B12p
					; Config_LoadAndApplySettings_8EEBC:loc_8F12AP	...
		push	bp
		mov	bp, sp
		push	5DC4h
		push	word_72EA4
		call	Joystick_ReadAxesAndButtons_6638B
		xor	dx, dx

loc_67921:
		jmp	short loc_67946
; ���������������������������������������������������������������������������

loc_67923:				; CODE XREF: Joystick_SampleAxesToTable_67910+39j
		mov	bx, dx
		imul	bx, 6
		mov	ax, [bx+5DC4h]
		mov	bx, dx
		shl	bx, 1
		mov	[bx+5DF6h], ax

loc_67934:
		mov	bx, dx
		imul	bx, 6
		mov	ax, [bx+5DC6h]
		mov	bx, dx

loc_6793F:
		shl	bx, 1

loc_67941:
		mov	[bx+5DFAh], ax
		inc	dx

loc_67946:				; CODE XREF: Joystick_SampleAxesToTable_67910:loc_67921j
		cmp	dx, 2
		jl	short loc_67923
		pop	bp
		retf
Joystick_SampleAxesToTable_67910	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, applique une zone morte centrée (word_72EA0) et une échelle (word_72E96), avec clamp
; symétrique (±word_72E90) — normalisation d'axe joystick classique.
; ==============================================================================================
Joystick_ApplyDeadzoneAndScale_6794D	proc far		; CODE XREF: Joystick_ComputeCalibratedAxes_67A77:loc_67A88p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_67950:
		mov	bx, [bp+arg_0]

loc_67953:
		cmp	bx, word_72EA0

loc_67957:
		jge	short loc_67987

loc_67959:
		mov	cx, bx
		sub	cx, word_72EA0

loc_6795F:
		mov	ax, cx
		cwd

loc_67962:
		idiv	word_72E96
		mov	bx, ax
		imul	word_72E96
		cmp	ax, cx
		jle	short loc_67971
		dec	bx

loc_67971:				; CODE XREF: Joystick_ApplyDeadzoneAndScale_6794D+21j
		mov	ax, word_72E90

loc_67974:
		neg	ax

loc_67976:
		cmp	ax, bx

loc_67978:
		jle	short loc_67981

loc_6797A:
		mov	ax, word_72E90
		neg	ax
		jmp	short loc_67983
; ���������������������������������������������������������������������������

loc_67981:				; CODE XREF: Joystick_ApplyDeadzoneAndScale_6794D:loc_67978j
					; Joystick_ApplyDeadzoneAndScale_6794D+5Cj ...
		mov	ax, bx

loc_67983:				; CODE XREF: Joystick_ApplyDeadzoneAndScale_6794D+32j
					; Joystick_ApplyDeadzoneAndScale_6794D+61j ...
		mov	bx, ax

loc_67985:
		jmp	short loc_679DE
; ���������������������������������������������������������������������������

loc_67987:				; CODE XREF: Joystick_ApplyDeadzoneAndScale_6794D:loc_67957j
		cmp	bx, word_72E9C
		jle	short loc_679B2
		mov	cx, bx
		sub	cx, word_72E9C
		mov	ax, cx
		cwd
		idiv	word_72E94
		mov	bx, ax
		imul	word_72E96
		cmp	ax, cx
		jge	short loc_679A5
		inc	bx

loc_679A5:				; CODE XREF: Joystick_ApplyDeadzoneAndScale_6794D+55j
		cmp	word_72E90, bx
		jge	short loc_67981
		mov	ax, word_72E90
		jmp	short loc_67983
; ���������������������������������������������������������������������������
		jmp	short loc_67981
; ���������������������������������������������������������������������������

loc_679B2:				; CODE XREF: Joystick_ApplyDeadzoneAndScale_6794D+3Ej
		cmp	word_72EA0, 0
		jnz	short loc_679DC
		mov	ax, bx
		sub	ax, word_72E84
		cwd
		idiv	word_72E94

loc_679C4:
		cmp	ax, word_72E90

loc_679C8:
		jle	short loc_679CF

loc_679CA:
		mov	ax, word_72E90
		jmp	short loc_67983
; ���������������������������������������������������������������������������

loc_679CF:				; CODE XREF: Joystick_ApplyDeadzoneAndScale_6794D:loc_679C8j
		mov	ax, bx

loc_679D1:
		sub	ax, word_72E84
		cwd

loc_679D6:
		idiv	word_72E94
		jmp	short loc_67983
; ���������������������������������������������������������������������������

loc_679DC:				; CODE XREF: Joystick_ApplyDeadzoneAndScale_6794D+6Aj
		xor	bx, bx

loc_679DE:				; CODE XREF: Joystick_ApplyDeadzoneAndScale_6794D:loc_67985j
		mov	ax, bx
		pop	bp
		retf
Joystick_ApplyDeadzoneAndScale_6794D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 136 lignes, NON DÉTAILLÉE — variante étendue de Joystick_ApplyDeadzoneAndScale_6794D
; pour le second axe.
; ==============================================================================================
Joystick_ApplyDeadzoneAndScaleB_679E2	proc far		; CODE XREF: Joystick_ComputeCalibratedAxes_67A77+28p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_679E5:
		mov	bx, [bp+arg_0]

loc_679E8:
		cmp	bx, word_72EA2
		jge	short loc_67A1C
		mov	cx, bx

loc_679F0:
		sub	cx, word_72EA2

loc_679F4:
		mov	ax, cx
		cwd

loc_679F7:
		idiv	word_72E9A
		mov	bx, ax

loc_679FD:
		imul	word_72E9A

loc_67A01:
		cmp	ax, cx
		jle	short loc_67A06
		dec	bx

loc_67A06:				; CODE XREF: Joystick_ApplyDeadzoneAndScaleB_679E2+21j
		mov	ax, word_72E92
		neg	ax
		cmp	ax, bx
		jle	short loc_67A16
		mov	ax, word_72E92

loc_67A12:
		neg	ax

loc_67A14:
		jmp	short loc_67A18
; ���������������������������������������������������������������������������

loc_67A16:				; CODE XREF: Joystick_ApplyDeadzoneAndScaleB_679E2+2Bj
					; Joystick_ApplyDeadzoneAndScaleB_679E2+5Cj ...
		mov	ax, bx

loc_67A18:				; CODE XREF: Joystick_ApplyDeadzoneAndScaleB_679E2:loc_67A14j
					; Joystick_ApplyDeadzoneAndScaleB_679E2:loc_67A43j	...
		mov	bx, ax
		jmp	short loc_67A73
; ���������������������������������������������������������������������������

loc_67A1C:				; CODE XREF: Joystick_ApplyDeadzoneAndScaleB_679E2+Aj
		cmp	bx, word_72E9E

loc_67A20:
		jle	short loc_67A47

loc_67A22:
		mov	cx, bx
		sub	cx, word_72E9E

loc_67A28:
		mov	ax, cx
		cwd

loc_67A2B:
		idiv	word_72E98
		mov	bx, ax

loc_67A31:
		imul	word_72E9A

loc_67A35:
		cmp	ax, cx
		jge	short loc_67A3A

loc_67A39:
		inc	bx

loc_67A3A:				; CODE XREF: Joystick_ApplyDeadzoneAndScaleB_679E2+55j
		cmp	word_72E92, bx
		jge	short loc_67A16

loc_67A40:
		mov	ax, word_72E92

loc_67A43:
		jmp	short loc_67A18
; ���������������������������������������������������������������������������
		jmp	short loc_67A16
; ���������������������������������������������������������������������������

loc_67A47:				; CODE XREF: Joystick_ApplyDeadzoneAndScaleB_679E2:loc_67A20j
		cmp	word_72EA2, 0
		jnz	short loc_67A71

loc_67A4E:
		mov	ax, bx

loc_67A50:
		sub	ax, word_72E86

loc_67A54:
		cwd

loc_67A55:
		idiv	word_72E98
		cmp	ax, word_72E92
		jle	short loc_67A64
		mov	ax, word_72E92
		jmp	short loc_67A18
; ���������������������������������������������������������������������������

loc_67A64:				; CODE XREF: Joystick_ApplyDeadzoneAndScaleB_679E2+7Bj
		mov	ax, bx
		sub	ax, word_72E86
		cwd
		idiv	word_72E98
		jmp	short loc_67A18
; ���������������������������������������������������������������������������

loc_67A71:				; CODE XREF: Joystick_ApplyDeadzoneAndScaleB_679E2+6Aj
		xor	bx, bx

loc_67A73:				; CODE XREF: Joystick_ApplyDeadzoneAndScaleB_679E2+38j
		mov	ax, bx
		pop	bp
		retf
Joystick_ApplyDeadzoneAndScaleB_679E2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Joystick_ApplyDeadzoneAndScale_6794D et Joystick_ApplyDeadzoneAndScaleB_679E2 —
; calcule les deux axes calibrés finaux.
; ==============================================================================================
Joystick_ComputeCalibratedAxes_67A77	proc far		; CODE XREF: Joystick_UpdateCalibration_67B0D:loc_67B22p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_67A7E:
		mov	bx, si
		imul	bx, 6

loc_67A83:
		push	word ptr [bx+5DC4h]
		push	cs

loc_67A88:
		call	near ptr Joystick_ApplyDeadzoneAndScale_6794D
		pop	cx
		mov	bx, si
		imul	bx, 6
		mov	[bx+5DC4h], ax
		mov	bx, si
		imul	bx, 6
		push	word ptr [bx+5DC6h]
		push	cs
		call	near ptr Joystick_ApplyDeadzoneAndScaleB_679E2
		pop	cx
		mov	bx, si
		imul	bx, 6
		mov	[bx+5DC6h], ax
		pop	si
		pop	bp
		retf
Joystick_ComputeCalibratedAxes_67A77	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	al, [bp+6]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+5DD0h], 0
		jz	short loc_67ADA

loc_67AC0:
		mov	al, [bp+6]
		push	ax
		nop
		push	cs

loc_67AC6:
		call	near ptr Joystick_UpdateCalibration_67B0D
		pop	cx
		mov	al, [bp+6]
		mov	ah, 0
		imul	ax, 6
		mov	bx, ax
		mov	ax, [bx+5DC4h]
		jmp	short loc_67ADC
; ���������������������������������������������������������������������������

loc_67ADA:				; CODE XREF: seg208:028Ej
		xor	ax, ax

loc_67ADC:				; CODE XREF: seg208:02A8j
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	al, [bp+6]

loc_67AE4:
		mov	ah, 0
		mov	bx, ax

loc_67AE8:
		cmp	byte ptr [bx+5DD0h], 0
		jz	short loc_67B09

loc_67AEF:
		mov	al, [bp+6]

loc_67AF2:
		push	ax
		nop
		push	cs

loc_67AF5:
		call	near ptr Joystick_UpdateCalibration_67B0D
		pop	cx
		mov	al, [bp+6]
		mov	ah, 0
		imul	ax, 6

loc_67B01:
		mov	bx, ax

loc_67B03:
		mov	ax, [bx+5DC4h]

loc_67B07:
		jmp	short loc_67B0B
; ���������������������������������������������������������������������������

loc_67B09:				; CODE XREF: seg208:02BDj
		xor	ax, ax

loc_67B0B:				; CODE XREF: seg208:loc_67B07j
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Joystick_SampleAxesToTable_67910 et Joystick_ComputeCalibratedAxes_67A77 —
; cycle de mise à jour de calibration.
; ==============================================================================================
Joystick_UpdateCalibration_67B0D	proc far		; CODE XREF: Mouse_QueryReset+8P
					; Input_ReadAxis1Deadzone+56P ...

arg_0		= byte ptr  6

		push	bp

loc_67B0E:
		mov	bp, sp
		push	si
		push	cs

loc_67B12:
		call	near ptr Joystick_SampleAxesToTable_67910
		xor	si, si
		jmp	short loc_67B27
; ���������������������������������������������������������������������������

loc_67B19:				; CODE XREF: Joystick_UpdateCalibration_67B0D+1Dj
		cmp	byte ptr [si+5DD0h], 0
		jz	short loc_67B26
		push	si
		push	cs

loc_67B22:
		call	near ptr Joystick_ComputeCalibratedAxes_67A77
		pop	cx

loc_67B26:				; CODE XREF: Joystick_UpdateCalibration_67B0D+11j
		inc	si

loc_67B27:				; CODE XREF: Joystick_UpdateCalibration_67B0D+Aj
		cmp	si, 2
		jl	short loc_67B19

loc_67B2C:
		mov	al, [bp+arg_0]
		mov	ah, 0

loc_67B31:
		imul	ax, 6
		add	ax, 5DC4h

loc_67B37:
		pop	si
		pop	bp
		retf
Joystick_UpdateCalibration_67B0D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Joystick_UpdateCalibration_67B0D et sub_3FD (formatage) ×2. Référencée par les
; clusters ConfigOption (seg201) et TextScroll (seg204).
; ==============================================================================================
Joystick_FormatCalibrationDisplay_67B3A	proc far		; CODE XREF: seg201:loc_66843P
					; ConfigOption_ApplyAndDisplayB_6698F:loc_66999P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_67B3D:
		push	si

loc_67B3E:
		mov	si, [bp+arg_0]

loc_67B41:
		push	0
		push	cs

loc_67B44:
		call	near ptr Joystick_UpdateCalibration_67B0D
		pop	cx
		push	ds
		push	si
		push	ds
		push	offset unk_72E74
		mov	cx, 6

loc_67B51:
		call	CRT_Fmemcpy
		mov	ax, si
		add	ax, 6
		push	ds
		push	ax
		push	ds

loc_67B5E:
		push	offset unk_72E7A

loc_67B61:
		mov	cx, 6

loc_67B64:
		call	CRT_Fmemcpy
		pop	si
		pop	bp
		retf
Joystick_FormatCalibrationDisplay_67B3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, teste un bit de bouton (table 0x5DC8, indexée par arg_0, masquée par arg_2).
; Référencée directement par Player_MainUpdate (sub_13100).
; ==============================================================================================
Joystick_TestButtonMasked_67B6C	proc far		; CODE XREF: Player_MainUpdate+991P
					; Player_MainUpdate+ABCP ...

arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp

loc_67B6F:
		mov	al, [bp+arg_0]
		mov	ah, 0
		imul	ax, 6
		mov	bx, ax

loc_67B79:
		mov	al, [bx+5DC8h]
		and	al, [bp+arg_2]
		pop	bp
		retf
Joystick_TestButtonMasked_67B6C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un octet brut de bouton (table 0x5DD0). Référencée par sub_26F7E et
; TextRenderer_Main (sub_27477).
; ==============================================================================================
Joystick_GetButtonRawByte_67B82	proc far		; CODE XREF: Config_ReadCalibration+10AP
					; TextRenderer_Main+7D1P ...

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+5DD0h]
		pop	bp
		retf
Joystick_GetButtonRawByte_67B82	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise les paramètres de calibration par défaut (centre à 0x3FFF, min/max par
; défaut, échelles à 1). Appelée par Joystick_ReadAndScaleAxes_67835.
; ==============================================================================================
Joystick_InitCalibrationDefaults_67B92	proc far		; CODE XREF: Joystick_ReadAndScaleAxes_67835+3Fp
					; Config_LoadAndApplySettings_8EEBC:loc_8F09BP	...
		push	bp
		mov	bp, sp
		mov	word_72E84, 0
		mov	word_72E86, 0
		mov	word_72EA4, 3FFFh
		mov	ax, word_72EA4
		mov	word_72E8C, ax
		mov	ax, word_72EA4
		mov	word_72E8E, ax
		xor	ax, ax
		mov	word_72EA2, ax
		mov	word_72EA0, ax
		mov	word_72E94, 1

loc_67BC1:
		mov	word_72E98, 1
		pop	bp
		retf
Joystick_InitCalibrationDefaults_67B92	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, retourne la valeur minimale mesurée d'un axe (table 0x5DC4). Référencée directement
; par Player_MainUpdate et seg014.
; ==============================================================================================
Joystick_GetAxisMin_67BC9	proc far		; CODE XREF: Player_MainUpdate+9CEP
					; seg014:04BFP	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		imul	bx, 6
		mov	ax, [bx+5DC4h]
		pop	bp
		retf
Joystick_GetAxisMin_67BC9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, retourne la valeur maximale mesurée d'un axe (table 0x5DC6). Référencée directement
; par Player_MainUpdate et seg014.
; ==============================================================================================
Joystick_GetAxisMax_67BD8	proc far		; CODE XREF: Player_MainUpdate+9ADP
					; seg014:04CDP	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		imul	bx, 6

loc_67BE1:
		mov	ax, [bx+5DC6h]
		pop	bp
		retf
Joystick_GetAxisMax_67BD8	endp

; ���������������������������������������������������������������������������

loc_67BE7:
		push	bp
		mov	bp, sp
		mov	bx, [bp+6]
		shl	bx, 1

loc_67BEF:
		mov	ax, [bx+5DF6h]
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	bx, [bp+6]
		shl	bx, 1
		mov	ax, [bx+5DFAh]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, charge un échantillon de calibration (tables 0x5DF6/0x5DFA) dans les globales de
; travail (word_72E84/72E86). Référencée par sub_8EEBC et sub_8FDC0.
; ==============================================================================================
Joystick_LoadCalibrationSample_67C03	proc far		; CODE XREF: Config_LoadAndApplySettings_8EEBC+2A3P
					; Cockpit_LoadAndDrawCalibration_8FDC0+CEP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1

loc_67C0D:
		mov	ax, [bx+5DF6h]

loc_67C11:
		mov	word_72E84, ax
		mov	bx, dx
		shl	bx, 1

loc_67C18:
		mov	ax, [bx+5DFAh]
		mov	word_72E86, ax
		pop	bp
		retf
Joystick_LoadCalibrationSample_67C03	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, charge les extrêmes de calibration (tables 0x5DF6/0x5DFA) dans word_72E88/72E8A.
; Référencée par sub_8EEBC et sub_8FDC0.
; ==============================================================================================
Joystick_LoadCalibrationExtremes_67C21	proc far		; CODE XREF: Config_LoadAndApplySettings_8EEBC+3DDP
					; Cockpit_LoadAndDrawCalibration_8FDC0+1B8P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5DF6h]
		mov	word_72E88, ax

loc_67C32:
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5DFAh]

loc_67C3A:
		mov	word_72E8A, ax
		pop	bp
		retf
Joystick_LoadCalibrationExtremes_67C21	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 57 lignes, NON DÉTAILLÉE — calcul de ratio/interpolation de calibration.
; ==============================================================================================
Joystick_ComputeCalibrationRatio_67C3F	proc far		; CODE XREF: Config_LoadAndApplySettings_8EEBC+340P
					; Cockpit_LoadAndDrawCalibration_8FDC0+143P

arg_0		= word ptr  6

		push	bp

loc_67C40:
		mov	bp, sp

loc_67C42:
		mov	dx, [bp+arg_0]
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5DF6h]
		mov	word_72E8C, ax
		mov	bx, dx

loc_67C52:
		shl	bx, 1

loc_67C54:
		mov	ax, [bx+5DFAh]

loc_67C58:
		mov	word_72E8E, ax

loc_67C5B:
		mov	ax, word_72E8C

loc_67C5E:
		cmp	ax, word_72E8E

loc_67C62:
		jle	short loc_67C66
		jmp	short loc_67C69
; ���������������������������������������������������������������������������

loc_67C66:				; CODE XREF: Joystick_ComputeCalibrationRatio_67C3F:loc_67C62j
		mov	ax, word_72E8E

loc_67C69:				; CODE XREF: Joystick_ComputeCalibrationRatio_67C3F+25j
		movsx	eax, ax
		imul	eax, 0Bh

loc_67C71:
		mov	ebx, 0Ah
		cdq
		idiv	ebx

loc_67C7C:
		mov	word_72EA4, ax
		pop	bp

locret_67C80:
		retf
Joystick_ComputeCalibrationRatio_67C3F	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp

loc_67C84:
		mov	bx, [bp+6]
		mov	cx, [bp+8]
		mov	word_72E90, bx
		mov	word_72E92, cx
		xor	ax, ax
		mov	word_72EA2, ax
		mov	word_72EA0, ax
		mov	ax, word_72E8C
		sub	ax, word_72E84
		xor	dx, dx
		div	bx
		mov	word_72E94, ax
		mov	ax, word_72E8E
		sub	ax, word_72E86
		xor	dx, dx
		div	cx
		mov	word_72E98, ax
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 138 lignes, NON DÉTAILLÉE — interpole une valeur d'axe calibrée en pourcentage
; (division par 100, arithmétique 32 bits) entre les bornes min/max. Référencée par sub_8EEBC
; et sub_8FDC0.
; ==============================================================================================
Joystick_InterpolateCalibrationPercent_67CB8	proc far		; CODE XREF: Config_LoadAndApplySettings_8EEBC:loc_8F2C0P
					; Cockpit_LoadAndDrawCalibration_8FDC0+1DFP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_67CC3:
		mov	cx, [bp+arg_4]
		mov	word_72E90, si
		mov	word_72E92, di
		movsx	eax, cx

loc_67CD2:
		mov	dx, word_72E8C
		sub	dx, word_72E88
		movsx	edx, dx

loc_67CDE:
		imul	eax, edx
		mov	ebx, 64h ; 'd'
		cdq
		idiv	ebx
		mov	word_72E9C, ax

loc_67CF0:
		mov	ax, word_72E88

loc_67CF3:
		add	ax, word_72E9C
		mov	word_72E9C, ax
		movsx	eax, cx
		mov	dx, word_72E8E

loc_67D02:
		sub	dx, word_72E8A

loc_67D06:
		movsx	edx, dx

loc_67D0A:
		imul	eax, edx
		cdq

loc_67D10:
		idiv	ebx

loc_67D13:
		mov	word_72E9E, ax
		mov	ax, word_72E8A
		add	ax, word_72E9E
		mov	word_72E9E, ax

loc_67D20:
		mov	ax, word_72E8C

loc_67D23:
		sub	ax, word_72E9C
		cwd
		idiv	si
		mov	word_72E94, ax
		mov	ax, word_72E8E

loc_67D30:
		sub	ax, word_72E9E
		cwd
		idiv	di
		mov	word_72E98, ax

loc_67D3A:
		movsx	eax, cx
		mov	dx, word_72E88

loc_67D42:
		sub	dx, word_72E84

loc_67D46:
		movsx	edx, dx
		imul	eax, edx

loc_67D4E:
		cdq

loc_67D50:
		idiv	ebx

loc_67D53:
		mov	word_72EA0, ax
		mov	ax, word_72E88
		sub	ax, word_72EA0

loc_67D5D:
		mov	word_72EA0, ax

loc_67D60:
		movsx	eax, cx

loc_67D64:
		mov	dx, word_72E8A
		sub	dx, word_72E86
		movsx	edx, dx

loc_67D70:
		imul	eax, edx
		cdq

loc_67D76:
		idiv	ebx
		mov	word_72EA2, ax

loc_67D7C:
		mov	ax, word_72E8A
		sub	ax, word_72EA2

loc_67D83:
		mov	word_72EA2, ax
		mov	ax, word_72EA0
		sub	ax, word_72E84
		cwd
		idiv	si
		mov	word_72E96, ax
		mov	ax, word_72EA2
		sub	ax, word_72E86
		cwd
		idiv	di
		mov	word_72E9A, ax
		pop	di
		pop	si
		pop	bp
		retf
Joystick_InterpolateCalibrationPercent_67CB8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658, 1 octet) et réinitialise un compteur d'options (word_72E82).
; Référencée depuis seg201.
; ==============================================================================================
OptionCounter_Construct_67DA4	proc far		; CODE XREF: seg201:0027P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_67DBC
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_67DC2

loc_67DBC:				; CODE XREF: OptionCounter_Construct_67DA4+8j
		mov	word_72E82, 0

loc_67DC2:				; CODE XREF: OptionCounter_Construct_67DA4+16j
		mov	ax, dx
		pop	bp
		retf
OptionCounter_Construct_67DA4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère l'objet compteur d'options (sub_338). Référencée depuis seg201.
; ==============================================================================================
OptionCounter_Destruct_67DC6	proc far		; CODE XREF: seg201:loc_667F0P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_67DC7:
		mov	bp, sp
		mov	ax, [bp+arg_0]

loc_67DCC:
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_67DE0
		test	dx, 1
		jz	short loc_67DE0
		push	ax
		call	CRT_FreeNear_Wrap
		pop	cx

loc_67DE0:				; CODE XREF: OptionCounter_Destruct_67DC6+Bj
					; OptionCounter_Destruct_67DC6+11j
		pop	bp
		retf
OptionCounter_Destruct_67DC6	endp

; ���������������������������������������������������������������������������
		push	bp

loc_67DE3:
		mov	bp, sp
		mov	ax, word_72E82
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, écrit le compteur d'options (word_72E82). Référencée par
; ConfigOption_ConstructFull_66762 (seg201).
; ==============================================================================================
OptionCounter_Set_67DEA	proc far		; CODE XREF: ConfigOption_ConstructFull_66762+26P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]

loc_67DF0:
		mov	word_72E82, ax

loc_67DF3:
		pop	bp

locret_67DF4:
		retf
OptionCounter_Set_67DEA	endp

seg208		ends
