ovr228		segment	para public 'OVERLAY' use16
		assume cs:ovr228
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 220 lignes, NON DETAILLEE - point d'entree garde ('load-once') du chargement de profil
; pilote : verifie un flag a +0x27 (si deja pose, saute tout le reste de la fonction - evite
; un rechargement). Sinon, copie deux champs (+0x5A/+0x5C, lus via un objet indirect a +0x102)
; vers +0x104/+0x106 de l'entite courante, puis appelle successivement
; PilotProfile_LoadFromPROF_73B4F (chunk PROF/_AI_/MVRS/GOAL) et sub_73FB4 (chargeur IFF
; distinct, role encore incertain) SUR LE MEME POINTEUR 'this' - confirme que la structure
; PilotProfile EST l'entite avion/pilote elle-meme, pas une sous-structure separee.
; Anciennement mal nommee AircraftDamageModel_ComputeStatus. Appelee par
; AIAircraft_LoadProfileWrapper_9D4D2 via VROOMM_StubThunk_6AB07, elle-meme appelee depuis
; AIAircraft_SpawnAndConditionalLoadProfile_53363 (seg114, systeme Expr_VM) - uniquement pour
; les entites non-PLAYER. TRAITS ATRB CORRIGES 2026-09-25 : le chargeur
; PilotProfile_LoadATRB_12E47 range les octets du fichier (ordre TH, CN, VB, LY, FL, AG, AA,
; SM, AR, 10e) a profil+0x97, +0x99, +0x98, +0x9A, +0x96, +0x9B, +0x9C, +0x9D, +0x9E, +0x9F ;
; le profil vit a entite+0x1A (constructeur : 'mov word ptr es:[bx+1Ah], 368h', vtable 0x368
; slot 0 = PilotProfile_LoadATRB_12E47). Donc entite+0xB0 = FL (Flying), +0xB1 = TH, +0xB2 =
; VB, +0xB3 = CN, +0xB4 = LY, +0xB5 = AG, +0xB6 = AA, +0xB7 = SM, +0xB8 = AR, +0xB9 = 10e
; octet. Toute mention ci-dessus de TH pour +0xB0, CN pour +0xB1, LY pour +0xB3 ou FL pour
; +0xB4 est a lire selon cette table.
; ==============================================================================================
AIAircraft_LoadProfileGuarded_73940	proc far		; CODE XREF: VROOMM_StubThunk_6AB07J

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
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+27h], 0
		jz	short loc_73956
		mov	ax, 1
		jmp	short loc_73958
; ���������������������������������������������������������������������������

loc_73956:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+Fj
		xor	ax, ax

loc_73958:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+14j
		mov	ah, 0
		or	ax, ax
		jz	short loc_73961
		jmp	loc_73B4C
; ���������������������������������������������������������������������������

loc_73961:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+1Cj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ah
		push	word ptr [bp+arg_0+2]
		push	ax
		call	VROOMM_StubThunk_6B63A
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+106h], ax
		mov	es:[bx+104h], dx
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PilotProfile_LoadFromPROF_73B4F
		add	sp, 4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr PilotProfile_LoadNUMSCompanionFile_73FB4
		add	sp, 4
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+102h], 0
		jnz	short loc_739BF
		jmp	loc_73B4C
; ���������������������������������������������������������������������������

loc_739BF:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+7Aj
		mov	bx, es:[bx+102h]
		mov	si, [bx+51h]
		or	si, si
		jnz	short loc_739CE
		jmp	loc_73B4C
; ���������������������������������������������������������������������������

loc_739CE:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+89j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+48h]
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], ax
		cmp	word ptr es:[bx+0Bh], 0
		jnz	short loc_739E6
		jmp	loc_73B4C
; ���������������������������������������������������������������������������

loc_739E6:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+A1j
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+67h], 6
		jnb	short loc_73A24
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+67h]
		mov	ah, 0
		imul	ax, 5Ah
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_6], eax
		mov	ebx, 6
		cdq
		idiv	ebx
		jmp	short loc_73A30
; ���������������������������������������������������������������������������

loc_73A24:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+AEj
		mov	[bp+var_10], 5A00h
		mov	eax, [bp+var_10]

loc_73A30:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+E2j
		mov	[bp+var_6], eax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B0h]
		cbw
		mov	[bp+var_1A], ax
		movsx	eax, [bp+var_1A]
		shl	eax, 8
		mov	[bp+var_18], eax
		cmp	[bp+var_18], 800h
		jge	short loc_73A5C
		mov	ax, 1
		jmp	short loc_73A5E
; ���������������������������������������������������������������������������

loc_73A5C:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+115j
		xor	ax, ax

loc_73A5E:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+11Aj
		or	al, al
		jz	short loc_73A72
		mov	[bp+var_1E], 800h
		mov	eax, [bp+var_1E]
		mov	[bp+var_18], eax

loc_73A72:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+120j
		mov	ebx, 10h
		mov	eax, [bp+var_18]
		cdq
		idiv	ebx
		mov	[bp+var_18], eax
		imul	eax, 9
		mov	[bp+var_18], eax
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+67h]
		mov	ah, 0
		mov	[bp+var_20], ax
		movsx	ebx, [bp+var_20]
		mov	eax, [bp+var_18]
		cdq
		idiv	ebx
		mov	[bp+var_18], eax
		imul	eax, 10h
		mov	[bp+var_18], eax
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+0DDh], eax
		mov	eax, [bp+var_14]
		sar	eax, 1
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	[bp+var_28], eax
		cmp	[bp+var_28], 500h
		jle	short loc_73AED
		mov	ax, 1
		jmp	short loc_73AEF
; ���������������������������������������������������������������������������

loc_73AED:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+1A6j
		xor	ax, ax

loc_73AEF:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+1ABj
		or	al, al
		jz	short loc_73B03
		mov	[bp+var_38], 500h
		mov	eax, [bp+var_38]
		mov	[bp+var_28], eax

loc_73B03:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+1B1j
		mov	[bp+var_3C], 0C800h
		mov	eax, [bp+var_3C]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_6]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		les	bx, [bp+arg_0]
		mov	es:[bx+0E9h], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	es:[bx+0E1h], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	es:[bx+0E5h], eax

loc_73B4C:				; CODE XREF: AIAircraft_LoadProfileGuarded_73940+1Ej
					; AIAircraft_LoadProfileGuarded_73940+7Cj ...
		pop	si
		leave
		retf
AIAircraft_LoadProfileGuarded_73940	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 440 lignes, NON DETAILLEE - chargeur du chunk PROF (fichier de profil pilote/IA),
; structure confirmee par recoupement avec RSProf.cpp (libRealSpace, reference externe
; validee) : construit un StreamReader (StreamReader_ConstructVariantA_63A39), valide le chunk
; PROF (tag 0x464F5250, ResourceRecord_InitAndValidate_645CD) puis le sous-chunk _AI_ (tag
; 0x5F49415F, ResourceRecord_SeekAndReadB_647B2). Appelle ensuite 8 fois
; PilotProfile_ResolveNamedPropertyNode_742FC avec des identifiants numeriques (0x4, 0x7, 0xE,
; 0xF, 0x10, 0x13, 0x14, 0x15) pour construire des noeuds de propriete nommee, avant de
; revalider explicitement la presence du sous-chunk MVRS (tag 0x5352564D). Anciennement mal
; nommee AircraftDamageModel_LoadComponents : le motif de 8 appels similaires avait ete
; confondu avec les 8 composants de dommages avion, alors qu'il s'agit en realite de 8
; proprietes/noeuds MVRS. Structure attendue (RSProf.cpp) : PROF > {VERS,
; RADI{INFO,SPCH,OPTS,MSGS,ASKS}, _AI_{marqueur,MVRS,GOAL,ATRB}}. Candidat prioritaire pour
; session dediee (contenu detaille de MVRS/GOAL non trace). CONFIRME (chaine d'appel remontee)
; : appelee exclusivement pour les entites non-PLAYER (IA ou NETWORK), depuis
; AIAircraft_LoadProfileGuarded_73940, elle-meme declenchee par
; AIAircraft_SpawnAndConditionalLoadProfile_53363 (seg114) lors de la construction d'un noeud
; du systeme Expr_VM - le chargement du profil pilote est donc intrinsequement lie au graphe
; d'expressions du moteur, pas un simple chargement de fichier isole. CORRECTION STRUCTURELLE
; MAJEURE (confirmee via AI_BehaviorStateMachine_9D05) : les '8 champs fixes' et la 'liste
; extensible' de MVRS ne sont PAS deux mecanismes separes - c'est UN SEUL TABLEAU CONTIGU a
; pas de 5 octets {pointeur de noeud:4, valeur brute signee:1}, commencant a
; PilotProfile+0x202. Les 8 premieres entrees correspondent aux identifiants connus du moteur
; (construites par defaut), les entrees suivantes (a partir de +0x22A) sont ajoutees
; dynamiquement pour tout identifiant du fichier PROF non reconnu. Le compteur total
; (fixe+extensible) est a +0x200.
; ==============================================================================================
PilotProfile_LoadFromPROF_73B4F	proc far		; CODE XREF: VROOMM_StubThunk_6AAE9J AIAircraft_LoadProfileGuarded_73940+5Fp

var_108		= word ptr -108h
var_AB		= dword	ptr -0ABh
var_A7		= dword	ptr -0A7h
var_A3		= dword	ptr -0A3h
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_60		= word ptr -60h
var_10		= word ptr -10h
var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 108h
		push	si
		push	di
		push	seg seg215
		push	offset a_iff	; ".IFF"
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		push	large dword ptr	[bx+6]
		push	ds
		push	offset aIntel_0	; "INTEL"
		lea	ax, [bp+var_60]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_108]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_108], 2C8h
		mov	[bp+var_A7], 100h
		mov	[bp+var_AB], 0
		mov	[bp+var_108], 2E0h
		mov	[bp+var_8C], 0
		xor	ax, ax
		mov	[bp+var_8E], ax
		movsx	eax, ax
		mov	[bp+var_A3], eax
		push	large 464F5250h
		lea	ax, [bp+var_60]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_InitAndValidate_645CD
		add	sp, 8
		or	ax, ax
		jnz	short loc_73BD5
		jmp	loc_73F90
; ���������������������������������������������������������������������������

loc_73BD5:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+81j
		push	0
		push	large 5F49415Fh
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_73BF1
		jmp	loc_73F90
; ���������������������������������������������������������������������������

loc_73BF1:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+9Dj
		push	14h
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr PilotProfile_ResolveNamedPropertyNode_742FC
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+204h], dx
		mov	es:[bx+202h], ax
		mov	es:[bx+0C3h], dx
		mov	es:[bx+0C1h], ax
		push	0Eh
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PilotProfile_ResolveNamedPropertyNode_742FC
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+209h], dx
		mov	es:[bx+207h], ax
		mov	es:[bx+0C7h], dx
		mov	es:[bx+0C5h], ax
		push	0Fh
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PilotProfile_ResolveNamedPropertyNode_742FC
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+20Eh], dx
		mov	es:[bx+20Ch], ax
		mov	es:[bx+0CBh], dx
		mov	es:[bx+0C9h], ax
		push	10h
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PilotProfile_ResolveNamedPropertyNode_742FC
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+213h], dx
		mov	es:[bx+211h], ax
		mov	es:[bx+0CFh], dx
		mov	es:[bx+0CDh], ax
		push	15h
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PilotProfile_ResolveNamedPropertyNode_742FC
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+218h], dx
		mov	es:[bx+216h], ax
		mov	es:[bx+0D3h], dx
		mov	es:[bx+0D1h], ax
		push	7
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PilotProfile_ResolveNamedPropertyNode_742FC
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+21Dh], dx
		mov	es:[bx+21Bh], ax
		mov	es:[bx+0D7h], dx
		mov	es:[bx+0D5h], ax
		push	13h
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PilotProfile_ResolveNamedPropertyNode_742FC
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+222h], dx
		mov	es:[bx+220h], ax
		mov	es:[bx+0DBh], dx
		mov	es:[bx+0D9h], ax
		push	4
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PilotProfile_ResolveNamedPropertyNode_742FC
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+227h], dx
		mov	es:[bx+225h], ax
		mov	es:[bx+0BFh], dx
		mov	es:[bx+0BDh], ax
		mov	al, 0
		mov	es:[bx+229h], al
		mov	es:[bx+224h], al
		mov	es:[bx+21Fh], al
		mov	es:[bx+21Ah], al
		mov	es:[bx+215h], al
		mov	es:[bx+210h], al
		mov	es:[bx+20Bh], al
		mov	es:[bx+206h], al
		push	0
		push	large 5352564Dh
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_73D65
		push	8001h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_73D65:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+20Bj
		mov	eax, [bp+var_96]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	di, ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 22Ah
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+200h], 8
		mov	si, 8
		jmp	loc_73EBB
; ���������������������������������������������������������������������������

loc_73D97:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+380j
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[bp+var_8], al
		cmp	[bp+var_8], 14h
		jnz	short loc_73DC1
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+206h], al
		jmp	loc_73EBA
; ���������������������������������������������������������������������������

loc_73DC1:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+25Aj
		cmp	[bp+var_8], 0Eh
		jnz	short loc_73DDD
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+20Bh], al
		jmp	loc_73EBA
; ���������������������������������������������������������������������������

loc_73DDD:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+276j
		cmp	[bp+var_8], 0Fh
		jnz	short loc_73DF9
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+210h], al
		jmp	loc_73EBA
; ���������������������������������������������������������������������������

loc_73DF9:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+292j
		cmp	[bp+var_8], 10h
		jnz	short loc_73E15
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+215h], al
		jmp	loc_73EBA
; ���������������������������������������������������������������������������

loc_73E15:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+2AEj
		cmp	[bp+var_8], 15h
		jnz	short loc_73E31
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+21Ah], al
		jmp	loc_73EBA
; ���������������������������������������������������������������������������

loc_73E31:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+2CAj
		cmp	[bp+var_8], 7
		jnz	short loc_73E4C
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+21Fh], al
		jmp	short loc_73EBA
; ���������������������������������������������������������������������������

loc_73E4C:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+2E6j
		cmp	[bp+var_8], 13h
		jnz	short loc_73E67
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+224h], al
		jmp	short loc_73EBA
; ���������������������������������������������������������������������������

loc_73E67:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+301j
		cmp	[bp+var_8], 4
		jnz	short loc_73E82
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+229h], al
		jmp	short loc_73EBA
; ���������������������������������������������������������������������������

loc_73E82:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+31Cj
		mov	al, [bp+var_8]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr PilotProfile_ResolveNamedPropertyNode_742FC
		add	sp, 6
		les	bx, [bp+var_4]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+var_4]
		mov	es:[bx+4], al
		add	word ptr [bp+var_4], 5
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+200h]

loc_73EBA:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+26Fj
					; PilotProfile_LoadFromPROF_73B4F+28Bj ...
		inc	si

loc_73EBB:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+245j
		mov	ax, di
		add	ax, 8
		cmp	ax, si
		jle	short loc_73ED2
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+200h], 19h
		jge	short loc_73ED2
		jmp	loc_73D97
; ���������������������������������������������������������������������������

loc_73ED2:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+373j
					; PilotProfile_LoadFromPROF_73B4F+37Ej
		mov	eax, [bp+var_92]
		mov	[bp+var_A3], eax
		push	0
		push	large 4C414F47h
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_73EFE
		push	8002h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_73EFE:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+3A4j
		mov	di, word ptr [bp+var_96]
		mov	ax, di
		inc	ax
		cmp	ax, 0Ah
		jle	short loc_73F0D
		mov	di, 9

loc_73F0D:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+3B9j
		xor	si, si
		mov	[bp+var_6], 0
		jmp	short loc_73F63
; ���������������������������������������������������������������������������

loc_73F16:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+416j
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[bp+var_8], al
		cmp	[bp+var_8], 1
		jz	short loc_73F62
		mov	ax, [bp+var_6]
		shl	ax, 3
		mov	dx, word ptr [bp+arg_0]
		add	dx, ax
		add	dx, 1B0h
		push	word ptr [bp+arg_0+2]
		push	dx
		mov	al, [bp+var_8]
		push	ax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		nop
		push	cs
		call	near ptr PilotProfile_GoalSlot_BindHandlerByType_74292
		add	sp, 0Ah
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		inc	[bp+var_6]

loc_73F62:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+3D9j
		inc	si

loc_73F63:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+3C5j
		cmp	si, di
		jl	short loc_73F16
		mov	ax, [bp+var_6]
		shl	ax, 3
		mov	dx, word ptr [bp+arg_0]
		add	dx, ax
		add	dx, 1B0h
		push	word ptr [bp+arg_0+2]
		push	dx
		push	ds
		push	offset unk_6D188
		mov	cx, 8
		call	CRT_Fmemcpy
		mov	eax, [bp+var_92]
		mov	[bp+var_A3], eax

loc_73F90:				; CODE XREF: PilotProfile_LoadFromPROF_73B4F+83j
					; PilotProfile_LoadFromPROF_73B4F+9Fj
		mov	[bp+var_108], 2E0h
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_108]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
PilotProfile_LoadFromPROF_73B4F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 293 lignes - CONFIRME (lecture directe du code) : charge un fichier compagnon distinct
; de PROF, dans le meme dossier INTEL et avec la meme extension .IFF (chemin construit
; litteralement a partir des chaines 'INTEL'+'INTEL'+'.IFF', verifie ligne a ligne). Appelee
; par AIAircraft_LoadProfileGuarded_73940 JUSTE APRES PilotProfile_LoadFromPROF_73B4F, sur le
; meme pointeur 'this'. IMPORTANT : ce n'est PAS le meme format que PROF - le fichier charge
; ici valide un chunk VERS (comme PROF) mais aussi un chunk NUMS (absent de la structure
; PROF/RADI/_AI_ documentee), donc un format compagnon distinct, pas une variante de PROF lui-
; meme. Charge une longue sequence de champs numeriques (dwords, via
; ResourceRecord_ReadFieldGroupC_64A7E/ReadFieldGroupB_64A54 repetes) ecrits a divers offsets
; sur l'entite (+0x14A, +0x14E, +0x152, +0x1A4, +0x1A8, +0x1AC - une zone de PilotProfile non
; encore cartographiee, entre ATRB et GOAL) ainsi que plusieurs variables GLOBALES
; (dword_72016, word_72014, word_7201A, dword_7201C, dword_72020, byte_72038=6 fixe).
; Anciennement nommee AircraftDamageModel_LoadFromIFF - cette interpretation (donnees de
; dommages) reste PLAUSIBLE vu la nature numerique des champs mais N'EST PAS CONFIRMEE ;
; pourrait tout aussi bien etre des donnees de performance de vol ou de calibration IA
; specifiques a l'appareil. A tracer plus en detail si la signification exacte du chunk NUMS
; et de ces offsets devient prioritaire. CONFIRME (recherche des lecteurs de
; +0x14A/+0x14E/+0x152) : ces champs sont un VECTEUR DE POSITION 3D (X/Y/Z, 3 dwords
; consecutifs), pas des donnees de calibration IA ni liees au systeme de score MVRS (hypothese
; testee et ecartee). Reecrits par le dispatcheur 'fixer l'objectif' (loc_A341, seg005, meme
; fonction que le systeme de commandes radio) a chaque fois qu'un objectif necessitant une
; cible de navigation est configure (confirme pour le cas OP_SET_OBJ_FOLLOW_ALLY, point de
; code partage avec d'autres cas). PRECISION CONFIRMEE (hypothese de Remi, verifiee dans le
; code) : le vecteur 3D de +0x14A/+0x14E/+0x152 est tres probablement une COORDONNEE RELATIVE
; CALCULEE DYNAMIQUEMENT, pas une position absolue figee. Preuve :
; MissionScript_CallNativeHandler_52513 (le vrai point d'entree natif pour tous les opcodes
; OP_SET_OBJ_*, avec son PROPRE switch parallele sur la meme plage 0xA1-0xBF) calcule ce
; vecteur via Player_ResolveAttachPointN_5305A (appelee 6 fois dans la fonction) - une
; resolution de POINT D'ATTACHE NOMME (via le contexte VM partage word_706A0), pas une lecture
; litterale de coordonnees du script. Cohere avec un usage de navigation IA (position de
; formation, interception, cible d'attaque) relative a une autre entite (probablement le
; joueur ou l'allie concerne), plutot qu'une position de spawn fixe. DONNEES REELLES DECODEES
; (INTEL.IFF, analysis/sample_prof_files/) - CONFIRME un FORM de type 'INTL' (pas 'PROF'), un
; seul fichier connu du jeu avec un chunk NUMS (probablement CHARGE IDENTIQUEMENT PAR TOUS LES
; PILOTES IA, pas une donnee par pilote - coherent avec son nom de fichier generique
; 'INTEL.IFF' plutot qu'un nom de personnage). Sequence exacte des 18 champs verifiee (1 dword
; + 2 words + 13 dwords + 1 octet final = 65 octets, correspond EXACTEMENT a la longueur du
; chunk). Valeur cle : le vecteur +0x14A/+0x14E/+0x152 = (300.000, 0.000, 0.000) en virgule
; fixe 24.8 - un decalage PUREMENT HORIZONTAL, sans changement d'altitude, CONFIRME comme
; decalage de FORMATION (pas une position absolue - des coordonnees monde reelles n'auraient
; pas des valeurs aussi rondes). Voir tools/decode_nums.py pour le decodeur complet et
; analysis/AI_SYSTEM.md pour le detail de toutes les valeurs. TRAITS ATRB CORRIGES 2026-09-25
; : le chargeur PilotProfile_LoadATRB_12E47 range les octets du fichier (ordre TH, CN, VB, LY,
; FL, AG, AA, SM, AR, 10e) a profil+0x97, +0x99, +0x98, +0x9A, +0x96, +0x9B, +0x9C, +0x9D,
; +0x9E, +0x9F ; le profil vit a entite+0x1A (constructeur : 'mov word ptr es:[bx+1Ah], 368h',
; vtable 0x368 slot 0 = PilotProfile_LoadATRB_12E47). Donc entite+0xB0 = FL (Flying), +0xB1 =
; TH, +0xB2 = VB, +0xB3 = CN, +0xB4 = LY, +0xB5 = AG, +0xB6 = AA, +0xB7 = SM, +0xB8 = AR,
; +0xB9 = 10e octet. Toute mention ci-dessus de TH pour +0xB0, CN pour +0xB1, LY pour +0xB3 ou
; FL pour +0xB4 est a lire selon cette table. Pose aussi entite+0x179 = 15 si FL < 4, 7 si FL
; < 11, sinon 3 ('cmp byte ptr es:[bx+0B0h], 4 / 0Bh') - role de +0x179 non trace.
; ==============================================================================================
PilotProfile_LoadNUMSCompanionFile_73FB4	proc far		; CODE XREF: VROOMM_StubThunk_6AAEEJ AIAircraft_LoadProfileGuarded_73940+6Bp

var_11C		= word ptr -11Ch
var_CC		= word ptr -0CCh
var_6F		= dword	ptr -6Fh
var_6B		= dword	ptr -6Bh
var_67		= dword	ptr -67h
var_5F		= dword	ptr -5Fh
var_56		= dword	ptr -56h
var_52		= word ptr -52h
var_50		= word ptr -50h
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
		sub	sp, 11Ch
		lea	ax, [bp+var_CC]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_CC], 2C8h
		mov	[bp+var_6B], 100h
		mov	[bp+var_6F], 0
		mov	[bp+var_CC], 2E0h
		mov	[bp+var_50], 0
		xor	ax, ax
		mov	[bp+var_52], ax
		movsx	eax, ax
		mov	[bp+var_67], eax
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	offset aIntel_0	; "INTEL"
		push	ds
		push	offset aIntel_0	; "INTEL"
		lea	ax, [bp+var_11C]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_CC]
		push	ax
		mov	bx, [bp+var_CC]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+var_5F], 4C544E49h
		jz	short loc_74038
		push	8004h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_74038:				; CODE XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+79j
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_AllocateAndDecode_64C21
		pop	cx
		push	0
		push	large 53524556h
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_74065
		push	8005h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_74065:				; CODE XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+A6j
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		cmp	ax, 2
		jz	short loc_7407E
		push	8006h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_7407E:				; CODE XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+BFj
		push	0
		push	large 534D554Eh
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_740A0
		push	8007h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_740A0:				; CODE XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+E1j
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	dword_72016, eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	word_72014, ax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	word_7201A, ax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+14Ah], eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+14Eh], eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_10], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+152h], eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+1A4h], eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_18], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+1A8h], eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1C], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+1ACh], eax
		mov	byte_72038, 6
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_20], eax
		mov	dword_7201C, eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_72020, eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_72024, eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_72028, eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7202C, eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_72030, eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_72034, eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_24], eax
		mov	dword_6D184, eax
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Bh], 0FEh
		or	es:[bx+28Bh], al
		mov	eax, [bp+var_56]
		mov	[bp+var_67], eax
		cmp	byte ptr es:[bx+0B0h], 4
		jge	short loc_74254
		mov	byte ptr es:[bx+179h], 0Fh
		jmp	short loc_74270
; ���������������������������������������������������������������������������

loc_74254:				; CODE XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+296j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0B0h], 0Bh
		jge	short loc_74267
		mov	byte ptr es:[bx+179h], 7
		jmp	short loc_74270
; ���������������������������������������������������������������������������

loc_74267:				; CODE XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+2A9j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+179h], 3

loc_74270:				; CODE XREF: PilotProfile_LoadNUMSCompanionFile_73FB4+29Ej
					; PilotProfile_LoadNUMSCompanionFile_73FB4+2B1j
		mov	[bp+var_CC], 2E0h
		lea	ax, [bp+var_CC]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_CC]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		leave
		retf
PilotProfile_LoadNUMSCompanionFile_73FB4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 64 lignes - CLE DE VOUTE du systeme GOAL. Recoit l'octet brut lu depuis le chunk GOAL
; du fichier PROF (arg_8) et le destination-pointeur du slot (arg_0 =
; PilotProfile+0x1B0+index*8). Soustrait 2 puis dispatche sur 4 cas (valeurs fichier valides :
; 2,3,4,5 ; erreur 0x8008 sinon) : chaque cas copie (CRT_Fmemcpy, 8 octets, en realite un
; pointeur far de 4 octets + padding d'alignement) UN POINTEUR DE FONCTION depuis une petite
; table fixe en donnees (off_6D190..off_6D1A8) vers le slot de destination. Les octets du
; fichier PROF ne sont donc PAS des donnees de comportement mais un SELECTEUR DE GESTIONNAIRE
; parmi 4 fonctions fixes du moteur : valeur 2 -> Goal_ExecuteAction_A8AC (dispatch generique
; sur le systeme d'etats GOAL 0xA1-0xAC) ; valeur 3 -> Goal_WanderRandom_AD13
; (patrouille/vagabondage) ; valeur 4 -> AI_BehaviorStateMachine_9D05 (machine a etats avec
; acquisition de cible et temporisation) ; valeur 5 -> loc_878F (seg004, gestionnaire
; d'engagement lie a la reference joueur word_722E6, tres volumineux, non trace en detail) ;
; toute autre valeur -> pointeur NUL (unk_6D1B0) apres avoir leve l'erreur 0x8008. La valeur
; fichier '1' est traitee en amont (dans PilotProfile_LoadFromPROF_73B4F) comme 'slot vide' et
; saute cette fonction entierement. Anciennement mal nommee
; AircraftDamageModel_FormatStatusMessage.
; ==============================================================================================
PilotProfile_GoalSlot_BindHandlerByType_74292	proc far		; CODE XREF: VROOMM_StubThunk_6AAF8J PilotProfile_LoadFromPROF_73B4F+3FDp

arg_0		= dword	ptr  6
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_8]
		mov	ah, 0
		sub	ax, 2
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		ja	short loc_742D3	; default
		shl	bx, 1
		jmp	cs:off_742F4[bx] ; switch jump

loc_742AB:				; DATA XREF: ovr228:off_742F4o
		push	large [bp+arg_0] ; case	0x0
		push	ds
		push	offset off_6D190
		jmp	short loc_742E4
; ���������������������������������������������������������������������������

loc_742B5:				; CODE XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+14j
					; DATA XREF: ovr228:off_742F4o
		push	large [bp+arg_0] ; case	0x1
		push	ds
		push	offset off_6D198
		jmp	short loc_742E4
; ���������������������������������������������������������������������������

loc_742BF:				; CODE XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+14j
					; DATA XREF: ovr228:off_742F4o
		push	large [bp+arg_0] ; case	0x2
		push	ds
		push	offset off_6D1A0
		jmp	short loc_742E4
; ���������������������������������������������������������������������������

loc_742C9:				; CODE XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+14j
					; DATA XREF: ovr228:off_742F4o
		push	large [bp+arg_0] ; case	0x3
		push	ds
		push	offset off_6D1A8
		jmp	short loc_742E4
; ���������������������������������������������������������������������������

loc_742D3:				; CODE XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+10j
		push	8008h		; default
		call	VROOMM_StubThunk_6B70F
		pop	cx
		push	large [bp+arg_0]
		push	ds
		push	offset unk_6D1B0

loc_742E4:				; CODE XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+21j
					; PilotProfile_GoalSlot_BindHandlerByType_74292+2Bj ...
		mov	cx, 8
		call	CRT_Fmemcpy
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
PilotProfile_GoalSlot_BindHandlerByType_74292	endp

; ���������������������������������������������������������������������������
off_742F4	dw offset loc_742AB	; DATA XREF: PilotProfile_GoalSlot_BindHandlerByType_74292+14r
		dw offset loc_742B5	; jump table for switch	statement
		dw offset loc_742BF
		dw offset loc_742C9

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 807 lignes - dispatcher generique par identifiant numerique (switch/table de sauts, 21
; cas, ID 1-21 via arg_4) : pour chaque ID, alloue un noeud type de 0x28 octets (tag memoire
; 0x5C44, Memory_TypedAllocDispatchB_5C832 via sub_5C6F3), y stocke un pointeur vers la valeur
; source (offset +0x22 du noeud) et un identifiant de type/schema tire d'une table a pas fixe
; de 20 octets (0x2B4, 0x28C, 0x278... jusqu'a 0x138 pour le dernier cas) plus un index de
; type stocke a +0x21. Le cas d'index 19 (ID=0x14) utilise le tag 0x26, qui correspond
; exactement a la borne basse de la plage d'identifiants 0x26-0x36 deja identifiee ailleurs
; pour les 9 attributs ATRB du profil pilote (via une fonction differente, non encore
; localisee dans cet adressage) - confirme qu'il s'agit du MEME mecanisme generique de
; resolution de propriete nommee utilise a travers tout le format PROF, pas d'une fonction
; specifique aux dommages avion. Retourne un pointeur nul (0,0) pour tout ID hors de la plage
; 1-21. Anciennement mal nommee AircraftDamageModel_ReleaseComponentArray : la fonction alloue
; et construit, elle ne libere rien. Appelee 8 fois par PilotProfile_LoadFromPROF_73B4F.
; Candidat prioritaire pour session dediee si la semantique exacte de chacun des 21 cas doit
; etre etablie individuellement. ETAT DE LA RECHERCHE (session ulterieure) : plusieurs pistes
; de consommateur testees et ECARTEES avec preuves a l'appui : (1) recherche directe des 8
; offsets de destination dans tout strike.asm - aucune lecture trouvee hors du chargeur lui-
; meme pour 6 des 8 offsets, les 2 autres sont des faux positifs (reutilisation coincidentale
; du meme offset par des structures sans rapport) ; (2) lecture complete de
; MissionScript_ExecutePROG_51106 (1877 lignes, VM de script de mission confirmee) - aucun
; lien trouve avec le mecanisme de node_id de MVRS, et une hypothese de correspondance
; numerique directe entre les node_id MVRS et les opcodes de cette VM a ete testee et INFIRMEE
; (0x10 et 0x14 ont des significations totalement differentes dans les deux contextes -
; confirme par comparaison avec la table d'opcodes externe
; OP_MOVE_VALUE_TO_WORK_REGISTER/OP_SAVE_VALUE_TO_GAMFLOW_REGISTER, sans rapport avec un
; parametre de pilotage). Goal_ExecuteAction_A8AC utilise le meme mecanisme de construction de
; noeud generique mais pour des valeurs calculees, pas pour relire du MVRS charge. CONCLUSION
; ACTUELLE : le consommateur reel des 8 valeurs MVRS
; (PilotProfile+0x206/+0x20B/+0x210/+0x215/+0x21A/+0x21F/+0x224/+0x229) reste NON IDENTIFIE
; malgre plusieurs pistes serieuses explorees et documentees comme ecartees. CORRECTION
; MAJEURE (donnees reelles analysees) : quatre fichiers PROF authentiques du jeu (BILLY.IFF,
; HAMMERA.IFF, GWEN.IFF, C-130.IFF) ont ete decodes octet par octet et CONFIRMENT que MVRS est
; un vrai mecanisme fonctionnel, PAS un gabarit inerte comme une conclusion prematuree l'avait
; suggere avant verification empirique. Preuves : (1) Billy (pilote actif, GOAL contient le
; selecteur special 5) et Hammer (PNJ pilote sans interaction joueur, GOAL sans le selecteur
; 5) ont des listes MVRS de longueur differente (13 vs 13 entrees identiques ID 1-13 valeur 0
; - template partage pour ces deux profils) ; (2) Gwen (coequipiere active comme Billy, GOAL
; avec le 5) a une liste de seulement 10 entrees, MANQUANTE pour les ID 8,9,0xA - preuve que
; la presence/absence d'un ID est significative et varie reellement par pilote, pas un format
; fixe ; (3) LE PILOTE DE C-130 (transport, non-combattant, GOAL sans le 5) a MVRS=[(3,0xFE=-2
; signe),(4,0),(0xD,0)] - SEULEMENT 3 entrees, dont une valeur NON NULLE (ID=3 a -2, la
; premiere valeur non-nulle observee sur 4 echantillons) - correspond exactement a l'hypothese
; d'un malus de manoeuvrabilite pour un avion cargo lourd. Correlation supplementaire
; confirmee sur les 4 fichiers : le selecteur GOAL '5' (loc_878F) est present uniquement chez
; les pilotes pouvant etre coequipiers actifs du joueur (Billy, Gwen) et absent chez les
; pilotes non-interactifs (Hammer PNJ scripte, pilote de transport). ATRB confirme aussi une
; distinction nette : le pilote de cargo a 7 champs sur 10 a zero strict (absence de
; competences de combat air-air/air-sol), contre 0-1 champ a zero chez les trois pilotes de
; chasse. Le consommateur runtime exact de MVRS reste non localise dans le desassemblage, mais
; son existence fonctionnelle et sa correlation avec le type d'appareil/role du pilote sont
; maintenant etablies empiriquement, pas seulement hypothetiques.
; ==============================================================================================
PilotProfile_ResolveNamedPropertyNode_742FC	proc far		; CODE XREF: VROOMM_StubThunk_6AAF3J PilotProfile_LoadFromPROF_73B4F+AAp	...

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
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0A0h
		mov	al, [bp+arg_4]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 14h		; switch 21 cases
		jbe	short loc_74313
		jmp	loc_74B05	; default
; ���������������������������������������������������������������������������

loc_74313:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+12j
		shl	bx, 1
		jmp	cs:off_74B0B[bx] ; switch jump

loc_7431A:				; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x0
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large 28h ; '('
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		or	ax, dx
		jz	short loc_74373
		push	large [bp+var_4]
		push	dx
		push	word ptr [bp+var_8]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_4]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 2B4h
		mov	byte ptr es:[bx+21h], 1
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]
		jmp	short loc_74379
; ���������������������������������������������������������������������������

loc_74373:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+42j
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]

loc_74379:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+75j
					; PilotProfile_ResolveNamedPropertyNode_742FC+E4j ...
		jmp	locret_74B09
; ���������������������������������������������������������������������������

loc_7437C:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x1
		mov	[bp+var_C], eax
		push	1
		push	0
		push	2
		push	large 31h ; '1'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		or	ax, dx
		jz	short loc_743E2
		push	large [bp+var_C]
		push	dx
		push	word ptr [bp+var_10]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_C]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 28Ch
		xor	eax, eax
		mov	es:[bx+2Ah], eax
		mov	es:[bx+26h], eax
		mov	byte ptr es:[bx+21h], 2
		mov	dx, word ptr [bp+var_10+2]
		mov	ax, word ptr [bp+var_10]
		jmp	short loc_74379
; ���������������������������������������������������������������������������

loc_743E2:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+A4j
		mov	dx, word ptr [bp+var_10+2]
		mov	ax, word ptr [bp+var_10]
		jmp	short loc_74379
; ���������������������������������������������������������������������������

loc_743EA:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x2
		mov	[bp+var_14], eax
		push	1
		push	0
		push	2
		push	large 34h ; '4'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2],	dx
		mov	word ptr [bp+var_18], ax
		or	ax, dx
		jz	short loc_74444
		push	large [bp+var_14]
		push	dx
		push	word ptr [bp+var_18]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_18]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_14]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 278h
		mov	byte ptr es:[bx+21h], 3
		mov	dx, word ptr [bp+var_18+2]
		mov	ax, word ptr [bp+var_18]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74444:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+112j
		mov	dx, word ptr [bp+var_18+2]
		mov	ax, word ptr [bp+var_18]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_7444D:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x3
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	2
		push	large 33h ; '3'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2],	dx
		mov	word ptr [bp+var_20], ax
		or	ax, dx
		jz	short loc_744A7
		push	large [bp+var_1C]
		push	dx
		push	word ptr [bp+var_20]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_1C]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 264h
		mov	byte ptr es:[bx+21h], 4
		mov	dx, word ptr [bp+var_20+2]
		mov	ax, word ptr [bp+var_20]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_744A7:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+175j
		mov	dx, word ptr [bp+var_20+2]
		mov	ax, word ptr [bp+var_20]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_744B0:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x4
		mov	[bp+var_24], eax
		push	1
		push	0
		push	2
		push	large 2Bh ; '+'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_28+2],	dx
		mov	word ptr [bp+var_28], ax
		or	ax, dx
		jz	short loc_7450A
		push	large [bp+var_24]
		push	dx
		push	word ptr [bp+var_28]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_28]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_24]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 250h
		mov	byte ptr es:[bx+21h], 5
		mov	dx, word ptr [bp+var_28+2]
		mov	ax, word ptr [bp+var_28]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_7450A:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+1D8j
		mov	dx, word ptr [bp+var_28+2]
		mov	ax, word ptr [bp+var_28]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74513:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x5
		mov	[bp+var_2C], eax
		push	1
		push	0
		push	2
		push	large 27h ; '''
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_30+2],	dx
		mov	word ptr [bp+var_30], ax
		or	ax, dx
		jz	short loc_7456D
		push	large [bp+var_2C]
		push	dx
		push	word ptr [bp+var_30]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_30]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_2C]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 23Ch
		mov	byte ptr es:[bx+21h], 6
		mov	dx, word ptr [bp+var_30+2]
		mov	ax, word ptr [bp+var_30]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_7456D:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+23Bj
		mov	dx, word ptr [bp+var_30+2]
		mov	ax, word ptr [bp+var_30]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74576:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x6
		mov	[bp+var_34], eax
		push	1
		push	0
		push	2
		push	large 33h ; '3'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_38+2],	dx
		mov	word ptr [bp+var_38], ax
		or	ax, dx
		jz	short loc_745D0
		push	large [bp+var_34]
		push	dx
		push	word ptr [bp+var_38]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_38]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_34]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 228h
		mov	byte ptr es:[bx+21h], 7
		mov	dx, word ptr [bp+var_38+2]
		mov	ax, word ptr [bp+var_38]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_745D0:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+29Ej
		mov	dx, word ptr [bp+var_38+2]
		mov	ax, word ptr [bp+var_38]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_745D9:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x7
		mov	[bp+var_3C], eax
		push	1
		push	0
		push	2
		push	large 26h ; '&'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_40+2],	dx
		mov	word ptr [bp+var_40], ax
		or	ax, dx
		jz	short loc_74633
		push	large [bp+var_3C]
		push	dx
		push	word ptr [bp+var_40]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_40]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_3C]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 214h
		mov	byte ptr es:[bx+21h], 8
		mov	dx, word ptr [bp+var_40+2]
		mov	ax, word ptr [bp+var_40]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74633:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+301j
		mov	dx, word ptr [bp+var_40+2]
		mov	ax, word ptr [bp+var_40]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_7463C:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x8
		mov	[bp+var_44], eax
		push	1
		push	0
		push	2
		push	large 26h ; '&'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_48+2],	dx
		mov	word ptr [bp+var_48], ax
		or	ax, dx
		jz	short loc_74696
		push	large [bp+var_44]
		push	dx
		push	word ptr [bp+var_48]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_48]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_44]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 200h
		mov	byte ptr es:[bx+21h], 9
		mov	dx, word ptr [bp+var_48+2]
		mov	ax, word ptr [bp+var_48]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74696:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+364j
		mov	dx, word ptr [bp+var_48+2]
		mov	ax, word ptr [bp+var_48]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_7469F:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x9
		mov	[bp+var_4C], eax
		push	1
		push	0
		push	2
		push	large 28h ; '('
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_50+2],	dx
		mov	word ptr [bp+var_50], ax
		or	ax, dx
		jz	short loc_746F9
		push	large [bp+var_4C]
		push	dx
		push	word ptr [bp+var_50]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_50]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_4C]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 1ECh
		mov	byte ptr es:[bx+21h], 0Ah
		mov	dx, word ptr [bp+var_50+2]
		mov	ax, word ptr [bp+var_50]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_746F9:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+3C7j
		mov	dx, word ptr [bp+var_50+2]
		mov	ax, word ptr [bp+var_50]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74702:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0xA
		mov	[bp+var_54], eax
		push	1
		push	0
		push	2
		push	large 27h ; '''
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_58+2],	dx
		mov	word ptr [bp+var_58], ax
		or	ax, dx
		jz	short loc_7475C
		push	large [bp+var_54]
		push	dx
		push	word ptr [bp+var_58]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_58]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_54]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 1D8h
		mov	byte ptr es:[bx+21h], 0Bh
		mov	dx, word ptr [bp+var_58+2]
		mov	ax, word ptr [bp+var_58]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_7475C:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+42Aj
		mov	dx, word ptr [bp+var_58+2]
		mov	ax, word ptr [bp+var_58]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74765:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0xB
		mov	[bp+var_5C], eax
		push	1
		push	0
		push	2
		push	large 27h ; '''
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_60+2],	dx
		mov	word ptr [bp+var_60], ax
		or	ax, dx
		jz	short loc_747BF
		push	large [bp+var_5C]
		push	dx
		push	word ptr [bp+var_60]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_60]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_5C]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 1C4h
		mov	byte ptr es:[bx+21h], 0Ch
		mov	dx, word ptr [bp+var_60+2]
		mov	ax, word ptr [bp+var_60]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_747BF:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+48Dj
		mov	dx, word ptr [bp+var_60+2]
		mov	ax, word ptr [bp+var_60]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_747C8:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0xC
		mov	[bp+var_64], eax
		push	1
		push	0
		push	2
		push	large 27h ; '''
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_68+2],	dx
		mov	word ptr [bp+var_68], ax
		or	ax, dx
		jz	short loc_74822
		push	large [bp+var_64]
		push	dx
		push	word ptr [bp+var_68]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_68]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_64]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 1B0h
		mov	byte ptr es:[bx+21h], 0Dh
		mov	dx, word ptr [bp+var_68+2]
		mov	ax, word ptr [bp+var_68]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74822:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+4F0j
		mov	dx, word ptr [bp+var_68+2]
		mov	ax, word ptr [bp+var_68]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_7482B:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0xD
		mov	[bp+var_6C], eax
		push	1
		push	0
		push	2
		push	large 26h ; '&'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_70+2],	dx
		mov	word ptr [bp+var_70], ax
		or	ax, dx
		jz	short loc_74885
		push	large [bp+var_6C]
		push	dx
		push	word ptr [bp+var_70]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_70]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_6C]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 19Ch
		mov	byte ptr es:[bx+21h], 0Eh
		mov	dx, word ptr [bp+var_70+2]
		mov	ax, word ptr [bp+var_70]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74885:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+553j
		mov	dx, word ptr [bp+var_70+2]
		mov	ax, word ptr [bp+var_70]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_7488E:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0xE
		mov	[bp+var_74], eax
		push	1
		push	0
		push	2
		push	large 26h ; '&'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_78+2],	dx
		mov	word ptr [bp+var_78], ax
		or	ax, dx
		jz	short loc_748E8
		push	large [bp+var_74]
		push	dx
		push	word ptr [bp+var_78]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_78]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_74]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 188h
		mov	byte ptr es:[bx+21h], 0Fh
		mov	dx, word ptr [bp+var_78+2]
		mov	ax, word ptr [bp+var_78]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_748E8:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+5B6j
		mov	dx, word ptr [bp+var_78+2]
		mov	ax, word ptr [bp+var_78]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_748F1:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0xF
		mov	[bp+var_7C], eax
		push	1
		push	0
		push	2
		push	large 26h ; '&'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_80+2],	dx
		mov	word ptr [bp+var_80], ax
		or	ax, dx
		jz	short loc_7494B
		push	large [bp+var_7C]
		push	dx
		push	word ptr [bp+var_80]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_80]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_7C]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 174h
		mov	byte ptr es:[bx+21h], 10h
		mov	dx, word ptr [bp+var_80+2]
		mov	ax, word ptr [bp+var_80]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_7494B:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+619j
		mov	dx, word ptr [bp+var_80+2]
		mov	ax, word ptr [bp+var_80]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74954:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x12
		mov	[bp+var_84], eax
		push	1
		push	0
		push	2
		push	large 36h ; '6'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_88+2],	dx
		mov	word ptr [bp+var_88], ax
		or	ax, dx
		jnz	short loc_74980
		jmp	loc_74A1E
; ���������������������������������������������������������������������������

loc_74980:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+67Fj
		push	large [bp+var_84]
		push	dx
		push	word ptr [bp+var_88]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_88]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_84]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 160h
		mov	word ptr es:[bx+27h], 0
		mov	word ptr es:[bx+29h], 0
		mov	[bp+var_8C], 0
		mov	eax, [bp+var_8C]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	es:[bx+2Bh], eax
		mov	byte ptr es:[bx+21h], 13h
		mov	byte ptr es:[bx+26h], 0
		push	0
		mov	ax, word ptr [bp+var_88]
		add	ax, 27h	; '''
		push	word ptr [bp+var_88+2]
		push	ax
		call	SetReference
		add	sp, 6
		push	0
		mov	ax, word ptr [bp+var_88]
		add	ax, 29h	; ')'
		push	word ptr [bp+var_88+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+var_88]
		mov	word ptr es:[bx+34h], 0
		mov	dx, word ptr [bp+var_88+2]
		mov	ax, word ptr [bp+var_88]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74A1E:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+681j
		mov	dx, word ptr [bp+var_88+2]
		mov	ax, word ptr [bp+var_88]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74A29:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x13
		mov	[bp+var_94], eax
		push	1
		push	0
		push	2
		push	large 32h ; '2'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_98+2],	dx
		mov	word ptr [bp+var_98], ax
		or	ax, dx
		jz	short loc_74A8C
		push	large [bp+var_94]
		push	dx
		push	word ptr [bp+var_98]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_98]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_94]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 14Ch
		mov	byte ptr es:[bx+21h], 14h
		mov	dx, word ptr [bp+var_98+2]
		mov	ax, word ptr [bp+var_98]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74A8C:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+754j
		mov	dx, word ptr [bp+var_98+2]
		mov	ax, word ptr [bp+var_98]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74A97:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ovr228:off_74B0Bo
		mov	eax, [bp+arg_0]	; case 0x14
		mov	[bp+var_9C], eax
		push	1
		push	0
		push	2
		push	large 26h ; '&'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_A0+2],	dx
		mov	word ptr [bp+var_A0], ax
		or	ax, dx
		jz	short loc_74AFA
		push	large [bp+var_9C]
		push	dx
		push	word ptr [bp+var_A0]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_A0]
		mov	word ptr es:[bx], 2A0h
		mov	eax, [bp+var_9C]
		mov	es:[bx+22h], eax
		mov	word ptr es:[bx], 138h
		mov	byte ptr es:[bx+21h], 15h
		mov	dx, word ptr [bp+var_A0+2]
		mov	ax, word ptr [bp+var_A0]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74AFA:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+7C2j
		mov	dx, word ptr [bp+var_A0+2]
		mov	ax, word ptr [bp+var_A0]
		jmp	loc_74379
; ���������������������������������������������������������������������������

loc_74B05:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC+14j
					; PilotProfile_ResolveNamedPropertyNode_742FC+19j
					; DATA XREF: ...
		xor	dx, dx		; default
		xor	ax, ax

locret_74B09:				; CODE XREF: PilotProfile_ResolveNamedPropertyNode_742FC:loc_74379j
		leave
		retf
PilotProfile_ResolveNamedPropertyNode_742FC	endp

; ���������������������������������������������������������������������������
off_74B0B	dw offset loc_7431A	; DATA XREF: PilotProfile_ResolveNamedPropertyNode_742FC+19r
		dw offset loc_7437C	; jump table for switch	statement
		dw offset loc_743EA
		dw offset loc_7444D
		dw offset loc_744B0
		dw offset loc_74513
		dw offset loc_74576
		dw offset loc_745D9
		dw offset loc_7463C
		dw offset loc_7469F
		dw offset loc_74702
		dw offset loc_74765
		dw offset loc_747C8
		dw offset loc_7482B
		dw offset loc_7488E
		dw offset loc_748F1
		dw offset loc_74B05
		dw offset loc_74B05
		dw offset loc_74954
		dw offset loc_74A29
		dw offset loc_74A97

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (11 lignes).
; ==============================================================================================
AircraftDamageModel_Helper_74B35	proc far		; CODE XREF: VROOMM_StubThunk_6AAFDJ

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		pop	bp
		retf
AircraftDamageModel_Helper_74B35	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 196 lignes - ENTIEREMENT TRACEE. CONSTRUCTEUR REEL DE L'ENTITE IA ELLE-MEME (celle qui
; porte goal_state +0x11D, le tableau GOAL +0x1B0, le tableau MVRS +0x200/+0x202, et dont la
; vtable de classe contient AIEntity_MasterTick_5ACC en +0xC - CONFIRME par la position de
; unk_6D1B8 (8 octets zero utilises comme source memcpy) juste avant cette meme vtable en
; memoire). Herite d'une classe de base WorldObjectA (premier appel :
; WorldObjectA_Method_ClearField2_738DA). Sequence complete : (1) hérite/initialise via la
; classe de base ; (2) copie arg_4 dans +0x2, pose +0x6=1, nettoie des bits de statut
; (+0x28D/+0x28B) ; (3) alloue un sous-objet (tag 0x5C44, taille 0x2B) et l'attache a
; +0x7/+0x9 (si l'allocation réussit : vtable 0xC6, VROOMM_StubThunk_6AA34, vtable 0x130, puis
; AircraftStateBlock_Reset_12931 (anciennement HUD_ResetPanel) qui remet ce bloc à zéro ; ce
; n'est PAS un repli d'échec d'allocation ; le bloc est un enregistrement d'états/commandes,
; pas un panneau d'affichage) ; (4) copie ce pointeur vers +0x102/+0x104 (0) ; (5) etablit une
; reference faible sur +0x10F (cible/objet lie initial) ; (6) POSITION PAR DEFAUT :
; +0x111/+0x115/+0x119 = (0, 0, 0x3E800=256000) - le MEME decalage d'altitude (1000 en 24.8)
; que celui trouve dans Goal_ActiveWingmanEngagement_878F ; (7) goal_state (+0x11D) = 0xFFFF
; (SENTINELLE 'aucun objectif actif') ; (8) constantes +0x139=30000, +0x13D=512000,
; +0x141=64000 (role exact non determine) ; (9) references faibles etablies sur
; +0x137/+0x145/+0x147 (les memes champs cible que
; Goal_IsComplete/Goal_ActiveWingmanEngagement) ; (10) EFFACE LE PREMIER EMPLACEMENT GOAL
; (+0x1B0, 8 octets a 0, via CRT_Fmemcpy_3FD depuis unk_6D1B8) ; (11) 5 champs sentinelles a
; -100 (0xFFFFFF9C) : +0x166, +0x162, +0x109, +0x156, +0x15C (probables timers/distances 'non
; initialise') ; (12) +0x10D=0, +0x15A/+0x15B=0xFF, +0x200(compteur MVRS)=0, +0x202(premier
; pointeur MVRS)=0 - CONFIRME que MVRS demarre a zero AVANT le chargement PROF ; (13)
; deballage/remballage individuel de bits sur +0x28B/+0x28C (meme motif que le debut
; d'AIEntity_MasterTick_5ACC) ; (14) +0x16A=0. Anciennement mal nommee
; AircraftDamageModel_ConstructAndBind (balayage rapide, aucun rapport avec un modele de
; dommages).
; ==============================================================================================
AIEntity_Construct_74B43	proc far		; CODE XREF: VROOMM_StubThunk_6AB02J

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
		sub	sp, 1Ch
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6AA43
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		mov	byte ptr es:[bx+6], 1
		and	byte ptr es:[bx+28Dh], 7Fh
		mov	byte ptr es:[bx+27Fh], 0
		or	byte ptr es:[bx+28Bh], 80h
		push	1
		push	0
		push	2
		push	large 2Bh ; '+'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_74BC2
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 0C6h ; '�'
		push	dx
		push	bx
		call	VROOMM_StubThunk_6AA34
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 130h
		push	word ptr [bp+var_4+2]
		push	bx
		call	AircraftStateBlock_Reset_12931
		add	sp, 4
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_74BC8
; ���������������������������������������������������������������������������

loc_74BC2:				; CODE XREF: AIEntity_Construct_74B43+4Fj
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_74BC8:				; CODE XREF: AIEntity_Construct_74B43+7Dj
		les	bx, [bp+arg_0]
		mov	es:[bx+9], dx
		mov	es:[bx+7], ax
		mov	ax, es:[bx+2]
		mov	es:[bx+102h], ax
		mov	dword ptr es:[bx+104h],	0
		mov	word ptr es:[bx+0Bh], 0
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	[bp+var_8], 0
		mov	[bp+var_C], 0
		mov	[bp+var_10], 3E800h
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	es:[bx+111h], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+115h], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+119h], eax
		mov	dword ptr es:[bx+139h],	7530h
		mov	word ptr es:[bx+11Dh], 0FFFFh
		mov	[bp+var_14], 7D000h
		mov	eax, [bp+var_14]
		mov	es:[bx+13Dh], eax
		mov	[bp+var_18], 0FA00h
		mov	eax, [bp+var_18]
		mov	es:[bx+141h], eax
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 137h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 145h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 147h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Dh], 0FBh
		mov	al, 0
		and	byte ptr es:[bx+28Bh], 0DFh
		shl	al, 5
		or	es:[bx+28Bh], al
		and	byte ptr es:[bx+28Dh], 0EFh
		and	byte ptr es:[bx+28Dh], 0BFh
		and	byte ptr es:[bx+28Dh], 0DFh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1B0h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	ds
		push	offset unk_6D1B8
		mov	cx, 8
		call	CRT_Fmemcpy
		les	bx, [bp+arg_0]
		mov	eax, 0FFFFFF9Ch
		mov	es:[bx+166h], eax
		mov	es:[bx+162h], eax
		mov	es:[bx+109h], eax
		mov	es:[bx+156h], eax
		mov	es:[bx+15Ch], eax
		mov	word ptr es:[bx+10Dh], 0
		mov	al, 0FFh
		mov	es:[bx+15Ah], al
		mov	es:[bx+15Bh], al
		and	byte ptr es:[bx+28Bh], 0BFh
		mov	word ptr es:[bx+200h], 0
		mov	dword ptr es:[bx+202h],	0
		mov	word ptr es:[bx+17Ah], 0
		mov	byte ptr es:[bx+108h], 0
		mov	byte ptr es:[bx+19h], 0
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	es:[bx+16Eh], eax
		mov	word ptr es:[bx+172h], 0
		and	byte ptr es:[bx+28Bh], 0EFh
		mov	al, 0
		and	byte ptr es:[bx+28Bh], 0FBh
		mov	dx, ax
		shl	al, 2
		or	es:[bx+28Bh], al
		and	dx, 1
		and	byte ptr es:[bx+28Bh], 0F7h
		mov	ax, dx
		shl	dl, 3
		or	es:[bx+28Bh], dl
		and	ax, 1
		and	byte ptr es:[bx+28Bh], 0FDh
		mov	dx, ax
		shl	al, 1
		or	es:[bx+28Bh], al
		and	dx, 1
		and	byte ptr es:[bx+28Ch], 0EFh
		mov	ax, dx
		shl	dl, 4
		or	es:[bx+28Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+28Ch], 0FBh
		mov	dx, ax
		shl	al, 2
		or	es:[bx+28Ch], al
		and	dx, 1
		and	byte ptr es:[bx+28Ch], 0F7h
		mov	ax, dx
		shl	dl, 3
		or	es:[bx+28Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+28Ch], 0FEh
		mov	dx, ax
		or	es:[bx+28Ch], al
		and	dx, 1
		and	byte ptr es:[bx+28Ch], 0DFh
		shl	dl, 5
		or	es:[bx+28Ch], dl
		mov	dword ptr es:[bx+16Ah],	0
		leave
		retf
AIEntity_Construct_74B43	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 142 lignes - ENTIEREMENT TRACEE. DESTRUCTEUR REEL DE L'ENTITE IA (contrepartie de
; AIEntity_Construct_74B43). DECOUVERTE MAJEURE : boucle sur l'INTEGRALITE du tableau MVRS
; (arg_0+0x202, pas 5, borne par le compteur +0x200) et appelle, pour CHAQUE noeud non-nul, la
; methode virtuelle [vtable+0] (double dereference node[0]->[0], meme motif d'indirection que
; les appels [vtable+4]/[vtable+8] deja identifies) avec l'argument 3 - CONFIRME un QUATRIEME
; slot de vtable reel sur la classe de noeud de propriete (probable destructeur par type, en
; plus de NotifiableRef_Destructor_756D5 qui gere la partie generique). Prouve que les noeuds
; MVRS sont bien POSSEDES (pas seulement references) par l'entite, et correctement detruits un
; par un quand elle l'est. Sequence complete : (1) pose self[0]=0x110 (tag de classe
; specifique a l'entite, different du 0x2F8 des noeuds de propriete) ; (2)
; Cursor_SlotFree_2871E sur +0x4 ; (3) BOUCLE DE DESTRUCTION MVRS decrite ci-dessus ; (4)
; libere +0x16A si non-nul (CRT_Free_NearOrFar_346) ; (5) invalide 9 references faibles
; (WeakRef_InvalidateFar_3A432) : +0x289, +0x287, +0x285, +0x283, +0x281 (NOUVEAUX, jamais
; documentes avant), puis +0x147, +0x145, +0x137, +0x10F (deja connus) ; (6)
; SubObject_NotifyEvent_12A22(entite, code=0) - notifie via vtable 3 references attachees
; (+0x7/+0x11/+0x15), probable propagation de destruction vers des sous-objets externes
; (armement ?) ; (7) conditionnellement, libere la memoire de l'entite elle-meme
; (Memory_TypedFree_5C7B6, tag 0x5C44) si le bit0 de arg_4 est pose. Anciennement mal nommee
; AircraftDamageModel_ReleaseAllSubobjects (balayage rapide).
; ==============================================================================================
AIEntity_Destruct_74E1C	proc far		; CODE XREF: VROOMM_StubThunk_6AB0CJ

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_74E31
		jmp	loc_74F80
; ���������������������������������������������������������������������������

loc_74E31:				; CODE XREF: AIEntity_Destruct_74E1C+10j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 110h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Cursor_SlotFree
		add	sp, 4
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 202h
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		xor	di, di
		jmp	short loc_74E81
; ���������������������������������������������������������������������������

loc_74E5F:				; CODE XREF: AIEntity_Destruct_74E1C+6Dj
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_74E7C
		push	3
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short $+2

loc_74E7C:				; CODE XREF: AIEntity_Destruct_74E1C+4Bj
		inc	di
		add	word ptr [bp+var_4], 5

loc_74E81:				; CODE XREF: AIEntity_Destruct_74E1C+41j
		les	bx, [bp+arg_0]
		cmp	es:[bx+200h], di
		jg	short loc_74E5F
		cmp	dword ptr es:[bx+16Ah],	0
		jz	short loc_74EA2
		push	large dword ptr	es:[bx+16Ah]
		call	CRT_Free_NearOrFar
		add	sp, 4

loc_74EA2:				; CODE XREF: AIEntity_Destruct_74E1C+76j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+16Ah],	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 289h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 285h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 283h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 281h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 147h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 145h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 137h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		push	0
		push	large [bp+arg_0]
		call	SubObject_NotifyEvent
		add	sp, 6
		test	si, 1
		jz	short loc_74F80
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_74F80:				; CODE XREF: AIEntity_Destruct_74E1C+12j
					; AIEntity_Destruct_74E1C+147j
		pop	di
		pop	si
		leave
		retf
AIEntity_Destruct_74E1C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (7 lignes, probable stub vide).
; ==============================================================================================
AircraftDamageComponent_Method_NoOp_74F84	proc far		; CODE XREF: VROOMM_StubThunk_6AB11J
		push	bp
		mov	bp, sp
		mov	dword_6D184, 7D000h
		pop	bp
		retf
AircraftDamageComponent_Method_NoOp_74F84	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, destructeur scalar-deleting : détruit un unique sous-objet membre (sub_3A432) puis
; libère conditionnellement (Memory_TypedFree_5C7B6).
; ==============================================================================================
AircraftDamageComponent_ScalarDeletingDtorA_74F92	proc far		; CODE XREF: VROOMM_StubThunk_6AAE4J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_74FD8
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_74FD8
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_74FD8:				; CODE XREF: AircraftDamageComponent_ScalarDeletingDtorA_74F92+Fj
					; AircraftDamageComponent_ScalarDeletingDtorA_74F92+27j
		pop	si
		leave
		retf
AircraftDamageComponent_ScalarDeletingDtorA_74F92	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, identique en motif à AircraftDamageComponent_ScalarDeletingDtorA_74F92 (destructeur de
; classe sœur).
; ==============================================================================================
AircraftDamageComponent_ScalarDeletingDtorB_74FDB	proc far		; CODE XREF: VROOMM_StubThunk_6AADFJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_75021
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_75021
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_75021:				; CODE XREF: AircraftDamageComponent_ScalarDeletingDtorB_74FDB+Fj
					; AircraftDamageComponent_ScalarDeletingDtorB_74FDB+27j
		pop	si
		leave
		retf
AircraftDamageComponent_ScalarDeletingDtorB_74FDB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, destructeur scalar-deleting détruisant 3 sous-objets membres (sub_3A432 ×3 à offsets
; +0x29/+0x27/+0x13) puis libération conditionnelle.
; ==============================================================================================
AircraftDamageComponent_ScalarDeletingDtorC_75024	proc far		; CODE XREF: VROOMM_StubThunk_6AADAJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_7508E
		mov	ax, word ptr [bp+arg_0]
		add	ax, 29h	; ')'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 27h	; '''
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_7508E
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7508E:				; CODE XREF: AircraftDamageComponent_ScalarDeletingDtorC_75024+Fj
					; AircraftDamageComponent_ScalarDeletingDtorC_75024+4Bj
		pop	si
		leave
		retf
AircraftDamageComponent_ScalarDeletingDtorC_75024	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, premier d'une famille de 18 destructeurs scalar-deleting byte-pour-byte identiques
; (confirmé par comparaison directe) : détruit un unique sous-objet membre à l'offset +0x13
; (sub_3A432) puis libère conditionnellement (Memory_TypedFree_5C7B6). Motif classique de
; duplication VROOMM — un destructeur généré par classe d'une hiérarchie où chaque classe n'a
; qu'un membre à cet offset fixe.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_75091	proc far		; CODE XREF: VROOMM_StubThunk_6AAD5J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_750D7
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax

loc_750AC:				; DATA XREF: Render_MeshPrimitive_216F6+727o
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_750D7
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_750D7:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_75091+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_75091+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_75091	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091 (byte-pour-
; byte identique).
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_750DA	proc far		; CODE XREF: VROOMM_StubThunk_6AAD0J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_75120
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_75120
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_75120:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_750DA+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_750DA+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_750DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_75123	proc far		; CODE XREF: VROOMM_StubThunk_6AACBJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_75169
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_75169
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_75169:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_75123+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_75123+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_75123	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_7516C	proc far		; CODE XREF: VROOMM_StubThunk_6AAC6J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_751B2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_751B2
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_751B2:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_7516C+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_7516C+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_7516C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_751B5	proc far		; CODE XREF: VROOMM_StubThunk_6AAC1J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_751FB
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_751FB
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_751FB:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_751B5+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_751B5+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_751B5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_751FE	proc far		; CODE XREF: VROOMM_StubThunk_6AABCJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_75244
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_75244
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_75244:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_751FE+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_751FE+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_751FE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_75247	proc far		; CODE XREF: VROOMM_StubThunk_6AAB7J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_7528D
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_7528D
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7528D:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_75247+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_75247+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_75247	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_75290	proc far		; CODE XREF: VROOMM_StubThunk_6AAB2J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_752D6
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_752D6
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_752D6:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_75290+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_75290+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_75290	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_752D9	proc far		; CODE XREF: VROOMM_StubThunk_6AAADJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_7531F
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_7531F
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7531F:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_752D9+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_752D9+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_752D9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_75322	proc far		; CODE XREF: VROOMM_StubThunk_6AAA8J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_75368
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_75368
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_75368:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_75322+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_75322+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_75322	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_7536B	proc far		; CODE XREF: VROOMM_StubThunk_6AAA3J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_753B1
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_753B1
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_753B1:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_7536B+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_7536B+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_7536B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_753B4	proc far		; CODE XREF: VROOMM_StubThunk_6AA9EJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_753FA
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_753FA
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_753FA:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_753B4+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_753B4+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_753B4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_753FD	proc far		; CODE XREF: VROOMM_StubThunk_6AA99J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_75443
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_75443
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_75443:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_753FD+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_753FD+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_753FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_75446	proc far		; CODE XREF: VROOMM_StubThunk_6AA94J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_7548C
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_7548C
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7548C:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_75446+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_75446+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_75446	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_7548F	proc far		; CODE XREF: VROOMM_StubThunk_6AA8FJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_754D5
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_754D5
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_754D5:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_7548F+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_7548F+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_7548F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091.
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_754D8	proc far		; CODE XREF: VROOMM_StubThunk_6AA8AJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_7551E
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_7551E
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7551E:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_754D8+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_754D8+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_754D8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, duplicat confirmé de AircraftDamageComponentFamily_ScalarDeletingDtor_75091 (dernier de
; la série de 18).
; ==============================================================================================
AircraftDamageComponentFamily_ScalarDeletingDtor_75521	proc far		; CODE XREF: VROOMM_StubThunk_6AA85J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_75567
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_75567
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_75567:				; CODE XREF: AircraftDamageComponentFamily_ScalarDeletingDtor_75521+Fj
					; AircraftDamageComponentFamily_ScalarDeletingDtor_75521+27j
		pop	si
		leave
		retf
AircraftDamageComponentFamily_ScalarDeletingDtor_75521	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_Helper_645A5 (seg193), StreamReader_ReleaseBuffer_65643
; (seg195), libère l'objet (sub_338).
; ==============================================================================================
AircraftDamageModel_ReleaseStreamAndDestruct_7556A	proc far		; CODE XREF: VROOMM_StubThunk_6AA80J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7559C
		mov	word ptr [si], 2E0h
		push	si
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		test	di, 1
		jz	short loc_7559C
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_7559C:				; CODE XREF: AircraftDamageModel_ReleaseStreamAndDestruct_7556A+Dj
					; AircraftDamageModel_ReleaseStreamAndDestruct_7556A+29j
		pop	di
		pop	si
		pop	bp
		retf
AircraftDamageModel_ReleaseStreamAndDestruct_7556A	endp

ovr228		ends
