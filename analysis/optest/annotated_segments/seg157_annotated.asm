seg157		segment	byte public 'CODE' use16
		assume cs:seg157
		;org 0Eh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InputBinding_Construct_66DBA (sub_66DBA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue (sub_658) et initialise via sub_66E02
; — constructeur d'une liaison entrée (probable association bouton joystick ↔ action).
; ==============================================================================================
InputBinding_Construct_3E5DE	proc far		; CODE XREF: sub_5E851+3DP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3E5F7
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3E5FC

loc_3E5F7:				; CODE XREF: InputBinding_Construct_3E5DE+9j
		nop
		push	cs
		call	near ptr InputBinding_InitAndRegister_3E626

loc_3E5FC:				; CODE XREF: InputBinding_Construct_3E5DE+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
InputBinding_Construct_3E5DE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InputBinding_Destruct_66DDD (sub_66DDD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle
; InputBinding_ReleaseJoystickCallback_66ED5 puis libère l'objet (sub_338).
; ==============================================================================================
InputBinding_Destruct_3E601	proc far		; CODE XREF: sub_5E9CD+A8P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3E622
		nop
		push	cs
		call	near ptr InputBinding_ReleaseJoystickCallback_3E6F9
		test	di, 1
		jz	short loc_3E622
		push	si
		call	sub_308
		pop	cx

loc_3E622:				; CODE XREF: InputBinding_Destruct_3E601+Dj
					; InputBinding_Destruct_3E601+18j
		pop	di
		pop	si
		pop	bp
		retf
InputBinding_Destruct_3E601	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InputBinding_InitAndRegister_66E02 (sub_66E02 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 155 lignes, NON DÉTAILLÉE — combine sub_1839 (externe), Runtime_FatalErrorHandlerWithTag
; (sub_6B70F) et JoystickCallback_RegisterInChain_664D5 (seg200) — enregistre une liaison
; auprès du gestionnaire de callbacks joystick.
; ==============================================================================================
InputBinding_InitAndRegister_3E626	proc far		; CODE XREF: InputBinding_Construct_3E5DE+1Bp

var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_1E		= word ptr -1Eh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		mov	[bp+var_E], 0
		mov	dword ptr word_480FA, 0
		pushf
		push	ax
		push	bx
		mov	ax, 1209h
		mov	bx, 736Dh
		int	15h
		mov	[bp+var_E], bx
		pop	bx
		pop	ax
		popf
		mov	[bp+var_1E], 0C000h
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		push	15h
		call	CRT_Int86
		add	sp, 8
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_2C]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	byte_47A6F, 1
		les	bx, [bp+var_4]
		mov	al, es:[bx+5]
		cbw
		test	ax, 20h
		jnz	short loc_3E6A6
		mov	byte_47A6F, 0
		cmp	[bp+var_E], 0
		jz	short loc_3E69D
		pushf
		push	ax
		push	bx
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h
		pop	bx
		pop	ax
		popf

loc_3E69D:				; CODE XREF: InputBinding_InitAndRegister_3E626+67j
		push	0EA01h
		call	sub_30D3
		pop	cx

loc_3E6A6:				; CODE XREF: InputBinding_InitAndRegister_3E626+5Cj
		cmp	[bp+var_E], 0
		jz	short loc_3E6BA
		pushf
		push	ax
		push	bx
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h
		pop	bx
		pop	ax
		popf

loc_3E6BA:				; CODE XREF: InputBinding_InitAndRegister_3E626+84j
		cmp	byte_47A6F, 0
		jz	short loc_3E6F5
		cmp	word_49790, 0FFFFh
		jz	short loc_3E6CD
		mov	ax, 1
		jmp	short loc_3E6CF
; ���������������������������������������������������������������������������

loc_3E6CD:				; CODE XREF: InputBinding_InitAndRegister_3E626+A0j
		xor	ax, ax

loc_3E6CF:				; CODE XREF: InputBinding_InitAndRegister_3E626+A5j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3E6F1
		push	seg seg165
		push	offset off_3F9DA
		push	6764h
		push	seg seg165
		push	offset loc_3F9DF
		push	15h
		push	66CCh
		call	JoystickCallback_RegisterInChain_3DD45
		add	sp, 0Eh

loc_3E6F1:				; CODE XREF: InputBinding_InitAndRegister_3E626+ADj
		mov	al, 1
		jmp	short locret_3E6F7
; ���������������������������������������������������������������������������

loc_3E6F5:				; CODE XREF: InputBinding_InitAndRegister_3E626+99j
		mov	al, 0

locret_3E6F7:				; CODE XREF: InputBinding_InitAndRegister_3E626+CDj
		leave
		retf
InputBinding_InitAndRegister_3E626	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InputBinding_ReleaseJoystickCallback_66ED5 (sub_66ED5
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle JoystickCallback_FindOrTraverse_66573 (seg200) avec le tag du singleton joystick
; (5CECh) et l'ID de bouton 0x15 — libère la liaison enregistrée.
; ==============================================================================================
InputBinding_ReleaseJoystickCallback_3E6F9	proc far		; CODE XREF: InputBinding_Destruct_3E601+11p
		push	bp
		mov	bp, sp
		push	15h
		push	66CCh
		call	JoystickCallback_FindOrTraverse_3DDE3
		add	sp, 4
		pop	bp
		retf
InputBinding_ReleaseJoystickCallback_3E6F9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_SetHandlerPointer_66EE7 (sub_66EE7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, écrit le pointeur de fonction gestionnaire
; (word_7160C). Appelée par Keyboard_InstallHandlerMask_66F50.
; ==============================================================================================
Keyboard_SetHandlerPointer_3E70B	proc far		; CODE XREF: Keyboard_InstallHandlerMask_3E774+9p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword ptr word_480FA, eax
		pop	bp
		retf
Keyboard_SetHandlerPointer_3E70B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3E718	proc far		; CODE XREF: seg156:02D8P Keyboard_QueryAndDispatch_3E5C7+3P
		push	bp
		mov	bp, sp
		cmp	word_480F8, 0
		jz	short loc_3E72B
		push	4A50h
		call	Fatal_Error_310B
		pop	cx

loc_3E72B:				; CODE XREF: sub_3E718+8j
		pop	bp
		retf
sub_3E718	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_AllocateHandlerMask_66F09 (sub_66F09 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue (sub_658, 1 octet) et réinitialise le
; masque de gestionnaires par scan-code (dword_7119A/word_7119E, les mêmes globales testées
; par Keyboard_ProcessScanCode_66AC4, seg202).
; ==============================================================================================
Keyboard_AllocateHandlerMask_3E72D	proc far		; CODE XREF: Keyboard_RegisterOrInitHandlerTable_3E3DE+1AP
					; seg156:0152P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_3E745
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_3E754

loc_3E745:				; CODE XREF: Keyboard_AllocateHandlerMask_3E72D+8j
		mov	dword_47A88, 0
		mov	word_47A8C, 0

loc_3E754:				; CODE XREF: Keyboard_AllocateHandlerMask_3E72D+16j
		mov	ax, dx
		pop	bp
		retf
Keyboard_AllocateHandlerMask_3E72D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3E758	proc far		; CODE XREF: Keyboard_UnregisterHandlerTable_3E486+22P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_3E772
		test	dx, 1
		jz	short loc_3E772
		push	ax
		call	sub_308
		pop	cx

loc_3E772:				; CODE XREF: sub_3E758+Bj
					; sub_3E758+11j
		pop	bp
		retf
sub_3E758	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_InstallHandlerMask_66F50 (sub_66F50 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, installe le pointeur de gestionnaire courant
; (Keyboard_SetHandlerPointer_66EE7) à partir de dword_7119A.
; ==============================================================================================
Keyboard_InstallHandlerMask_3E774	proc far		; CODE XREF: Keyboard_ConfigureHandlerMask_3E785+12p
		push	bp
		mov	bp, sp
		push	large [dword_47A88]
		push	cs
		call	near ptr Keyboard_SetHandlerPointer_3E70B
		add	sp, 4
		pop	bp
		retf
Keyboard_InstallHandlerMask_3E774	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_ConfigureHandlerMask_66F61 (sub_66F61 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, configure le masque de gestionnaires
; (dword_7119A = pointeur far du gestionnaire, word_7119E = masque de scan-codes) puis
; l'installe (Keyboard_InstallHandlerMask_66F50). Référencée par Keyboard_InitSystem_66C34
; (seg202, installe Keyboard_ProcessScanCode_66AC4 pour les 255 scan-codes) et
; Keyboard_UnregisterHandlerTable_66C62.
; ==============================================================================================
Keyboard_ConfigureHandlerMask_3E785	proc far		; CODE XREF: Keyboard_InitSystem_3E458+24P
					; Keyboard_UnregisterHandlerTable_3E486+17P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_47A88, eax
		mov	ax, [bp+arg_4]
		mov	word_47A8C, ax
		push	cs
		call	near ptr Keyboard_InstallHandlerMask_3E774
		pop	bp
		retf
Keyboard_ConfigureHandlerMask_3E785	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, word ptr dword_47A88+2
		mov	ax, word ptr dword_47A88
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	eax, [bp+6]
		mov	dword_47A88, eax
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, word_47A8C
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	word_47A8C, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3E7C8:				; DATA XREF: dseg:5958o
		push	bp
		mov	bp, sp
		push	6764h
		call	JoystickCallback_Construct_3DC46
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3E7D6:				; DATA XREF: dseg:59EEo
		push	bp
		mov	bp, sp
		push	2
		push	6764h
		call	sub_3DC90
		add	sp, 4
		pop	bp
		retf
seg157		ends
