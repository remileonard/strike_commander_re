seg166		segment	para public 'CODE' use16
		assume cs:seg166
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 69h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à JoystickCallback_Construct_6E5A6 (sub_6E5A6 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
JoystickCallback_Construct_54FE2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_54FFB
		push	12h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_55027

loc_54FFB:
		mov	word ptr [si], 401Ah
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si], 4A18h
		mov	word ptr [si+0Ch], 0FFFFh
		mov	dword ptr [si+8], 0
		mov	dword ptr [si+0Eh], 0
		mov	word ptr [si+6], 0

loc_55027:
		mov	ax, si
		pop	si
		pop	bp
		retf
JoystickCallback_Construct_54FE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5502C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_5504A
		mov	word ptr [si], 4A18h
		test	ax, 1
		jz	short loc_5504A
		push	si
		call	sub_33B
		pop	cx

loc_5504A:
		pop	si
		pop	bp
		retf
sub_5502C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; JoystickCallback_SetValueAndEcho_6E611 (sub_6E611 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à JoystickCallback_SetValueAndEcho_3DCB1 (sub_3DCB1 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; JoystickCallback_SetValueAndEcho_66441 (sub_66441 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, écrit une valeur (+8) et, si un
; pointeur far d'écho est configuré (+0xE), y recopie également la valeur — mécanisme de
; notification/miroir de valeur.
; ==============================================================================================
JoystickCallback_SetValueAndEcho_5504D		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si+8], eax
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_5506A
		les	bx, [si+0Eh]
		mov	es:[bx], eax

loc_5506A:
		pop	si
		pop	bp
		retf
JoystickCallback_SetValueAndEcho_5504D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; JoystickCallback_UpdateAndNotifyChain_6E631 (sub_6E631 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à JoystickCallback_UpdateAndNotifyChain_3DCD1 (sub_3DCD1 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à JoystickCallback_UpdateAndNotifyChain_66461
; (sub_66461 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⚠️ far, 90 lignes, NON DÉTAILLÉE — combine LinkedList_Helper_5F401 (seg156),
; JoystickCallback_SetValueAndEcho_66441 (×2), sub_428 (externe), LinkedList_Remove_5F324
; (seg156) — met à jour et propage une valeur à travers une chaîne de callbacks liés.
; ==============================================================================================
JoystickCallback_UpdateAndNotifyChain_5506D		proc far

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
		jmp	short loc_5508B

loc_55080:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ch]
		cmp	ax, [di+0Ch]
		jz	short loc_5509C

loc_5508B:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_485A4
		add	sp, 4
		or	ax, ax
		jnz	short loc_55080

loc_5509C:
		cmp	[bp+var_2], 0
		jz	short loc_550AF
		push	large [di+8]
		push	[bp+var_2]
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_5504D
		jmp	short loc_550BB

loc_550AF:
		push	large [di+8]
		push	word ptr [di+0Ch]
		call	CRT_SetVect

loc_550BB:
		add	sp, 6
		push	large 0
		push	di
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_5504D
		add	sp, 6
		mov	word ptr [di+0Ch], 0FFFFh
		push	di
		push	si
		call	LinkedList_Remove_484C7
		add	sp, 4
		mov	word ptr [di+6], 0
		pop	di
		pop	si
		leave
		retf
JoystickCallback_UpdateAndNotifyChain_5506D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; JoystickCallback_RegisterInChain_6E6A5 (sub_6E6A5 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à JoystickCallback_RegisterInChain_3DD45 (sub_3DD45 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; JoystickCallback_RegisterInChain_664D5 (sub_664D5 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_419,
; JoystickCallback_SetValueAndEcho_66441, sub_428 et LinkedList_InsertAtHead_5F19C (seg156) —
; enregistre un callback dans une chaîne liée.
; ==============================================================================================
JoystickCallback_RegisterInChain_550E1		proc far

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
		call	near ptr JoystickCallback_SetValueAndEcho_5504D
		add	sp, 6
		push	large [bp+arg_4]
		push	[bp+arg_2]
		call	CRT_SetVect
		add	sp, 6
		push	di
		push	si
		call	LinkedList_InsertAtHead_4833F
		add	sp, 4
		mov	[bp+var_2], si
		mov	ax, [bp+var_2]
		mov	[di+6], ax
		pop	di
		pop	si
		leave
		retf
JoystickCallback_RegisterInChain_550E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55136		proc far

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
		call	near ptr JoystickCallback_SetValueAndEcho_5504D
		add	sp, 6
		cli
		push	large [bp+arg_4]
		push	[bp+arg_2]
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_5504D
		add	sp, 6
		sti
		push	di
		push	[bp+arg_2]
		push	si
		call	LinkedList_InsertAfter_4839B
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_55136		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; JoystickCallback_FindOrTraverse_6E743 (sub_6E743 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à JoystickCallback_FindOrTraverse_66573 (sub_66573 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle LinkedList_Helper_5F3D5 (seg156) et JoystickCallback_UpdateAndNotifyChain_66461 —
; parcourt/traite la chaîne de callbacks.
; ==============================================================================================
JoystickCallback_FindOrTraverse_5517F		proc far

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
		jz	short loc_551B1

loc_55195:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ch]
		cmp	ax, [bp+arg_2]
		jz	short loc_551B1
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_55195

loc_551B1:
		cmp	[bp+var_2], 0
		jz	short loc_551C2
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_5506D
		add	sp, 4

loc_551C2:
		pop	si
		leave
		retf
JoystickCallback_FindOrTraverse_5517F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_551C5		proc far

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
		jz	short loc_55202
		mov	ax, [si+2]
		mov	[bp+var_2], ax

loc_551DD:
		cmp	[bp+var_2], di
		jz	short loc_551F3
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_551DD

loc_551F3:
		cmp	[bp+var_2], 0
		jz	short loc_55202
		push	di
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_5506D
		add	sp, 4

loc_55202:
		pop	di
		pop	si
		leave
		retf
sub_551C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; JoystickManager_Construct_6E7CA (sub_6E7CA de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à JoystickManager_Construct_665FA (sub_665FA de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par les thunks
; vtable environnants (tags 5CECh, etc.) — constructeur du gestionnaire singleton de callbacks
; joystick.
; ==============================================================================================
JoystickManager_Construct_55206		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2]
		mov	[bp+var_2], ax

loc_55216:
		cmp	[bp+var_2], 0
		jz	short loc_55227
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_5506D
		add	sp, 4

loc_55227:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_55216
		pop	si
		leave
		retf
JoystickManager_Construct_55206		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5523B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr JoystickManager_Construct_55206
		pop	cx
		pop	bp
		retf
sub_5523B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55249		proc far
		push	bp
		mov	bp, sp
		mov	word_6056A, 1DEFh
		mov	word_6056C, 0
		mov	word_6056E, 0
		mov	word_60570, 96Dh
		mov	ax, word_5DD68
		mov	word_60572, ax
		mov	word_5DD68, 6850h
		mov	word_6056A, 4A08h
		mov	word_60570, 4A10h
		pop	bp
		retf
sub_55249		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5527E		proc far
		push	bp
		mov	bp, sp
		mov	word_6056A, 4A08h
		mov	word_60570, 4A10h
		push	684Ah
		push	cs
		call	near ptr JoystickManager_Construct_55206
		pop	cx
		push	0
		push	6850h
		call	sub_47DAD
		add	sp, 4
		mov	word_6056A, 1DEFh
		push	684Ah
		call	sub_4853A
		pop	cx
		pop	bp
		retf
sub_5527E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_552B3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_552FA
		mov	word ptr [si], 4A08h
		mov	word ptr [si+6], 4A10h
		push	si
		nop
		push	cs
		call	near ptr JoystickManager_Construct_55206
		pop	cx
		push	0
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_47DAD
		add	sp, 4
		mov	word ptr [si], 1DEFh
		push	si
		call	sub_4853A
		pop	cx
		test	di, 1
		jz	short loc_552FA
		push	si
		call	sub_33B
		pop	cx

loc_552FA:
		pop	di
		pop	si
		pop	bp
		retf
sub_552B3		endp

; ----------------------------------------------------------------------

sub_552FE		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFAh
		nop
		nop
		jmp	sub_5523B
sub_552FE		endp

; ----------------------------------------------------------------------

sub_5530A		proc far
		mov	bx, sp
sub_5530A		endp

; START OF FUNCTION CHUNK FOR sub_5530A
		db 36h, 83h, 47h, 4
; END OF FUNCTION CHUNK FOR sub_5530A
seg166		ends
