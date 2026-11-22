seg169		segment	para public 'CODE' use16
		assume cs:seg169
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 0FFh, 76h, 6, 0Eh, 0E8h, 0B8h, 0FFh, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplay_Construct_6F3A6 (sub_6F3A6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScrollDisplay_Construct_3EA8B (sub_3EA8B de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScrollDisplay_Construct_67267 (sub_67267 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), initialise via TextScrollDisplay_ComputeLayout_672AF.
; ==============================================================================================
TextScrollDisplay_Construct_559AD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_559C6
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_559CB

loc_559C6:
		nop
		push	cs
		call	near ptr sub_559F5

loc_559CB:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplay_Construct_559AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; InputBinding_Destruct_6EF94 (sub_6EF94 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à InputBinding_Destruct_66DDD (sub_66DDD de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; InputBinding_ReleaseJoystickCallback_66ED5 puis libère l'objet (sub_338).
; ==============================================================================================
InputBinding_Destruct_559D0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_559F1
		nop
		push	cs
		call	near ptr InputBinding_ReleaseJoystickCallback_55A4B
		test	di, 1
		jz	short loc_559F1
		push	si
		call	sub_33B
		pop	cx

loc_559F1:
		pop	di
		pop	si
		pop	bp
		retf
InputBinding_Destruct_559D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_559F5		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dword_5EA0E, 0
		call	PagedMemory_DetectDriverSignatureA_42BF9
		mov	[bp+var_1], al
		cmp	word_6062A, 0FFFFh
		jz	short loc_55A18
		mov	ax, 1
		jmp	short loc_55A1A

loc_55A18:
		xor	ax, ax

loc_55A1A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55A3C
		push	seg seg177
		push	offset loc_5783E
		push	68FEh
		push	seg seg177
		push	offset loc_57843
		push	15h
		push	684Ah
		call	JoystickCallback_RegisterInChain_550E1
		add	sp, 0Eh

loc_55A3C:
		cmp	[bp+var_1], 0
		jz	short loc_55A47
		call	PagedMemory_DetectDriverSignatureB_42C0A

loc_55A47:
		mov	al, 1
		leave
		retf
sub_559F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InputBinding_ReleaseJoystickCallback_6F00F (sub_6F00F
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InputBinding_ReleaseJoystickCallback_66ED5 (sub_66ED5
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle JoystickCallback_FindOrTraverse_66573 (seg200) avec le tag du singleton joystick
; (5CECh) et l'ID de bouton 0x15 — libère la liaison enregistrée.
; ==============================================================================================
InputBinding_ReleaseJoystickCallback_55A4B		proc far
		push	bp
		mov	bp, sp
		push	15h
		push	684Ah
		call	JoystickCallback_FindOrTraverse_5517F
		add	sp, 4
		pop	bp
		retf
InputBinding_ReleaseJoystickCallback_55A4B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55A5D		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_5EA0E, eax
		pop	bp
		retf
sub_55A5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ReportErrorIfActive_6F02E (sub_6F02E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ReportErrorIfActive_66EF4 (sub_66EF4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, si
; le sous-système clavier est actif (word_7160A), signale une erreur
; (Runtime_FatalErrorHandler, tag 40D2h). Appelée avant certaines opérations du cluster
; clavier (seg202).
; ==============================================================================================
Keyboard_ReportErrorIfActive_55A6A		proc far
		push	bp
		mov	bp, sp
		cmp	word_5EA0C, 0
		jz	short loc_55A7D
		push	4A68h
		call	sub_9D78
		pop	cx

loc_55A7D:
		pop	bp
		retf
Keyboard_ReportErrorIfActive_55A6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Keyboard_AllocateHandlerMask_6F043 (sub_6F043 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à Keyboard_AllocateHandlerMask_3E72D (sub_3E72D de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Keyboard_AllocateHandlerMask_66F09
; (sub_66F09 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658, 1 octet) et réinitialise le masque de gestionnaires par scan-
; code (dword_7119A/word_7119E, les mêmes globales testées par Keyboard_ProcessScanCode_66AC4,
; seg202).
; ==============================================================================================
Keyboard_AllocateHandlerMask_55A7F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_55A97
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_55AA6

loc_55A97:
		mov	dword_5E7A0, 0
		mov	word_5E7A4, 0

loc_55AA6:
		mov	ax, dx
		pop	bp
		retf
Keyboard_AllocateHandlerMask_55A7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55AAA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_55AC4
		test	dx, 1
		jz	short loc_55AC4
		push	ax
		call	sub_33B
		pop	cx

loc_55AC4:
		pop	bp
		retf
sub_55AAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55AC6		proc far
		push	bp
		mov	bp, sp
		push	large dword_5E7A0
		push	cs
		call	near ptr sub_55A5D
		add	sp, 4
		pop	bp
		retf
sub_55AC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Keyboard_ConfigureHandlerMask_6F09B (sub_6F09B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à Keyboard_ConfigureHandlerMask_3E785 (sub_3E785 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à
; Keyboard_ConfigureHandlerMask_66F61 (sub_66F61 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, configure le masque de gestionnaires
; (dword_7119A = pointeur far du gestionnaire, word_7119E = masque de scan-codes) puis
; l'installe (Keyboard_InstallHandlerMask_66F50). Référencée par Keyboard_InitSystem_66C34
; (seg202, installe Keyboard_ProcessScanCode_66AC4 pour les 255 scan-codes) et
; Keyboard_UnregisterHandlerTable_66C62.
; ==============================================================================================
Keyboard_ConfigureHandlerMask_55AD7		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_5E7A0, eax
		mov	ax, [bp+arg_4]
		mov	word_5E7A4, ax
		push	cs
		call	near ptr sub_55AC6
		pop	bp
		retf
Keyboard_ConfigureHandlerMask_55AD7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55AEE		proc far
		push	bp
		mov	bp, sp
		mov	dx, word_5E7A2
		mov	ax, word ptr dword_5E7A0
		pop	bp
		retf
sub_55AEE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55AFA		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_5E7A0, eax
		pop	bp
		retf
sub_55AFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55B07		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_5E7A4
		pop	bp
		retf
sub_55B07		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55B0F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_5E7A4, ax
		pop	bp
		retf
sub_55B0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55B1A		proc far
		push	bp
		mov	bp, sp
		push	68FEh
		call	JoystickCallback_Construct_54FE2
		pop	cx
		pop	bp
		retf
sub_55B1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55B28		proc far
		push	bp
		mov	bp, sp
		push	2
		push	68FEh
sub_55B28		endp
seg169		ends
