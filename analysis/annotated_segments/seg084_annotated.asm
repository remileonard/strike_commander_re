seg084		segment	byte public 'CODE' use16
		assume cs:seg084
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_3C93B:				; DATA XREF: seg339:off_6F630o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,46L — vérifie le support VESA (INT15h), copie un tag (sub_6BFFF), recherche le chunk
; 'NGLA' via sub_64743, résout une valeur associée (sub_64B51) stockée à +0x35 : chargement
; d'un paramètre angulaire depuis un chunk IFF (probable angle d'attache/orientation d'un
; sous-composant).
; ==============================================================================================
IFF_LoadAngleParam	proc far		; CODE XREF: IFF_LoadModelMain:loc_3BA6EP
					; IFF_LoadAngleParam_Wrapper+AP	...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BFFF
		add	sp, 6
		push	0
		push	large 4E474C41h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_3C98B
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+35h], al
		jmp	short loc_3C993
; ���������������������������������������������������������������������������

loc_3C98B:				; CODE XREF: IFF_LoadAngleParam+37j
		les	bx, [bp+arg_0]

loc_3C98E:
		mov	byte ptr es:[bx+35h], 0

loc_3C993:				; CODE XREF: IFF_LoadAngleParam+47j
		pop	si
		pop	bp
		retf
IFF_LoadAngleParam	endp

; ���������������������������������������������������������������������������

loc_3C996:				; DATA XREF: seg339:257Co
		push	bp

loc_3C997:
		mov	bp, sp
		push	si
		push	large dword ptr	[bp+6]
		push	0
		nop

loc_3C9A1:
		push	cs
		call	near ptr WorldObject_BaseConstructAttached
		add	sp, 6
		mov	si, ax
		push	ax
		push	large dword ptr	[bp+6]

loc_3C9AF:
		call	VROOMM_StubThunk_6C00E

loc_3C9B4:
		add	sp, 6

loc_3C9B7:
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,47L — constructeur en cascade (types 0x10E4→0x1ADC→0x258C) : reset physique de débris
; (sub_37C4C), initialise un sous-objet UI (sub_56D43/sub_56D72), positionne un flag (+4 bit4)
; : constructeur d'objet composite complet (corps physique + rendu + UI), classe de base d'un
; objet du monde de jeu (avion/débris/armement).
; ==============================================================================================
WorldObject_BaseConstruct	proc far		; CODE XREF: seg100:0041P seg105:0042P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3C9D5
		push	51h ; 'Q'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3CA1D

loc_3C9D5:				; CODE XREF: WorldObject_BaseConstruct+9j
		mov	word ptr [si], 10E4h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 1ADCh
		push	si
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si], 258Ch
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h

loc_3CA1D:				; CODE XREF: WorldObject_BaseConstruct+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
WorldObject_BaseConstruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,72L — variante de sub_3C9BC avec attachement à un parent (sub_37C89, cf. seg078) :
; constructeur d'objet composite attaché comme sous-composant d'un parent (ex: pièce
; détachable).
; ==============================================================================================
WorldObject_BaseConstructAttached	proc far		; CODE XREF: Debris_LoadAndInstantiateAlt+47P
					; seg084:0072p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3CA3E
		push	51h ; 'Q'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3CAA5

loc_3CA3E:				; CODE XREF: WorldObject_BaseConstructAttached+Cj
		mov	word ptr [si], 10E4h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 1ADCh
		push	si
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si], 258Ch
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		mov	ax, si

loc_3CA89:
		add	ax, 2Ch	; ','

loc_3CA8C:
		push	ax
		call	Matrix_BuildFromAngle_56D72

loc_3CA92:
		pop	cx
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h
		les	bx, [bp+var_4]
		mov	al, es:[bx+35h]

loc_3CAA2:
		mov	[si+50h], al

loc_3CAA5:				; CODE XREF: WorldObject_BaseConstructAttached+1Aj
		mov	ax, si

loc_3CAA7:
		pop	si

locret_3CAA8:
		leave
		retf
WorldObject_BaseConstructAttached	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — destructeur (type 0x258C) via sub_6BFBA, libère si demandé : destructeur de
; l'objet composite de base.
; ==============================================================================================
WorldObject_BaseDestruct	proc far		; CODE XREF: Camera_DestructWithMount+2EP
					; seg092:08B2P	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_3CAAE:
		push	di

loc_3CAAF:
		mov	si, [bp+arg_0]

loc_3CAB2:
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3CAD5
		mov	word ptr [si], 258Ch
		push	0
		push	si
		call	VROOMM_StubThunk_6BFBA
		add	sp, 4
		test	di, 1
		jz	short loc_3CAD5
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_3CAD5:				; CODE XREF: WorldObject_BaseDestruct+Dj
					; WorldObject_BaseDestruct+22j
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_BaseDestruct	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far (methode vtable triviale, label seul). push bp / mov ax,[bp+6] / mov al,1 / retf =>
; renvoie 1 (true). Slot voisin de WorldObject_ComposeOrientation* (seg339:off_6F670).
; Predicat par defaut d'une classe de base d'objet du monde.
; ==============================================================================================
WorldObject_MethodReturnTrue_3CAD9:				; DATA XREF: seg339:off_6F670o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far (methode vtable, label seul - JAMAIS cataloguee avant 2026-09-05). Slot de la vtable des
; objets du monde (famille ~18 copies, ex. seg339:off_6F668/off_6F6F4). Recoit l'objet + 3
; pointeurs d'angle ([bp+8]/[bp+0xA]/[bp+0xC]) et appelle
; Matrix_BuildFullOrientation_575B2(objet+0x2C, &angleX, &angleY, &angleZ) : compose 3
; rotations d'axe INCREMENTALES (Matrix_BuildAxisX/Y/Z_56EC3, seuil 0.21875 deg) sur la
; matrice d'orientation PERSISTANTE stockee a objet+0x2C. Puis Debris_BodyDetach(objet)
; [fonction mal nommee : systeme generique d'objets du monde, PAS specifique aux debris - les
; debris sont des sous-objets du chunk DEBR d'un objet REAL]. C'est LE mecanisme de mise a
; jour d'orientation a partir des vitesses angulaires de la physique (angle_ptr = &(rate) ou
; &(rate*dt)).
; ==============================================================================================
WorldObject_ComposeOrientation3Angles_3CAE3:				; DATA XREF: seg339:off_6F668o
					; seg339:off_6F6F4o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_BuildFullOrientation_575B2
		add	sp, 8
		push	si
		call	Debris_BodyDetach
		pop	cx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far (methode vtable, label seul - JAMAIS cataloguee avant 2026-09-05). Variante de
; WorldObject_ComposeOrientation3Angles_3CAE3 : recoit l'objet + UN pointeur vers un tableau
; de 3 dword angles ([bp+8]), appelle WorldObject_BuildOrientationMatrix_56E8A(objet+0x2C,
; anglesPtr) qui lit les angles en [anglesPtr+0/+4/+8] et compose les 3 rotations
; incrementales sur la matrice a objet+0x2C. Puis Debris_BodyDetach(objet). Presente dans 18+
; vtables d'objets du monde (seg339 off_6F66C, off_6F784, off_6F810, ... off_703D6) => methode
; GENERIQUE POLYMORPHE partagee par toute la hierarchie d'objets du monde.
; ==============================================================================================
WorldObject_ComposeOrientationAngleArray_3CB0B:				; DATA XREF: seg339:off_6F66Co
					; seg339:2648o	...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	WorldObject_BuildOrientationMatrix_56E8A
		add	sp, 4
		push	si
		call	Debris_BodyDetach
		pop	cx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-24). Methode virtuelle +0x3C (notamment classe missile, vtable seg339
; 0x6FAC4) : renvoie l'adresse objet+0x2C = matrice d'orientation 3x3 24.8 (36 octets).
; ==============================================================================================
WorldObject_GetOrientationMatrix_3CB2D:				; DATA XREF: seg339:off_6F678o
					; seg339:off_6F704o ...
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, dx
		add	ax, 2Ch	; ','
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CB3A:				; DATA XREF: seg339:2604o
					; seg339:off_6F740o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+26h], 0
		jz	short loc_3CB53
		push	si
		mov	bx, [si]
		call	dword ptr [bx+74h]
		pop	cx
		mov	ax, [si+26h]
		jmp	short loc_3CB58
; ���������������������������������������������������������������������������

loc_3CB53:				; CODE XREF: seg084:0215j
		mov	ax, si
		add	ax, 2Ch	; ','

loc_3CB58:				; CODE XREF: seg084:0221j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CB5B:				; DATA XREF: seg339:25F8o
					; seg339:off_6F734o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	word ptr [bp+8]
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CB78:				; DATA XREF: seg339:25FCo
					; seg339:off_6F738o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]

loc_3CB82:
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	word ptr [bp+8]

loc_3CB8A:
		call	Matrix_LocalToWorld_58828

loc_3CB8F:
		add	sp, 4
		pop	si
		pop	bp

locret_3CB94:
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-24). Methode virtuelle +0x40 (notamment classe missile, vtable seg339
; 0x6FAC4) : recopie 36 octets (AI_ComputeGeometryHelper_56E29) de la matrice passee en
; argument dans objet+0x2C (orientation), puis appelle Debris_BodyDetach(objet).
; ==============================================================================================
WorldObject_SetOrientationMatrix_3CB95:				; DATA XREF: seg339:25CCo
					; seg339:off_6F708o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		push	si
		call	Debris_BodyDetach

loc_3CBB3:
		pop	cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enrobage de WorldObject_TestAliveAndUpdateChildren_3800A : renvoie non nul si l'objet
; est vivant (le nom d'origine, IsDestroyed, était inversé).
; ==============================================================================================
WorldObject_IsAlive_3CBB7	proc far		; CODE XREF: Camera_ExternalUpdate_3D9B4+8P WorldObject_UpdateWithAIEntity_3D9FB+BP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	WorldObject_TestAliveAndUpdateChildren_3800A
		pop	cx

loc_3CBC4:
		pop	bp
		retf
WorldObject_IsAlive_3CBB7	endp

; ���������������������������������������������������������������������������

loc_3CBC6:				; DATA XREF: seg339:2600o seg339:268Co ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+26h], 0
		jz	short loc_3CC16
		mov	bx, [si+26h]
		mov	al, [bx+30h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3CC16
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	word ptr [si+26h]
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+78h]
		pop	cx
		push	ax
		push	word ptr [si+26h]
		call	WorldObject_ApplyOrientationVariantB_5779A
		add	sp, 4
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 2

loc_3CC16:				; CODE XREF: seg084:02A1j seg084:02B2j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CC19:				; DATA XREF: seg339:25A8o
					; seg339:off_6FB6Co ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CC21:				; DATA XREF: seg339:off_6F6A0o
					; seg339:off_6F72Co ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, [bp+8]
		push	ax
		push	ax
		call	WorldObject_ApplyOrientationVariantA_5776A
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3CC36:				; DATA XREF: seg339:off_6F6A4o
					; seg339:off_6F730o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, [bp+8]
		push	ax

loc_3CC40:
		push	ax
		call	WorldObject_ApplyOrientationVariantB_5779A
		add	sp, 4
		pop	bp
		retf
seg084		ends
