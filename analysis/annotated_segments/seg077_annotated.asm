seg077		segment	byte public 'CODE' use16
		assume cs:seg077
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_37564:				; DATA XREF: seg216:off_6A10Eo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp

locret_3756D:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,266L — met à jour la caméra/observateur d'un secteur terrain courant, réinitialise la
; triangulation si le secteur change (sub_6BDDE), appelle sub_32A6E (LOD terrain) et met à
; jour un accumulateur d'erreur de tessellation comparé à un seuil : coordinateur de mise à
; jour du niveau de détail (LOD) du terrain par frame, confirme le rôle de sub_32A6E (calcul
; de tessellation adaptative).
; ==============================================================================================
Terrain_UpdateLODPerFrame	proc far		; CODE XREF: seg077:loc_37851p
					; seg077:0347p

var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_3756F:
		mov	bp, sp
		sub	sp, 1Ah

loc_37574:
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+2], 0
		jnz	short loc_37585
		jmp	loc_3777E
; ���������������������������������������������������������������������������

loc_37585:				; CODE XREF: Terrain_UpdateLODPerFrame+12j
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		cmp	[si+4],	di
		jz	short loc_3759A
		mov	[bp+var_1], 1
		mov	[bp+var_2], 1

loc_3759A:				; CODE XREF: Terrain_UpdateLODPerFrame+22j
		mov	[si+4],	di
		mov	[di+5Eh], si
		mov	ax, word_70466
		mov	[si+6],	ax

loc_375A6:				; CODE XREF: Terrain_UpdateLODPerFrame+1BFj
		mov	bx, [si+2]
		mov	dx, [bx+0BFh]
		xor	cx, cx
		jmp	short loc_375EB
; ���������������������������������������������������������������������������

loc_375B1:				; CODE XREF: Terrain_UpdateLODPerFrame+80j
		mov	bx, dx
		mov	eax, [bx+92h]
		cmp	eax, dword_72540
		jl	short loc_375E6
		cmp	[si+71h], dx
		jz	short loc_375F0
		mov	[si+71h], dx
		push	bx
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	VROOMM_StubThunk_6BDDE
		add	sp, 4
		xor	ax, ax
		mov	[si+127h], ax
		mov	[si+11Bh], ax
		mov	[bp+var_2], 1
		jmp	short loc_375F0
; ���������������������������������������������������������������������������

loc_375E6:				; CODE XREF: Terrain_UpdateLODPerFrame+4Fj
		inc	cx
		add	dx, 9Ah	; '�'

loc_375EB:				; CODE XREF: Terrain_UpdateLODPerFrame+41j
		cmp	[si+8],	cx
		jg	short loc_375B1

loc_375F0:				; CODE XREF: Terrain_UpdateLODPerFrame+54j
					; Terrain_UpdateLODPerFrame+76j
		cmp	byte_6EB46, 0
		jz	short loc_3760F
		mov	al, [bp+var_2]
		push	ax
		mov	ax, di
		add	ax, 14h
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Terrain_ComputeLODMesh
		add	sp, 6

loc_3760F:				; CODE XREF: Terrain_UpdateLODPerFrame+87j
		movsx	eax, word ptr [si+119h]
		mov	[bp+var_6], eax
		mov	eax, [si+115h]
		mov	[bp+var_A], eax
		shl	eax, 8
		mov	edx, [di+1Ch]
		sub	edx, eax
		mov	[bp+var_E], edx
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	ax, word ptr [bp+var_12+1]
		mov	[si+119h], ax

loc_37640:
		cmp	word ptr [si+119h], 0

loc_37645:
		jle	short loc_37654
		cmp	[bp+var_6], 0

loc_3764C:
		jle	short loc_37654

loc_3764E:				; CODE XREF: Terrain_UpdateLODPerFrame+F2j
		inc	word ptr [si+11Bh]

loc_37652:
		jmp	short loc_37668
; ���������������������������������������������������������������������������

loc_37654:				; CODE XREF: Terrain_UpdateLODPerFrame:loc_37645j
					; Terrain_UpdateLODPerFrame:loc_3764Cj
		cmp	word ptr [si+119h], 0

loc_37659:
		jge	short loc_37662
		cmp	[bp+var_6], 0
		jl	short loc_3764E

loc_37662:				; CODE XREF: Terrain_UpdateLODPerFrame:loc_37659j
		mov	word ptr [si+11Bh], 0

loc_37668:				; CODE XREF: Terrain_UpdateLODPerFrame:loc_37652j
		mov	eax, [di+1Ch]
		sar	eax, 8

loc_37670:
		mov	[si+115h], eax
		mov	eax, [si+121h]
		mov	[bp+var_16], eax
		mov	ax, di
		add	ax, 14h
		push	ax
		push	word ptr [si+71h]
		call	Terrain_HeightSample
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[si+121h], eax
		movsx	eax, word ptr [si+125h]
		mov	[bp+var_1A], eax
		mov	ax, [si+121h]
		sub	ax, word ptr [bp+var_16]
		mov	[si+125h], ax
		cmp	word ptr [si+125h], 0
		jle	short loc_376C1
		cmp	[bp+var_1A], 0
		jle	short loc_376C1

loc_376BB:				; CODE XREF: Terrain_UpdateLODPerFrame+15Fj
		inc	word ptr [si+127h]
		jmp	short loc_376D5
; ���������������������������������������������������������������������������

loc_376C1:				; CODE XREF: Terrain_UpdateLODPerFrame+144j
					; Terrain_UpdateLODPerFrame+14Bj
		cmp	word ptr [si+125h], 0
		jge	short loc_376CF
		cmp	[bp+var_1A], 0
		jl	short loc_376BB

loc_376CF:				; CODE XREF: Terrain_UpdateLODPerFrame+158j
		mov	word ptr [si+127h], 0

loc_376D5:				; CODE XREF: Terrain_UpdateLODPerFrame+151j
		mov	eax, [si+115h]
		sub	eax, [si+121h]
		mov	[si+11Dh], eax
		cmp	word ptr [si+127h], 4
		jg	short loc_376F8
		cmp	word ptr [si+11Bh], 0Ah
		jg	short loc_376F8
		cmp	[bp+var_1], 0
		jz	short loc_37723

loc_376F8:				; CODE XREF: Terrain_UpdateLODPerFrame+17Bj
					; Terrain_UpdateLODPerFrame+182j
		cmp	dword ptr [si+11Dh], 0
		jge	short loc_37705
		xor	eax, eax
		jmp	short loc_3770A
; ���������������������������������������������������������������������������

loc_37705:				; CODE XREF: Terrain_UpdateLODPerFrame+190j
		mov	eax, [si+11Dh]

loc_3770A:				; CODE XREF: Terrain_UpdateLODPerFrame+195j
		push	eax
		push	541Ah
		call	Texture_SelectMipLevel
		add	sp, 6
		mov	word ptr [si+127h], 0
		mov	word ptr [si+11Bh], 0

loc_37723:				; CODE XREF: Terrain_UpdateLODPerFrame+188j
		cmp	[bp+var_1], 0
		jz	short loc_37730
		mov	[bp+var_1], 0
		jmp	loc_375A6
; ���������������������������������������������������������������������������

loc_37730:				; CODE XREF: Terrain_UpdateLODPerFrame+1B9j
		cmp	byte_6EB46, 0
		jz	short loc_37760
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72C24, eax
		push	di
		mov	ax, si

loc_37747:
		add	ax, 0Ah
		push	ax

loc_3774B:
		call	Terrain_TileBoundaryTest

loc_37750:
		add	sp, 4

loc_37753:
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72C28, eax

loc_37760:				; CODE XREF: Terrain_UpdateLODPerFrame+1C7j
		push	di
		mov	ax, si
		add	ax, 73h	; 's'
		push	ax
		call	Model_RenderWithSubcomponents
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 0F0h ; '�'
		push	ax
		call	Picking_ComputeWrapper
		add	sp, 4

loc_3777E:				; CODE XREF: Terrain_UpdateLODPerFrame+14j
		pop	di
		pop	si
		leave
		retf
Terrain_UpdateLODPerFrame	endp

; ���������������������������������������������������������������������������

loc_37782:				; DATA XREF: seg339:1AB8o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		push	word_70466
		push	5510h
		call	TerrainTile_EvictOutOfRange
		add	sp, 4
		push	ds
		push	offset word_727BA
		call	Anim_UpdateFrameCycleArray_4FBC3
		add	sp, 4
		mov	ax, si
		add	ax, 0B5h ; '�'
		mov	[bp-4],	ax
		mov	word ptr [bp-2], 0
		jmp	short loc_3780A
; ���������������������������������������������������������������������������

loc_377B7:				; CODE XREF: seg077:02B1j
		mov	bx, [bp-4]
		mov	di, [bx]
		cmp	word ptr [di+4], 0
		jnz	short loc_37803
		mov	ax, word_70466
		sub	ax, [di+6]
		cmp	ax, 8
		jbe	short loc_37803
		or	di, di
		jz	short loc_377DD
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_377DD:				; CODE XREF: seg077:026Fj
		mov	di, [bp-4]
		mov	cx, [bp-4]
		add	cx, 2
		mov	dx, [bp-2]
		inc	dx
		jmp	short loc_377F9
; ���������������������������������������������������������������������������

loc_377EC:				; CODE XREF: seg077:029Dj
		mov	bx, cx
		mov	ax, [bx]
		mov	[di], ax
		add	cx, 2
		add	di, 2
		inc	dx

loc_377F9:				; CODE XREF: seg077:028Aj
		cmp	[si+0B3h], dx
		jg	short loc_377EC
		dec	word ptr [si+0B3h]

loc_37803:				; CODE XREF: seg077:0260j seg077:026Bj
		inc	word ptr [bp-2]
		add	word ptr [bp-4], 2

loc_3780A:				; CODE XREF: seg077:0255j
		mov	ax, [si+0B3h]
		cmp	ax, [bp-2]
		jg	short loc_377B7
		call	Terrain_SectorResolveChecked
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3781E:				; DATA XREF: seg339:1AACo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+6]
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp-4],	eax
		mov	di, si
		add	di, 0B5h ; '�'
		xor	dx, dx
		jmp	short loc_3785D
; ���������������������������������������������������������������������������

loc_37840:				; CODE XREF: seg077:loc_37861j
		mov	cx, [di]

loc_37842:
		mov	bx, cx
		mov	ax, [bx+4]
		cmp	ax, [bp+8]
		jnz	short loc_37859

loc_3784C:				; CODE XREF: seg077:0315j
		push	word ptr [bp+8]
		push	cx
		push	cs

loc_37851:
		call	near ptr Terrain_UpdateLODPerFrame
		add	sp, 4
		jmp	short loc_378B1
; ���������������������������������������������������������������������������

loc_37859:				; CODE XREF: seg077:02EAj
		inc	dx
		add	di, 2

loc_3785D:				; CODE XREF: seg077:02DEj
		cmp	[si+0B3h], dx

loc_37861:
		jg	short loc_37840

loc_37863:
		mov	di, si

loc_37865:
		add	di, 0B5h ; '�'

loc_37869:
		xor	dx, dx
		jmp	short loc_3787B
; ���������������������������������������������������������������������������

loc_3786D:				; CODE XREF: seg077:031Fj
		mov	cx, [di]

loc_3786F:
		mov	bx, cx

loc_37871:
		cmp	word ptr [bx+4], 0
		jz	short loc_3784C
		inc	dx
		add	di, 2

loc_3787B:				; CODE XREF: seg077:030Bj
		cmp	[si+0B3h], dx
		jg	short loc_3786D
		cmp	word ptr [si+0B3h], 4
		jge	short loc_378B1
		push	si
		call	VROOMM_StubThunk_6BF23
		pop	cx
		mov	bx, [si+0B3h]
		shl	bx, 1
		mov	[bx+si+0B5h], ax
		push	word ptr [bp+8]
		mov	bx, [si+0B3h]
		shl	bx, 1
		push	word ptr [bx+si+0B5h]
		push	cs
		call	near ptr Terrain_UpdateLODPerFrame
		add	sp, 4
		inc	word ptr [si+0B3h]

loc_378B1:				; CODE XREF: seg077:02F7j seg077:0326j
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp-8],	eax
		sub	eax, [bp-4]
		mov	dword_704F0, eax
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,162L — interpole la hauteur du terrain à une position donnée (sub_32901) après
; vérification du frustum (sub_32F55) : requête d'altitude du terrain à une position 3D —
; utilisée à la fois par le rendu et par l'IA de vol (seg003) pour le suivi de
; terrain/évitement.
; ==============================================================================================
Terrain_QueryAltitudeAt	proc far		; CODE XREF: AI_Sensor_TooLow_56E5+93P seg003:0C6DP ...

var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		push	large 10000h
		push	0
		push	[bp+arg_8]
		call	Utility_Helper_55DB4
		add	sp, 8
		push	di
		push	word ptr [si+0BFh]
		call	Terrain_HeightSample
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	ax, si
		add	ax, 0B5h ; '�'
		mov	[bp+var_8], ax
		mov	[bp+var_6], 0
		jmp	loc_379A1
; ���������������������������������������������������������������������������

loc_37910:				; CODE XREF: Terrain_QueryAltitudeAt+E0j
		mov	bx, [bp+var_8]
		mov	ax, [bx]
		mov	[bp+var_A], ax
		push	di
		add	ax, 0Ah
		push	ax
		call	Camera_FrustumBoundsTest
		add	sp, 4
		or	al, al
		jz	short loc_3799A
		mov	eax, [bp+var_4]
		mov	[bp+var_E], eax
		shl	eax, 8
		cmp	eax, [di+8]
		jle	short loc_37940
		mov	ax, 1
		jmp	short loc_37942
; ���������������������������������������������������������������������������

loc_37940:				; CODE XREF: Terrain_QueryAltitudeAt+6Fj
		xor	ax, ax

loc_37942:				; CODE XREF: Terrain_QueryAltitudeAt+74j
		or	al, al
		jnz	short loc_3794C
		cmp	[bp+arg_A], 0

loc_3794A:
		jz	short loc_3799A

loc_3794C:				; CODE XREF: Terrain_QueryAltitudeAt+7Aj
		mov	byte ptr [si+207h], 1

loc_37951:
		mov	eax, [bp+arg_0]
		mov	[bp+var_12], eax
		mov	si, di
		mov	ax, [bp+arg_8]
		mov	[bp+var_14], ax

loc_37961:
		push	ax

loc_37962:
		sub	sp, 0Ch
		mov	eax, [si]
		mov	[bp+var_2A], eax
		mov	eax, [si+4]
		mov	[bp+var_26], eax
		mov	eax, [si+8]
		mov	[bp+var_22], eax
		mov	ax, [bp+var_A]
		add	ax, 0Ah
		push	ax
		push	large [bp+var_12]
		call	Camera_TransformIfVisible
		add	sp, 14h
		les	bx, [bp+var_12]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		jmp	short loc_379EA
; ���������������������������������������������������������������������������

loc_3799A:				; CODE XREF: Terrain_QueryAltitudeAt+5Dj
					; Terrain_QueryAltitudeAt:loc_3794Aj
		inc	[bp+var_6]
		add	[bp+var_8], 2

loc_379A1:				; CODE XREF: Terrain_QueryAltitudeAt+43j
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_6]
		jle	short loc_379AD
		jmp	loc_37910
; ���������������������������������������������������������������������������

loc_379AD:				; CODE XREF: Terrain_QueryAltitudeAt+DEj
		mov	byte ptr [si+207h], 0
		mov	si, word ptr [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		or	si, si
		jz	short loc_379C5
		mov	ax, si
		jmp	short loc_379CF
; ���������������������������������������������������������������������������

loc_379C5:				; CODE XREF: Terrain_QueryAltitudeAt+F5j
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_379CF:				; CODE XREF: Terrain_QueryAltitudeAt+F9j
		or	ax, ax
		jz	short loc_379E2
		mov	eax, [bp+var_18]
		shl	eax, 8
		mov	[si], eax
		mov	ax, si
		jmp	short loc_379E4
; ���������������������������������������������������������������������������

loc_379E2:				; CODE XREF: Terrain_QueryAltitudeAt+107j
		mov	ax, si

loc_379E4:				; CODE XREF: Terrain_QueryAltitudeAt+116j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_379EA:				; CODE XREF: Terrain_QueryAltitudeAt+CEj
		pop	di
		pop	si
		leave
		retf
Terrain_QueryAltitudeAt	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — parcourt un tableau de 10 pointeurs (+0xB5) et notifie chacun (sub_6BE33) avec une
; valeur : notification en masse liée au terrain (probable mise à jour de LOD par patch
; adjacent).
; ==============================================================================================
Terrain_NotifyAdjacentPatches	proc far		; CODE XREF: Cockpit_ReadControlsFrame_8F720+106P

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h ; '�'
		mov	[bp+var_2], 0
		jmp	short loc_37A21
; ���������������������������������������������������������������������������

loc_37A06:				; CODE XREF: Terrain_NotifyAdjacentPatches+3Aj
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	ax
		mov	ax, [di]
		add	ax, 0Ah
		push	ax
		call	VROOMM_StubThunk_6BE33
		add	sp, 4
		inc	[bp+var_2]
		add	di, 2

loc_37A21:				; CODE XREF: Terrain_NotifyAdjacentPatches+16j
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_2]
		jg	short loc_37A06
		pop	di
		pop	si
		leave
		retf
Terrain_NotifyAdjacentPatches	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,73L — teste l'inclusion dans le frustum (sub_32F55) de chacun des 10 patches adjacents
; (+0xB5) : test de visibilité des patches de terrain voisins.
; ==============================================================================================
Terrain_TestAdjacentVisibility	proc far		; CODE XREF: Terrain_ComputeVisibilityAndAltitude_98CF0+13P

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h ; '�'
		mov	[bp+var_2], 0

loc_37A44:
		jmp	short loc_37A7C
; ���������������������������������������������������������������������������

loc_37A46:				; CODE XREF: Terrain_TestAdjacentVisibility+55j
		mov	ax, [di]

loc_37A48:
		mov	[bp+var_4], ax
		push	[bp+arg_2]
		add	ax, 0Ah
		push	ax

loc_37A52:
		call	Camera_FrustumBoundsTest

loc_37A57:
		add	sp, 4
		or	al, al

loc_37A5C:
		jz	short loc_37A76
		mov	ax, [bp+arg_2]

loc_37A61:
		mov	[bp+var_6], ax
		push	ax
		mov	ax, [bp+var_4]
		add	ax, 0Ah
		push	ax
		call	Terrain_SectorIndexSigned

loc_37A71:
		add	sp, 4

loc_37A74:
		jmp	short loc_37A87
; ���������������������������������������������������������������������������

loc_37A76:				; CODE XREF: Terrain_TestAdjacentVisibility:loc_37A5Cj
		inc	[bp+var_2]
		add	di, 2

loc_37A7C:				; CODE XREF: Terrain_TestAdjacentVisibility:loc_37A44j
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_2]
		jg	short loc_37A46
		mov	al, 0FFh

loc_37A87:				; CODE XREF: Terrain_TestAdjacentVisibility:loc_37A74j
		pop	di
		pop	si
		leave
		retf
Terrain_TestAdjacentVisibility	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,13L — wrapper vers sub_3317E (vidage de liste, table 0x5510) : vidage de la liste
; d'objets sélectionnables (picking).
; ==============================================================================================
Picking_ClearSelectableList	proc far		; CODE XREF: UIScript_ParseAndEvaluate_7A054+6BCP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	5510h
		call	TerrainTile_ListClear
		pop	cx
		pop	bp
		retf
Picking_ClearSelectableList	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,125L — parcourt les 10 patches adjacents (+0xB5), calcule des données géométriques
; (buffer local) : traitement des patches de terrain adjacents pour la continuité du maillage
; (raccord de LOD entre patches).
; ==============================================================================================
Terrain_ProcessAdjacentPatches	proc far		; CODE XREF: seg030:172FP

var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= byte ptr  14h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h ; '�'
		mov	[bp+var_4], 0
		jmp	loc_37B65
; ���������������������������������������������������������������������������

loc_37AB5:				; CODE XREF: Terrain_ProcessAdjacentPatches:loc_37B6Ej
		mov	ax, [di]
		mov	[bp+var_2], ax
		push	[bp+arg_6]
		add	ax, 0Ah
		push	ax
		call	Camera_FrustumBoundsTest
		add	sp, 4
		or	al, al
		jnz	short loc_37AD0
		jmp	loc_37B5F
; ���������������������������������������������������������������������������

loc_37AD0:				; CODE XREF: Terrain_ProcessAdjacentPatches+2Fj
		mov	ax, [bp+arg_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_C], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_E], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_10], ax
		mov	al, [bp+arg_E]
		mov	[bp+var_11], al
		mov	eax, [bp+arg_10]
		mov	[bp+var_16], eax
		push	large [bp+var_16]
		mov	al, [bp+var_11]
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+var_6]
		mov	ax, [bp+var_2]
		add	ax, 0F0h ; '�'
		push	ax
		call	Picking_ComputeScaled
		add	sp, 14h
		mov	al, [bp+var_11]
		push	ax
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		sar	eax, 8
		mov	[bp+var_1A], eax
		lea	ax, [bp+var_1A]
		push	ax

loc_37B41:
		push	[bp+var_E]
		push	[bp+var_C]

loc_37B47:
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+var_6]
		mov	ax, [bp+var_2]
		add	ax, 73h	; 's'
		push	ax
		call	Model_RenderAtPosition
		add	sp, 10h

loc_37B5F:				; CODE XREF: Terrain_ProcessAdjacentPatches+31j
		inc	[bp+var_4]

loc_37B62:
		add	di, 2

loc_37B65:				; CODE XREF: Terrain_ProcessAdjacentPatches+16j
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_4]
		jle	short loc_37B71

loc_37B6E:
		jmp	loc_37AB5
; ���������������������������������������������������������������������������

loc_37B71:				; CODE XREF: Terrain_ProcessAdjacentPatches+D0j
		pop	di
		pop	si

locret_37B73:
		leave
		retf
Terrain_ProcessAdjacentPatches	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, si
		add	di, 0B5h ; '�'
		mov	word ptr [bp-6], 0
		jmp	short loc_37BBB
; ���������������������������������������������������������������������������

loc_37B8D:				; CODE XREF: seg077:0662j
		mov	ax, [di]
		mov	[bp-4],	ax
		mov	ax, [bp+8]
		mov	[bp-8],	ax
		push	ax
		mov	ax, [bp-4]
		add	ax, 73h	; 's'
		push	ax
		call	Model_RenderStatic
		add	sp, 4
		mov	[bp-1],	al
		cmp	byte ptr [bp-1], 0
		jz	short loc_37BB5
		mov	al, 1
		jmp	short loc_37BC6
; ���������������������������������������������������������������������������

loc_37BB5:				; CODE XREF: seg077:064Fj
		inc	word ptr [bp-6]
		add	di, 2

loc_37BBB:				; CODE XREF: seg077:062Bj
		mov	ax, [si+0B3h]
		cmp	ax, [bp-6]
		jg	short loc_37B8D
		mov	al, 0

loc_37BC6:				; CODE XREF: seg077:0653j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,60L — parcourt les patches adjacents, appelle sub_32FBC (test de distance limite) pour
; chacun : vérification de la limite de distance sur les patches voisins de terrain.
; ==============================================================================================
Terrain_CheckAdjacentDistance	proc far		; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+2A8P
					; PlayerComponent_ComputeImpactResponse_A089D+84P

var_E		= dword	ptr -0Eh
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h ; '�'
		mov	[bp+var_4], 0
		jmp	short loc_37C26
; ���������������������������������������������������������������������������

loc_37BE2:				; CODE XREF: Terrain_CheckAdjacentDistance+63j
		mov	ax, [di]
		mov	[bp+var_2], ax
		lea	ax, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		mov	ax, [bp+var_2]
		add	ax, 0Ah
		push	ax
		call	Camera_DistanceLimitTest
		add	sp, 6
		or	al, al
		jz	short loc_37C20
		push	[bp+arg_8]
		sub	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_E], eax
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 0C1h ; '�'
		push	ax
		call	VROOMM_StubThunk_6BD00
		add	sp, 0Ah

loc_37C20:				; CODE XREF: Terrain_CheckAdjacentDistance+35j
		inc	[bp+var_4]
		add	di, 2

loc_37C26:				; CODE XREF: Terrain_CheckAdjacentDistance+16j
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_4]
		jg	short loc_37BE2
		pop	di
		pop	si
		leave
		retf
Terrain_CheckAdjacentDistance	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,22L — wrapper vers sub_36AA4 (recherche d'objet sélectionnable) avec offset fixe
; (+0x171) : wrapper de recherche de sélection pour un type d'objet spécifique.
; ==============================================================================================
Picking_FindSelectableTyped	proc far		; CODE XREF: Collision_MainLoop+243P
					; Collision_MainLoop+266P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, dx

loc_37C3E:
		add	ax, 171h

loc_37C41:
		push	ax
		call	Picking_FindSelectableObject
		add	sp, 4
		pop	bp
		retf
Picking_FindSelectableTyped	endp

seg077		ends
