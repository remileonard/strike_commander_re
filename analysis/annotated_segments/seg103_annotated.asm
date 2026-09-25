seg103		segment	byte public 'CODE' use16
		assume cs:seg103
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,52L — résout l'orientation (vtable[0x34]) et compare un compteur global (dword_72A2C) :
; test d'état lié au vecteur d'accélération globale (probable vent global actif/inactif).
; ==============================================================================================
Physics_TestGlobalWindActive	proc far		; CODE XREF: UIScreen_RenderOrLayoutList_54503:loc_546F2P

arg_0		= word ptr  6

		push	bp

loc_47FCE:
		mov	bp, sp
		push	si

loc_47FD1:
		mov	si, [bp+arg_0]

loc_47FD4:
		push	si

loc_47FD5:
		mov	bx, [si+2]
		call	dword ptr [bx+34h]
		pop	cx

loc_47FDC:
		cmp	dword_72A2C, 0

loc_47FE2:
		jnz	short loc_47FE9

loc_47FE4:
		mov	ax, 1

loc_47FE7:
		jmp	short loc_47FEB
; ���������������������������������������������������������������������������

loc_47FE9:				; CODE XREF: Physics_TestGlobalWindActive:loc_47FE2j
		xor	ax, ax

loc_47FEB:				; CODE XREF: Physics_TestGlobalWindActive:loc_47FE7j
		or	al, al
		jz	short loc_47FF3
		mov	al, 1
		jmp	short loc_47FF5
; ���������������������������������������������������������������������������

loc_47FF3:				; CODE XREF: Physics_TestGlobalWindActive+20j
		mov	al, 0

loc_47FF5:				; CODE XREF: Physics_TestGlobalWindActive+24j
		pop	si
		pop	bp
		retf
Physics_TestGlobalWindActive	endp

; ���������������������������������������������������������������������������

loc_47FF8:				; CODE XREF: seg082:12F1J
					; DATA XREF: seg339:off_6F376o
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		add	dx, 20h	; ' '

loc_48011:
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		les	bx, [bp-8]

loc_4801A:
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		mov	eax, [bp+6]
		mov	[bp-0Ch], eax
		mov	di, si
		add	di, 6Dh	; 'm'
		mov	bx, [si]

loc_48031:
		mov	eax, [bx+4]

loc_48035:
		add	eax, [di]
		mov	[bp-10h], eax
		mov	[bp-14h], eax
		add	eax, [bp-4]
		mov	[bp-18h], eax
		mov	bx, [bp-0Ch]
		mov	[bx], eax
		mov	es, word ptr [bp-0Ah]
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,54L — manipule directement flags_75 : bit0 ajoute le champ +0x37, bit2 ajoute +0x3B,
; résultat multiplié par un paramètre (+0x10+0x10) : calcul d'une traînée (drag) intégrant
; deux états de flags_75 bit0/bit2 = aérofreins sortis et train d'atterrissage sorti (confirmé
; sur sessions précédentes) — PAS un boost moteur, correction d'une erreur d'interprétation
; précédente.
; ==============================================================================================
Aero_ComputeDragFromFlags75	proc far		; CODE XREF: Aero_ComputeDragWithFeedback_48400+5Dp

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 100h
		mov	al, [si+75h]
		and	ax, 1
		or	al, al
		jz	short loc_48084
		mov	di, si
		add	di, 37h	; '7'
		mov	eax, [di]
		add	[bp+var_4], eax

loc_48084:				; CODE XREF: Aero_ComputeDragFromFlags75+1Bj
		mov	al, [si+75h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_4809D
		mov	di, si
		add	di, 3Bh	; ';'
		mov	eax, [di]
		add	[bp+var_4], eax

loc_4809D:				; CODE XREF: Aero_ComputeDragFromFlags75+34j
		mov	si, [si+10h]
		add	si, 10h
		mov	eax, [bp+var_4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax

loc_480C0:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Aero_ComputeDragFromFlags75	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg103 L194-246. Nom hérité 'RollCoeff' FAUX : calcule l'INCIDENCE EFFECTIVE (pitch),
; pas du roulis. alpha_eff = Aero_FlowAngle_AoA(si) + si[0x4C] (calage d'aile / alpha portance
; nulle, u8, TOUJOURS ajouté, <<8) + si[0x4D] (incrément de portance des volets, u8, ajouté
; SEULEMENT si flags_75.bit1). Ce ne sont PAS des trims pilote (le jeu est en accès direct sur
; les axes, pas de trim) : constantes aéro de la cellule issues du chunk JDYN. Alimente la
; magnitude de portance (Aero_ComputeLiftAndSideForce) et le terme induit de
; Aero_ComputeMomentsWithFeedback.
; ==============================================================================================
Aero_ComputeAoAWithTrim_480CA	proc far		; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+21p
					; Aero_ComputeDragWithFeedback_48400+26p

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	ss

loc_480D6:
		lea	ax, [bp+var_4]
		push	ax
		call	Aero_FlowAngle_AoA_469FE

loc_480DF:
		add	sp, 6
		mov	al, [si+4Ch]
		mov	ah, 0
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		add	[bp+var_4], eax
		mov	al, [si+75h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_48118
		mov	al, [si+4Dh]
		mov	ah, 0
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		add	[bp+var_4], eax

loc_48118:				; CODE XREF: Aero_ComputeAoAWithTrim_480CA+37j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Aero_ComputeAoAWithTrim_480CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg103 L261-593. Nom hérité 'DetectControlSaturation' trompeur : c'est le GÉNÉRATEUR DE
; PORTANCE + FORCE LATÉRALE (repère corps), terme 'satur' de Aero_SumLinearForces. v_corps =
; Physics_ResolveWindVectorCached([A]) ; alpha_eff = Aero_ComputeAoAWithTrim(si) (borné
; ±(si[0x4B]<<8) = alpha de décrochage / Cl max) ; beta = Aero_FlowAngle_Sideslip(si) ; q =
; Aero_DynamicPressure. PORTANCE = (si[0x61]·dword_72A24·alpha_eff·q) · normalize(0,
; -v_corps.c2, v_corps.c1)  ~ vers +c2 (haut corps). FORCE LATÉRALE = (si[0x61]>>2 ·c_beta·q)
; · normalize(v_corps.c1, -v_corps.c0, 0). Sortie = somme des deux (buffer 0xC). Effet de bord
; : si |alpha_eff| > seuil si[0x4B] ET difficulté word_70466>10 ET joueur -> flags_75.bit6
; (alerte) + portance mise à zéro (départ/décrochage). normalize = Vector_Normalize3D_559BB /
; Vector_NormalizeInPlace_5593A (ce sont des NORMALISATIONS, pas des rotations). Detail :
; analysis/DATA_MODEL.md 6.2.
; ==============================================================================================
Aero_ComputeLiftAndSideForce_4812B	proc far		; CODE XREF: Aero_SumLinearForces_48639+69p

var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
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
var_1E		= word ptr -1Eh
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
		sub	sp, 56h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	word ptr [si]
		push	ss
		lea	ax, [bp+var_32]
		push	ax

loc_4813D:
		call	Physics_ResolveWindVectorCached_4643B

loc_48142:
		add	sp, 6
		push	si
		push	ss

loc_48147:
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr Aero_ComputeAoAWithTrim_480CA
		add	sp, 6
		push	si
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	Aero_FlowAngle_Sideslip_46AB5
		add	sp, 6
		mov	eax, [bp+var_4]
		or	eax, eax
		jge	short loc_4816C
		neg	eax

loc_4816C:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+3Cj
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		or	eax, eax
		jge	short loc_4817C
		neg	eax

loc_4817C:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+4Cj
		mov	[bp+var_10], eax
		push	word ptr [si+10h]
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	Aero_DynamicPressure_46D13
		add	sp, 6
		mov	eax, [bp+var_14]
		sar	eax, 8
		mov	[bp+var_14], eax
		mov	di, si
		add	di, 61h	; 'a'
		mov	eax, [di]
		mov	[bp+var_18], eax
		sar	eax, 2
		mov	[bp+var_18], eax
		mov	al, [si+4Bh]
		mov	ah, 0
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		shl	eax, 8

loc_481C1:
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_1C]
		jle	short loc_48211

loc_481CF:
		cmp	word_70466, 0Ah

loc_481D4:
		jbe	short loc_48211
		cmp	byte_72354, 0

loc_481DB:
		jz	short loc_48211
		mov	bx, [si]
		mov	ax, [bx+2]
		cmp	ax, word_722E6
		jnz	short loc_48211
		xor	eax, eax
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		mov	al, [bx+20h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+75h], 0BFh
		shl	al, 6
		or	[si+75h], al
		jmp	loc_482E7
; ���������������������������������������������������������������������������

loc_48211:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+A2j
					; Aero_ComputeLiftAndSideForce_4812B:loc_481D4j	...
		mov	eax, [bp+var_4]

loc_48215:
		cmp	eax, [bp+var_1C]

loc_48219:
		jle	short loc_48221
		mov	eax, [bp+var_1C]
		jmp	short loc_48235
; ���������������������������������������������������������������������������

loc_48221:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B:loc_48219j
		mov	eax, [bp+var_1C]

loc_48225:
		neg	eax
		cmp	eax, [bp+var_4]
		jle	short loc_48239
		mov	eax, [bp+var_1C]
		neg	eax

loc_48235:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+F4j
		mov	[bp+var_4], eax

loc_48239:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+101j
		mov	di, si

loc_4823B:
		add	di, 61h	; 'a'
		mov	eax, [di]

loc_48241:
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	edx, dword_72A24
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	[bp+var_3E], 0
		mov	eax, [bp+var_2A]
		neg	eax
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_36], eax
		lea	ax, [bp+var_3E]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp+var_3E]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3A]
		mov	edx, [bp+var_26]

loc_482C3:
		imul	edx

loc_482C6:
		shrd	eax, edx, 8

loc_482CB:
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_36]

loc_482D3:
		mov	edx, [bp+var_26]
		imul	edx

loc_482DA:
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		and	byte ptr [si+75h], 0BFh

loc_482E7:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+E3j
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_1C]
		jle	short loc_48303
		xor	eax, eax
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax
		mov	[bp+var_4A], eax
		jmp	loc_48394
; ���������������������������������������������������������������������������

loc_48303:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+1C4j
		mov	eax, [bp+var_18]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]

loc_4830F:
		mov	edx, [bp+var_8]
		imul	edx

loc_48316:
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8

loc_4832F:
		mov	[bp+var_26], eax

loc_48333:
		mov	eax, [bp+var_2E]
		mov	[bp+var_4A], eax

loc_4833B:
		mov	eax, [bp+var_32]

loc_4833F:
		neg	eax

loc_48342:
		mov	[bp+var_46], eax
		mov	[bp+var_42], 0
		lea	ax, [bp+var_4A]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp+var_4A]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_42]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax

loc_48394:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+1D5j
		mov	eax, [bp+arg_0]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_3E]
		add	eax, [bp+var_4A]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_3A]
		add	eax, [bp+var_46]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_36]
		add	eax, [bp+var_42]
		mov	[bp+var_4E], eax
		cmp	word ptr [bp+var_22], 0
		jz	short loc_483CB
		mov	ax, word ptr [bp+var_22]
		jmp	short loc_483D6
; ���������������������������������������������������������������������������

loc_483CB:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+299j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx

loc_483D3:
		mov	word ptr [bp+var_22], ax

loc_483D6:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B+29Ej
		or	ax, ax

loc_483D8:
		jz	short loc_483F6

loc_483DA:
		mov	bx, word ptr [bp+var_22]
		mov	eax, [bp+var_56]

loc_483E1:
		mov	[bx], eax

loc_483E4:
		mov	eax, [bp+var_52]
		mov	[bx+4],	eax
		mov	eax, [bp+var_4E]
		mov	[bx+8],	eax
		jmp	short $+2

loc_483F6:				; CODE XREF: Aero_ComputeLiftAndSideForce_4812B:loc_483D8j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Aero_ComputeLiftAndSideForce_4812B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg103 L606-853. Ex-'ComputeMomentsWithFeedback'. Produit le VECTEUR DE FORCE DE
; TRAÎNÉE (repère corps), terme 'aero' de Aero_SumLinearForces. q =
; Aero_DynamicPressure(&si[0x10]). mag = q·[ si[0x5D]·alpha_eff² + (si[0x5D]>>3)·c_beta² +
; drag75 ] ; alpha_eff = Aero_ComputeAoAWithTrim ; c_beta = Aero_FlowAngle_Sideslip ; drag75 =
; Aero_ComputeDragFromFlags75 = (0x100 + si[0x37]·bit0 aérofrein + si[0x3B]·bit2
; train)·[[si+0x10]+0x10]. Si au sol (A[0x20]) : mag += (si[0x3F]·256 + si[0x43]·256·bit0) mis
; à l'échelle par flux latéral. Direction = Vector_Normalize3D_559BB(-v_corps) = unitaire
; opposé au flux, en repère CORPS. Sortie = dir·mag écrit dans [si+0x10]+4..+0xC. C'est la
; TRAÎNÉE le long de la trajectoire ; sa composante c2 (quand incidence != 0) apporte une
; portance secondaire, mais la portance principale vient de Aero_ComputeLiftAndSideForce.
; Detail : analysis/DATA_MODEL.md 6.2 item 1.
; ==============================================================================================
Aero_ComputeDragWithFeedback_48400	proc far		; CODE XREF: Aero_SumLinearForces_48639+B9p
					; seg103:35D3p

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
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, si
		add	di, 5Dh	; ']'

loc_48410:
		mov	eax, [di]
		mov	[bp+var_4], eax
		sar	eax, 3
		mov	[bp+var_4], eax
		push	si
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Aero_ComputeAoAWithTrim_480CA
		add	sp, 6
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Aero_FlowAngle_Sideslip_46AB5
		add	sp, 6
		push	word ptr [si+10h]
		push	ss
		lea	ax, [bp+var_10]
		push	ax

loc_48442:
		call	Aero_DynamicPressure_46D13
		add	sp, 6
		mov	eax, [bp+var_10]
		sar	eax, 8
		mov	[bp+var_10], eax
		push	si
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	cs
		call	near ptr Aero_ComputeDragFromFlags75
		add	sp, 6
		push	word ptr [si]
		push	ss
		lea	ax, [bp+var_38]
		push	ax
		call	Physics_ResolveWindVectorCached_4643B
		add	sp, 6
		mov	di, si
		add	di, 5Dh	; ']'
		mov	eax, [di]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]

loc_484CE:
		mov	edx, [bp+var_C]

loc_484D2:
		imul	edx

loc_484D5:
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		add	[bp+var_18], eax
		mov	eax, [bp+var_14]
		add	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_48572
		mov	eax, [si+3Fh]
		mov	[bp+var_24], eax

loc_48512:
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	al, [si+75h]
		and	ax, 1
		or	al, al
		jz	short loc_48534

loc_48524:
		mov	eax, [si+43h]
		mov	[bp+var_28], eax
		shl	eax, 8
		add	[bp+var_20], eax

loc_48534:				; CODE XREF: Aero_ComputeDragWithFeedback_48400+122j
		mov	eax, [bp+var_34]
		or	eax, eax
		jge	short loc_48540
		neg	eax

loc_48540:				; CODE XREF: Aero_ComputeDragWithFeedback_48400+13Bj
		mov	[bp+var_2C], eax
		cmp	[bp+var_2C], 100h
		jge	short loc_48562
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_34]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax

loc_48562:				; CODE XREF: Aero_ComputeDragWithFeedback_48400+14Cj
		mov	eax, [bp+var_20]
		sar	eax, 8
		mov	[bp+var_20], eax
		add	[bp+var_18], eax

loc_48572:				; CODE XREF: Aero_ComputeDragWithFeedback_48400+108j
		mov	eax, [bp+var_38]
		neg	eax
		mov	bx, [si+10h]
		mov	[bx+4],	eax
		mov	eax, [bp+var_34]
		neg	eax
		mov	[bx+8],	eax
		mov	eax, [bp+var_30]
		neg	eax
		mov	[bx+0Ch], eax
		mov	ax, [si+10h]
		add	ax, 4
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	bx, [si+10h]
		mov	eax, [bx+4]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+4],	eax
		mov	ax, [si+10h]
		add	ax, 4
		mov	eax, [bx+8]

loc_485C4:
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8

loc_485D0:
		mov	[bx+8],	eax
		mov	ax, [si+10h]
		add	ax, 8
		mov	eax, [bx+0Ch]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+0Ch], eax
		mov	ax, [si+10h]
		add	ax, 0Ch
		mov	di, [bp+arg_0]
		mov	si, [si+10h]
		add	si, 4
		or	di, di
		jz	short loc_48605
		mov	ax, di
		jmp	short loc_4860F
; ���������������������������������������������������������������������������

loc_48605:				; CODE XREF: Aero_ComputeDragWithFeedback_48400+1FFj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_4860F:				; CODE XREF: Aero_ComputeDragWithFeedback_48400+203j
		or	ax, ax
		jz	short loc_4862D

loc_48613:
		mov	eax, [si]

loc_48616:
		mov	[di], eax
		mov	eax, [si+4]

loc_4861D:
		mov	[di+4],	eax
		mov	eax, [si+8]
		mov	[di+8],	eax
		mov	ax, di
		jmp	short loc_4862F
; ���������������������������������������������������������������������������

loc_4862D:				; CODE XREF: Aero_ComputeDragWithFeedback_48400+211j
		mov	ax, di

loc_4862F:				; CODE XREF: Aero_ComputeDragWithFeedback_48400+22Bj
		mov	dx, [bp+arg_2]

loc_48632:
		mov	ax, [bp+arg_0]
		pop	di
		pop	si

locret_48637:
		leave
		retf
Aero_ComputeDragWithFeedback_48400	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg103 L874-1117. si = struct JDYN ; sortie = vecteur ACCÉLÉRATION 3x i32 (24.8) écrit
; par PhysicsTicks dans [A+0x14/18/1C], en repère CORPS (transformé corps->monde ensuite par
; Physics_IntegratePosition via [[A+2]+0x70]). SI flags_75.bit5 : thrust=satur=0 -> accel =
; gravité seule. SINON : thrust = FlightControl_CacheTripleParam(&si[0x22]) = (0, si[0x28], 0)
; (poussée pure axe corps c1/nez) ; satur  = Aero_ComputeLiftAndSideForce(si) = PORTANCE +
; force latérale (repère corps) ; aero   = Aero_ComputeDragWithFeedback(si) = traînée le long
; de la trajectoire ; m = call [[si+2]+0x3C](this=si) >>8 (scalaire 24.8 ~ masse, virtuel JDYN
; ; override non épinglé) ; grav = FlightControl_ResolveParamCached(&si[0x1E]) via
; vtable[0x6C] magic 0x2F1A (gravité résolue en repère corps). F = thrust>>8 + satur + aero ;
; accel = (F<<8)/m ; [si+0x7C] = -accel.c2 / dword_6FFD7 = FACTEUR DE CHARGE (G-mètre, axe
; normal corps) ; accel += grav (APRÈS division par m). Detail : DATA_MODEL.md 6.2.
; ==============================================================================================
Aero_SumLinearForces_48639	proc far		; CODE XREF: seg103:2876p seg103:2CDDp

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
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 70h

loc_4863F:
		push	si
		mov	si, [bp+arg_4]

loc_48643:
		mov	al, [si+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_48670
		xor	eax, eax
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		xor	eax, eax
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		jmp	short loc_486C0
; ���������������������������������������������������������������������������

loc_48670:				; CODE XREF: Aero_SumLinearForces_48639+15j
		mov	ax, si
		add	ax, 22h	; '"'
		push	ax
		push	ss
		lea	ax, [bp+var_4C]
		push	ax
		call	FlightControl_CacheTripleParam_477F0
		add	sp, 6
		mov	eax, [bp+var_4C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_8], eax
		push	si
		push	ss
		lea	ax, [bp+var_58]
		push	ax
		push	cs
		call	near ptr Aero_ComputeLiftAndSideForce_4812B
		add	sp, 6
		mov	eax, [bp+var_58]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_14], eax

loc_486C0:				; CODE XREF: Aero_SumLinearForces_48639+35j
		mov	ax, si

loc_486C2:
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		call	FlightControl_ResolveParamCached
		add	sp, 6

loc_486D3:
		mov	eax, [bp+var_64]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_24], eax

loc_486E3:
		mov	eax, [bp+var_5C]
		mov	[bp+var_20], eax
		push	si
		push	ss
		lea	ax, [bp+var_70]
		push	ax
		push	cs
		call	near ptr Aero_ComputeDragWithFeedback_48400
		add	sp, 6
		mov	eax, [bp+var_70]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_10]
		sar	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		sar	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		sar	eax, 8

loc_48730:
		mov	[bp+var_8], eax
		push	si
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		mov	bx, [si+2]
		call	dword ptr [bx+3Ch]
		add	sp, 6
		mov	eax, [bp+var_4]
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_1C]
		add	[bp+var_40], eax
		mov	eax, [bp+var_18]
		add	[bp+var_3C], eax
		mov	eax, [bp+var_14]
		add	[bp+var_38], eax
		mov	eax, [bp+var_34]
		add	[bp+var_40], eax
		mov	eax, [bp+var_30]
		add	[bp+var_3C], eax
		mov	eax, [bp+var_2C]
		add	[bp+var_38], eax
		mov	eax, [bp+var_40]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_40], eax
		mov	eax, [bp+var_3C]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_38]
		mov	edx, eax

loc_487D2:
		mov	ecx, [bp+var_4]

loc_487D6:
		sar	edx, 18h

loc_487DA:
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		neg	eax
		mov	[si+7Ch], eax
		mov	eax, [si+7Ch]
		mov	edx, eax
		mov	ecx, dword_6FFD7
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+7Ch], eax
		mov	eax, [bp+var_28]
		add	[bp+var_40], eax
		mov	eax, [bp+var_24]
		add	[bp+var_3C], eax
		mov	eax, [bp+var_20]
		add	[bp+var_38], eax
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4882E
		mov	ax, si
		jmp	short loc_48838
; ���������������������������������������������������������������������������

loc_4882E:				; CODE XREF: Aero_SumLinearForces_48639+1EFj
		push	0Ch

loc_48830:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_48838:				; CODE XREF: Aero_SumLinearForces_48639+1F3j
		or	ax, ax
		jz	short loc_48857
		mov	eax, [bp+var_40]
		mov	[si], eax

loc_48843:
		mov	eax, [bp+var_3C]
		mov	[si+4],	eax
		mov	eax, [bp+var_38]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_48859
; ���������������������������������������������������������������������������

loc_48857:				; CODE XREF: Aero_SumLinearForces_48639+201j
		mov	ax, si

loc_48859:				; CODE XREF: Aero_SumLinearForces_48639+21Cj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Aero_SumLinearForces_48639	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 375L, RELUE INTEGRALEMENT (2026-09-24, avec les vraies fonctions trigonometriques).
; CONSIGNE D'INCIDENCE si[0x16] (comparee a alpha par Aero_ComputeForcesMain_4791E : errA =
; si[0x16] - alpha). (1) si[0x78] = si[0x67] << 8 ; q = Aero_DynamicPressure_46D13(si[0x10]) ;
; M = orientation de l'objet ([si]->+2, vtable+0x3C, copie 36 octets dans var_7A). (2)
; flags_75.bit5 ou q < 1.0 -> si[0x16] = 0, fin. (3) |alpha| calcule dans var_A mais JAMAIS
; utilise. (4) DEMANDE DU MANCHE : m = dword [ctrl+0x1F] (arg_2:arg_4) ; d = si[0x78], /3 si m
; < 0 (manche pousse) ; d = d * m >> 8 / 16. (5) REFERENCE A (var_1A) = 0 ; si flags_75.bit4
; ET pas au sol ([[si]+0x20] == 0) ET !flags_75.bit6 : A = alpha (Aero_FlowAngle_AoA_469FE,
; signe) ; si alpha < 0 : A = alpha * |cos(roulis)| (Matrix_RollAngle_57C67 puis
; Math_CosDeg_5483F). (6) CALAGE : c = -(si[0x4C] << 8), et -= si[0x4D] << 8 si flags_75.bit1
; (volets). (7) TERME DE GRAVITE : theta = Matrix_NosePitchAngle_57C3A(M) = tangage du nez ;
; g1 = cos(theta) (Math_CosDeg_5483F, vrai cosinus), negatif si la normale pointe vers le bas
; (var_5A = M+0x20 < 0, avion sur le dos). (8) FACTEUR DE CHARGE DEMANDE n = d + g1 (1 g *
; cos(theta) au neutre). (9) INCIDENCE PAR g : k = -( X / q / si[0x61] * 1.5 (0x180) *
; dword_6FFD7 ), X = valeur de [si+2]->vtable+0x3C(si) (forme de la formule : masse, car
; portance = si[0x61]*alpha*q ; NON PROUVE, cf. question ouverte 5 de CLAUDE.md). (10) si n !=
; 0 : T = n*k (cible), B = g1*k (base) ; sinon T = B = 0. T += c ; B += c. (11) SELECTION : si
; T est compris entre A et B (bornes incluses), on garde A ; sinon A = T. (12) BORNE : L =
; (si[0x65] << 8) * dword_72A1C ; A borne a [-L, L] ; si[0x16] = A. Correction de l'ancien
; resume : var_30 = cos(tangage) EXACTEMENT (et non ~ par identite) ; l'ancien resultat etait
; juste par deux erreurs qui s'annulaient (angle pris pour 'angle avec Z' + sinus pris pour un
; cosinus). Ne lit PAS si[0x59].
; ==============================================================================================
Aero_ComputeControlFlags75Bit5B	proc far		; CODE XREF: Aero_ControlOrchestrator_48FC2+11p

var_7A		= word ptr -7Ah
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= word ptr -4Ah
var_46		= word ptr -46h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= word ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 7Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+67h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		mov	[si+78h], eax
		push	word ptr [si+10h]
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	Aero_DynamicPressure_46D13
		add	sp, 6
		mov	bx, [si]
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_6], ax
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	al, [si+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jnz	short loc_488C3
		cmp	[bp+var_4], 100h
		jge	short loc_488CE

loc_488C3:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+55j
		mov	dword ptr [si+16h], 0
		jmp	loc_48BD0
; ���������������������������������������������������������������������������

loc_488CE:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+5Fj
		push	si
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	Aero_FlowAngle_AoA_469FE
		add	sp, 6
		mov	eax, [bp+var_A]
		or	eax, eax
		jge	short loc_488E8
		neg	eax

loc_488E8:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+81j
		mov	[bp+var_A], eax
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		add	dx, 1Fh
		mov	word ptr [bp+var_12+2],	ax
		mov	word ptr [bp+var_12], dx
		les	bx, [bp+var_12]
		mov	eax, es:[bx]
		mov	[bp+var_E], eax
		mov	di, si
		add	di, 78h	; 'x'
		mov	eax, [di]

loc_4890E:
		mov	[bp+var_16], eax

loc_48912:
		cmp	[bp+var_E], 0
		jge	short loc_48928
		mov	ebx, 3
		cdq
		idiv	ebx
		mov	[bp+var_16], eax

loc_48928:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+B5j
		mov	eax, [bp+var_16]
		mov	edx, [bp+var_E]
		imul	edx

loc_48933:
		shrd	eax, edx, 8

loc_48938:
		mov	[bp+var_16], eax

loc_4893C:
		mov	ebx, 10h

loc_48942:
		mov	eax, [bp+var_16]
		cdq
		idiv	ebx
		mov	[bp+var_16], eax
		mov	[bp+var_1A], 0
		mov	al, [si+75h]
		shr	ax, 4
		and	ax, 1
		or	al, al
		jnz	short loc_48967
		jmp	loc_489EC
; ���������������������������������������������������������������������������

loc_48967:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+100j
		mov	bx, [si]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_489EC
		mov	al, [si+75h]
		shr	ax, 6
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_489EC
		push	si
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		call	Aero_FlowAngle_AoA_469FE
		add	sp, 6
		mov	eax, [bp+var_1E]
		mov	[bp+var_1A], eax
		cmp	[bp+var_1A], 0
		jge	short loc_489EC
		lea	ax, [bp+var_7A]
		push	ax
		push	ss
		lea	ax, [bp+var_4A]
		push	ax
		call	Matrix_RollAngle_57C67
		add	sp, 6
		lea	ax, [bp+var_4A]
		push	ax
		push	ss
		lea	ax, [bp+var_4E]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp+var_4E]
		or	eax, eax
		jge	short loc_489CC
		neg	eax

loc_489CC:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+165j
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_1A]
		mov	edx, [bp+var_56]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1A], eax

loc_489EC:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+102j
					; Aero_ComputeControlFlags75Bit5B+10Ej ...
		mov	al, [si+4Ch]
		mov	ah, 0
		neg	ax
		movsx	eax, ax
		shl	eax, 8
		mov	[bp+var_22], eax
		mov	al, [si+75h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_48A20
		mov	al, [si+4Dh]
		mov	ah, 0
		mov	[bp+var_24], ax
		movsx	eax, [bp+var_24]
		shl	eax, 8

loc_48A1C:
		sub	[bp+var_22], eax

loc_48A20:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+1A7j
		mov	[bp+var_28], 0

loc_48A28:
		mov	[bp+var_2C], 0
		lea	ax, [bp+var_7A]
		push	ax
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		call	Matrix_NosePitchAngle_57C3A
		add	sp, 6
		lea	ax, [bp+var_34]
		push	ax
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		cmp	[bp+var_5A], 0
		jge	short loc_48A64
		mov	eax, [bp+var_30]
		neg	eax
		mov	[bp+var_30], eax

loc_48A64:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+1F5j
		mov	eax, [bp+var_16]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_30]
		add	[bp+var_38], eax
		push	si
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		mov	bx, [si+2]
		call	dword ptr [bx+3Ch]
		add	sp, 6
		mov	eax, [bp+var_3C]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3C], eax
		mov	di, si
		add	di, 61h	; 'a'
		mov	eax, [bp+var_3C]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3C], eax
		mov	[bp+var_40], 180h
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_40]
		imul	edx

loc_48ACE:
		shrd	eax, edx, 8

loc_48AD3:
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	edx, dword_6FFD7
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		neg	eax
		mov	[bp+var_3C], eax
		cmp	[bp+var_38], 0
		jz	short loc_48B36
		mov	eax, [bp+var_38]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	edx, [bp+var_3C]
		imul	edx
		shrd	eax, edx, 8

loc_48B16:
		mov	[bp+var_2C], eax

loc_48B1A:
		mov	eax, [bp+var_30]
		mov	[bp+var_28], eax

loc_48B22:
		mov	eax, [bp+var_28]
		mov	edx, [bp+var_3C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax

loc_48B36:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+29Aj
		mov	eax, [bp+var_22]
		add	[bp+var_2C], eax
		add	[bp+var_28], eax

loc_48B42:
		mov	eax, [bp+var_1A]
		cmp	eax, [bp+var_28]
		jle	short loc_48B5E
		mov	eax, [bp+var_2C]
		cmp	eax, [bp+var_1A]
		jg	short loc_48B6E
		cmp	eax, [bp+var_28]
		jge	short loc_48B76
		jmp	short loc_48B6E
; ���������������������������������������������������������������������������

loc_48B5E:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+2E8j
		mov	eax, [bp+var_2C]
		cmp	eax, [bp+var_1A]
		jl	short loc_48B6E
		cmp	eax, [bp+var_28]
		jle	short loc_48B76

loc_48B6E:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+2F2j
					; Aero_ComputeControlFlags75Bit5B+2FAj ...
		mov	eax, [bp+var_2C]
		mov	[bp+var_1A], eax

loc_48B76:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+2F8j
					; Aero_ComputeControlFlags75Bit5B+30Aj
		mov	al, [si+65h]
		mov	ah, 0
		mov	[bp+var_46], ax
		movsx	eax, [bp+var_46]
		shl	eax, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	edx, dword_72A1C
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_1A]
		cmp	eax, [bp+var_44]
		jle	short loc_48BB0
		mov	eax, [bp+var_44]
		jmp	short loc_48BC4
; ���������������������������������������������������������������������������

loc_48BB0:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+346j
		mov	eax, [bp+var_44]
		neg	eax
		cmp	eax, [bp+var_1A]
		jle	short loc_48BC8
		mov	eax, [bp+var_44]
		neg	eax

loc_48BC4:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+34Cj
		mov	[bp+var_1A], eax

loc_48BC8:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+359j
		mov	eax, [bp+var_1A]
		mov	[si+16h], eax

loc_48BD0:				; CODE XREF: Aero_ComputeControlFlags75Bit5B+69j
		pop	di
		pop	si
		leave
		retf
Aero_ComputeControlFlags75Bit5B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg103 L1542-1603 (relu intégralement, session 2026-09-05). Appelle
; Aero_ComputeForcesMain_4791E(si, &buf12), extrait buf12+0 = m_alpha (1er élément du triplet
; interne (m_alpha,0,m_beta)) = MOMENT DE TANGAGE. Applique ensuite l'effet de sol : si
; [si+0x20] (au sol) et [si+0x59] (ground_effect_ceiling, JDYN champ 17) <= une valeur
; d'altitude dérivée de Physics_ResolveWindVectorCached_4643B, alors moment -= 0x1400 (20.0 en
; 24.8, biais de tangage en effet de sol). Appelée en 1er par Aero_ControlOrchestrator_48FC2,
; son résultat va dans le 1er slot (offset+0) du vecteur moment (TANGAGE,roulis,lacet).
; ==============================================================================================
Aero_ApplyGroundEffect	proc far		; CODE XREF: Aero_ControlOrchestrator_48FC2+2Dp

var_1C		= word ptr -1Ch
var_18		= dword	ptr -18h
var_10		= dword	ptr -10h
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_4]
		push	si

loc_48BDF:
		push	ss
		lea	ax, [bp+var_10]

loc_48BE3:
		push	ax

loc_48BE4:
		call	Aero_ComputeForcesMain_4791E
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		push	word ptr [si]
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Physics_ResolveWindVectorCached_4643B
		add	sp, 6
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_48C1D
		mov	eax, [si+59h]

loc_48C0F:
		cmp	eax, [bp+var_18]

loc_48C13:
		jle	short loc_48C1D
		sub	[bp+var_4], 1400h

loc_48C1D:				; CODE XREF: Aero_ApplyGroundEffect+35j
					; Aero_ApplyGroundEffect:loc_48C13j
		mov	bx, [bp+arg_0]

loc_48C20:
		mov	eax, [bp+var_4]

loc_48C24:
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Aero_ApplyGroundEffect	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,303L — testé aussi sur flags_75 bit5, résout un paramètre indexé (+0x77) : variante de
; calcul de contrôle de vol conditionnée par flags_75 bit5, avec table de paramètres indexée.
; ==============================================================================================
Aero_ComputeControlFlags75Bit5C	proc far		; CODE XREF: Aero_ControlOrchestrator_48FC2+3Ep

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
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp

loc_48C33:
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	al, [si+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jnz	short loc_48C4B
		jmp	loc_48D1A
; ���������������������������������������������������������������������������

loc_48C4B:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+16j
		movzx	eax, byte ptr [si+77h]
		mov	[bp+var_20], eax
		mov	[bp+var_28], 80h ; '�'
		mov	eax, [bp+var_28]
		sub	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	di, si
		add	di, 71h	; 'q'
		mov	eax, [bp+var_24]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	di, si
		add	di, 8
		mov	eax, [di]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_24]
		cmp	eax, [bp+var_2C]
		jle	short loc_48C9F
		mov	ax, 1
		jmp	short loc_48CA1
; ���������������������������������������������������������������������������

loc_48C9F:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+68j
		xor	ax, ax

loc_48CA1:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+6Dj
		or	al, al
		jz	short loc_48CD8
		mov	eax, [bp+var_2C]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_20]
		add	[bp+var_8], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_24]
		jle	short loc_48CC4
		mov	ax, 1
		jmp	short loc_48CC6
; ���������������������������������������������������������������������������

loc_48CC4:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+8Dj
		xor	ax, ax

loc_48CC6:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+92j
		or	al, al
		jnz	short loc_48CCD
		jmp	loc_48DF8
; ���������������������������������������������������������������������������

loc_48CCD:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+98j
					; Aero_ComputeControlFlags75Bit5C:loc_48D18j
		mov	eax, [bp+var_24]
		mov	[bp+var_8], eax
		jmp	loc_48DF8
; ���������������������������������������������������������������������������

loc_48CD8:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+73j
		mov	eax, [bp+var_24]

loc_48CDC:
		cmp	eax, [bp+var_2C]
		jge	short loc_48CE7

loc_48CE2:
		mov	ax, 1
		jmp	short loc_48CE9
; ���������������������������������������������������������������������������

loc_48CE7:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+B0j
		xor	ax, ax

loc_48CE9:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+B5j
		or	al, al
		jnz	short loc_48CF0
		jmp	loc_48DF8
; ���������������������������������������������������������������������������

loc_48CF0:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+BBj
		mov	eax, [bp+var_2C]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_20]
		add	[bp+var_8], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_24]
		jge	short loc_48D0F
		mov	ax, 1
		jmp	short loc_48D11
; ���������������������������������������������������������������������������

loc_48D0F:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+D8j
		xor	ax, ax

loc_48D11:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+DDj
		or	al, al
		jnz	short loc_48D18
		jmp	loc_48DF8
; ���������������������������������������������������������������������������

loc_48D18:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+E3j
		jmp	short loc_48CCD
; ���������������������������������������������������������������������������

loc_48D1A:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+18j
		mov	[bp+var_8], 0

loc_48D22:
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_48D6C
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]

loc_48D32:
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	Matrix_RollAngle_57C67
		add	sp, 6
		mov	eax, [bp+var_24]
		neg	eax
		mov	[bp+var_28], eax
		mov	[bp+var_20], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax

loc_48D6C:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+F8j
		mov	bx, [si]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_48DA1
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]
		push	large dword ptr	[bx+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 2800h
		jle	short loc_48DF8

loc_48DA1:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+145j
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_6]
		add	dx, 23h	; '#'
		mov	word ptr [bp+var_24+2],	ax
		mov	word ptr [bp+var_24], dx
		les	bx, [bp+var_24]
		mov	eax, es:[bx]
		mov	[bp+var_20], eax
		mov	[bp+var_28], eax
		mov	ebx, 10h
		cdq
		idiv	ebx
		mov	[bp+var_28], eax
		push	si
		push	ss

loc_48DD0:
		lea	ax, [bp+var_2C]

loc_48DD3:
		push	ax
		nop
		push	cs
		call	near ptr Aero_ComputeAdditionalForce
		add	sp, 6

loc_48DDC:
		mov	eax, [bp+var_2C]

loc_48DE0:
		mov	edx, [bp+var_28]

loc_48DE4:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		add	[bp+var_8], eax

loc_48DF8:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+9Aj
					; Aero_ComputeControlFlags75Bit5C+A5j ...
		mov	di, si
		add	di, 71h	; 'q'
		mov	eax, [di]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	edx, dword_72A20
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_14]
		jle	short loc_48E29
		mov	eax, [bp+var_14]
		jmp	short loc_48E3D
; ���������������������������������������������������������������������������

loc_48E29:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+1F1j
		mov	eax, [bp+var_14]
		neg	eax
		cmp	eax, [bp+var_8]
		jle	short loc_48E41
		mov	eax, [bp+var_14]
		neg	eax

loc_48E3D:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+1F7j
		mov	[bp+var_8], eax

loc_48E41:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+204j
		mov	di, si
		add	di, 8
		mov	eax, [di]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		sub	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		mov	eax, [si+47h]
		cmp	eax, [bp+var_4]
		jge	short loc_48E86
		jmp	short loc_48E9A
; ���������������������������������������������������������������������������

loc_48E86:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+252j
		mov	eax, [si+47h]
		neg	eax
		cmp	eax, [bp+var_4]
		jle	short loc_48E9E
		mov	eax, [si+47h]
		neg	eax

loc_48E9A:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+254j
		mov	[bp+var_4], eax

loc_48E9E:				; CODE XREF: Aero_ComputeControlFlags75Bit5C+261j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Aero_ComputeControlFlags75Bit5C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,102L — Aero_ControlOrchestrator_48FC2+1Dp. Si flags_75 bit5 actif : [si+0x1A]=0 (reset
; accumulateur, retour immédiat). Sinon (relu intégralement, session 2026-09-05, L1946-2011) :
; lit [arg_2+0x27] (var_4) et [arg_2+0x23] (var_C, = commande roulis d'après playerCtx +0x23),
; appelle Aero_FlowAngle_AoA_469FE pour obtenir |alpha| (var_14/var_1C) - mais ni var_C
; (roulis) ni var_14/var_1C (alpha) ne sont relus ensuite dans cette fonction (vérifié sur les
; 102 lignes complètes) : ce sont des paramètres réellement lus (2 appels ASM,
; Aero_FlowAngle_AoA_469FE compris) mais dont le résultat n'entre pas dans le calcul final de
; [si+0x1A] - pas forcément du code mort au sens large (peut être un vestige d'une variante
; antérieure de la formule, ou un garde-fou compilé mais non retenu par la branche finale),
; mais concrètement absent du résultat écrit. Le résultat réel écrit dans [si+0x1A]
; (l'accumulateur lacet) est : (si[0x66]<<8 * dword_72A18) * (var_4/16), où si[0x66] est un
; coefficient par avion et var_4=[arg_2+0x27] la commande palonnier (champ suivant le roulis
; +0x23 dans playerCtx). Confirme qu'à ce point précis, l'accumulateur de lacet ne dépend NI
; du roulis NI de l'incidence malgré leur lecture - le couplage roulis->lacet observé en jeu
; n'est donc pas produit ici ; reste à localiser ailleurs.
; ==============================================================================================
Aero_ResetAccumulatorFlags75Bit5	proc far		; CODE XREF: Aero_ControlOrchestrator_48FC2+1Dp

var_26		= word ptr -26h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_48ED4
		mov	dword ptr [si+1Ah], 0
		jmp	loc_48F8B
; ���������������������������������������������������������������������������

loc_48ED4:				; CODE XREF: Aero_ResetAccumulatorFlags75Bit5+15j
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		add	dx, 27h	; '''
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx

loc_48EE3:
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		add	dx, 23h	; '#'
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		push	si
		push	ss
		lea	ax, [bp+var_18]
		push	ax

loc_48F0E:
		call	Aero_FlowAngle_AoA_469FE

loc_48F13:
		add	sp, 6

loc_48F16:
		mov	eax, [bp+var_18]
		or	eax, eax
		jge	short loc_48F22

loc_48F1F:
		neg	eax

loc_48F22:				; CODE XREF: Aero_ResetAccumulatorFlags75Bit5+6Bj
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_20], eax
		mov	ebx, 10h
		cdq
		idiv	ebx
		mov	[bp+var_20], eax
		mov	al, [si+66h]
		mov	ah, 0
		mov	[bp+var_26], ax
		movsx	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	edx, dword_72A18
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[si+1Ah], eax
		mov	eax, [si+1Ah]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+1Ah], eax

loc_48F8B:				; CODE XREF: Aero_ResetAccumulatorFlags75Bit5+1Fj
		pop	si
		leave
		retf
Aero_ResetAccumulatorFlags75Bit5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg103 L2052-2082 (relu intégralement, session 2026-09-05). NOM TROMPEUR - ne calcule
; PAS un moment de roulis. Appelle Aero_ComputeForcesMain_4791E(si, &buf12) puis extrait
; buf12+8 = m_beta (le SECOND élément du triplet interne (m_alpha, 0, m_beta) que
; Aero_ComputeForcesMain calcule et stocke à chaque appel). C'est en réalité l'extraction du
; MOMENT DE LACET (asservissement sur beta/dérapage, même loi sqrt que le tangage). Appelée
; par Aero_ControlOrchestrator_48FC2 juste après le roulis (Aero_ComputeControlFlags75Bit5C),
; son résultat va dans le 3e slot (offset+8) du vecteur moment (tangage,roulis,LACET) retourné
; à PhysicsTicks. Le vrai nom devrait être quelque chose comme Aero_ExtractYawMoment.
; ==============================================================================================
Aero_ExtractRollMoment	proc far		; CODE XREF: Aero_ControlOrchestrator_48FC2+4Bp

var_10		= word ptr -10h
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	ax, [bp+arg_4]
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	Aero_ComputeForcesMain_4791E
		add	sp, 6
		lea	si, [bp+var_10]
		add	si, 8
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Aero_ExtractRollMoment	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg103 L2099-2185 (relu intégralement, session 2026-09-05). ORCHESTRATEUR complet du
; vecteur moment (tangage,roulis,lacet) retourné à PhysicsTicks, assemblé dans un buffer
; malloc'é de 12 octets. Séquence exacte : (1) Aero_ComputeControlFlags75Bit5B(si) - calcule
; la CONSIGNE de tangage (loi de charge/var_30) et l'écrit dans si[0x16], PAS de valeur de
; retour capturée ici ; (2) Aero_ResetAccumulatorFlags75Bit5(si) - calcule la consigne de
; lacet (palonnier seul, confirmé indépendant du roulis/alpha) et l'écrit dans si[0x1A], pas
; de retour capturé ; (3) Aero_ApplyGroundEffect(si) -> slot 0 (tangage) = extrait m_alpha de
; Aero_ComputeForcesMain_4791E (qui lit si[0x16] en interne comme consigne), + effet de sol ;
; (4) Aero_ComputeControlFlags75Bit5C(si) -> slot 1 (roulis) = loi directe manche (confirmée
; correcte par Rémi) ; (5) Aero_ExtractRollMoment(si) [mal nommée, cf. son entrée] -> slot 2
; (lacet) = extrait m_beta d'un DEUXIÈME appel à Aero_ComputeForcesMain_4791E (qui lit
; si[0x1A] comme consigne). Point clé : Aero_ComputeForcesMain est appelée DEUX FOIS par tick
; (une pour tangage via 3, une pour lacet via 5), la même loi d'asservissement racine carrée
; servant aux deux axes - alpha_actuel et beta_actuel étant tous deux dérivés de la même
; vitesse corps courante (donc du roulis courant via la transformation monde->corps), c'est ce
; qui relie physiquement roulis et lacet sans mécanisme de couplage discret séparé.
; ==============================================================================================
Aero_ControlOrchestrator_48FC2	proc far		; CODE XREF: seg103:2D08p

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	large [bp+arg_6]
		push	si
		push	cs
		call	near ptr Aero_ComputeControlFlags75Bit5B
		add	sp, 6
		push	large [bp+arg_6]
		push	si
		push	cs
		call	near ptr Aero_ResetAccumulatorFlags75Bit5
		add	sp, 6
		mov	di, [bp+arg_0]
		push	si
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr Aero_ApplyGroundEffect
		add	sp, 6
		push	large [bp+arg_6]
		push	si
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Aero_ComputeControlFlags75Bit5C
		add	sp, 0Ah
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr Aero_ExtractRollMoment

loc_49010:
		add	sp, 6
		or	di, di
		jz	short loc_4901B
		mov	ax, di
		jmp	short loc_49025
; ���������������������������������������������������������������������������

loc_4901B:				; CODE XREF: Aero_ControlOrchestrator_48FC2+53j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_49025:				; CODE XREF: Aero_ControlOrchestrator_48FC2+57j
		or	ax, ax
		jz	short loc_49044
		mov	eax, [bp+var_4]
		mov	[di], eax
		mov	eax, [bp+var_8]
		mov	[di+4],	eax
		mov	eax, [bp+var_C]
		mov	[di+8],	eax
		mov	ax, di
		jmp	short loc_49046
; ���������������������������������������������������������������������������

loc_49044:				; CODE XREF: Aero_ControlOrchestrator_48FC2+65j
		mov	ax, di

loc_49046:				; CODE XREF: Aero_ControlOrchestrator_48FC2+80j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Aero_ControlOrchestrator_48FC2	endp

; ���������������������������������������������������������������������������

loc_49050:				; CODE XREF: seg082:12DAJ
					; DATA XREF: seg339:off_6F372o
		push	bp
		mov	bp, sp
		sub	sp, 3Eh
		push	si
		push	di
		mov	di, [bp+6]
		cmp	byte_72355, 0
		jz	short loc_49074
		mov	bx, [di]
		mov	ax, [bx+2]
		cmp	ax, word_722E6
		jnz	short loc_49074
		mov	byte ptr [bx+20h], 1
		jmp	loc_491B3
; ���������������������������������������������������������������������������

loc_49074:				; CODE XREF: seg103:10A0j seg103:10ABj
		mov	bx, [di]
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp-2],	ax
		push	ax
		lea	ax, [bp-3Eh]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		lea	ax, [bp-3Eh]
		push	ax
		push	ss
		lea	ax, [bp-6]
		push	ax
		call	Matrix_RollAngle_57C67
		add	sp, 6
		mov	eax, [bp-6]
		or	eax, eax
		jge	short loc_490AF
		neg	eax

loc_490AF:				; CODE XREF: seg103:10EAj
		mov	[bp-6],	eax
		lea	ax, [bp-3Eh]
		push	ax
		push	ss
		lea	ax, [bp-0Ah]
		push	ax
		call	Matrix_NosePitchAngle_57C3A
		add	sp, 6
		mov	si, [di]
		add	si, 8
		mov	eax, [si]
		mov	[bp-12h], eax

loc_490D0:
		mov	eax, [si+4]

loc_490D4:
		mov	[bp-0Eh], eax

loc_490D8:
		lea	ax, [bp-12h]
		push	ax
		push	ss

loc_490DD:
		lea	ax, [bp-16h]
		push	ax

loc_490E1:
		call	Math_VectorLength3D_Scaled_Variant_55ED8
		add	sp, 6
		mov	bx, [di]
		mov	eax, [di+4Eh]
		neg	eax
		cmp	[bx+10h], eax
		jg	short loc_490FB
		jmp	loc_491AD
; ���������������������������������������������������������������������������

loc_490FB:				; CODE XREF: seg103:1136j
		mov	al, [di+56h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		cmp	eax, [bp-6]
		jg	short loc_49111
		jmp	loc_491AD
; ���������������������������������������������������������������������������

loc_49111:				; CODE XREF: seg103:114Cj
		mov	al, [di+57h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		cmp	eax, [bp-0Ah]

loc_49122:
		jg	short loc_49127

loc_49124:
		jmp	loc_491AD
; ���������������������������������������������������������������������������

loc_49127:				; CODE XREF: seg103:loc_49122j
		mov	al, [di+58h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		neg	eax
		cmp	eax, [bp-0Ah]
		jge	short loc_491AD
		mov	eax, [di+52h]
		cmp	eax, [bp-16h]
		jle	short loc_491AD
		mov	al, [di+75h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_491AD
		mov	al, [di+75h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_491AD
		mov	byte ptr [bx+20h], 1
		mov	si, di
		add	si, 4Eh	; 'N'
		mov	eax, [si]
		mov	[bp-1Ah], eax
		sar	eax, 1
		mov	[bp-1Ah], eax
		neg	eax
		cmp	[bx+10h], eax
		jge	short loc_4919A
		mov	eax, [bp-1Ah]
		sar	eax, 1
		mov	edx, [bx+10h]
		add	edx, eax
		neg	edx
		mov	[bx+10h], edx
		jmp	short loc_491B3
; ���������������������������������������������������������������������������

loc_4919A:				; CODE XREF: seg103:11C1j
		mov	bx, [di]
		cmp	dword ptr [bx+10h], 0
		jge	short loc_491B3
		mov	dword ptr [bx+10h], 0
		jmp	short loc_491B3
; ���������������������������������������������������������������������������

loc_491AD:				; CODE XREF: seg103:1138j seg103:114Ej ...
		mov	bx, [di]
		mov	byte ptr [bx+20h], 0

loc_491B3:				; CODE XREF: seg103:10B1j seg103:11D8j ...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_491B7:				; CODE XREF: seg082:loc_3B6A9J
					; DATA XREF: seg339:off_6F37Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	bx, [si]
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch

loc_491D0:
		mov	di, ax
		mov	eax, [di]
		mov	bx, [si]
		mov	[bx+8],	eax
		mov	eax, [di+4]
		mov	[bx+0Ch], eax
		mov	eax, [di+8]
		mov	[bx+10h], eax
		mov	eax, [bx+8]
		mov	edx, [bp+8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+8],	eax
		mov	ax, [si]
		add	ax, 8
		mov	eax, [bx+0Ch]
		mov	edx, [bp+8]
		imul	edx
		shrd	eax, edx, 8

loc_49214:
		mov	[bx+0Ch], eax

loc_49218:
		mov	ax, [si]
		add	ax, 0Ch

loc_4921D:
		mov	eax, [bx+10h]

loc_49221:
		mov	edx, [bp+8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+10h], eax
		mov	ax, [si]
		add	ax, 10h
		les	bx, [bp+0Ch]
		mov	byte ptr es:[bx+1Eh], 5
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,258L — fonction pivot déjà en investigation dans le projet (référencée depuis
; Pilot_LowLevelControlCommand/seg087). Transforme un vecteur d'aim par rotation (sub_56DC5),
; déclenche un son positionnel (sub_58828), calcule l'écart angulaire vers une cible avec un
; gain de contrôle (dword_72A14) : calcul de commande de pilotage vers une cible (loi de
; guidage/steering), avec retour sonore — connecte orientation de vue et tick physique JDYN.
; ==============================================================================================
Pilot_SteeringCommandToTarget	proc far		; CODE XREF: FlightState_ResetHud+34DP
					; Pilot_LowLevelControlCommand:loc_3E48EP

var_5E		= word ptr -5Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 5Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	dword ptr [di+8], 0
		push	di
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	ax, di
		add	ax, 4
		mov	[bp+var_2], ax
		mov	eax, [di]
		neg	eax
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], 0
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_32], eax
		push	di
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_5E]
		push	ax
		call	Map_ApplyRotationTransform_56DC5
		add	sp, 6
		lea	ax, [bp+var_5E]
		push	ax
		mov	bx, [si]
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		mov	eax, [bp+arg_6]

loc_492CF:
		mov	[bp+var_36], eax

loc_492D3:
		lea	ax, [bp+var_5E]

loc_492D6:
		push	ax
		lea	ax, [bp+var_3A]
		push	ax

loc_492DB:
		call	Matrix_LocalToWorld_58828

loc_492E0:
		add	sp, 4

loc_492E3:
		mov	bx, [si]

loc_492E5:
		mov	eax, [bp+var_3A]
		mov	[bx+8],	eax
		mov	eax, [bp+var_36]
		mov	[bx+0Ch], eax
		mov	eax, [bp+var_32]
		mov	[bx+10h], eax
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+34h]
		pop	cx
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_3A], eax
		mov	eax, [di+4]
		mov	[bp+var_36], eax
		mov	eax, [di+8]
		mov	[bp+var_32], eax
		mov	bx, [si]
		mov	di, [bx+2]
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_3A], eax
		mov	eax, [di+4]
		sub	[bp+var_36], eax
		mov	eax, [di+8]
		sub	[bp+var_32], eax
		push	large [bp+var_32]
		push	large [bp+var_36]
		push	large [bp+var_3A]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_16], eax
		mov	[bp+var_12], eax
		mov	bx, [si]
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]
		push	large dword ptr	[bx+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	edx, eax
		mov	ecx, [bp+var_1A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_22], eax
		mov	[bp+var_26], 0FFFFF700h
		mov	eax, [bp+var_26]
		mov	edx, dword_72A14
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		add	[bp+var_26], 0A00h
		mov	eax, [bp+var_26]
		mov	edx, [bp+var_22]
		imul	edx

loc_493D2:
		shrd	eax, edx, 8

loc_493D7:
		mov	[bp+var_26], eax
		mov	di, si

loc_493DD:
		add	di, 33h	; '3'

loc_493E0:
		mov	eax, [bp+var_26]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [si+6Dh]
		cmp	eax, [bp+var_26]
		jge	short loc_49407
		mov	dword ptr [si+6Dh], 0
		jmp	short loc_4940F
; ���������������������������������������������������������������������������

loc_49407:				; CODE XREF: Pilot_SteeringCommandToTarget+1B9j
		mov	eax, [bp+var_26]
		sub	[si+6Dh], eax

loc_4940F:				; CODE XREF: Pilot_SteeringCommandToTarget+1C3j
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	[bx+12h], eax
		mov	eax, [di+4]

loc_49422:
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	[bx+16h], eax
		mov	eax, [di+8]
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	[bx+1Ah], eax
		mov	bx, [si]
		mov	ax, [bx+2]
		add	ax, 12h
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		xor	eax, eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	[si+4],	eax
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	ax, [bx+60h]
		mov	dx, [bx+5Eh]
		mov	[bp+var_28], ax
		mov	[bp+var_2A], dx
		push	ds
		push	offset aFlaps	; "FLAPS"
		push	ax
		push	dx
		call	Roster_FindByNameAndFlag
		add	sp, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_49484
		and	byte ptr [si+75h], 0FDh

loc_49484:				; CODE XREF: Pilot_SteeringCommandToTarget+23Cj
		and	byte ptr [si+75h], 0FEh
		mov	bx, [si]
		mov	byte ptr [bx+20h], 0
		push	4
		mov	ax, si
		add	ax, 22h	; '"'
		push	ax
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		call	Aero_ThrottleThrustCurve_4730F
		add	sp, 8

loc_494A3:
		mov	eax, [bp+var_2E]
		mov	[si+28h], eax
		pop	di

loc_494AC:
		pop	si

locret_494AD:
		leave
		retf
Pilot_SteeringCommandToTarget	endp

; ���������������������������������������������������������������������������
		push	bp

loc_494B0:
		mov	bp, sp

loc_494B2:
		sub	sp, 4
		push	si

loc_494B6:
		mov	si, [bp+6]
		push	0Ah
		mov	ax, si
		add	ax, 22h	; '"'
		push	ax
		push	ss

loc_494C2:
		lea	ax, [bp-4]
		push	ax

loc_494C6:
		call	Aero_ThrottleThrustCurve_4730F

loc_494CB:
		add	sp, 8

loc_494CE:
		mov	eax, [bp-4]

loc_494D2:
		mov	[si+28h], eax

loc_494D6:
		and	byte ptr [si+75h], 0EFh
		pop	si
		leave

locret_494DC:
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-25). Methode +0x34 de la vtable secondaire JDYN (tag 0x228A), appelee en
; tete de PhysicsTicks. Remet les gains dword_72A14..72A2C a 1,0, puis pour chaque composant
; present dans le roster (FUEL -> 72A14, RUDDER -> 72A18, ELEVATOR -> 72A1C, AILERON -> 72A20,
; LWING+RWING -> 72A24 et 72A28, ENGINE -> 72A2C) : gain = (attribut B - attribut A) /
; attribut B (Roster_SumFoundAttributeB / A). Les gains valent 1,0 quand le composant est
; intact et baissent avec les dommages (DATA_MODEL.md les disait toujours a 1,0).
; ==============================================================================================
JDYN_UpdateDamageGains_494DD:				; DATA XREF: seg339:22BEo
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+6]
		mov	dword_72A14, 100h
		mov	dword_72A18, 100h
		mov	dword_72A1C, 100h
		mov	dword_72A20, 100h
		mov	dword_72A24, 100h

loc_49514:
		mov	dword_72A28, 100h
		mov	dword_72A2C, 100h
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	ax, [bx+60h]
		mov	dx, [bx+5Eh]
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		push	ds
		push	offset aFuel_0	; "FUEL"
		push	ax
		push	dx
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jz	short loc_495B8
		push	ds
		push	offset aFuel_0	; "FUEL"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeB
		add	sp, 8
		mov	ah, 0
		mov	[bp-0Ah], ax
		movsx	eax, word ptr [bp-0Ah]
		shl	eax, 8
		mov	[bp-8],	eax
		push	ds
		push	offset aFuel_0	; "FUEL"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeA
		add	sp, 8
		mov	ah, 0
		mov	[bp-10h], ax
		movsx	eax, word ptr [bp-10h]
		shl	eax, 8
		mov	[bp-0Eh], eax
		mov	eax, [bp-8]
		mov	dword_72A14, eax
		mov	eax, [bp-0Eh]
		sub	dword_72A14, eax
		mov	eax, dword_72A14
		mov	edx, eax

loc_495A5:
		mov	ecx, [bp-8]
		sar	edx, 18h

loc_495AD:
		shl	eax, 8
		idiv	ecx
		mov	dword_72A14, eax

loc_495B8:				; CODE XREF: seg103:1587j
		push	ds
		push	offset aRudder	; "RUDDER"
		push	large dword ptr	[bp-4]
		call	Roster_FindByNameAndFlag

loc_495C5:
		add	sp, 8
		or	al, al
		jz	short loc_4963B
		push	ds

loc_495CD:				; "RUDDER"
		push	offset aRudder
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeB

loc_495D9:
		add	sp, 8
		mov	ah, 0
		mov	[bp-0Ah], ax

loc_495E1:
		movsx	eax, word ptr [bp-0Ah]
		shl	eax, 8
		mov	[bp-8],	eax
		push	ds
		push	offset aRudder	; "RUDDER"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeA
		add	sp, 8
		mov	ah, 0
		mov	[bp-10h], ax
		movsx	eax, word ptr [bp-10h]
		shl	eax, 8
		mov	[bp-0Eh], eax
		mov	eax, [bp-8]

loc_49614:
		mov	dword_72A18, eax
		mov	eax, [bp-0Eh]
		sub	dword_72A18, eax
		mov	eax, dword_72A18
		mov	edx, eax
		mov	ecx, [bp-8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_72A18, eax

loc_4963B:				; CODE XREF: seg103:160Aj
		push	ds
		push	offset aElevator ; "ELEVATOR"
		push	large dword ptr	[bp-4]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jz	short loc_496BE
		push	ds
		push	offset aElevator ; "ELEVATOR"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeB
		add	sp, 8
		mov	ah, 0
		mov	[bp-0Ah], ax
		movsx	eax, word ptr [bp-0Ah]
		shl	eax, 8
		mov	[bp-8],	eax
		push	ds
		push	offset aElevator ; "ELEVATOR"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeA
		add	sp, 8
		mov	ah, 0
		mov	[bp-10h], ax
		movsx	eax, word ptr [bp-10h]
		shl	eax, 8
		mov	[bp-0Eh], eax
		mov	eax, [bp-8]
		mov	dword_72A1C, eax
		mov	eax, [bp-0Eh]

loc_4969F:
		sub	dword_72A1C, eax
		mov	eax, dword_72A1C
		mov	edx, eax

loc_496AB:
		mov	ecx, [bp-8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_72A1C, eax

loc_496BE:				; CODE XREF: seg103:168Dj
		push	ds
		push	offset aAileron	; "AILERON"

loc_496C2:
		push	large dword ptr	[bp-4]
		call	Roster_FindByNameAndFlag

loc_496CB:
		add	sp, 8
		or	al, al
		jz	short loc_49741
		push	ds

loc_496D3:				; "AILERON"
		push	offset aAileron

loc_496D6:
		push	large dword ptr	[bp-4]

loc_496DA:
		call	Roster_SumFoundAttributeB
		add	sp, 8

loc_496E2:
		mov	ah, 0

loc_496E4:
		mov	[bp-0Ah], ax

loc_496E7:
		movsx	eax, word ptr [bp-0Ah]
		shl	eax, 8
		mov	[bp-8],	eax
		push	ds
		push	offset aAileron	; "AILERON"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeA
		add	sp, 8
		mov	ah, 0
		mov	[bp-10h], ax
		movsx	eax, word ptr [bp-10h]
		shl	eax, 8
		mov	[bp-0Eh], eax
		mov	eax, [bp-8]
		mov	dword_72A20, eax
		mov	eax, [bp-0Eh]
		sub	dword_72A20, eax
		mov	eax, dword_72A20
		mov	edx, eax
		mov	ecx, [bp-8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_72A20, eax

loc_49741:				; CODE XREF: seg103:1710j
		push	ds
		push	offset aLwing	; "LWING"
		push	large dword ptr	[bp-4]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jnz	short loc_4976C
		push	ds
		push	offset aRwing	; "RWING"
		push	large dword ptr	[bp-4]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jnz	short loc_4976C
		jmp	loc_49827
; ���������������������������������������������������������������������������

loc_4976C:				; CODE XREF: seg103:1793j seg103:17A7j
		push	ds
		push	offset aRwing	; "RWING"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeB
		add	sp, 8
		mov	ah, 0
		mov	[bp-0Ah], ax
		movsx	eax, word ptr [bp-0Ah]
		shl	eax, 8
		mov	[bp-8],	eax
		push	ds
		push	offset aLwing	; "LWING"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeB
		add	sp, 8
		mov	ah, 0
		mov	[bp-0Ch], ax
		movsx	eax, word ptr [bp-0Ch]

loc_497A8:
		shl	eax, 8
		add	[bp-8],	eax
		push	ds
		push	offset aRwing	; "RWING"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeA
		add	sp, 8
		mov	ah, 0
		mov	[bp-12h], ax
		movsx	eax, word ptr [bp-12h]

loc_497CA:
		shl	eax, 8

loc_497CE:
		mov	[bp-10h], eax
		push	ds

loc_497D3:				; "LWING"
		push	offset aLwing

loc_497D6:
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeA
		add	sp, 8
		mov	ah, 0
		mov	[bp-14h], ax
		movsx	eax, word ptr [bp-14h]
		shl	eax, 8
		add	[bp-10h], eax
		mov	eax, [bp-8]
		mov	dword_72A24, eax
		mov	eax, [bp-10h]
		sub	dword_72A24, eax
		mov	eax, dword_72A24
		mov	edx, eax
		mov	ecx, [bp-8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_72A24, eax
		mov	eax, dword_72A24
		mov	dword_72A28, eax

loc_49827:				; CODE XREF: seg103:17A9j
		push	ds
		push	offset aEngine	; "ENGINE"
		push	large dword ptr	[bp-4]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jz	short loc_498AA
		push	ds
		push	offset aEngine	; "ENGINE"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeB
		add	sp, 8
		mov	ah, 0
		mov	[bp-0Ah], ax
		movsx	eax, word ptr [bp-0Ah]
		shl	eax, 8
		mov	[bp-8],	eax
		push	ds
		push	offset aEngine	; "ENGINE"
		push	large dword ptr	[bp-4]
		call	Roster_SumFoundAttributeA
		add	sp, 8
		mov	ah, 0
		mov	[bp-10h], ax
		movsx	eax, word ptr [bp-10h]
		shl	eax, 8
		mov	[bp-0Eh], eax
		mov	eax, [bp-8]
		mov	dword_72A2C, eax
		mov	eax, [bp-0Eh]
		sub	dword_72A2C, eax
		mov	eax, dword_72A2C
		mov	edx, eax
		mov	ecx, [bp-8]
		sar	edx, 18h
		shl	eax, 8

loc_498A3:
		idiv	ecx

loc_498A6:
		mov	dword_72A2C, eax

loc_498AA:				; CODE XREF: seg103:1879j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_498AD:				; CODE XREF: seg082:113CJ seg082:11F4J ...
		push	bp
		mov	bp, sp

loc_498B0:
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-25). Ex-'Autopilot_NosePitchRelax_498B5'. (JDYN, matrice, vitesse). e =
; Math_ElevationAngle_552E1(vitesse) - Math_ElevationAngle_552E1(nez) ; e == 0 -> rien. f =
; min(1, 5 deg/s * dt / |e|) (toujours positif) ; nez += (nez horizontal normalise - nez) * f
; ; normalisation, Matrix_OrthonormalizeKeepRow1_57660. Litteralement : ramene le nez VERS
; L'HORIZONTALE (pas vers la vitesse) d'une fraction f, d'un coup si |e| < le pas.
; ==============================================================================================
Autopilot_NosePitchRelax_498B5	proc far		; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+B2Fp

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
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp

loc_498B6:
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]

loc_498C3:
		mov	[bp+var_4], 500h
		push	[bp+arg_4]
		push	ss

loc_498CF:
		lea	ax, [bp+var_8]

loc_498D2:
		push	ax

loc_498D3:
		call	Math_ElevationAngle_552E1
		add	sp, 6
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Math_ElevationAngle_552E1
		add	sp, 6
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_C]
		mov	[bp+var_14], eax
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 0
		jnz	short loc_49908
		jmp	loc_49A78
; ���������������������������������������������������������������������������

loc_49908:				; CODE XREF: Autopilot_NosePitchRelax_498B5+4Ej
		mov	eax, [bp+var_4]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_10]
		or	eax, eax
		jge	short loc_49931
		neg	eax

loc_49931:				; CODE XREF: Autopilot_NosePitchRelax_498B5+77j
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		cmp	eax, [bp+var_18]
		jge	short loc_49948
		mov	ax, 1
		jmp	short loc_4994A
; ���������������������������������������������������������������������������

loc_49948:				; CODE XREF: Autopilot_NosePitchRelax_498B5+8Cj
		xor	ax, ax

loc_4994A:				; CODE XREF: Autopilot_NosePitchRelax_498B5+91j
		or	al, al
		jz	short loc_49954
		mov	eax, [bp+var_10]
		jmp	short loc_49975
; ���������������������������������������������������������������������������

loc_49954:				; CODE XREF: Autopilot_NosePitchRelax_498B5+97j
		cmp	[bp+var_10], 0
		jge	short loc_49960
		mov	ax, 1
		jmp	short loc_49962
; ���������������������������������������������������������������������������

loc_49960:				; CODE XREF: Autopilot_NosePitchRelax_498B5+A4j
		xor	ax, ax

loc_49962:				; CODE XREF: Autopilot_NosePitchRelax_498B5+A9j
		or	al, al
		jz	short loc_49979
		mov	eax, [bp+var_18]
		neg	eax
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax

loc_49975:				; CODE XREF: Autopilot_NosePitchRelax_498B5+9Dj
		mov	[bp+var_18], eax

loc_49979:				; CODE XREF: Autopilot_NosePitchRelax_498B5+AFj
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_30], eax
		mov	di, si
		add	di, 0Ch

loc_499A0:
		mov	eax, [di]
		mov	[bp+var_44], eax

loc_499A7:
		mov	eax, [di+4]
		mov	[bp+var_40], eax
		mov	eax, [di+8]
		mov	[bp+var_3C], eax
		mov	[bp+var_38], 0

loc_499BF:
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax

loc_499C7:
		lea	ax, [bp+var_44]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	di, si

loc_499D3:
		add	di, 0Ch
		mov	eax, [bp+var_44]
		sub	eax, [di]
		mov	[bp+var_5C], eax

loc_499E1:
		mov	eax, [bp+var_40]
		sub	eax, [di+4]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_3C]
		sub	eax, [di+8]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_4C]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_48]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		add	[si+0Ch], eax
		mov	eax, [bp+var_4C]
		add	[si+10h], eax
		mov	eax, [bp+var_48]
		add	[si+14h], eax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		push	si
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx

loc_49A78:				; CODE XREF: Autopilot_NosePitchRelax_498B5+50j
		pop	di
		pop	si
		leave
		retf
Autopilot_NosePitchRelax_498B5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-25). Ex-'Autopilot_BankForTurn_49A7C'. (JDYN, matrice, &ecart de cap).
; Roulis vise T = 0 si |ecart| < 10 deg, sinon +/-10 deg du cote de l'ecart ; r =
; Matrix_RollAngle_57C67 ; delta = T - r borne a +/- JDYN[+0x71] * dt ; rotation autour du nez
; (Matrix_BuildAxisY_570C5) puis Matrix_OrthonormalizeKeepRow1_57660. Inclinaison
; essentiellement visuelle pendant le virage du pilote automatique.
; ==============================================================================================
Autopilot_BankForTurn_49A7C	proc far		; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+8B1p

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
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_4], 0A00h
		push	[bp+arg_2]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	Matrix_RollAngle_57C67

loc_49A9F:
		add	sp, 6
		mov	[bp+var_E], di
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_C], eax
		mov	[bp+var_10], di
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		or	eax, eax
		jge	short loc_49AC0
		neg	eax

loc_49AC0:				; CODE XREF: Autopilot_BankForTurn_49A7C+3Fj
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax

loc_49ACC:
		cmp	[bp+var_18], 0A00h
		jge	short loc_49ADB

loc_49AD6:
		mov	ax, 1
		jmp	short loc_49ADD
; ���������������������������������������������������������������������������

loc_49ADB:				; CODE XREF: Autopilot_BankForTurn_49A7C+58j
		xor	ax, ax

loc_49ADD:				; CODE XREF: Autopilot_BankForTurn_49A7C+5Dj
		or	al, al
		jz	short loc_49AF0
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		jmp	loc_49B83
; ���������������������������������������������������������������������������

loc_49AF0:				; CODE XREF: Autopilot_BankForTurn_49A7C+63j
		mov	eax, [di]
		cmp	eax, [bp+var_4]
		jle	short loc_49AFE
		mov	ax, 1
		jmp	short loc_49B00
; ���������������������������������������������������������������������������

loc_49AFE:				; CODE XREF: Autopilot_BankForTurn_49A7C+7Bj
		xor	ax, ax

loc_49B00:				; CODE XREF: Autopilot_BankForTurn_49A7C+80j
		or	al, al
		jz	short loc_49B0A
		mov	eax, [bp+var_4]
		jmp	short loc_49B83
; ���������������������������������������������������������������������������

loc_49B0A:				; CODE XREF: Autopilot_BankForTurn_49A7C+86j
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	eax, [di]
		cmp	eax, [bp+var_24]
		jge	short loc_49B27
		mov	ax, 1
		jmp	short loc_49B29
; ���������������������������������������������������������������������������

loc_49B27:				; CODE XREF: Autopilot_BankForTurn_49A7C+A4j
		xor	ax, ax

loc_49B29:				; CODE XREF: Autopilot_BankForTurn_49A7C+A9j
		or	al, al
		jz	short loc_49B3E
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		jmp	short loc_49B83
; ���������������������������������������������������������������������������

loc_49B3E:				; CODE XREF: Autopilot_BankForTurn_49A7C+AFj
		cmp	dword ptr [di],	0A00h
		jle	short loc_49B4C
		mov	ax, 1
		jmp	short loc_49B4E
; ���������������������������������������������������������������������������

loc_49B4C:				; CODE XREF: Autopilot_BankForTurn_49A7C+C9j
		xor	ax, ax

loc_49B4E:				; CODE XREF: Autopilot_BankForTurn_49A7C+CEj
		or	al, al
		jz	short loc_49B65
		mov	eax, [di]
		add	eax, 0FFFFF600h
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		jmp	short loc_49B83
; ���������������������������������������������������������������������������

loc_49B65:				; CODE XREF: Autopilot_BankForTurn_49A7C+D4j
		cmp	dword ptr [di],	0FFFFF600h
		jge	short loc_49B73
		mov	ax, 1
		jmp	short loc_49B75
; ���������������������������������������������������������������������������

loc_49B73:				; CODE XREF: Autopilot_BankForTurn_49A7C+F0j
		xor	ax, ax

loc_49B75:				; CODE XREF: Autopilot_BankForTurn_49A7C+F5j
		or	al, al
		jz	short loc_49B87
		add	dword ptr [di],	0A00h
		mov	eax, [di]

loc_49B83:				; CODE XREF: Autopilot_BankForTurn_49A7C+71j
					; Autopilot_BankForTurn_49A7C+8Cj ...
		mov	[bp+var_C], eax

loc_49B87:				; CODE XREF: Autopilot_BankForTurn_49A7C+FBj
		mov	eax, [bp+var_C]
		sub	eax, [bp+var_8]
		mov	[bp+var_3C], eax
		mov	[bp+var_38], eax
		cmp	[bp+var_38], 0
		jnz	short loc_49BA1
		jmp	loc_49C2A
; ���������������������������������������������������������������������������

loc_49BA1:				; CODE XREF: Autopilot_BankForTurn_49A7C+120j
		mov	eax, [si+71h]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8

loc_49BB2:
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_38]

loc_49BC2:
		or	eax, eax
		jge	short loc_49BCA
		neg	eax

loc_49BCA:				; CODE XREF: Autopilot_BankForTurn_49A7C+149j
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]

loc_49BD2:
		mov	[bp+var_4C], eax
		cmp	eax, [bp+var_40]
		jge	short loc_49BE1
		mov	ax, 1
		jmp	short loc_49BE3
; ���������������������������������������������������������������������������

loc_49BE1:				; CODE XREF: Autopilot_BankForTurn_49A7C+15Ej
		xor	ax, ax

loc_49BE3:				; CODE XREF: Autopilot_BankForTurn_49A7C+163j
		or	al, al

loc_49BE5:
		jz	short loc_49BED
		mov	eax, [bp+var_38]

loc_49BEB:
		jmp	short loc_49C0E
; ���������������������������������������������������������������������������

loc_49BED:				; CODE XREF: Autopilot_BankForTurn_49A7C:loc_49BE5j
		cmp	[bp+var_38], 0

loc_49BF2:
		jge	short loc_49BF9

loc_49BF4:
		mov	ax, 1

loc_49BF7:
		jmp	short loc_49BFB
; ���������������������������������������������������������������������������

loc_49BF9:				; CODE XREF: Autopilot_BankForTurn_49A7C:loc_49BF2j
		xor	ax, ax

loc_49BFB:				; CODE XREF: Autopilot_BankForTurn_49A7C:loc_49BF7j
		or	al, al
		jz	short loc_49C12
		mov	eax, [bp+var_40]
		neg	eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax

loc_49C0E:				; CODE XREF: Autopilot_BankForTurn_49A7C:loc_49BEBj
		mov	[bp+var_40], eax

loc_49C12:				; CODE XREF: Autopilot_BankForTurn_49A7C+181j
		lea	ax, [bp+var_40]
		push	ax
		push	[bp+arg_2]
		call	Matrix_BuildAxisY_570C5
		add	sp, 4
		push	[bp+arg_2]
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx

loc_49C2A:				; CODE XREF: Autopilot_BankForTurn_49A7C+122j
		pop	di
		pop	si
		leave
		retf
Autopilot_BankForTurn_49A7C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 1422L, RELUE INTEGRALEMENT (2026-09-25). Ex-'Autopilot_FlyToPointKinematic_49C2E'.
; PILOTE AUTOMATIQUE CINEMATIQUE de l'avion, appele par PhysicsTicks a la place de toute
; l'aerodynamique quand JDYN+0x68 != 0xFF et !flags_75.bit5 (PhysicsTicks sort ensuite
; directement : jmp loc_4AECA -> retf). Arguments : si = JDYN, arg_2 = BLOC DE COMMANDES (pas
; une cible). Entrees : P = bloc+0x02 (point vise), W = bloc+0x0E (vitesse voulue ; norme 100
; m/s quand GroundAttack_Phase2_EngageAutopilot_775B1 l'ecrit), ma position (objet+0x12), ma
; vitesse (corps+8). Constantes : taux de virage 20 deg/s, acceleration 25 m/s^2, vitesse
; verticale max 50 m/s, pas dtc = max(dt, 0,2 s). CAP : R = |W|*180/(20*pi) (rayon de virage a
; 20 deg/s) ; centres C1,2 = P +/- perp(W)*(R - |W| dt) ; etat JDYN+0x68 (0 = a choisir, 1 =
; cercle C2, 2 = cercle C1) choisi au premier passage (C2 si plus proche et hors de lui, ou si
; dans C1) ; dans le cercle : ecart 0 (tout droit) ; sur le bord (< R + |W| dt) : vise le cap
; de W en tournant dans le sens du cercle ; sinon cap vise = cap(C - moi) +/- asin(R / d)
; (tangente au cercle) ; ecart = cap vise - cap du nez ramene a +/-180, borne a +/-20 deg/s *
; dt ; nez tourne de cet angle (Vector_RotateHeading2D_556D4 sur la ligne 1) puis
; Matrix_OrthonormalizeKeepRow1_57660 ; Autopilot_BankForTurn_49A7C(ecart). ALTITUDE :
; plancher = terrain sous l'avion + 250 m ; si P.z < plancher : P.z = plancher si l'avion est
; dessous, sinon son altitude actuelle ; dz = P.z - z ; vz = dz si |dz| < 50, sinon +/-50 m/s.
; VITESSE HORIZONTALE : rejoint |W| a 25 m/s^2 (egale si l'ecart est inferieur au pas).
; VITESSE = direction horizontale du nez * vitesse horizontale + vz, ECRITE DIRECTEMENT dans
; corps+8/0C/10 ; Autopilot_NosePitchRelax_498B5 ; VITESSE ANGULAIRE JDYN+4/+8/+0x0C REMISE A
; ZERO (dword_707F8..70800 = vecteur nul constant, initialise a 0 dans seg116) : en pilote
; automatique, WorldObject_IntegrateBodyMotion_3D31D ne fait donc tourner l'avion de rien.
; DRAPEAU 'point atteint' bloc+0x1A = 1 si |cap(W) - cap du nez| < 5 deg (modulo 360) ET
; distance(P) < 20 * |W| * dtc (>= 400 m a 100 m/s). La position n'est pas integree ici :
; WorldObject_IntegrateBodyMotion_3D31D (methode +0x14 de l'objet) le fait avec la vitesse
; ecrite.
; ==============================================================================================
Autopilot_FlyToPointKinematic_49C2E	proc far		; CODE XREF: seg103:2CCDp

var_276		= dword	ptr -276h
var_272		= dword	ptr -272h
var_26E		= dword	ptr -26Eh
var_26A		= dword	ptr -26Ah
var_266		= dword	ptr -266h
var_262		= dword	ptr -262h
var_25E		= dword	ptr -25Eh
var_25A		= dword	ptr -25Ah
var_256		= dword	ptr -256h
var_252		= dword	ptr -252h
var_24E		= dword	ptr -24Eh
var_24A		= dword	ptr -24Ah
var_246		= dword	ptr -246h
var_242		= dword	ptr -242h
var_23E		= dword	ptr -23Eh
var_23A		= dword	ptr -23Ah
var_236		= dword	ptr -236h
var_232		= dword	ptr -232h
var_22E		= dword	ptr -22Eh
var_22A		= dword	ptr -22Ah
var_226		= dword	ptr -226h
var_222		= dword	ptr -222h
var_21E		= dword	ptr -21Eh
var_21A		= dword	ptr -21Ah
var_216		= dword	ptr -216h
var_212		= dword	ptr -212h
var_20E		= dword	ptr -20Eh
var_20A		= dword	ptr -20Ah
var_206		= dword	ptr -206h
var_202		= dword	ptr -202h
var_1FE		= dword	ptr -1FEh
var_1FA		= dword	ptr -1FAh
var_1F6		= dword	ptr -1F6h
var_1F2		= dword	ptr -1F2h
var_1EE		= dword	ptr -1EEh
var_1EA		= dword	ptr -1EAh
var_1E6		= dword	ptr -1E6h
var_1E2		= dword	ptr -1E2h
var_1DE		= dword	ptr -1DEh
var_1DA		= dword	ptr -1DAh
var_1D6		= dword	ptr -1D6h
var_1D2		= dword	ptr -1D2h
var_1CE		= dword	ptr -1CEh
var_1CA		= dword	ptr -1CAh
var_1C6		= dword	ptr -1C6h
var_1C2		= dword	ptr -1C2h
var_1BE		= dword	ptr -1BEh
var_1BA		= dword	ptr -1BAh
var_1B6		= dword	ptr -1B6h
var_1B2		= dword	ptr -1B2h
var_1AE		= dword	ptr -1AEh
var_1AA		= dword	ptr -1AAh
var_1A6		= dword	ptr -1A6h
var_1A2		= dword	ptr -1A2h
var_19E		= dword	ptr -19Eh
var_19A		= dword	ptr -19Ah
var_196		= dword	ptr -196h
var_192		= dword	ptr -192h
var_18E		= dword	ptr -18Eh
var_18A		= dword	ptr -18Ah
var_186		= dword	ptr -186h
var_182		= dword	ptr -182h
var_17E		= dword	ptr -17Eh
var_17A		= dword	ptr -17Ah
var_176		= dword	ptr -176h
var_172		= dword	ptr -172h
var_16E		= dword	ptr -16Eh
var_16A		= dword	ptr -16Ah
var_166		= dword	ptr -166h
var_162		= dword	ptr -162h
var_15E		= dword	ptr -15Eh
var_15A		= dword	ptr -15Ah
var_156		= dword	ptr -156h
var_152		= dword	ptr -152h
var_14E		= dword	ptr -14Eh
var_14A		= dword	ptr -14Ah
var_146		= dword	ptr -146h
var_142		= dword	ptr -142h
var_13E		= dword	ptr -13Eh
var_13A		= dword	ptr -13Ah
var_136		= dword	ptr -136h
var_132		= dword	ptr -132h
var_12E		= dword	ptr -12Eh
var_12A		= dword	ptr -12Ah
var_126		= dword	ptr -126h
var_122		= dword	ptr -122h
var_11E		= dword	ptr -11Eh
var_11A		= dword	ptr -11Ah
var_116		= word ptr -116h
var_114		= dword	ptr -114h
var_110		= dword	ptr -110h
var_10C		= dword	ptr -10Ch
var_108		= dword	ptr -108h
var_104		= dword	ptr -104h
var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
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
var_24		= word ptr -24h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 276h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si]
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	di, ax
		mov	bx, [si]
		mov	ax, [bx+2]
		add	ax, 12h
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_17A], eax
		mov	eax, [bx+4]
		mov	[bp+var_176], eax
		mov	eax, [bx+8]
		mov	[bp+var_172], eax
		mov	ax, word ptr [bp+arg_2+2]
		mov	dx, word ptr [bp+arg_2]
		add	dx, 2
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		les	ax, [bp+var_6]
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_186], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_182], eax
		mov	eax, es:[bx+8]

loc_49CA2:
		mov	[bp+var_17E], eax

loc_49CA7:
		mov	ax, word ptr [bp+arg_2+2]
		mov	dx, word ptr [bp+arg_2]

loc_49CAD:
		add	dx, 0Eh
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		les	ax, [bp+var_C]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_E]
		mov	eax, es:[bx]

loc_49CC3:
		mov	[bp+var_192], eax

loc_49CC8:
		mov	eax, es:[bx+4]

loc_49CCD:
		mov	[bp+var_18E], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_18A], eax
		push	eax
		push	large [bp+var_18E]

loc_49CE3:
		push	large [bp+var_192]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax

loc_49CEF:
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_16], eax
		mov	[bp+var_12], eax
		lea	ax, [bp+var_192]
		push	ax
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	eax, [bp+var_186]
		sub	eax, [bp+var_17A]
		mov	[bp+var_19E], eax
		mov	eax, [bp+var_182]
		sub	eax, [bp+var_176]
		mov	[bp+var_19A], eax
		mov	eax, [bp+var_17E]
		sub	eax, [bp+var_172]
		mov	[bp+var_196], eax
		mov	eax, [bp+var_19E]
		mov	[bp+var_1AA], eax
		mov	eax, [bp+var_19A]
		mov	[bp+var_1A6], eax
		mov	eax, [bp+var_196]
		mov	[bp+var_1A2], eax
		push	eax
		push	large [bp+var_1A6]
		push	large [bp+var_1AA]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_22], eax
		mov	[bp+var_1E], eax
		mov	ax, [si]
		add	ax, 8
		mov	[bp+var_24], ax
		mov	bx, [bp+var_24]
		mov	eax, [bx]
		mov	[bp+var_16E], eax
		mov	eax, [bx+4]
		mov	[bp+var_16A], eax
		mov	eax, [bx+8]
		mov	[bp+var_166], eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_166], eax
		push	eax
		push	large [bp+var_16A]
		push	large [bp+var_16E]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_2C], eax

loc_49DCF:
		mov	[bp+var_34], 500h
		mov	[bp+var_38], 1400h

loc_49DDF:
		mov	[bp+var_3C], 1900h

loc_49DE7:
		mov	[bp+var_40], 3200h
		mov	eax, dword_70458
		mov	[bp+var_44], eax
		cmp	[bp+var_44], 33h ; '3'
		jge	short loc_49E06
		mov	[bp+var_44], 33h ; '3'

loc_49E06:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+1CEj
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_44]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_48], eax

loc_49E22:
		mov	eax, [bp+var_12]

loc_49E26:
		mov	edx, dword_70458

loc_49E2B:
		imul	edx

loc_49E2E:
		shrd	eax, edx, 8

loc_49E33:
		mov	[bp+var_54], eax

loc_49E37:
		mov	eax, [bp+var_54]
		mov	[bp+var_50], eax
		mov	[bp+var_58], 324h
		mov	eax, [bp+var_12]
		imul	eax, 0B4h
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	edx, eax
		mov	ecx, [bp+var_38]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]
		mov	edx, eax
		mov	ecx, [bp+var_58]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_192]
		mov	[bp+var_16E], eax
		mov	eax, [bp+var_18E]
		mov	[bp+var_16A], eax
		mov	eax, [bp+var_18A]
		mov	[bp+var_166], eax
		mov	[bp+var_74], 0
		mov	eax, [bp+var_74]
		mov	[bp+var_166], eax
		lea	ax, [bp+var_16E]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp+var_5C]

loc_49EDC:
		sub	eax, [bp+var_50]

loc_49EE0:
		mov	[bp+var_78], eax
		mov	[bp+var_7C], eax

loc_49EE8:
		mov	eax, [bp+var_16E]
		mov	edx, [bp+var_7C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_16E], eax
		mov	eax, [bp+var_16A]
		mov	edx, [bp+var_7C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_16A], eax
		mov	eax, [bp+var_166]
		mov	edx, [bp+var_7C]
		imul	edx
		shrd	eax, edx, 8

loc_49F25:
		mov	[bp+var_166], eax
		mov	eax, [bp+var_16A]

loc_49F2F:
		mov	[bp+var_1B6], eax
		mov	eax, [bp+var_16E]
		neg	eax
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	[bp+var_1B2], eax
		mov	[bp+var_88], 0
		mov	eax, [bp+var_88]
		mov	[bp+var_1AE], eax
		mov	eax, [bp+var_186]
		add	eax, [bp+var_1B6]
		mov	[bp+var_1DA], eax
		mov	eax, [bp+var_182]
		add	eax, [bp+var_1B2]
		mov	[bp+var_1D6], eax
		mov	eax, [bp+var_17E]
		add	eax, [bp+var_1AE]
		mov	[bp+var_1D2], eax
		mov	eax, [bp+var_1DA]
		mov	[bp+var_1E6], eax
		mov	eax, [bp+var_1D6]
		mov	[bp+var_1E2], eax

loc_49F9E:
		mov	eax, [bp+var_1D2]

loc_49FA3:
		mov	[bp+var_1DE], eax
		mov	eax, [bp+var_1E6]
		mov	[bp+var_1CE], eax
		mov	eax, [bp+var_1E2]
		mov	[bp+var_1CA], eax
		mov	eax, [bp+var_1DE]

loc_49FC1:
		mov	[bp+var_1C6], eax

loc_49FC6:
		mov	eax, [bp+var_186]
		sub	eax, [bp+var_1B6]
		mov	[bp+var_1F2], eax

loc_49FD5:
		mov	eax, [bp+var_182]

loc_49FDA:
		sub	eax, [bp+var_1B2]

loc_49FDF:
		mov	[bp+var_1EE], eax

loc_49FE4:
		mov	eax, [bp+var_17E]

loc_49FE9:
		sub	eax, [bp+var_1AE]

loc_49FEE:
		mov	[bp+var_1EA], eax

loc_49FF3:
		mov	eax, [bp+var_1F2]
		mov	[bp+var_1FE], eax
		mov	eax, [bp+var_1EE]
		mov	[bp+var_1FA], eax
		mov	eax, [bp+var_1EA]
		mov	[bp+var_1F6], eax
		mov	eax, [bp+var_1FE]
		mov	[bp+var_1C2], eax
		mov	eax, [bp+var_1FA]

loc_4A020:
		mov	[bp+var_1BE], eax
		mov	eax, [bp+var_1F6]

loc_4A02A:
		mov	[bp+var_1BA], eax
		mov	eax, [bp+var_1C2]
		sub	eax, [bp+var_17A]
		mov	[bp+var_20A], eax
		mov	eax, [bp+var_1BE]
		sub	eax, [bp+var_176]
		mov	[bp+var_206], eax
		mov	eax, [bp+var_1BA]
		sub	eax, [bp+var_172]
		mov	[bp+var_202], eax
		mov	eax, [bp+var_20A]
		mov	[bp+var_216], eax
		mov	eax, [bp+var_206]
		mov	[bp+var_212], eax
		mov	eax, [bp+var_202]
		mov	[bp+var_20E], eax
		push	eax
		push	large [bp+var_212]
		push	large [bp+var_216]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_90], eax
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_1CE]
		sub	eax, [bp+var_17A]
		mov	[bp+var_222], eax

loc_4A0AB:
		mov	eax, [bp+var_1CA]

loc_4A0B0:
		sub	eax, [bp+var_176]

loc_4A0B5:
		mov	[bp+var_21E], eax
		mov	eax, [bp+var_1C6]
		sub	eax, [bp+var_172]
		mov	[bp+var_21A], eax
		mov	eax, [bp+var_222]

loc_4A0CE:
		mov	[bp+var_22E], eax

loc_4A0D3:
		mov	eax, [bp+var_21E]

loc_4A0D8:
		mov	[bp+var_22A], eax

loc_4A0DD:
		mov	eax, [bp+var_21A]

loc_4A0E2:
		mov	[bp+var_226], eax

loc_4A0E7:
		push	eax
		push	large [bp+var_22A]
		push	large [bp+var_22E]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_98], eax
		mov	[bp+var_94], eax
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_9C]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	eax, [bp+var_1A]
		sub	eax, [bp+var_9C]

loc_4A126:
		mov	[bp+var_A4], eax
		mov	[bp+var_A0], eax
		cmp	byte ptr [si+68h], 0
		jnz	short loc_4A1A9
		mov	eax, [bp+var_8C]
		cmp	eax, [bp+var_94]
		jge	short loc_4A147
		mov	ax, 1
		jmp	short loc_4A149
; ���������������������������������������������������������������������������

loc_4A147:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+512j
		xor	ax, ax

loc_4A149:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+517j
		or	al, al
		jz	short loc_4A176
		mov	eax, [bp+var_5C]
		sub	eax, [bp+var_50]
		mov	[bp+var_A8], eax
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_8C]
		cmp	eax, [bp+var_AC]
		jle	short loc_4A170
		mov	ax, 1
		jmp	short loc_4A172
; ���������������������������������������������������������������������������

loc_4A170:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+53Bj
		xor	ax, ax

loc_4A172:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+540j
		or	al, al
		jnz	short loc_4A19F

loc_4A176:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+51Dj
		mov	eax, [bp+var_5C]
		sub	eax, [bp+var_50]
		mov	[bp+var_B0], eax
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_94]
		cmp	eax, [bp+var_B4]
		jge	short loc_4A199
		mov	ax, 1
		jmp	short loc_4A19B
; ���������������������������������������������������������������������������

loc_4A199:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+564j
		xor	ax, ax

loc_4A19B:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+569j
		or	al, al
		jz	short loc_4A1A5

loc_4A19F:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+546j
		mov	byte ptr [si+68h], 1
		jmp	short loc_4A1A9
; ���������������������������������������������������������������������������

loc_4A1A5:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+56Fj
		mov	byte ptr [si+68h], 2

loc_4A1A9:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+506j
					; Autopilot_FlyToPointKinematic_49C2E+575j
		mov	eax, [bp+var_8C]
		cmp	eax, [bp+var_5C]

loc_4A1B2:
		jge	short loc_4A1B9
		mov	ax, 1
		jmp	short loc_4A1BB
; ���������������������������������������������������������������������������

loc_4A1B9:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A1B2j
		xor	ax, ax

loc_4A1BB:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+589j
		or	al, al
		jz	short loc_4A1C5
		cmp	byte ptr [si+68h], 1
		jz	short loc_4A1E1

loc_4A1C5:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+58Fj
		mov	eax, [bp+var_94]

loc_4A1CA:
		cmp	eax, [bp+var_5C]
		jge	short loc_4A1D5

loc_4A1D0:
		mov	ax, 1
		jmp	short loc_4A1D7
; ���������������������������������������������������������������������������

loc_4A1D5:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+5A0j
		xor	ax, ax

loc_4A1D7:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+5A5j
		or	al, al
		jz	short loc_4A1F7
		cmp	byte ptr [si+68h], 2
		jnz	short loc_4A1F7

loc_4A1E1:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+595j
		mov	[bp+var_B8], 0
		mov	eax, [bp+var_B8]
		mov	[bp+var_A0], eax
		jmp	loc_4A43E
; ���������������������������������������������������������������������������

loc_4A1F7:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+5ABj
					; Autopilot_FlyToPointKinematic_49C2E+5B1j
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_50]
		mov	[bp+var_BC], eax
		mov	[bp+var_C0], eax
		mov	eax, [bp+var_8C]
		cmp	eax, [bp+var_C0]
		jge	short loc_4A21A
		mov	ax, 1
		jmp	short loc_4A21C
; ���������������������������������������������������������������������������

loc_4A21A:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+5E5j
		xor	ax, ax

loc_4A21C:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+5EAj
		or	al, al
		jz	short loc_4A23F

loc_4A220:
		cmp	byte ptr [si+68h], 1

loc_4A224:
		jnz	short loc_4A23F

loc_4A226:
		cmp	[bp+var_A0], 0

loc_4A22C:
		jle	short loc_4A233

loc_4A22E:
		mov	ax, 1

loc_4A231:
		jmp	short loc_4A235
; ���������������������������������������������������������������������������

loc_4A233:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A22Cj
		xor	ax, ax

loc_4A235:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A231j
		or	al, al

loc_4A237:
		jnz	short loc_4A23C
		jmp	loc_4A43E
; ���������������������������������������������������������������������������

loc_4A23C:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A237j
		jmp	loc_4A414
; ���������������������������������������������������������������������������

loc_4A23F:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+5F0j
					; Autopilot_FlyToPointKinematic_49C2E:loc_4A224j
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_50]
		mov	[bp+var_C4], eax
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_94]
		cmp	eax, [bp+var_C8]
		jge	short loc_4A262
		mov	ax, 1
		jmp	short loc_4A264
; ���������������������������������������������������������������������������

loc_4A262:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+62Dj
		xor	ax, ax

loc_4A264:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+632j
		or	al, al
		jz	short loc_4A287
		cmp	byte ptr [si+68h], 2
		jnz	short loc_4A287
		cmp	[bp+var_A0], 0
		jge	short loc_4A27B
		mov	ax, 1
		jmp	short loc_4A27D
; ���������������������������������������������������������������������������

loc_4A27B:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+646j
		xor	ax, ax

loc_4A27D:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+64Bj
		or	al, al
		jnz	short loc_4A284
		jmp	loc_4A43E
; ���������������������������������������������������������������������������

loc_4A284:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+651j
		jmp	loc_4A435
; ���������������������������������������������������������������������������

loc_4A287:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+638j
					; Autopilot_FlyToPointKinematic_49C2E+63Ej
		cmp	byte ptr [si+68h], 1
		jz	short loc_4A290
		jmp	loc_4A31C
; ���������������������������������������������������������������������������

loc_4A290:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+65Dj
		mov	eax, [bp+var_1C2]
		sub	eax, [bp+var_17A]
		mov	[bp+var_252], eax

loc_4A29F:
		mov	eax, [bp+var_1BE]
		sub	eax, [bp+var_176]

loc_4A2A9:
		mov	[bp+var_24E], eax

loc_4A2AE:
		mov	eax, [bp+var_1BA]

loc_4A2B3:
		sub	eax, [bp+var_172]
		mov	[bp+var_24A], eax
		mov	eax, [bp+var_252]

loc_4A2C2:
		mov	[bp+var_25E], eax
		mov	eax, [bp+var_24E]

loc_4A2CC:
		mov	[bp+var_25A], eax

loc_4A2D1:
		mov	eax, [bp+var_24A]
		mov	[bp+var_256], eax
		lea	ax, [bp+var_25E]
		push	ax
		push	ss

loc_4A2E1:
		lea	ax, [bp+var_152]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	eax, [bp+var_152]

loc_4A2F3:
		mov	[bp+var_14E], eax
		lea	ax, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	ss
		lea	ax, [bp+var_162]
		push	ax
		call	Math_AsinOfRatio_54A76
		add	sp, 8
		mov	eax, [bp+var_162]
		add	[bp+var_14E], eax
		jmp	loc_4A3A5
; ���������������������������������������������������������������������������

loc_4A31C:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+65Fj
		mov	eax, [bp+var_1CE]

loc_4A321:
		sub	eax, [bp+var_17A]

loc_4A326:
		mov	[bp+var_26A], eax

loc_4A32B:
		mov	eax, [bp+var_1CA]

loc_4A330:
		sub	eax, [bp+var_176]

loc_4A335:
		mov	[bp+var_266], eax
		mov	eax, [bp+var_1C6]
		sub	eax, [bp+var_172]
		mov	[bp+var_262], eax
		mov	eax, [bp+var_26A]
		mov	[bp+var_276], eax
		mov	eax, [bp+var_266]
		mov	[bp+var_272], eax
		mov	eax, [bp+var_262]
		mov	[bp+var_26E], eax
		lea	ax, [bp+var_276]
		push	ax
		push	ss
		lea	ax, [bp+var_156]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	eax, [bp+var_156]
		mov	[bp+var_14E], eax
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		push	ss
		lea	ax, [bp+var_162]
		push	ax
		call	Math_AsinOfRatio_54A76
		add	sp, 8
		mov	eax, [bp+var_162]
		sub	[bp+var_14E], eax

loc_4A3A5:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+6EBj
		cmp	[bp+var_14E], 0FFFF4C00h
		jge	short loc_4A3B5
		mov	ax, 1

loc_4A3B3:
		jmp	short loc_4A3B7
; ���������������������������������������������������������������������������

loc_4A3B5:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+780j
		xor	ax, ax

loc_4A3B7:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A3B3j
		or	al, al
		jz	short loc_4A3C6
		add	[bp+var_14E], 16800h
		jmp	short loc_4A3E5
; ���������������������������������������������������������������������������

loc_4A3C6:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+78Bj
		cmp	[bp+var_14E], 0B400h
		jle	short loc_4A3D6

loc_4A3D1:
		mov	ax, 1
		jmp	short loc_4A3D8
; ���������������������������������������������������������������������������

loc_4A3D6:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+7A1j
		xor	ax, ax

loc_4A3D8:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+7A6j
		or	al, al
		jz	short loc_4A3E5

loc_4A3DC:
		sub	[bp+var_14E], 16800h

loc_4A3E5:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+796j
					; Autopilot_FlyToPointKinematic_49C2E+7ACj
		mov	eax, [bp+var_14E]

loc_4A3EA:
		sub	eax, [bp+var_9C]
		mov	[bp+var_15A], eax
		mov	[bp+var_15E], eax
		mov	[bp+var_A0], eax
		cmp	[bp+var_A0], 0B400h
		jle	short loc_4A40E
		mov	ax, 1
		jmp	short loc_4A410
; ���������������������������������������������������������������������������

loc_4A40E:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+7D9j
		xor	ax, ax

loc_4A410:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+7DEj
		or	al, al
		jz	short loc_4A41F

loc_4A414:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A23Cj
		sub	[bp+var_A0], 16800h
		jmp	short loc_4A43E
; ���������������������������������������������������������������������������

loc_4A41F:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+7E4j
		cmp	[bp+var_A0], 0FFFF4C00h
		jge	short loc_4A42F

loc_4A42A:
		mov	ax, 1
		jmp	short loc_4A431
; ���������������������������������������������������������������������������

loc_4A42F:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+7FAj
		xor	ax, ax

loc_4A431:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+7FFj
		or	al, al
		jz	short loc_4A43E

loc_4A435:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A284j
		add	[bp+var_A0], 16800h

loc_4A43E:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+5C6j
					; Autopilot_FlyToPointKinematic_49C2E+60Bj ...
		mov	eax, [bp+var_38]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_D0]
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_A0]
		or	eax, eax
		jge	short loc_4A46B
		neg	eax

loc_4A46B:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+838j
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_D8], eax
		cmp	eax, [bp+var_CC]
		jge	short loc_4A486
		mov	ax, 1
		jmp	short loc_4A488
; ���������������������������������������������������������������������������

loc_4A486:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+851j
		xor	ax, ax

loc_4A488:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+856j
		or	al, al
		jz	short loc_4A493
		mov	eax, [bp+var_A0]
		jmp	short loc_4A4B8
; ���������������������������������������������������������������������������

loc_4A493:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+85Cj
		cmp	[bp+var_A0], 0
		jge	short loc_4A4A0
		mov	ax, 1
		jmp	short loc_4A4A2
; ���������������������������������������������������������������������������

loc_4A4A0:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+86Bj
		xor	ax, ax

loc_4A4A2:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+870j
		or	al, al
		jz	short loc_4A4BD
		mov	eax, [bp+var_CC]
		neg	eax
		mov	[bp+var_DC], eax
		mov	[bp+var_E0], eax

loc_4A4B8:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+863j
		mov	[bp+var_CC], eax

loc_4A4BD:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+876j
		lea	ax, [bp+var_CC]
		push	ax
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	Vector_RotateHeading2D_556D4
		add	sp, 4
		push	di

loc_4A4D1:
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_A0]
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr Autopilot_BankForTurn_49A7C
		add	sp, 6
		mov	eax, [bp+var_40]
		mov	[bp+var_E4], eax
		push	0
		mov	[bp+var_EC], 0
		mov	eax, [bp+var_EC]
		mov	[bp+var_23A], eax
		mov	[bp+var_F0], 0
		mov	eax, [bp+var_F0]
		mov	[bp+var_236], eax
		mov	[bp+var_F4], 100h

loc_4A51F:
		mov	eax, [bp+var_F4]
		mov	[bp+var_232], eax

loc_4A529:
		lea	ax, [bp+var_23A]
		push	ax
		lea	ax, [bp+var_17A]
		push	ax

loc_4A533:
		push	word_70474
		push	ss
		lea	ax, [bp+var_E8]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		add	[bp+var_E8], 0FA00h
		mov	eax, [bp+var_17E]
		cmp	eax, [bp+var_E8]
		jge	short loc_4A55F
		mov	ax, 1
		jmp	short loc_4A561
; ���������������������������������������������������������������������������

loc_4A55F:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+92Aj
		xor	ax, ax

loc_4A561:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+92Fj
		or	al, al
		jz	short loc_4A58D
		mov	eax, [bp+var_172]
		cmp	eax, [bp+var_E8]
		jge	short loc_4A576
		mov	ax, 1
		jmp	short loc_4A578
; ���������������������������������������������������������������������������

loc_4A576:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+941j
		xor	ax, ax

loc_4A578:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+946j
		or	al, al
		jz	short loc_4A583
		mov	eax, [bp+var_E8]
		jmp	short loc_4A588
; ���������������������������������������������������������������������������

loc_4A583:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+94Cj
		mov	eax, [bp+var_172]

loc_4A588:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+953j
		mov	[bp+var_17E], eax

loc_4A58D:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+935j
		mov	eax, [bp+var_17E]
		sub	eax, [bp+var_172]
		mov	[bp+var_F8], eax
		mov	[bp+var_FC], eax

loc_4A5A1:
		mov	eax, [bp+var_FC]

loc_4A5A6:
		or	eax, eax

loc_4A5A9:
		jge	short loc_4A5AE
		neg	eax

loc_4A5AE:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A5A9j
		mov	[bp+var_100], eax

loc_4A5B3:
		mov	eax, [bp+var_100]
		mov	[bp+var_104], eax

loc_4A5BD:
		cmp	eax, [bp+var_E4]

loc_4A5C2:
		jge	short loc_4A5C9
		mov	ax, 1

loc_4A5C7:
		jmp	short loc_4A5CB
; ���������������������������������������������������������������������������

loc_4A5C9:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A5C2j
		xor	ax, ax

loc_4A5CB:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A5C7j
		or	al, al
		jz	short loc_4A5E5

loc_4A5CF:
		mov	eax, [bp+var_17E]

loc_4A5D4:
		sub	eax, [bp+var_172]
		mov	[bp+var_108], eax
		mov	[bp+var_10C], eax

loc_4A5E3:
		jmp	short loc_4A60E
; ���������������������������������������������������������������������������

loc_4A5E5:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+99Fj
		mov	eax, [bp+var_172]
		cmp	eax, [bp+var_17E]
		jle	short loc_4A5F6
		mov	ax, 1
		jmp	short loc_4A5F8
; ���������������������������������������������������������������������������

loc_4A5F6:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+9C1j
		xor	ax, ax

loc_4A5F8:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+9C6j
		or	al, al
		jz	short loc_4A613
		mov	eax, [bp+var_E4]
		neg	eax
		mov	[bp+var_110], eax
		mov	[bp+var_114], eax

loc_4A60E:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A5E3j
		mov	[bp+var_E4], eax

loc_4A613:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+9CCj
		mov	ax, di
		add	ax, 0Ch
		mov	[bp+var_116], ax
		mov	bx, [bp+var_116]
		mov	eax, [bx]

loc_4A623:
		mov	[bp+var_246], eax

loc_4A628:
		mov	eax, [bx+4]

loc_4A62C:
		mov	[bp+var_242], eax

loc_4A631:
		mov	eax, [bx+8]

loc_4A635:
		mov	[bp+var_23E], eax
		mov	eax, [bp+var_3C]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_12]
		sub	eax, [bp+var_2C]
		mov	[bp+var_122], eax
		mov	[bp+var_126], eax
		mov	eax, [bp+var_126]
		or	eax, eax
		jge	short loc_4A679
		neg	eax

loc_4A679:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+A46j
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_12A]
		mov	[bp+var_12E], eax
		cmp	eax, [bp+var_11A]
		jge	short loc_4A694
		mov	ax, 1
		jmp	short loc_4A696
; ���������������������������������������������������������������������������

loc_4A694:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+A5Fj
		xor	ax, ax

loc_4A696:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+A64j
		or	al, al
		jz	short loc_4A6A4
		mov	eax, [bp+var_12]

loc_4A69E:
		mov	[bp+var_2C], eax
		jmp	short loc_4A6CD
; ���������������������������������������������������������������������������

loc_4A6A4:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+A6Aj
		mov	eax, [bp+var_2C]
		cmp	eax, [bp+var_12]
		jle	short loc_4A6B3
		mov	ax, 1
		jmp	short loc_4A6B5
; ���������������������������������������������������������������������������

loc_4A6B3:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+A7Ej
		xor	ax, ax

loc_4A6B5:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+A83j
		or	al, al
		jz	short loc_4A6C4
		mov	eax, [bp+var_11A]

loc_4A6BE:
		sub	[bp+var_2C], eax
		jmp	short loc_4A6CD
; ���������������������������������������������������������������������������

loc_4A6C4:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+A89j
		mov	eax, [bp+var_11A]
		add	[bp+var_2C], eax

loc_4A6CD:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+A74j
					; Autopilot_FlyToPointKinematic_49C2E+A94j
		mov	[bp+var_132], 0

loc_4A6D6:
		mov	eax, [bp+var_132]

loc_4A6DB:
		mov	[bp+var_23E], eax

loc_4A6E0:
		lea	ax, [bp+var_246]
		push	ax

loc_4A6E5:
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp+var_246]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_246], eax
		mov	eax, [bp+var_242]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_242], eax
		mov	eax, [bp+var_23E]
		mov	edx, [bp+var_2C]

loc_4A720:
		imul	edx

loc_4A723:
		shrd	eax, edx, 8

loc_4A728:
		mov	[bp+var_23E], eax
		mov	eax, [bp+var_E4]

loc_4A732:
		mov	[bp+var_23E], eax

loc_4A737:
		mov	bx, [si]
		mov	eax, [bp+var_246]
		mov	[bx+8],	eax
		mov	eax, [bp+var_242]
		mov	[bx+0Ch], eax
		mov	eax, [bp+var_23E]
		mov	[bx+10h], eax
		mov	ax, [si]
		add	ax, 8
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr Autopilot_NosePitchRelax_498B5
		add	sp, 6
		mov	eax, dword_707F8
		mov	[si+4],	eax
		mov	eax, dword_707FC
		mov	[si+8],	eax
		mov	eax, dword_70800
		mov	[si+0Ch], eax
		mov	eax, [bp+var_1A]
		sub	eax, [bp+var_9C]
		mov	[bp+var_136], eax
		mov	[bp+var_13A], eax
		mov	[bp+var_A0], eax
		cmp	[bp+var_A0], 0FFFE9D00h
		jge	short loc_4A7A3
		mov	ax, 1

loc_4A7A1:
		jmp	short loc_4A7A5
; ���������������������������������������������������������������������������

loc_4A7A3:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+B6Ej
		xor	ax, ax

loc_4A7A5:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A7A1j
		or	al, al
		jnz	short loc_4A7F1
		cmp	[bp+var_A0], 16300h

loc_4A7B2:
		jle	short loc_4A7B9

loc_4A7B4:
		mov	ax, 1
		jmp	short loc_4A7BB
; ���������������������������������������������������������������������������

loc_4A7B9:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A7B2j
		xor	ax, ax

loc_4A7BB:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+B89j
		or	al, al
		jnz	short loc_4A7F1

loc_4A7BF:
		mov	eax, [bp+var_A0]
		or	eax, eax
		jge	short loc_4A7CC
		neg	eax

loc_4A7CC:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+B99j
		mov	[bp+var_13E], eax

loc_4A7D1:
		mov	eax, [bp+var_13E]
		mov	[bp+var_142], eax
		cmp	[bp+var_142], 500h
		jge	short loc_4A7EB
		mov	ax, 1
		jmp	short loc_4A7ED
; ���������������������������������������������������������������������������

loc_4A7EB:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+BB6j
		xor	ax, ax

loc_4A7ED:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+BBBj
		or	al, al

loc_4A7EF:
		jz	short loc_4A821

loc_4A7F1:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+B79j
					; Autopilot_FlyToPointKinematic_49C2E+B8Fj
		mov	eax, [bp+var_48]

loc_4A7F5:
		imul	eax, 14h
		mov	[bp+var_146], eax
		mov	[bp+var_14A], eax
		mov	eax, [bp+var_1E]
		cmp	eax, [bp+var_14A]
		jge	short loc_4A813
		mov	ax, 1
		jmp	short loc_4A815
; ���������������������������������������������������������������������������

loc_4A813:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+BDEj
		xor	ax, ax

loc_4A815:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E+BE3j
		or	al, al
		jz	short loc_4A821
		les	bx, [bp+arg_2]
		mov	byte ptr es:[bx+1Ah], 1

loc_4A821:				; CODE XREF: Autopilot_FlyToPointKinematic_49C2E:loc_4A7EFj
					; Autopilot_FlyToPointKinematic_49C2E+BE9j
		pop	di
		pop	si
		leave
		retf
Autopilot_FlyToPointKinematic_49C2E	endp

; ���������������������������������������������������������������������������

loc_4A825:				; CODE XREF: seg082:116AJ seg082:1222J ...
		push	bp

loc_4A826:
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+6]
		push	si
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Aero_SumLinearForces_48639
		add	sp, 6
		lea	ax, [bp-0Ch]
		push	ax
		push	word ptr [si]
		call	Physics_IntegratePosition_46300
		add	sp, 4
		mov	al, 1
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, ~0x4A85B, ~350L, seg103 — LE TICK DE LA DYNAMIQUE AVION (classe JDYN + 3 variantes ;
; slot 'Update' des vtables installees par JDYN_LoadChunk, tags seg339 0x228A/0x2312/0x2362 ;
; appele par 4 thunks d'ajusteur this dans seg082). A NE PAS confondre avec
; FlightPhysics_TickCandidate_4F4EE (seg109) qui est le tick de 3 classes DYNM plus simples
; (missile/bombe, vtables seg339 ~0x1CFE). si = la struct JDYN 0xC5 (= [playerCtx+0x0B]).
; Deroule : (1) Terrain_QueryAltitudeAt + detection 'au sol' [A+0x20] conditionnee par la
; difficulte word_70466 ; (2) FlightControl_InvalidateAllCachesGlobal (reset caches aero) ;
; (3) MANETTE DES GAZ -> POUSSEE : cran es:[obj2+0x1E] (0-10, MIL 0-5 / AFT 1-5) rate-limite
; (dword_72A2C*10), Aero_ComputeCoeffSaturating(si+0x22, cran) -> [si+0x28] = poussee courante
; (x gain dword_72A2C) ; (4) CONSO CARBURANT : facteur 0x33 si MIL (cran<=5) sinon 0x4C (AFT
; ~1.5x), burn = base*dword_72A14*[si+0x33](SFC)*cran*dt(dword_70458), [si+0x6D] -= burn,
; flameout ([si+0x28]=0) si [si+0x6D]<=0 ; (5) etat volets/aerofrein/train depuis les bits du
; sous-objet controle es:[obj2+0x1C/0x1D] + Roster('FLAPS'/'LANDGEAR') ; (6) vitesse =
; |A.velocity([A+8/C/10])| ; (7) si [si+0x68] != 0xFF et !flags_75.bit5 ->
; Autopilot_FlyToPointKinematic_49C2E (AUTOPILOTE cinematique) SINON manuel :
; Aero_ComputeControlFlags75Bit5A -> [A+0x14/18/1C] (taux angulaires) ;
; Aero_ComputeControlFlags75Bit5A(si) -> [A+0x14/18/1C] = SOMMATION DES FORCES (poussee
; [si+0x28] + portance/trainee + gravite + drag flags_75, en acceleration) ;
; Aero_ControlOrchestrator -> moment -> Physics_IntegrateSecondaryPosition (orientation si+4)
; ; drag sol sur [si+0x0C] si |A.vitesse|<0x2800 ; Physics_IntegratePosition([si]=A,
; [si]+0x14) : A.vitesse [A+8/C/10] += accel[A+0x14..]*dt (transform corps->monde
; [[A+2]+0x70]) ; contrainte sol : projection de la vitesse hors du plan sol, vy>=0, deadband
; |v|<5. La POSITION monde n'est PAS integree ici (faite par [si+2]->[bx+0x34] en tete de
; tick, sur l'objet monde, ordre integre-puis-calcule). Sous-objet A ([si]->jdyn+0x8E) : +0x02
; ptr membre, +8/C/10 vitesse, +0x14/18/1C acceleration, +0x20 flag 'au sol'. Detail :
; analysis/DATA_MODEL.md §6.2.
; ==============================================================================================
PhysicsTicks:				; CODE XREF: seg082:1153J
					; seg082:loc_3B67BJ ...
		push	bp
		mov	bp, sp
		sub	sp, 0BAh
		push	si
		push	di
		mov	si, [bp+6]
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+34h]
		pop	cx
		push	1
		lea	ax, [bp-66h]
		push	ax
		mov	bx, [si]
		mov	ax, [bx+2]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp-4]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	bx, word_70474
		mov	al, [bx+207h]
		mov	[bp-5],	al
		cmp	word_70466, 0
		jnz	short loc_4A89B
		mov	bx, [si]
		mov	byte ptr [bx+20h], 1

loc_4A89B:				; CODE XREF: seg103:28D3j
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_4A907

loc_4A8A3:
		cmp	word_70466, 3

loc_4A8A8:
		jbe	short loc_4A907
		cmp	byte ptr [bp-5], 0

loc_4A8AE:
		jz	short loc_4A907
		push	si

loc_4A8B1:
		mov	bx, [si+2]
		call	dword ptr [bx+38h]
		pop	cx
		mov	bx, [si]
		push	word ptr [bx+2]
		push	ss
		lea	ax, [bp-0Ah]
		push	ax

loc_4A8C2:
		call	Gauge_ComputeNeedlePosition

loc_4A8C7:
		add	sp, 6
		mov	eax, [bp-0Ah]

loc_4A8CE:
		add	[bp-4],	eax

loc_4A8D2:
		add	dword ptr [bp-4], 0A00h
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	eax, [bx+1Ah]

loc_4A8E3:
		cmp	eax, [bp-4]
		jle	short loc_4A8EF

loc_4A8E9:
		mov	bx, [si]

loc_4A8EB:
		mov	byte ptr [bx+20h], 0

loc_4A8EF:				; CODE XREF: seg103:2927j
		mov	bx, [si]

loc_4A8F1:
		mov	ax, [bx+2]
		cmp	ax, word_722E6
		jnz	short loc_4A907
		mov	al, byte_6E4D0
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4A907
		mov	byte ptr [bx+20h], 0

loc_4A907:				; CODE XREF: seg103:28E1j
					; seg103:loc_4A8A8j ...
		push	si
		nop
		push	cs
		call	near ptr FlightControl_InvalidateAllCachesGlobal
		pop	cx
		mov	eax, [bp+8]
		mov	[bp-0Eh], eax
		cmp	dword ptr [si+6Dh], 0
		jg	short loc_4A930

loc_4A91D:
		mov	dword ptr [si+6Dh], 0

loc_4A925:
		mov	dword ptr [si+28h], 0
		jmp	loc_4AA9C
; ���������������������������������������������������������������������������

loc_4A930:				; CODE XREF: seg103:295Bj
		les	bx, [bp-0Eh]

loc_4A933:
		mov	al, es:[bx+1Eh]
		mov	[bp-2Ch], al
		mov	eax, dword_72A2C
		imul	eax, 0Ah
		mov	[bp-34h], eax
		mov	[bp-30h], eax
		cmp	dword ptr [bp-30h], 0
		jge	short loc_4A95B
		add	eax, 0FFFFFF80h
		sar	eax, 8
		jmp	short loc_4A969
; ���������������������������������������������������������������������������

loc_4A95B:				; CODE XREF: seg103:298Fj
		mov	eax, [bp-30h]
		add	eax, 80h ; '�'
		sar	eax, 8

loc_4A969:				; CODE XREF: seg103:2999j
		mov	[bp-36h], al
		mov	al, [bp-2Ch]
		cmp	al, [bp-36h]
		jle	short loc_4A97A
		mov	al, [bp-36h]
		mov	[bp-2Ch], al

loc_4A97A:				; CODE XREF: seg103:29B2j
		mov	al, [bp-2Ch]
		mov	[bp-38h], al
		les	bx, [bp-0Eh]
		mov	es:[bx+1Eh], al
		mov	[bp-3Ah], al
		push	ax
		mov	ax, si
		add	ax, 22h	; '"'
		push	ax
		push	ss
		lea	ax, [bp-3Eh]
		push	ax
		call	Aero_ThrottleThrustCurve_4730F
		add	sp, 8
		mov	eax, [bp-3Eh]
		mov	[si+28h], eax
		mov	eax, [si+28h]
		mov	edx, dword_72A2C
		imul	edx
		shrd	eax, edx, 8
		mov	[si+28h], eax
		cmp	byte ptr [bp-2Ch], 5
		jg	short loc_4A9EF
		mov	al, [bp-2Ch]
		cbw
		mov	[bp-44h], ax
		movsx	eax, word ptr [bp-44h]
		shl	eax, 8
		mov	[bp-48h], eax

loc_4A9D5:
		mov	eax, [bp-48h]
		mov	[bp-42h], eax

loc_4A9DD:
		mov	dword ptr [bp-4Ch], 33h	; '3'
		mov	eax, [bp-42h]
		mov	edx, [bp-4Ch]

loc_4A9ED:
		jmp	short loc_4AA1B
; ���������������������������������������������������������������������������

loc_4A9EF:				; CODE XREF: seg103:29FFj
		mov	al, [bp-2Ch]
		cbw

loc_4A9F3:
		mov	[bp-4Eh], ax
		movsx	eax, word ptr [bp-4Eh]
		shl	eax, 8
		mov	[bp-52h], eax
		mov	eax, [bp-52h]
		mov	[bp-42h], eax
		mov	dword ptr [bp-56h], 4Ch	; 'L'
		mov	eax, [bp-42h]
		mov	edx, [bp-56h]

loc_4AA1B:				; CODE XREF: seg103:loc_4A9EDj
		imul	edx
		shrd	eax, edx, 8

loc_4AA23:
		mov	[bp-42h], eax

loc_4AA27:
		mov	dword ptr [bp-5Ah], 0FFFFF700h

loc_4AA2F:
		mov	eax, [bp-5Ah]

loc_4AA33:
		mov	edx, dword_72A14

loc_4AA38:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-5Ah], eax
		add	dword ptr [bp-5Ah], 0A00h
		mov	di, si
		add	di, 33h	; '3'
		mov	eax, [bp-5Ah]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-5Ah], eax
		cmp	dword ptr [bp-42h], 0
		jle	short loc_4AA7F
		mov	eax, [bp-5Ah]
		mov	edx, [bp-42h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-5Ah], eax

loc_4AA7F:				; CODE XREF: seg103:2AA9j
		mov	eax, [bp-5Ah]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-5Ah], eax
		mov	eax, [bp-5Ah]
		sub	[si+6Dh], eax

loc_4AA9C:				; CODE XREF: seg103:296Dj
		mov	bx, [si]
		mov	bx, [bx+2]

loc_4AAA1:
		mov	ax, [bx+60h]

loc_4AAA4:
		mov	dx, [bx+5Eh]
		mov	[bp-10h], ax

loc_4AAAA:
		mov	[bp-12h], dx

loc_4AAAD:
		les	bx, [bp-0Eh]

loc_4AAB0:
		mov	al, es:[bx+1Ch]

loc_4AAB4:
		shr	ax, 5

loc_4AAB7:
		and	ax, 1
		or	al, al
		jz	short loc_4AAD5
		mov	al, [si+75h]
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+75h], 0FEh

loc_4AAD2:
		or	[si+75h], al

loc_4AAD5:				; CODE XREF: seg103:2AFCj
		les	bx, [bp-0Eh]
		mov	al, es:[bx+1Ch]
		shr	ax, 4
		and	ax, 1
		or	al, al
		jz	short loc_4AB17
		push	ds
		push	offset aFlaps	; "FLAPS"
		push	large dword ptr	[bp-12h]
		call	Roster_FindByNameAndFlag

loc_4AAF3:
		add	sp, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4AB17
		mov	al, [si+75h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+75h], 0FDh
		shl	al, 1
		or	[si+75h], al

loc_4AB17:				; CODE XREF: seg103:2B24j seg103:2B3Aj
		les	bx, [bp-0Eh]
		mov	al, es:[bx+1Ch]
		shr	ax, 7

loc_4AB21:
		and	ax, 1
		or	al, al
		jz	short loc_4AB45

loc_4AB28:
		mov	al, [si+75h]

loc_4AB2B:
		shr	ax, 4
		and	ax, 1

loc_4AB31:
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+75h], 0EFh
		shl	al, 4
		or	[si+75h], al

loc_4AB45:				; CODE XREF: seg103:2B66j
		les	bx, [bp-0Eh]
		mov	al, es:[bx+1Dh]
		and	ax, 1
		or	al, al
		jz	short loc_4AB85
		mov	al, [si+75h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+75h], 0DFh
		shl	al, 5
		or	[si+75h], al
		mov	al, [si+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_4AB85
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+44h]
		pop	cx

loc_4AB85:				; CODE XREF: seg103:2B91j seg103:2BBBj
		les	bx, [bp-0Eh]
		mov	al, es:[bx+1Dh]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_4ABC2
		mov	ax, [si+75h]
		shr	ax, 7
		and	ax, 3
		cmp	al, 2
		jnb	short loc_4ABBD
		mov	ax, [si+75h]

loc_4ABA5:
		shr	ax, 7
		and	ax, 3
		inc	al

loc_4ABAD:
		and	ax, 3
		and	word ptr [si+75h], 0FE7Fh
		shl	ax, 7
		or	[si+75h], ax
		jmp	short loc_4ABC2
; ���������������������������������������������������������������������������

loc_4ABBD:				; CODE XREF: seg103:2BE0j
		and	word ptr [si+75h], 0FE7Fh

loc_4ABC2:				; CODE XREF: seg103:2BD3j seg103:2BFBj
		les	bx, [bp-0Eh]

loc_4ABC5:
		mov	al, es:[bx+1Ch]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_4AC06
		push	ds
		push	offset aLandgear ; "LANDGEAR"
		push	large dword ptr	[bp-12h]
		call	Roster_FindByNameOrder
		add	sp, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4AC06
		mov	al, [si+75h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+75h], 0FBh
		shl	al, 2
		or	[si+75h], al

loc_4AC06:				; CODE XREF: seg103:2C11j seg103:2C27j
		cmp	word_70466, 0
		jnz	short loc_4AC3A
		mov	bx, [si]
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]
		push	large dword ptr	[bx+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax

loc_4AC22:
		pop	eax
		add	sp, 0Ch
		mov	[bp-16h], eax

loc_4AC2B:
		mov	[bp-1Ah], eax

loc_4AC2F:
		cmp	dword ptr [bp-1Ah], 0

loc_4AC34:
		jnz	short loc_4AC3A
		or	byte ptr [si+75h], 4

loc_4AC3A:				; CODE XREF: seg103:2C4Bj
					; seg103:loc_4AC34j
		cmp	word_70466, 0
		jnz	short loc_4AC72
		mov	bx, [si]
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]
		push	large dword ptr	[bx+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-1Eh], eax
		mov	[bp-22h], eax
		cmp	dword ptr [bp-22h], 0
		jz	short loc_4AC72
		les	bx, [bp-0Eh]
		mov	byte ptr es:[bx+1Eh], 4

loc_4AC72:				; CODE XREF: seg103:2C7Fj seg103:2CA8j
		cmp	byte ptr [si+68h], 0FFh
		jz	short loc_4AC96
		mov	al, [si+75h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4AC96
		push	large dword ptr	[bp+8]
		push	si
		push	cs
		call	near ptr Autopilot_FlyToPointKinematic_49C2E
		add	sp, 6
		jmp	loc_4AECA
; ���������������������������������������������������������������������������

loc_4AC96:				; CODE XREF: seg103:2CB6j seg103:2CC5j
		push	si
		push	ss
		lea	ax, [bp-72h]
		push	ax
		push	cs
		call	near ptr Aero_SumLinearForces_48639
		add	sp, 6

loc_4ACA3:
		mov	bx, [si]
		mov	eax, [bp-72h]

loc_4ACA9:
		mov	[bx+14h], eax
		mov	eax, [bp-6Eh]
		mov	[bx+18h], eax
		mov	eax, [bp-6Ah]
		mov	[bx+1Ch], eax
		push	large dword ptr	[bp-0Eh]
		push	si
		push	ss

loc_4ACC3:
		lea	ax, [bp-7Eh]
		push	ax
		push	cs
		call	near ptr Aero_ControlOrchestrator_48FC2
		add	sp, 0Ah
		lea	ax, [bp-7Eh]
		push	ax
		push	si
		call	Physics_IntegrateSecondaryPosition
		add	sp, 4
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0

loc_4ACE1:
		jnz	short loc_4ACE6

loc_4ACE3:
		jmp	loc_4AD8D
; ���������������������������������������������������������������������������

loc_4ACE6:				; CODE XREF: seg103:loc_4ACE1j
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]

loc_4ACEE:
		push	large dword ptr	[bx+8]

loc_4ACF2:
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-26h], eax
		mov	[bp-2Ah], eax
		cmp	dword ptr [bp-2Ah], 2800h
		jge	short loc_4AD8D
		mov	ax, [bp-0Ch]
		mov	dx, [bp-0Eh]
		add	dx, 23h	; '#'
		mov	[bp-30h], ax
		mov	[bp-32h], dx

loc_4AD1F:
		les	bx, [bp-32h]

loc_4AD22:
		mov	eax, es:[bx]

loc_4AD26:
		mov	[bp-2Eh], eax
		mov	ebx, 10h
		cdq

loc_4AD32:
		idiv	ebx
		mov	[bp-2Eh], eax
		mov	bx, [si]
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]
		push	large dword ptr	[bx+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-36h], eax
		mov	[bp-3Ah], eax
		mov	eax, [bp-2Eh]
		mov	edx, [bp-3Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-2Eh], eax
		mov	ebx, 4
		mov	eax, [bp-2Eh]
		cdq
		idiv	ebx
		mov	[bp-2Eh], eax
		neg	eax
		mov	[bp-2Eh], eax
		mov	[si+0Ch], eax

loc_4AD8D:				; CODE XREF: seg103:loc_4ACE3j
					; seg103:2D4Ej
		mov	ax, [si]
		add	ax, 14h
		push	ax
		push	word ptr [si]
		call	Physics_IntegratePosition_46300
		add	sp, 4
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jnz	short loc_4ADA8
		jmp	loc_4AEC3
; ���������������������������������������������������������������������������

loc_4ADA8:				; CODE XREF: seg103:2DE3j
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp-2Ch], ax
		push	ax
		lea	ax, [bp-0A2h]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	di, [si]
		add	di, 8
		mov	eax, [di]
		mov	[bp-0AEh], eax
		mov	eax, [di+4]
		mov	[bp-0AAh], eax
		mov	eax, [di+8]

loc_4ADDF:
		mov	[bp-0A6h], eax
		lea	ax, [bp-0A2h]
		push	ax
		lea	ax, [bp-0AEh]
		push	ax
		push	ss
		lea	ax, [bp-0BAh]
		push	ax
		call	Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		mov	eax, [bp-0BAh]
		sub	[bp-0AEh], eax
		mov	eax, [bp-0B6h]
		sub	[bp-0AAh], eax
		mov	eax, [bp-0B2h]
		sub	[bp-0A6h], eax
		cmp	dword ptr [bp-0A6h], 0

loc_4AE20:
		jge	short loc_4AE2B

loc_4AE22:
		mov	dword ptr [bp-0A6h], 0

loc_4AE2B:				; CODE XREF: seg103:loc_4AE20j
		push	large dword ptr	[bp-0A6h]

loc_4AE30:
		push	large dword ptr	[bp-0AAh]

loc_4AE35:
		push	large dword ptr	[bp-0AEh]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-30h], eax
		mov	[bp-34h], eax
		cmp	dword ptr [bp-34h], 5
		jge	short loc_4AE67
		xor	eax, eax
		mov	[bp-0A6h], eax
		mov	[bp-0AAh], eax
		mov	[bp-0AEh], eax

loc_4AE67:				; CODE XREF: seg103:2E93j
		mov	bx, [si]
		mov	eax, [bp-0AEh]
		mov	[bx+8],	eax
		mov	eax, [bp-0AAh]
		mov	[bx+0Ch], eax
		mov	eax, [bp-0A6h]
		mov	[bx+10h], eax
		lea	ax, [bp-0A2h]
		push	ax
		push	ss
		lea	ax, [bp-38h]
		push	ax
		call	Matrix_NosePitchAngle_57C3A
		add	sp, 6
		mov	eax, [bp-38h]
		mov	edx, dword_70454
		imul	edx

loc_4AEA2:
		shrd	eax, edx, 8

loc_4AEA7:
		mov	[bp-38h], eax
		mov	eax, [bp-38h]
		neg	eax

loc_4AEB2:
		cmp	[si+4],	eax

loc_4AEB6:
		jge	short loc_4AEC3
		mov	eax, [bp-38h]
		neg	eax
		mov	[si+4],	eax

loc_4AEC3:				; CODE XREF: seg103:2DE5j
					; seg103:loc_4AEB6j
		push	si
		nop
		push	cs
		call	near ptr FlightControl_InvalidateAllCachesGlobal
		pop	cx

loc_4AECA:				; CODE XREF: seg103:2CD3j
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,10L — accesseur identité trivial.
; ==============================================================================================
FlightControl_IdentityAccessor	proc far		; CODE XREF: FlightControl_InvalidateAllCachesGlobal+3Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
FlightControl_IdentityAccessor	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — invalide en série tous les caches de moments/coefficients du segment (sub_469EC,
; sub_478C5, sub_47095, sub_470B4, sub_477D0) : invalidation globale complète de tous les
; caches aérodynamiques avant un nouveau tick physique — orchestrateur de reset.
; ==============================================================================================
FlightControl_InvalidateAllCachesGlobal	proc far		; CODE XREF: seg103:294Ap seg103:2F06p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_4AEDF:
		mov	byte_6FF9A, 0
		push	si
		call	FlightControl_InvalidateRollPitchCache
		pop	cx
		push	si
		call	FlightControl_InvalidateMainCache
		pop	cx

loc_4AEF2:
		push	word ptr [si+10h]
		call	FlightControl_InvalidateMomentCache
		pop	cx
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	FlightControl_InvalidateCacheB
		pop	cx
		mov	ax, si
		add	ax, 22h	; '"'
		push	ax
		call	FlightControl_InvalidateCacheC
		pop	cx
		push	si
		push	cs
		call	near ptr FlightControl_IdentityAccessor
		pop	cx
		pop	si
		pop	bp
		retf
FlightControl_InvalidateAllCachesGlobal	endp

; ���������������������������������������������������������������������������

loc_4AF1C:				; CODE XREF: seg082:12C3J
					; DATA XREF: seg339:off_6F37Eo
		push	bp
		mov	bp, sp
		push	si

loc_4AF20:
		mov	si, [bp+6]

loc_4AF23:
		mov	ax, 100h

loc_4AF26:
		call	Math_RandomScale_54DF4

loc_4AF2B:
		mov	[si+77h], al

loc_4AF2E:
		or	byte ptr [si+75h], 20h

loc_4AF32:
		pop	si

loc_4AF33:
		pop	bp

locret_4AF34:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,169L — résout un vecteur de force (+0xC/0x10) puis effectue un calcul additionnel
; (buffer local important) : sous-calcul de force additionnelle dans le pipeline de contrôle
; de vol.
; ==============================================================================================
Aero_ComputeAdditionalForce	proc far		; CODE XREF: Aero_ComputeControlFlags75Bit5C+1A6p
					; JDYN_HighLevelPhysicsCalc+148p

var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
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
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_4AF38:
		sub	sp, 3Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	bx, [si]
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]
		push	large dword ptr	[bx+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Aero_FlowAngle_AoA_469FE
		add	sp, 6
		push	si
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	Aero_FlowAngle_Sideslip_46AB5
		add	sp, 6
		mov	eax, [bp+var_C]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		push	large 0
		push	eax
		push	large [bp+var_18]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax

loc_4AFA0:
		add	sp, 0Ch
		mov	[bp+var_20], eax

loc_4AFA7:
		mov	[bp+var_1C], eax
		mov	di, si
		add	di, 71h	; 'q'
		mov	eax, [di]
		mov	[bp+var_24], eax
		mov	al, [si+4Bh]
		mov	ah, 0
		add	ax, 0FFFBh
		mov	[bp+var_2A], ax
		movsx	eax, [bp+var_2A]
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_28]
		jle	short loc_4AFDE
		mov	ax, 1
		jmp	short loc_4AFE0
; ���������������������������������������������������������������������������

loc_4AFDE:				; CODE XREF: Aero_ComputeAdditionalForce+A2j
		xor	ax, ax

loc_4AFE0:				; CODE XREF: Aero_ComputeAdditionalForce+A7j
		or	al, al
		jz	short loc_4B01C

loc_4AFE4:
		mov	eax, [bp+var_1C]

loc_4AFE8:
		sub	eax, [bp+var_28]

loc_4AFEC:
		mov	[bp+var_2E], eax

loc_4AFF0:
		mov	[bp+var_32], eax
		add	eax, 100h
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_24]
		mov	edx, eax
		mov	ecx, [bp+var_3A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax

loc_4B01C:				; CODE XREF: Aero_ComputeAdditionalForce+ADj
		mov	ax, [si+75h]

loc_4B01F:
		shr	ax, 7

loc_4B022:
		and	ax, 3
		cmp	al, 2
		jnz	short loc_4B045

loc_4B029:
		mov	[bp+var_3E], 99h ; '�'

loc_4B031:
		mov	eax, [bp+var_24]
		mov	edx, [bp+var_3E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax

loc_4B045:				; CODE XREF: Aero_ComputeAdditionalForce+F2j
		mov	eax, [si+59h]
		cmp	eax, [bp+var_4]
		jle	short loc_4B07F
		mov	eax, [bp+var_24]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		add	si, 59h	; 'Y'
		mov	eax, [bp+var_24]
		mov	edx, eax
		mov	ecx, [si]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax

loc_4B07F:				; CODE XREF: Aero_ComputeAdditionalForce+118j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_24]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Aero_ComputeAdditionalForce	endp

; ���������������������������������������������������������������������������

loc_4B093:				; CODE XREF: seg082:11DDJ
					; DATA XREF: seg339:off_6F382o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, dx
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,328L — grosse fonction du même cluster physique (buffer local 0x68), appelée par des
; fonctions de tick de haut niveau (sub_7E56/sub_7F34) : candidat pour un calcul physique de
; haut niveau intégrant le résultat du modèle de vol JDYN, à approfondir.
; ==============================================================================================
JDYN_HighLevelPhysicsCalc	proc far		; CODE XREF: AI_RollController_7E56+ACP
					; AI_FlightControl_Cluster+19BP

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
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp

loc_4B0A0:
		sub	sp, 68h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, si
		add	di, 47h	; 'G'
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	di, si
		add	di, 47h	; 'G'
		mov	eax, [di]
		mov	[bp+var_C], eax
		xor	di, di
		jmp	short loc_4B109
; ���������������������������������������������������������������������������

loc_4B0E1:				; CODE XREF: JDYN_HighLevelPhysicsCalc+7Fj
					; JDYN_HighLevelPhysicsCalc+94j
		inc	di
		add	[bp+var_8], 100h
		mov	eax, [bp+var_8]
		sar	eax, 1
		mov	[bp+var_8], eax
		add	[bp+var_C], 200h
		mov	eax, [bp+var_C]
		sar	eax, 2
		mov	[bp+var_C], eax

loc_4B109:				; CODE XREF: JDYN_HighLevelPhysicsCalc+42j
		cmp	[bp+var_8], 0B5000h
		jl	short loc_4B118
		mov	ax, 1
		jmp	short loc_4B11A
; ���������������������������������������������������������������������������

loc_4B118:				; CODE XREF: JDYN_HighLevelPhysicsCalc+74j
		xor	ax, ax

loc_4B11A:				; CODE XREF: JDYN_HighLevelPhysicsCalc+79j
		or	al, al
		jnz	short loc_4B0E1

loc_4B11E:
		cmp	[bp+var_C], 0B5000h
		jl	short loc_4B12D
		mov	ax, 1
		jmp	short loc_4B12F
; ���������������������������������������������������������������������������

loc_4B12D:				; CODE XREF: JDYN_HighLevelPhysicsCalc+89j
		xor	ax, ax

loc_4B12F:				; CODE XREF: JDYN_HighLevelPhysicsCalc+8Ej
		or	al, al
		jnz	short loc_4B0E1

loc_4B133:
		mov	eax, [bp+arg_6]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		or	eax, eax
		jge	short loc_4B15B
		neg	eax

loc_4B15B:				; CODE XREF: JDYN_HighLevelPhysicsCalc+B9j
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		shl	eax, 1
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	[bp+var_C], eax
		lea	ax, [bp+var_8]
		push	ax
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		call	Math_Square_54C39
		add	sp, 6
		mov	eax, [bp+var_28]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		add	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	ss
		lea	ax, [bp+var_2C]
		push	ax

loc_4B1A0:
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp+var_2C]
		mov	[bp+var_8], eax
		or	di, di
		jz	short loc_4B1CA

loc_4B1B4:
		movsx	eax, di
		mov	[bp+var_30], eax
		mov	cl, byte ptr [bp+var_30]
		mov	eax, [bp+var_8]
		shl	eax, cl
		mov	[bp+var_8], eax

loc_4B1CA:				; CODE XREF: JDYN_HighLevelPhysicsCalc+115j
		mov	eax, [bp+var_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	[bp+var_8], eax
		push	si
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		push	cs
		call	near ptr Aero_ComputeAdditionalForce
		add	sp, 6
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_3C]

loc_4B1F3:
		jle	short loc_4B1FA
		mov	ax, 1
		jmp	short loc_4B1FC
; ���������������������������������������������������������������������������

loc_4B1FA:				; CODE XREF: JDYN_HighLevelPhysicsCalc:loc_4B1F3j
		xor	ax, ax

loc_4B1FC:				; CODE XREF: JDYN_HighLevelPhysicsCalc+15Bj
		or	al, al
		jz	short loc_4B206
		mov	eax, [bp+var_3C]
		jmp	short loc_4B239
; ���������������������������������������������������������������������������

loc_4B206:				; CODE XREF: JDYN_HighLevelPhysicsCalc+161j
		mov	eax, [bp+var_3C]
		neg	eax
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_44]
		jge	short loc_4B224
		mov	ax, 1
		jmp	short loc_4B226
; ���������������������������������������������������������������������������

loc_4B224:				; CODE XREF: JDYN_HighLevelPhysicsCalc+180j
		xor	ax, ax

loc_4B226:				; CODE XREF: JDYN_HighLevelPhysicsCalc+185j
		or	al, al

loc_4B228:
		jz	short loc_4B23D
		mov	eax, [bp+var_3C]

loc_4B22E:
		neg	eax

loc_4B231:
		mov	[bp+var_48], eax
		mov	[bp+var_4C], eax

loc_4B239:				; CODE XREF: JDYN_HighLevelPhysicsCalc+167j
		mov	[bp+var_8], eax

loc_4B23D:				; CODE XREF: JDYN_HighLevelPhysicsCalc:loc_4B228j
		cmp	[bp+arg_6], 0
		jge	short loc_4B249
		mov	ax, 1
		jmp	short loc_4B24B
; ���������������������������������������������������������������������������

loc_4B249:				; CODE XREF: JDYN_HighLevelPhysicsCalc+1A5j
		xor	ax, ax

loc_4B24B:				; CODE XREF: JDYN_HighLevelPhysicsCalc+1AAj
		or	al, al
		jz	short loc_4B262
		mov	eax, [bp+var_8]
		neg	eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	[bp+var_8], eax

loc_4B262:				; CODE XREF: JDYN_HighLevelPhysicsCalc+1B0j
		add	si, 8
		mov	eax, [bp+var_8]
		sub	eax, [si]
		mov	[bp+var_5C], eax
		mov	[bp+var_58], eax
		cmp	[bp+var_3C], 0
		jz	short loc_4B280
		mov	ax, 1
		jmp	short loc_4B282
; ���������������������������������������������������������������������������

loc_4B280:				; CODE XREF: JDYN_HighLevelPhysicsCalc+1DCj
		xor	ax, ax

loc_4B282:				; CODE XREF: JDYN_HighLevelPhysicsCalc+1E1j
		or	al, al
		jz	short loc_4B2AE
		mov	eax, [bp+var_8]
		imul	eax, 10h
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_3C]
		sar	edx, 18h

loc_4B2A1:
		shl	eax, 8
		idiv	ecx

loc_4B2A8:
		mov	[bp+var_8], eax

loc_4B2AC:
		jmp	short loc_4B2BE
; ���������������������������������������������������������������������������

loc_4B2AE:				; CODE XREF: JDYN_HighLevelPhysicsCalc+1E7j
		mov	[bp+var_60], 0
		mov	eax, [bp+var_60]
		mov	[bp+var_8], eax

loc_4B2BE:				; CODE XREF: JDYN_HighLevelPhysicsCalc:loc_4B2ACj
		cmp	[bp+var_8], 1000h
		jle	short loc_4B2CD
		mov	ax, 1
		jmp	short loc_4B2CF
; ���������������������������������������������������������������������������

loc_4B2CD:				; CODE XREF: JDYN_HighLevelPhysicsCalc+229j
		xor	ax, ax

loc_4B2CF:				; CODE XREF: JDYN_HighLevelPhysicsCalc+22Ej
		or	al, al
		jz	short loc_4B2E1
		mov	[bp+var_64], 1000h
		mov	eax, [bp+var_64]
		jmp	short loc_4B302
; ���������������������������������������������������������������������������

loc_4B2E1:				; CODE XREF: JDYN_HighLevelPhysicsCalc+234j
		cmp	[bp+var_8], 0FFFFF000h
		jge	short loc_4B2F0
		mov	ax, 1
		jmp	short loc_4B2F2
; ���������������������������������������������������������������������������

loc_4B2F0:				; CODE XREF: JDYN_HighLevelPhysicsCalc+24Cj
		xor	ax, ax

loc_4B2F2:				; CODE XREF: JDYN_HighLevelPhysicsCalc+251j
		or	al, al
		jz	short loc_4B306
		mov	[bp+var_68], 0FFFFF000h
		mov	eax, [bp+var_68]

loc_4B302:				; CODE XREF: JDYN_HighLevelPhysicsCalc+242j
		mov	[bp+var_8], eax

loc_4B306:				; CODE XREF: JDYN_HighLevelPhysicsCalc+257j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
JDYN_HighLevelPhysicsCalc	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0C8h

loc_4B321:
		push	si
		push	di

loc_4B323:
		mov	si, [bp+6]

loc_4B326:
		mov	eax, [bp+8]
		mov	edx, dword_70454

loc_4B32F:
		imul	edx

loc_4B332:
		shrd	eax, edx, 8
		mov	[bp+8],	eax
		mov	di, [bp+0Ch]
		push	word ptr [di+51h]
		mov	bx, [di+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	di, ax
		lea	ax, [bp+8]
		push	ax
		push	word ptr [di]
		push	ss
		lea	ax, [bp-80h]
		push	ax
		call	Physics_ApplyForceAtPointAlt
		add	sp, 8
		push	large dword ptr	[bp-78h]
		push	large dword ptr	[bp-7Ch]
		push	large dword ptr	[bp-80h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-8],	eax
		mov	[bp-4],	eax
		lea	ax, [bp+8]
		push	ax
		push	word ptr [di]
		push	ss
		lea	ax, [bp-98h]
		push	ax
		call	Physics_ApplyForceAtPoint
		add	sp, 8
		mov	bx, [si]
		mov	di, [bx+2]
		add	di, 12h
		mov	eax, [bp-98h]
		sub	eax, [di]
		mov	[bp-0A4h], eax
		mov	eax, [bp-94h]
		sub	eax, [di+4]
		mov	[bp-0A0h], eax
		mov	eax, [bp-90h]
		sub	eax, [di+8]
		mov	[bp-9Ch], eax
		mov	eax, [bp-0A4h]
		mov	[bp-8Ch], eax
		mov	eax, [bp-0A0h]
		mov	[bp-88h], eax
		mov	eax, [bp-9Ch]
		mov	[bp-84h], eax
		push	eax

loc_4B3E4:
		push	large dword ptr	[bp-88h]
		push	large dword ptr	[bp-8Ch]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-10h], eax
		mov	[bp-14h], eax
		sub	eax, [bp+0Eh]
		mov	[bp-18h], eax
		mov	[bp-0Ch], eax
		mov	bx, [si]
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]
		push	large dword ptr	[bx+8]
		call	Math_VectorLength3D_Raw_5828E

loc_4B421:
		push	dx
		push	ax

loc_4B423:
		pop	eax

loc_4B425:
		add	sp, 0Ch

loc_4B428:
		mov	[bp-20h], eax

loc_4B42C:
		mov	[bp-1Ch], eax

loc_4B430:
		mov	eax, [bp-0Ch]

loc_4B434:
		mov	edx, eax
		mov	ecx, [bp+8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-2Ch], eax
		mov	eax, [bp-2Ch]
		mov	[bp-28h], eax
		sub	eax, [bp-1Ch]
		mov	[bp-34h], eax
		mov	[bp-38h], eax
		shl	eax, 1
		mov	[bp-3Ch], eax
		mov	[bp-30h], eax
		cmp	eax, [bp-4]
		jle	short loc_4B474
		mov	ax, 1
		jmp	short loc_4B476
; ���������������������������������������������������������������������������

loc_4B474:				; CODE XREF: seg103:34ADj
		xor	ax, ax

loc_4B476:				; CODE XREF: seg103:34B2j
		or	al, al
		jz	short loc_4B4C8
		mov	eax, [bp-0Ch]
		shl	eax, 1
		mov	[bp-0Ch], eax
		mov	eax, [bp+0Eh]
		add	[bp-0Ch], eax
		mov	eax, [bp+8]
		shl	eax, 1
		mov	[bp+8],	eax
		mov	eax, [bp-0Ch]
		mov	edx, eax
		mov	ecx, [bp+8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-40h], eax
		mov	eax, [bp-40h]
		mov	[bp-44h], eax
		mov	[bp-24h], eax
		mov	eax, [bp-1Ch]
		sub	[bp-24h], eax
		jmp	short loc_4B4DC
; ���������������������������������������������������������������������������

loc_4B4C8:				; CODE XREF: seg103:34B8j
		mov	eax, [bp-28h]
		sub	eax, [bp-1Ch]
		mov	[bp-48h], eax
		mov	[bp-4Ch], eax
		mov	[bp-24h], eax

loc_4B4DC:				; CODE XREF: seg103:3506j
		mov	eax, [bp-24h]
		mov	edx, eax
		mov	ecx, [bp+8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-24h], eax
		mov	eax, [bp-24h]
		shl	eax, 1
		mov	[bp-24h], eax
		mov	dword ptr [bp-50h], 0
		mov	dword ptr [bp-54h], 0
		mov	eax, [bp-50h]
		mov	[bp-0B0h], eax
		mov	eax, [bp-54h]

loc_4B51E:
		mov	[bp-0ACh], eax

loc_4B523:
		mov	eax, dword_6FFD7
		mov	[bp-0A8h], eax
		lea	ax, [bp-8Ch]
		push	ax

loc_4B531:
		lea	ax, [bp-0B0h]
		push	ax
		push	ss
		lea	ax, [bp-0BCh]
		push	ax
		call	Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		push	large dword ptr	[bp-0B4h]
		push	large dword ptr	[bp-0B8h]
		push	large dword ptr	[bp-0BCh]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-58h], eax
		mov	[bp-5Ch], eax
		add	[bp-24h], eax
		mov	di, [si]
		add	di, 4
		mov	eax, [bp-24h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-60h], eax
		mov	eax, [bp-60h]
		mov	[bp-64h], eax
		push	si
		push	ss
		lea	ax, [bp-0C8h]
		push	ax
		push	cs
		call	near ptr Aero_ComputeDragWithFeedback_48400
		add	sp, 6
		push	large dword ptr	[bp-0C0h]

loc_4B59E:
		push	large dword ptr	[bp-0C4h]

loc_4B5A3:
		push	large dword ptr	[bp-0C8h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-68h], eax
		mov	[bp-6Ch], eax
		mov	eax, [bp-64h]
		add	eax, [bp-6Ch]
		mov	[bp-70h], eax
		mov	[bp-74h], eax
		lea	ax, [bp-74h]
		push	ax
		mov	ax, si
		add	ax, 22h	; '"'
		push	ax
		call	Aero_ComputeCoeffAltSaturating
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0B4h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		push	word ptr [di+51h]
		mov	bx, [di+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	di, ax
		mov	dword ptr [bp-4], 100h
		lea	ax, [bp-4]
		push	ax
		push	word ptr [di]
		push	ss
		lea	ax, [bp-6Ch]
		push	ax
		call	Physics_ApplyForceAtPoint
		add	sp, 8
		mov	eax, [bp-6Ch]
		shl	eax, 1

loc_4B621:
		mov	[bp-8],	eax

loc_4B625:
		mov	[bp-0Ch], eax
		mov	eax, [bp-68h]

loc_4B62D:
		shl	eax, 1

loc_4B630:
		mov	[bp-10h], eax

loc_4B634:
		mov	[bp-14h], eax
		mov	eax, [bp-64h]
		shl	eax, 1
		mov	[bp-18h], eax
		mov	[bp-1Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-78h], eax
		mov	eax, [bp-14h]
		mov	[bp-74h], eax
		mov	eax, [bp-1Ch]
		mov	[bp-70h], eax
		mov	bx, [si]
		mov	di, [bx+2]
		add	di, 12h
		mov	eax, [bp-78h]
		sub	eax, [di]
		mov	[bp-84h], eax
		mov	eax, [bp-74h]
		sub	eax, [di+4]
		mov	[bp-80h], eax
		mov	eax, [bp-70h]
		sub	eax, [di+8]
		mov	[bp-7Ch], eax
		mov	eax, [bp-84h]
		mov	[bp-90h], eax
		mov	eax, [bp-80h]
		mov	[bp-8Ch], eax
		mov	eax, [bp-7Ch]
		mov	[bp-88h], eax
		mov	dword ptr [bp-20h], 100h

loc_4B6AF:
		lea	ax, [bp-20h]
		push	ax

loc_4B6B3:
		push	bx
		push	ss

loc_4B6B5:
		lea	ax, [bp-9Ch]
		push	ax
		call	Physics_ApplyForceAtPoint
		add	sp, 8
		mov	eax, [bp-90h]
		sub	eax, [bp-9Ch]
		mov	[bp-0A8h], eax
		mov	eax, [bp-8Ch]
		sub	eax, [bp-98h]
		mov	[bp-0A4h], eax
		mov	eax, [bp-88h]
		sub	eax, [bp-94h]
		mov	[bp-0A0h], eax
		mov	eax, [bp-0A8h]
		mov	[bp-0B4h], eax
		mov	eax, [bp-0A4h]
		mov	[bp-0B0h], eax
		mov	eax, [bp-0A0h]
		mov	[bp-0ACh], eax
		mov	eax, [bp-0B4h]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[bp-24h], eax

loc_4B721:
		mov	[bp-28h], eax

loc_4B725:
		mov	eax, [bp-0B0h]
		cdq

loc_4B72C:
		idiv	ebx
		mov	[bp-2Ch], eax

loc_4B733:
		mov	[bp-30h], eax
		mov	eax, [bp-0ACh]
		cdq
		idiv	ebx
		mov	[bp-34h], eax
		mov	[bp-38h], eax
		mov	eax, [bp-28h]
		mov	[bp-60h], eax
		mov	eax, [bp-30h]
		mov	[bp-5Ch], eax
		mov	eax, [bp-38h]
		mov	[bp-58h], eax
		lea	ax, [bp-60h]
		push	ax
		mov	ax, [si]
		add	ax, 8
		push	ax
		push	ss
		lea	ax, [bp-3Ch]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	bx, [si]
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]
		push	large dword ptr	[bx+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-44h], eax
		mov	[bp-48h], eax
		mov	eax, [bp-48h]
		mov	edx, [bp-3Ch]
		imul	edx

loc_4B7A5:
		shrd	eax, edx, 8

loc_4B7AA:
		mov	[bp-4Ch], eax
		mov	eax, [bp-4Ch]

loc_4B7B2:
		mov	[bp-40h], eax
		mov	eax, [bp-40h]
		mov	edx, dword_707B6
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-40h], eax
		mov	eax, [bp+6]
		mov	[bp-50h], eax
		mov	eax, [bp-40h]
		mov	edx, eax
		mov	ecx, dword_6FFD7
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-54h], eax
		mov	bx, [bp-50h]
		mov	eax, [bp-54h]
		mov	[bx], eax
		mov	es, word ptr [bp-4Eh]
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,115L — résout un paramètre de contrôle nommé (sub_46DA3) divisé par une constante
; (0x14A), applique une résolution supplémentaire (sub_54BF1) : résolution d'un paramètre de
; contrôle normalisé pour le modèle de vol.
; ==============================================================================================
FlightControl_ResolveNormalizedParam	proc far		; CODE XREF: AI_Sensor_DistanceFromRef+44P

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [si]
		add	di, 8
		mov	eax, [di]
		mov	[bp+var_18], eax
		mov	eax, [di+4]
		mov	[bp+var_14], eax
		mov	eax, [di+8]
		mov	[bp+var_10], eax
		push	word ptr [si+10h]
		push	ss
		lea	ax, [bp+var_4]

loc_4B833:
		push	ax
		call	Atmosphere_AirDensityAtAltitude_46DA3
		add	sp, 6
		mov	[bp+var_8], 14Ah
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_18]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax

loc_4B89F:
		mov	eax, [bp+var_10]

loc_4B8A3:
		mov	edx, [bp+var_4]
		imul	edx

loc_4B8AA:
		shrd	eax, edx, 8

loc_4B8AF:
		mov	[bp+var_10], eax

loc_4B8B3:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4B8BE
		mov	ax, si
		jmp	short loc_4B8C8
; ���������������������������������������������������������������������������

loc_4B8BE:				; CODE XREF: FlightControl_ResolveNormalizedParam+B3j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4B8C8:				; CODE XREF: FlightControl_ResolveNormalizedParam+B7j
		or	ax, ax
		jz	short loc_4B8E7
		mov	eax, [bp+var_18]
		mov	[si], eax
		mov	eax, [bp+var_14]
		mov	[si+4],	eax
		mov	eax, [bp+var_10]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_4B8E9
; ���������������������������������������������������������������������������

loc_4B8E7:				; CODE XREF: FlightControl_ResolveNormalizedParam+C5j
		mov	ax, si

loc_4B8E9:				; CODE XREF: FlightControl_ResolveNormalizedParam+E0j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di

loc_4B8F0:
		pop	si
		leave
		retf
FlightControl_ResolveNormalizedParam	endp

; ���������������������������������������������������������������������������

loc_4B8F3:				; DATA XREF: seg339:off_71EF6o
		push	bp
		mov	bp, sp
		pop	bp
		retf
seg103		ends
