seg200		segment	byte public 'CODE' use16
		assume cs:seg200
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, constructeur d'un nœud « callback joystick » : alloue (sub_658, 0x12 octets), pose deux
; tags vtable (4072h/4082h), initialise les champs (dont +0xC = seuil, +0xE = pointeur far
; d'écho). Référencée par sub_271DC et depuis seg203.
; ==============================================================================================
JoystickCallback_Construct_663D6	proc far		; CODE XREF: DOS_InstallCtrlBreakHandler+1AP
					; seg203:01FAP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_663DA:				; DATA XREF: seg216:0706o
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_663EF
		push	12h

loc_663E3:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6641B

loc_663EF:				; CODE XREF: JoystickCallback_Construct_663D6+9j
		mov	word ptr [si], 4072h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si], 4082h

loc_66401:
		mov	word ptr [si+0Ch], 0FFFFh
		mov	dword ptr [si+8], 0

loc_6640E:
		mov	dword ptr [si+0Eh], 0
		mov	word ptr [si+6], 0

loc_6641B:				; CODE XREF: JoystickCallback_Construct_663D6+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
JoystickCallback_Construct_663D6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère l'objet (sub_338).
; ==============================================================================================
JoystickCallback_Destruct_66420	proc far		; CODE XREF: seg047:0396P seg203:020AP
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_66421:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_6643E
		mov	word ptr [si], 4082h

loc_66432:
		test	ax, 1
		jz	short loc_6643E
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_6643E:				; CODE XREF: JoystickCallback_Destruct_66420+Cj
					; JoystickCallback_Destruct_66420+15j
		pop	si
		pop	bp
		retf
JoystickCallback_Destruct_66420	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, écrit une valeur (+8) et, si un pointeur far d'écho est configuré (+0xE), y recopie
; également la valeur — mécanisme de notification/miroir de valeur.
; ==============================================================================================
JoystickCallback_SetValueAndEcho_66441	proc far		; CODE XREF: JoystickCallback_UpdateAndNotifyChain_66461+3Dp
					; JoystickCallback_UpdateAndNotifyChain_66461+56p ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp

loc_66444:
		push	si

loc_66445:
		mov	si, [bp+arg_0]

loc_66448:
		mov	eax, [bp+arg_2]

loc_6644C:
		mov	[si+8],	eax

loc_66450:
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_6645E

loc_66457:
		les	bx, [si+0Eh]

loc_6645A:
		mov	es:[bx], eax

loc_6645E:				; CODE XREF: JoystickCallback_SetValueAndEcho_66441+14j
		pop	si
		pop	bp
		retf
JoystickCallback_SetValueAndEcho_66441	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 90 lignes, NON DÉTAILLÉE — combine LinkedList_Helper_5F401 (seg156),
; JoystickCallback_SetValueAndEcho_66441 (×2), sub_428 (externe), LinkedList_Remove_5F324
; (seg156) — met à jour et propage une valeur à travers une chaîne de callbacks liés.
; ==============================================================================================
JoystickCallback_UpdateAndNotifyChain_66461	proc far		; CODE XREF: JoystickCallback_FindOrTraverse_66573+3Dp
					; seg200:loc_665F0p ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_66462:
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		jmp	short loc_6647F
; ���������������������������������������������������������������������������

loc_66474:				; CODE XREF: JoystickCallback_UpdateAndNotifyChain_66461+2Dj
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ch]
		cmp	ax, [di+0Ch]
		jz	short loc_66490

loc_6647F:				; CODE XREF: JoystickCallback_UpdateAndNotifyChain_66461+11j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_5F401
		add	sp, 4
		or	ax, ax
		jnz	short loc_66474

loc_66490:				; CODE XREF: JoystickCallback_UpdateAndNotifyChain_66461+1Cj
		cmp	[bp+var_2], 0

loc_66494:
		jz	short loc_664A3

loc_66496:
		push	large dword ptr	[di+8]

loc_6649A:
		push	[bp+var_2]

loc_6649D:
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_66441

loc_664A1:
		jmp	short loc_664AF
; ���������������������������������������������������������������������������

loc_664A3:				; CODE XREF: JoystickCallback_UpdateAndNotifyChain_66461:loc_66494j
		push	large dword ptr	[di+8]

loc_664A7:
		push	word ptr [di+0Ch]
		call	CRT_SetVect

loc_664AF:				; CODE XREF: JoystickCallback_UpdateAndNotifyChain_66461:loc_664A1j
		add	sp, 6

loc_664B2:
		push	large 0
		push	di
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_66441
		add	sp, 6
		mov	word ptr [di+0Ch], 0FFFFh
		push	di

loc_664C3:
		push	si

loc_664C4:
		call	LinkedList_Remove_5F324
		add	sp, 4

loc_664CC:
		mov	word ptr [di+6], 0
		pop	di
		pop	si
		leave

locret_664D4:
		retf
JoystickCallback_UpdateAndNotifyChain_66461	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_419, JoystickCallback_SetValueAndEcho_66441, sub_428 et
; LinkedList_InsertAtHead_5F19C (seg156) — enregistre un callback dans une chaîne liée.
; ==============================================================================================
JoystickCallback_RegisterInChain_664D5	proc far		; CODE XREF: DOS_InstallCtrlBreakHandler+2FP
					; InputBinding_InitAndRegister_66E02+C3P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		push	bp

loc_664D6:
		mov	bp, sp

loc_664D8:
		sub	sp, 2
		push	si
		push	di

loc_664DD:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]

loc_664E3:
		mov	ax, [bp+arg_2]
		mov	[di+0Ch], ax

loc_664E9:
		mov	eax, [bp+arg_A]
		mov	[di+0Eh], eax
		push	[bp+arg_2]
		call	CRT_GetVect
		pop	cx
		push	dx
		push	ax
		push	di
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_66441
		add	sp, 6
		push	large [bp+arg_4]
		push	[bp+arg_2]
		call	CRT_SetVect
		add	sp, 6

loc_66513:
		push	di
		push	si
		call	LinkedList_InsertAtHead_5F19C
		add	sp, 4
		mov	[bp+var_2], si
		mov	ax, [bp+var_2]

loc_66523:
		mov	[di+6],	ax

loc_66526:
		pop	di

loc_66527:
		pop	si

locret_66528:
		leave
		retf
JoystickCallback_RegisterInChain_664D5	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si

loc_6652E:
		push	di
		mov	si, [bp+6]

loc_66532:
		mov	di, [bp+0Eh]
		mov	bx, [bp+8]
		mov	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		mov	eax, [bp+10h]
		mov	[di+0Eh], eax
		push	large dword ptr	[bx+8]
		push	di
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_66441
		add	sp, 6

loc_66552:
		cli

loc_66553:
		push	large dword ptr	[bp+0Ah]
		push	word ptr [bp+8]
		push	cs

loc_6655B:
		call	near ptr JoystickCallback_SetValueAndEcho_66441

loc_6655E:
		add	sp, 6
		sti
		push	di

loc_66563:
		push	word ptr [bp+8]
		push	si
		call	LinkedList_InsertAfter_5F1F8
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle LinkedList_Helper_5F3D5 (seg156) et JoystickCallback_UpdateAndNotifyChain_66461
; — parcourt/traite la chaîne de callbacks.
; ==============================================================================================
JoystickCallback_FindOrTraverse_66573	proc far		; CODE XREF: InputBinding_ReleaseJoystickCallback_66ED5+8P

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
		jz	short loc_665A5

loc_66589:				; CODE XREF: JoystickCallback_FindOrTraverse_66573:loc_665A3j
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ch]

loc_6658F:
		cmp	ax, [bp+arg_2]
		jz	short loc_665A5
		lea	ax, [bp+var_2]

loc_66597:
		push	ax
		push	si
		call	LinkedList_Helper_5F3D5
		add	sp, 4

loc_665A1:
		or	ax, ax

loc_665A3:
		jnz	short loc_66589

loc_665A5:				; CODE XREF: JoystickCallback_FindOrTraverse_66573+14j
					; JoystickCallback_FindOrTraverse_66573+1Fj
		cmp	[bp+var_2], 0
		jz	short loc_665B6
		push	[bp+var_2]

loc_665AE:
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_66461

loc_665B3:
		add	sp, 4

loc_665B6:				; CODE XREF: JoystickCallback_FindOrTraverse_66573+36j
		pop	si
		leave
		retf
JoystickCallback_FindOrTraverse_66573	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	di, di
		jz	short loc_665F6
		mov	ax, [si+2]
		mov	[bp-2],	ax

loc_665D1:				; CODE XREF: seg200:0215j
		cmp	[bp-2],	di
		jz	short loc_665E7
		lea	ax, [bp-2]
		push	ax
		push	si
		call	LinkedList_Helper_5F3D5
		add	sp, 4
		or	ax, ax
		jnz	short loc_665D1

loc_665E7:				; CODE XREF: seg200:0204j
		cmp	word ptr [bp-2], 0
		jz	short loc_665F6
		push	di
		push	si
		push	cs

loc_665F0:
		call	near ptr JoystickCallback_UpdateAndNotifyChain_66461

loc_665F3:
		add	sp, 4

loc_665F6:				; CODE XREF: seg200:01F9j seg200:021Bj
		pop	di

loc_665F7:
		pop	si
		leave

locret_665F9:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par les thunks vtable environnants (tags 5CECh, etc.) — constructeur du
; gestionnaire singleton de callbacks joystick.
; ==============================================================================================
JoystickManager_Construct_665FA	proc far		; CODE XREF: seg200:0267p seg200:02B5p ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_665FD:
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]

loc_66604:
		mov	ax, [si+2]
		mov	[bp+var_2], ax

loc_6660A:				; CODE XREF: JoystickManager_Construct_665FA+30j
		cmp	[bp+var_2], 0
		jz	short loc_6661B
		push	[bp+var_2]

loc_66613:
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_66461

loc_66618:
		add	sp, 4

loc_6661B:				; CODE XREF: JoystickManager_Construct_665FA+14j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_5F3D5
		add	sp, 4
		or	ax, ax
		jnz	short loc_6660A
		pop	si
		leave
		retf
JoystickManager_Construct_665FA	endp

; ���������������������������������������������������������������������������

loc_6662F:				; CODE XREF: seg200:loc_6672Aj
					; DATA XREF: seg339:off_7112Ao
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		push	cs
		call	near ptr JoystickManager_Construct_665FA
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — initialise le singleton gestionnaire
; joystick : pose des tags vtable (406Eh/129Eh/4076h/407Eh), lie l'ancienne liste globale
; word_70EA8 (PagedResourceC, seg134) en la remplaçant par une nouvelle valeur (5CF2h) —
; probable ré-affectation d'une variable de liste partagée entre systèmes distincts.
; ==============================================================================================
JoystickManager_InitSingleton_6663D:				; DATA XREF: seg339:off_71F3Eo
		push	bp
		mov	bp, sp
		mov	word_72D9C, 406Eh
		mov	word_72D9E, 0
		mov	word_72DA0, 0

loc_66652:
		mov	word_72DA2, 129Eh
		mov	ax, word_70EA8
		mov	word_72DA4, ax

loc_6665E:
		mov	word_70EA8, 5CF2h
		mov	word_72D9C, 4076h
		mov	word_72DA2, 407Eh
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — construit le singleton
; (JoystickManager_Construct_665FA, tag 5CECh) puis le détruit immédiatement dans un second
; temps (LinkedList_RemoveAllAndDestroy_5F397) — probable motif « test puis libération » ou
; séquence d'initialisation/nettoyage.
; ==============================================================================================
JoystickManager_RegisterSingleton_66672:				; DATA XREF: seg339:4F48o
		push	bp
		mov	bp, sp
		mov	word_72D9C, 4076h
		mov	word_72DA2, 407Eh
		push	5CECh
		push	cs
		call	near ptr JoystickManager_Construct_665FA
		pop	cx
		mov	word_72D9C, 406Eh

loc_6668F:
		push	5CECh
		call	LinkedList_RemoveAllAndDestroy_5F397
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — destructeur du gestionnaire : vide la chaîne
; de callbacks (LinkedList_RemoveAllAndDestroy_5F397), libère l'objet si demandé.
; ==============================================================================================
JoystickManager_Destruct_6669A:				; DATA XREF: seg339:off_7111Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_666C1
		mov	word ptr [si], 406Eh
		push	si

loc_666AE:
		call	LinkedList_RemoveAllAndDestroy_5F397

loc_666B3:
		pop	cx
		test	di, 1

loc_666B8:
		jz	short loc_666C1
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_666C1:				; CODE XREF: seg200:02D7j
					; seg200:loc_666B8j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — destructeur simple (tag 4072h) libérant
; l'objet si demandé.
; ==============================================================================================
JoystickCallback_DestructThunk_666C5:				; DATA XREF: seg339:off_71122o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		or	si, si
		jz	short loc_666E3
		mov	word ptr [si], 4072h
		test	ax, 1
		jz	short loc_666E3
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_666E3:				; CODE XREF: seg200:0301j seg200:030Aj
		pop	si

loc_666E4:
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — destructeur complet (tags 4076h/407Eh) :
; construit puis détruit un sous-état (JoystickManager_Construct_665FA,
; LinkedList_RemoveAllAndDestroy_5F397), libère l'objet si demandé.
; ==============================================================================================
JoystickCallback_DestructFull_666E6:				; DATA XREF: seg339:off_71126o
		push	bp

loc_666E7:
		mov	bp, sp
		push	si

loc_666EA:
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]

loc_666F1:
		or	si, si
		jz	short loc_6671D

loc_666F5:
		mov	word ptr [si], 4076h
		mov	word ptr [si+6], 407Eh
		push	si
		nop
		push	cs

loc_66701:
		call	near ptr JoystickManager_Construct_665FA
		pop	cx

loc_66705:
		mov	word ptr [si], 406Eh
		push	si

loc_6670A:
		call	LinkedList_RemoveAllAndDestroy_5F397
		pop	cx

loc_66710:
		test	di, 1

loc_66714:
		jz	short loc_6671D
		push	si

loc_66717:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_6671D:				; CODE XREF: seg200:0323j
					; seg200:loc_66714j
		pop	di
		pop	si
		pop	bp

locret_66720:
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, ajuste directement la pile de l'appelant (soustrait 6 octets à ss:[bx+4]) puis saute
; vers une adresse fixe (loc_6662F, à l'intérieur de JoystickManager_InitSingleton_6663D) —
; motif de thunk d'ajustement d'appel non standard.
; ==============================================================================================
Runtime_StackAdjustAndJump_66721:				; DATA XREF: seg339:off_7112Eo
		mov	bx, sp

loc_66723:
		add	word ptr ss:[bx+4], 0FFFAh
		nop
		nop

loc_6672A:
		jmp	loc_6662F
seg200		ends
