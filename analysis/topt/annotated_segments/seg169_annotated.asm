seg169		segment	para public 'CODE' use16
		assume cs:seg169
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0FAh, 2, 7Ch, 0D8h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à JoystickCallback_Construct_3DC46 (sub_3DC46 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à JoystickCallback_Construct_663D6 (sub_663D6 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, constructeur
; d'un nœud « callback joystick » : alloue (sub_658, 0x12 octets), pose deux tags vtable
; (4072h/4082h), initialise les champs (dont +0xC = seuil, +0xE = pointeur far d'écho).
; Référencée par sub_271DC et depuis seg203.
; ==============================================================================================
JoystickCallback_Construct_43A16		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_43A2F
		push	12h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_43A5B

loc_43A2F:
		mov	word ptr [si], 4984h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si], 539Ah
		mov	word ptr [si+0Ch], 0FFFFh
		mov	dword ptr [si+8], 0
		mov	dword ptr [si+0Eh], 0
		mov	word ptr [si+6], 0

loc_43A5B:
		mov	ax, si
		pop	si
		pop	bp
		retf
JoystickCallback_Construct_43A16		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43A60		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_43A7E
		mov	word ptr [si], 539Ah
		test	ax, 1
		jz	short loc_43A7E
		push	si
		call	sub_39C
		pop	cx

loc_43A7E:
		pop	si
		pop	bp
		retf
sub_43A60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; JoystickCallback_SetValueAndEcho_3DCB1 (sub_3DCB1 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à JoystickCallback_SetValueAndEcho_66441 (sub_66441 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; écrit une valeur (+8) et, si un pointeur far d'écho est configuré (+0xE), y recopie
; également la valeur — mécanisme de notification/miroir de valeur.
; ==============================================================================================
JoystickCallback_SetValueAndEcho_43A81		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si+8], eax
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_43A9E
		les	bx, [si+0Eh]
		mov	es:[bx], eax

loc_43A9E:
		pop	si
		pop	bp
		retf
JoystickCallback_SetValueAndEcho_43A81		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à JoystickCallback_UpdateAndNotifyChain_3DCD1 (sub_3DCD1
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JoystickCallback_UpdateAndNotifyChain_66461 (sub_66461 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 90 lignes, NON DÉTAILLÉE —
; combine LinkedList_Helper_5F401 (seg156), JoystickCallback_SetValueAndEcho_66441 (×2),
; sub_428 (externe), LinkedList_Remove_5F324 (seg156) — met à jour et propage une valeur à
; travers une chaîne de callbacks liés.
; ==============================================================================================
JoystickCallback_UpdateAndNotifyChain_43AA1		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		jmp	short loc_43ABF

loc_43AB4:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ch]
		cmp	ax, [di+0Ch]
		jz	short loc_43AD0

loc_43ABF:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36597
		add	sp, 4
		or	ax, ax
		jnz	short loc_43AB4

loc_43AD0:
		cmp	[bp+var_2], 0
		jz	short loc_43AE3
		push	large [di+8]
		push	[bp+var_2]
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_43A81
		jmp	short loc_43AEF

loc_43AE3:
		push	large [di+8]
		push	word ptr [di+0Ch]
		call	CRT_SetVect

loc_43AEF:
		add	sp, 6
		push	large 0
		push	di
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_43A81
		add	sp, 6
		mov	word ptr [di+0Ch], 0FFFFh
		push	di
		push	si
		call	LinkedList_Remove_364BA
		add	sp, 4
		mov	word ptr [di+6], 0
		pop	di
		pop	si
		leave
		retf
JoystickCallback_UpdateAndNotifyChain_43AA1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; JoystickCallback_RegisterInChain_3DD45 (sub_3DD45 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à JoystickCallback_RegisterInChain_664D5 (sub_664D5 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_419, JoystickCallback_SetValueAndEcho_66441, sub_428 et
; LinkedList_InsertAtHead_5F19C (seg156) — enregistre un callback dans une chaîne liée.
; ==============================================================================================
JoystickCallback_RegisterInChain_43B15		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]
		mov	ax, [bp+arg_2]
		mov	[di+0Ch], ax
		mov	eax, [bp+arg_A]
		mov	[di+0Eh], eax
		push	[bp+arg_2]
		call	CRT_GetVect
		pop	cx
		push	dx
		push	ax
		push	di
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_43A81
		add	sp, 6
		push	large [bp+arg_4]
		push	[bp+arg_2]
		call	CRT_SetVect
		add	sp, 6
		push	di
		push	si
		call	LinkedList_InsertAtHead_36332
		add	sp, 4
		mov	[bp+var_2], si
		mov	ax, [bp+var_2]
		mov	[di+6], ax
		pop	di
		pop	si
		leave
		retf
JoystickCallback_RegisterInChain_43B15		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43B6A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]
		mov	bx, [bp+arg_2]
		mov	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		mov	eax, [bp+arg_A]
		mov	[di+0Eh], eax
		push	large [bx+8]
		push	di
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_43A81
		add	sp, 6
		cli
		push	large [bp+arg_4]
		push	[bp+arg_2]
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_43A81
		add	sp, 6
		sti
		push	di
		push	[bp+arg_2]
		push	si
		call	LinkedList_InsertAfter_3638E
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_43B6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JoystickCallback_FindOrTraverse_66573 (sub_66573 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, appelle LinkedList_Helper_5F3D5 (seg156) et
; JoystickCallback_UpdateAndNotifyChain_66461 — parcourt/traite la chaîne de callbacks.
; ==============================================================================================
JoystickCallback_FindOrTraverse_43BB3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2]
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_43BE5

loc_43BC9:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ch]
		cmp	ax, [bp+arg_2]
		jz	short loc_43BE5
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_43BC9

loc_43BE5:
		cmp	[bp+var_2], 0
		jz	short loc_43BF6
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_43AA1
		add	sp, 4

loc_43BF6:
		pop	si
		leave
		retf
JoystickCallback_FindOrTraverse_43BB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43BF9		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_43C36
		mov	ax, [si+2]
		mov	[bp+var_2], ax

loc_43C11:
		cmp	[bp+var_2], di
		jz	short loc_43C27
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_43C11

loc_43C27:
		cmp	[bp+var_2], 0
		jz	short loc_43C36
		push	di
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_43AA1
		add	sp, 4

loc_43C36:
		pop	di
		pop	si
		leave
		retf
sub_43BF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JoystickManager_Construct_665FA (sub_665FA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par les thunks vtable environnants
; (tags 5CECh, etc.) — constructeur du gestionnaire singleton de callbacks joystick.
; ==============================================================================================
JoystickManager_Construct_43C3A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2]
		mov	[bp+var_2], ax

loc_43C4A:
		cmp	[bp+var_2], 0
		jz	short loc_43C5B
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_43AA1
		add	sp, 4

loc_43C5B:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_43C4A
		pop	si
		leave
		retf
JoystickManager_Construct_43C3A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43C6F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr JoystickManager_Construct_43C3A
		pop	cx
		pop	bp
		retf
sub_43C6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43C7D		proc far
		push	bp
		mov	bp, sp
		mov	word_4F69E, 2019h
		mov	word_4F6A0, 0
		mov	word_4F6A2, 0
		mov	word_4F6A4, 1B4h
		mov	ax, word_4D392
		mov	word_4F6A6, ax
		mov	word_4D392, 6CC4h
		mov	word_4F69E, 538Ah
		mov	word_4F6A4, 5392h
		pop	bp
		retf
sub_43C7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43CB2		proc far
		push	bp
		mov	bp, sp
		mov	word_4F69E, 538Ah
		mov	word_4F6A4, 5392h
		push	6CBEh
		push	cs
		call	near ptr JoystickManager_Construct_43C3A
		pop	cx
		push	0
		push	6CC4h
		call	sub_35D92
		add	sp, 4
		mov	word_4F69E, 2019h
		push	6CBEh
		call	sub_3652D
		pop	cx
		pop	bp
		retf
sub_43CB2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43CE7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_43D2E
		mov	word ptr [si], 538Ah
		mov	word ptr [si+6], 5392h
		push	si
		nop
		push	cs
		call	near ptr JoystickManager_Construct_43C3A
		pop	cx
		push	0
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_35D92
		add	sp, 4
		mov	word ptr [si], 2019h
		push	si
		call	sub_3652D
		pop	cx
		test	di, 1
		jz	short loc_43D2E
		push	si
		call	sub_39C
		pop	cx

loc_43D2E:
		pop	di
		pop	si
		pop	bp
		retf
sub_43CE7		endp

; ----------------------------------------------------------------------

sub_43D32		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFAh
		nop
		nop
		jmp	sub_43C6F
sub_43D32		endp

; ----------------------------------------------------------------------

sub_43D3E		proc far
		mov	bx, sp
sub_43D3E		endp
seg169		ends
