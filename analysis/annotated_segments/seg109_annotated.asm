seg109		segment	byte public 'CODE' use16
		assume cs:seg109
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, stub de méthode virtuelle : ignore son argument, retourne AL=16h (constante). Probable
; accesseur de type/classe minimal.
; ==============================================================================================
ClassStub_ReturnConst16h_4F2BA:				; DATA XREF: seg339:23ACo
		push	bp
		mov	bp, sp
		mov	al, 16h
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, destructeur scalar-deleting C++ : pose le tag vtable 23A4h, appelle le dtor de base
; sub_3DBC1, libère conditionnellement (bit0 du flag arg) via sub_5C7B6 (type 5C44h).
; ==============================================================================================
Dtor_ScalarDeleting_4F2C1:				; DATA XREF: seg339:off_6F454o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_4F309
		les	bx, [bp+6]
		mov	word ptr es:[bx], 23A4h
		push	0
		push	word ptr [bp+8]
		push	bx
		call	Camera_DestructTypeB
		add	sp, 6
		test	si, 1
		jz	short loc_4F309
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4F309:				; CODE XREF: seg109:0020j seg109:003Cj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, stub identique à ClassStub_ReturnConst16h_4F2BA (AL=16h) pour une autre classe/vtable.
; ==============================================================================================
ClassStub_ReturnConst16h_4F30C:				; DATA XREF: seg339:off_703DAo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 16h
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, destructeur scalar-deleting : tag vtable 32F6h, dtor du membre à +0x59 (sub_3A3EC),
; dtor de base sub_3DC8D, libération conditionnelle via sub_338.
; ==============================================================================================
Dtor_ScalarDeleting_4F316:				; DATA XREF: seg339:off_703BEo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_4F34D
		mov	word ptr [si], 32F6h
		mov	ax, si
		add	ax, 59h	; 'Y'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	Camera_DestructWithMount
		add	sp, 4
		test	di, 1
		jz	short loc_4F34D
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_4F34D:				; CODE XREF: seg109:0073j seg109:0094j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle probable ("Update"/"Tick") d'un objet trigger : si non déjà déclenché
; (+0x5B), timer (+0x55, décrément par dword_70458) expiré et cible en portée (sub_378CA),
; instancie un objet enfant depuis un template (+0x0E) via sub_38B70, copie
; position/orientation, l'enregistre dans une liste membre (+0x59, dtor sub_3A3EC) et notifie
; un listener optionnel (+0x1E, résolu via sub_22E27). Hypothèse : trigger d'effet/évènement
; scripté à usage unique — non vérifié en détail.
; ==============================================================================================
Trigger_TimedRangedSpawnOnce_4F351:				; DATA XREF: seg339:off_703B6o
		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	si, [bp+6]
		push	si
		call	Camera_ExternalUpdate_3D9B4
		pop	cx
		or	al, al
		jnz	short loc_4F36A
		jmp	loc_4F4E4
; ���������������������������������������������������������������������������

loc_4F36A:				; CODE XREF: seg109:00B5j
		mov	al, [si+5Bh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4F376
		jmp	loc_4F4E8
; ���������������������������������������������������������������������������

loc_4F376:				; CODE XREF: seg109:00C1j
		mov	eax, [si+0Eh]
		mov	[bp-4],	eax
		mov	eax, dword_70458
		sub	[si+55h], eax
		mov	eax, [si+55h]
		sar	eax, 1Fh
		inc	ax
		push	0
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	[bp-2Ah], eax
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		mov	[bp-26h], eax
		mov	dword ptr [bp-10h], 100h
		mov	eax, [bp-10h]
		mov	[bp-22h], eax
		lea	ax, [bp-2Ah]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp-14h]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		les	bx, [bp-4]
		mov	eax, es:[bx+53h]
		mov	[bp-18h], eax
		shl	eax, 8
		cmp	eax, [bp-14h]
		jle	short loc_4F3F7
		mov	ax, 1
		jmp	short loc_4F3F9
; ���������������������������������������������������������������������������

loc_4F3F7:				; CODE XREF: seg109:0140j
		xor	ax, ax

loc_4F3F9:				; CODE XREF: seg109:0145j
		or	al, al
		jnz	short loc_4F400
		jmp	loc_4F4E8
; ���������������������������������������������������������������������������

loc_4F400:				; CODE XREF: seg109:014Bj
		mov	eax, [si+55h]
		sar	eax, 1Fh
		and	ax, 1
		or	ax, ax
		jnz	short loc_4F412
		jmp	loc_4F4E8
; ���������������������������������������������������������������������������

loc_4F412:				; CODE XREF: seg109:015Dj
		mov	ax, [bp-2]
		mov	dx, [bp-4]
		add	dx, 4Ah	; 'J'
		mov	[bp-1Ah], ax
		mov	[bp-1Ch], dx
		push	1
		push	1
		push	ax
		push	dx
		push	571Ch
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_4F43B
		jmp	loc_4F4E8
; ���������������������������������������������������������������������������

loc_4F43B:				; CODE XREF: seg109:0186j
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	dx, si
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[di+12h], eax
		mov	eax, [bx+4]
		mov	[di+16h], eax
		mov	eax, [bx+8]
		mov	[di+1Ah], eax
		push	si
		push	ss
		lea	ax, [bp-36h]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp-36h]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 4
		push	di
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4
		mov	[bp-1Eh], di
		push	word ptr [bp-1Eh]
		mov	ax, si
		add	ax, 59h	; 'Y'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	byte ptr [si+5Bh], 1
		or	byte ptr [di+4], 1
		or	byte ptr [di+4], 8
		or	byte ptr [di+4], 40h
		and	byte ptr [si+4], 0BFh
		cmp	word ptr [si+1Eh], 0
		jz	short loc_4F4E8
		push	0
		push	word ptr [si+1Eh]
		call	Container_Op_22E27
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_4F4E8
		push	0
		push	large dword ptr	[si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short loc_4F4E8
; ���������������������������������������������������������������������������

loc_4F4E4:				; CODE XREF: seg109:00B7j
		mov	al, 0
		jmp	short loc_4F4EA
; ���������������������������������������������������������������������������

loc_4F4E8:				; CODE XREF: seg109:00C3j seg109:014Dj ...
		mov	al, 1

loc_4F4EA:				; CODE XREF: seg109:0236j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; ⚠️ far, référencé par jmp depuis seg082 — CANDIDAT FORT pour le tick physique de l'avion :
; réinitialise les accumulateurs (appel sub_4F56D), combine deux vecteurs
; (sub_47140+sub_46F5E), les applique à l'objet (sub_46392), puis appelle sub_4791E
; (Aero_ComputeForcesMain) sur si+4 et applique le résultat via sub_4696C. Lecture rapide
; seulement — À LIRE EN DÉTAIL EN PRIORITÉ avant toute affirmation ferme (cf. règle
; sub_3314/sub_49C2E).
; ==============================================================================================
FlightPhysics_TickCandidate_4F4EE:				; CODE XREF: seg082:062EJ seg082:06CFJ ...
		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+6]
		push	si
		nop
		push	cs
		call	near ptr FlightPhysics_ResetAccumulators_4F56D
		pop	cx
		push	si
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		call	FlightControl_ComputeWeightedCoeff
		add	sp, 6
		push	word ptr [si+14h]
		push	ss
		lea	ax, [bp-18h]
		push	ax
		call	FlightControl_ComputeWindComponent
		add	sp, 6
		mov	eax, [bp-18h]
		add	[bp-0Ch], eax
		mov	eax, [bp-14h]
		add	[bp-8],	eax
		mov	eax, [bp-10h]
		add	[bp-4],	eax
		lea	ax, [bp-0Ch]
		push	ax
		push	word ptr [si]
		call	Physics_ComputeAcceleration
		add	sp, 4
		mov	ax, si
		add	ax, 4
		push	ax
		push	ss
		lea	ax, [bp-24h]
		push	ax
		call	Aero_ComputeForcesMain_4791E
		add	sp, 6
		lea	ax, [bp-24h]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	Physics_IntegrateSecondaryPosition
		add	sp, 4
		mov	al, 1
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, remet à zéro byte_6FF9A puis appelle 4 sous-fonctions sur si/si+4/si+0x14/si —
; hypothèse : reset des accumulateurs de force/couple avant calcul physique. Appelée
; uniquement par FlightPhysics_TickCandidate_4F4EE.
; ==============================================================================================
FlightPhysics_ResetAccumulators_4F56D	proc far		; CODE XREF: seg109:024Bp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_6FF9A, 0
		mov	ax, si
		add	ax, 4
		push	ax
		call	FlightControl_InvalidateRollPitchCache
		pop	cx
		push	word ptr [si+14h]
		call	FlightControl_InvalidateMomentCache
		pop	cx
		mov	ax, si
		add	ax, 4
		push	ax
		call	FlightControl_InvalidateMainCache
		pop	cx
		push	si
		call	FlightControl_InvalidateCacheB
		pop	cx
		pop	si
		pop	bp
		retf
FlightPhysics_ResetAccumulators_4F56D	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, alloue (sub_658, type 5Bh) et construit un objet composite à 2 sous-membres (init
; sub_6CACA/sub_6CB73) avec correctifs d'adresses vtable façon overlay fixup. Probable famille
; de constructeurs dupliqués (cf. pattern seg074/085-086) — identité NON vérifiée.
; ==============================================================================================
Ctor_CompositeObjectA_4F5A4:				; CODE XREF: seg082:0673J seg082:079EJ ...
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		push	5Bh ; '['
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_4F5BC
		jmp	loc_4F68D
; ���������������������������������������������������������������������������

loc_4F5BC:				; CODE XREF: seg109:0307j
		add	ax, 24h	; '$'
		mov	[si], ax
		mov	ax, si
		add	ax, 24h	; '$'
		mov	[si+4],	ax
		mov	ax, si
		add	ax, 47h	; 'G'
		mov	[si+14h], ax
		mov	ax, si
		add	ax, 24h	; '$'
		mov	[si+47h], ax
		mov	word ptr [si+22h], 0
		mov	word ptr [si+45h], 0
		mov	word ptr [si+24h], 223Ah
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+49h], 21CEh
		mov	bx, [si+47h]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+53h], eax
		mov	[si+4Fh], eax
		mov	[si+4Bh], eax
		mov	ax, si
		add	ax, 4Bh	; 'K'
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC7h
		sub	word ptr [bx-2], 1Eh
		mov	word ptr [si+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 1Eh
		mov	bx, [si+4]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 20AEh
		mov	word ptr [bx], 20DEh
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB0A
		pop	cx
		mov	bx, [si+4]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 212Eh
		mov	word ptr [bx], 2162h
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 21B2h
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB73
		pop	cx
		mov	word ptr [si+2], 1CFAh
		mov	word ptr [si+6], 1D16h
		mov	bx, [si]
		mov	word ptr [bx], 1D4Ah
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 1D9Ah
		mov	ax, si
		jmp	short loc_4F68F
; ���������������������������������������������������������������������������

loc_4F68D:				; CODE XREF: seg109:0309j
		mov	ax, si

loc_4F68F:				; CODE XREF: seg109:03DBj
		mov	si, ax
		or	si, si
		jz	short loc_4F699
		mov	ax, [si]
		jmp	short loc_4F69B
; ���������������������������������������������������������������������������

loc_4F699:				; CODE XREF: seg109:03E3j
		mov	ax, si

loc_4F69B:				; CODE XREF: seg109:03E7j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, variante de Ctor_CompositeObjectA avec paramètre supplémentaire [bp+8] et champs
; étendus (+0x4B/+0x53 mis à zéro). Probable duplicat partiel — NON vérifié.
; ==============================================================================================
Ctor_CompositeObjectB_4F69E:				; CODE XREF: seg082:065CJ
					; seg082:loc_3ABF7J ...
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	ax, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		push	5Bh ; '['
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_4F6BF
		jmp	loc_4F7C5
; ���������������������������������������������������������������������������

loc_4F6BF:				; CODE XREF: seg109:040Aj
		add	ax, 24h	; '$'
		mov	[si], ax
		mov	ax, si
		add	ax, 24h	; '$'
		mov	[si+4],	ax
		mov	ax, si
		add	ax, 47h	; 'G'
		mov	[si+14h], ax
		mov	ax, si
		add	ax, 24h	; '$'
		mov	[si+47h], ax
		mov	word ptr [si+22h], 0
		mov	word ptr [si+45h], 0
		mov	word ptr [si+24h], 223Ah
		push	word ptr [bp-2]
		mov	ax, si
		add	ax, 24h	; '$'
		push	ax
		call	VROOMM_StubThunk_6CACF
		add	sp, 4
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+49h], 21CEh
		mov	bx, [si+47h]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+53h], eax
		mov	[si+4Fh], eax
		mov	[si+4Bh], eax
		mov	ax, si
		add	ax, 4Bh	; 'K'
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC7h
		sub	word ptr [bx-2], 1Eh
		mov	word ptr [si+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 1Eh
		mov	bx, [si+4]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 20AEh
		mov	word ptr [bx], 20DEh
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB0A
		pop	cx
		mov	bx, [si+4]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 212Eh
		mov	word ptr [bx], 2162h
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 21B2h
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB73
		pop	cx
		mov	word ptr [si+2], 1CFAh
		mov	word ptr [si+6], 1D16h
		mov	bx, [si]
		mov	word ptr [bx], 1D4Ah
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 1D9Ah
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB0A
		pop	cx
		mov	bx, [si+14h]
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8],	eax
		mov	[bx+4],	eax
		mov	ax, [si+14h]
		add	ax, 4
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB73
		pop	cx
		mov	ax, si
		jmp	short loc_4F7C7
; ���������������������������������������������������������������������������

loc_4F7C5:				; CODE XREF: seg109:040Cj
		mov	ax, si

loc_4F7C7:				; CODE XREF: seg109:0513j
		mov	si, ax
		or	si, si
		jz	short loc_4F7D1
		mov	ax, [si]
		jmp	short loc_4F7D3
; ���������������������������������������������������������������������������

loc_4F7D1:				; CODE XREF: seg109:051Bj
		mov	ax, si

loc_4F7D3:				; CODE XREF: seg109:051Fj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, variante de Ctor_CompositeObjectB utilisant di au lieu de si, enchaîne sur
; Ctor_CompositeObjectC_RebindPointers_4F91A. Probable duplicat partiel — NON vérifié.
; ==============================================================================================
Ctor_CompositeObjectC_4F7D6:				; CODE XREF: seg082:0645J
					; seg082:loc_3ABE0J ...
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		push	5Bh ; '['
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_4F7F8
		jmp	loc_4F8FE
; ���������������������������������������������������������������������������

loc_4F7F8:				; CODE XREF: seg109:0543j
		add	ax, 24h	; '$'
		mov	[di], ax
		mov	ax, di
		add	ax, 24h	; '$'
		mov	[di+4],	ax
		mov	ax, di
		add	ax, 47h	; 'G'
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 24h	; '$'
		mov	[di+47h], ax
		mov	word ptr [di+22h], 0
		mov	word ptr [di+45h], 0
		mov	word ptr [di+24h], 223Ah
		push	word ptr [bp-2]
		mov	ax, di
		add	ax, 24h	; '$'
		push	ax
		call	VROOMM_StubThunk_6CACF
		add	sp, 4
		mov	bx, [di]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [di+49h], 21CEh
		mov	bx, [di+47h]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[di+53h], eax
		mov	[di+4Fh], eax
		mov	[di+4Bh], eax
		mov	ax, di
		add	ax, 4Bh	; 'K'
		mov	bx, [di]
		add	word ptr [bx-2], 0FFC7h
		sub	word ptr [bx-2], 1Eh
		mov	word ptr [di+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 1Eh
		mov	bx, [di+4]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [di+6], 20AEh
		mov	word ptr [bx], 20DEh
		mov	ax, di
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB0A
		pop	cx
		mov	bx, [di+4]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [di+6], 212Eh
		mov	word ptr [bx], 2162h
		mov	bx, [di+14h]
		mov	word ptr [bx+2], 21B2h
		mov	ax, di
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB73
		pop	cx
		mov	word ptr [di+2], 1CFAh
		mov	word ptr [di+6], 1D16h
		mov	bx, [di]
		mov	word ptr [bx], 1D4Ah
		mov	bx, [di+14h]
		mov	word ptr [bx+2], 1D9Ah
		mov	ax, di
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB0A
		pop	cx
		mov	bx, [di+14h]
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8],	eax
		mov	[bx+4],	eax
		mov	ax, [di+14h]
		add	ax, 4
		mov	ax, di
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB73
		pop	cx
		mov	ax, di
		jmp	short loc_4F900
; ���������������������������������������������������������������������������

loc_4F8FE:				; CODE XREF: seg109:0545j
		mov	ax, di

loc_4F900:				; CODE XREF: seg109:064Cj
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr Ctor_CompositeObjectC_RebindPointers_4F91A
		add	sp, 4
		or	di, di
		jz	short loc_4F914
		mov	ax, [di]
		jmp	short loc_4F916
; ���������������������������������������������������������������������������

loc_4F914:				; CODE XREF: seg109:065Ej
		mov	ax, di

loc_4F916:				; CODE XREF: seg109:0662j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, rattache/reprojette des pointeurs entre l'objet source (si) et le nouvel objet (di) via
; sub_6CAC5/sub_6CB05/sub_6CB1E/sub_6CB69 — cohérent avec un fixup de reloc d'overlay pour
; objet composite.
; ==============================================================================================
Ctor_CompositeObjectC_RebindPointers_4F91A	proc far		; CODE XREF: seg109:0656p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_4F92D
		mov	ax, [di]
		jmp	short loc_4F92F
; ���������������������������������������������������������������������������

loc_4F92D:				; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+Dj
		mov	ax, di

loc_4F92F:				; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+11j
		push	ax
		push	word ptr [si]
		call	VROOMM_StubThunk_6CAC5
		add	sp, 4
		or	di, di
		jz	short loc_4F945
		mov	ax, di
		add	ax, 4
		jmp	short loc_4F947
; ���������������������������������������������������������������������������

loc_4F945:				; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+22j
		mov	ax, di

loc_4F947:				; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+29j
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB05
		add	sp, 4
		or	di, di
		jz	short loc_4F95F
		mov	ax, [di+14h]
		jmp	short loc_4F961
; ���������������������������������������������������������������������������

loc_4F95F:				; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+3Ej
		mov	ax, di

loc_4F961:				; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+43j
		push	ax
		push	word ptr [si+14h]
		call	VROOMM_StubThunk_6CB1E
		add	sp, 4
		or	di, di
		jz	short loc_4F978
		mov	ax, di
		add	ax, 4
		jmp	short loc_4F97A
; ���������������������������������������������������������������������������

loc_4F978:				; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+55j
		mov	ax, di

loc_4F97A:				; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+5Cj
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB69
		add	sp, 4
		or	di, di
		jz	short loc_4F991
		mov	ax, [di]
		jmp	short loc_4F993
; ���������������������������������������������������������������������������

loc_4F991:				; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+71j
		mov	ax, di

loc_4F993:				; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+75j
		push	ax
		push	word ptr [si]
		call	VROOMM_StubThunk_6CAC5
		add	sp, 4
		pop	di
		pop	si

loc_4F9A0:
		pop	bp
		retf
Ctor_CompositeObjectC_RebindPointers_4F91A	endp

seg109		ends
