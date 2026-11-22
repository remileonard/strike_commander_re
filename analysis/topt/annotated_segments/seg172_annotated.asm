seg172		segment	para public 'CODE' use16
		assume cs:seg172
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0B8h, 0FFh, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_443D7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_443F0
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_443F5

loc_443F0:
		nop
		push	cs
		call	near ptr sub_4441F

loc_443F5:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_443D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InputBinding_Destruct_66DDD (sub_66DDD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle
; InputBinding_ReleaseJoystickCallback_66ED5 puis libère l'objet (sub_338).
; ==============================================================================================
InputBinding_Destruct_443FA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4441B
		nop
		push	cs
		call	near ptr InputBinding_ReleaseJoystickCallback_444F2
		test	di, 1
		jz	short loc_4441B
		push	si
		call	sub_39C
		pop	cx

loc_4441B:
		pop	di
		pop	si
		pop	bp
		retf
InputBinding_Destruct_443FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4441F		proc far

var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_1E		= word ptr -1Eh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		mov	[bp+var_E], 0
		mov	dword_4E04C, 0
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
		call	sub_1E67
		add	sp, 8
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_2C]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	byte_4DDC9, 1
		les	bx, [bp+var_4]
		mov	al, es:[bx+5]
		cbw
		test	ax, 20h
		jnz	short loc_4449F
		mov	byte_4DDC9, 0
		cmp	[bp+var_E], 0
		jz	short loc_44496
		pushf
		push	ax
		push	bx
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h
		pop	bx
		pop	ax
		popf

loc_44496:
		push	0EA01h
		call	sub_13451
		pop	cx

loc_4449F:
		cmp	[bp+var_E], 0
		jz	short loc_444B3
		pushf
		push	ax
		push	bx
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h
		pop	bx
		pop	ax
		popf

loc_444B3:
		cmp	byte_4DDC9, 0
		jz	short loc_444EE
		cmp	word_4F74A, 0FFFFh
		jz	short loc_444C6
		mov	ax, 1
		jmp	short loc_444C8

loc_444C6:
		xor	ax, ax

loc_444C8:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_444EA
		push	seg seg180
		push	offset loc_45BB4
		push	6D5Eh
		push	seg seg180
		push	offset loc_45BB9
		push	15h
		push	6CBEh
		call	JoystickCallback_RegisterInChain_43B15
		add	sp, 0Eh

loc_444EA:
		mov	al, 1
		jmp	short loc_444F0

loc_444EE:
		mov	al, 0

loc_444F0:
		leave
		retf
sub_4441F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InputBinding_ReleaseJoystickCallback_66ED5 (sub_66ED5
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle JoystickCallback_FindOrTraverse_66573 (seg200) avec le tag du singleton joystick
; (5CECh) et l'ID de bouton 0x15 — libère la liaison enregistrée.
; ==============================================================================================
InputBinding_ReleaseJoystickCallback_444F2		proc far
		push	bp
		mov	bp, sp
		push	15h
		push	6CBEh
		call	JoystickCallback_FindOrTraverse_43BB3
		add	sp, 4
		pop	bp
		retf
InputBinding_ReleaseJoystickCallback_444F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44504		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_4E04C, eax
		pop	bp
		retf
sub_44504		endp

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
Keyboard_ReportErrorIfActive_44511		proc far
		push	bp
		mov	bp, sp
		cmp	word_4E04A, 0
		jz	short loc_44524
		push	53EAh
		call	Runtime_FatalErrorHandler_36797
		pop	cx

loc_44524:
		pop	bp
		retf
Keyboard_ReportErrorIfActive_44511		endp

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
Keyboard_AllocateHandlerMask_44526		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_4453E
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_4454D

loc_4453E:
		mov	dword_4DDE2, 0
		mov	word_4DDE6, 0

loc_4454D:
		mov	ax, dx
		pop	bp
		retf
Keyboard_AllocateHandlerMask_44526		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44551		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_4456B
		test	dx, 1
		jz	short loc_4456B
		push	ax
		call	sub_39C
		pop	cx

loc_4456B:
		pop	bp
		retf
sub_44551		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4456D		proc far
		push	bp
		mov	bp, sp
		push	large dword_4DDE2
		push	cs
		call	near ptr sub_44504
		add	sp, 4
		pop	bp
		retf
sub_4456D		endp

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
Keyboard_ConfigureHandlerMask_4457E		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_4DDE2, eax
		mov	ax, [bp+arg_4]
		mov	word_4DDE6, ax
		push	cs
		call	near ptr sub_4456D
		pop	bp
		retf
Keyboard_ConfigureHandlerMask_4457E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44595		proc far
		push	bp
		mov	bp, sp
		mov	dx, word_4DDE4
		mov	ax, word ptr dword_4DDE2
		pop	bp
		retf
sub_44595		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_445A1		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_4DDE2, eax
		pop	bp
		retf
sub_445A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_445AE		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_4DDE6
		pop	bp
		retf
sub_445AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_445B6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_4DDE6, ax
		pop	bp
		retf
sub_445B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_445C1		proc far
		push	bp
		mov	bp, sp
		push	6D5Eh
		call	JoystickCallback_Construct_43A16
		pop	cx
		pop	bp
		retf
sub_445C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_445CF		proc far
		push	bp
		mov	bp, sp
		push	2
		push	6D5Eh
		call	sub_43A60
		add	sp, 4
		pop	bp
sub_445CF		endp
seg172		ends
