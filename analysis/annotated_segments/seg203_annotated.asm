seg203		segment	byte public 'CODE' use16
		assume cs:seg203
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658) et initialise via sub_66E02 — constructeur d'une liaison entrée
; (probable association bouton joystick ↔ action).
; ==============================================================================================
InputBinding_Construct_66DBA	proc far		; CODE XREF: InputSystem_InitAll_8F47A:loc_8F4B3P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_66DC1:
		or	si, si

loc_66DC3:
		jnz	short loc_66DD3
		push	1

loc_66DC7:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_66DCF:
		or	ax, ax
		jz	short loc_66DD8

loc_66DD3:				; CODE XREF: InputBinding_Construct_66DBA:loc_66DC3j
		nop

loc_66DD4:
		push	cs
		call	near ptr InputBinding_InitAndRegister_66E02

loc_66DD8:				; CODE XREF: InputBinding_Construct_66DBA+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
InputBinding_Construct_66DBA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle InputBinding_ReleaseJoystickCallback_66ED5 puis libère l'objet (sub_338).
; ==============================================================================================
InputBinding_Destruct_66DDD	proc far		; CODE XREF: InputSystem_ReleaseAll_8F5E0+9EP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_66DE1:
		push	di

loc_66DE2:
		mov	si, [bp+arg_0]

loc_66DE5:
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_66DFE
		nop
		push	cs
		call	near ptr InputBinding_ReleaseJoystickCallback_66ED5
		test	di, 1
		jz	short loc_66DFE
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_66DFE:				; CODE XREF: InputBinding_Destruct_66DDD+Dj
					; InputBinding_Destruct_66DDD+18j
		pop	di
		pop	si
		pop	bp
		retf
InputBinding_Destruct_66DDD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 155 lignes, NON DÉTAILLÉE — combine sub_1839 (externe),
; Runtime_FatalErrorHandlerWithTag (sub_6B70F) et JoystickCallback_RegisterInChain_664D5
; (seg200) — enregistre une liaison auprès du gestionnaire de callbacks joystick.
; ==============================================================================================
InputBinding_InitAndRegister_66E02	proc far		; CODE XREF: InputBinding_Construct_66DBA+1Bp

var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_1E		= word ptr -1Eh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_4		= dword	ptr -4

		push	bp

loc_66E03:
		mov	bp, sp
		sub	sp, 2Eh
		mov	[bp+var_E], 0

loc_66E0D:
		mov	dword ptr word_7160C, 0
		pushf
		push	ax
		push	bx
		mov	ax, 1209h
		mov	bx, 736Dh
		int	15h

loc_66E21:
		mov	[bp+var_E], bx
		pop	bx
		pop	ax
		popf
		mov	[bp+var_1E], 0C000h
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax

loc_66E34:
		lea	ax, [bp+var_1E]

loc_66E37:
		push	ax
		push	15h
		call	CRT_Int86

loc_66E3F:
		add	sp, 8
		mov	ax, [bp+var_C]

loc_66E45:
		mov	dx, [bp+var_2C]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx

loc_66E4E:
		mov	byte_71181, 1

loc_66E53:
		les	bx, [bp+var_4]
		mov	al, es:[bx+5]
		cbw
		test	ax, 20h
		jnz	short loc_66E82
		mov	byte_71181, 0
		cmp	[bp+var_E], 0
		jz	short loc_66E79
		pushf
		push	ax
		push	bx
		mov	ax, 1209h

loc_66E71:
		mov	bx, 534Dh
		int	15h

loc_66E76:
		pop	bx
		pop	ax
		popf

loc_66E79:				; CODE XREF: InputBinding_InitAndRegister_66E02+67j
		push	0EA01h

loc_66E7C:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_66E82:				; CODE XREF: InputBinding_InitAndRegister_66E02+5Cj
		cmp	[bp+var_E], 0

loc_66E86:
		jz	short loc_66E96
		pushf
		push	ax
		push	bx
		mov	ax, 1209h
		mov	bx, 534Dh

loc_66E91:
		int	15h

loc_66E93:
		pop	bx
		pop	ax
		popf

loc_66E96:				; CODE XREF: InputBinding_InitAndRegister_66E02:loc_66E86j
		cmp	byte_71181, 0
		jz	short loc_66ED1

loc_66E9D:
		cmp	word_72E40, 0FFFFh
		jz	short loc_66EA9

loc_66EA4:
		mov	ax, 1

loc_66EA7:
		jmp	short loc_66EAB
; ���������������������������������������������������������������������������

loc_66EA9:				; CODE XREF: InputBinding_InitAndRegister_66E02+A0j
		xor	ax, ax

loc_66EAB:				; CODE XREF: InputBinding_InitAndRegister_66E02:loc_66EA7j
		mov	ah, 0

loc_66EAD:
		or	ax, ax
		jnz	short loc_66ECD

loc_66EB1:
		push	seg seg211
		push	offset off_681B6
		push	5D84h
		push	seg seg211
		push	offset Keyboard_BIOSInterceptEntry_681BB

loc_66EC0:
		push	15h
		push	5CECh
		call	JoystickCallback_RegisterInChain_664D5
		add	sp, 0Eh

loc_66ECD:				; CODE XREF: InputBinding_InitAndRegister_66E02+ADj
		mov	al, 1
		jmp	short locret_66ED3
; ���������������������������������������������������������������������������

loc_66ED1:				; CODE XREF: InputBinding_InitAndRegister_66E02+99j
		mov	al, 0

locret_66ED3:				; CODE XREF: InputBinding_InitAndRegister_66E02+CDj
		leave
		retf
InputBinding_InitAndRegister_66E02	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle JoystickCallback_FindOrTraverse_66573 (seg200) avec le tag du singleton
; joystick (5CECh) et l'ID de bouton 0x15 — libère la liaison enregistrée.
; ==============================================================================================
InputBinding_ReleaseJoystickCallback_66ED5	proc far		; CODE XREF: InputBinding_Destruct_66DDD+11p
		push	bp
		mov	bp, sp
		push	15h
		push	5CECh
		call	JoystickCallback_FindOrTraverse_66573
		add	sp, 4
		pop	bp
		retf
InputBinding_ReleaseJoystickCallback_66ED5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, écrit le pointeur de fonction gestionnaire (word_7160C). Appelée par
; Keyboard_InstallHandlerMask_66F50.
; ==============================================================================================
Keyboard_SetHandlerPointer_66EE7	proc far		; CODE XREF: Keyboard_InstallHandlerMask_66F50+9p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]

loc_66EEE:
		mov	dword ptr word_7160C, eax
		pop	bp

locret_66EF3:
		retf
Keyboard_SetHandlerPointer_66EE7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, si le sous-système clavier est actif (word_7160A), signale une erreur
; (Runtime_FatalErrorHandler, tag 40D2h). Appelée avant certaines opérations du cluster
; clavier (seg202).
; ==============================================================================================
Keyboard_ReportErrorIfActive_66EF4	proc far		; CODE XREF: seg202:loc_66D94P
					; Keyboard_QueryAndDispatch_66DA3+3P
		push	bp
		mov	bp, sp

loc_66EF7:
		cmp	word_7160A, 0
		jz	short loc_66F07
		push	40D2h

loc_66F01:
		call	Runtime_FatalErrorHandler_5F700
		pop	cx

loc_66F07:				; CODE XREF: Keyboard_ReportErrorIfActive_66EF4+8j
		pop	bp

locret_66F08:
		retf
Keyboard_ReportErrorIfActive_66EF4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658, 1 octet) et réinitialise le masque de gestionnaires par scan-code
; (dword_7119A/word_7119E, les mêmes globales testées par Keyboard_ProcessScanCode_66AC4,
; seg202).
; ==============================================================================================
Keyboard_AllocateHandlerMask_66F09	proc far		; CODE XREF: Keyboard_RegisterOrInitHandlerTable_66BBA+1AP
					; seg202:loc_66C0EP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_66F0C:
		mov	dx, [bp+arg_0]
		or	dx, dx

loc_66F11:
		jnz	short loc_66F21

loc_66F13:
		push	1

loc_66F15:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax

loc_66F1F:
		jz	short loc_66F30

loc_66F21:				; CODE XREF: Keyboard_AllocateHandlerMask_66F09:loc_66F11j
		mov	dword_7119A, 0

loc_66F2A:
		mov	word_7119E, 0

loc_66F30:				; CODE XREF: Keyboard_AllocateHandlerMask_66F09:loc_66F1Fj
		mov	ax, dx
		pop	bp

locret_66F33:
		retf
Keyboard_AllocateHandlerMask_66F09	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère l'objet masque de gestionnaires si le flag de possession (bit0) est posé
; (sub_338).
; ==============================================================================================
Keyboard_ReleaseHandlerMaskIfSet_66F34	proc far		; CODE XREF: Keyboard_UnregisterHandlerTable_66C62+22P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]

loc_66F3A:
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_66F4E

loc_66F41:
		test	dx, 1
		jz	short loc_66F4E
		push	ax
		call	CRT_FreeNear_Wrap
		pop	cx

loc_66F4E:				; CODE XREF: Keyboard_ReleaseHandlerMaskIfSet_66F34+Bj
					; Keyboard_ReleaseHandlerMaskIfSet_66F34+11j
		pop	bp
		retf
Keyboard_ReleaseHandlerMaskIfSet_66F34	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, installe le pointeur de gestionnaire courant (Keyboard_SetHandlerPointer_66EE7) à
; partir de dword_7119A.
; ==============================================================================================
Keyboard_InstallHandlerMask_66F50	proc far		; CODE XREF: Keyboard_ConfigureHandlerMask_66F61+12p
		push	bp
		mov	bp, sp

loc_66F53:
		push	large [dword_7119A]
		push	cs
		call	near ptr Keyboard_SetHandlerPointer_66EE7

loc_66F5C:
		add	sp, 4
		pop	bp

locret_66F60:
		retf
Keyboard_InstallHandlerMask_66F50	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, configure le masque de gestionnaires (dword_7119A = pointeur far du gestionnaire,
; word_7119E = masque de scan-codes) puis l'installe (Keyboard_InstallHandlerMask_66F50).
; Référencée par Keyboard_InitSystem_66C34 (seg202, installe Keyboard_ProcessScanCode_66AC4
; pour les 255 scan-codes) et Keyboard_UnregisterHandlerTable_66C62.
; ==============================================================================================
Keyboard_ConfigureHandlerMask_66F61	proc far		; CODE XREF: Keyboard_InitSystem_66C34:loc_66C58P
					; Keyboard_UnregisterHandlerTable_66C62+17P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_66F62:
		mov	bp, sp

loc_66F64:
		mov	eax, [bp+arg_0]
		mov	dword_7119A, eax
		mov	ax, [bp+arg_4]
		mov	word_7119E, ax
		push	cs
		call	near ptr Keyboard_InstallHandlerMask_66F50
		pop	bp

locret_66F77:
		retf
Keyboard_ConfigureHandlerMask_66F61	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, word ptr dword_7119A+2

loc_66F7F:
		mov	ax, word ptr dword_7119A
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	eax, [bp+6]
		mov	dword_7119A, eax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_66F91:
		push	bp
		mov	bp, sp
		mov	ax, word_7119E
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	word_7119E, ax
		pop	bp

locret_66FA3:
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — thunk appelant
; ConfigOption_Construct_6672D... (sub_663D6, seg200, JoystickCallback_Construct, tag 5D84h).
; ==============================================================================================
InputBinding_ConstructThunk_66FA4:				; DATA XREF: seg339:4E9Ao
		push	bp
		mov	bp, sp
		push	5D84h
		call	JoystickCallback_Construct_663D6
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — thunk appelant
; JoystickCallback_Destruct_66420 (seg200, tag 5D84h, flag 2).
; ==============================================================================================
InputBinding_DestructThunk_66FB2:				; DATA XREF: seg339:off_71FFEo
		push	bp
		mov	bp, sp
		push	2
		push	5D84h
		call	JoystickCallback_Destruct_66420

loc_66FBF:
		add	sp, 4
		pop	bp
		retf
seg203		ends
