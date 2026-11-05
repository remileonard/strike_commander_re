seg209		segment	para public 'CODE' use16
		assume cs:seg209
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
JoystickCallback_Construct_6E5A6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6E5BF
		push	12h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6E5EB

loc_6E5BF:
		mov	word ptr [si], 4844h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si], 4AD2h
		mov	word ptr [si+0Ch], 0FFFFh
		mov	dword ptr [si+8], 0
		mov	dword ptr [si+0Eh], 0
		mov	word ptr [si+6], 0

loc_6E5EB:
		mov	ax, si
		pop	si
		pop	bp
		retf
JoystickCallback_Construct_6E5A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E5F0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_6E60E
		mov	word ptr [si], 4AD2h
		test	ax, 1
		jz	short loc_6E60E
		push	si
		call	sub_3B2
		pop	cx

loc_6E60E:
		pop	si
		pop	bp
		retf
sub_6E5F0		endp

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
JoystickCallback_SetValueAndEcho_6E611		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si+8], eax
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_6E62E
		les	bx, [si+0Eh]
		mov	es:[bx], eax

loc_6E62E:
		pop	si
		pop	bp
		retf
JoystickCallback_SetValueAndEcho_6E611		endp

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
JoystickCallback_UpdateAndNotifyChain_6E631		proc far

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
		jmp	short loc_6E64F

loc_6E644:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ch]
		cmp	ax, [di+0Ch]
		jz	short loc_6E660

loc_6E64F:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_689A2
		add	sp, 4
		or	ax, ax
		jnz	short loc_6E644

loc_6E660:
		cmp	[bp+var_2], 0
		jz	short loc_6E673
		push	large [di+8]
		push	[bp+var_2]
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_6E611
		jmp	short loc_6E67F

loc_6E673:
		push	large [di+8]
		push	word ptr [di+0Ch]
		call	CRT_SetVect

loc_6E67F:
		add	sp, 6
		push	large 0
		push	di
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_6E611
		add	sp, 6
		mov	word ptr [di+0Ch], 0FFFFh
		push	di
		push	si
		call	LinkedList_Remove_688C5
		add	sp, 4
		mov	word ptr [di+6], 0
		pop	di
		pop	si
		leave
		retf
JoystickCallback_UpdateAndNotifyChain_6E631		endp

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
JoystickCallback_RegisterInChain_6E6A5		proc far

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
		call	near ptr JoystickCallback_SetValueAndEcho_6E611
		add	sp, 6
		push	large [bp+arg_4]
		push	[bp+arg_2]
		call	CRT_SetVect
		add	sp, 6
		push	di
		push	si
		call	LinkedList_InsertAtHead_6873D
		add	sp, 4
		mov	[bp+var_2], si
		mov	ax, [bp+var_2]
		mov	[di+6], ax
		pop	di
		pop	si
		leave
		retf
JoystickCallback_RegisterInChain_6E6A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E6FA		proc far

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
		call	near ptr JoystickCallback_SetValueAndEcho_6E611
		add	sp, 6
		cli
		push	large [bp+arg_4]
		push	[bp+arg_2]
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_6E611
		add	sp, 6
		sti
		push	di
		push	[bp+arg_2]
		push	si
		call	LinkedList_InsertAfter_68799
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_6E6FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JoystickCallback_FindOrTraverse_66573 (sub_66573 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, appelle LinkedList_Helper_5F3D5 (seg156) et
; JoystickCallback_UpdateAndNotifyChain_66461 — parcourt/traite la chaîne de callbacks.
; ==============================================================================================
JoystickCallback_FindOrTraverse_6E743		proc far

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
		jz	short loc_6E775

loc_6E759:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ch]
		cmp	ax, [bp+arg_2]
		jz	short loc_6E775
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_6E759

loc_6E775:
		cmp	[bp+var_2], 0
		jz	short loc_6E786
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_6E631
		add	sp, 4

loc_6E786:
		pop	si
		leave
		retf
JoystickCallback_FindOrTraverse_6E743		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E789		proc far

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
		jz	short loc_6E7C6
		mov	ax, [si+2]
		mov	[bp+var_2], ax

loc_6E7A1:
		cmp	[bp+var_2], di
		jz	short loc_6E7B7
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_6E7A1

loc_6E7B7:
		cmp	[bp+var_2], 0
		jz	short loc_6E7C6
		push	di
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_6E631
		add	sp, 4

loc_6E7C6:
		pop	di
		pop	si
		leave
		retf
sub_6E789		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JoystickManager_Construct_665FA (sub_665FA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par les thunks vtable environnants
; (tags 5CECh, etc.) — constructeur du gestionnaire singleton de callbacks joystick.
; ==============================================================================================
JoystickManager_Construct_6E7CA		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2]
		mov	[bp+var_2], ax

loc_6E7DA:
		cmp	[bp+var_2], 0
		jz	short loc_6E7EB
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_6E631
		add	sp, 4

loc_6E7EB:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_6E7DA
		pop	si
		leave
		retf
JoystickManager_Construct_6E7CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E7FF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr JoystickManager_Construct_6E7CA
		pop	cx
		pop	bp
		retf
sub_6E7FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E80D		proc far
		push	bp
		mov	bp, sp
		mov	word_7D2DC, 402Dh
		mov	word_7D2DE, 0
		mov	word_7D2E0, 0
		mov	word_7D2E2, 0D7Ch
		mov	ax, word_7AFA2
		mov	word_7D2E4, ax
		mov	word_7AFA2, 6BB2h
		mov	word_7D2DC, 4AC2h
		mov	word_7D2E2, 4ACAh
		pop	bp
		retf
sub_6E80D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E842		proc far
		push	bp
		mov	bp, sp
		mov	word_7D2DC, 4AC2h
		mov	word_7D2E2, 4ACAh
		push	6BACh
		push	cs
		call	near ptr JoystickManager_Construct_6E7CA
		pop	cx
		push	0
		push	6BB2h
		call	sub_68298
		add	sp, 4
		mov	word_7D2DC, 402Dh
		push	6BACh
		call	sub_68938
		pop	cx
		pop	bp
		retf
sub_6E842		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E877		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6E8BE
		mov	word ptr [si], 4AC2h
		mov	word ptr [si+6], 4ACAh
		push	si
		nop
		push	cs
		call	near ptr JoystickManager_Construct_6E7CA
		pop	cx
		push	0
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_68298
		add	sp, 4
		mov	word ptr [si], 402Dh
		push	si
		call	sub_68938
		pop	cx
		test	di, 1
		jz	short loc_6E8BE
		push	si
		call	sub_3B2
		pop	cx

loc_6E8BE:
		pop	di
		pop	si
		pop	bp
		retf
sub_6E877		endp

; ----------------------------------------------------------------------

sub_6E8C2		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFAh
		nop
		nop
		jmp	sub_6E7FF
sub_6E8C2		endp

; ----------------------------------------------------------------------

sub_6E8CE		proc far
		mov	bx, sp
sub_6E8CE		endp
seg209		ends
