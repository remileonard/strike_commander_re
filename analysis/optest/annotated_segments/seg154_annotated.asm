seg154		segment	byte public 'CODE' use16
		assume cs:seg154
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à JoystickCallback_Construct_663D6 (sub_663D6 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; constructeur d'un nœud « callback joystick » : alloue (sub_658, 0x12 octets), pose deux tags
; vtable (4072h/4082h), initialise les champs (dont +0xC = seuil, +0xE = pointeur far d'écho).
; Référencée par sub_271DC et depuis seg203.
; ==============================================================================================
JoystickCallback_Construct_3DC46	proc far		; CODE XREF: sub_6846+1CP seg157:01FEP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_3DC4A:				; DATA XREF: seg170:05A6o
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3DC5F
		push	12h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3DC8B

loc_3DC5F:				; CODE XREF: JoystickCallback_Construct_3DC46+9j
		mov	word ptr [si], 4008h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si], 4A00h
		mov	word ptr [si+0Ch], 0FFFFh
		mov	dword ptr [si+8], 0
		mov	dword ptr [si+0Eh], 0
		mov	word ptr [si+6], 0

loc_3DC8B:				; CODE XREF: JoystickCallback_Construct_3DC46+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
JoystickCallback_Construct_3DC46	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3DC90	proc far		; CODE XREF: seg007:0200P seg157:020EP
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_3DCAE
		mov	word ptr [si], 4A00h
		test	ax, 1
		jz	short loc_3DCAE
		push	si
		call	sub_308
		pop	cx

loc_3DCAE:				; CODE XREF: sub_3DC90+Cj
					; sub_3DC90+15j
		pop	si
		pop	bp
		retf
sub_3DC90	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JoystickCallback_SetValueAndEcho_66441 (sub_66441 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, écrit une valeur (+8) et, si un
; pointeur far d'écho est configuré (+0xE), y recopie également la valeur — mécanisme de
; notification/miroir de valeur.
; ==============================================================================================
JoystickCallback_SetValueAndEcho_3DCB1	proc far		; CODE XREF: JoystickCallback_UpdateAndNotifyChain_3DCD1+3Dp
					; JoystickCallback_UpdateAndNotifyChain_3DCD1+56p ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si+8],	eax
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_3DCCE
		les	bx, [si+0Eh]
		mov	es:[bx], eax

loc_3DCCE:				; CODE XREF: JoystickCallback_SetValueAndEcho_3DCB1+14j
		pop	si
		pop	bp
		retf
JoystickCallback_SetValueAndEcho_3DCB1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JoystickCallback_UpdateAndNotifyChain_66461 (sub_66461 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 90 lignes, NON DÉTAILLÉE —
; combine LinkedList_Helper_5F401 (seg156), JoystickCallback_SetValueAndEcho_66441 (×2),
; sub_428 (externe), LinkedList_Remove_5F324 (seg156) — met à jour et propage une valeur à
; travers une chaîne de callbacks liés.
; ==============================================================================================
JoystickCallback_UpdateAndNotifyChain_3DCD1	proc far		; CODE XREF: JoystickCallback_FindOrTraverse_3DDE3+3Dp
					; seg154:0220p	...

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
		jmp	short loc_3DCEF
; ���������������������������������������������������������������������������

loc_3DCE4:				; CODE XREF: JoystickCallback_UpdateAndNotifyChain_3DCD1+2Dj
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ch]
		cmp	ax, [di+0Ch]
		jz	short loc_3DD00

loc_3DCEF:				; CODE XREF: JoystickCallback_UpdateAndNotifyChain_3DCD1+11j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_2FC76
		add	sp, 4
		or	ax, ax
		jnz	short loc_3DCE4

loc_3DD00:				; CODE XREF: JoystickCallback_UpdateAndNotifyChain_3DCD1+1Cj
		cmp	[bp+var_2], 0
		jz	short loc_3DD13
		push	large dword ptr	[di+8]
		push	[bp+var_2]
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_3DCB1
		jmp	short loc_3DD1F
; ���������������������������������������������������������������������������

loc_3DD13:				; CODE XREF: JoystickCallback_UpdateAndNotifyChain_3DCD1+33j
		push	large dword ptr	[di+8]
		push	word ptr [di+0Ch]
		call	CRT_SetVect

loc_3DD1F:				; CODE XREF: JoystickCallback_UpdateAndNotifyChain_3DCD1+40j
		add	sp, 6
		push	large 0
		push	di
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_3DCB1
		add	sp, 6
		mov	word ptr [di+0Ch], 0FFFFh
		push	di
		push	si
		call	LinkedList_Remove_2FB99
		add	sp, 4
		mov	word ptr [di+6], 0
		pop	di
		pop	si
		leave
		retf
JoystickCallback_UpdateAndNotifyChain_3DCD1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JoystickCallback_RegisterInChain_664D5 (sub_664D5 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_419,
; JoystickCallback_SetValueAndEcho_66441, sub_428 et LinkedList_InsertAtHead_5F19C (seg156) —
; enregistre un callback dans une chaîne liée.
; ==============================================================================================
JoystickCallback_RegisterInChain_3DD45	proc far		; CODE XREF: sub_6846+34P
					; InputBinding_InitAndRegister_3E626+C3P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

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
		call	near ptr JoystickCallback_SetValueAndEcho_3DCB1
		add	sp, 6
		push	large [bp+arg_4]
		push	[bp+arg_2]
		call	CRT_SetVect
		add	sp, 6
		push	di
		push	si
		call	LinkedList_InsertAtHead_2FA11
		add	sp, 4
		mov	[bp+var_2], si
		mov	ax, [bp+var_2]
		mov	[di+6],	ax
		pop	di
		pop	si
		leave
		retf
JoystickCallback_RegisterInChain_3DD45	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Eh]
		mov	bx, [bp+8]
		mov	ax, [bx+0Ch]
		mov	[di+0Ch], ax
		mov	eax, [bp+10h]
		mov	[di+0Eh], eax
		push	large dword ptr	[bx+8]
		push	di
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_3DCB1
		add	sp, 6
		cli
		push	large dword ptr	[bp+0Ah]
		push	word ptr [bp+8]
		push	cs
		call	near ptr JoystickCallback_SetValueAndEcho_3DCB1
		add	sp, 6
		sti
		push	di
		push	word ptr [bp+8]
		push	si
		call	LinkedList_InsertAfter_2FA6D
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JoystickCallback_FindOrTraverse_66573 (sub_66573 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, appelle LinkedList_Helper_5F3D5 (seg156) et
; JoystickCallback_UpdateAndNotifyChain_66461 — parcourt/traite la chaîne de callbacks.
; ==============================================================================================
JoystickCallback_FindOrTraverse_3DDE3	proc far		; CODE XREF: InputBinding_ReleaseJoystickCallback_3E6F9+8P

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
		jz	short loc_3DE15

loc_3DDF9:				; CODE XREF: JoystickCallback_FindOrTraverse_3DDE3+30j
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ch]
		cmp	ax, [bp+arg_2]
		jz	short loc_3DE15
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_3DDF9

loc_3DE15:				; CODE XREF: JoystickCallback_FindOrTraverse_3DDE3+14j
					; JoystickCallback_FindOrTraverse_3DDE3+1Fj
		cmp	[bp+var_2], 0
		jz	short loc_3DE26
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_3DCD1
		add	sp, 4

loc_3DE26:				; CODE XREF: JoystickCallback_FindOrTraverse_3DDE3+36j
		pop	si
		leave
		retf
JoystickCallback_FindOrTraverse_3DDE3	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	di, di
		jz	short loc_3DE66
		mov	ax, [si+2]
		mov	[bp-2],	ax

loc_3DE41:				; CODE XREF: seg154:0215j
		cmp	[bp-2],	di
		jz	short loc_3DE57
		lea	ax, [bp-2]
		push	ax
		push	si
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_3DE41

loc_3DE57:				; CODE XREF: seg154:0204j
		cmp	word ptr [bp-2], 0
		jz	short loc_3DE66
		push	di
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_3DCD1
		add	sp, 4

loc_3DE66:				; CODE XREF: seg154:01F9j seg154:021Bj
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JoystickManager_Construct_665FA (sub_665FA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par les thunks vtable environnants
; (tags 5CECh, etc.) — constructeur du gestionnaire singleton de callbacks joystick.
; ==============================================================================================
JoystickManager_Construct_3DE6A	proc far		; CODE XREF: seg154:0267p seg154:02B5p ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2]
		mov	[bp+var_2], ax

loc_3DE7A:				; CODE XREF: JoystickManager_Construct_3DE6A+30j
		cmp	[bp+var_2], 0
		jz	short loc_3DE8B
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr JoystickCallback_UpdateAndNotifyChain_3DCD1
		add	sp, 4

loc_3DE8B:				; CODE XREF: JoystickManager_Construct_3DE6A+14j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_3DE7A
		pop	si
		leave
		retf
JoystickManager_Construct_3DE6A	endp

; ���������������������������������������������������������������������������

loc_3DE9F:				; CODE XREF: seg154:030Ej
					; DATA XREF: dseg:49F8o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		push	cs
		call	near ptr JoystickManager_Construct_3DE6A
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3DEAD:				; DATA XREF: dseg:594Co
		push	bp
		mov	bp, sp
		mov	word_496EC, 18B7h
		mov	word_496EE, 0
		mov	word_496F0, 0
		mov	word_496F2, 13A4h
		mov	ax, word_4703A
		mov	word_496F4, ax
		mov	word_4703A, 66D2h
		mov	word_496EC, 49F4h
		mov	word_496F2, 49FCh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3DEE2:				; DATA XREF: dseg:59E8o
		push	bp
		mov	bp, sp
		mov	word_496EC, 49F4h
		mov	word_496F2, 49FCh
		push	66CCh
		push	cs
		call	near ptr JoystickManager_Construct_3DE6A
		pop	cx
		mov	word_496EC, 18B7h
		push	66CCh
		call	sub_2FC0C
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3DF0A:				; DATA XREF: dseg:49F4o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_3DF41
		mov	word ptr [si], 49F4h
		mov	word ptr [si+6], 49FCh
		push	si
		nop
		push	cs
		call	near ptr JoystickManager_Construct_3DE6A
		pop	cx
		mov	word ptr [si], 18B7h
		push	si
		call	sub_2FC0C
		pop	cx
		test	di, 1
		jz	short loc_3DF41
		push	si
		call	sub_308
		pop	cx

loc_3DF41:				; CODE XREF: seg154:02D7j seg154:02F8j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3DF45:				; DATA XREF: dseg:49FCo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFAh
		nop
		nop
		jmp	loc_3DE9F
seg154		ends
