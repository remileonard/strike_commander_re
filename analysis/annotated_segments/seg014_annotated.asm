seg014		segment	byte public 'CODE' use16
		assume cs:seg014
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far — slot de vtable d'entrée caméra (DATA XREF seg339:069A/0726...). Trivial : return
; si[+0x89] (pointeur entité sujet lié).
; ==============================================================================================
Camera_Entry_GetSubject_14859:				; DATA XREF: seg339:off_6D726o
					; seg339:069Ao	...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+89h]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far — slot de vtable d'entrée caméra (DATA XREF seg339:068E). si = entrée. subject =
; si[+0x89]. Camera_ComputeGeometryHelper_56E29(&buf, si+0x20) sème l'orientation caméra
; depuis subject->vtable[0x3C]() ; si[+0x14/18/1C] = subject[+0x12/16/1A] (POSITION CAMÉRA =
; POSITION SUJET, sans offset) ; Camera_ComputeViewMatrix_2E2AC(si) ; checks d'état sur
; subject->vtable[0]/[0x34] (al==6 -> sub_6C42A). Vue 'attachée rigide au sujet, orientation
; du sujet'. Retour bloqué si byte_722D1==1.
; ==============================================================================================
Camera_AttachedNoOffsetCompute_14867:				; DATA XREF: seg339:068Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		cmp	word ptr [si+89h], 0
		jz	short loc_148EF
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_148D9
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_148DB
; ���������������������������������������������������������������������������

loc_148D9:				; CODE XREF: seg014:0077j
		mov	al, 17h

loc_148DB:				; CODE XREF: seg014:0087j
		cmp	al, 6
		jnz	short loc_148EF
		mov	bx, [si+89h]
		push	large dword ptr	[bx+5Ah]
		call	VROOMM_StubThunk_6C42A
		add	sp, 4

loc_148EF:				; CODE XREF: seg014:0024j seg014:008Dj
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_148FE
		mov	ax, 1
		jmp	short loc_14900
; ���������������������������������������������������������������������������

loc_148FE:				; CODE XREF: seg014:00A7j
		xor	ax, ax

loc_14900:				; CODE XREF: seg014:00ACj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far — getter trivial (DATA XREF seg339:0692). return AL = 1.
; ==============================================================================================
Camera_Entry_GetState_1_14904:				; DATA XREF: seg339:0692o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1490E:				; DATA XREF: seg339:067Ao seg339:069Eo ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	UIScreen_RenderGraphVGA_509EE
		pop	cx
		cmp	word ptr [si+89h], 0
		jz	short loc_14937
		mov	bx, [si+89h]
		cmp	byte ptr [bx+5], 0
		jz	short loc_14937
		push	si
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4

loc_14937:				; CODE XREF: seg014:00D1j seg014:00DBj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, ~0xB0 L — CAMÉRA ORBITALE / SUIVI (ROTA, et probable base de CHASE/TARGET). Slot de
; vtable (DATA XREF seg339:07AC ; présente dans les vtables des entrées caméra type ROTA tag
; 0x6A2). si = objet entrée caméra. subject = si[+0x89]. R = subject->vtable[0x3C]() (matrice
; d'orientation du sujet). axe = { R[+0x0C], R[+0x10], R[+0x14] } (rangée 1) transformé par
; Math_ApplyRotationHelperA_58768(&axe, si+0x8B) — si[+0x8B] = MATRICE D'ORBITE 3x3 accumulée.
; targetPos = subject.pos(+0x12) - si[+0xAF] * axe (si[+0xAF] = distance d'orbite, 24.8).
; POSITION LISSÉE : diff = targetPos - si[+0x14..] ; si |diff| > si[+0xB3] -> pas limité
; (UI_ApplyLineOfSightCheck_55A9E) ; sinon si[+0x14..] += diff/4 par frame (0x400 -> /4) = le
; 'lag'. ORIENTATION : look = subject.pos - si[+0x14..] ;
; UI_ApplyLineOfSightAndTransform_57DAE(si+0x20, ...) construit la matrice de visée si[+0x20]
; (caméra regarde le sujet). ENTRÉES JOUEUR : boutons joystick
; (Joystick_TestButtonMasked_67B6C) + Joystick_GetAxisMin/Max_67BC9/67BD8 -> deltas ->
; Matrix_BuildAxisZ_572BC / Matrix_BuildAxisX_56EC3 / Matrix_ApplyToVectorY_57660 accumulés
; dans si[+0x8B] (rotation de l'orbite, bornée par si[+0x9B]/+0xAB). ZOOM : byte_72DE3==1 ->
; si[+0xAF] += dword_70448 (borné si[+0xB3] max) ; byte_72DE2==1 -> si[+0xAF] -= dword_70448
; (borné si[+0xB7] min). Camera_ComputeViewMatrix_2E2AC(si) en fin. Champs : +0x14/18/1C pos
; lissée, +0x20 matrice de visée, +0x2C matrice de travail, +0x89 sujet, +0x8B matrice
; d'orbite, +0x9B/+0xAB limites d'angle, +0xAF distance, +0xB3 dist max, +0xB7 dist min. Voir
; CAMERA_SYSTEM.md §4bis.
; ==============================================================================================
Camera_OrbitTrackCompute_1493A:				; DATA XREF: seg339:07ACo
		push	bp
		mov	bp, sp
		sub	sp, 0E0h
		push	si
		push	di
		mov	si, [bp+6]
		cmp	word ptr [si+89h], 0
		jnz	short loc_14950
		jmp	loc_14EAF
; ���������������������������������������������������������������������������

loc_14950:				; CODE XREF: seg014:00FBj
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp-68h], eax
		mov	eax, [di+4]
		mov	[bp-64h], eax
		mov	eax, [di+8]
		mov	[bp-60h], eax
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		lea	ax, [bp-68h]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		mov	eax, [si+0AFh]
		neg	eax
		mov	[bp-4],	eax
		mov	[bp-8],	eax
		mov	eax, [bp-68h]
		mov	edx, [bp-8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-68h], eax
		mov	eax, [bp-64h]
		mov	edx, [bp-8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-64h], eax
		mov	eax, [bp-60h]
		mov	edx, [bp-8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-60h], eax
		lea	ax, [bp-68h]
		push	ax
		push	word ptr [si+89h]
		push	si
		call	Camera_ClipTestWrapper
		add	sp, 6
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	[bp-68h], eax
		mov	eax, [di+4]
		add	[bp-64h], eax
		mov	eax, [di+8]
		add	[bp-60h], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp-68h]
		sub	eax, [di]
		mov	[bp-80h], eax
		mov	eax, [bp-64h]
		sub	eax, [di+4]
		mov	[bp-7Ch], eax
		mov	eax, [bp-60h]
		sub	eax, [di+8]
		mov	[bp-78h], eax
		mov	eax, [bp-80h]
		mov	[bp-74h], eax
		mov	eax, [bp-7Ch]
		mov	[bp-70h], eax
		mov	eax, [bp-78h]
		mov	[bp-6Ch], eax
		push	eax
		push	large dword ptr	[bp-70h]
		push	large dword ptr	[bp-74h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Ch], eax
		mov	[bp-10h], eax
		mov	eax, [si+0B3h]
		cmp	eax, [bp-10h]
		jge	short loc_14A75
		mov	ax, 1
		jmp	short loc_14A77
; ���������������������������������������������������������������������������

loc_14A75:				; CODE XREF: seg014:021Ej
		xor	ax, ax

loc_14A77:				; CODE XREF: seg014:0223j
		or	al, al
		jz	short loc_14AEF
		mov	ax, si
		add	ax, 0B3h ; '�'
		push	ax
		lea	ax, [bp-74h]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		mov	eax, [bp-68h]
		sub	eax, [bp-74h]
		mov	[bp-8Ch], eax
		mov	eax, [bp-64h]
		sub	eax, [bp-70h]
		mov	[bp-88h], eax
		mov	eax, [bp-60h]
		sub	eax, [bp-6Ch]
		mov	[bp-84h], eax
		mov	eax, [bp-8Ch]
		mov	[bp-98h], eax
		mov	eax, [bp-88h]
		mov	[bp-94h], eax
		mov	eax, [bp-84h]
		mov	[bp-90h], eax
		mov	eax, [bp-98h]
		mov	[si+14h], eax
		mov	eax, [bp-94h]
		mov	[si+18h], eax
		mov	eax, [bp-90h]
		mov	[si+1Ch], eax
		jmp	short loc_14B5D
; ���������������������������������������������������������������������������

loc_14AEF:				; CODE XREF: seg014:0229j
		mov	dword ptr [bp-14h], 400h
		mov	eax, [bp-74h]
		mov	edx, eax
		mov	ecx, [bp-14h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-74h], eax
		mov	eax, [bp-70h]
		mov	edx, eax
		mov	ecx, [bp-14h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-70h], eax
		mov	eax, [bp-6Ch]
		mov	edx, eax
		mov	ecx, [bp-14h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-6Ch], eax
		mov	eax, [bp-74h]
		add	[si+14h], eax
		mov	eax, [bp-70h]
		add	[si+18h], eax
		mov	eax, [bp-6Ch]
		add	[si+1Ch], eax

loc_14B5D:				; CODE XREF: seg014:029Dj
		mov	di, [si+89h]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	[bp-16h], ax
		mov	eax, [di]
		mov	bx, [bp-16h]
		sub	eax, [bx]
		mov	[bp-0B0h], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp-0ACh], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp-0A8h], eax
		mov	eax, [bp-0B0h]
		mov	[bp-0A4h], eax
		mov	eax, [bp-0ACh]
		mov	[bp-0A0h], eax
		mov	eax, [bp-0A8h]
		mov	[bp-9Ch], eax
		mov	di, si
		add	di, 2Ch	; ','
		push	eax
		push	large dword ptr	[bp-0A0h]
		push	large dword ptr	[bp-0A4h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-1Ah], eax
		mov	[bp-1Eh], eax
		mov	eax, [di]
		mov	edx, [bp-1Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-22h], eax
		mov	eax, [bp-22h]
		mov	[bp-26h], eax
		mov	eax, [di+4]
		mov	edx, [bp-1Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-2Ah], eax
		mov	eax, [bp-2Ah]
		mov	[bp-2Eh], eax
		mov	eax, [di+8]
		mov	edx, [bp-1Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-32h], eax
		mov	eax, [bp-32h]
		mov	[bp-36h], eax
		mov	eax, [bp-26h]
		mov	[bp-0C8h], eax
		mov	eax, [bp-2Eh]
		mov	[bp-0C4h], eax
		mov	eax, [bp-36h]
		mov	[bp-0C0h], eax
		mov	eax, [bp-0A4h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp-3Ah], eax
		mov	[bp-3Eh], eax
		mov	eax, [bp-0A0h]
		cdq
		idiv	ebx
		mov	[bp-42h], eax
		mov	[bp-46h], eax
		mov	eax, [bp-9Ch]
		cdq
		idiv	ebx
		mov	[bp-4Ah], eax
		mov	[bp-4Eh], eax
		mov	eax, [bp-3Eh]
		mov	[bp-0D4h], eax
		mov	eax, [bp-46h]
		mov	[bp-0D0h], eax
		mov	eax, [bp-4Eh]
		mov	[bp-0CCh], eax
		mov	eax, [bp-0C8h]
		add	eax, [bp-0D4h]
		mov	[bp-0E0h], eax
		mov	eax, [bp-0C4h]
		add	eax, [bp-0D0h]
		mov	[bp-0DCh], eax
		mov	eax, [bp-0C0h]
		add	eax, [bp-0CCh]
		mov	[bp-0D8h], eax
		mov	eax, [bp-0E0h]
		mov	[bp-0BCh], eax
		mov	eax, [bp-0DCh]
		mov	[bp-0B8h], eax
		mov	eax, [bp-0D8h]
		mov	[bp-0B4h], eax
		lea	ax, [bp-0BCh]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		push	2
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jnz	short loc_14D0D
		jmp	loc_14E31
; ���������������������������������������������������������������������������

loc_14D0D:				; CODE XREF: seg014:04B8j
		push	0
		call	Joystick_GetAxisMin_67BC9
		pop	cx
		neg	ax
		sar	ax, 1
		mov	di, ax
		push	0
		call	Joystick_GetAxisMax_67BD8
		pop	cx
		sar	ax, 1
		mov	[bp-50h], ax
		or	di, di
		jz	short loc_14DA2
		or	di, di
		jle	short loc_14D56
		cmp	dword ptr [si+9Bh], 0
		jl	short loc_14D3D
		mov	ax, 1
		jmp	short loc_14D3F
; ���������������������������������������������������������������������������

loc_14D3D:				; CODE XREF: seg014:04E6j
		xor	ax, ax

loc_14D3F:				; CODE XREF: seg014:04EBj
		or	al, al
		jz	short loc_14D56
		cmp	dword ptr [si+8Bh], 0
		jg	short loc_14D50
		mov	ax, 1
		jmp	short loc_14D52
; ���������������������������������������������������������������������������

loc_14D50:				; CODE XREF: seg014:04F9j
		xor	ax, ax

loc_14D52:				; CODE XREF: seg014:04FEj
		or	al, al
		jnz	short loc_14D80

loc_14D56:				; CODE XREF: seg014:04DEj seg014:04F1j
		or	di, di
		jge	short loc_14DA2
		cmp	dword ptr [si+9Bh], 0
		jg	short loc_14D67
		mov	ax, 1
		jmp	short loc_14D69
; ���������������������������������������������������������������������������

loc_14D67:				; CODE XREF: seg014:0510j
		xor	ax, ax

loc_14D69:				; CODE XREF: seg014:0515j
		or	al, al
		jz	short loc_14DA2
		cmp	dword ptr [si+8Bh], 0
		jl	short loc_14D7A
		mov	ax, 1
		jmp	short loc_14D7C
; ���������������������������������������������������������������������������

loc_14D7A:				; CODE XREF: seg014:0523j
		xor	ax, ax

loc_14D7C:				; CODE XREF: seg014:0528j
		or	al, al
		jz	short loc_14DA2

loc_14D80:				; CODE XREF: seg014:0504j
		mov	[bp-52h], di
		movsx	eax, word ptr [bp-52h]
		shl	eax, 8
		mov	[bp-56h], eax
		lea	ax, [bp-56h]
		push	ax
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	Matrix_BuildAxisZ_572BC
		add	sp, 4

loc_14DA2:				; CODE XREF: seg014:04DAj seg014:0508j ...
		cmp	word ptr [bp-50h], 0
		jz	short loc_14E25
		cmp	word ptr [bp-50h], 0
		jle	short loc_14DD4
		cmp	dword ptr [si+9Bh], 0
		jl	short loc_14DBB
		mov	ax, 1
		jmp	short loc_14DBD
; ���������������������������������������������������������������������������

loc_14DBB:				; CODE XREF: seg014:0564j
		xor	ax, ax

loc_14DBD:				; CODE XREF: seg014:0569j
		or	al, al
		jz	short loc_14DD4
		cmp	dword ptr [si+0ABh], 0
		jl	short loc_14DCE
		mov	ax, 1
		jmp	short loc_14DD0
; ���������������������������������������������������������������������������

loc_14DCE:				; CODE XREF: seg014:0577j
		xor	ax, ax

loc_14DD0:				; CODE XREF: seg014:057Cj
		or	al, al
		jnz	short loc_14E00

loc_14DD4:				; CODE XREF: seg014:055Cj seg014:056Fj
		cmp	word ptr [bp-50h], 0
		jge	short loc_14E25
		cmp	dword ptr [si+9Bh], 0
		jg	short loc_14DE7
		mov	ax, 1
		jmp	short loc_14DE9
; ���������������������������������������������������������������������������

loc_14DE7:				; CODE XREF: seg014:0590j
		xor	ax, ax

loc_14DE9:				; CODE XREF: seg014:0595j
		or	al, al
		jz	short loc_14E25
		cmp	dword ptr [si+0ABh], 0
		jg	short loc_14DFA
		mov	ax, 1
		jmp	short loc_14DFC
; ���������������������������������������������������������������������������

loc_14DFA:				; CODE XREF: seg014:05A3j
		xor	ax, ax

loc_14DFC:				; CODE XREF: seg014:05A8j
		or	al, al
		jz	short loc_14E25

loc_14E00:				; CODE XREF: seg014:0582j
		mov	ax, [bp-50h]
		mov	[bp-58h], ax
		movsx	eax, word ptr [bp-58h]
		shl	eax, 8
		mov	[bp-5Ch], eax
		lea	ax, [bp-5Ch]
		push	ax
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	Matrix_BuildAxisX_56EC3
		add	sp, 4

loc_14E25:				; CODE XREF: seg014:0556j seg014:0588j ...
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	Matrix_ApplyToVectorY_57660
		pop	cx

loc_14E31:				; CODE XREF: seg014:04BAj
		cmp	byte_72DE3, 1
		jnz	short loc_14E3C
		mov	al, 1
		jmp	short loc_14E3E
; ���������������������������������������������������������������������������

loc_14E3C:				; CODE XREF: seg014:05E6j
		mov	al, 0

loc_14E3E:				; CODE XREF: seg014:05EAj
		or	al, al
		jz	short loc_14E69
		mov	eax, dword_70448
		add	[si+0AFh], eax
		mov	eax, [si+0AFh]
		cmp	eax, [si+0B3h]
		jle	short loc_14E5C
		mov	ax, 1
		jmp	short loc_14E5E
; ���������������������������������������������������������������������������

loc_14E5C:				; CODE XREF: seg014:0605j
		xor	ax, ax

loc_14E5E:				; CODE XREF: seg014:060Aj
		or	al, al
		jz	short loc_14EA4
		mov	eax, [si+0B3h]
		jmp	short loc_14E9F
; ���������������������������������������������������������������������������

loc_14E69:				; CODE XREF: seg014:05F0j
		cmp	byte_72DE2, 1
		jnz	short loc_14E74
		mov	al, 1
		jmp	short loc_14E76
; ���������������������������������������������������������������������������

loc_14E74:				; CODE XREF: seg014:061Ej
		mov	al, 0

loc_14E76:				; CODE XREF: seg014:0622j
		or	al, al
		jz	short loc_14EA4
		mov	eax, dword_70448
		sub	[si+0AFh], eax
		mov	eax, [si+0AFh]
		cmp	eax, [si+0B7h]
		jge	short loc_14E94
		mov	ax, 1
		jmp	short loc_14E96
; ���������������������������������������������������������������������������

loc_14E94:				; CODE XREF: seg014:063Dj
		xor	ax, ax

loc_14E96:				; CODE XREF: seg014:0642j
		or	al, al
		jz	short loc_14EA4
		mov	eax, [si+0B7h]

loc_14E9F:				; CODE XREF: seg014:0617j
		mov	[si+0AFh], eax

loc_14EA4:				; CODE XREF: seg014:0610j seg014:0628j ...
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1
		jmp	short loc_14EB1
; ���������������������������������������������������������������������������

loc_14EAF:				; CODE XREF: seg014:00FDj
		mov	al, 0

loc_14EB1:				; CODE XREF: seg014:065Dj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far — getter trivial de slot de vtable d'entrée caméra (DATA XREF seg339:07B0). return AL =
; 3. 3 = code d'état CHASE. Adjacent à loc_1493A (seg339:07AC) dans la MÊME vtable → confirme
; que la vue CHASE utilise le calcul orbital Camera_OrbitTrackCompute_1493A.
; ==============================================================================================
Camera_Entry_GetState_CHASE_14EB5:				; DATA XREF: seg339:07B0o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 3
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far — slot de vtable d'entrée caméra (DATA XREF seg339:0788). si=entrée. Si si[+0x89]
; (sujet) et si[+0x5C] (viewport) non nuls : si[+0x5C]->vtable[+0x0C](si). Sinon
; Camera_ComputeViewMatrix_2E2AC(si). return AL=1. (Finalisation / commit de la vue.)
; ==============================================================================================
Camera_Entry_VtSlot_Finalize_14EBF:				; DATA XREF: seg339:0788o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+89h], 0
		jz	short loc_14EE4
		cmp	word ptr [si+5Ch], 0
		jz	short loc_14EE4
		push	si
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short $+2

loc_14EE4:				; CODE XREF: seg014:067Bj seg014:0681j
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far — getter trivial (DATA XREF seg339:078C). return AL = 4. 4 = code d'état COCKPIT.
; ==============================================================================================
Camera_Entry_GetState_COCKPIT_14EF0:				; DATA XREF: seg339:078Co
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 4
		pop	bp
		retf
seg014		ends
