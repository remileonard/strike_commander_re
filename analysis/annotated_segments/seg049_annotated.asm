seg049		segment	byte public 'CODE' use16
		assume cs:seg049
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,45L — vérifie qu'un timestamp (dword_6E477) correspond au mode d'entrée courant
; (byte_722D1 entre 2 et 0xB, plage joystick) et à une valeur attendue : validation du
; timestamp d'un événement d'entrée joystick.
; ==============================================================================================
Input_JoyTimestampValid	proc far		; CODE XREF: Player_MainUpdate+4EP
					; Player_MainUpdate+EDP ...

arg_0		= dword	ptr  6

		push	bp

loc_28643:
		mov	bp, sp

loc_28645:				; DATA XREF: seg216:0246o
		cmp	dword_6E477, 0
		jz	short loc_28669

loc_2864D:
		cmp	byte_722D1, 2

loc_28652:
		jb	short loc_28669

loc_28654:
		cmp	byte_722D1, 0Bh

loc_28659:
		ja	short loc_28669
		mov	eax, dword_6E477

loc_2865F:
		cmp	eax, [bp+arg_0]

loc_28663:
		jz	short loc_28669
		xor	ax, ax
		jmp	short loc_2866E
; ���������������������������������������������������������������������������

loc_28669:				; CODE XREF: Input_JoyTimestampValid+9j
					; Input_JoyTimestampValid:loc_28652j	...
		mov	al, byte_722D1
		mov	ah, 0

loc_2866E:				; CODE XREF: Input_JoyTimestampValid+25j
		pop	bp
		retf
Input_JoyTimestampValid	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,18L — enregistre le mode d'entrée courant (byte_722D1) et notifie l'UI (sub_66DA3, code
; 0x5220) puis calibre (sub_6823A) : notification de changement de mode de contrôleur +
; calibration.
; ==============================================================================================
Input_NotifyModeChange	proc far		; CODE XREF: Input_PointerConfigDispatch+9p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_722D1
		mov	ah, 0
		mov	word_6E46F, ax
		push	1
		push	5220h
		call	Keyboard_QueryAndDispatch_66DA3
		add	sp, 4
		call	Keyboard_DrainBufferBIOS_6823A
		pop	bp
		retf
Input_NotifyModeChange	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,15L — configure les bornes souris (0x640x0x140 probable) et lit sa position
; (sub_67481/sub_67499 → word_6E471/6E473) : initialisation souris + lecture position
; courante.
; ==============================================================================================
Mouse_InitAndRead	proc far		; CODE XREF: Input_ReadMouseAndAxes_7AAF0+166P
					; Cockpit_ProcessInputFrame_7F6EE:loc_7F750P	...
		push	bp
		mov	bp, sp
		push	large 640140h
		call	TextScrollDisplay_RegisterEntries_673B9
		add	sp, 4
		call	TextScroll_ApplyHelperC_671E4
		call	Input_GetCalibratedXValue_67481
		mov	word_6E471, ax
		call	Input_GetCalibratedYValue_67499
		mov	word_6E473, ax
		pop	bp
		retf
Mouse_InitAndRead	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,10L — accesseur trivial (identité), utilisé comme callback.
; ==============================================================================================
Input_IdAccessor	proc far		; CODE XREF: Input_PointerConfigDispatch+Fp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
Input_IdAccessor	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,13L — wrapper vers sub_67B0D(0) : requête pilote souris (probable reset bouton).
; ==============================================================================================
Mouse_QueryReset	proc far		; CODE XREF: Input_PointerConfigDispatch+21p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		call	Joystick_UpdateCalibration_67B0D
		pop	cx
		pop	bp
		retf
Mouse_QueryReset	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,31L — orchestre sub_28670 (notification mode), sub_286BA (id), et conditionne sub_286C2
; selon sub_67B82 (souris présente?) : dispatcher de configuration du périphérique de pointage
; actif.
; ==============================================================================================
Input_PointerConfigDispatch	proc far		; CODE XREF: Config_ReadCalibration+1CP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Input_NotifyModeChange
		pop	cx
		push	si
		push	cs
		call	near ptr Input_IdAccessor
		pop	cx
		push	0
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		or	al, al
		jz	short loc_286F7
		push	si
		push	cs
		call	near ptr Mouse_QueryReset
		pop	cx

loc_286F7:				; CODE XREF: Input_PointerConfigDispatch+1Dj
		pop	si
		pop	bp
		retf
Input_PointerConfigDispatch	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,29L — recherche un slot libre (2 max, flag à +0x5224) et le marque occupé : allocateur
; de slot de curseur/ressource pointeur (pool de 2).
; ==============================================================================================
Cursor_SlotAllocate	proc far		; CODE XREF: SubObject_Attach+10P
		push	bp
		mov	bp, sp
		push	si
		xor	si, si
		jmp	short loc_28713
; ���������������������������������������������������������������������������

loc_28702:				; CODE XREF: Cursor_SlotAllocate+1Cj
		cmp	byte ptr [si+5224h], 0
		jz	short loc_28712
		mov	byte ptr [si+5224h], 0
		mov	ax, si
		jmp	short loc_2871B
; ���������������������������������������������������������������������������

loc_28712:				; CODE XREF: Cursor_SlotAllocate+Dj
		inc	si

loc_28713:				; CODE XREF: Cursor_SlotAllocate+6j
		cmp	si, 2
		jl	short loc_28702
		mov	ax, 0FFFFh

loc_2871B:				; CODE XREF: Cursor_SlotAllocate+16j
		pop	si
		pop	bp
		retf
Cursor_SlotAllocate	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,19L — libère un slot précédemment alloué par sub_286FA (marque le flag +0x5224 à 0,
; invalide le handle 0xFFFF) : libération de slot curseur/pointeur.
; ==============================================================================================
Cursor_SlotFree	proc far		; CODE XREF: seg011:00D6P
					; AIEntity_Destruct_74E1C+27P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_2873A
		mov	bx, es:[bx]
		mov	byte ptr [bx+5224h], 1
		mov	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 0FFFFh

loc_2873A:				; CODE XREF: Cursor_SlotFree+Aj
		pop	bp
		retf
Cursor_SlotFree	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,210L — vérifie le mode joystick (byte_722D1), la souris présente (sub_67B82), accumule
; le déplacement (dword_722DE+dword_722E2) et compare à un seuil de zone morte (dword_711CD) :
; lecture d'axe joystick avec filtre de zone morte (deadzone), axe 1.
; ==============================================================================================
Input_ReadAxis1Deadzone	proc far		; CODE XREF: Cockpit_ProcessInputFrame_7F6EE:loc_7F818P

var_8		= word ptr -8

		push	bp
		mov	bp, sp

loc_2873F:
		sub	sp, 8
		push	si
		push	di
		mov	al, byte_722D1

loc_28747:
		mov	ah, 0
		mov	si, ax
		or	si, si
		jz	short loc_28752

loc_2874F:
		jmp	loc_288A0
; ���������������������������������������������������������������������������

loc_28752:				; CODE XREF: Input_ReadAxis1Deadzone+11j
		push	0

loc_28754:
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		or	al, al
		jnz	short loc_28761
		jmp	loc_2881E
; ���������������������������������������������������������������������������

loc_28761:				; CODE XREF: Input_ReadAxis1Deadzone+20j
		mov	eax, dword_722DE
		add	eax, dword_722E2
		cmp	eax, dword_711CD
		ja	short loc_28776
		mov	ax, 1
		jmp	short loc_28778
; ���������������������������������������������������������������������������

loc_28776:				; CODE XREF: Input_ReadAxis1Deadzone+33j
		xor	ax, ax

loc_28778:				; CODE XREF: Input_ReadAxis1Deadzone+38j
		or	al, al
		jnz	short loc_2877F
		jmp	loc_2881E
; ���������������������������������������������������������������������������

loc_2877F:				; CODE XREF: Input_ReadAxis1Deadzone+3Ej
		mov	dword_722E2, 5
		mov	eax, dword_711CD
		mov	dword_722DE, eax
		push	0
		call	Joystick_UpdateCalibration_67B0D
		pop	cx
		push	2
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		shl	ax, 1
		push	ax
		push	1
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		mov	dx, ax
		pop	ax
		add	ax, dx
		or	ax, ax
		jz	short loc_287CF
		test	ax, 1
		jz	short loc_287CA
		mov	si, 1Ch
		jmp	short loc_2881E
; ���������������������������������������������������������������������������

loc_287CA:				; CODE XREF: Input_ReadAxis1Deadzone+87j
		mov	si, 1
		jmp	short loc_2881E
; ���������������������������������������������������������������������������

loc_287CF:				; CODE XREF: Input_ReadAxis1Deadzone+82j
		push	0
		call	Joystick_GetAxisMin_67BC9
		pop	cx
		mov	di, ax
		push	0
		call	Joystick_GetAxisMax_67BD8
		pop	cx
		mov	dx, ax
		cmp	di, 10h
		jle	short loc_287ED
		mov	si, 4Dh	; 'M'
		jmp	short loc_28809
; ���������������������������������������������������������������������������

loc_287ED:				; CODE XREF: Input_ReadAxis1Deadzone+AAj
		cmp	di, 0FFF0h
		jge	short loc_287F7
		mov	si, 4Bh	; 'K'
		jmp	short loc_28809
; ���������������������������������������������������������������������������

loc_287F7:				; CODE XREF: Input_ReadAxis1Deadzone+B4j
		cmp	dx, 10h
		jle	short loc_28801
		mov	si, 50h	; 'P'
		jmp	short loc_28809
; ���������������������������������������������������������������������������

loc_28801:				; CODE XREF: Input_ReadAxis1Deadzone+BEj
		cmp	dx, 0FFF0h
		jge	short loc_28809
		mov	si, 48h	; 'H'

loc_28809:				; CODE XREF: Input_ReadAxis1Deadzone+AFj
					; Input_ReadAxis1Deadzone+B9j ...
		or	si, si
		jz	short loc_2881E
		mov	dword_722E2, 1Eh
		mov	eax, dword_711CD
		mov	dword_722DE, eax

loc_2881E:				; CODE XREF: Input_ReadAxis1Deadzone+22j
					; Input_ReadAxis1Deadzone+40j ...
		or	si, si
		jnz	short loc_288A0
		mov	byte ptr [bp+var_8], 0
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_67204
		pop	cx
		cmp	byte ptr [bp+var_8], 3
		jnz	short loc_2888C
		call	Input_GetCalibratedXValue_67481
		mov	di, ax

loc_2883D:
		call	Input_GetCalibratedYValue_67499
		mov	dx, ax
		mov	ax, word_6E471
		add	ax, 60h	; '`'
		cmp	ax, di
		jge	short loc_28853
		mov	si, 4Dh	; 'M'

loc_28851:
		jmp	short loc_2887E
; ���������������������������������������������������������������������������

loc_28853:				; CODE XREF: Input_ReadAxis1Deadzone+110j
		mov	ax, word_6E471
		add	ax, 0FFA0h
		cmp	ax, di
		jle	short loc_28862
		mov	si, 4Bh	; 'K'
		jmp	short loc_2887E
; ���������������������������������������������������������������������������

loc_28862:				; CODE XREF: Input_ReadAxis1Deadzone+11Fj
		mov	ax, word_6E473
		add	ax, 30h	; '0'
		cmp	ax, dx
		jge	short loc_28871
		mov	si, 50h	; 'P'
		jmp	short loc_2887E
; ���������������������������������������������������������������������������

loc_28871:				; CODE XREF: Input_ReadAxis1Deadzone+12Ej
		mov	ax, word_6E473
		add	ax, 0FFD0h
		cmp	ax, dx
		jle	short loc_2887E
		mov	si, 48h	; 'H'

loc_2887E:				; CODE XREF: Input_ReadAxis1Deadzone:loc_28851j
					; Input_ReadAxis1Deadzone+124j ...
		or	si, si
		jz	short loc_288A0
		mov	word_6E471, di
		mov	word_6E473, dx
		jmp	short loc_288A0
; ���������������������������������������������������������������������������

loc_2888C:				; CODE XREF: Input_ReadAxis1Deadzone+F8j
		cmp	byte ptr [bp+var_8], 2
		jnz	short loc_288A0
		test	byte ptr [bp+var_8+1], 1
		jz	short loc_2889D
		mov	si, 1Ch
		jmp	short loc_288A0
; ���������������������������������������������������������������������������

loc_2889D:				; CODE XREF: Input_ReadAxis1Deadzone+15Aj
		mov	si, 1

loc_288A0:				; CODE XREF: Input_ReadAxis1Deadzone:loc_2874Fj
					; Input_ReadAxis1Deadzone+E4j ...
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Input_ReadAxis1Deadzone	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,220L — variante de sub_2873C sur les globals dword_722D6/722DA (probable axe 2) :
; lecture d'axe joystick avec deadzone, axe 2 — appelée par Player_MainUpdate.
; ==============================================================================================
Input_ReadAxis2Deadzone	proc far		; CODE XREF: Player_MainUpdate+D21P
					; PaletteScreen_ComputeCurvePointA_A12FB+44P ...

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
		mov	di, word_711C6
		mov	ax, word_711C8
		mov	[bp+var_4], ax
		mov	eax, dword_722D6
		add	eax, dword_722DA
		cmp	eax, dword_711CD
		ja	short loc_288D4
		mov	ax, 1
		jmp	short loc_288D6
; ���������������������������������������������������������������������������

loc_288D4:				; CODE XREF: Input_ReadAxis2Deadzone+27j
		xor	ax, ax

loc_288D6:				; CODE XREF: Input_ReadAxis2Deadzone+2Cj
		or	al, al
		jnz	short loc_288DD
		jmp	loc_28A48
; ���������������������������������������������������������������������������

loc_288DD:				; CODE XREF: Input_ReadAxis2Deadzone+32j
		movsx	eax, word_6E47B
		mov	[bp+var_8], eax
		mov	dword_722DA, eax
		mov	eax, dword_711CD
		mov	dword_722D6, eax
		push	0FFh
		push	[bp+arg_2]
		call	Keyboard_QueryAndDispatch_66DA3
		add	sp, 4
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx+1], 1Ch
		jz	short loc_2890D
		jmp	loc_28990
; ���������������������������������������������������������������������������

loc_2890D:				; CODE XREF: Input_ReadAxis2Deadzone+62j
		cmp	byte ptr [bx], 1
		jnz	short loc_2894B
		mov	al, byte_6E47F
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2894B
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

loc_28943:
		mov	byte_6E47F, 1
		jmp	loc_28A48
; ���������������������������������������������������������������������������

loc_2894B:				; CODE XREF: Input_ReadAxis2Deadzone+6Aj
					; Input_ReadAxis2Deadzone+73j
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx], 2
		jz	short loc_28956

loc_28953:
		jmp	loc_28A48
; ���������������������������������������������������������������������������

loc_28956:				; CODE XREF: Input_ReadAxis2Deadzone+ABj
		cmp	byte_6E47F, 0
		jnz	short loc_28960

loc_2895D:
		jmp	loc_28A48
; ���������������������������������������������������������������������������

loc_28960:				; CODE XREF: Input_ReadAxis2Deadzone+B5j
		mov	byte ptr [si], 2

loc_28963:
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
		mov	byte_6E47F, 0
		mov	[bp+var_1], 1
		jmp	loc_28A48
; ���������������������������������������������������������������������������

loc_28990:				; CODE XREF: Input_ReadAxis2Deadzone+64j
		cmp	byte_72E10, 1
		jnz	short loc_289A5
		cmp	[bp+var_4], 0
		jle	short loc_289A5
		sub	[bp+var_4], 3
		mov	[bp+var_1], 1

loc_289A5:				; CODE XREF: Input_ReadAxis2Deadzone+EFj
					; Input_ReadAxis2Deadzone+F5j
		cmp	byte_72E18, 1
		jnz	short loc_289BB
		cmp	[bp+var_4], 0C7h ; '�'
		jge	short loc_289BB
		add	[bp+var_4], 3
		mov	[bp+var_1], 1

loc_289BB:				; CODE XREF: Input_ReadAxis2Deadzone+104j
					; Input_ReadAxis2Deadzone+10Bj
		cmp	byte_72E13, 1
		jnz	short loc_289CD
		or	di, di
		jle	short loc_289CD
		sub	di, 3
		mov	[bp+var_1], 1

loc_289CD:				; CODE XREF: Input_ReadAxis2Deadzone+11Aj
					; Input_ReadAxis2Deadzone+11Ej
		cmp	byte_72E15, 1
		jnz	short loc_289E1
		cmp	di, 13Fh
		jge	short loc_289E1
		add	di, 3
		mov	[bp+var_1], 1

loc_289E1:				; CODE XREF: Input_ReadAxis2Deadzone+12Cj
					; Input_ReadAxis2Deadzone+132j
		cmp	[bp+var_1], 0
		jz	short loc_28A42
		dec	word_6E47B
		cmp	word_6E47B, 1
		jg	short loc_289F8
		mov	word_6E47B, 1

loc_289F8:				; CODE XREF: Input_ReadAxis2Deadzone+14Aj
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
		call	TextScrollDisplay_RegisterEntries_673B9
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_16], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_18], ax
		push	ax
		push	[bp+var_16]
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_67EE0
		add	sp, 8
		jmp	short loc_28A48
; ���������������������������������������������������������������������������

loc_28A42:				; CODE XREF: Input_ReadAxis2Deadzone+13Fj
		mov	word_6E47B, 5

loc_28A48:				; CODE XREF: Input_ReadAxis2Deadzone+34j
					; Input_ReadAxis2Deadzone+A2j ...
		cmp	byte_6E47F, 0

loc_28A4D:
		jz	short loc_28A57
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1

loc_28A57:				; CODE XREF: Input_ReadAxis2Deadzone:loc_28A4Dj
		mov	ax, 0C00h
		int	21h		; DOS -	CLEAR KEYBOARD BUFFER
					; AL must be 01h, 06h, 07h, 08h, or 0Ah.
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Input_ReadAxis2Deadzone	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,266L — variante combinant vérification souris (sub_67B82) et lecture d'axes multiples
; (word_711C6/711C8) : lecture combinée des axes de contrôle (joystick/souris) — appelée par
; Player_MainUpdate, cœur du pilotage manuel du joueur.
; ==============================================================================================
Input_ReadCombinedAxes	proc far		; CODE XREF: Player_MainUpdate+D0DP
					; PaletteScreen_ComputeCurvePointA_A12FB+31P ...

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
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	0
		call	Joystick_GetButtonRawByte_67B82
		pop	cx
		or	al, al
		jnz	short loc_28A81
		jmp	loc_28C51
; ���������������������������������������������������������������������������

loc_28A81:				; CODE XREF: Input_ReadCombinedAxes+19j
		mov	di, word_711C6
		mov	ax, word_711C8
		mov	[bp+var_4], ax
		mov	eax, dword_722DE
		add	eax, dword_722E2
		cmp	eax, dword_711CD
		ja	short loc_28AA0
		mov	ax, 1
		jmp	short loc_28AA2
; ���������������������������������������������������������������������������

loc_28AA0:				; CODE XREF: Input_ReadCombinedAxes+36j
		xor	ax, ax

loc_28AA2:				; CODE XREF: Input_ReadCombinedAxes+3Bj
		or	al, al
		jnz	short loc_28AA9
		jmp	loc_28C51
; ���������������������������������������������������������������������������

loc_28AA9:				; CODE XREF: Input_ReadCombinedAxes+41j
		movsx	eax, word_6E47D
		mov	[bp+var_8], eax
		mov	dword_722E2, eax
		mov	eax, dword_711CD
		mov	dword_722DE, eax
		push	0
		call	Joystick_UpdateCalibration_67B0D
		pop	cx
		push	1
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	dl, al
		or	dl, dl
		jz	short loc_28B12
		mov	al, byte_6E480
		mov	ah, 0
		or	ax, ax
		jnz	short loc_28B12
		mov	byte ptr [si], 1
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_C], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_C]
		mov	[si+2],	ax
		mov	ax, [bp+var_E]
		mov	[si+4],	ax
		mov	[bp+var_1], 1
		mov	byte_6E480, 1
		jmp	loc_28C51
; ���������������������������������������������������������������������������

loc_28B12:				; CODE XREF: Input_ReadCombinedAxes+74j
					; Input_ReadCombinedAxes+7Dj
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_28B51
		cmp	byte_6E480, 0
		jz	short loc_28B51
		mov	byte ptr [si], 2
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
		mov	byte_6E480, 0
		jmp	loc_28C51
; ���������������������������������������������������������������������������

loc_28B51:				; CODE XREF: Input_ReadCombinedAxes+B5j
					; Input_ReadCombinedAxes+BCj
		push	0
		call	Joystick_GetAxisMin_67BC9
		pop	cx
		mov	[bp+var_A], ax
		push	0
		call	Joystick_GetAxisMax_67BD8

loc_28B63:
		pop	cx
		mov	bx, ax
		cmp	[bp+var_A], 0
		jnz	short loc_28B70
		or	bx, bx
		jz	short loc_28B75

loc_28B70:				; CODE XREF: Input_ReadCombinedAxes+107j
		mov	ax, 1
		jmp	short loc_28B77
; ���������������������������������������������������������������������������

loc_28B75:				; CODE XREF: Input_ReadCombinedAxes+10Bj
		xor	ax, ax

loc_28B77:				; CODE XREF: Input_ReadCombinedAxes+110j
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_28B83
		jmp	loc_28C4B
; ���������������������������������������������������������������������������

loc_28B83:				; CODE XREF: Input_ReadCombinedAxes+11Bj
		cmp	[bp+var_A], 0
		jle	short loc_28B94
		cmp	di, 13Fh
		jge	short loc_28B94
		add	di, 3
		jmp	short loc_28BA1
; ���������������������������������������������������������������������������

loc_28B94:				; CODE XREF: Input_ReadCombinedAxes+124j
					; Input_ReadCombinedAxes+12Aj
		cmp	[bp+var_A], 0
		jge	short loc_28BA1
		or	di, di
		jle	short loc_28BA1
		sub	di, 3

loc_28BA1:				; CODE XREF: Input_ReadCombinedAxes+12Fj
					; Input_ReadCombinedAxes+135j ...
		or	bx, bx
		jle	short loc_28BB2
		cmp	[bp+var_4], 0C7h ; '�'
		jge	short loc_28BB2
		add	[bp+var_4], 3
		jmp	short loc_28BC0
; ���������������������������������������������������������������������������

loc_28BB2:				; CODE XREF: Input_ReadCombinedAxes+140j
					; Input_ReadCombinedAxes+147j
		or	bx, bx
		jge	short loc_28BC0
		cmp	[bp+var_4], 0
		jle	short loc_28BC0
		sub	[bp+var_4], 3

loc_28BC0:				; CODE XREF: Input_ReadCombinedAxes+14Dj
					; Input_ReadCombinedAxes+151j ...
		mov	ax, [bp+var_A]
		mov	[bp+var_16], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	cx, ax
		mov	[bp+var_18], bx
		mov	ax, [bp+var_18]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, ax
		cmp	cx, dx
		jle	short loc_28BE2
		mov	ax, cx
		jmp	short loc_28BE4
; ���������������������������������������������������������������������������

loc_28BE2:				; CODE XREF: Input_ReadCombinedAxes+179j
		mov	ax, dx

loc_28BE4:				; CODE XREF: Input_ReadCombinedAxes+17Dj
		mov	[bp+var_14], ax
		mov	[bp+var_1A], 4
		mov	ax, [bp+var_1A]
		imul	[bp+var_14]
		mov	bx, 20h	; ' '
		cwd
		idiv	bx
		mov	dx, 5
		sub	dx, ax
		mov	word_6E47D, dx
		mov	byte ptr [si], 3
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_1C]
		mov	[si+2],	ax
		mov	ax, [bp+var_1E]
		mov	[si+4],	ax
		push	[bp+var_4]
		mov	ax, di
		shl	ax, 1
		push	ax
		call	TextScrollDisplay_RegisterEntries_673B9
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_20], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_22], ax
		push	ax
		push	[bp+var_20]
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_67EE0
		add	sp, 8
		jmp	short loc_28C51
; ���������������������������������������������������������������������������

loc_28C4B:				; CODE XREF: Input_ReadCombinedAxes+11Dj
		mov	word_6E47D, 5

loc_28C51:				; CODE XREF: Input_ReadCombinedAxes+1Bj
					; Input_ReadCombinedAxes+43j ...
		cmp	byte_6E480, 0
		jz	short loc_28C60
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1

loc_28C60:				; CODE XREF: Input_ReadCombinedAxes+1F3j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Input_ReadCombinedAxes	endp

; ���������������������������������������������������������������������������

loc_28C67:				; DATA XREF: seg339:off_71E78o
		push	bp
		mov	bp, sp
		push	521Eh
		call	TextScrollDisplayB_ConstructAndReset_67DF5
		pop	cx
		xor	eax, eax
		mov	dword_722DA, eax
		mov	dword_722D6, eax
		xor	eax, eax
		mov	dword_722E2, eax
		mov	dword_722DE, eax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_28C8B:				; DATA XREF: seg339:off_71F92o
		push	bp
		mov	bp, sp

loc_28C8E:
		push	521Eh
		call	ResourceHandle_IsValid_6755B
		pop	cx
		pop	bp
		retf
seg049		ends
