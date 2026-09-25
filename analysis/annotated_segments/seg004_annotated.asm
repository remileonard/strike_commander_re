seg004		segment	byte public 'CODE' use16
		assume cs:seg004
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,435L — dispatcher IA de haut niveau (appelé depuis sub_5E53) : vérifie difficulté pilote
; (+0xB0≥0xC → tick physique spécial sub_3314), exclut états spéciaux (+0x11D=0xA1/0xA2,
; probable décollage/atterrissage), vérifie pilote vivant, teste seuil de difficulté globale
; (word_70466), gère alerte menace (sub_5392), met à jour la chaîne de cibles (+0x287/+0x289)
; et notifie l'affichage radar (vtable[8]). Candidat très fort pour le point d'entrée
; principal du 'think' IA par avion (proche de SelectAIBehaviorPriorityAndTrackStats déjà
; documenté) — 435 lignes, à disséquer en détail dans une session dédiée. | Relue en entier le
; 2026-09-25 (y compris le milieu) : sur alerte de menace (AI_IncomingThreatWarning, sauf
; decollage/atterrissage, au sol, difficulte <= 3, bit 6 de +0x28D, ou +0x27F > 1), abandon du
; comportement en cours puis application directe du noeud permanent ID=4 (entite+0xBD) ; puis
; attentes decollage/atterrissage et recherche de cible selon le niveau +0x27F (<= 5, <= 4, <=
; 3). Voir AI_TICK_CALL_GRAPH.md, 'GOAL et tournoi MVRS'.
; ==============================================================================================
AI_TopLevelThink	proc far		; CODE XREF: AI_TriggerBehaviorUpdate+35P

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		mov	[bp+var_9], 0
		cmp	byte_6E4D7, 0
		jz	short loc_8177
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0B0h], 0Ch
		jl	short loc_8177
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Targeting_AcquireBestThreat
		add	sp, 6

loc_8177:				; CODE XREF: AI_TopLevelThink+10j AI_TopLevelThink+1Bj
		mov	byte_72052, 0
		push	large [bp+arg_0]
		call	AI_MessageDispatcher
		add	sp, 4
		push	large [bp+arg_0]
		call	Radio_CombatChatterDispatch
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 0FFh
		jnz	short loc_81A7

loc_81A2:
		mov	byte_6E4C1, 1

loc_81A7:				; CODE XREF: AI_TopLevelThink+54j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+11Dh], 0A1h ; '�'
		jnz	short loc_81B6
		jmp	loc_83F0
; ���������������������������������������������������������������������������

loc_81B6:				; CODE XREF: AI_TopLevelThink+65j
		cmp	word ptr es:[bx+11Dh], 0A2h ; '�'
		jnz	short loc_81C2
		jmp	loc_83F0
; ���������������������������������������������������������������������������

loc_81C2:				; CODE XREF: AI_TopLevelThink+71j
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_81D4

loc_81D1:
		jmp	loc_83F0
; ���������������������������������������������������������������������������

loc_81D4:				; CODE XREF: AI_TopLevelThink+83j
		cmp	word_70466, 3
		ja	short loc_81DE

loc_81DB:
		jmp	loc_83F0
; ���������������������������������������������������������������������������

loc_81DE:				; CODE XREF: AI_TopLevelThink+8Dj
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+28Dh]
		shr	ax, 6
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_81F5
		jmp	loc_82DA
; ���������������������������������������������������������������������������

loc_81F5:				; CODE XREF: AI_TopLevelThink+A4j
		cmp	byte ptr es:[bx+27Fh], 1
		jbe	short loc_8200
		jmp	loc_82DA
; ���������������������������������������������������������������������������

loc_8200:				; CODE XREF: AI_TopLevelThink+AFj
		push	word ptr [bp+arg_0+2]
		push	bx
		call	AI_IncomingThreatWarning
		add	sp, 4
		or	al, al
		jnz	short loc_8213
		jmp	loc_82DA
; ���������������������������������������������������������������������������

loc_8213:				; CODE XREF: AI_TopLevelThink+C2j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+289h], 0
		jz	short loc_8241
		cmp	word ptr es:[bx+287h], 0
		jnz	short loc_8241
		mov	ax, es:[bx+289h]
		mov	[bp+var_C], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_8241:				; CODE XREF: AI_TopLevelThink+D0j AI_TopLevelThink+D8j
		mov	[bp+var_16], 0
		xor	ax, ax
		mov	[bp+var_12], ax
		mov	[bp+var_14], ax
		mov	[bp+var_1A], 200h
		mov	eax, [bp+var_1A]
		mov	[bp+var_10], eax
		mov	[bp+var_1E], 300h
		mov	eax, [bp+var_1E]
		mov	[bp+var_10], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	[bp+var_12], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+287h]
		mov	[bp+var_16], ax
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_82A7
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4

loc_82A7:				; CODE XREF: AI_TopLevelThink+14Cj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0BDh]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp+var_16]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0BDh]
		les	bx, es:[bx+0BDh]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+28Dh], 40h
		jmp	short loc_82FA
; ���������������������������������������������������������������������������

loc_82DA:				; CODE XREF: AI_TopLevelThink+A6j AI_TopLevelThink+B1j ...
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Dh]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_82FA
		cmp	dword ptr es:[bx+0Dh], 0
		jnz	short loc_82FA
		and	byte ptr es:[bx+28Dh], 0BFh

loc_82FA:				; CODE XREF: AI_TopLevelThink+18Cj
					; AI_TopLevelThink+19Ej ...
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_8308
		jmp	loc_83F0
; ���������������������������������������������������������������������������

loc_8308:				; CODE XREF: AI_TopLevelThink+1B7j
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 5
		ja	short loc_8358
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Escort_WaitTakeoffClearance
		add	sp, 4
		mov	[bp+var_9], al
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		mov	bx, word_704E6
		mov	al, [bx+5B4Ch]
		mov	dl, byte ptr [bp+var_8]
		sub	dl, byte ptr [bp+var_4]
		add	al, dl
		mov	[bx+5B4Ch], al
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax

loc_8358:				; CODE XREF: AI_TopLevelThink+1D2j
		mov	al, [bp+var_9]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_83A4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 4
		ja	short loc_83A4
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Escort_WaitLandingClearance
		add	sp, 4
		mov	[bp+var_9], al
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		mov	bx, word_704E6
		mov	al, [bx+5B42h]

loc_8390:
		mov	dl, byte ptr [bp+var_8]

loc_8393:
		sub	dl, byte ptr [bp+var_4]

loc_8396:
		add	al, dl

loc_8398:
		mov	[bx+5B42h], al

loc_839C:
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax

loc_83A4:				; CODE XREF: AI_TopLevelThink+213j
					; AI_TopLevelThink+21Ej
		mov	al, [bp+var_9]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_83F0
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 3
		ja	short loc_83F0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	AI_ScanForNewTarget
		add	sp, 4
		mov	[bp+var_9], al
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax

loc_83D4:
		mov	bx, word_704E6

loc_83D8:
		mov	al, [bx+5B38h]
		mov	dl, byte ptr [bp+var_8]
		sub	dl, byte ptr [bp+var_4]

loc_83E2:
		add	al, dl

loc_83E4:
		mov	[bx+5B38h], al
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax

loc_83F0:				; CODE XREF: AI_TopLevelThink+67j AI_TopLevelThink+73j ...
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+281h], 0
		jz	short loc_8431
		cmp	dword ptr es:[bx+0Dh], 0
		jnz	short loc_8425
		mov	al, [bp+var_9]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8425
		cmp	byte ptr es:[bx+27Fh], 2
		jnz	short loc_8425
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr AI_MissileEvasionReaction_9A77
		add	sp, 4
		mov	[bp+var_9], al
		jmp	short loc_8431
; ���������������������������������������������������������������������������

loc_8425:				; CODE XREF: AI_TopLevelThink+2B5j
					; AI_TopLevelThink+2BEj ...
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_QueryTargetField4B
		add	sp, 4

loc_8431:				; CODE XREF: AI_TopLevelThink+2ADj
					; AI_TopLevelThink+2D7j
		mov	al, [bp+var_9]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8454
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 1
		ja	short loc_8454
		push	word ptr [bp+arg_0+2]
		push	bx
		call	AI_EngageAttackerReaction_E246
		add	sp, 4
		mov	[bp+var_9], al

loc_8454:				; CODE XREF: AI_TopLevelThink+2ECj
					; AI_TopLevelThink+2F7j
		cmp	[bp+var_9], 0
		jz	short loc_845D
		jmp	loc_8545
; ���������������������������������������������������������������������������

loc_845D:				; CODE XREF: AI_TopLevelThink+30Cj
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_84AB
		cmp	byte ptr es:[bx+27Fh], 0
		jz	short loc_84AB
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]

loc_848F:
		add	sp, 4
		call	PIT_ReadHighPrecision
		sub	al, byte ptr [bp+var_4]
		mov	bx, word_704E6
		mov	dl, [bx+5B56h]
		add	dl, al
		mov	[bx+5B56h], dl
		jmp	loc_8545
; ���������������������������������������������������������������������������

loc_84AB:				; CODE XREF: AI_TopLevelThink+31Aj
					; AI_TopLevelThink+322j
		xor	si, si
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_84E9
		push	0
		push	large [bp+arg_0]
		call	Goal_ExecuteAction_A8AC
		add	sp, 6
		jmp	short loc_850B
; ���������������������������������������������������������������������������

loc_84CC:				; CODE XREF: AI_TopLevelThink+3BDj
		push	0

loc_84CE:
		push	large [bp+arg_0]
		mov	ax, si
		shl	ax, 3

loc_84D7:
		les	bx, [bp+arg_0]
		add	bx, ax
		call	dword ptr es:[bx+1B0h]
		add	sp, 6
		or	al, al
		jnz	short loc_850B
		inc	si

loc_84E9:				; CODE XREF: AI_TopLevelThink+36Ej
		mov	ax, si
		shl	ax, 3
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+1B0h]
		or	ax, es:[bx+1B2h]
		or	ax, es:[bx+1B4h]
		or	ax, es:[bx+1B6h]
		or	ax, ax
		jnz	short loc_84CC

loc_850B:				; CODE XREF: AI_TopLevelThink+37Ej
					; AI_TopLevelThink+39Aj
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+280h], 0
		jz	short loc_8545
		cmp	word ptr es:[bx+10Dh], 800h
		jnz	short loc_8545
		mov	al, es:[bx+28Bh]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8545
		dec	byte ptr es:[bx+280h]
		mov	word ptr es:[bx+10Dh], 800h
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2

loc_8545:				; CODE XREF: AI_TopLevelThink+30Ej
					; AI_TopLevelThink+35Cj ...
		pop	si
		leave
		retf
AI_TopLevelThink	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 231 lignes - LUE INTEGRALEMENT. Fonction cle de la chaine decision->mouvement (voir
; AI_SYSTEM.md §4bis). Calcule la position cible (via entite+0x10F si une reference existe,
; sinon entite+0x111 'centre de zone'), appelle Terrain_QueryAltitudeAt_378CA pour tenir
; compte du relief. Verifie l'arrivee via entite+0x139 (rayon d'arrivee, echelle 24.8) - si
; trop loin, calcule la direction normalisee vers la cible, la met a l'echelle par
; entite+0x141 (vitesse de croisiere), et ECRIT POSITION+VITESSE dans entite+7 (dereference,
; +0x2/+0x6/+0xA=position, +0xE/+0x12/+0x16=vitesse) - LE MEME sous-objet partage que
; Goal_ActiveWingmanEngagement. Termine en appelant [entite+0xD1->vtable+8] - le noeud
; MVRS_ID21 utilise directement comme porteur de commande de navigation.
; ==============================================================================================
AI_NavSolutionToPoint	proc far		; CODE XREF: Goal_ExecuteAction_A8AC+BCP
					; Goal_ExecuteAction_A8AC+10FP ...

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
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_8561
		jmp	loc_8789
; ���������������������������������������������������������������������������

loc_8561:				; CODE XREF: AI_NavSolutionToPoint+14j
		mov	[bp+var_C], 0
		xor	ax, ax
		mov	[bp+var_8], ax
		mov	[bp+var_A], ax
		mov	[bp+var_10], 200h
		mov	eax, [bp+var_10]
		mov	[bp+var_6], eax
		cmp	word ptr es:[bx+10Fh], 0
		jz	short loc_85A3
		mov	si, es:[bx+10Fh]
		add	si, 12h
		mov	eax, [si]

loc_8591:
		mov	[bp+var_4C], eax
		mov	eax, [si+4]
		mov	[bp+var_48], eax
		mov	eax, [si+8]
		jmp	short loc_85CC
; ���������������������������������������������������������������������������

loc_85A3:				; CODE XREF: AI_NavSolutionToPoint+3Cj
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 111h
		mov	word ptr [bp+var_14+2],	ax
		mov	word ptr [bp+var_14], dx
		les	si, [bp+var_14]
		mov	eax, es:[si]
		mov	[bp+var_4C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_48], eax
		mov	eax, es:[si+8]

loc_85CC:				; CODE XREF: AI_NavSolutionToPoint+59j
		mov	[bp+var_44], eax

loc_85D0:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 13Dh
		mov	word ptr [bp+var_18+2],	ax
		mov	word ptr [bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_44], eax
		push	0
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_64], eax
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	[bp+var_60], eax
		mov	[bp+var_28], 100h
		mov	eax, [bp+var_28]
		mov	[bp+var_5C], eax
		lea	ax, [bp+var_64]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+102h]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_2C]
		add	[bp+var_44], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [bp+var_4C]
		sub	eax, [si]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_48]
		sub	eax, [si+4]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_44]
		sub	eax, [si+8]
		mov	[bp+var_50], eax
		push	eax
		push	large [bp+var_54]
		push	large [bp+var_58]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch

loc_8692:
		mov	[bp+var_30], eax

loc_8696:
		mov	[bp+var_34], eax
		les	bx, [bp+arg_0]

loc_869D:
		mov	eax, es:[bx+139h]

loc_86A3:
		mov	[bp+var_38], eax
		shl	eax, 8
		cmp	eax, [bp+var_34]
		jge	short loc_86B6
		mov	ax, 1
		jmp	short loc_86B8
; ���������������������������������������������������������������������������

loc_86B6:				; CODE XREF: AI_NavSolutionToPoint+167j
		xor	ax, ax

loc_86B8:				; CODE XREF: AI_NavSolutionToPoint+16Cj
		or	al, al
		jnz	short loc_86BF
		jmp	loc_8789
; ���������������������������������������������������������������������������

loc_86BF:				; CODE XREF: AI_NavSolutionToPoint+172j
		mov	[bp+var_1], 1
		lea	ax, [bp+var_58]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]

loc_86D3:
		add	dx, 141h
		mov	word ptr [bp+var_3C+2],	ax
		mov	word ptr [bp+var_3C], dx
		les	bx, [bp+var_3C]
		mov	eax, es:[bx]

loc_86E4:
		mov	[bp+var_40], eax
		mov	eax, [bp+var_58]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_54]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_50]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_4C]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_48]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_44]
		mov	es:[bx+0Ah], eax
		mov	eax, [bp+var_58]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_54]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_50]
		mov	es:[bx+16h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0D1h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp+var_C]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0D1h]
		les	bx, es:[bx+0D1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6

loc_8789:				; CODE XREF: AI_NavSolutionToPoint+16j
					; AI_NavSolutionToPoint+174j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
AI_NavSolutionToPoint	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'Goal_ActiveWingmanEngagement_878F' (interpretation 'escorte active du joueur' fausse).
; far, ~390L, RELUE INTEGRALEMENT 2026-09-25. Gestionnaire GOAL de valeur 5
; (seg339:off_6D1A8). REACTION AU MORAL, evaluee au plus toutes les 5 s (horloge +0x175
; comparee a +0x166, sinon renvoie 0). m = AI_ComputeMorale_CD4A (2 bon, 3 correct, 4 ebranle,
; 5 panique) ; camp = [objet+0x102]+0x50 (1 = camp du joueur, 0xFF = camp adverse, 0 = neutre
; ; deduit des branches ou le leader est le joueur). (A) m = 4 ou 5 et camp != 1 : FUITE -
; radio 8, bit 5 de +0x28B (ordre verrouille contre le script), objectif +0x11D = 0xA5 (vol
; vers un point), comportement en cours abandonne, point = AI_ResolveNodePosition_54274(objet,
; word_706A0) + 1000 m d'altitude (add 3E800h), parametres (250, 100, 0) dans le bloc de
; commandes +0x0E, recopies dans +0x11F/+0x12B, applique le noeud ID 21 (+0xD1, navigation) ;
; renvoie 1. (B) m = 4 ou 5, camp 1, leader (+0x145) ou +0x147 = le joueur (word_722E6),
; AI_MoraleDisciplineCheck_CA93 faux, et objectif = 0xAA (suivre) ou bit 5 de +0x28B : (B1) si
; la menace +0x289 est le leader lui-meme et byte_6E4CD == 0 (pas d'adversaire actif au cycle
; radio precedent) : cible aerienne +0x287 = le leader, +0x149 = 1,
; AI_BehaviorStateMachine_WeightedOptionSelector_9D05 (combat), radio 0x20 (le message de tir
; sur le joueur) : L'AILIER SE RETOURNE CONTRE LE JOUEUR ; (B2) sinon, si +0x149 != 2 : radio
; 8, bit 5, objectif 0xAA, +0x149 = 2, leader = joueur, abandon du comportement en cours,
; navigation ID 21 vers le meme point + 1000 m (parametres 250, 0, 0) ; renvoie 1. (C) Sinon,
; avec le leader = joueur : si +0x27F vaut 1 (en combat contre un attaquant,
; AI_EngageAttackerReaction_E246) ou 2 (missile) : radio 6 au joueur, renvoie 0. (D) m = 2 ou
; 3, camp 1, leader = joueur, AI_MoraleDisciplineCheck_CA93 faux, +0x149 ni 1 ni 2, objectif
; 0xAA, byte_6E4CD != 0 : radio 0x12 puis Goal_TransferToWingman (se rattache au joueur :
; cible de mission et reference de navigation = le joueur, +0x149 = 1, bit 5) ; renvoie 1.
; Repliques (chunk MSGS de BILLY.IFF, data/BILLY.IFF) : 6 = 'This guy's good. Could someone
; give me a hand here?' (appel a l'aide) ; 8 = 'That's all for me. I'm outta here!' (abandon
; du combat, branches A et B2) ; 0x12 = 'This one's all mine.' (initiative, branche D) ; 0x20
; = 'Do you feel lucky? Well? Do you punk?' (provocation, aussi jouee au tir par
; AI_BehaviorSelector). Point resolu depuis word_706A0 : non trace. Ne fait PAS le suivi de
; formation (c'est Goal_ExecuteAction_A8AC, cas 0xAA).
; ==============================================================================================
Goal_MoraleReaction_878F:				; DATA XREF: seg339:off_6D1A8o
		push	bp
		mov	bp, sp
		sub	sp, 4Eh
		push	si
		mov	byte ptr [bp-1], 0
		les	bx, [bp+6]
		mov	eax, es:[bx+175h]
		sar	eax, 8
		sub	eax, es:[bx+166h]
		cmp	eax, 5
		jg	short loc_87B6
		jmp	loc_8C18
; ���������������������������������������������������������������������������

loc_87B6:				; CODE XREF: seg004:0671j
		mov	eax, es:[bx+175h]
		sar	eax, 8
		mov	es:[bx+166h], eax
		push	word ptr [bp+8]
		push	bx
		call	AI_ComputeMorale_CD4A
		add	sp, 4

loc_87D2:
		mov	[bp-2],	al
		les	bx, [bp+6]

loc_87D8:
		mov	bx, es:[bx+102h]

loc_87DD:
		mov	al, [bx+50h]
		mov	[bp-4],	al
		cmp	byte ptr [bp-2], 4
		jz	short loc_87F2
		cmp	byte ptr [bp-2], 5
		jz	short loc_87F2
		jmp	loc_8BA3
; ���������������������������������������������������������������������������

loc_87F2:				; CODE XREF: seg004:06A7j seg004:06ADj
		cmp	byte ptr [bp-4], 1
		jz	short loc_87FB
		jmp	loc_8A17
; ���������������������������������������������������������������������������

loc_87FB:				; CODE XREF: seg004:06B6j
		les	bx, [bp+6]
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jz	short loc_8817
		mov	ax, es:[bx+147h]
		cmp	ax, word_722E6
		jz	short loc_8817
		jmp	loc_89DE
; ���������������������������������������������������������������������������

loc_8817:				; CODE XREF: seg004:06C7j seg004:06D2j
		push	large dword ptr	[bp+6]
		call	AI_MoraleDisciplineCheck_CA93
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_882C
		jmp	loc_89DE
; ���������������������������������������������������������������������������

loc_882C:				; CODE XREF: seg004:06E7j
		les	bx, [bp+6]
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jz	short loc_884A
		mov	al, es:[bx+28Bh]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jnz	short loc_884A
		jmp	loc_89DE
; ���������������������������������������������������������������������������

loc_884A:				; CODE XREF: seg004:06F6j seg004:0705j
		les	bx, [bp+6]
		cmp	word ptr es:[bx+145h], 0
		jz	short loc_88BF
		mov	ax, es:[bx+289h]
		cmp	ax, es:[bx+145h]
		jnz	short loc_88BF
		mov	al, byte_6E4CD
		mov	ah, 0
		or	ax, ax
		jnz	short loc_88BF
		mov	ax, es:[bx+145h]
		mov	[bp-6],	ax
		push	ax
		mov	ax, [bp+6]
		add	ax, 287h
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+6]
		mov	byte ptr es:[bx+149h], 1
		push	0
		push	word ptr [bp+8]
		push	bx
		nop
		push	cs
		call	near ptr AI_BehaviorStateMachine_WeightedOptionSelector_9D05
		add	sp, 6
		mov	[bp-1],	al
		les	bx, [bp+6]

loc_88A2:
		or	byte ptr es:[bx+28Bh], 20h
		push	0
		push	20h ; ' '

loc_88AC:				; CODE XREF: seg004:08D4j
		push	word_722E6
		push	large dword ptr	[bp+6]
		call	Radio_PlayMessage
		add	sp, 0Ah
		jmp	loc_8C18
; ���������������������������������������������������������������������������

loc_88BF:				; CODE XREF: seg004:0713j seg004:071Fj ...
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+149h], 2
		jnz	short loc_88CD
		jmp	loc_8C18
; ���������������������������������������������������������������������������

loc_88CD:				; CODE XREF: seg004:0788j
		push	0
		push	8
		push	word_722E6
		push	word ptr [bp+8]
		push	bx
		call	Radio_PlayMessage
		add	sp, 0Ah
		les	bx, [bp+6]
		or	byte ptr es:[bx+28Bh], 20h
		mov	word ptr es:[bx+11Dh], 0AAh ; '�'
		mov	byte ptr es:[bx+149h], 2
		mov	ax, word_722E6
		mov	[bp-8],	ax
		push	ax
		mov	ax, [bp+6]
		add	ax, 145h
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		mov	byte ptr [bp-1], 1
		les	bx, [bp+6]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_892C
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4

loc_892C:				; CODE XREF: seg004:07DDj
		mov	word ptr [bp-12h], 0
		xor	ax, ax
		mov	[bp-0Eh], ax
		mov	[bp-10h], ax
		mov	dword ptr [bp-16h], 200h
		mov	eax, [bp-16h]
		mov	[bp-0Ch], eax
		les	bx, [bp+6]
		push	word ptr es:[bx+102h]
		push	word_706A0
		push	ss
		lea	ax, [bp-36h]
		push	ax
		call	AI_ResolveNodePosition_54274
		add	sp, 8
		les	bx, [bp+6]
		les	bx, es:[bx+7]
		mov	eax, [bp-36h]
		mov	es:[bx+2], eax
		mov	eax, [bp-32h]
		mov	es:[bx+6], eax
		mov	eax, [bp-2Eh]
		mov	es:[bx+0Ah], eax
		add	dword ptr es:[bx+0Ah], 3E800h
		mov	dword ptr [bp-1Ah], 0FA00h

loc_8995:
		mov	dword ptr [bp-1Eh], 0
		mov	dword ptr [bp-22h], 0
		mov	eax, [bp-1Ah]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp-1Eh]
		mov	es:[bx+12h], eax
		mov	eax, [bp-22h]
		mov	es:[bx+16h], eax
		lea	ax, [bp-12h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+0D1h]
		les	bx, es:[bx+0D1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	loc_8C18
; ���������������������������������������������������������������������������

loc_89DE:				; CODE XREF: seg004:06D4j seg004:06E9j ...
		les	bx, [bp+6]
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jz	short loc_89FA
		mov	ax, es:[bx+147h]
		cmp	ax, word_722E6
		jz	short loc_89FA
		jmp	loc_8C18
; ���������������������������������������������������������������������������

loc_89FA:				; CODE XREF: seg004:08AAj seg004:08B5j
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+27Fh], 1
		jz	short loc_8A10
		cmp	byte ptr es:[bx+27Fh], 2
		jz	short loc_8A10
		jmp	loc_8C18
; ���������������������������������������������������������������������������

loc_8A10:				; CODE XREF: seg004:08C3j seg004:08CBj
		push	0
		push	6
		jmp	loc_88AC
; ���������������������������������������������������������������������������

loc_8A17:				; CODE XREF: seg004:06B8j
		push	0
		push	8
		push	word_722E6
		push	large dword ptr	[bp+6]
		call	Radio_PlayMessage
		add	sp, 0Ah
		les	bx, [bp+6]
		or	byte ptr es:[bx+28Bh], 20h
		mov	word ptr es:[bx+11Dh], 0A5h ; '�'
		mov	byte ptr [bp-1], 1
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_8A54
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4

loc_8A54:				; CODE XREF: seg004:0905j
		mov	word ptr [bp-12h], 0
		xor	ax, ax
		mov	[bp-0Eh], ax
		mov	[bp-10h], ax
		mov	dword ptr [bp-16h], 200h
		mov	eax, [bp-16h]
		mov	[bp-0Ch], eax
		les	bx, [bp+6]
		push	word ptr es:[bx+102h]
		push	word_706A0
		push	ss
		lea	ax, [bp-36h]
		push	ax
		call	AI_ResolveNodePosition_54274
		add	sp, 8
		les	bx, [bp+6]
		les	bx, es:[bx+7]

loc_8A91:
		mov	eax, [bp-36h]
		mov	es:[bx+2], eax
		mov	eax, [bp-32h]
		mov	es:[bx+6], eax
		mov	eax, [bp-2Eh]
		mov	es:[bx+0Ah], eax
		add	dword ptr es:[bx+0Ah], 3E800h
		mov	dword ptr [bp-1Ah], 0FA00h
		mov	dword ptr [bp-1Eh], 6400h
		mov	dword ptr [bp-22h], 0
		mov	eax, [bp-1Ah]

loc_8AD1:
		mov	es:[bx+0Eh], eax

loc_8AD6:
		mov	eax, [bp-1Eh]
		mov	es:[bx+12h], eax
		mov	eax, [bp-22h]
		mov	es:[bx+16h], eax
		les	bx, [bp+6]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+7]
		add	dx, 0Eh
		mov	[bp-24h], ax
		mov	[bp-26h], dx
		les	si, [bp-26h]
		mov	eax, es:[si]
		mov	[bp-42h], eax
		mov	eax, es:[si+4]
		mov	[bp-3Eh], eax
		mov	eax, es:[si+8]
		mov	[bp-3Ah], eax
		mov	es, word ptr [bp+8]
		mov	eax, [bp-42h]
		mov	es:[bx+12Bh], eax
		mov	eax, [bp-3Eh]
		mov	es:[bx+12Fh], eax
		mov	eax, [bp-3Ah]
		mov	es:[bx+133h], eax
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+7]
		add	dx, 2
		mov	[bp-28h], ax
		mov	[bp-2Ah], dx
		les	si, [bp-2Ah]
		mov	eax, es:[si]
		mov	[bp-4Eh], eax
		mov	eax, es:[si+4]
		mov	[bp-4Ah], eax
		mov	eax, es:[si+8]
		mov	[bp-46h], eax
		mov	es, word ptr [bp+8]
		mov	eax, [bp-4Eh]
		mov	es:[bx+11Fh], eax
		mov	eax, [bp-4Ah]
		mov	es:[bx+123h], eax
		mov	eax, [bp-46h]
		mov	es:[bx+127h], eax
		lea	ax, [bp-12h]
		push	ax
		push	large dword ptr	es:[bx+0D1h]
		les	bx, es:[bx+0D1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	short loc_8C18
; ���������������������������������������������������������������������������

loc_8BA3:				; CODE XREF: seg004:06AFj
		cmp	byte ptr [bp-4], 1
		jnz	short loc_8C18
		les	bx, [bp+6]
		cmp	word ptr es:[bx+145h], 0
		jz	short loc_8C18
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jnz	short loc_8C18
		push	word ptr [bp+8]
		push	bx
		call	AI_MoraleDisciplineCheck_CA93
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8C18
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+149h], 1
		jz	short loc_8C18

loc_8BDC:
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'

loc_8BE3:
		jnz	short loc_8C18

loc_8BE5:
		cmp	byte_6E4CD, 0
		jz	short loc_8C18
		cmp	byte ptr es:[bx+149h], 2
		jz	short loc_8C18
		push	0
		push	12h
		push	word_722E6
		push	word ptr [bp+8]
		push	bx
		call	Radio_PlayMessage
		add	sp, 0Ah
		push	large dword ptr	[bp+6]
		call	Goal_TransferToWingman
		add	sp, 4
		mov	byte ptr [bp-1], 1

loc_8C18:				; CODE XREF: seg004:0673j seg004:077Cj ...
		mov	al, [bp-1]
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,31L — jet de dé pilote : lit stat pilote à +0xB0, ajoute modificateur (arg_4), tire
; sub_70D (rand)%16+1, réussite si tirage ≤ seuil. Test de compétence/chance basé sur une
; statistique pilote (offset 0xB0).
; ==============================================================================================
Pilot_SkillCheck_B0	proc far		; CODE XREF: Targeting_AcquireBestThreat+A20P
					; seg002:loc_4840P ...

var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B0h]
		cbw
		add	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		call	CRT_Rand
		and	ax, 0Fh
		inc	ax
		cmp	ax, [bp+var_2]
		jg	short loc_8C46
		mov	ax, 1
		jmp	short locret_8C48
; ���������������������������������������������������������������������������

loc_8C46:				; CODE XREF: Pilot_SkillCheck_B0+21j
		xor	ax, ax

locret_8C48:				; CODE XREF: Pilot_SkillCheck_B0+26j
		leave
		retf
Pilot_SkillCheck_B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,30L — identique à sub_8C1E mais sur la stat pilote à +0xB7 : test de compétence sur un
; attribut pilote différent.
; ==============================================================================================
Pilot_SkillCheck_B7	proc far		; CODE XREF: seg002:026BP

var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B7h]
		cbw
		add	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		call	CRT_Rand
		and	ax, 0Fh
		inc	ax
		cmp	ax, [bp+var_2]
		jg	short loc_8C72
		mov	ax, 1
		jmp	short locret_8C74
; ���������������������������������������������������������������������������

loc_8C72:				; CODE XREF: Pilot_SkillCheck_B7+21j
		xor	ax, ax

locret_8C74:				; CODE XREF: Pilot_SkillCheck_B7+26j
		leave
		retf
Pilot_SkillCheck_B7	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+6]
		mov	al, es:[bx+0B8h]
		cbw
		add	ax, [bp+0Ah]
		mov	[bp-2],	ax
		call	CRT_Rand
		and	ax, 0Fh
		inc	ax
		cmp	ax, [bp-2]
		jg	short loc_8C9E
		mov	ax, 1
		jmp	short locret_8CA0
; ���������������������������������������������������������������������������

loc_8C9E:				; CODE XREF: seg004:0B57j
		xor	ax, ax

locret_8CA0:				; CODE XREF: seg004:0B5Cj
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,30L — identique à sub_8C1E/8C4A mais sur la stat pilote à +0xB1 : test de compétence sur
; un 3e attribut pilote (probable trio gunnery/evasion/awareness).
; ==============================================================================================
Pilot_SkillCheck_B1	proc far		; CODE XREF: AI_RadarScanTarget+90p

var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B1h]
		cbw
		add	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		call	CRT_Rand
		and	ax, 0Fh
		inc	ax
		cmp	ax, [bp+var_2]
		jg	short loc_8CCA
		mov	ax, 1
		jmp	short locret_8CCC
; ���������������������������������������������������������������������������

loc_8CCA:				; CODE XREF: Pilot_SkillCheck_B1+21j
		xor	ax, ax

locret_8CCC:				; CODE XREF: Pilot_SkillCheck_B1+26j
		leave
		retf
Pilot_SkillCheck_B1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 54L, LUE (2026-09-20). Test DETERMINISTE (sans hasard) : renvoie 1 si 2*si >=
; entite+0xB6 (trait AA, air-air), sinon 0 (calcul : round((si*16*256/8)/256)). Utilise par
; AI_BehaviorSelector_8D30 pour autoriser une rafale de canon : la qualite de solution de tir
; 'si' doit valoir au moins AA/2. Plus AA est eleve, plus le pilote attend une bonne solution
; avant de tirer ; un pilote faible (AA bas) tire des qu'il a une solution mediocre (si >= 2
; exige par ailleurs).
; ==============================================================================================
Pilot_ReactionThreshold_B6	proc far		; CODE XREF: AI_BehaviorSelector+145p

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	ax, [bp+arg_4]

loc_8CD7:
		shl	ax, 4

loc_8CDA:
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]

loc_8CE2:
		shl	eax, 8
		mov	[bp+var_4], eax
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jge	short loc_8D0A
		add	eax, 0FFFFFF80h
		sar	eax, 8
		jmp	short loc_8D18
; ���������������������������������������������������������������������������

loc_8D0A:				; CODE XREF: Pilot_ReactionThreshold_B6+30j
		mov	eax, [bp+var_4]
		add	eax, 80h ; '�'
		sar	eax, 8

loc_8D18:				; CODE XREF: Pilot_ReactionThreshold_B6+3Aj
		les	bx, [bp+arg_0]
		movsx	edx, byte ptr es:[bx+0B6h]
		cmp	eax, edx
		jl	short loc_8D2C
		mov	ax, 1
		jmp	short locret_8D2E
; ���������������������������������������������������������������������������

loc_8D2C:				; CODE XREF: Pilot_ReactionThreshold_B6+57j
		xor	ax, ax

locret_8D2E:				; CODE XREF: Pilot_ReactionThreshold_B6+5Cj
		leave
		retf
Pilot_ReactionThreshold_B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,313L — orchestre plusieurs des fonctions ci-dessus (sub_9027, sub_8CCE, sub_91DF
; référencées) : candidat pour une routine de sélection de comportement combinant tests de
; compétence pilote et solutions de manœuvre, à approfondir.
; ==============================================================================================
AI_BehaviorSelector	proc far		; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+148p

var_24		= word ptr -24h
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+287h], 0
		jnz	short loc_8D4A
		jmp	loc_9020
; ���������������������������������������������������������������������������

loc_8D4A:				; CODE XREF: AI_BehaviorSelector+15j
		mov	[bp+var_2], 0
		mov	di, es:[bx+287h]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_18], eax
		mov	eax, [di+4]
		mov	[bp+var_14], eax
		mov	eax, [di+8]
		mov	[bp+var_10], eax
		mov	di, es:[bx+102h]
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_18], eax
		mov	eax, [di+4]
		sub	[bp+var_14], eax
		mov	eax, [di+8]
		sub	[bp+var_10], eax
		or	byte ptr es:[bx+28Bh], 4
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_6], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Bh], 0BFh
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_RadarScanTarget
		add	sp, 4
		mov	[bp+var_7], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Bh], 0FDh
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+280h], 0
		jz	short loc_8DF2

loc_8DD1:
		cmp	word ptr es:[bx+10Dh], 800h
		jnz	short loc_8DF2

loc_8DDA:
		dec	byte ptr es:[bx+280h]

loc_8DDF:
		mov	word ptr es:[bx+10Dh], 800h
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		jmp	loc_8FAF
; ���������������������������������������������������������������������������

loc_8DF2:				; CODE XREF: AI_BehaviorSelector+9Fj AI_BehaviorSelector+A8j
		mov	al, [bp+var_7]
		mov	ah, 0
		or	ax, ax
		jz	short loc_8DFE
		jmp	loc_8FAF
; ���������������������������������������������������������������������������

loc_8DFE:				; CODE XREF: AI_BehaviorSelector+C9j
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_SelectWeaponMask_9665
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx+1A2h], ax
		push	word ptr es:[bx+287h]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	AI_ManeuverSolution_Major
		add	sp, 6
		mov	[bp+var_2], al
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_ComputeFireSolutionQuality_91DF
		add	sp, 4
		mov	si, ax
		les	bx, [bp+arg_0]
		mov	es:[bx+1A0h], si
		cmp	word ptr es:[bx+1A2h], 800h
		jz	short loc_8E48
		jmp	loc_8ECE
; ���������������������������������������������������������������������������

loc_8E48:				; CODE XREF: AI_BehaviorSelector+113j
		push	word ptr es:[bx+1A2h]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	AI_FireWeaponTrigger
		add	sp, 6
		cmp	[bp+var_2], 0
		jz	short loc_8E67
		cmp	si, 5
		jle	short loc_8E67
		mov	si, 0Ah

loc_8E67:				; CODE XREF: AI_BehaviorSelector+12Dj
					; AI_BehaviorSelector+132j
		cmp	si, 2
		jge	short loc_8E6F
		jmp	loc_8F43
; ���������������������������������������������������������������������������

loc_8E6F:				; CODE XREF: AI_BehaviorSelector+13Aj
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr Pilot_ReactionThreshold_B6
		add	sp, 6
		or	al, al
		jnz	short loc_8E82
		jmp	loc_8F43
; ���������������������������������������������������������������������������

loc_8E82:				; CODE XREF: AI_BehaviorSelector+14Dj
		call	CRT_Rand
		and	ax, 3
		add	ax, 4
		imul	si
		les	bx, [bp+arg_0]
		mov	es:[bx+280h], al
		mov	al, es:[bx+280h]
		mov	ah, 0
		mov	bx, 0Ah
		cwd
		idiv	bx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+280h], al
		cmp	byte ptr es:[bx+280h], 1
		jbe	short loc_8EC3

loc_8EB4:				; CODE XREF: AI_BehaviorSelector+204j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		jmp	loc_8F43
; ���������������������������������������������������������������������������

loc_8EC3:				; CODE XREF: AI_BehaviorSelector+182j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+280h], 0
		jmp	short loc_8F43
; ���������������������������������������������������������������������������

loc_8ECE:				; CODE XREF: AI_BehaviorSelector+115j
		or	si, si
		jle	short loc_8F43
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1A2h]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	AI_FireWeaponTrigger

loc_8EE3:
		add	sp, 6
		or	al, al
		jz	short loc_8F43
		les	bx, [bp+arg_0]
		les	bx, es:[bx+104h]
		mov	ax, es:[bx+0Dh]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+287h]
		jnz	short loc_8F37
		mov	ax, es:[bx+287h]
		mov	[bp+var_A], ax
		push	ax
		les	bx, es:[bx+104h]
		mov	ax, es:[bx+14h]
		push	bx
		push	es
		mov	dx, es:[bx]
		imul	dx, 12h
		add	ax, dx
		pop	es
		pop	bx
		push	word ptr es:[bx+16h]
		push	ax
		call	WeaponStation_TestTargetLock
		add	sp, 6
		mov	[bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_8F43
		jmp	loc_8EB4
; ���������������������������������������������������������������������������

loc_8F37:				; CODE XREF: AI_BehaviorSelector+1CEj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 40h

loc_8F43:				; CODE XREF: AI_BehaviorSelector+13Cj
					; AI_BehaviorSelector+14Fj ...
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Bh]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_8FAF
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1A2h]
		mov	es:[bx+10Dh], ax
		mov	eax, es:[bx+175h]
		sar	eax, 8
		mov	es:[bx+109h], eax
		test	word ptr es:[bx+1A2h], 800h
		jnz	short loc_8F8D
		mov	ax, es:[bx+287h]
		cmp	ax, word_722E6
		jnz	short loc_8F8D
		mov	byte_6E4C0, 1

loc_8F8D:				; CODE XREF: AI_BehaviorSelector+24Bj
					; AI_BehaviorSelector+256j
		cmp	byte_6E33B, 0
		jz	short loc_8FAF
		cmp	word_722E6, 0
		jz	short loc_8FAF
		push	0
		push	20h ; ' '
		push	word_722E6
		push	large [bp+arg_0]
		call	Radio_PlayMessage
		add	sp, 0Ah

loc_8FAF:				; CODE XREF: AI_BehaviorSelector+BFj AI_BehaviorSelector+CBj ...
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Bh]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jnz	short loc_8FC7
		or	si, si
		jle	short loc_9006

loc_8FC7:				; CODE XREF: AI_BehaviorSelector+291j
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9000
		push	large 0Ah
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+287h]
		push	word ptr [bp+arg_0+2]
		push	bx
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	AI_Sensor_WeaponVelocityCache
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	large [bp+arg_0]
		call	AI_GuidanceSolution_Major
		add	sp, 0Ch

loc_9000:				; CODE XREF: AI_BehaviorSelector+29Ej
		mov	[bp+var_1], 1
		jmp	short loc_900A
; ���������������������������������������������������������������������������

loc_9006:				; CODE XREF: AI_BehaviorSelector+295j
		mov	[bp+var_1], 0

loc_900A:				; CODE XREF: AI_BehaviorSelector+2D4j
		call	PIT_ReadHighPrecision
		sub	al, byte ptr [bp+var_6]
		mov	bx, word_704E6
		mov	dl, [bx+5B6Ah]
		add	dl, al
		mov	[bx+5B6Ah], dl

loc_9020:				; CODE XREF: AI_BehaviorSelector+17j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
AI_BehaviorSelector	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,228L — vérifie timer/portée ajustés par la compétence pilote (+0xB0), exclut certains
; types de cible (+0x10D), puis parcourt une liste chaînée d'objets (vtable calls) en
; cherchant un objet de type 8 différent de soi : boucle de balayage/sélection de cible (scan
; radar).
; ==============================================================================================
AI_RadarScanTarget	proc far		; CODE XREF: AI_BehaviorSelector+81p AI_EvalTargetAttribute+6Ep

var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 175h
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+109h]
		mov	[bp+var_C], eax
		shl	eax, 8
		sub	[bp+var_4], eax
		mov	[bp+var_D], 0
		mov	al, es:[bx+0B0h]
		cbw
		add	ax, 0FFF3h
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_12]
		jge	short loc_908B
		mov	ax, 1
		jmp	short loc_908D
; ���������������������������������������������������������������������������

loc_908B:				; CODE XREF: AI_RadarScanTarget+5Dj
		xor	ax, ax

loc_908D:				; CODE XREF: AI_RadarScanTarget+62j
		or	al, al
		jnz	short loc_9094
		jmp	loc_9134
; ���������������������������������������������������������������������������

loc_9094:				; CODE XREF: AI_RadarScanTarget+68j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+10Dh], 800h
		jnz	short loc_90A3
		jmp	loc_9134
; ���������������������������������������������������������������������������

loc_90A3:				; CODE XREF: AI_RadarScanTarget+77j
		cmp	word ptr es:[bx+10Dh], 0
		jnz	short loc_90AE
		jmp	loc_9134
; ���������������������������������������������������������������������������

loc_90AE:				; CODE XREF: AI_RadarScanTarget+82j
		xor	di, di
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr Pilot_SkillCheck_B1
		add	sp, 6
		mov	byte ptr [bp+var_18+3],	al

loc_90C0:
		mov	word ptr [bp+var_18], 0

loc_90C5:
		jmp	short loc_911E
; ���������������������������������������������������������������������������

loc_90C7:				; CODE XREF: AI_RadarScanTarget+108j
		mov	si, word ptr [bp+var_18]
		push	si

loc_90CB:
		mov	bx, [si]

loc_90CD:
		call	dword ptr [bx]
		pop	cx

loc_90D0:
		mov	word ptr [bp+var_1C+2],	dx

loc_90D3:
		mov	word ptr [bp+var_1C], ax

loc_90D6:
		cmp	[bp+var_1C], 0
		jz	short loc_911E

loc_90DD:
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], si

loc_90E4:
		jz	short loc_911E
		push	dx
		push	ax
		les	bx, [bp+var_1C]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 8
		jnz	short loc_911E
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+102h]
		jnz	short loc_911E
		or	di, di
		jnz	short loc_9117
		cmp	byte ptr [bp+var_18+3],	0
		jz	short loc_9117
		mov	di, si
		jmp	short loc_911E
; ���������������������������������������������������������������������������

loc_9117:				; CODE XREF: AI_RadarScanTarget+E4j AI_RadarScanTarget+EAj
		mov	[bp+var_D], 1
		jmp	loc_91D8
; ���������������������������������������������������������������������������

loc_911E:				; CODE XREF: AI_RadarScanTarget:loc_90C5j
					; AI_RadarScanTarget+B4j	...
		lea	ax, [bp+var_18]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_90C7
		jmp	loc_91D8
; ���������������������������������������������������������������������������

loc_9134:				; CODE XREF: AI_RadarScanTarget+6Aj AI_RadarScanTarget+79j ...
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+10Dh], 800h
		jz	short loc_914B
		cmp	word ptr es:[bx+10Dh], 0
		jz	short loc_914B
		jmp	loc_91D8
; ���������������������������������������������������������������������������

loc_914B:				; CODE XREF: AI_RadarScanTarget+117j
					; AI_RadarScanTarget+11Fj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+10Dh], 800h
		jnz	short loc_9186
		mov	al, es:[bx+0B1h]
		cbw
		mov	dx, 10h
		sub	dx, ax
		shl	dx, 1
		mov	word ptr [bp+var_1C+2],	dx
		movsx	eax, word ptr [bp+var_1C+2]
		shl	eax, 8
		mov	[bp-1Eh], eax
		mov	eax, [bp-1Eh]
		mov	[bp+var_18], eax
		sar	eax, 4
		mov	[bp+var_18], eax
		jmp	short loc_91C4
; ���������������������������������������������������������������������������

loc_9186:				; CODE XREF: AI_RadarScanTarget+12Ej
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+10Dh], 0
		jnz	short loc_91C4
		mov	al, es:[bx+0B0h]
		cbw
		mov	dx, 10h
		sub	dx, ax
		mov	[bp+var_20], dx
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_18], eax
		sar	eax, 3
		mov	[bp+var_18], eax
		add	[bp+var_18], 80h ; '�'

loc_91C4:				; CODE XREF: AI_RadarScanTarget+15Dj
					; AI_RadarScanTarget+168j
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_18]
		jge	short loc_91D3

loc_91CE:
		mov	ax, 1

loc_91D1:
		jmp	short loc_91D5
; ���������������������������������������������������������������������������

loc_91D3:				; CODE XREF: AI_RadarScanTarget+1A5j
		xor	ax, ax

loc_91D5:				; CODE XREF: AI_RadarScanTarget:loc_91D1j
		mov	[bp+var_D], al

loc_91D8:				; CODE XREF: AI_RadarScanTarget+F4j
					; AI_RadarScanTarget+10Aj ...
		mov	al, [bp+var_D]
		pop	di
		pop	si
		leave
		retf
AI_RadarScanTarget	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 559L, LUE INTEGRALEMENT (2026-09-20). CALCULE LA QUALITE DE SOLUTION DE TIR 'si'
; (entier 0 a 10) contre la cible aerienne (entite+0x287) avec l'arme choisie (masque
; entite+0x1A2). Rangee par AI_BehaviorSelector_8D30 dans entite+0x1A0. Sans cible ou cible a
; 90 degres ou plus du nez : 0. Base : 10 - (ecart_nez*10)/35. Aspect croise (cap de la cible
; entre 50 et 130 degres de la direction vers elle) : -4. CANON (0x800) : 0 si d >=
; dword_7201C (1800) ; sinon la valeur de base est ECRASEE par une qualite de VISEE : erreur
; de VISEE = sqrt(diff_azimut^2 + diff_elevation^2) entre la direction vers la cible et le
; vecteur vitesse de MON ARME (AI_Sensor_WeaponVelocityCache, Math_ElevationAngle_552E1,
; Math_HeadingAngle_553CF), donc pratiquement l'ecart entre mon nez et la cible ; tolerance =
; arctan(vitesse_cible / d) (90 degres si d <= 0) ; ecart = erreur - tolerance ; si ecart < 0
; : si = 8 - 2*ecart/tolerance (8 a 10) ; sinon si = 8 - 4*ecart/tolerance ; puis -4 si aspect
; croise. MISSILES (switch sur le masque : 1, 2, 3 -> courte portee ; 0x100, 0x700 -> longue
; portee ; autre -> 0) : courte portee : d >= dword_7202C (17700) -> -10 ; d < dword_72028
; (1800) -> -3 (-10 si aspect croise) ; longue portee : d >= dword_72024 (45000) -> -10 ; d <
; dword_72020 (4000) -> -3 (-10 si croise). Resultat borne a [0,10]. PRECISION (2026-09-24,
; relu) : l'erreur de visee n'est PAS l'angle entre deux vecteurs. D = position cible (+0x12)
; - ma position (entite+0x102, +0x12) ; W = vitesse de mon arme
; (AI_Sensor_WeaponVelocityCache). d_elev = Math_ElevationAngle_552E1(D) -
; Math_ElevationAngle_552E1(W) ; d_cap = Math_HeadingAngle_553CF(D) -
; Math_HeadingAngle_553CF(W), SANS ramener la difference a +/-180 (sub eax,[bp+var_54] puis
; Math_Square_54C39 directement) ; erreur = sqrt(d_cap^2 + d_elev^2) (Math_Square_54C39,
; Math_Sqrt_54BF1), en degres, angles MONDE (cap et elevation), pas dans le repere de l'avion.
; Consequences : pres de la verticale le cap devient instable ; si les deux caps sont de part
; et d'autre de +/-180, d_cap vaut pres de 360 et la qualite tombe.
; ==============================================================================================
AI_ComputeFireSolutionQuality_91DF	proc far		; CODE XREF: AI_BehaviorSelector+FCp

var_E8		= word ptr -0E8h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
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
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0E8h
		push	si
		push	di
		xor	si, si
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+287h], 0
		jnz	short loc_91F8
		jmp	loc_964B
; ���������������������������������������������������������������������������

loc_91F8:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+14j
		mov	di, es:[bx+287h]
		add	di, 12h
		mov	ax, es:[bx+102h]
		add	ax, 12h
		mov	[bp+var_4], ax
		mov	eax, [di]
		mov	bx, [bp+var_4]
		sub	eax, [bx]
		mov	[bp+var_D0], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_CC], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_C8], eax
		push	eax
		push	large [bp+var_CC]
		push	large [bp+var_D0]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_8], eax
		mov	[bp+var_D], 0
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+287h]
		mov	bx, es:[bx+287h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_DC], eax
		mov	eax, [di+4]
		mov	[bp+var_D8], eax
		mov	eax, [di+8]
		mov	[bp+var_D4], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		lea	ax, [bp+var_D0]
		push	ax
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	di, [bp+var_12+1]
		lea	ax, [bp+var_D0]
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		push	ss
		lea	ax, [bp+var_18]

loc_92C3:
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8

loc_92CC:
		mov	ax, [bp+var_18+1]

loc_92CF:
		mov	[bp+var_14], ax
		cmp	di, 5Ah	; 'Z'
		jl	short loc_92DA
		jmp	loc_963B
; ���������������������������������������������������������������������������

loc_92DA:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+F6j
		mov	ax, di
		imul	ax, 0Ah
		mov	bx, 23h	; '#'
		cwd

loc_92E3:
		idiv	bx
		mov	dx, 0Ah
		sub	dx, ax
		add	si, dx
		cmp	[bp+var_14], 32h ; '2'
		jle	short loc_92FD
		cmp	[bp+var_14], 82h ; '�'
		jge	short loc_92FD
		mov	[bp+var_D], 1

loc_92FD:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+111j
					; AI_ComputeFireSolutionQuality_91DF+118j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+1A2h], 800h
		jz	short loc_9315
		cmp	word ptr es:[bx+1A2h], 800h
		jz	short loc_9315
		jmp	loc_9558
; ���������������������������������������������������������������������������

loc_9315:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+128j
					; AI_ComputeFireSolutionQuality_91DF+131j
		mov	eax, [bp+var_8]
		cmp	eax, dword_7201C
		jl	short loc_9325
		mov	ax, 1
		jmp	short loc_9327
; ���������������������������������������������������������������������������

loc_9325:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+13Fj
		xor	ax, ax

loc_9327:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+144j
		or	al, al
		jz	short loc_932E
		jmp	loc_9639	; default
; ���������������������������������������������������������������������������

loc_932E:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+14Aj
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+287h]
		push	word ptr [bp+arg_0+2]
		push	bx
		push	ss
		lea	ax, [bp+var_E8]
		push	ax
		call	AI_Sensor_WeaponVelocityCache
		add	sp, 0Ah
		lea	ax, [bp+var_D0]
		push	ax
		push	ss
		lea	ax, [bp+var_40]
		push	ax
		call	Math_ElevationAngle_552E1
		add	sp, 6
		lea	ax, [bp+var_E8]
		push	ax
		push	ss
		lea	ax, [bp+var_44]
		push	ax
		call	Math_ElevationAngle_552E1
		add	sp, 6
		mov	eax, [bp+var_40]
		sub	eax, [bp+var_44]
		mov	[bp+var_48], eax
		mov	[bp+var_3C], eax
		lea	ax, [bp+var_D0]
		push	ax
		push	ss
		lea	ax, [bp+var_50]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		lea	ax, [bp+var_E8]
		push	ax
		push	ss
		lea	ax, [bp+var_54]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	eax, [bp+var_50]
		sub	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	[bp+var_4C], eax
		lea	ax, [bp+var_3C]
		push	ax
		push	ss
		lea	ax, [bp+var_60]
		push	ax
		call	Math_Square_54C39
		add	sp, 6
		lea	ax, [bp+var_4C]
		push	ax
		push	ss
		lea	ax, [bp+var_64]
		push	ax

loc_93CA:
		call	Math_Square_54C39
		add	sp, 6

loc_93D2:
		mov	eax, [bp+var_60]

loc_93D6:
		add	eax, [bp+var_64]
		mov	[bp+var_68], eax

loc_93DE:
		mov	[bp+var_6C], eax

loc_93E2:
		lea	ax, [bp+var_6C]
		push	ax
		push	ss
		lea	ax, [bp+var_5C]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		cmp	[bp+var_8], 0
		jle	short loc_93FF
		mov	ax, 1
		jmp	short loc_9401
; ���������������������������������������������������������������������������

loc_93FF:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+219j
		xor	ax, ax

loc_9401:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+21Ej
		or	al, al
		jz	short loc_9446
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+287h]
		mov	eax, [bx+20h]
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		lea	ax, [bp+var_78]
		push	ax
		push	ss
		lea	ax, [bp+var_7C]
		push	ax
		call	Math_ArcTan_54ADE
		add	sp, 6
		mov	eax, [bp+var_7C]
		jmp	short loc_9452
; ���������������������������������������������������������������������������

loc_9446:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+224j
		mov	[bp+var_80], 5A00h
		mov	eax, [bp+var_80]

loc_9452:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+265j
		mov	[bp+var_70], eax
		mov	eax, [bp+var_5C]
		sub	eax, [bp+var_70]
		mov	[bp+var_88], eax
		mov	[bp+var_84], eax
		cmp	[bp+var_84], 0
		jge	short loc_9475
		mov	ax, 1
		jmp	short loc_9477
; ���������������������������������������������������������������������������

loc_9475:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+28Fj
		xor	ax, ax

loc_9477:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+294j
		or	al, al
		jz	short loc_94CE
		mov	eax, [bp+var_84]
		shl	eax, 1
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	edx, eax
		mov	ecx, [bp+var_70]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_98], eax
		mov	eax, 800h
		sub	eax, [bp+var_98]
		mov	[bp+var_9C], eax

loc_94C3:
		mov	[bp+var_A0], eax

loc_94C8:
		mov	si, word ptr [bp+var_A0+1]
		jmp	short loc_9549
; ���������������������������������������������������������������������������

loc_94CE:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+29Aj
		mov	eax, [bp+var_70]

loc_94D2:
		shl	eax, 1

loc_94D5:
		mov	[bp+var_A4], eax
		mov	[bp+var_A8], eax
		mov	[bp+var_AC], 800h
		mov	eax, [bp+var_AC]
		mov	edx, eax
		mov	ecx, [bp+var_A8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_84]
		mov	edx, [bp+var_B4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_B8]
		mov	[bp+var_BC], eax
		mov	eax, 800h
		sub	eax, [bp+var_BC]
		mov	[bp+var_C0], eax
		mov	[bp+var_C4], eax
		mov	si, word ptr [bp+var_C4+1]

loc_9549:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+2EDj
		cmp	[bp+var_D], 0
		jnz	short loc_9552
		jmp	loc_963B
; ���������������������������������������������������������������������������

loc_9552:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+36Ej
		sub	si, 4
		jmp	loc_963B
; ���������������������������������������������������������������������������

loc_9558:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+133j
		cmp	[bp+var_D], 0
		jz	short loc_9561
		sub	si, 4

loc_9561:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+37Dj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1A2h]
		mov	[bp+var_2], ax
		mov	cx, 5		; switch 5 cases
		mov	bx, offset word_9651

loc_9572:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+39Ej
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_9582
		add	bx, 2
		loop	loc_9572
		jmp	loc_9639	; default
; ���������������������������������������������������������������������������

loc_9582:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+399j
		jmp	word ptr cs:[bx+0Ah] ; switch jump

loc_9586:				; DATA XREF: seg004:151Bo
		mov	eax, dword_72024 ; case	0x100
		mov	[bp+var_1C], eax
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_20]
		jl	short loc_95A5
		mov	ax, 1
		jmp	short loc_95A7
; ���������������������������������������������������������������������������

loc_95A5:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+3BFj
		xor	ax, ax

loc_95A7:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+3C4j
		or	al, al
		jz	short loc_95AE
		jmp	loc_962F
; ���������������������������������������������������������������������������

loc_95AE:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+3CAj
		mov	eax, dword_72020
		mov	[bp+var_24], eax
		shl	eax, 8
		mov	[bp+var_28], eax

loc_95BE:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_28]

loc_95C6:
		jge	short loc_95CD
		mov	ax, 1
		jmp	short loc_95CF
; ���������������������������������������������������������������������������

loc_95CD:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF:loc_95C6j
		xor	ax, ax

loc_95CF:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+3ECj
		or	al, al
		jz	short loc_963B
		cmp	[bp+var_D], 0
		jz	short loc_9634
		jmp	short loc_962F
; ���������������������������������������������������������������������������
		jmp	short loc_9634
; ���������������������������������������������������������������������������

loc_95DD:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF:loc_9582j
					; DATA XREF: seg004:151Bo
		mov	eax, dword_7202C ; case	0x1

loc_95E1:
		mov	[bp+var_2C], eax
		shl	eax, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_30]
		jl	short loc_95FC
		mov	ax, 1
		jmp	short loc_95FE
; ���������������������������������������������������������������������������

loc_95FC:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+416j
		xor	ax, ax

loc_95FE:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+41Bj
		or	al, al
		jz	short loc_9604
		jmp	short loc_962F
; ���������������������������������������������������������������������������

loc_9604:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+421j
		mov	eax, dword_72028
		mov	[bp+var_34], eax
		shl	eax, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_38]
		jge	short loc_9623
		mov	ax, 1
		jmp	short loc_9625
; ���������������������������������������������������������������������������

loc_9623:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+43Dj
		xor	ax, ax

loc_9625:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+442j
		or	al, al
		jz	short loc_963B
		cmp	[bp+var_D], 0
		jz	short loc_9634

loc_962F:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+3CCj
					; AI_ComputeFireSolutionQuality_91DF+3FAj ...
		sub	si, 0Ah
		jmp	short loc_963B
; ���������������������������������������������������������������������������

loc_9634:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+3F8j
					; AI_ComputeFireSolutionQuality_91DF+3FCj ...
		sub	si, 3
		jmp	short loc_963B
; ���������������������������������������������������������������������������

loc_9639:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+14Cj
					; AI_ComputeFireSolutionQuality_91DF+3A0j
		xor	si, si		; default

loc_963B:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+F8j
					; AI_ComputeFireSolutionQuality_91DF+370j ...
		cmp	si, 0Ah
		jle	short loc_9645
		mov	si, 0Ah
		jmp	short loc_964B
; ���������������������������������������������������������������������������

loc_9645:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+45Fj
		or	si, si
		jge	short loc_964B
		xor	si, si

loc_964B:				; CODE XREF: AI_ComputeFireSolutionQuality_91DF+16j
					; AI_ComputeFireSolutionQuality_91DF+464j ...
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
AI_ComputeFireSolutionQuality_91DF	endp

; ���������������������������������������������������������������������������
word_9651	dw	1,     2,     3,  100h ; DATA XREF: AI_ComputeFireSolutionQuality_91DF+390o
		dw   700h		; value	table for switch statement
		dw offset loc_95DD	; jump table for switch	statement
		dw offset loc_95DD
		dw offset loc_95DD
		dw offset loc_9586
		dw offset loc_9586

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 277L, LUE INTEGRALEMENT (2026-09-20). CHOIX DE L'ARME contre la cible aerienne
; (entite+0x287) ; renvoie un MASQUE DE TYPE D'ARME (bit = weapon_id - 1), range par
; AI_BehaviorSelector_8D30 dans entite+0x1A2. 0 = aucune arme. Sans cible : 0. Calcule le
; vecteur vers la cible et la distance d ; si le bit 0 de entite+0x28B est pose (defaut NUMS),
; teste par WeaponStation_FindLoadedCompatible les masques 1 (AIM-9J), 3 (AIM-9J/9M) et 0x700
; (AIM-120/SA-2/SA-6). Deux angles via Targeting_ComputeBearingElevation : di = ecart entre
; mon nez et la cible ; si = ecart entre le cap de la cible et la direction vers elle ;
; drapeau 'aspect croise' = 40 < si < 140. Cible = joueur, di < 30, si < 30 et d < dword_7202C
; (17700) : SetReference16(0x523A, mon noeud) (reference globale 'un IA est dans les six
; heures du joueur', role exact non lu). Si di >= 90 : 0. Sinon, dans l'ordre : d < 1800
; (dword_7201C) et canon (0x800) charge -> 0x800 ; d > dword_72020 (4000) et missile longue
; portee (0x700) -> 0x700 ; sinon mask 3 charge et d < dword_7202C (17700) -> 1 si aspect
; croise ET AIM-9J charge, sinon 3 ; sinon 0.
; ==============================================================================================
AI_SelectWeaponMask_9665	proc far		; CODE XREF: AI_BehaviorSelector+D4p

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
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_12		= word ptr -12h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		mov	[bp+var_2], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+287h], 0
		jnz	short loc_9680
		jmp	loc_98B6
; ���������������������������������������������������������������������������

loc_9680:				; CODE XREF: AI_SelectWeaponMask_9665+16j
		mov	si, es:[bx+287h]
		add	si, 12h
		mov	di, es:[bx+102h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_3C], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_38], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_34], eax
		push	eax
		push	large [bp+var_38]
		push	large [bp+var_3C]
		call	Math_VectorLength3D_Raw_5828E

loc_96C1:
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_6], eax
		mov	[bp+var_B], 0

loc_96D4:
		mov	[bp+var_C], 0
		mov	[bp+var_D], 0
		mov	[bp+var_E], 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		and	ax, 1
		or	al, al
		jz	short loc_972F
		push	1
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	[bp+var_B], al
		push	3
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	[bp+var_C], al
		push	700h
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	[bp+var_D], al

loc_972F:				; CODE XREF: AI_SelectWeaponMask_9665+88j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+287h]
		mov	bx, es:[bx+287h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_48], eax
		mov	eax, [si+4]
		mov	[bp+var_44], eax
		mov	eax, [si+8]
		mov	[bp+var_40], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	di, [bp+var_12+1]
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	si, [bp+var_16+1]
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+287h]
		cmp	ax, word_722E6
		jnz	short loc_97F5
		cmp	di, 1Eh
		jge	short loc_97F5
		cmp	si, 1Eh
		jge	short loc_97F5
		mov	eax, dword_7202C
		mov	[bp+var_1A], eax

loc_97C1:
		shl	eax, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_1E]
		jge	short loc_97D8

loc_97D3:
		mov	ax, 1
		jmp	short loc_97DA
; ���������������������������������������������������������������������������

loc_97D8:				; CODE XREF: AI_SelectWeaponMask_9665+16Cj
		xor	ax, ax

loc_97DA:				; CODE XREF: AI_SelectWeaponMask_9665+171j
		or	al, al
		jz	short loc_97F5
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+102h]
		mov	[bp+var_20], ax
		push	ax
		push	523Ah
		call	SetReference16
		add	sp, 4

loc_97F5:				; CODE XREF: AI_SelectWeaponMask_9665+148j
					; AI_SelectWeaponMask_9665+14Dj ...
		cmp	di, 5Ah	; 'Z'
		jl	short loc_97FD
		jmp	loc_98B6
; ���������������������������������������������������������������������������

loc_97FD:				; CODE XREF: AI_SelectWeaponMask_9665+193j
		cmp	si, 28h	; '('
		jle	short loc_980C
		cmp	si, 8Ch	; '�'
		jge	short loc_980C
		mov	[bp+var_E], 1

loc_980C:				; CODE XREF: AI_SelectWeaponMask_9665+19Bj
					; AI_SelectWeaponMask_9665+1A1j
		mov	eax, [bp+var_6]
		cmp	eax, dword_7201C
		jge	short loc_981C
		mov	ax, 1
		jmp	short loc_981E
; ���������������������������������������������������������������������������

loc_981C:				; CODE XREF: AI_SelectWeaponMask_9665+1B0j
		xor	ax, ax

loc_981E:				; CODE XREF: AI_SelectWeaponMask_9665+1B5j
		or	al, al
		jz	short loc_9841
		push	800h
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		or	al, al
		jz	short loc_9841
		mov	[bp+var_2], 800h
		jmp	short loc_98B6
; ���������������������������������������������������������������������������

loc_9841:				; CODE XREF: AI_SelectWeaponMask_9665+1BBj
					; AI_SelectWeaponMask_9665+1D3j
		mov	eax, dword_72020
		mov	[bp+var_24], eax
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_28]
		jle	short loc_9860
		mov	ax, 1
		jmp	short loc_9862
; ���������������������������������������������������������������������������

loc_9860:				; CODE XREF: AI_SelectWeaponMask_9665+1F4j
		xor	ax, ax

loc_9862:				; CODE XREF: AI_SelectWeaponMask_9665+1F9j
		or	al, al
		jz	short loc_9873
		cmp	[bp+var_D], 0
		jz	short loc_9873
		mov	[bp+var_2], 700h
		jmp	short loc_98B6
; ���������������������������������������������������������������������������

loc_9873:				; CODE XREF: AI_SelectWeaponMask_9665+1FFj
					; AI_SelectWeaponMask_9665+205j
		cmp	[bp+var_C], 0
		jz	short loc_98B6
		mov	eax, dword_7202C
		mov	[bp+var_2C], eax
		shl	eax, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_30]
		jge	short loc_9898
		mov	ax, 1
		jmp	short loc_989A
; ���������������������������������������������������������������������������

loc_9898:				; CODE XREF: AI_SelectWeaponMask_9665+22Cj
		xor	ax, ax

loc_989A:				; CODE XREF: AI_SelectWeaponMask_9665+231j
		or	al, al
		jz	short loc_98B6
		cmp	[bp+var_E], 0
		jz	short loc_98B1
		cmp	[bp+var_B], 0
		jz	short loc_98B1
		mov	[bp+var_2], 1
		jmp	short loc_98B6
; ���������������������������������������������������������������������������

loc_98B1:				; CODE XREF: AI_SelectWeaponMask_9665+23Dj
					; AI_SelectWeaponMask_9665+243j
		mov	[bp+var_2], 3

loc_98B6:				; CODE XREF: AI_SelectWeaponMask_9665+18j
					; AI_SelectWeaponMask_9665+195j ...
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
AI_SelectWeaponMask_9665	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 113 lignes - LUE INTEGRALEMENT (recherche de la semantique des champs NUMS non ronds, a
; la demande de Remi). CLASSIFICATION DE DISTANCE EN 4 PALIERS (0=hors-critere, 1=proche,
; 2=moyen, 3=loin) utilisant les constantes NUMS comme seuils, AVEC DEUX JEUX DE SEUILS
; DIFFERENTS SELON LE TYPE DE CIBLE (teste via des bits sur arg_4) : si arg_4 & 0x700 (une
; categorie de cible) : seuils dword_72020 (proche/moyen) et dword_72024 (moyen/loin). Si
; arg_4 & 0x3 (une AUTRE categorie de cible) : seuils dword_72028 et dword_7202C (meme role,
; jeu de seuils distinct). Retourne 0 si ni l'un ni l'autre bit n'est pose. Appelee par
; Targeting_AcquireBestThreat_3314 - CONFIRME que ces constantes NUMS servent a prioriser les
; menaces par bande de distance, avec un traitement different selon le type de cible (probable
; aeronef vs sol, ou ami vs ennemi - le sens precis des bits de arg_4 reste a determiner si
; necessaire).
; ==============================================================================================
AI_ClassifyDistanceBand_98BD	proc far		; CODE XREF: AI_MissileEvasionReaction_9A77+11Dp

var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 24h

loc_98C3:
		push	si
		push	di
		xor	dx, dx

loc_98C7:
		les	bx, [bp+arg_0]

loc_98CA:
		cmp	word ptr es:[bx+281h], 0
		jnz	short loc_98D5
		jmp	loc_9990
; ���������������������������������������������������������������������������

loc_98D5:				; CODE XREF: AI_ClassifyDistanceBand_98BD+13j
		mov	si, es:[bx+281h]
		add	si, 12h
		mov	di, es:[bx+102h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_18], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		push	eax
		push	large [bp+var_20]
		push	large [bp+var_24]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		sar	eax, 8
		mov	[bp+var_4], eax
		test	[bp+arg_4], 700h
		jz	short loc_9967
		cmp	eax, dword_72020
		jge	short loc_9958

loc_9953:				; CODE XREF: AI_ClassifyDistanceBand_98BD+BAj
		mov	dx, 1
		jmp	short loc_9990
; ���������������������������������������������������������������������������

loc_9958:				; CODE XREF: AI_ClassifyDistanceBand_98BD+94j
		mov	eax, [bp+var_4]
		cmp	eax, dword_72024
		jge	short loc_9989
		jmp	short loc_9984
; ���������������������������������������������������������������������������
		jmp	short loc_9989
; ���������������������������������������������������������������������������

loc_9967:				; CODE XREF: AI_ClassifyDistanceBand_98BD+8Dj
		test	[bp+arg_4], 3
		jz	short loc_998E
		mov	eax, [bp+var_4]
		cmp	eax, dword_72028
		jl	short loc_9953
		mov	eax, [bp+var_4]
		cmp	eax, dword_7202C
		jge	short loc_9989

loc_9984:				; CODE XREF: AI_ClassifyDistanceBand_98BD+A6j
		mov	dx, 2
		jmp	short loc_9990
; ���������������������������������������������������������������������������

loc_9989:				; CODE XREF: AI_ClassifyDistanceBand_98BD+A4j AI_ClassifyDistanceBand_98BD+A8j ...
		mov	dx, 3
		jmp	short loc_9990
; ���������������������������������������������������������������������������

loc_998E:				; CODE XREF: AI_ClassifyDistanceBand_98BD+AFj
		xor	dx, dx

loc_9990:				; CODE XREF: AI_ClassifyDistanceBand_98BD+15j AI_ClassifyDistanceBand_98BD+99j ...
		mov	ax, dx
		pop	di
		pop	si
		leave
		retf
AI_ClassifyDistanceBand_98BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,77L — appelée par sub_9A46 avec une valeur extraite via vtable — probable évaluation
; d'un paramètre de cible (type ou distance).
; ==============================================================================================
AI_EvalTargetAttribute	proc far		; CODE XREF: AI_QueryTargetField4B+29p
					; AI_MissileEvasionReaction_9A77+170p

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+281h], 0
		jz	short loc_99B6
		mov	bx, es:[bx+281h]
		mov	ax, [bx+55h]
		mov	bx, word ptr [bp+arg_0]
		cmp	ax, es:[bx+102h]
		jz	short loc_99DD

loc_99B6:				; CODE XREF: AI_EvalTargetAttribute+Cj
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 2
		jnz	short loc_99C7
		mov	byte ptr es:[bx+27Fh], 0

loc_99C7:				; CODE XREF: AI_EvalTargetAttribute+29j
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 281h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		jmp	short loc_9A44
; ���������������������������������������������������������������������������

loc_99DD:				; CODE XREF: AI_EvalTargetAttribute+1Ej
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+10Dh], 0
		cmp	word_70472, 14h
		jge	short loc_9A31
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr Pilot_SkillCheck_B0
		add	sp, 6
		or	al, al
		jz	short loc_9A31
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_RadarScanTarget
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9A31
		test	[bp+arg_4], 700h
		jz	short loc_9A25
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 2
		jmp	short loc_9A31
; ���������������������������������������������������������������������������

loc_9A25:				; CODE XREF: AI_EvalTargetAttribute+7Fj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 4

loc_9A31:				; CODE XREF: AI_EvalTargetAttribute+56j AI_EvalTargetAttribute+67j ...
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+175h]
		sar	eax, 8
		mov	es:[bx+109h], eax

loc_9A44:				; CODE XREF: AI_EvalTargetAttribute+45j
		pop	bp
		retf
AI_EvalTargetAttribute	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,26L — récupère un champ (+0x4B) via vtable de la cible pointée par +0x281, puis appelle
; sub_9996 avec cette valeur : requête d'un attribut de cible pour évaluation.
; ==============================================================================================
AI_QueryTargetField4B	proc far		; CODE XREF: AI_TopLevelThink+2DFp

var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+281h]
		mov	bx, es:[bx+281h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		mov	ax, es:[bx+4Bh]
		mov	[bp+var_2], ax
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_EvalTargetAttribute
		add	sp, 6
		leave
		retf
AI_QueryTargetField4B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 289L, LUE INTEGRALEMENT (2026-09-20). REACTION D'ESQUIVE D'UN MISSILE QUI ME VISE
; (ancien nom 'AI_EscortPriorityReactionHandler' FAUX : +0x281 n'est pas une reference
; d'escorte mais la menace missile posee par Targeting_AcquireBestThreat, et +0x27F==2 l'etat
; 'missile en approche'). Appelee en tete de
; AI_BehaviorStateMachine_WeightedOptionSelector_9D05, dans sa branche sans cible aerienne, et
; par AI_TopLevelThink. Renvoie 1 si elle a agi. (1) Si entite+0x281 est nul ou si le champ
; +0x55 du missile n'est plus mon noeud, ET +0x27F==2 : remet +0x27F et +0x108 a 0, vide
; +0x281 (SetReference) et renvoie 0. Sinon, elle n'agit que si +0x27F==2 et +0x281 non nul.
; (2) Vecteur vers le missile ; composante verticale remplacee selon mon altitude (+0x1A du
; noeud) comparee a dword_7203D : altitude <= seuil -> 2*seuil - altitude (monter), sinon
; seuil - altitude (descendre). (3) Bande de distance du missile par
; AI_ClassifyDistanceBand(entite, type d'arme du missile +0x4B) : 1 (proche) et 2 (moyen) : si
; le lanceur du missile (vtable+0x38) est le joueur et que mon camp (+0x50) vaut 1 (ami) :
; Radio_PlayMessage 0x0E vers le joueur (le missile vient du joueur) ; puis
; AI_EvalTargetAttribute. Bande 1 : composante verticale annulee puis manoeuvre
; perpendiculaire ; bande 2 : perpendiculaire en gardant l'altitude ; perpendiculaire =
; Vec_NegateSwapPair puis, si Angle_DeltaNormalized_A avec mon cap depasse 90 degres,
; inversion du signe (on tourne du cote qui demande le moins de virage). Bande 3 (loin) : pose
; +0x108=1 et inverse les 3 composantes = FUIR le missile. Bande 0 : renvoie 0. (4)
; AI_GuidanceCmd_FromOwnPos(entite, vecteur, 10) ; puis AI_ThrottleCmd_HUD avec la vitesse
; maximale (avion +0xB, +0x80) si le guidage renvoie non nul, sinon la vitesse de croisiere
; (+0x84) ; renvoie 1.
; ==============================================================================================
AI_MissileEvasionReaction_9A77	proc far		; CODE XREF: AI_TopLevelThink+2CEp
					; AI_BehaviorStateMachine_WeightedOptionSelector_9D05+2Ap	...

var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
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
		sub	sp, 34h
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+281h], 0
		jz	short loc_9A9C
		mov	bx, es:[bx+281h]
		mov	ax, [bx+55h]
		mov	bx, word ptr [bp+arg_0]
		cmp	ax, es:[bx+102h]
		jz	short loc_9ACC

loc_9A9C:				; CODE XREF: AI_MissileEvasionReaction_9A77+11j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 2
		jnz	short loc_9ACC
		mov	byte ptr es:[bx+27Fh], 0
		mov	byte ptr es:[bx+108h], 0
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 281h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_9AC7:				; CODE XREF: AI_MissileEvasionReaction_9A77+5Ej AI_MissileEvasionReaction_9A77+66j ...
		mov	al, 0
		jmp	loc_9D01
; ���������������������������������������������������������������������������

loc_9ACC:				; CODE XREF: AI_MissileEvasionReaction_9A77+23j AI_MissileEvasionReaction_9A77+2Ej
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 2
		jnz	short loc_9AC7
		cmp	word ptr es:[bx+281h], 0
		jz	short loc_9AC7
		les	bx, [bp+arg_0]
		mov	si, es:[bx+281h]
		add	si, 12h
		mov	di, es:[bx+102h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_34], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_30], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_2C], eax
		mov	bx, es:[bx+102h]
		mov	eax, [bx+1Ah]
		cmp	eax, dword_7203D
		jg	short loc_9B29
		mov	ax, 1
		jmp	short loc_9B2B
; ���������������������������������������������������������������������������

loc_9B29:				; CODE XREF: AI_MissileEvasionReaction_9A77+ABj
		xor	ax, ax

loc_9B2B:				; CODE XREF: AI_MissileEvasionReaction_9A77+B0j
		or	al, al
		jz	short loc_9B56
		mov	eax, dword_7203D
		shl	eax, 1
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 1Ah
		sub	eax, [si]
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		jmp	short loc_9B70
; ���������������������������������������������������������������������������

loc_9B56:				; CODE XREF: AI_MissileEvasionReaction_9A77+B6j
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 1Ah
		mov	eax, dword_7203D
		sub	eax, [si]
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax

loc_9B70:				; CODE XREF: AI_MissileEvasionReaction_9A77+DDj
		mov	[bp+var_2C], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+281h]
		mov	bx, es:[bx+281h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		mov	di, es:[bx+4Bh]
		push	di
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_ClassifyDistanceBand_98BD
		add	sp, 6
		mov	si, ax
		cmp	si, 1
		jz	short loc_9BA6
		cmp	si, 2
		jnz	short loc_9BED

loc_9BA6:				; CODE XREF: AI_MissileEvasionReaction_9A77+128j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+281h]
		mov	bx, es:[bx+281h]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_722E6
		jnz	short loc_9BE1

loc_9BBF:
		les	bx, [bp+arg_0]

loc_9BC2:
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 1
		jnz	short loc_9BE1
		push	0
		push	0Eh
		push	word_722E6
		push	large [bp+arg_0]
		call	Radio_PlayMessage
		add	sp, 0Ah

loc_9BE1:				; CODE XREF: AI_MissileEvasionReaction_9A77+146j
					; AI_MissileEvasionReaction_9A77+154j
		push	di
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_EvalTargetAttribute
		add	sp, 6

loc_9BED:				; CODE XREF: AI_MissileEvasionReaction_9A77+12Dj
		mov	ax, si
		cmp	ax, 1
		jz	short loc_9C04
		cmp	ax, 2
		jz	short loc_9C14
		cmp	ax, 3
		jnz	short loc_9C01
		jmp	loc_9C8F
; ���������������������������������������������������������������������������

loc_9C01:				; CODE XREF: AI_MissileEvasionReaction_9A77+185j
		jmp	loc_9AC7
; ���������������������������������������������������������������������������

loc_9C04:				; CODE XREF: AI_MissileEvasionReaction_9A77+17Bj
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_2C], eax

loc_9C14:				; CODE XREF: AI_MissileEvasionReaction_9A77+180j
		push	1
		lea	ax, [bp+var_34]
		push	ax
		call	Vec_NegateSwapPair
		add	sp, 4
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	eax, [bp+var_20]
		or	eax, eax
		jge	short loc_9C56
		neg	eax

loc_9C56:				; CODE XREF: AI_MissileEvasionReaction_9A77+1DAj
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		cmp	[bp+var_28], 5A00h
		jle	short loc_9C71
		mov	ax, 1
		jmp	short loc_9C73
; ���������������������������������������������������������������������������

loc_9C71:				; CODE XREF: AI_MissileEvasionReaction_9A77+1F3j
		xor	ax, ax

loc_9C73:				; CODE XREF: AI_MissileEvasionReaction_9A77+1F8j
		or	al, al
		jz	short loc_9CBE
		mov	eax, [bp+var_34]
		neg	eax
		mov	[bp+var_34], eax
		mov	eax, [bp+var_30]
		neg	eax
		mov	[bp+var_30], eax
		jmp	short loc_9CBE
; ���������������������������������������������������������������������������

loc_9C8F:				; CODE XREF: AI_MissileEvasionReaction_9A77+187j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+108h], 1
		mov	eax, [bp+var_34]
		neg	eax
		mov	[bp+var_34], eax
		mov	eax, [bp+var_30]
		neg	eax
		mov	[bp+var_30], eax
		mov	eax, [bp+var_2C]
		neg	eax
		mov	[bp+var_2C], eax
		jmp	short loc_9CBE
; ���������������������������������������������������������������������������
		jmp	loc_9AC7
; ���������������������������������������������������������������������������

loc_9CBE:				; CODE XREF: AI_MissileEvasionReaction_9A77+1FEj
					; AI_MissileEvasionReaction_9A77+216j ...
		push	large 0Ah
		lea	ax, [bp+var_34]
		push	ax
		push	large [bp+arg_0]
		call	AI_GuidanceCmd_FromOwnPos

loc_9CCE:
		add	sp, 0Ah
		or	al, al

loc_9CD3:
		jz	short loc_9CE4
		les	bx, [bp+arg_0]

loc_9CD8:
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+80h]
		jmp	short loc_9CF1
; ���������������������������������������������������������������������������

loc_9CE4:				; CODE XREF: AI_MissileEvasionReaction_9A77:loc_9CD3j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]

loc_9CF1:				; CODE XREF: AI_MissileEvasionReaction_9A77+26Bj
		push	eax
		push	large [bp+arg_0]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		mov	al, 1

loc_9D01:				; CODE XREF: AI_MissileEvasionReaction_9A77+52j
		pop	di
		pop	si
		leave
		retf
AI_MissileEvasionReaction_9A77	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, RELUE INTEGRALEMENT (2026-09-25). GESTIONNAIRE DE COMBAT, appele par le gestionnaire
; GOAL 4 (arg_4 = 0) et par Goal_ExecuteAction_A8AC (ordres detruire/defendre : arg_4 = 0 ;
; 0xAC : arg_4 = 1). arg_4 = nouvelle cible sol autorisee. (1) AI_MissileEvasionReaction_9A77
; ; (2) ciblage (Targeting_AcquireBestThreat, limite par Timer_OneShotEvent_A288 sur +0x174
; quand une menace existe deja) ; (3) sans cible aerienne +0x287 : esquive si menace missile
; +0x281, sinon noeud d'attaque au sol +0xD9 (methode +8) si cible sol +0x283 et arg_4, sinon
; renvoie 0 (le gestionnaire GOAL suivant prend la main) ; (4) avec cible aerienne et +0x27F
; <= 1 : AI_BehaviorSelector (tir et poursuite) ; s'il agit (bit de tir ou qualite de solution
; > 0), le comportement en cours +0x0D est ABANDONNE (NotifiableRef_DetachTarget_75661) et
; renvoie 1 ; (5) sinon comportement en cours : sa methode +0xC ; (6) sinon TOURNOI : entrees
; +0x202 (5 octets : noeud, poids signe), +0x200 entrees ; score = methode +4 (0 = exclue) +
; poids + bruit +/-1 (rand & 1), meilleur au-dessus de -1000 (0FC18h), perdants : noeud+2 = 0
; ; gagnant : methode +8 (qui s'empile en general comme comportement en cours). Contexte passe
; aux methodes : cible +0x287 et copie du vecteur +0x1A4. L'ancien resume (urgence carburant,
; +0x281 = escorte) etait faux. Detail : AI_TICK_CALL_GRAPH.md, 'GOAL et tournoi MVRS'.
; ==============================================================================================
AI_BehaviorStateMachine_WeightedOptionSelector_9D05	proc far		; CODE XREF: seg004:0756p Goal_ExecuteAction_A8AC+AAP ...

var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	di
		mov	[bp+var_A], 0
		xor	ax, ax
		mov	[bp+var_6], ax
		mov	[bp+var_8], ax
		mov	[bp+var_E], 200h
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_MissileEvasionReaction_9A77
		add	sp, 4
		or	al, al
		jz	short loc_9D3E

loc_9D39:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+132j
					; AI_BehaviorStateMachine_WeightedOptionSelector_9D05+15Dj ...
		mov	al, 1
		jmp	loc_9FFE
; ���������������������������������������������������������������������������

loc_9D3E:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+32j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+287h], 0
		jz	short loc_9D89
		mov	bx, es:[bx+287h]
		mov	si, [bx+51h]
		or	si, si
		jnz	short loc_9D58
		jmp	loc_9DDA
; ���������������������������������������������������������������������������

loc_9D58:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+4Ej
		push	si
		mov	bx, [si]
		call	dword ptr [bx+48h]
		pop	cx
		mov	si, ax
		or	si, si
		jz	short loc_9DDA
		mov	al, [si+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_9DDA
		mov	al, [bp+arg_4]
		push	ax
		push	large [bp+arg_0]
		call	Targeting_AcquireBestThreat
		add	sp, 6
		or	ax, ax
		jnz	short loc_9DDA
		jmp	loc_9FFC
; ���������������������������������������������������������������������������

loc_9D89:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+42j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+287h], 0
		jnz	short loc_9DAD
		cmp	word ptr es:[bx+281h], 0
		jnz	short loc_9DAD
		cmp	word ptr es:[bx+283h], 0
		jz	short loc_9DC3
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_9DC3

loc_9DAD:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+8Dj AI_BehaviorStateMachine_WeightedOptionSelector_9D05+95j
		mov	ax, word ptr [bp+arg_0]
		add	ax, 174h
		push	word ptr [bp+arg_0+2]
		push	ax
		nop
		push	cs
		call	near ptr Timer_OneShotEvent_A288
		add	sp, 4
		or	al, al
		jz	short loc_9DDA

loc_9DC3:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+9Dj AI_BehaviorStateMachine_WeightedOptionSelector_9D05+A6j
		mov	al, [bp+arg_4]
		push	ax

loc_9DC7:
		push	large [bp+arg_0]

loc_9DCB:
		call	Targeting_AcquireBestThreat

loc_9DD0:
		add	sp, 6
		or	ax, ax
		jnz	short loc_9DDA
		jmp	loc_9FFC
; ���������������������������������������������������������������������������

loc_9DDA:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+50j AI_BehaviorStateMachine_WeightedOptionSelector_9D05+5Ej ...
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+287h], 0
		jnz	short loc_9E3D
		cmp	word ptr es:[bx+281h], 0
		jz	short loc_9DFB
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr AI_MissileEvasionReaction_9A77
		add	sp, 4
		jmp	loc_9FFE
; ���������������������������������������������������������������������������

loc_9DFB:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+E6j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+283h], 0
		jnz	short loc_9E09
		jmp	loc_9FFC
; ���������������������������������������������������������������������������

loc_9E09:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+FFj
		cmp	[bp+arg_4], 0
		jnz	short loc_9E12
		jmp	loc_9FFC
; ���������������������������������������������������������������������������

loc_9E12:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+108j
		les	bx, es:[bx+0D9h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0D9h]
		les	bx, es:[bx+0D9h]

loc_9E2E:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+2F4j
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	loc_9D39
; ���������������������������������������������������������������������������
		jmp	loc_9FFC
; ���������������������������������������������������������������������������

loc_9E3D:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+DEj
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 1
		ja	short loc_9E78
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr AI_BehaviorSelector
		add	sp, 4
		or	al, al
		jz	short loc_9E78
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jnz	short loc_9E65
		jmp	loc_9D39
; ���������������������������������������������������������������������������

loc_9E65:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+15Bj
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4
		jmp	loc_9D39
; ���������������������������������������������������������������������������
		jmp	loc_9D39
; ���������������������������������������������������������������������������

loc_9E78:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+141j
					; AI_BehaviorStateMachine_WeightedOptionSelector_9D05+150j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_9EBE
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_26], eax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		call	PIT_ReadHighPrecision
		sub	al, byte ptr [bp+var_26]
		mov	bx, word_704E6
		mov	dl, [bx+5B56h]
		add	dl, al
		mov	[bx+5B56h], dl
		jmp	loc_9D39
; ���������������������������������������������������������������������������

loc_9EBE:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+17Cj
		call	PIT_ReadHighPrecision

loc_9EC3:
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_12], eax

loc_9ECB:
		mov	di, 0FC18h

loc_9ECE:
		mov	[bp+var_16], 0
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 1A4h
		mov	word ptr [bp+var_1E+2],	ax
		mov	word ptr [bp+var_1E], dx
		les	si, [bp+var_1E]
		mov	eax, es:[si]
		mov	[bp+var_32], eax
		mov	eax, es:[si+4]
		mov	[bp+var_2E], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2A], eax
		lea	ax, [bp+var_32]
		mov	[bp+var_8], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+287h]
		mov	[bp+var_A], ax
		mov	[bp+var_22], 200h
		mov	eax, [bp+var_22]
		mov	[bp+var_4], eax
		xor	si, si
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 202h
		mov	word ptr [bp+var_1A+2],	ax
		mov	word ptr [bp+var_1A], dx
		jmp	loc_9FC4
; ���������������������������������������������������������������������������

loc_9F39:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+2C9j
		les	bx, [bp+var_1A]
		cmp	dword ptr es:[bx], 0
		jz	short loc_9FBF
		les	bx, es:[bx]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+var_1A]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	byte ptr [bp+var_26+2],	al
		cmp	byte ptr [bp+var_26+2],	0
		jz	short loc_9FBF
		call	CRT_Rand
		test	ax, 1
		jz	short loc_9F7A
		mov	cx, 1
		jmp	short loc_9F7D
; ���������������������������������������������������������������������������

loc_9F7A:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+26Ej
		mov	cx, 0FFFFh

loc_9F7D:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+273j
		mov	al, byte ptr [bp+var_26+2]
		mov	ah, 0
		les	bx, [bp+var_1A]
		push	ax
		mov	al, es:[bx+4]
		cbw
		pop	dx
		add	dx, ax
		add	cx, dx
		cmp	cx, di
		jle	short loc_9FB3
		cmp	[bp+var_16], 0
		jz	short loc_9FA4
		les	bx, [bp+var_16]
		mov	word ptr es:[bx+2], 0

loc_9FA4:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+294j
		mov	di, cx
		les	bx, [bp+var_1A]
		mov	eax, es:[bx]
		mov	[bp+var_16], eax
		jmp	short loc_9FBF
; ���������������������������������������������������������������������������

loc_9FB3:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+28Dj
		les	bx, [bp+var_1A]
		les	bx, es:[bx]
		mov	word ptr es:[bx+2], 0

loc_9FBF:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+23Cj
					; AI_BehaviorStateMachine_WeightedOptionSelector_9D05+264j ...
		inc	si
		add	word ptr [bp+var_1A], 5

loc_9FC4:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+231j
		les	bx, [bp+arg_0]
		cmp	es:[bx+200h], si
		jle	short loc_9FD1
		jmp	loc_9F39
; ���������������������������������������������������������������������������

loc_9FD1:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+2C7j
		cmp	[bp+var_16], 0
		jz	short loc_9FFC
		call	PIT_ReadHighPrecision
		sub	al, byte ptr [bp+var_12]
		mov	bx, word_704E6
		mov	dl, [bx+5B60h]
		add	dl, al
		mov	[bx+5B60h], dl
		lea	ax, [bp+var_A]
		push	ax
		push	large [bp+var_16]
		les	bx, [bp+var_16]
		jmp	loc_9E2E
; ���������������������������������������������������������������������������

loc_9FFC:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+81j AI_BehaviorStateMachine_WeightedOptionSelector_9D05+D2j ...
		mov	al, 0

loc_9FFE:				; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+36j AI_BehaviorStateMachine_WeightedOptionSelector_9D05+F3j
		pop	di
		pop	si
		leave
		retf
AI_BehaviorStateMachine_WeightedOptionSelector_9D05	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 232 lignes (methode de vtable, DATA XREF seg339:0128) - JAMAIS DOCUMENTEE AVANT,
; trouvee en parcourant seg004 a la recherche de labels loc_ references par vtable. RESOUT
; PLUSIEURS INCONNUES PRECEDENTES : (1) utilise entite+0x139 (une des 3 constantes du
; constructeur AIEntity_Construct_74B43, valeur 30000, jamais expliquee avant) comme SEUIL DE
; DISTANCE (echelle 24.8) compare a la distance reelle calculee entre le joueur
; (word_722E6+0x12) et l'objet lie (entite+0x102+0x12), via Math_VectorLength3D_Raw_5828E -
; CONFIRME que +0x139 est un seuil de proximite radio. (2) etablit une reference faible sur
; entite+0x289 (un des 5 nouveaux champs decouverts dans AIEntity_Destruct_74E1C, jamais
; expliques avant) via SetReference_3A44E. (3) declenche des CALLOUTS RADIO
; (Radio_PlayMessage_CB45, meme fonction que Goal_ActiveWingmanEngagement_878F) avec plusieurs
; codes distincts (0x13, 7, 6, 1) selon la condition qui a matche - un vrai systeme de
; 'reactions radio de proximite/etat'. Logique complexe : appelle deux methodes virtuelles sur
; un objet parametre (si=[bp+0xA]) - [vtable+0x38] puis [vtable+0]/[vtable+0x34] - comparant
; le resultat a des codes specifiques (8, 0xD=13) ; verifie aussi le champ +0x11 d'un objet
; resolu via une troisieme methode virtuelle (di->[vtable+0]) contre la valeur 2 avant le
; calcul de distance. Pose aussi deux nouveaux drapeaux globaux (byte_6E4BC, byte_6E4BD) et un
; troisieme (byte_6E4C3) selon les branches empruntees. Appelle egalement sub_43D0F et
; sub_CC7A (codes 7/6) - role de ces deux dernieres non trace en detail.
; ==============================================================================================
AI_ProximityRadioCalloutTrigger_A002:				; DATA XREF: seg339:0128o
		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+0Ah]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		mov	di, ax
		les	bx, [bp+6]
		mov	bx, es:[bx+102h]
		mov	al, [bx+50h]
		mov	[bp-2],	al
		cmp	word_722E6, 0
		jnz	short loc_A02E
		jmp	loc_A1DB
; ���������������������������������������������������������������������������

loc_A02E:				; CODE XREF: seg004:1EE9j
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_A041
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_A043
; ���������������������������������������������������������������������������

loc_A041:				; CODE XREF: seg004:1EF6j
		mov	al, 17h

loc_A043:				; CODE XREF: seg004:1EFFj
		mov	[bp-4],	al
		mov	ah, 0
		cmp	ax, 8
		jz	short loc_A052
		cmp	ax, 0Dh
		jnz	short loc_A073

loc_A052:				; CODE XREF: seg004:1F0Bj
		mov	[bp-6],	di
		push	word ptr [bp-6]
		mov	ax, [bp+6]
		add	ax, 289h
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+6]
		or	byte ptr es:[bx+28Dh], 80h

loc_A073:				; CODE XREF: seg004:1F10j
		cmp	di, word_722E6
		jnz	short loc_A09C
		cmp	si, di
		jz	short loc_A09C
		cmp	byte ptr [bp-2], 0FFh
		jnz	short loc_A08B
		mov	byte_6E4BC, 1
		jmp	loc_A1DB
; ���������������������������������������������������������������������������

loc_A08B:				; CODE XREF: seg004:1F41j
		cmp	byte ptr [bp-2], 1
		jz	short loc_A094
		jmp	loc_A1DB
; ���������������������������������������������������������������������������

loc_A094:				; CODE XREF: seg004:1F4Fj
		mov	byte_6E4BD, 1
		jmp	loc_A1DB
; ���������������������������������������������������������������������������

loc_A09C:				; CODE XREF: seg004:1F37j seg004:1F3Bj
		cmp	si, di
		jnz	short loc_A0A3
		jmp	loc_A1AF
; ���������������������������������������������������������������������������

loc_A0A3:				; CODE XREF: seg004:1F5Ej
		cmp	byte ptr [bp-2], 1
		jz	short loc_A0AC
		jmp	loc_A1DB
; ���������������������������������������������������������������������������

loc_A0AC:				; CODE XREF: seg004:1F67j
		or	di, di
		jnz	short loc_A0B3
		jmp	loc_A157
; ���������������������������������������������������������������������������

loc_A0B3:				; CODE XREF: seg004:1F6Ej
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	[bp-8],	dx
		mov	[bp-0Ah], ax
		les	bx, [bp-0Ah]
		cmp	byte ptr es:[bx+11h], 2
		jz	short loc_A0CC
		jmp	loc_A157
; ���������������������������������������������������������������������������

loc_A0CC:				; CODE XREF: seg004:1F87j
		mov	si, word_722E6
		add	si, 12h
		mov	eax, [si]
		mov	[bp-22h], eax
		mov	eax, [si+4]
		mov	[bp-1Eh], eax
		mov	eax, [si+8]
		mov	[bp-1Ah], eax
		les	bx, [bp+6]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [si]
		sub	[bp-22h], eax
		mov	eax, [si+4]
		sub	[bp-1Eh], eax
		mov	eax, [si+8]
		sub	[bp-1Ah], eax
		push	large dword ptr	[bp-1Ah]
		push	large dword ptr	[bp-1Eh]
		push	large dword ptr	[bp-22h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Eh], eax
		mov	[bp-12h], eax
		les	bx, [bp+6]
		mov	eax, es:[bx+139h]
		mov	[bp-16h], eax
		shl	eax, 8
		cmp	eax, [bp-12h]
		jle	short loc_A148
		mov	ax, 1
		jmp	short loc_A14A
; ���������������������������������������������������������������������������

loc_A148:				; CODE XREF: seg004:2001j
		xor	ax, ax

loc_A14A:				; CODE XREF: seg004:2006j
		or	al, al
		jnz	short loc_A151
		jmp	loc_A1DB
; ���������������������������������������������������������������������������

loc_A151:				; CODE XREF: seg004:200Cj
		push	0
		push	13h
		jmp	short loc_A19D
; ���������������������������������������������������������������������������

loc_A157:				; CODE XREF: seg004:1F70j seg004:1F89j
		les	bx, [bp+6]
		mov	bx, es:[bx+102h]
		push	large dword ptr	[bx+5Eh]
		call	Roster_SumAttributeB
		add	sp, 4
		or	ax, ax
		jz	short loc_A187
		push	7
		push	large dword ptr	[bp+6]
		call	Radio_CanPlayMessage
		add	sp, 6
		or	al, al
		jz	short loc_A187
		push	1
		push	7
		jmp	short loc_A19D
; ���������������������������������������������������������������������������

loc_A187:				; CODE XREF: seg004:202Dj seg004:203Fj
		push	6
		push	large dword ptr	[bp+6]
		call	Radio_CanPlayMessage
		add	sp, 6
		or	al, al
		jz	short loc_A1DB
		push	1
		push	6

loc_A19D:				; CODE XREF: seg004:2015j seg004:2045j
		push	word_722E6
		push	large dword ptr	[bp+6]
		call	Radio_PlayMessage
		add	sp, 0Ah
		jmp	short loc_A1DB
; ���������������������������������������������������������������������������

loc_A1AF:				; CODE XREF: seg004:1F60j
		cmp	byte ptr [bp-2], 1
		jnz	short loc_A1D0
		cmp	word_722E6, 0
		jz	short loc_A1D0
		push	0
		push	6

loc_A1C0:
		push	word_722E6

loc_A1C4:
		push	large dword ptr	[bp+6]

loc_A1C8:
		call	Radio_PlayMessage

loc_A1CD:
		add	sp, 0Ah

loc_A1D0:				; CODE XREF: seg004:2073j seg004:207Aj
		cmp	si, word_722E6

loc_A1D4:
		jnz	short loc_A1DB
		mov	byte_6E4C3, 1

loc_A1DB:				; CODE XREF: seg004:1EEBj seg004:1F48j ...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 57 lignes (methode de vtable, DATA XREF seg339:012C) - JAMAIS DOCUMENTEE AVANT, trouvee
; et transcrite par Remi en parcourant seg004. Efface le bit 2 de flags_75 sur l'avion lie
; (entite+0xB) - le bit 'aerofrein' deja documente en §7 de AI_SYSTEM.md. Propage deux AUTRES
; bits de flags_75 (bits 0 et 1, deja documentes comme 'volets' et 'aerofrein' - a reverifier
; lequel exactement compte tenu de l'ordre de lecture ici) vers les bits 4 et 5 d'un champ sur
; un troisieme objet (entite+7, dereference, champ +0x1C) - un miroir/synchronisation d'etat
; avion vers un objet lie distinct. Pose entite_avion+0x68=0xFF (probable sentinelle 'timer
; remis a neuf', a verifier). Si un argument (arg_2, [bp+0xA]) est non-nul, appelle
; Targeting_AcquireBestThreat(entite, 0). Si le bit 3 de entite+0x28B est pose ET entite+0x27F
; est non-nul, appelle Goal_FollowAllyExec(entite, arg_1) - CONFIRME un point d'entree
; supplementaire vers le comportement d'escorte, distinct de
; Goal_ActiveWingmanEngagement_878F. Termine en remettant a zero le champ +0x59 de l'objet lie
; (entite+0x102).
; ==============================================================================================
AI_PropagateAircraftFlagsAndFollowGate_A1DF:				; DATA XREF: seg339:012Co
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+75h], 0FBh
		mov	bx, [bp+6]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 1
		and	ax, 1
		and	ax, 1
		mov	bx, [bp+6]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0EFh
		shl	al, 4
		or	es:[bx+1Ch], al
		les	bx, [bp+6]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		and	ax, 1
		mov	bx, [bp+6]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		les	bx, [bp+6]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		cmp	byte ptr [bp+0Ah], 0
		jz	short loc_A254
		push	0
		push	large dword ptr	[bp+6]
		call	Targeting_AcquireBestThreat
		add	sp, 6

loc_A254:				; CODE XREF: seg004:2104j
		les	bx, [bp+6]
		mov	al, es:[bx+28Bh]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_A27A
		cmp	byte ptr es:[bx+27Fh], 0
		jz	short loc_A27A
		push	word ptr [bp+8]
		push	bx
		call	Goal_FollowAllyExec
		add	sp, 4

loc_A27A:				; CODE XREF: seg004:2124j seg004:212Cj
		les	bx, [bp+6]
		mov	bx, es:[bx+102h]
		mov	byte ptr [bx+59h], 0
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,27L — vérifie/positionne un bit d'événement one-shot sur un petit objet (offset 0,
; bit0), calcule un compte à rebours (dword+1 >> 8 ET masque octet+5) : minuteur générique
; 'événement écoulé' (bit1).
; ==============================================================================================
Timer_OneShotEvent_A288	proc far		; CODE XREF: AI_BehaviorStateMachine_WeightedOptionSelector_9D05+B4p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	cl, 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A2B9
		mov	eax, es:[bx+1]
		sar	eax, 8
		movzx	edx, byte ptr es:[bx+5]
		test	eax, edx
		jnz	short loc_A2B9
		or	byte ptr es:[bx], 1
		mov	cx, 1

loc_A2B9:				; CODE XREF: Timer_OneShotEvent_A288+14j Timer_OneShotEvent_A288+28j
		mov	al, cl
		pop	bp
		retf
Timer_OneShotEvent_A288	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,32L — variante de sub_A288 sur bit3/bit4, avec division supplémentaire (sar dx,1) sur le
; masque : minuteur générique 'événement écoulé' (bit3), période différente.
; ==============================================================================================
Timer_OneShotEvent_A2BD	proc far		; CODE XREF: AI_EngageAttackerReaction_E246+28P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_A2C0:
		mov	cl, 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		shr	ax, 3
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A2F5
		mov	eax, es:[bx+1]
		sar	eax, 8
		mov	dl, es:[bx+5]
		mov	dh, 0
		sar	dx, 1
		movsx	edx, dx
		test	eax, edx
		jnz	short loc_A2F5
		or	byte ptr es:[bx], 4
		mov	cx, 1

loc_A2F5:				; CODE XREF: Timer_OneShotEvent_A2BD+15j Timer_OneShotEvent_A2BD+2Fj
		mov	al, cl
		pop	bp
		retf
Timer_OneShotEvent_A2BD	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 7 lignes (methode de vtable, DATA XREF seg339:4D98) - JAMAIS DOCUMENTEE AVANT. Triviale
; : remet a zero dword_6D3BE (le SCORE DE MENACE CALCULE PAR AIEntity_MasterTick_5ACC, deja
; documente en §6 - 'word_6D3BC' y est mentionne mais ce dword_6D3BE voisin est probablement
; un champ associe/etendu). Aucun autre effet.
; ==============================================================================================
AI_ResetThreatScoreGlobal_A2F9:				; DATA XREF: seg339:4D98o
		push	bp
		mov	bp, sp

loc_A2FC:
		mov	dword_6D3BE, 0
		pop	bp
		retf
seg004		ends
