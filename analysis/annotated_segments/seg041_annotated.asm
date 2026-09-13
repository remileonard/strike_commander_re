seg041		segment	byte public 'CODE' use16
		assume cs:seg041
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,53L — constructeur d'une entrée de journal de mission (type 0x119C, priorité 2)
; référençant une cible (di) et son nom (vtable[0x14]) : création d'une entrée de
; kneeboard/log de mission liée à un objet.
; ==============================================================================================
Kneeboard_EntryConstructObj	proc far		; CODE XREF: Kneeboard_AddEntryObj+10p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_2343C
		push	1Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_23491

loc_2343C:				; CODE XREF: Kneeboard_EntryConstructObj+Dj
		mov	word ptr [si], 8DAh
		mov	word ptr [si+2], 0
		mov	word ptr [si], 119Ch
		mov	ax, si
		add	ax, 5
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	[si+0Eh], di
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		mov	[si+4],	al
		add	di, 53h	; 'S'
		mov	eax, [di]
		mov	[si+5],	eax
		mov	eax, [di+4]
		mov	[si+9],	eax
		mov	byte ptr [si+0Dh], 0

loc_23491:				; CODE XREF: Kneeboard_EntryConstructObj+1Bj
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
Kneeboard_EntryConstructObj	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,103L — variante de sub_2341F construisant une entrée de journal à partir d'un texte brut
; (via sub_5C6F3, constructeur String) plutôt que d'une référence d'objet : création d'une
; entrée de kneeboard/log de mission avec message texte libre.
; ==============================================================================================
Kneeboard_EntryConstructText	proc far		; CODE XREF: Kneeboard_AddEntryText+14p

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		or	si, si
		jnz	short loc_234BA
		push	1Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_234BA
		jmp	loc_2358D
; ���������������������������������������������������������������������������

loc_234BA:				; CODE XREF: Kneeboard_EntryConstructText+10j
					; Kneeboard_EntryConstructText+1Ej
		mov	word ptr [si], 8DAh
		mov	word ptr [si+2], 0
		mov	word ptr [si], 119Ch
		mov	ax, si
		add	ax, 5
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+0Eh], 0
		mov	al, [bp+arg_2]
		mov	[si+4],	al
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	large dword ptr	[di+72h]
		push	0
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		push	0
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		push	8
		push	dx
		push	ax
		push	ds
		mov	ax, si
		add	ax, 5
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	byte ptr [si+0Dh], 0

loc_2358D:				; CODE XREF: Kneeboard_EntryConstructText+20j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Kneeboard_EntryConstructText	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,265L — switch à 20 cas sur un code de message (+4), chaque cas formate un texte
; (sub_5C832 et alentours) dans un buffer de 0x80 octets : moteur de rendu des messages du
; journal de mission/kneeboard, un cas par type d'événement. || case 0x13 = objet caméra COMP
; (2026-08-30) : chaque case du switch (codes de type CAMR :
; CHAS=3/CKPT=4/VICT=7/ROTA=8/TARG=9/WEAP=0xB/COMP=0x13) mappe le payload brut ([entry+0x10],
; len [entry+0x16]) puis appelle un constructeur d'objet type-spécifique via stub
; (0x03->6B116, 0x07->6AFC9, 0x08->6B019, 0x09->6B041, 0x0B->6AF6C,
; 0x13->6AC3E=AIManeuver_LoadFormationDataB_77FCA). L'objet construit est mémorisé dans
; [entry+0x0E]. Pour COMP (0x13) : en plus, [obj+0x80]=payload+0x1C (début script keyframe),
; [obj+0x86]=payloadLen-0x1C. Voir DATA_MODEL.md §6.6b b-bis.
; ==============================================================================================
Kneeboard_RenderEntry	proc far		; CODE XREF: Mission_TriggerEvaluator+D4P
					; Kneeboard_FindByIDContinue+48p ...

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_235A7
		jmp	loc_23780
; ���������������������������������������������������������������������������

loc_235A7:				; CODE XREF: Kneeboard_RenderEntry+Fj
		xor	di, di
		mov	al, [si+4]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 13h		; switch 20 cases
		jbe	short loc_235B8
		jmp	loc_2377D	; default
; ���������������������������������������������������������������������������

loc_235B8:				; CODE XREF: Kneeboard_RenderEntry+20j
		shl	bx, 1
		jmp	cs:off_23784[bx] ; switch jump

loc_235BF:				; DATA XREF: seg041:off_23784o
		push	0		; case 0x0
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		push	80h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_23615
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx

loc_235F3:
		mov	word ptr [di+50h], 484h
		mov	ax, di

loc_235FA:
		add	ax, 53h	; 'S'

loc_235FD:
		push	ax

loc_235FE:
		call	String_ConstructEmpty
		pop	cx

loc_23604:
		push	large [bp+var_4]
		push	di
		call	VROOMM_StubThunk_6BC21
		add	sp, 6
		mov	ax, di
		jmp	short loc_23617
; ���������������������������������������������������������������������������

loc_23615:				; CODE XREF: Kneeboard_RenderEntry+54j
		mov	ax, di

loc_23617:				; CODE XREF: Kneeboard_RenderEntry+80j
		mov	di, ax
		jmp	loc_2377D	; default
; ���������������������������������������������������������������������������

loc_2361C:				; CODE XREF: Kneeboard_RenderEntry+27j
					; DATA XREF: seg041:off_23784o
		push	0		; case 0x1
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	VROOMM_StubThunk_6B0FD
		jmp	loc_236FC
; ���������������������������������������������������������������������������

loc_2363D:				; CODE XREF: Kneeboard_RenderEntry+27j
					; DATA XREF: seg041:off_23784o
		push	0		; case 0x3
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	VROOMM_StubThunk_6B116
		jmp	loc_236FC
; ���������������������������������������������������������������������������

loc_2365E:				; CODE XREF: Kneeboard_RenderEntry+27j
					; DATA XREF: seg041:off_23784o
		push	0		; case 0x6
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832

loc_23670:
		add	sp, 0Ah

loc_23673:
		push	dx
		push	ax

loc_23675:
		push	0
		call	VROOMM_StubThunk_6AFF1
		jmp	short loc_236FC
; ���������������������������������������������������������������������������

loc_2367E:				; CODE XREF: Kneeboard_RenderEntry+27j
					; DATA XREF: seg041:off_23784o
		push	0		; case 0x7
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	VROOMM_StubThunk_6AFC9
		jmp	short loc_236FC
; ���������������������������������������������������������������������������

loc_2369E:				; CODE XREF: Kneeboard_RenderEntry+27j
					; DATA XREF: seg041:off_23784o
		push	0		; case 0x8
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	VROOMM_StubThunk_6B019
		jmp	short loc_236FC
; ���������������������������������������������������������������������������

loc_236BE:				; CODE XREF: Kneeboard_RenderEntry+27j
					; DATA XREF: seg041:off_23784o
		push	0		; case 0x9
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	VROOMM_StubThunk_6B041
		jmp	short loc_236FC
; ���������������������������������������������������������������������������

loc_236DE:				; CODE XREF: Kneeboard_RenderEntry+27j
					; DATA XREF: seg041:off_23784o
		push	0		; case 0xB
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	0

loc_236F7:
		call	VROOMM_StubThunk_6AF6C

loc_236FC:				; CODE XREF: Kneeboard_RenderEntry+A7j
					; Kneeboard_RenderEntry+C8j ...
		add	sp, 6

loc_236FF:
		mov	di, ax
		jmp	short loc_2377D	; default
; ���������������������������������������������������������������������������

loc_23703:				; CODE XREF: Kneeboard_RenderEntry+27j
					; DATA XREF: seg041:off_23784o
		push	0		; case 0x13
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	VROOMM_StubThunk_6AC3E
		add	sp, 6
		mov	di, ax
		mov	eax, [si+16h]
		add	eax, 0FFFFFFE4h
		mov	[bp+var_8], eax
		push	0
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		add	word ptr [bp+var_C], 1Ch
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		mov	[di+80h], eax
		mov	eax, [bp+var_14]
		mov	[di+86h], eax
		mov	byte ptr [di+84h], 2
		mov	byte ptr [di+85h], 0

loc_2377D:				; CODE XREF: Kneeboard_RenderEntry+22j
					; Kneeboard_RenderEntry+27j ...
		mov	[si+0Eh], di	; default

loc_23780:				; CODE XREF: Kneeboard_RenderEntry+11j
		pop	di
		pop	si
		leave

locret_23783:
		retf
Kneeboard_RenderEntry	endp

; ���������������������������������������������������������������������������
off_23784	dw offset loc_235BF	; DATA XREF: Kneeboard_RenderEntry+27r
		dw offset loc_2361C	; jump table for switch	statement
		dw offset loc_2377D
		dw offset loc_2363D
		dw offset loc_2377D
		dw offset loc_2377D
		dw offset loc_2365E
		dw offset loc_2367E
		dw offset loc_2369E
		dw offset loc_236BE
		dw offset loc_2377D
		dw offset loc_236DE
		dw offset loc_2377D
		dw offset loc_2377D
		dw offset loc_2377D
		dw offset loc_2377D
		dw offset loc_2377D
		dw offset loc_2377D
		dw offset loc_2377D
		dw offset loc_23703

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,55L — décrémente une référence sur la cible associée (+0xE, vtable[4]/[0]) puis notifie
; sa destruction (vtable[0xC], code 3) si nécessaire : destructeur d'entrée de journal avec
; libération de référence à la cible.
; ==============================================================================================
Kneeboard_EntryDestruct	proc far		; CODE XREF: Mission_TriggerEvaluator+B3P
					; Kneeboard_ClearAll+15p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_237FE
		mov	bx, [si+0Eh]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jz	short loc_237CE
		push	bx
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		pop	cx

loc_237CE:				; CODE XREF: Kneeboard_EntryDestruct+18j
		cmp	dword ptr [si+10h], 0
		jz	short loc_237DA
		mov	ax, 1
		jmp	short loc_237DC
; ���������������������������������������������������������������������������

loc_237DA:				; CODE XREF: Kneeboard_EntryDestruct+27j
		xor	ax, ax

loc_237DC:				; CODE XREF: Kneeboard_EntryDestruct+2Cj
		or	ax, ax
		jz	short loc_237FE
		cmp	word ptr [si+0Eh], 0
		jz	short loc_237F9
		push	3
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]

loc_237F1:
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short $+2

loc_237F9:				; CODE XREF: Kneeboard_EntryDestruct+38j
		mov	word ptr [si+0Eh], 0

loc_237FE:				; CODE XREF: Kneeboard_EntryDestruct+Bj
					; Kneeboard_EntryDestruct+32j
		pop	si
		pop	bp
		retf
Kneeboard_EntryDestruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,64L — variante de sub_237AC libérant en plus la chaîne de texte associée (+0x10 via
; sub_5C7B6) : destructeur complet d'entrée de journal (référence cible + texte).
; ==============================================================================================
Kneeboard_EntryDestructFull	proc far		; CODE XREF: Kneeboard_RemoveByTarget+1Fp
					; Kneeboard_ClearAllFull+10p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_23841
		mov	bx, [si+0Eh]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jz	short loc_23823
		push	bx
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		pop	cx

loc_23823:				; CODE XREF: Kneeboard_EntryDestructFull+18j
		cmp	word ptr [si+0Eh], 0
		jz	short loc_2383C
		push	3
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short $+2

loc_2383C:				; CODE XREF: Kneeboard_EntryDestructFull+26j
		mov	word ptr [si+0Eh], 0

loc_23841:				; CODE XREF: Kneeboard_EntryDestructFull+Bj
		cmp	byte ptr [si+15h], 0
		jz	short loc_23867
		cmp	dword ptr [si+10h], 0
		jz	short loc_23867
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_23867:				; CODE XREF: Kneeboard_EntryDestructFull+44j
					; Kneeboard_EntryDestructFull+4Bj
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0

loc_23873:
		mov	dword ptr [si+16h], 0
		pop	si

loc_2387C:
		pop	bp
		retf
Kneeboard_EntryDestructFull	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,28L — construit une entrée liée à un objet (sub_2341F) et l'ajoute à la liste
; (sub_5F57F) : ajout d'une entrée de journal référencée dans le journal de mission.
; ==============================================================================================
Kneeboard_AddEntryObj	proc far		; CODE XREF: Cinematic_LoadCameraDef+1CCp
					; Kneeboard_UpdateEntry_7AFA8+BP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_23881:
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	0
		push	cs
		call	near ptr Kneeboard_EntryConstructObj
		add	sp, 4
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_5F57F
		add	sp, 4
		pop	si
		leave
		retf
Kneeboard_AddEntryObj	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,28L — construit une entrée texte libre (sub_23497) et l'ajoute à la liste (sub_5F57F) :
; ajout d'une entrée de journal texte dans le journal de mission.
; ==============================================================================================
Kneeboard_AddEntryText	proc far		; CODE XREF: Cinematic_LoadCameraDef+1E6p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		mov	al, [bp+arg_2]
		push	ax
		push	0
		push	cs
		call	near ptr Kneeboard_EntryConstructText
		add	sp, 6
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_5F57F
		add	sp, 4
		pop	si
		leave
		retf
Kneeboard_AddEntryText	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,60L — recherche une entrée par une paire de champs 32-bit (comparaison à un identifiant
; composite) : recherche d'entrée de journal par identifiant (probable ID de
; mission/objectif).
; ==============================================================================================
Kneeboard_FindByID	proc far		; CODE XREF: Expr_VM_OpcodeHelperA_53504+62P
					; CameraScript_ExecuteCOMP_781D0+14ADP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_23910
; ���������������������������������������������������������������������������

loc_238DF:				; CODE XREF: Kneeboard_FindByID+51j
		mov	bx, [bp+var_2]
		mov	eax, [bx+5]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx]
		jnz	short loc_23905
		mov	bx, [bp+var_2]
		mov	eax, [bx+9]
		mov	bx, word ptr [bp+arg_2]

loc_238F9:
		cmp	eax, es:[bx+4]
		jnz	short loc_23905
		mov	ax, 1
		jmp	short loc_23907
; ���������������������������������������������������������������������������

loc_23905:				; CODE XREF: Kneeboard_FindByID+1Fj
					; Kneeboard_FindByID+30j
		xor	ax, ax

loc_23907:				; CODE XREF: Kneeboard_FindByID+35j
		or	al, al
		jz	short loc_23910
		mov	ax, [bp+var_2]
		jmp	short loc_23923
; ���������������������������������������������������������������������������

loc_23910:				; CODE XREF: Kneeboard_FindByID+Fj
					; Kneeboard_FindByID+3Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_238DF
		xor	ax, ax

loc_23923:				; CODE XREF: Kneeboard_FindByID+40j
		pop	si
		leave
		retf
Kneeboard_FindByID	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		jmp	short loc_23947
; ���������������������������������������������������������������������������

loc_23937:				; CODE XREF: seg041:0546j
		mov	bx, [bp-2]
		mov	al, [bx+4]
		cmp	al, [bp+8]
		jnz	short loc_23947
		mov	ax, [bx+0Eh]
		jmp	short loc_2395A
; ���������������������������������������������������������������������������

loc_23947:				; CODE XREF: seg041:0525j seg041:0530j
		lea	ax, [bp-2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_23937
		xor	ax, ax

loc_2395A:				; CODE XREF: seg041:0535j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		jmp	short loc_2397E
; ���������������������������������������������������������������������������

loc_2396E:				; CODE XREF: seg041:057Dj
		mov	bx, [bp-2]

loc_23971:
		mov	ax, [bx+0Eh]
		cmp	ax, [bp+8]
		jnz	short loc_2397E
		mov	ax, [bp-2]

loc_2397C:
		jmp	short loc_23991
; ���������������������������������������������������������������������������

loc_2397E:				; CODE XREF: seg041:055Cj seg041:0567j
		lea	ax, [bp-2]
		push	ax
		push	si

loc_23983:
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_2396E
		xor	ax, ax

loc_23991:				; CODE XREF: seg041:loc_2397Cj
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,73L — variante de sub_238CE avec traitement supplémentaire si trouvé (référence +0xE) :
; recherche d'entrée de journal par identifiant, avec suite de traitement.
; ==============================================================================================
Kneeboard_FindByIDContinue	proc far		; CODE XREF: Kneeboard_SelectByID+14p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_239E8
; ���������������������������������������������������������������������������

loc_239A5:				; CODE XREF: Kneeboard_FindByIDContinue:loc_239F7j
		mov	bx, [bp+var_2]
		mov	eax, [bx+5]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx]
		jnz	short loc_239CB
		mov	bx, [bp+var_2]
		mov	eax, [bx+9]
		mov	bx, word ptr [bp+arg_2]
		cmp	eax, es:[bx+4]
		jnz	short loc_239CB
		mov	ax, 1
		jmp	short loc_239CD
; ���������������������������������������������������������������������������

loc_239CB:				; CODE XREF: Kneeboard_FindByIDContinue+1Fj
					; Kneeboard_FindByIDContinue+30j
		xor	ax, ax

loc_239CD:				; CODE XREF: Kneeboard_FindByIDContinue+35j
		or	al, al
		jz	short loc_239E8
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_239E0
		push	bx
		push	cs
		call	near ptr Kneeboard_RenderEntry
		pop	cx

loc_239E0:				; CODE XREF: Kneeboard_FindByIDContinue+44j
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		jmp	short loc_239FB
; ���������������������������������������������������������������������������

loc_239E8:				; CODE XREF: Kneeboard_FindByIDContinue+Fj
					; Kneeboard_FindByIDContinue+3Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9

loc_239F2:
		add	sp, 4
		or	ax, ax

loc_239F7:
		jnz	short loc_239A5

loc_239F9:
		xor	ax, ax

loc_239FB:				; CODE XREF: Kneeboard_FindByIDContinue+52j
		pop	si
		leave
		retf
Kneeboard_FindByIDContinue	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,54L — parcourt les entrées, formate (sub_23593) celle dont le code (+4) correspond et
; n'a pas encore de rendu (+0xE==0) : rendu à la demande d'une entrée de journal par code
; (lazy rendering).
; ==============================================================================================
Kneeboard_RenderByCode	proc far		; CODE XREF: Radar_TargetTypeFilter+7DP
					; Mission_PlayerEventHandler+92P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp

loc_23A01:
		sub	sp, 2
		push	si

loc_23A05:
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_23A2E
; ���������������������������������������������������������������������������

loc_23A0F:				; CODE XREF: Kneeboard_RenderByCode+3Fj
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_23A2E
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_23A26
		push	bx
		push	cs
		call	near ptr Kneeboard_RenderEntry
		pop	cx

loc_23A26:				; CODE XREF: Kneeboard_RenderByCode+20j
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		jmp	short loc_23A41
; ���������������������������������������������������������������������������

loc_23A2E:				; CODE XREF: Kneeboard_RenderByCode+Fj
					; Kneeboard_RenderByCode+1Aj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_23A0F
		xor	ax, ax

loc_23A41:				; CODE XREF: Kneeboard_RenderByCode+2Ej
		pop	si
		leave
		retf
Kneeboard_RenderByCode	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		jmp	short loc_23A60
; ���������������������������������������������������������������������������

loc_23A55:				; CODE XREF: seg041:065Fj
		mov	bx, [bp-2]
		mov	ax, [bx+0Eh]
		cmp	ax, [bp+8]
		jz	short loc_23A71

loc_23A60:				; CODE XREF: seg041:0643j
		lea	ax, [bp-2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_23A55

loc_23A71:				; CODE XREF: seg041:064Ej
		mov	ax, [bp-2]
		mov	[bp-4],	ax
		jmp	short loc_23A9A
; ���������������������������������������������������������������������������

loc_23A79:				; CODE XREF: seg041:0699j
		mov	bx, [bp-2]
		mov	al, [bx+4]
		cmp	al, [bp+0Ah]

loc_23A82:
		jnz	short loc_23A9A
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_23A92

loc_23A8A:				; CODE XREF: seg041:06B3j
		push	word ptr [bp-2]
		push	cs
		call	near ptr Kneeboard_RenderEntry
		pop	cx

loc_23A92:				; CODE XREF: seg041:0678j seg041:06B1j ...
		mov	bx, [bp-2]
		mov	ax, [bx+0Eh]
		jmp	short loc_23AE2
; ���������������������������������������������������������������������������

loc_23A9A:				; CODE XREF: seg041:0667j
					; seg041:loc_23A82j
		lea	ax, [bp-2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_23A79
		mov	word ptr [bp-2], 0
		jmp	short loc_23AC7
; ���������������������������������������������������������������������������

loc_23AB2:				; CODE XREF: seg041:06CEj
		mov	bx, [bp-2]
		mov	al, [bx+4]
		cmp	al, [bp+0Ah]
		jnz	short loc_23AC7
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_23A92
		jmp	short loc_23A8A
; ���������������������������������������������������������������������������
		jmp	short loc_23A92
; ���������������������������������������������������������������������������

loc_23AC7:				; CODE XREF: seg041:06A0j seg041:06ABj
		lea	ax, [bp-2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jz	short loc_23AE0
		mov	ax, [bp-2]
		cmp	ax, [bp-4]
		jnz	short loc_23AB2

loc_23AE0:				; CODE XREF: seg041:06C6j
		xor	ax, ax

loc_23AE2:				; CODE XREF: seg041:0688j
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,17L — wrapper trivial vers sub_23B23 : vidage du journal de mission (raccourci).
; ==============================================================================================
Kneeboard_ClearShortcut	proc far		; CODE XREF: MissionLoader_AssignUnitRosterB_A7E3B+19P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr Kneeboard_ClearAll

loc_23AF1:
		pop	cx
		pop	bp
		retf
Kneeboard_ClearShortcut	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,28L — initialise les champs du journal (compteur, sélection, page=0x14) et appelle
; sub_23C4F : initialisation/reset du journal de mission au démarrage.
; ==============================================================================================
Kneeboard_Init	proc far		; CODE XREF: MissionLoader_QueryAndReleaseAttribute_A7F3A+70P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_23AF7:
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+11h], 14h
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0
		mov	byte ptr [si+14h], 0
		push	ds
		mov	ax, si
		add	ax, 6
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Kneeboard_SelectByID
		add	sp, 6
		mov	ax, [si+12h]
		pop	si
		pop	bp
		retf
Kneeboard_Init	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,33L — parcourt toutes les entrées et les détruit (sub_237AC), vide le compteur de
; sélection : vidage complet du journal de mission.
; ==============================================================================================
Kneeboard_ClearAll	proc far		; CODE XREF: Kneeboard_ClearShortcut+9p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_23B3C
; ���������������������������������������������������������������������������

loc_23B34:				; CODE XREF: Kneeboard_ClearAll+28j
		push	[bp+var_2]
		push	cs
		call	near ptr Kneeboard_EntryDestruct
		pop	cx

loc_23B3C:				; CODE XREF: Kneeboard_ClearAll+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_23B34
		mov	word ptr [si+12h], 0
		pop	si
		leave
		retf
Kneeboard_ClearAll	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,60L — retire toutes les entrées référençant une cible spécifique (di) lors de sa
; destruction : nettoyage du journal quand un objet référencé est détruit.
; ==============================================================================================
Kneeboard_RemoveByTarget	proc far		; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+2189P
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+A42P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_23B9F
; ���������������������������������������������������������������������������

loc_23B67:				; CODE XREF: Kneeboard_RemoveByTarget+59j
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		cmp	di, [bp+arg_2]
		jnz	short loc_23B9F
		push	bx
		push	cs
		call	near ptr Kneeboard_EntryDestructFull
		pop	cx
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_5F5A4
		add	sp, 6
		cmp	[si+12h], di
		jnz	short loc_23B90
		mov	word ptr [si+12h], 0

loc_23B90:				; CODE XREF: Kneeboard_RemoveByTarget+34j
		mov	ax, [si+0Fh]
		cmp	ax, [bp+var_2]
		jnz	short loc_23BB0
		mov	word ptr [si+0Fh], 0
		jmp	short loc_23BB0
; ���������������������������������������������������������������������������

loc_23B9F:				; CODE XREF: Kneeboard_RemoveByTarget+10j
					; Kneeboard_RemoveByTarget+1Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_23B67

loc_23BB0:				; CODE XREF: Kneeboard_RemoveByTarget+41j
					; Kneeboard_RemoveByTarget+48j
		pop	di
		pop	si
		leave
		retf
Kneeboard_RemoveByTarget	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,45L — variante de sub_23B55 mettant à jour un pointeur de tête de liste (+0xF) :
; nettoyage ciblé avec mise à jour de la liste (variante).
; ==============================================================================================
Kneeboard_RemoveByTargetUpdateHead	proc far		; CODE XREF: Kneeboard_ApplySelection+60p
					; Kneeboard_ApplySelection+91p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_23BDF
; ���������������������������������������������������������������������������

loc_23BC5:				; CODE XREF: Kneeboard_RemoveByTargetUpdateHead+3Aj
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		mov	[bp+var_4], ax
		cmp	ax, [bp+arg_2]
		jnz	short loc_23BDF
		push	bx
		push	cs
		call	near ptr Kneeboard_EntryDestruct
		pop	cx
		mov	ax, [bp+var_2]
		mov	[si+0Fh], ax

loc_23BDF:				; CODE XREF: Kneeboard_RemoveByTargetUpdateHead+Fj
					; Kneeboard_RemoveByTargetUpdateHead+1Dj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_23BC5
		pop	si

locret_23BF1:
		leave
		retf
Kneeboard_RemoveByTargetUpdateHead	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,39L — détruit toutes les entrées (sub_23801, destructeur complet) et réinitialise les
; pointeurs (+0xF/+0x12) : vidage complet du journal avec libération des textes.
; ==============================================================================================
Kneeboard_ClearAllFull	proc far		; CODE XREF: Kneeboard_ResetAndRefresh+8p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_23C15
; ���������������������������������������������������������������������������

loc_23BFF:				; CODE XREF: Kneeboard_ClearAllFull+36j
		push	[bp+var_2]
		push	cs
		call	near ptr Kneeboard_EntryDestructFull
		pop	cx
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_5F5A4
		add	sp, 6

loc_23C15:				; CODE XREF: Kneeboard_ClearAllFull+Aj
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_23BFF
		mov	word ptr [si+12h], 0
		mov	word ptr [si+0Fh], 0
		pop	si
		leave
		retf
Kneeboard_ClearAllFull	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,18L — vide le journal (sub_23BF3) puis notifie l'UI (sub_5E526, code 0x5196) :
; réinitialisation du journal avec rafraîchissement de l'affichage.
; ==============================================================================================
Kneeboard_ResetAndRefresh	proc far		; CODE XREF: Kneeboard_Destruct+15p
					; MissionLoader_AssignUnitRoster_A7D46+25P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr Kneeboard_ClearAllFull
		pop	cx
		push	5196h
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	bp
		retf
Kneeboard_ResetAndRefresh	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,45L — recherche une entrée par identifiant (sub_23994) puis la sélectionne (sub_23CCC) :
; sélection d'une entrée de journal par identifiant (find+select).
; ==============================================================================================
Kneeboard_SelectByID	proc far		; CODE XREF: seg009:01C7P
					; Kneeboard_Init+23p ...

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Kneeboard_FindByIDContinue
		add	sp, 6
		mov	dx, ax
		or	dx, dx
		jz	short loc_23C7C
		push	ax
		push	si

loc_23C71:
		nop
		push	cs

loc_23C73:
		call	near ptr Kneeboard_ApplySelection

loc_23C76:
		add	sp, 4

loc_23C79:
		mov	[bp+var_1], al

loc_23C7C:				; CODE XREF: Kneeboard_SelectByID+1Ej
		mov	al, [bp+var_1]

loc_23C7F:
		pop	si
		leave
		retf
Kneeboard_SelectByID	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,50L — compare le champ +0x11 à un code cible ; si différent, cherche l'entrée
; correspondante (sub_239FE) et la sélectionne (sub_23CCC) ; cas spécial pour code 4 :
; sélection d'une entrée de journal par code d'état (déclenché par les triggers de mission
; déjà documentés, ex. seg040/sub_22F53).
; ==============================================================================================
Kneeboard_SelectByStateCode	proc far		; CODE XREF: Player_MainUpdate+BC7P
					; Player_MainUpdate+CD1P ...

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_23C83:
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[bp+var_1], 0
		cmp	[si+11h], dl
		jz	short loc_23CB6
		push	dx
		push	si
		push	cs
		call	near ptr Kneeboard_RenderByCode
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jz	short loc_23CC6
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Kneeboard_ApplySelection
		add	sp, 4
		mov	[bp+var_1], al
		jmp	short loc_23CC6
; ���������������������������������������������������������������������������

loc_23CB6:				; CODE XREF: Kneeboard_SelectByStateCode+14j
		cmp	byte ptr [si+11h], 4
		jnz	short loc_23CC6
		push	word_6E4B2
		call	Radar_ToggleTracking
		pop	cx

loc_23CC6:				; CODE XREF: Kneeboard_SelectByStateCode+23j
					; Kneeboard_SelectByStateCode+32j ...
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Kneeboard_SelectByStateCode	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,108L — met à jour la sélection courante du journal (+0x12), positionne un flag global
; (byte_70447), gère le repositionnement d'affichage (fenêtre 0x100 octets) : application de
; la sélection d'entrée de journal avec mise à jour de l'affichage. || Contexte caméra
; (2026-08-30) : appelé Kneeboard_ApplySelection(manager=0x59CD, entrée) — pose manager[+0x12]
; = caméra/entrée active, lance Cockpit_PanAzimuthUpdate -> Camera_PanTransitionController
; (pan doux, seuil 0x100), puis pilote l'entrée via sa vtable [entrée+0x50] : [0x04] stop
; précédente, [0x10] start, [0x14] get-state. Utilisé pour activer les caméras scriptées du
; FORM CAMR (voir Cinematic_LoadCameraDef_23E7D, DATA_MODEL.md §6.6b b-bis).
; ==============================================================================================
Kneeboard_ApplySelection	proc far		; CODE XREF: Radar_TargetTypeFilter+9FP
					; Mission_PlayerEventHandler+BCP ...

var_8		= word ptr -8
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		cmp	[si+12h], di
		jnz	short loc_23CE6
		jmp	loc_23D88
; ���������������������������������������������������������������������������

loc_23CE6:				; CODE XREF: Kneeboard_ApplySelection+15j
		mov	byte_70447, 0
		or	di, di
		jnz	short loc_23CF2
		jmp	loc_23D88
; ���������������������������������������������������������������������������

loc_23CF2:				; CODE XREF: Kneeboard_ApplySelection+21j
		mov	[bp+var_6], 100h
		lea	ax, [bp+var_6]
		push	ax
		push	541Ah

loc_23D01:
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		cmp	word ptr [si+12h], 0
		jz	short loc_23D1C
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		pop	cx

loc_23D1C:				; CODE XREF: Kneeboard_ApplySelection+41j
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		pop	cx
		or	al, al
		jz	short loc_23D4E
		push	word ptr [si+12h]
		push	si
		push	cs
		call	near ptr Kneeboard_RemoveByTargetUpdateHead
		add	sp, 4
		mov	[si+12h], di
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		mov	[si+11h], al
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	[bp+var_1], 1
		jmp	short loc_23D88
; ���������������������������������������������������������������������������

loc_23D4E:				; CODE XREF: Kneeboard_ApplySelection+59j
		cmp	word ptr [si+12h], 0
		jz	short loc_23D88
		mov	ax, [si+0Fh]
		mov	[bp+var_8], ax
		push	di
		push	si
		push	cs
		call	near ptr Kneeboard_RemoveByTargetUpdateHead
		add	sp, 4
		mov	ax, [bp+var_8]
		mov	[si+0Fh], ax
		push	word ptr [si+12h]
		mov	bx, [si+12h]

loc_23D6F:
		mov	bx, [bx+50h]
		call	dword ptr [bx]
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_23D88
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+10h]
		pop	cx

loc_23D88:				; CODE XREF: Kneeboard_ApplySelection+17j
					; Kneeboard_ApplySelection+23j ...
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Kneeboard_ApplySelection	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,67L — notifie l'entrée sélectionnée (+0x12) via vtable, vérifie un état
; (vtable[0x14]==4), déclenche sub_6BC03 sur un champ (+0x60) sinon : traitement de l'entrée
; sélectionnée du journal (probable action 'centrer la carte sur cet objectif').
; ==============================================================================================
Kneeboard_ProcessSelected	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+D7CP

var_8		= dword	ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+12h], 0
		jz	short loc_23DF0
		mov	bx, [si+12h]
		cmp	word ptr [bx+5Ch], 0
		jz	short loc_23DC2
		push	word ptr [bx+5Ch]
		mov	bx, [bx+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		mov	bx, [si+12h]
		push	word ptr [bx+5Ch]
		mov	bx, [bx+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		jmp	short $+2

loc_23DC2:				; CODE XREF: Kneeboard_ProcessSelected+15j
		push	word ptr [si+12h]

loc_23DC5:
		mov	bx, [si+12h]
		mov	bx, [bx+50h]

loc_23DCB:
		call	dword ptr [bx+14h]
		pop	cx

loc_23DCF:
		cmp	al, 4

loc_23DD1:
		jz	short loc_23DF0

loc_23DD3:
		sub	sp, 4

loc_23DD6:
		mov	di, [si+12h]
		add	di, 60h	; '`'
		mov	eax, [di]
		mov	[bp+var_8], eax
		push	word ptr [si+12h]
		call	VROOMM_StubThunk_6BC03
		add	sp, 6
		jmp	short $+2

loc_23DF0:				; CODE XREF: Kneeboard_ProcessSelected+Cj
					; Kneeboard_ProcessSelected:loc_23DD1j
		pop	di
		pop	si
		pop	bp

locret_23DF3:
		retf
Kneeboard_ProcessSelected	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,45L — constructeur de l'objet journal de mission complet (type 0x1198) : constructeur du
; gestionnaire de journal/kneeboard de mission.
; ==============================================================================================
Kneeboard_Construct	proc far		; CODE XREF: seg112:0C89P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_23DF8:
		mov	si, [bp+arg_0]
		or	si, si

loc_23DFD:
		jnz	short loc_23E0D
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_23E43

loc_23E0D:				; CODE XREF: Kneeboard_Construct:loc_23DFDj
		mov	word ptr [si], 75Ch
		xor	ax, ax
		mov	[si+4],	ax
		mov	[si+2],	ax
		mov	word ptr [si], 1198h
		mov	ax, si
		add	ax, 6
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	byte ptr [si+11h], 14h
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0
		mov	byte ptr [si+14h], 0
		mov	byte ptr [si+15h], 0
		mov	byte ptr [si+16h], 0

loc_23E43:				; CODE XREF: Kneeboard_Construct+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
Kneeboard_Construct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — destructeur : vide le journal (sub_23C38), libère la liste (sub_5F66B), libère la
; mémoire si demandé (sub_338) : destructeur du gestionnaire de journal de mission.
; ==============================================================================================
Kneeboard_Destruct	proc far		; CODE XREF: seg112:0DE7P
					; DATA XREF: seg339:1198o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_23E79
		mov	word ptr [si], 1198h
		push	si
		push	cs
		call	near ptr Kneeboard_ResetAndRefresh
		pop	cx
		mov	word ptr [si], 75Ch
		push	si
		call	LinkedListB_Helper_5F66B
		pop	cx
		test	di, 1

loc_23E70:
		jz	short loc_23E79
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_23E79:				; CODE XREF: Kneeboard_Destruct+Dj
					; Kneeboard_Destruct:loc_23E70j
		pop	di
		pop	si
		pop	bp
		retf
Kneeboard_Destruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,338L — initialise une zone d'affichage (coordonnées 0,0,0x13F,0xC7), charge une position
; de texte selon un mode (byte_721F0), recherche des tags de type dans un fichier/objet
; ('CAMR'=0x524D4143, 'ATCH'=0x48435441 en magic numbers little-endian) via
; sub_647B2/sub_64BC1 : candidat pour le chargement/analyse d'un fichier de définition de
; caméra ou de points d'attache (probable système de cinématique/replay de mission), à
; approfondir. || TRACÉ (session 2026-08-30) : PARSEUR DU 'FORM CAMR' du monde WRLD (caméras
; scriptées de mission). Appelé Cinematic_LoadCameraDef(listeManager=0x59CD, resourceRecord)
; via MissionLoader_LoadChunkA_A7C8E depuis World_ParseWrldForm_A767F ;
; SeekAndReadB('CAMR'=524D4143h), sinon retour immédiat. Itère les sous-chunks, dispatch par
; tag (record[+0x6D], dword LE) vers un code var_4 :
; STRT->(String_ConstructFromPtrLen(liste+6,rec), nom du jeu de caméras), CAMR->0,
; ATCH(48435441h)->1, CHAS(53414843h)->3, CKPT(54504B43h)->4 (+ stub
; 6B120->HUDSymbol_ConstructVariantN_859C7 ovr246 ; word_6E4B2=obj[+0x5C]),
; CONT(544E4F43h)->6, VICT(54434956h)->7, ROTA(41544F52h)->8, TARG(47524154h)->9,
; WEAP(50414557h)->0Bh, COMP(504D4F43h)->13h ; inconnu->14h ignoré. Chaque tag reconnu ->
; entrée registre 26 o type 0x119C en queue de liste 0x59CD (LinkedListB_InsertAtTail_5F57F)
; via Kneeboard_EntryConstructText/Obj : +0x04 u8 code type, +0x05 8o = ID (8 premiers octets
; du payload = nom pour COMP: 'STARTCAM'/'TAKEOFF\0'/'LANDING\0'/'AUTOPILT' ; CKPT:
; obj[+0x53],obj[+0x57]), +0x0E réf objet (CKPT), +0x10 far ptr = PAYLOAD BRUT du chunk
; (ResourceRecord_ReadFieldGroupA, longueur record[+0x72]), +0x16 u32 longueur. NE DÉCODE PAS
; les paramètres : seuls l'ID 8o et le tag sont lus. Layout sous-chunk CAMR (décodé sur
; MAURITAN.IFF) : +0x00 char[8] nom interne, +0x08 u16 flags (CHASECAM: 14o), +0x0A char[8]
; sujet 'PLAYER', (CKPT: +0x12 char[8] art 'F16-CKPT'), puis u32 farClip=50000, u16 fov=40,
; nearClip~10, u32 0, u16,u16 viewport 319,199 ; VICT/WEAP ajoutent une table d'offsets i32
; FIXED-POINT 24.8 (val/256 = pieds, relatifs au sujet). COMP : en-tête + u8 compte + char[8]
; sujet + SCRIPT keyframes variable (opcodes 1o, petits int signés, offsets i32/256), terminé
; par octet 0xFE + char[8] vue de reprise ('COCKPIT'). Objet caméra runtime word_72A8F :
; +0x14/+0x18/+0x1C i32 X/Z/Y monde 24.8 (preuve : HUD_RenderSymbologyMain/Alt seg088,
; Debris_SpawnOrchestrator seg079 : delta entité[+0x12/+0x16/+0x1A] - cam[+0x14/..] ->
; Math_VectorLength3D_5828E -> sar eax,8) ; +0x50 far vtable ([0]=tick keyframe, [4]=stop
; préc, [0x10]=start/parse script, [0x14]=get state, 4=mode spécial) ; +0x5C sous-objet ;
; +0x60 dword. Activation : Kneeboard_SelectByID(0x59CD,nom) depuis seg009 (état vol,
; 'TAKEOFF'), ovr233 UIScript_ParseAndEvaluate_7A054 ('AUTOPILT' + Camera_DetachParent),
; Player_MainUpdate (Kneeboard_SelectByStateCode(0x59CD,4)), Expr_VM_OpcodeHelperA_53504
; (opcode +0xA38). OUVERT : interpréteur COMP dans vtable [cam+0x50] slots [0x10]/[0x00],
; overlay-swappés, non ouverts. Détail complet : DATA_MODEL.md §6.6b b-bis.
; ==============================================================================================
Cinematic_LoadCameraDef	proc far		; CODE XREF: MissionLoader_LoadChunkA_A7C8E+9P

var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4

loc_23E83:
		push	si

loc_23E84:
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	word_7224A, 0
		mov	word_7224C, 0
		mov	word_7224E, 13Fh
		mov	word_72250, 0C7h ; '�'
		cmp	byte_721F0, 1
		jnz	short loc_23EB4
		mov	ax, 5132h
		jmp	short loc_23EB7
; ���������������������������������������������������������������������������

loc_23EB4:				; CODE XREF: Cinematic_LoadCameraDef+30j
		mov	ax, word_721E0

loc_23EB7:				; CODE XREF: Cinematic_LoadCameraDef+35j
		push	ax
		push	5196h
		call	TextFormat_ApplyStyleAttributeB_5E329
		add	sp, 4

loc_23EC3:
		mov	word_6E1C2, 0
		push	0

loc_23ECB:
		push	large 524D4143h
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_23EE1
		jmp	loc_240A2
; ���������������������������������������������������������������������������

loc_23EE1:				; CODE XREF: Cinematic_LoadCameraDef+5Fj
		jmp	loc_24071
; ���������������������������������������������������������������������������

loc_23EE4:				; CODE XREF: Cinematic_LoadCameraDef+21Bj
		push	di
		call	ResourceRecord_ComputeAlignedBounds_64BC1
		pop	cx
		mov	[bp+var_4], 14h
		cmp	dword ptr [di+6Dh], 524D4143h
		jnz	short loc_23EFE
		mov	ax, 1
		jmp	short loc_23F00
; ���������������������������������������������������������������������������

loc_23EFE:				; CODE XREF: Cinematic_LoadCameraDef+7Aj
		xor	ax, ax

loc_23F00:				; CODE XREF: Cinematic_LoadCameraDef+7Fj
		or	ax, ax
		jz	short loc_23F0B
		mov	[bp+var_4], 0
		jmp	loc_2403E
; ���������������������������������������������������������������������������

loc_23F0B:				; CODE XREF: Cinematic_LoadCameraDef+85j
		cmp	dword ptr [di+6Dh], 48435441h
		jnz	short loc_23F1A
		mov	ax, 1
		jmp	short loc_23F1C
; ���������������������������������������������������������������������������

loc_23F1A:				; CODE XREF: Cinematic_LoadCameraDef+96j
		xor	ax, ax

loc_23F1C:				; CODE XREF: Cinematic_LoadCameraDef+9Bj
		or	ax, ax
		jz	short loc_23F27
		mov	[bp+var_4], 1
		jmp	loc_2403E
; ���������������������������������������������������������������������������

loc_23F27:				; CODE XREF: Cinematic_LoadCameraDef+A1j
		cmp	dword ptr [di+6Dh], 53414843h
		jnz	short loc_23F36
		mov	ax, 1
		jmp	short loc_23F38
; ���������������������������������������������������������������������������

loc_23F36:				; CODE XREF: Cinematic_LoadCameraDef+B2j
		xor	ax, ax

loc_23F38:				; CODE XREF: Cinematic_LoadCameraDef+B7j
		or	ax, ax
		jz	short loc_23F43
		mov	[bp+var_4], 3
		jmp	loc_2403E
; ���������������������������������������������������������������������������

loc_23F43:				; CODE XREF: Cinematic_LoadCameraDef+BDj
		cmp	dword ptr [di+6Dh], 54525453h
		jnz	short loc_23F52
		mov	ax, 1
		jmp	short loc_23F54
; ���������������������������������������������������������������������������

loc_23F52:				; CODE XREF: Cinematic_LoadCameraDef+CEj
		xor	ax, ax

loc_23F54:				; CODE XREF: Cinematic_LoadCameraDef+D3j
		or	ax, ax
		jz	short loc_23F6A
		push	di
		mov	ax, si
		add	ax, 6
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		jmp	loc_2403E
; ���������������������������������������������������������������������������

loc_23F6A:				; CODE XREF: Cinematic_LoadCameraDef+D9j
		cmp	dword ptr [di+6Dh], 54504B43h
		jnz	short loc_23F79

loc_23F74:
		mov	ax, 1

loc_23F77:
		jmp	short loc_23F7B
; ���������������������������������������������������������������������������

loc_23F79:				; CODE XREF: Cinematic_LoadCameraDef+F5j
		xor	ax, ax

loc_23F7B:				; CODE XREF: Cinematic_LoadCameraDef:loc_23F77j
		or	ax, ax

loc_23F7D:
		jz	short loc_23F9D
		mov	[bp+var_4], 4

loc_23F83:
		push	di
		push	0
		call	VROOMM_StubThunk_6B120
		add	sp, 4
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	ax, [bx+5Ch]
		mov	word_6E4B2, ax
		jmp	loc_2403E
; ���������������������������������������������������������������������������

loc_23F9D:				; CODE XREF: Cinematic_LoadCameraDef:loc_23F7Dj
		cmp	dword ptr [di+6Dh], 544E4F43h
		jnz	short loc_23FAC
		mov	ax, 1
		jmp	short loc_23FAE
; ���������������������������������������������������������������������������

loc_23FAC:				; CODE XREF: Cinematic_LoadCameraDef+128j
		xor	ax, ax

loc_23FAE:				; CODE XREF: Cinematic_LoadCameraDef+12Dj
		or	ax, ax
		jz	short loc_23FB9
		mov	[bp+var_4], 6
		jmp	loc_2403E
; ���������������������������������������������������������������������������

loc_23FB9:				; CODE XREF: Cinematic_LoadCameraDef+133j
		cmp	dword ptr [di+6Dh], 41544F52h
		jnz	short loc_23FC8

loc_23FC3:
		mov	ax, 1
		jmp	short loc_23FCA
; ���������������������������������������������������������������������������

loc_23FC8:				; CODE XREF: Cinematic_LoadCameraDef+144j
		xor	ax, ax

loc_23FCA:				; CODE XREF: Cinematic_LoadCameraDef+149j
		or	ax, ax

loc_23FCC:
		jz	short loc_23FD4
		mov	[bp+var_4], 8
		jmp	short loc_2403E
; ���������������������������������������������������������������������������

loc_23FD4:				; CODE XREF: Cinematic_LoadCameraDef:loc_23FCCj
		cmp	dword ptr [di+6Dh], 47524154h
		jnz	short loc_23FE3
		mov	ax, 1
		jmp	short loc_23FE5
; ���������������������������������������������������������������������������

loc_23FE3:				; CODE XREF: Cinematic_LoadCameraDef+15Fj
		xor	ax, ax

loc_23FE5:				; CODE XREF: Cinematic_LoadCameraDef+164j
		or	ax, ax
		jz	short loc_23FEF
		mov	[bp+var_4], 9
		jmp	short loc_2403E
; ���������������������������������������������������������������������������

loc_23FEF:				; CODE XREF: Cinematic_LoadCameraDef+16Aj
		cmp	dword ptr [di+6Dh], 504D4F43h
		jnz	short loc_23FFE
		mov	ax, 1
		jmp	short loc_24000
; ���������������������������������������������������������������������������

loc_23FFE:				; CODE XREF: Cinematic_LoadCameraDef+17Aj
		xor	ax, ax

loc_24000:				; CODE XREF: Cinematic_LoadCameraDef+17Fj
		or	ax, ax
		jz	short loc_2400A
		mov	[bp+var_4], 13h
		jmp	short loc_2403E
; ���������������������������������������������������������������������������

loc_2400A:				; CODE XREF: Cinematic_LoadCameraDef+185j
		cmp	dword ptr [di+6Dh], 54434956h
		jnz	short loc_24019
		mov	ax, 1
		jmp	short loc_2401B
; ���������������������������������������������������������������������������

loc_24019:				; CODE XREF: Cinematic_LoadCameraDef+195j
		xor	ax, ax

loc_2401B:				; CODE XREF: Cinematic_LoadCameraDef+19Aj
		or	ax, ax
		jz	short loc_24025
		mov	[bp+var_4], 7
		jmp	short loc_2403E
; ���������������������������������������������������������������������������

loc_24025:				; CODE XREF: Cinematic_LoadCameraDef+1A0j
		cmp	dword ptr [di+6Dh], 50414557h
		jnz	short loc_24034
		mov	ax, 1
		jmp	short loc_24036
; ���������������������������������������������������������������������������

loc_24034:				; CODE XREF: Cinematic_LoadCameraDef+1B0j
		xor	ax, ax

loc_24036:				; CODE XREF: Cinematic_LoadCameraDef+1B5j
		or	ax, ax
		jz	short loc_2403E
		mov	[bp+var_4], 0Bh

loc_2403E:				; CODE XREF: Cinematic_LoadCameraDef+8Bj
					; Cinematic_LoadCameraDef+A7j ...
		cmp	[bp+var_2], 0
		jz	short loc_24056
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr Kneeboard_AddEntryObj
		add	sp, 4
		mov	[bp+var_2], 0
		jmp	short loc_24069
; ���������������������������������������������������������������������������

loc_24056:				; CODE XREF: Cinematic_LoadCameraDef+1C5j
		cmp	[bp+var_4], 14h
		jz	short loc_24069
		push	di
		mov	al, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr Kneeboard_AddEntryText
		add	sp, 6

loc_24069:				; CODE XREF: Cinematic_LoadCameraDef+1D7j
					; Cinematic_LoadCameraDef+1DDj
		mov	eax, [di+76h]
		mov	[di+65h], eax

loc_24071:				; CODE XREF: Cinematic_LoadCameraDef:loc_23EE1j
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_24080
		push	di
		call	ResourceRecord_ReadPayload_64DB3
		pop	cx
		jmp	short loc_24094
; ���������������������������������������������������������������������������

loc_24080:				; CODE XREF: Cinematic_LoadCameraDef+1F8j
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_24092
		mov	ax, 1
		jmp	short loc_24094
; ���������������������������������������������������������������������������

loc_24092:				; CODE XREF: Cinematic_LoadCameraDef+20Ej
		xor	ax, ax

loc_24094:				; CODE XREF: Cinematic_LoadCameraDef+201j
					; Cinematic_LoadCameraDef+213j
		or	ax, ax
		jnz	short loc_2409B
		jmp	loc_23EE4
; ���������������������������������������������������������������������������

loc_2409B:				; CODE XREF: Cinematic_LoadCameraDef+219j
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_240A2:				; CODE XREF: Cinematic_LoadCameraDef+61j
		pop	di
		pop	si
		leave
		retf
Cinematic_LoadCameraDef	endp

; ���������������������������������������������������������������������������

loc_240A6:				; DATA XREF: seg339:119Co
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_24100
		cmp	byte ptr [si+15h], 0
		jz	short loc_240DB
		cmp	dword ptr [si+10h], 0
		jz	short loc_240DB
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si

loc_240CA:
		add	ax, 10h
		push	ax
		push	5C44h

loc_240D1:
		call	Memory_TypedFree_5C7B6

loc_240D6:
		add	sp, 8
		jmp	short $+2

loc_240DB:				; CODE XREF: seg041:0CA9j seg041:0CB0j
		mov	dword ptr [si+10h], 0

loc_240E3:
		mov	byte ptr [si+15h], 0

loc_240E7:
		mov	dword ptr [si+16h], 0

loc_240EF:
		test	di, 1

loc_240F3:
		jz	short loc_240FE
		push	si

loc_240F6:
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_24100
; ���������������������������������������������������������������������������

loc_240FE:				; CODE XREF: seg041:loc_240F3j
		jmp	short $+2

loc_24100:				; CODE XREF: seg041:0CA3j seg041:0CECj
		pop	di
		pop	si
		pop	bp
		retf
seg041		ends
