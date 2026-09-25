ovr231		segment	para public 'OVERLAY' use16
		assume cs:ovr231
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Methode +4 du NOEUD PERMANENT D'ATTAQUE AU SOL (entite+0xD9, 0x36
; octets, vtable seg339 tag 0x160, construit par PilotProfile_ResolveNamedPropertyNode_742FC
; case 0x13, noeud+0x21 = 0x13, noeud+0x22 = entite). Ex-'MVRS_ID14_ScoreWeaponReadiness'.
; MVRS_SharedContextSyncAndID2Score_EC22 puis : cible = entite+0x283 (cible sol acquise) sinon
; entite+0x137 (cible de mission) ; renvoie 5 si noeud+0x13 == 0 ET target_type de la cible
; (modele +0x11) == 2 ET WeaponStation_FindLoadedCompatible(chargement entite+0x104, 0xFC)
; (armes id 3 a 8 : AGM-65D, LAU-3, MK-20, MK-82, id 7, GBU-15 ; pas le canon) ; sinon 0. Sens
; de noeud+0x13 non trace.
; ==============================================================================================
GroundAttack_CanEngage_77000	proc far		; CODE XREF: VROOMM_StubThunk_6ABE9J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		xor	si, si
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		cmp	word ptr es:[bx+283h], 0
		jz	short loc_7702E
		mov	si, es:[bx+283h]
		jmp	short loc_77042
; ���������������������������������������������������������������������������

loc_7702E:				; CODE XREF: GroundAttack_CanEngage_77000+25j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		cmp	word ptr es:[bx+137h], 0
		jz	short loc_77042
		mov	si, es:[bx+137h]

loc_77042:				; CODE XREF: GroundAttack_CanEngage_77000+2Cj
					; GroundAttack_CanEngage_77000+3Bj
		or	si, si
		jz	short loc_7704E
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		jmp	short loc_77052
; ���������������������������������������������������������������������������

loc_7704E:				; CODE XREF: GroundAttack_CanEngage_77000+44j
		xor	dx, dx
		xor	ax, ax

loc_77052:				; CODE XREF: GroundAttack_CanEngage_77000+4Cj
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_77091
		cmp	[bp+var_4], 0
		jz	short loc_77091
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+11h], 2
		jnz	short loc_77091
		push	0FCh ; '�'
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_77095

loc_77091:				; CODE XREF: GroundAttack_CanEngage_77000+60j
					; GroundAttack_CanEngage_77000+67j ...
		mov	al, 0
		jmp	short loc_77097
; ���������������������������������������������������������������������������

loc_77095:				; CODE XREF: GroundAttack_CanEngage_77000+8Fj
		mov	al, 5

loc_77097:				; CODE XREF: GroundAttack_CanEngage_77000+93j
		pop	si
		leave
		retf
GroundAttack_CanEngage_77000	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Ex-'MVRS_ID14_ApplyWeaponTracking'. Methode +8 du noeud d'attaque au
; sol : DEMARRE l'attaque. Si noeud+0x0C == 0 : appelle sa methode +4.
; Behavior_PushRunning_756A4 (le noeud devient le comportement en cours de l'entite,
; entite+0x0D). Phase noeud+0x26 = 0 ; minuteur noeud+0x0D = 2,0 (0x200) ; noeud+0x27 = cible
; (entite+0x283 sinon +0x137) ; sans cible : Behavior_PopFinished_75612 ; sinon noeud+0x29 = 0
; (arme larguee), noeud+0x34 = 0 (arme choisie), noeud+0x30 = 100000 (entier, distance
; sentinelle), puis methode +0xC (GroundAttack_PhaseDispatch_77215). Appelee par
; Goal_ExecuteAction_A8AC (ordre 'detruire la cible' sur cible de mission au sol, apres la
; methode +4) et par AI_BehaviorStateMachine_WeightedOptionSelector_9D05 (cible sol acquise et
; arg_4).
; ==============================================================================================
GroundAttack_Start_7709A	proc far		; CODE XREF: VROOMM_StubThunk_6ABEEJ

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_770BF
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_770BF:				; CODE XREF: GroundAttack_Start_7709A+15j
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 0
		mov	[bp+var_4], 200h
		mov	eax, [bp+var_4]
		mov	es:[bx+0Dh], eax
		les	bx, es:[bx+22h]
		cmp	word ptr es:[bx+283h], 0
		jz	short loc_770FC
		mov	ax, es:[bx+283h]
		mov	[bp+var_6], ax
		push	ax
		jmp	short loc_77114
; ���������������������������������������������������������������������������

loc_770FC:				; CODE XREF: GroundAttack_Start_7709A+55j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		cmp	word ptr es:[bx+137h], 0
		jz	short loc_77126
		mov	ax, es:[bx+137h]
		mov	[bp+var_8], ax
		push	ax

loc_77114:				; CODE XREF: GroundAttack_Start_7709A+60j
		mov	ax, word ptr [bp+arg_0]
		add	ax, 27h	; '''
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_77126:				; CODE XREF: GroundAttack_Start_7709A+6Fj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+27h], 0
		jnz	short loc_7713B
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6AB45
		jmp	short loc_7716B
; ���������������������������������������������������������������������������

loc_7713B:				; CODE XREF: GroundAttack_Start_7709A+94j
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 29h	; ')'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+34h], 0
		mov	dword ptr es:[bx+30h], 186A0h
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]

loc_7716B:				; CODE XREF: GroundAttack_Start_7709A+9Fj
		add	sp, 4
		pop	si
		leave
		retf
GroundAttack_Start_7709A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Ex-'AI_IssueTurnAndThrottle'. PHASE 4 (apres le tir). Si noeud+0x34 :
; noeud+0x29 = chargement+0x11 (l'arme larguee), noeud+0x34 = 0. Pilote automatique physique
; coupe (JDYN+0x68 = 0xFF) ; AI_PitchToAngleCmd_7E18(+5, zone morte 5) ;
; AI_ThrottleCmd_HUD(vitesse de croisiere JDYN+0x84) ; quand noeud+0x29 redevient nul (l'arme
; n'existe plus) : fin (Behavior_PopFinished_75612).
; ==============================================================================================
GroundAttack_Phase4_PullUp_77171	proc far		; CODE XREF: VROOMM_StubThunk_6ABDAJ GroundAttack_PhaseDispatch_77215+4Cp

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+34h], 0
		jz	short loc_771AD
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		mov	ax, es:[bx+11h]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 29h	; ')'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+34h], 0

loc_771AD:				; CODE XREF: GroundAttack_Phase4_PullUp_77171+Ej
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		mov	[bp+var_6], 500h
		push	5
		lea	ax, [bp+var_6]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]
		push	eax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+29h], 0
		jnz	short locret_77213
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

locret_77213:				; CODE XREF: GroundAttack_Phase4_PullUp_77171+94j
		leave
		retf
GroundAttack_Phase4_PullUp_77171	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Ex-'AI_TargetTrackHelper'. Methode +0xC du noeud d'attaque au sol,
; appelee a chaque tick par Goal_ExecuteAction_A8AC tant que le noeud est le comportement en
; cours (entite+0x0D). Sans cible (noeud+0x27) : fin. Machine a etats sur noeud+0x26 (table
; off_77274) : 0 et 1 -> GroundAttack_Phase01_Approach_77282 ; 2 ->
; GroundAttack_Phase2_EngageAutopilot_775B1 ; 3 -> GroundAttack_Phase3_WeaponRelease_776FB ; 4
; -> GroundAttack_Phase4_PullUp_77171 ; 5 et 6 -> Behavior_PopFinished_75612 (fin).
; ==============================================================================================
GroundAttack_PhaseDispatch_77215	proc far		; CODE XREF: VROOMM_StubThunk_6ABE4J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+27h], 0
		jnz	short loc_77224
		jmp	short loc_77266	; case 0x5
; ���������������������������������������������������������������������������

loc_77224:				; CODE XREF: GroundAttack_PhaseDispatch_77215+Bj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+26h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 6		; switch 7 cases
		ja	short loc_77272	; default
		shl	bx, 1
		jmp	cs:off_77274[bx] ; switch jump

loc_7723B:				; DATA XREF: ovr231:off_77274o
		push	large [bp+arg_0] ; case	0x0
		nop
		push	cs
		call	near ptr GroundAttack_Phase01_Approach_77282
		jmp	short loc_7726F
; ���������������������������������������������������������������������������

loc_77246:				; CODE XREF: GroundAttack_PhaseDispatch_77215+21j
					; DATA XREF: ovr231:off_77274o
		push	large [bp+arg_0] ; case	0x2
		nop
		push	cs
		call	near ptr GroundAttack_Phase2_EngageAutopilot_775B1
		jmp	short loc_7726F
; ���������������������������������������������������������������������������

loc_77251:				; CODE XREF: GroundAttack_PhaseDispatch_77215+21j
					; DATA XREF: ovr231:off_77274o
		push	large [bp+arg_0] ; case	0x3
		nop
		push	cs
		call	near ptr GroundAttack_Phase3_WeaponRelease_776FB
		jmp	short loc_7726F
; ���������������������������������������������������������������������������

loc_7725C:				; CODE XREF: GroundAttack_PhaseDispatch_77215+21j
					; DATA XREF: ovr231:off_77274o
		push	large [bp+arg_0] ; case	0x4
		push	cs
		call	near ptr GroundAttack_Phase4_PullUp_77171
		jmp	short loc_7726F
; ���������������������������������������������������������������������������

loc_77266:				; CODE XREF: GroundAttack_PhaseDispatch_77215+Dj
					; GroundAttack_PhaseDispatch_77215+21j
					; DATA XREF: ...
		push	large [bp+arg_0] ; case	0x5
		call	VROOMM_StubThunk_6AB45

loc_7726F:				; CODE XREF: GroundAttack_PhaseDispatch_77215+2Fj
					; GroundAttack_PhaseDispatch_77215+3Aj ...
		add	sp, 4

loc_77272:				; CODE XREF: GroundAttack_PhaseDispatch_77215+1Dj
		pop	bp		; default
		retf
GroundAttack_PhaseDispatch_77215	endp

; ���������������������������������������������������������������������������
off_77274	dw offset loc_7723B	; DATA XREF: GroundAttack_PhaseDispatch_77215+21r
		dw offset loc_7723B	; jump table for switch	statement
		dw offset loc_77246
		dw offset loc_77251
		dw offset loc_7725C
		dw offset loc_77266
		dw offset loc_77266

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 352L, LUE INTEGRALEMENT (2026-09-24). Ex-'AI_ComputeGuidanceSolution'. PHASES 0
; (eloignement) ET 1 (approche). Minuteur noeud+0x0D -= dt ; < 0 -> fin
; (Behavior_PopFinished_75612 ; l'attaque redemarre au tick suivant par
; GroundAttack_Start_7709A). Pilote automatique physique coupe (JDYN+0x68 = 0xFF) ; cran de
; gaz = 5. P = position cible +0x12 avec altitude + 1000 ; D = ma position - P ; hd = distance
; horizontale (noeud+0x30 = partie entiere) ; a = |Angle_DeltaNormalized_A(nez, D)| (a ~ 180 =
; nez vers la cible). TRANSITIONS : a < 170 et hd < 5000 -> phase 0 ; a > 170 et hd < 5000 ->
; AI_RollToAngleCmd_8104(0, zone morte 5) (ailes a plat) et si |roulis|
; (AI_Sensor_RollAngle_58F4) < 5 : cran de gaz 3, phase 2 ; sinon hd > 8000 ou a > 170 ->
; phase 1. PILOTAGE : direction V = D en phase 0 (s'eloigner), -D sinon (vers P) ;
; AI_GuidanceCmd_FromOwnPos(entite, V, 10) (-> AI_GuidanceSolution_Major) ;
; AI_ThrottleCmd_HUD(vitesse de croisiere JDYN+0x84). Puis : si a > 169 et hd > 9000 :
; AI_PitchToAngleCmd_7E18(0, 5) (palier) ; sinon si phase 1, a > 169 et P.alt - ma alt < -2000
; (plus de 2000 au-dessus du point vise) : AI_PitchToAngleCmd_7E18(-40, 5) (pique a -40 deg).
; ==============================================================================================
GroundAttack_Phase01_Approach_77282	proc far		; CODE XREF: VROOMM_StubThunk_6ABDFJ GroundAttack_PhaseDispatch_77215+2Cp

var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4Eh
		push	si
		mov	[bp+var_E], 0
		xor	ax, ax
		mov	[bp+var_A], ax
		mov	[bp+var_C], ax
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		mov	eax, es:[bx+0Dh]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_772CB
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_772CB:				; CODE XREF: GroundAttack_Phase01_Approach_77282+3Bj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 5
		les	bx, [bp+arg_0]
		mov	si, es:[bx+27h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_4E], eax
		mov	eax, [si+4]
		mov	[bp+var_4A], eax
		mov	eax, [si+8]
		mov	[bp+var_46], eax
		add	[bp+var_46], 3E800h
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	eax, [si]
		sub	eax, [bp+var_4E]
		mov	[bp+var_42], eax
		mov	eax, [si+4]
		sub	eax, [bp+var_4A]
		mov	[bp+var_3E], eax
		mov	eax, [si+8]
		sub	eax, [bp+var_46]
		mov	[bp+var_3A], eax
		mov	[bp+var_1A], eax
		mov	[bp+var_3A], 0
		push	large [bp+var_3A]
		push	large [bp+var_3E]
		push	large [bp+var_42]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_3A], eax
		lea	ax, [bp+var_42]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_26]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	eax, [bp+var_26]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		or	eax, eax
		jge	short loc_773AF
		neg	eax

loc_773AF:				; CODE XREF: GroundAttack_Phase01_Approach_77282+128j
		mov	[bp+var_16], eax
		mov	eax, [bp+var_4]
		sar	eax, 8
		les	bx, [bp+arg_0]
		mov	es:[bx+30h], eax
		cmp	[bp+var_16], 0AA00h
		jge	short loc_773D2
		mov	ax, 1
		jmp	short loc_773D4
; ���������������������������������������������������������������������������

loc_773D2:				; CODE XREF: GroundAttack_Phase01_Approach_77282+149j
		xor	ax, ax

loc_773D4:				; CODE XREF: GroundAttack_Phase01_Approach_77282+14Ej
		or	al, al
		jz	short loc_773F8
		cmp	[bp+var_4], 138800h
		jge	short loc_773E7
		mov	ax, 1
		jmp	short loc_773E9
; ���������������������������������������������������������������������������

loc_773E7:				; CODE XREF: GroundAttack_Phase01_Approach_77282+15Ej
		xor	ax, ax

loc_773E9:				; CODE XREF: GroundAttack_Phase01_Approach_77282+163j
		or	al, al
		jz	short loc_773F8
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 0
		jmp	loc_774C9
; ���������������������������������������������������������������������������

loc_773F8:				; CODE XREF: GroundAttack_Phase01_Approach_77282+154j
					; GroundAttack_Phase01_Approach_77282+169j
		cmp	[bp+var_16], 0AA00h
		jle	short loc_77407
		mov	ax, 1
		jmp	short loc_77409
; ���������������������������������������������������������������������������

loc_77407:				; CODE XREF: GroundAttack_Phase01_Approach_77282+17Ej
		xor	ax, ax

loc_77409:				; CODE XREF: GroundAttack_Phase01_Approach_77282+183j
		or	al, al
		jnz	short loc_77410
		jmp	loc_77497
; ���������������������������������������������������������������������������

loc_77410:				; CODE XREF: GroundAttack_Phase01_Approach_77282+189j
		cmp	[bp+var_4], 138800h
		jge	short loc_7741F
		mov	ax, 1
		jmp	short loc_77421
; ���������������������������������������������������������������������������

loc_7741F:				; CODE XREF: GroundAttack_Phase01_Approach_77282+196j
		xor	ax, ax

loc_77421:				; CODE XREF: GroundAttack_Phase01_Approach_77282+19Bj
		or	al, al
		jz	short loc_77497
		push	5
		mov	[bp+var_2A], 0
		lea	ax, [bp+var_2A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		call	AI_Sensor_RollAngle_58F4
		add	sp, 8
		mov	eax, [bp+var_2E]
		or	eax, eax
		jge	short loc_77464
		neg	eax

loc_77464:				; CODE XREF: GroundAttack_Phase01_Approach_77282+1DDj
		mov	[bp+var_2E], eax
		cmp	[bp+var_2E], 500h
		jge	short loc_77477
		mov	ax, 1
		jmp	short loc_77479
; ���������������������������������������������������������������������������

loc_77477:				; CODE XREF: GroundAttack_Phase01_Approach_77282+1EEj
		xor	ax, ax

loc_77479:				; CODE XREF: GroundAttack_Phase01_Approach_77282+1F3j
		or	al, al
		jz	short loc_774C9
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 3
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 2
		jmp	short loc_774C9
; ���������������������������������������������������������������������������

loc_77497:				; CODE XREF: GroundAttack_Phase01_Approach_77282+18Bj
					; GroundAttack_Phase01_Approach_77282+1A1j
		cmp	[bp+var_4], 1F4000h
		jle	short loc_774A6
		mov	ax, 1
		jmp	short loc_774A8
; ���������������������������������������������������������������������������

loc_774A6:				; CODE XREF: GroundAttack_Phase01_Approach_77282+21Dj
		xor	ax, ax

loc_774A8:				; CODE XREF: GroundAttack_Phase01_Approach_77282+222j
		or	al, al
		jnz	short loc_774C1
		cmp	[bp+var_16], 0AA00h
		jle	short loc_774BB
		mov	ax, 1
		jmp	short loc_774BD
; ���������������������������������������������������������������������������

loc_774BB:				; CODE XREF: GroundAttack_Phase01_Approach_77282+232j
		xor	ax, ax

loc_774BD:				; CODE XREF: GroundAttack_Phase01_Approach_77282+237j
		or	al, al
		jz	short loc_774C9

loc_774C1:				; CODE XREF: GroundAttack_Phase01_Approach_77282+228j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 1

loc_774C9:				; CODE XREF: GroundAttack_Phase01_Approach_77282+173j
					; GroundAttack_Phase01_Approach_77282+1F9j ...
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+26h], 0
		jz	short loc_774F4
		mov	eax, [bp+var_42]
		neg	eax
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3E]
		neg	eax
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3A]
		neg	eax
		mov	[bp+var_3A], eax

loc_774F4:				; CODE XREF: GroundAttack_Phase01_Approach_77282+24Fj
		push	large 0Ah
		lea	ax, [bp+var_42]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+22h]
		call	AI_GuidanceCmd_FromOwnPos
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]
		push	eax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		cmp	[bp+var_16], 0A900h
		jle	short loc_7753D
		mov	ax, 1
		jmp	short loc_7753F
; ���������������������������������������������������������������������������

loc_7753D:				; CODE XREF: GroundAttack_Phase01_Approach_77282+2B4j
		xor	ax, ax

loc_7753F:				; CODE XREF: GroundAttack_Phase01_Approach_77282+2B9j
		or	al, al
		jz	short loc_77567
		cmp	[bp+var_4], 232800h
		jle	short loc_77552
		mov	ax, 1
		jmp	short loc_77554
; ���������������������������������������������������������������������������

loc_77552:				; CODE XREF: GroundAttack_Phase01_Approach_77282+2C9j
		xor	ax, ax

loc_77554:				; CODE XREF: GroundAttack_Phase01_Approach_77282+2CEj
		or	al, al
		jz	short loc_77567
		push	5
		mov	[bp+var_32], 0
		lea	ax, [bp+var_32]
		jmp	short loc_7759D
; ���������������������������������������������������������������������������

loc_77567:				; CODE XREF: GroundAttack_Phase01_Approach_77282+2BFj
					; GroundAttack_Phase01_Approach_77282+2D4j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+26h], 1
		jnz	short loc_775AE
		cmp	[bp+var_16], 0A900h
		jle	short loc_77580
		mov	ax, 1
		jmp	short loc_77582
; ���������������������������������������������������������������������������

loc_77580:				; CODE XREF: GroundAttack_Phase01_Approach_77282+2F7j
		xor	ax, ax

loc_77582:				; CODE XREF: GroundAttack_Phase01_Approach_77282+2FCj
		or	al, al
		jz	short loc_775AE
		cmp	[bp+var_3A], 0FFF83000h
		jge	short loc_775AE
		push	5
		mov	[bp+var_36], 0FFFFD800h
		lea	ax, [bp+var_36]

loc_7759D:				; CODE XREF: GroundAttack_Phase01_Approach_77282+2E3j
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8

loc_775AE:				; CODE XREF: GroundAttack_Phase01_Approach_77282+2EDj
					; GroundAttack_Phase01_Approach_77282+302j ...
		pop	si
		leave
		retf
GroundAttack_Phase01_Approach_77282	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Ex-'AI_TransformTargetVector'. PHASE 2 (un tick) : P = cible + 1000
; d'altitude ; dir = normalise(P - ma position) * 100 ; bloc de commandes (entite+7) :
; +0x02/06/0A = P, +0x0E/12/16 = dir, +0x1A = 0 ; JDYN+0x68 = 0 (ACTIVE le pilote automatique
; physique Guidance_HomingVelocityUpdate vers ce point) ; phase 3.
; ==============================================================================================
GroundAttack_Phase2_EngageAutopilot_775B1	proc far		; CODE XREF: VROOMM_StubThunk_6ABD0J GroundAttack_PhaseDispatch_77215+37p

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		les	bx, [bp+arg_0]
		mov	si, es:[bx+27h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_1C], eax
		mov	eax, [si+4]
		mov	[bp+var_18], eax
		mov	eax, [si+8]
		mov	[bp+var_14], eax
		add	[bp+var_14], 3E800h
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	eax, [bp+var_1C]
		sub	eax, [si]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_18]
		sub	eax, [si+4]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_14]
		sub	eax, [si+8]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_10]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	[bp+var_4], 6400h
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_1C]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_18]
		mov	es:[bx+6], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_14]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_10]
		mov	es:[bx+0Eh], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_C]
		mov	es:[bx+12h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_8]
		mov	es:[bx+16h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Ah], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 3
		pop	si
		leave
		retf
GroundAttack_Phase2_EngageAutopilot_775B1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 706L, LUE INTEGRALEMENT (2026-09-24). Ex-'AI_WeaponEngagementCycle'. PHASE 3. (1) Cible
; mobile (bit 2 de cible+4) : recalcule P = cible + 1000 et dir*100 dans le bloc de commandes
; a chaque tick. (2) CHOIX DE L'ARME une fois (noeud+0x34 == 0), WeaponStation_ValidateReady
; dans l'ordre : 0x04 AGM-65D et 0x80 GBU-15 (chargement+0x0D = cible) ; 0x10 MK-20 et 0x20
; MK-82 (octet +0x4D du modele d'arme courant := 4) ; 0x40 id 7 (+0x4D := 5) ; 0x08 LAU-3
; (minuteur noeud+0x2B = 3,0 s, chargement+0x0D = cible). Aucune -> phase 6 (fin). (3) Chaque
; tick : WeaponStation_FindLoadedCompatible(chargement, noeud+0x34) sinon phase 6. AGM-65D /
; GBU-15 : tir si modele->vtable+0x14(modele, cible, moi) (BOMB :
; BombModel_TestGuidedLockCone_41735 ; MISS : loc_42F71 non lu). LAU-3 : tir quand le minuteur
; de 3 s echoit. BOMBES : hauteur = ma alt - alt cible ; I = modele->vtable+0x18(I, modele, 0,
; point d'emport+0x0D, &hauteur, 3 pour MK-20/MK-82, 5 pour id 7)
; (BombModel_PredictImpact_41311), ou vecteur par defaut dword_707E0 sans point d'emport ;
; rate = distance HORIZONTALE (I, cible) (noeud+0x30 = partie entiere) ; tolerance = 20 + |ma
; vitesse| * dt + (150 si (rand & 15) > AG (entite+0xB5)) ; rate <= tolerance -> tir. TIR =
; bit 1 de l'octet de commande (bloc+0x1B |= 2) puis phase 4. (4) Sans tir, en phase 3, si
; bloc+0x1A != 0 (pose par Guidance_HomingVelocityUpdate) -> phase 0 (nouvelle passe).
; ==============================================================================================
GroundAttack_Phase3_WeaponRelease_776FB	proc far		; CODE XREF: VROOMM_StubThunk_6ABD5J GroundAttack_PhaseDispatch_77215+42p

var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		push	di
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		mov	di, es:[bx+27h]
		test	byte ptr [di+4], 4
		jnz	short loc_77717
		jmp	loc_7782D
; ���������������������������������������������������������������������������

loc_77717:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+17j
		mov	si, es:[bx+27h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_60], eax
		mov	eax, [si+4]
		mov	[bp+var_5C], eax
		mov	eax, [si+8]
		mov	[bp+var_58], eax
		add	[bp+var_58], 3E800h
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	eax, [bp+var_60]
		sub	eax, [si]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_5C]
		sub	eax, [si+4]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_58]
		sub	eax, [si+8]
		mov	[bp+var_4C], eax
		lea	ax, [bp+var_54]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	[bp+var_14], 6400h
		mov	eax, [bp+var_54]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_50]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_4C]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_60]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_5C]
		mov	es:[bx+6], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_58]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_54]
		mov	es:[bx+0Eh], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_50]
		mov	es:[bx+12h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_4C]
		mov	es:[bx+16h], eax

loc_7782D:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+19j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+34h], 0
		jz	short loc_7783A
		jmp	loc_779E5
; ���������������������������������������������������������������������������

loc_7783A:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+13Aj
		push	4
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_ValidateReady
		add	sp, 6
		or	al, al
		jz	short loc_77881
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+34h], 4
		mov	[bp+var_4], di
		push	[bp+var_4]

loc_77861:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+1B1j
					; GroundAttack_Phase3_WeaponRelease_776FB+2E4j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		mov	ax, es:[bx+104h]
		add	ax, 0Dh
		push	word ptr es:[bx+106h]
		push	ax
		call	SetReference
		add	sp, 6
		jmp	loc_779E5
; ���������������������������������������������������������������������������

loc_77881:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+155j
		push	80h ; '�'
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_ValidateReady
		add	sp, 6
		or	al, al
		jz	short loc_778AE
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+34h], 80h ; '�'
		mov	[bp+var_6], di
		push	[bp+var_6]
		jmp	short loc_77861
; ���������������������������������������������������������������������������

loc_778AE:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+1A0j
		push	10h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_ValidateReady
		add	sp, 6
		or	al, al
		jz	short loc_778ED
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+34h], 10h
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		mov	ax, es:[bx+18h]
		or	ax, es:[bx+1Ah]
		jnz	short loc_778E8
		jmp	loc_77992
; ���������������������������������������������������������������������������

loc_778E8:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+1E8j
		jmp	short loc_77924
; ���������������������������������������������������������������������������
		jmp	loc_77992
; ���������������������������������������������������������������������������

loc_778ED:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+1CCj
		push	20h ; ' '
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_ValidateReady
		add	sp, 6
		or	al, al
		jz	short loc_77941
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+34h], 20h ; ' '
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		mov	ax, es:[bx+18h]
		or	ax, es:[bx+1Ah]

loc_77922:
		jz	short loc_77992

loc_77924:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB:loc_778E8j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]

loc_7792B:
		les	bx, es:[bx+104h]

loc_77930:
		les	bx, es:[bx+18h]

loc_77934:
		les	bx, es:[bx]

loc_77937:
		mov	byte ptr es:[bx+4Dh], 4
		jmp	loc_779E5
; ���������������������������������������������������������������������������
		jmp	short loc_77992
; ���������������������������������������������������������������������������

loc_77941:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+20Bj
		push	40h ; '@'
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_ValidateReady
		add	sp, 6
		or	al, al
		jz	short loc_77994
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+34h], 40h ; '@'
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		mov	ax, es:[bx+18h]
		or	ax, es:[bx+1Ah]
		jz	short loc_77992
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	byte ptr es:[bx+4Dh], 5
		jmp	short loc_779E5
; ���������������������������������������������������������������������������

loc_77992:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+1EAj
					; GroundAttack_Phase3_WeaponRelease_776FB+1EFj ...
		jmp	short loc_779E5
; ���������������������������������������������������������������������������

loc_77994:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+25Fj
		push	8
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_ValidateReady
		add	sp, 6
		or	al, al
		jnz	short loc_779B2
		jmp	loc_77DBA
; ���������������������������������������������������������������������������

loc_779B2:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+2B2j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+34h], 8
		mov	[bp+var_A], 300h
		lea	ax, [bp+var_A]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Bh	; '+'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Timer_SetAbsoluteFarPtr_4FA31
		add	sp, 6
		mov	[bp+var_C], di
		push	[bp+var_C]
		jmp	loc_77861
; ���������������������������������������������������������������������������
		jmp	loc_77DBA
; ���������������������������������������������������������������������������

loc_779E5:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+13Cj
					; GroundAttack_Phase3_WeaponRelease_776FB+183j ...
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+34h]
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		or	al, al
		jnz	short loc_77A05
		jmp	loc_77DBA
; ���������������������������������������������������������������������������

loc_77A05:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+305j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+34h], 4
		jz	short loc_77A1A
		cmp	word ptr es:[bx+34h], 80h ; '�'
		jz	short loc_77A1A
		jmp	loc_77AA1
; ���������������������������������������������������������������������������

loc_77A1A:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+312j
					; GroundAttack_Phase3_WeaponRelease_776FB+31Aj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+27h]
		mov	[bp+var_E], ax

loc_77A24:
		mov	ax, es:[bx+11h]
		mov	[bp+var_10], ax
		les	bx, es:[bx+22h]

loc_77A2F:
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_77A79
		push	[bp+var_10]
		push	[bp+var_E]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		push	large dword ptr	es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+14h]
		add	sp, 8
		jmp	short loc_77A7B
; ���������������������������������������������������������������������������

loc_77A79:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+344j
		mov	al, 0

loc_77A7B:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+37Cj
		or	al, al
		jnz	short loc_77A82
		jmp	loc_77D8E
; ���������������������������������������������������������������������������

loc_77A82:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+382j
					; GroundAttack_Phase3_WeaponRelease_776FB:loc_77AC6j
		les	bx, [bp+arg_0]

loc_77A85:
		les	bx, es:[bx+22h]

loc_77A89:
		les	bx, es:[bx+7]

loc_77A8D:
		or	byte ptr es:[bx+1Bh], 2

loc_77A92:
		les	bx, [bp+arg_0]

loc_77A95:
		mov	byte ptr es:[bx+26h], 4
		mov	[bp+var_1], 1
		jmp	loc_77D8E
; ���������������������������������������������������������������������������

loc_77AA1:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+31Cj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+34h], 8
		jnz	short loc_77AC8
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Bh	; '+'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Timer_TickFarPtr_4FA80
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_77AC6
		jmp	loc_77D8E
; ���������������������������������������������������������������������������

loc_77AC6:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+3C6j
		jmp	short loc_77A82
; ���������������������������������������������������������������������������

loc_77AC8:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+3AEj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	eax, [bx+1Ah]
		mov	[bp+var_14], eax
		mov	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+27h]
		add	si, 1Ah
		mov	eax, [si]
		sub	[bp+var_14], eax
		cmp	word ptr es:[bx+34h], 40h ; '@'
		jz	short loc_77AF2
		jmp	loc_77B94
; ���������������������������������������������������������������������������

loc_77AF2:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+3F2j
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_77B60
		push	5
		lea	ax, [bp+var_14]
		push	ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		push	word ptr es:[bx+0Dh]

loc_77B22:
		push	0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]

loc_77B2B:
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		push	large dword ptr	es:[bx]
		push	ss
		lea	ax, [bp+var_60]
		push	ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 10h
		mov	dx, ss
		lea	ax, [bp+var_60]
		jmp	short loc_77B7D
; ���������������������������������������������������������������������������

loc_77B60:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+40Bj
		mov	eax, dword_707E0
		mov	[bp+var_60], eax
		mov	eax, dword_707E4
		mov	[bp+var_5C], eax
		mov	eax, dword_707E8
		mov	[bp+var_58], eax
		mov	dx, ss
		lea	ax, [bp+var_60]

loc_77B7D:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+463j
		mov	eax, [bp+var_60]
		mov	[bp+var_54], eax

loc_77B85:
		mov	eax, [bp+var_5C]
		mov	[bp+var_50], eax

loc_77B8D:
		mov	eax, [bp+var_58]
		jmp	loc_77C36
; ���������������������������������������������������������������������������

loc_77B94:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+3F4j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_77C05
		push	3
		lea	ax, [bp+var_14]
		push	ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		push	word ptr es:[bx+0Dh]
		push	0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		push	large dword ptr	es:[bx]
		push	ss
		lea	ax, [bp+var_6C]
		push	ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+104h]
		les	bx, es:[bx+18h]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 10h
		mov	dx, ss
		lea	ax, [bp+var_6C]
		jmp	short loc_77C22
; ���������������������������������������������������������������������������

loc_77C05:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+4B0j
		mov	eax, dword_707E0
		mov	[bp+var_6C], eax
		mov	eax, dword_707E4
		mov	[bp+var_68], eax
		mov	eax, dword_707E8
		mov	[bp+var_64], eax
		mov	dx, ss
		lea	ax, [bp+var_6C]

loc_77C22:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+508j
		mov	eax, [bp+var_6C]
		mov	[bp+var_54], eax

loc_77C2A:
		mov	eax, [bp+var_68]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_64]

loc_77C36:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+496j
		mov	[bp+var_4C], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+27h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_24], eax
		mov	eax, [si+4]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_54]
		sub	eax, [bp+var_1C]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_50]
		sub	eax, [bp+var_18]
		mov	[bp+var_28], eax
		push	large 0
		push	eax

loc_77C80:
		push	large [bp+var_2C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax

loc_77C8B:
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	[bp+var_30], eax
		call	CRT_Rand
		and	ax, 0Fh
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		push	ax
		mov	al, es:[bx+0B5h]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_77CC1
		mov	[bp+var_3C], 9600h
		jmp	short loc_77CC9
; ���������������������������������������������������������������������������

loc_77CC1:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+5BAj
		mov	[bp+var_3C], 0

loc_77CC9:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+5C4j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		push	ss
		lea	ax, [bp+var_78]
		push	ax
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large [bp+var_70]
		push	large [bp+var_74]
		push	large [bp+var_78]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		add	[bp+var_3C], 1400h

loc_77D22:
		mov	eax, [bp+var_40]

loc_77D26:
		add	[bp+var_3C], eax

loc_77D2A:
		mov	eax, [bp+var_30]
		sar	eax, 8

loc_77D32:
		les	bx, [bp+arg_0]

loc_77D35:
		mov	es:[bx+30h], eax
		mov	eax, [bp+var_30]
		cmp	eax, [bp+var_3C]
		jg	short loc_77D49
		mov	ax, 1
		jmp	short loc_77D4B
; ���������������������������������������������������������������������������

loc_77D49:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+647j
		xor	ax, ax

loc_77D4B:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+64Cj
		or	al, al
		jz	short loc_77D6B
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 4
		mov	[bp+var_1], 1

loc_77D6B:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+652j
		cmp	[bp+var_1], 0
		jz	short loc_77D8E
		mov	eax, [bp+var_30]
		cmp	eax, [bp+var_3C]
		jle	short loc_77D80
		mov	ax, 1
		jmp	short loc_77D82
; ���������������������������������������������������������������������������

loc_77D80:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+67Ej
		xor	ax, ax

loc_77D82:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+683j
		or	al, al
		jz	short loc_77D8E
		les	bx, [bp+arg_0]

loc_77D89:
		mov	byte ptr es:[bx+26h], 4

loc_77D8E:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+384j
					; GroundAttack_Phase3_WeaponRelease_776FB+3A3j ...
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_77DC2
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+26h], 3
		jnz	short loc_77DC2
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Ah], 0
		jz	short loc_77DC2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 0
		jmp	short loc_77DC2
; ���������������������������������������������������������������������������

loc_77DBA:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+2B4j
					; GroundAttack_Phase3_WeaponRelease_776FB+2E7j ...
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+26h], 6

loc_77DC2:				; CODE XREF: GroundAttack_Phase3_WeaponRelease_776FB+69Aj
					; GroundAttack_Phase3_WeaponRelease_776FB+6A4j ...
		pop	di
		pop	si
		leave
		retf
GroundAttack_Phase3_WeaponRelease_776FB	endp

ovr231		ends
