seg212		segment	para public 'CODE' use16
		assume cs:seg212
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EF71		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6EF8A
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6EF8F

loc_6EF8A:
		nop
		push	cs
		call	near ptr sub_6EFB9

loc_6EF8F:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6EF71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InputBinding_Destruct_66DDD (sub_66DDD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle
; InputBinding_ReleaseJoystickCallback_66ED5 puis libère l'objet (sub_338).
; ==============================================================================================
InputBinding_Destruct_6EF94		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6EFB5
		nop
		push	cs
		call	near ptr InputBinding_ReleaseJoystickCallback_6F00F
		test	di, 1
		jz	short loc_6EFB5
		push	si
		call	sub_3B2
		pop	cx

loc_6EFB5:
		pop	di
		pop	si
		pop	bp
		retf
InputBinding_Destruct_6EF94		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EFB9		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dword_7B4D2, 0
		call	PagedMemory_DetectDriverSignatureA_63627
		mov	[bp+var_1], al
		cmp	word_7D38C, 0FFFFh
		jz	short loc_6EFDC
		mov	ax, 1
		jmp	short loc_6EFDE

loc_6EFDC:
		xor	ax, ax

loc_6EFDE:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6F000
		push	seg seg219
		push	offset loc_70156
		push	6C50h
		push	seg seg219
		push	offset loc_7015B
		push	15h
		push	6BACh
		call	JoystickCallback_RegisterInChain_6E6A5
		add	sp, 0Eh

loc_6F000:
		cmp	[bp+var_1], 0
		jz	short loc_6F00B
		call	PagedMemory_DetectDriverSignatureB_63638

loc_6F00B:
		mov	al, 1
		leave
		retf
sub_6EFB9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InputBinding_ReleaseJoystickCallback_66ED5 (sub_66ED5
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle JoystickCallback_FindOrTraverse_66573 (seg200) avec le tag du singleton joystick
; (5CECh) et l'ID de bouton 0x15 — libère la liaison enregistrée.
; ==============================================================================================
InputBinding_ReleaseJoystickCallback_6F00F		proc far
		push	bp
		mov	bp, sp
		push	15h
		push	6BACh
		call	JoystickCallback_FindOrTraverse_6E743
		add	sp, 4
		pop	bp
		retf
InputBinding_ReleaseJoystickCallback_6F00F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F021		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_7B4D2, eax
		pop	bp
		retf
sub_6F021		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ReportErrorIfActive_66EF4 (sub_66EF4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, si
; le sous-système clavier est actif (word_7160A), signale une erreur
; (Runtime_FatalErrorHandler, tag 40D2h). Appelée avant certaines opérations du cluster
; clavier (seg202).
; ==============================================================================================
Keyboard_ReportErrorIfActive_6F02E		proc far
		push	bp
		mov	bp, sp
		cmp	word_7B4D0, 0
		jz	short loc_6F041
		push	4B22h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_6F041:
		pop	bp
		retf
Keyboard_ReportErrorIfActive_6F02E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Keyboard_AllocateHandlerMask_3E72D (sub_3E72D de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Keyboard_AllocateHandlerMask_66F09 (sub_66F09 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658, 1
; octet) et réinitialise le masque de gestionnaires par scan-code (dword_7119A/word_7119E, les
; mêmes globales testées par Keyboard_ProcessScanCode_66AC4, seg202).
; ==============================================================================================
Keyboard_AllocateHandlerMask_6F043		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_6F05B
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_6F06A

loc_6F05B:
		mov	dword_7B26A, 0
		mov	word_7B26E, 0

loc_6F06A:
		mov	ax, dx
		pop	bp
		retf
Keyboard_AllocateHandlerMask_6F043		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F06E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_6F088
		test	dx, 1
		jz	short loc_6F088
		push	ax
		call	sub_3B2
		pop	cx

loc_6F088:
		pop	bp
		retf
sub_6F06E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F08A		proc far
		push	bp
		mov	bp, sp
		push	large dword_7B26A
		push	cs
		call	near ptr sub_6F021
		add	sp, 4
		pop	bp
		retf
sub_6F08A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Keyboard_ConfigureHandlerMask_3E785 (sub_3E785 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Keyboard_ConfigureHandlerMask_66F61 (sub_66F61 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, configure le masque de
; gestionnaires (dword_7119A = pointeur far du gestionnaire, word_7119E = masque de scan-
; codes) puis l'installe (Keyboard_InstallHandlerMask_66F50). Référencée par
; Keyboard_InitSystem_66C34 (seg202, installe Keyboard_ProcessScanCode_66AC4 pour les 255
; scan-codes) et Keyboard_UnregisterHandlerTable_66C62.
; ==============================================================================================
Keyboard_ConfigureHandlerMask_6F09B		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_7B26A, eax
		mov	ax, [bp+arg_4]
		mov	word_7B26E, ax
		push	cs
		call	near ptr sub_6F08A
		pop	bp
		retf
Keyboard_ConfigureHandlerMask_6F09B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F0B2		proc far
		push	bp
		mov	bp, sp
		mov	dx, word_7B26C
		mov	ax, word ptr dword_7B26A
		pop	bp
		retf
sub_6F0B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F0BE		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_7B26A, eax
		pop	bp
		retf
sub_6F0BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F0CB		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_7B26E
		pop	bp
		retf
sub_6F0CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F0D3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_7B26E, ax
		pop	bp
		retf
sub_6F0D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F0DE		proc far
		push	bp
		mov	bp, sp
		push	6C50h
		call	JoystickCallback_Construct_6E5A6
		pop	cx
		pop	bp
		retf
sub_6F0DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F0EC		proc far
		push	bp
		mov	bp, sp
sub_6F0EC		endp

; START OF FUNCTION CHUNK FOR sub_6F0EC
		db 6Ah
; END OF FUNCTION CHUNK FOR sub_6F0EC
seg212		ends
