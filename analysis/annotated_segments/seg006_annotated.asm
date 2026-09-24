seg006		segment	byte public 'CODE' use16
		assume cs:seg006
		;org 3
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,439L — machine de sélection/transition de GOAL : compare la cible (+0x145) à la
; référence joueur (word_722E6), teste le type de GOAL (0xAA), réinitialise les pointeurs
; d'escorte/formation (+0x285/+0x287), puis appelle sub_DAA9. Orchestrateur de sélection de
; GOAL (niveau au-dessus de sub_A6D3/sub_A8AC). NOTE STRUCTURELLE (verifiee) : possede DEUX
; points d'entree, comme Goal_SetObjective_A307 - l'entree standard (proc, CODE XREF depuis
; sub_A8AC) ET un alias 'loc_B956' juste apres le prologue (push bp/mov bp,sp), reference
; depuis la MEME table de dispatch de messages partagee (seg216:00EE) que
; Goal_SetObjective_A307 - confirme que ces deux fonctions appartiennent au meme systeme de
; messages GOAL de haut niveau.
; ==============================================================================================
Goal_SelectTransition	proc far		; CODE XREF: Goal_ExecuteAction_A8AC+FDP

var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_B956:				; DATA XREF: seg216:00EEo
		sub	sp, 22h
		mov	[bp+var_1], 1
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jz	short loc_B977
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jz	short loc_B977
		jmp	loc_BD3A
; ���������������������������������������������������������������������������

loc_B977:				; CODE XREF: Goal_SelectTransition+16j Goal_SelectTransition+1Fj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 0FFh
		jz	short loc_B98C
		cmp	byte_6E33B, 0
		jz	short loc_B991

loc_B98C:				; CODE XREF: Goal_SelectTransition+30j
		mov	ax, 1
		jmp	short loc_B993
; ���������������������������������������������������������������������������

loc_B991:				; CODE XREF: Goal_SelectTransition+37j
		xor	ax, ax

loc_B993:				; CODE XREF: Goal_SelectTransition+3Cj
		mov	[bp+var_2], al
		cmp	byte_6E33B, 0
		jz	short loc_B9F1
		cmp	word_722E6, 0
		jz	short loc_B9F1
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+149h], 3
		jz	short loc_B9F1
		mov	byte ptr es:[bx+149h], 3
		mov	ax, word_722E6
		mov	[bp+var_4], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 285h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, word_722E6
		mov	[bp+var_6], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+160h], 0

loc_B9F1:				; CODE XREF: Goal_SelectTransition+48j Goal_SelectTransition+4Fj ...
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Goal_FollowAllyExec
		add	sp, 4
		or	al, al
		jz	short loc_BA07
		mov	[bp+var_1], 1
		jmp	short loc_BA5B
; ���������������������������������������������������������������������������

loc_BA07:				; CODE XREF: Goal_SelectTransition+ACj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+145h], 0
		jnz	short loc_BA18
		mov	[bp+var_1], 0
		jmp	short loc_BA5B
; ���������������������������������������������������������������������������

loc_BA18:				; CODE XREF: Goal_SelectTransition+BDj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+145h]
		push	word ptr [bx+51h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+145h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_BA5B
		mov	[bp+var_1], 0
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 145h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_BA5B:				; CODE XREF: Goal_SelectTransition+B2j Goal_SelectTransition+C3j ...
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+145h], 0
		jnz	short loc_BA69
		jmp	loc_BD3A
; ���������������������������������������������������������������������������

loc_BA69:				; CODE XREF: Goal_SelectTransition+111j
		mov	al, es:[bx+149h]
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_BA78
		jmp	loc_BBAC
; ���������������������������������������������������������������������������

loc_BA78:				; CODE XREF: Goal_SelectTransition+120j
		cmp	ax, 2
		jnz	short loc_BA80
		jmp	loc_BC15
; ���������������������������������������������������������������������������

loc_BA80:				; CODE XREF: Goal_SelectTransition+128j
		cmp	ax, 3
		jnz	short loc_BA88
		jmp	loc_BC73
; ���������������������������������������������������������������������������

loc_BA88:				; CODE XREF: Goal_SelectTransition+130j
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Bh], 0DFh
		cmp	word_722EE, 0
		jz	short loc_BA9D
		mov	ax, 1
		jmp	short loc_BA9F
; ���������������������������������������������������������������������������

loc_BA9D:				; CODE XREF: Goal_SelectTransition+143j
		xor	ax, ax

loc_BA9F:				; CODE XREF: Goal_SelectTransition+148j
		or	al, al
		jnz	short loc_BAA6
		jmp	loc_BB4D
; ���������������������������������������������������������������������������

loc_BAA6:				; CODE XREF: Goal_SelectTransition+14Ej
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jz	short loc_BAB7
		jmp	loc_BB4D
; ���������������������������������������������������������������������������

loc_BAB7:				; CODE XREF: Goal_SelectTransition+15Fj
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Voice_ExpressionTimer
		add	sp, 4
		or	al, al
		jnz	short loc_BACA
		jmp	loc_BB4D
; ���������������������������������������������������������������������������

loc_BACA:				; CODE XREF: Goal_SelectTransition+172j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_BAE2
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4

loc_BAE2:				; CODE XREF: Goal_SelectTransition+180j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+149h], 3
		mov	ax, word_722EE
		mov	[bp+var_8], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 285h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, word_722EE
		mov	[bp+var_A], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+160h], 0
		or	byte ptr es:[bx+28Bh], 20h
		push	1
		push	10h
		push	word_722E6
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+15Bh], 12h
		jmp	loc_BD3A
; ���������������������������������������������������������������������������

loc_BB4D:				; CODE XREF: Goal_SelectTransition+150j
					; Goal_SelectTransition+161j ...
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 3
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_BB64
		jmp	loc_BD2E
; ���������������������������������������������������������������������������

loc_BB64:				; CODE XREF: Goal_SelectTransition+20Cj
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_BB81

loc_BB6C:				; CODE XREF: Goal_SelectTransition+369j
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		jmp	loc_BD2B
; ���������������������������������������������������������������������������

loc_BB81:				; CODE XREF: Goal_SelectTransition+217j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 2
		jnz	short loc_BB9D
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	AI_BehaviorStateMachine_WeightedOptionSelector_9D05

loc_BB97:				; CODE XREF: Goal_SelectTransition+3CCj
		add	sp, 6
		jmp	loc_BD2E
; ���������������������������������������������������������������������������

loc_BB9D:				; CODE XREF: Goal_SelectTransition+237j
		push	large [bp+arg_0]
		call	Goal_FollowWaypoints
		jmp	loc_BD2B
; ���������������������������������������������������������������������������
		jmp	loc_BD2E
; ���������������������������������������������������������������������������

loc_BBAC:				; CODE XREF: Goal_SelectTransition+122j
		cmp	[bp+var_2], 0
		jz	short loc_BBB7
		mov	byte_6E4C5, 1

loc_BBB7:				; CODE XREF: Goal_SelectTransition+25Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+11Dh], 0ACh ; '�'
		mov	ax, es:[bx+145h]
		mov	[bp+var_C], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+145h]
		mov	[bp+var_E], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 137h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		push	0
		push	large [bp+arg_0]
		call	Goal_ExecuteAction_A8AC
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+11Dh], 0AAh ; '�'
		jmp	loc_BD3A
; ���������������������������������������������������������������������������

loc_BC15:				; CODE XREF: Goal_SelectTransition+12Aj
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+28Bh], 20h
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_BC38
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		jmp	loc_BD37
; ���������������������������������������������������������������������������

loc_BC38:				; CODE XREF: Goal_SelectTransition+2D1j
		mov	[bp+var_1C], 0
		xor	ax, ax
		mov	[bp+var_18], ax
		mov	[bp+var_1A], ax
		mov	[bp+var_20], 200h
		mov	eax, [bp+var_20]
		mov	[bp+var_16], eax
		lea	ax, [bp+var_1C]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0D1h]
		les	bx, es:[bx+0D1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	loc_BD3A
; ���������������������������������������������������������������������������

loc_BC73:				; CODE XREF: Goal_SelectTransition+132j
		cmp	[bp+var_2], 0
		jz	short loc_BC7E
		mov	byte_6E4C5, 1

loc_BC7E:				; CODE XREF: Goal_SelectTransition+324j
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+28Bh], 20h
		cmp	word ptr es:[bx+285h], 0
		jnz	short loc_BC92
		jmp	loc_BD22
; ���������������������������������������������������������������������������

loc_BC92:				; CODE XREF: Goal_SelectTransition+33Aj
		push	word ptr es:[bx+285h]
		mov	bx, es:[bx+285h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		les	bx, [bp+var_12]
		cmp	byte ptr es:[bx+11h], 2
		jnz	short loc_BD22
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_BCBF
		jmp	loc_BB6C
; ���������������������������������������������������������������������������

loc_BCBF:				; CODE XREF: Goal_SelectTransition+367j
		mov	[bp+var_1C], 0
		xor	ax, ax
		mov	[bp+var_18], ax
		mov	[bp+var_1A], ax
		mov	[bp+var_20], 200h
		mov	eax, [bp+var_20]
		mov	[bp+var_16], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+285h]
		mov	[bp+var_22], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 283h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0D9h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp+var_1C]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0D9h]
		les	bx, es:[bx+0D9h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		jmp	loc_BB97
; ���������������������������������������������������������������������������

loc_BD22:				; CODE XREF: Goal_SelectTransition+33Cj
					; Goal_SelectTransition+35Cj
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Escort_LeaderSuccession

loc_BD2B:				; CODE XREF: Goal_SelectTransition+22Bj
					; Goal_SelectTransition+253j
		add	sp, 4

loc_BD2E:				; CODE XREF: Goal_SelectTransition+20Ej
					; Goal_SelectTransition+247j ...
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_PlayerSpottedCallout

loc_BD37:				; CODE XREF: Goal_SelectTransition+2E2j
		add	sp, 4

loc_BD3A:				; CODE XREF: Goal_SelectTransition+21j
					; Goal_SelectTransition+113j ...
		mov	al, [bp+var_1]
		leave
		retf
Goal_SelectTransition	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,139L — vérifie si soi-même ou son ailier (+0x145/+0x147) est le joueur (word_722E6),
; calcule la distance (sub_5828E), et si proche + état GOAL 0xAA sous-état 0, déclenche une
; réplique radio via sub_CB45 (codes 0x10/0x11) : callout radio 'joueur repéré/à vue'.
; ==============================================================================================
Radio_PlayerSpottedCallout	proc far		; CODE XREF: Goal_SelectTransition+3E1p
					; Radio_CombatChatterDispatch+35p

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		cmp	word_722E6, 0
		jnz	short loc_BD50
		jmp	loc_BE73
; ���������������������������������������������������������������������������

loc_BD50:				; CODE XREF: Radio_PlayerSpottedCallout+Cj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jz	short loc_BD6C
		mov	ax, es:[bx+147h]
		cmp	ax, word_722E6
		jz	short loc_BD6C
		jmp	loc_BE73
; ���������������������������������������������������������������������������

loc_BD6C:				; CODE XREF: Radio_PlayerSpottedCallout+1Dj Radio_PlayerSpottedCallout+28j
		mov	si, word_722E6
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_14], eax
		mov	eax, [si+4]
		mov	[bp+var_10], eax
		mov	eax, [si+8]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [si]
		sub	[bp+var_14], eax
		mov	eax, [si+4]
		sub	[bp+var_10], eax
		mov	eax, [si+8]
		sub	[bp+var_C], eax
		push	large [bp+var_C]
		push	large [bp+var_10]
		push	large [bp+var_14]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 7D000h
		jge	short loc_BDDB
		mov	ax, 1
		jmp	short loc_BDDD
; ���������������������������������������������������������������������������

loc_BDDB:				; CODE XREF: Radio_PlayerSpottedCallout+95j
		xor	ax, ax

loc_BDDD:				; CODE XREF: Radio_PlayerSpottedCallout+9Aj
		or	al, al
		jnz	short loc_BDF5
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jnz	short loc_BE36
		cmp	byte ptr es:[bx+149h], 0
		jnz	short loc_BE36

loc_BDF5:				; CODE XREF: Radio_PlayerSpottedCallout+A0j
		cmp	word_722EE, 0
		jz	short loc_BE01
		mov	ax, 1
		jmp	short loc_BE03
; ���������������������������������������������������������������������������

loc_BE01:				; CODE XREF: Radio_PlayerSpottedCallout+BBj
		xor	ax, ax

loc_BE03:				; CODE XREF: Radio_PlayerSpottedCallout+C0j
		or	al, al
		jz	short loc_BE1B
		push	0
		push	10h
		push	word_722E6
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah

loc_BE1B:				; CODE XREF: Radio_PlayerSpottedCallout+C6j
		cmp	byte_6E4CC, 0
		jz	short loc_BE36
		push	0
		push	11h
		push	word_722E6
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah

loc_BE36:				; CODE XREF: Radio_PlayerSpottedCallout+ACj Radio_PlayerSpottedCallout+B4j ...
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+15Bh], 0FFh
		jz	short loc_BE73
		push	1
		call	Widget_Helper_5AB2C
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BE73
		push	1
		les	bx, [bp+arg_0]
		mov	al, es:[bx+15Bh]
		push	ax
		push	word_722E6
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+15Bh], 0FFh

loc_BE73:				; CODE XREF: Radio_PlayerSpottedCallout+Ej Radio_PlayerSpottedCallout+2Aj	...
		pop	si
		leave
		retf
Radio_PlayerSpottedCallout	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 350 lignes - LUE INTEGRALEMENT (suite a une observation de jeu de Remi : Billy dit
; 'Hasta la vista, baby' a chaque cible detruite, d'autres pilotes moins). Dispatcheur de
; repliques de combat contextuelles, plusieurs codes distincts : 0x0E (avertissement tir ami)
; : garde par entite+0x289==joueur ET byte_6E4C9, PUIS Radio_CanPlayMessage_CC7A (throttle,
; lit entite+0xB2). 0x0C ('Here we go...Primetime', message contextuel d'engagement) ET 0x0B
; ('There they are, sitting ducks', repliques de reperage) : chacun garde par un DRAPEAU
; D'ETAT propre (byte_6E4CD/byte_6E4CE), PUIS Radio_CanPlayMessage_CC7A (throttle), PUIS UN
; JET DE DE (CRT_Rand_70D, test ax&3==0 -> 1 CHANCE SUR 4) avant de jouer. 0x0D (repliques de
; confirmation de destruction de cible, ex. 'Hasta la vista, baby' chez Billy, 'Target
; destroyed' chez Stern/Gwen) : DECLENCHEMENT DETERMINISTE - garde uniquement par byte_6E4CB
; et une comparaison directe (entite+0x102 == word_722EC, la reference globale de 'derniere
; cible detruite') - AUCUN throttle, AUCUN jet de de. CONCLUSION IMPORTANTE : tous les pilotes
; disposent d'une replique au code 0x0D et la jouent de facon deterministe a chaque
; destruction de cible confirmee - la difference de personnalite perçue entre pilotes vient du
; CONTENU ECRIT de la replique (courte/professionnelle chez Stern/Gwen, elaboree/marquante
; chez Billy), PAS d'une modulation numerique de frequence par un trait ATRB.
; ==============================================================================================
Radio_CombatChatterDispatch	proc far		; CODE XREF: AI_TopLevelThink+40P

var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		cmp	word_722E6, 0
		jnz	short loc_BE87
		jmp	loc_C177
; ���������������������������������������������������������������������������

loc_BE87:				; CODE XREF: Radio_CombatChatterDispatch+Cj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 1
		jz	short loc_BE98
		jmp	loc_C14E
; ���������������������������������������������������������������������������

loc_BE98:				; CODE XREF: Radio_CombatChatterDispatch+1Dj
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+147h]
		cmp	ax, word_722E6
		jnz	short loc_BEB1
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr Radio_PlayerSpottedCallout
		add	sp, 4

loc_BEB1:				; CODE XREF: Radio_CombatChatterDispatch+2Ej
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+289h]
		cmp	ax, word_722E6
		jnz	short loc_BEFB
		cmp	byte_6E4C9, 0
		jz	short loc_BEFB
		push	0Eh
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Radio_CanPlayMessage
		add	sp, 6
		or	al, al
		jz	short loc_BEFB
		push	0
		push	0Eh
		push	word_722E6
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B3h]
		add	al, 0FDh ; '�'
		mov	es:[bx+0B3h], al

loc_BEFB:				; CODE XREF: Radio_CombatChatterDispatch+47j Radio_CombatChatterDispatch+4Ej ...
		mov	al, byte_6E4BA
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BF40
		cmp	byte_6E4CD, 0
		jz	short loc_BF40
		push	0Ch
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_CanPlayMessage
		add	sp, 6
		or	al, al
		jz	short loc_BF40
		call	CRT_Rand
		test	ax, 3
		jnz	short loc_BF40
		mov	byte_6E4BA, 1
		push	0
		push	0Ch
		push	word_722E6
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah

loc_BF40:				; CODE XREF: Radio_CombatChatterDispatch+8Cj Radio_CombatChatterDispatch+93j ...
		mov	al, byte_6E4BA
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BF8E
		mov	al, byte_6E4CD
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BF8E
		cmp	byte_6E4CE, 0
		jz	short loc_BF8E
		push	0Bh
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_CanPlayMessage
		add	sp, 6
		or	al, al
		jz	short loc_BF8E
		call	CRT_Rand
		test	ax, 3
		jnz	short loc_BF8E
		mov	byte_6E4BA, 1
		push	0
		push	0Bh
		push	word_722E6
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah

loc_BF8E:				; CODE XREF: Radio_CombatChatterDispatch+D1j Radio_CombatChatterDispatch+DAj ...
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jnz	short loc_BFE9
		cmp	byte_6E4D1, 0
		jz	short loc_BFA9
		push	0
		push	1Ch
		jmp	short loc_BFD9
; ���������������������������������������������������������������������������

loc_BFA9:				; CODE XREF: Radio_CombatChatterDispatch+12Bj
		cmp	byte_6E4CB, 0
		jz	short loc_BFBE
		mov	ax, word_722EC
		cmp	ax, word_722E6
		jnz	short loc_BFBE
		mov	ax, 1
		jmp	short loc_BFC0
; ���������������������������������������������������������������������������

loc_BFBE:				; CODE XREF: Radio_CombatChatterDispatch+138j
					; Radio_CombatChatterDispatch+141j
		xor	ax, ax

loc_BFC0:				; CODE XREF: Radio_CombatChatterDispatch+146j
		or	al, al
		jz	short loc_BFE9
		cmp	byte_6E4D2, 0
		jz	short loc_BFE9
		call	CRT_Rand
		test	ax, 3
		jnz	short loc_BFE9
		push	0
		push	0Fh

loc_BFD9:				; CODE XREF: Radio_CombatChatterDispatch+131j
		push	word_722E6
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah

loc_BFE9:				; CODE XREF: Radio_CombatChatterDispatch+124j
					; Radio_CombatChatterDispatch+14Cj ...
		cmp	byte_6E4CA, 0
		jz	short loc_BFFE
		mov	ax, word_722EC
		cmp	ax, word_722E6
		jnz	short loc_BFFE
		mov	ax, 1
		jmp	short loc_C000
; ���������������������������������������������������������������������������

loc_BFFE:				; CODE XREF: Radio_CombatChatterDispatch+178j
					; Radio_CombatChatterDispatch+181j
		xor	ax, ax

loc_C000:				; CODE XREF: Radio_CombatChatterDispatch+186j
		or	al, al
		jz	short loc_C018
		mov	byte_6E4BB, 1
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B3h]
		add	al, 0F8h ; '�'
		mov	es:[bx+0B3h], al

loc_C018:				; CODE XREF: Radio_CombatChatterDispatch+18Cj
		cmp	byte_6E4BB, 0
		jz	short loc_C054
		push	0Eh
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_CanPlayMessage
		add	sp, 6
		or	al, al
		jz	short loc_C054
		call	CRT_Rand
		test	ax, 3
		jnz	short loc_C054
		push	1
		push	0Eh
		push	word_722E6
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah
		mov	byte_6E4BB, 0

loc_C054:				; CODE XREF: Radio_CombatChatterDispatch+1A7j
					; Radio_CombatChatterDispatch+1B9j ...
		cmp	byte_6E4D8, 0
		jnz	short loc_C05E
		jmp	loc_C0E4
; ���������������������������������������������������������������������������

loc_C05E:				; CODE XREF: Radio_CombatChatterDispatch+1E3j
		mov	bx, word_722E6
		mov	eax, [bx+5Ah]
		mov	[bp+var_8], eax
		les	bx, [bp+var_8]
		mov	ax, es:[bx+0Dh]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+102h]
		jnz	short loc_C0E4
		les	bx, [bp+var_8]
		les	bx, es:[bx+14h]
		push	es
		les	si, [bp+var_8]
		mov	ax, es:[si]
		imul	ax, 12h
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_C0B5
		les	bx, [bp+var_8]
		les	bx, es:[bx+14h]
		push	es
		mov	es, word ptr [bp+var_8+2]
		mov	ax, es:[si]
		imul	ax, 12h
		add	bx, ax
		pop	es
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_C0B7
; ���������������������������������������������������������������������������

loc_C0B5:				; CODE XREF: Radio_CombatChatterDispatch+220j
		xor	ax, ax

loc_C0B7:				; CODE XREF: Radio_CombatChatterDispatch+23Dj
		test	ax, 800h
		jnz	short loc_C0E4
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B3h]
		add	al, 0FEh ; '�'
		mov	es:[bx+0B3h], al
		mov	ax, word_722E6
		mov	[bp+var_A], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 289h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_C0E4:				; CODE XREF: Radio_CombatChatterDispatch+1E5j
					; Radio_CombatChatterDispatch+203j ...
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jnz	short loc_C14E
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jz	short loc_C10A
		mov	al, es:[bx+28Bh]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_C14E

loc_C10A:				; CODE XREF: Radio_CombatChatterDispatch+283j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+149h], 0
		jnz	short loc_C11A
		mov	ax, 1
		jmp	short loc_C11C
; ���������������������������������������������������������������������������

loc_C11A:				; CODE XREF: Radio_CombatChatterDispatch+29Dj
		xor	ax, ax

loc_C11C:				; CODE XREF: Radio_CombatChatterDispatch+2A2j
		mov	[bp+var_1], al
		mov	byte_6E4D4, al
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+149h], 2
		jnz	short loc_C132
		mov	ax, 1
		jmp	short loc_C134
; ���������������������������������������������������������������������������

loc_C132:				; CODE XREF: Radio_CombatChatterDispatch+2B5j
		xor	ax, ax

loc_C134:				; CODE XREF: Radio_CombatChatterDispatch+2BAj
		mov	[bp+var_2], al
		mov	byte_6E4D5, al
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 4
		and	ax, 1
		mov	[bp+var_3], al
		mov	byte_6E4D6, al

loc_C14E:				; CODE XREF: Radio_CombatChatterDispatch+1Fj
					; Radio_CombatChatterDispatch+27Aj ...
		cmp	byte_6E4CB, 0
		jz	short loc_C177
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+102h]
		cmp	ax, word_722EC
		jnz	short loc_C177
		push	0
		push	0Dh
		push	word_722E6
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah

loc_C177:				; CODE XREF: Radio_CombatChatterDispatch+Ej Radio_CombatChatterDispatch+2DDj ...
		pop	si
		leave
		retf
Radio_CombatChatterDispatch	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,363L — vérifie l'état du leader d'escadrille (+0x285, vtable[0x34]==6 = mort/hors-jeu),
; propage la référence vers la chaîne d'escorte (+0x287) : logique de succession de leader
; (promotion d'ailier). CONFIRME : la section lignes 26073-26097 (partie du traitement de cas
; par defaut de la machine a etats +0x160) touche le MEME noeud MVRS ID=0x14
; (PilotProfile+0xC1) avec le MEME motif exact que Entity_ProximityTest_ThreatGate_315B (reset
; node[+0xC]=0 puis appel [vtable+8]) - confirme que [vtable+8] est un idiome generique de
; finalisation/application du noeud, reutilise dans plusieurs contextes IA sans rapport direct
; entre eux (proximite de menace, succession de leader d'escadrille). DETAILS COMPLEMENTAIRES
; (relecture complete des 3 cas du switch interne +0x160, jamais entierement detailles avant)
; : case 0x0 (loc_C324) calcule la distance/position relative a la cible d'escorte via un
; appel virtuel [vtable+0x3C] sur celle-ci (meme slot que 'position courante' utilise dans
; MissionInit_LoadEntitiesAndPlayIntroCamera_7B035), compare contre un seuil (0x5A00), PUIS
; effectue le fameux appel [vtable+8] sur le noeud MVRS (+0xC1) avec des parametres de mode
; (0x200/0x400). case 0x1 (loc_C475) appelle une AUTRE methode virtuelle, [vtable+0xC], sur
; une reference differente (+0xD, pas +0xC1) - CONFIRME un CINQUIEME slot de vtable (+0xC) en
; plus de +0/+4/+8/+0x1C deja identifies, mais sur une classe differente (le champ +0xD, pas
; les noeuds de propriete MVRS). case 0x2 (loc_C496) verifie un delai ecoule (entite+0x175 -
; entite+0x162, seuil 60 unites, memes champs de temps qu'AIEntity_MasterTick_5ACC et le
; sentinelle -100 d'AIEntity_Construct_74B43) AVANT d'autoriser l'appel a
; AI_BehaviorStateMachine_WeightedOptionSelector_9D05 - rate-limiting explicite de la
; sollicitation MVRS depuis ce contexte specifique.
; ==============================================================================================
Escort_LeaderSuccession	proc far		; CODE XREF: Goal_SelectTransition+3D5p

var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 44h
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+145h], 0
		jnz	short loc_C190
		jmp	loc_C4DB	; case 0x3
; ���������������������������������������������������������������������������

loc_C190:				; CODE XREF: Escort_LeaderSuccession+11j
		cmp	word ptr es:[bx+285h], 0
		jnz	short loc_C19B
		jmp	loc_C4DB	; case 0x3
; ���������������������������������������������������������������������������

loc_C19B:				; CODE XREF: Escort_LeaderSuccession+1Cj
		push	word ptr es:[bx+285h]
		mov	bx, es:[bx+285h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_C1B2
		jmp	loc_C4F1
; ���������������������������������������������������������������������������

loc_C1B2:				; CODE XREF: Escort_LeaderSuccession+33j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+287h], 0
		jnz	short loc_C1D8
		mov	ax, es:[bx+285h]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_C1D8:				; CODE XREF: Escort_LeaderSuccession+41j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+160h]
		dec	bx
		cmp	bx, 3		; switch 4 cases
		ja	short loc_C1ED	; default
		shl	bx, 1
		jmp	cs:off_C4F5[bx]	; switch jump
; ���������������������������������������������������������������������������

loc_C1ED:				; CODE XREF: Escort_LeaderSuccession+6Aj
		les	bx, [bp+arg_0]	; default
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_2C], eax
		mov	eax, [si+4]
		mov	[bp+var_28], eax
		mov	eax, [si+8]
		mov	[bp+var_24], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+287h]
		mov	bx, es:[bx+287h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_38], eax
		mov	eax, [si+4]
		mov	[bp+var_34], eax
		mov	eax, [si+8]
		mov	[bp+var_30], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+287h]
		add	si, 12h
		mov	di, es:[bx+102h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_44], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_40], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_3C], eax
		lea	ax, [bp+var_2C]

loc_C283:
		push	ax

loc_C284:
		lea	ax, [bp+var_44]
		push	ax
		push	ss
		lea	ax, [bp+var_A]

loc_C28C:
		push	ax

loc_C28D:
		call	Angle_DeltaNormalized_A

loc_C292:
		add	sp, 8

loc_C295:
		mov	eax, [bp+var_A]
		or	eax, eax
		jge	short loc_C2A1
		neg	eax

loc_C2A1:				; CODE XREF: Escort_LeaderSuccession+122j
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	ax, word ptr [bp+var_12+1]
		mov	word ptr [bp+var_6+2], ax
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	eax, [bp+var_16]
		or	eax, eax
		jge	short loc_C2D4
		neg	eax

loc_C2D4:				; CODE XREF: Escort_LeaderSuccession+155j
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	ax, word ptr [bp+var_1E+1]
		mov	word ptr [bp+var_6], ax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_C2FE
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4

loc_C2FE:				; CODE XREF: Escort_LeaderSuccession+175j
		cmp	word ptr [bp+var_6+2], 3Ch ; '<'
		jge	short loc_C317
		cmp	word ptr [bp+var_6], 5Ah ; 'Z'
		jge	short loc_C317
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+160h], 3
		jmp	loc_C4F1
; ���������������������������������������������������������������������������

loc_C317:				; CODE XREF: Escort_LeaderSuccession+188j
					; Escort_LeaderSuccession+18Ej
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+160h], 1
		jmp	loc_C4F1
; ���������������������������������������������������������������������������

loc_C324:				; CODE XREF: Escort_LeaderSuccession+6Ej
					; DATA XREF: seg006:off_C4F5o
		les	bx, [bp+arg_0]	; case 0x0
		push	word ptr es:[bx+145h]
		mov	bx, es:[bx+145h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_2C], eax
		mov	eax, [si+4]
		mov	[bp+var_28], eax
		mov	eax, [si+8]
		mov	[bp+var_24], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	di, es:[bx+145h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_38], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_34], eax
		mov	eax, [si+8]
		sub	eax, [di+8]

loc_C384:
		mov	[bp+var_30], eax

loc_C388:
		mov	[bp+var_24], 0
		lea	ax, [bp+var_2C]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp+var_28]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_2C]
		neg	eax
		mov	[bp+var_40], eax
		mov	[bp+var_3C], 0
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	eax, [bp+var_6]
		or	eax, eax
		jge	short loc_C3D6
		neg	eax

loc_C3D6:				; CODE XREF: Escort_LeaderSuccession+257j
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 5A00h
		jle	short loc_C3F1
		mov	ax, 1
		jmp	short loc_C3F3
; ���������������������������������������������������������������������������

loc_C3F1:				; CODE XREF: Escort_LeaderSuccession+270j
		xor	ax, ax

loc_C3F3:				; CODE XREF: Escort_LeaderSuccession+275j
		or	al, al
		jz	short loc_C418
		mov	eax, [bp+var_44]
		neg	eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_40]
		neg	eax
		mov	[bp+var_40], eax
		mov	eax, [bp+var_3C]
		neg	eax
		mov	[bp+var_3C], eax

loc_C418:				; CODE XREF: Escort_LeaderSuccession+27Bj
		mov	word ptr [bp+var_1A+2],	0
		xor	ax, ax
		mov	word ptr [bp+var_16+2],	ax
		mov	word ptr [bp+var_16], ax
		mov	[bp+var_1E+2], 200h
		mov	eax, [bp+var_1E+2]
		mov	[bp+var_12], eax
		lea	ax, [bp+var_44]
		mov	word ptr [bp+var_16+2],	ax
		mov	dword ptr [bp-20h], 400h
		mov	eax, [bp-20h]
		mov	[bp+var_12], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0C1h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp+var_1A+2]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0C1h]
		les	bx, es:[bx+0C1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	short loc_C4D1
; ���������������������������������������������������������������������������

loc_C475:				; CODE XREF: Escort_LeaderSuccession+6Ej
					; DATA XREF: seg006:off_C4F5o
		les	bx, [bp+arg_0]	; case 0x1
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_C4D1

loc_C480:
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]

loc_C48C:
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_C4F1
; ���������������������������������������������������������������������������
		jmp	short loc_C4D1
; ���������������������������������������������������������������������������

loc_C496:				; CODE XREF: Escort_LeaderSuccession+6Ej
					; DATA XREF: seg006:off_C4F5o
		push	0		; case 0x2
		push	large [bp+arg_0]
		call	AI_BehaviorStateMachine_WeightedOptionSelector_9D05
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jz	short loc_C4D1
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 1
		jz	short loc_C4F1
		mov	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+175h]
		sar	eax, 8
		sub	eax, es:[bx+162h]
		cmp	eax, 3Ch ; '<'
		jle	short loc_C4F1

loc_C4D1:				; CODE XREF: Escort_LeaderSuccession+2F9j
					; Escort_LeaderSuccession+304j ...
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+160h]
		jmp	short loc_C4F1
; ���������������������������������������������������������������������������

loc_C4DB:				; CODE XREF: Escort_LeaderSuccession+13j Escort_LeaderSuccession+1Ej ...
		les	bx, [bp+arg_0]	; case 0x3
		mov	word ptr es:[bx+160h], 0
		mov	byte ptr es:[bx+149h], 0
		and	byte ptr es:[bx+28Bh], 0DFh

loc_C4F1:				; CODE XREF: Escort_LeaderSuccession+35j
					; Escort_LeaderSuccession+19Aj ...
		pop	di
		pop	si
		leave
		retf
Escort_LeaderSuccession	endp

; ���������������������������������������������������������������������������
off_C4F5	dw offset loc_C324	; DATA XREF: Escort_LeaderSuccession+6Er
		dw offset loc_C475	; jump table for switch	statement
		dw offset loc_C496
		dw offset loc_C4DB

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,88L — transfert de GOAL entre deux entités (copie +0x11D, +0x137 cible, +0x10F waypoint
; depuis un objet référencé) : transmission d'ordre/mission du leader vers un ailier.
; ==============================================================================================
Goal_TransferToWingman	proc far		; CODE XREF: seg004:0ACCP
					; AI_MessageDispatcher+168p ...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+149h], 1
		or	byte ptr es:[bx+28Bh], 20h
		cmp	word ptr es:[bx+145h], 0
		jz	short loc_C582
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jz	short loc_C582
		mov	bx, es:[bx+145h]
		mov	ax, [bx+57h]
		mov	dx, [bx+55h]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		cmp	byte ptr es:[bx+6], 1
		jz	short loc_C543
		jmp	locret_C5CB
; ���������������������������������������������������������������������������

loc_C543:				; CODE XREF: Goal_TransferToWingman+41j
		mov	ax, es:[bx+11Dh]
		les	bx, [bp+arg_0]
		mov	es:[bx+11Dh], ax
		les	bx, [bp+var_8]
		mov	ax, es:[bx+137h]
		mov	[bp+var_A], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 137h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+var_8]
		mov	ax, es:[bx+10Fh]
		mov	[bp+var_C], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10Fh
		jmp	short loc_C5BF
; ���������������������������������������������������������������������������

loc_C582:				; CODE XREF: Goal_TransferToWingman+1Bj Goal_TransferToWingman+26j
		les	bx, [bp+arg_0]

loc_C585:
		cmp	word ptr es:[bx+145h], 0
		jz	short locret_C5CB
		mov	byte_6E4D4, 0
		mov	ax, es:[bx+145h]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+145h]
		mov	[bp+var_4], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 137h

loc_C5BF:				; CODE XREF: Goal_TransferToWingman+83j
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

locret_C5CB:				; CODE XREF: Goal_TransferToWingman+43j Goal_TransferToWingman+8Ej
		leave
		retf
Goal_TransferToWingman	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,578L — appelé par sub_814C : gère une file de messages (+0x1A/+0x26 via sub_1EC46) et un
; verrou de cible (+0x9C) : dispatcher de traitement des messages/événements IA de haut
; niveau, en amont de la sélection de GOAL — à approfondir.
; ==============================================================================================
AI_MessageDispatcher	proc far		; CODE XREF: AI_TopLevelThink+34P

var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_19		= byte ptr -19h
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_7		= byte ptr -7
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+26h], 0
		jz	short loc_C5F3
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ah
		push	word ptr [bp+arg_0+2]
		push	ax
		call	RadioQueue_RegisterMessage
		add	sp, 4
		jmp	short loc_C602
; ���������������������������������������������������������������������������

loc_C5F3:				; CODE XREF: AI_MessageDispatcher+10j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+9Ch], 0
		mov	al, 0FFh

loc_C602:				; CODE XREF: AI_MessageDispatcher+24j
		mov	[bp+var_2], al
		cmp	[bp+var_2], 0FFh
		jnz	short loc_C60E
		jmp	loc_CA2C
; ���������������������������������������������������������������������������

loc_C60E:				; CODE XREF: AI_MessageDispatcher+3Cj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+9Ch]
		mov	di, es:[bx+0Dh]
		mov	[bp+var_6], 0
		or	di, di
		jnz	short loc_C625
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C625:				; CODE XREF: AI_MessageDispatcher+53j
		cmp	di, word_722E6
		jz	short loc_C62E
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C62E:				; CODE XREF: AI_MessageDispatcher+5Cj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jz	short loc_C674
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_C674
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+21h], 11h
		jz	short loc_C674
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+149h], 1
		jz	short loc_C674
		cmp	[bp+var_2], 64h	; 'd'
		jz	short loc_C674
		mov	al, es:[bx+28Bh]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C674
		mov	ax, 1
		jmp	short loc_C676
; ���������������������������������������������������������������������������

loc_C674:				; CODE XREF: AI_MessageDispatcher+6Bj AI_MessageDispatcher+73j ...
		xor	ax, ax

loc_C676:				; CODE XREF: AI_MessageDispatcher+A5j
		mov	[bp+var_7], al
		mov	ah, 0
		or	ax, ax
		jz	short loc_C682
		jmp	loc_CA15	; default
; ���������������������������������������������������������������������������

loc_C682:				; CODE XREF: AI_MessageDispatcher+B0j
		push	large [bp+arg_0]
		nop
		push	cs

loc_C688:
		call	near ptr Voice_ExpressionTimer
		add	sp, 4
		mov	dl, al

loc_C690:
		cmp	byte_6E33B, 0

loc_C695:
		jz	short loc_C69E

loc_C697:
		mov	[bp+var_6], 20h	; ' '
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C69E:				; CODE XREF: AI_MessageDispatcher:loc_C695j
		mov	al, [bp+var_2]
		cbw
		sub	ax, 64h	; 'd'
		mov	bx, ax
		cmp	bx, 9		; switch 10 cases
		jbe	short loc_C6AF
		jmp	loc_CA15	; default
; ���������������������������������������������������������������������������

loc_C6AF:				; CODE XREF: AI_MessageDispatcher+DDj
		shl	bx, 1
		jmp	cs:off_CA7F[bx]	; switch jump

loc_C6B6:				; DATA XREF: seg006:off_CA7Fo
		push	large [bp+arg_0] ; case	0x0
		nop
		push	cs
		call	near ptr Radio_SelectContextMessage
		add	sp, 4
		mov	[bp+var_6], al
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C6C8:				; CODE XREF: AI_MessageDispatcher+E4j
					; DATA XREF: seg006:off_CA7Fo
		or	dl, dl		; case 0x8
		jnz	short loc_C6CF
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C6CF:				; CODE XREF: AI_MessageDispatcher+FDj
		les	bx, [bp+arg_0]
		cmp	es:[bx+145h], di
		jz	short loc_C6DC
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C6DC:				; CODE XREF: AI_MessageDispatcher+10Aj
		mov	[bp+var_6], 1
		push	1
		mov	al, [bp+var_6]
		push	ax
		push	di
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+28Bh], 10h
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C6FF:				; CODE XREF: AI_MessageDispatcher+E4j
					; DATA XREF: seg006:off_CA7Fo
		les	bx, [bp+arg_0]	; case 0x9
		cmp	es:[bx+145h], di
		jz	short loc_C70C
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C70C:				; CODE XREF: AI_MessageDispatcher+13Aj
		mov	[bp+var_6], 1
		and	byte ptr es:[bx+28Bh], 0EFh
		jmp	short loc_C762
; ���������������������������������������������������������������������������

loc_C718:				; CODE XREF: AI_MessageDispatcher+E4j
					; DATA XREF: seg006:off_CA7Fo
		or	dl, dl		; case 0x3
		jnz	short loc_C71F
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C71F:				; CODE XREF: AI_MessageDispatcher+14Dj
		les	bx, [bp+arg_0]
		cmp	es:[bx+145h], di
		jz	short loc_C72C
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C72C:				; CODE XREF: AI_MessageDispatcher+15Aj
		mov	[bp+var_6], 1
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr Goal_TransferToWingman
		add	sp, 4
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C73E:				; CODE XREF: AI_MessageDispatcher+E4j
					; DATA XREF: seg006:off_CA7Fo
		or	dl, dl		; case 0x4
		jnz	short loc_C745
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C745:				; CODE XREF: AI_MessageDispatcher+173j
		les	bx, [bp+arg_0]
		cmp	es:[bx+145h], di
		jz	short loc_C752
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C752:				; CODE XREF: AI_MessageDispatcher+180j
		mov	[bp+var_6], 1
		mov	byte ptr es:[bx+149h], 0
		and	byte ptr es:[bx+28Bh], 0DFh

loc_C762:				; CODE XREF: AI_MessageDispatcher+149j
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C765:				; CODE XREF: AI_MessageDispatcher+E4j
					; DATA XREF: seg006:off_CA7Fo
		or	dl, dl		; case 0x5
		jnz	short loc_C76C
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C76C:				; CODE XREF: AI_MessageDispatcher+19Aj
		les	bx, [bp+arg_0]
		cmp	es:[bx+145h], di
		jz	short loc_C779
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C779:				; CODE XREF: AI_MessageDispatcher+1A7j
		les	bx, [di+5Ah]
		mov	si, es:[bx+0Dh]

loc_C780:
		mov	[bp+var_19], 0
		or	si, si

loc_C786:
		jnz	short loc_C78B
		jmp	loc_C899
; ���������������������������������������������������������������������������

loc_C78B:				; CODE XREF: AI_MessageDispatcher:loc_C786j
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_1E+2],	dx
		mov	word ptr [bp+var_1E], ax
		les	bx, [bp+var_1E]
		cmp	byte ptr es:[bx+11h], 2
		jnz	short loc_C80D
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0B4h], 0Eh
		jg	short loc_C7B5
		cmp	byte ptr [si+50h], 1
		jnz	short loc_C7B5
		jmp	loc_C899
; ���������������������������������������������������������������������������

loc_C7B5:				; CODE XREF: AI_MessageDispatcher+1DDj
					; AI_MessageDispatcher+1E3j
		mov	[bp+var_19], 1
		mov	[bp+var_20], si
		push	[bp+var_20]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 285h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	[bp+var_22], si
		push	[bp+var_22]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 137h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	[bp+var_24], si
		push	[bp+var_24]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 283h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+149h], 3
		jmp	loc_C899
; ���������������������������������������������������������������������������

loc_C80D:				; CODE XREF: AI_MessageDispatcher+1D2j
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_28+2],	dx
		mov	word ptr [bp+var_28], ax
		push	dx
		push	ax
		les	bx, [bp+var_28]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jnz	short loc_C899
		les	bx, [bp+arg_0]
		cmp	es:[bx+102h], si
		jz	short loc_C899
		cmp	byte ptr es:[bx+0B4h], 0Eh
		jg	short loc_C852
		mov	al, [si+50h]
		cbw
		mov	bx, es:[bx+102h]
		push	ax
		mov	al, [bx+50h]
		cbw
		neg	ax
		pop	dx
		cmp	dx, ax
		jnz	short loc_C899

loc_C852:				; CODE XREF: AI_MessageDispatcher+26Ej
		mov	[bp+var_19], 1
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+149h], 3
		mov	[bp+var_2A], si
		push	[bp+var_2A]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 285h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	[bp+var_2C], si
		push	[bp+var_2C]
		mov	ax, word ptr [bp+arg_0]

loc_C880:
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+160h], 0

loc_C899:				; CODE XREF: AI_MessageDispatcher+1BBj
					; AI_MessageDispatcher+1E5j ...
		mov	al, [bp+var_19]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Bh], 0DFh
		shl	al, 5
		or	es:[bx+28Bh], al
		cmp	[bp+var_19], 0
		jz	short loc_C8BA
		mov	al, 1
		jmp	short loc_C8BC
; ���������������������������������������������������������������������������

loc_C8BA:				; CODE XREF: AI_MessageDispatcher+2E7j
		mov	al, 0

loc_C8BC:				; CODE XREF: AI_MessageDispatcher+2EBj
		mov	[bp+var_6], al
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C8C2:				; CODE XREF: AI_MessageDispatcher+E4j
					; DATA XREF: seg006:off_CA7Fo
		les	bx, [bp+arg_0]	; case 0x6
		cmp	es:[bx+145h], di
		jz	short loc_C8CF
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C8CF:				; CODE XREF: AI_MessageDispatcher+2FDj
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jz	short loc_C8E3
		cmp	byte ptr es:[bx+149h], 1
		jz	short loc_C8E3
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C8E3:				; CODE XREF: AI_MessageDispatcher+309j
					; AI_MessageDispatcher+311j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0B4h], 0Eh
		jg	short loc_C911
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Radio_SelectContextMessage
		add	sp, 4
		cmp	al, 5
		jz	short loc_C911
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_SelectContextMessage
		add	sp, 4
		cmp	al, 4
		jz	short loc_C911
		jmp	loc_CA19
; ���������������������������������������������������������������������������

loc_C911:				; CODE XREF: AI_MessageDispatcher+31Fj
					; AI_MessageDispatcher+32Fj ...
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B4h]
		add	al, 0FCh ; '�'
		mov	es:[bx+0B4h], al
		mov	[bp+var_6], 8
		or	byte ptr es:[bx+28Bh], 20h
		mov	byte ptr es:[bx+149h], 2
		push	word_706A0
		push	ss
		lea	ax, [bp+var_38]
		push	ax
		call	Expr_Node_AllocateTriple_543CA
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_38]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_34]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_30]
		mov	es:[bx+0Ah], eax
		add	dword ptr es:[bx+0Ah], 3E800h
		mov	[bp+var_C], 0FA00h
		mov	[bp+var_10], 6400h

loc_C97C:
		mov	[bp+var_14], 0
		mov	eax, [bp+var_C]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_10]

loc_C991:
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+16h], eax
		jmp	short loc_CA19
; ���������������������������������������������������������������������������

loc_C9A1:				; CODE XREF: AI_MessageDispatcher+E4j
					; DATA XREF: seg006:off_CA7Fo
		or	dl, dl		; case 0x7
		jz	short loc_CA19
		les	bx, [bp+arg_0]
		cmp	es:[bx+145h], di
		jnz	short loc_CA19
		cmp	word_722EE, 0
		jz	short loc_CA00
		mov	byte ptr es:[bx+149h], 3
		mov	ax, word_722EE
		mov	[bp+var_16], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 285h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, word_722EE
		mov	[bp+var_18], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+160h], 0
		or	byte ptr es:[bx+28Bh], 20h
		jmp	short loc_CA0F
; ���������������������������������������������������������������������������

loc_CA00:				; CODE XREF: AI_MessageDispatcher+3E7j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+149h], 0
		and	byte ptr es:[bx+28Bh], 0DFh

loc_CA0F:				; CODE XREF: AI_MessageDispatcher+431j
		mov	[bp+var_6], 1
		jmp	short loc_CA19
; ���������������������������������������������������������������������������

loc_CA15:				; CODE XREF: AI_MessageDispatcher+B2j AI_MessageDispatcher+DFj ...
		mov	[bp+var_6], 0	; default

loc_CA19:				; CODE XREF: AI_MessageDispatcher+55j AI_MessageDispatcher+5Ej ...
		push	1
		mov	al, [bp+var_6]
		push	ax
		push	di
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Radio_PlayMessage
		add	sp, 0Ah

loc_CA2C:				; CODE XREF: AI_MessageDispatcher+3Ej
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jnz	short loc_CA7B
		cmp	byte ptr es:[bx+149h], 0
		jnz	short loc_CA47
		mov	ax, 1
		jmp	short loc_CA49
; ���������������������������������������������������������������������������

loc_CA47:				; CODE XREF: AI_MessageDispatcher+473j
		xor	ax, ax

loc_CA49:				; CODE XREF: AI_MessageDispatcher+478j
		mov	[bp+var_3], al
		mov	byte_6E4D4, al
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+149h], 2
		jnz	short loc_CA5F
		mov	ax, 1
		jmp	short loc_CA61
; ���������������������������������������������������������������������������

loc_CA5F:				; CODE XREF: AI_MessageDispatcher+48Bj
		xor	ax, ax

loc_CA61:				; CODE XREF: AI_MessageDispatcher+490j
		mov	[bp+var_4], al
		mov	byte_6E4D5, al
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 4
		and	ax, 1
		mov	[bp+var_5], al
		mov	byte_6E4D6, al

loc_CA7B:				; CODE XREF: AI_MessageDispatcher+46Bj
		pop	di
		pop	si
		leave
		retf
AI_MessageDispatcher	endp

; ���������������������������������������������������������������������������
off_CA7F	dw offset loc_C6B6	; DATA XREF: AI_MessageDispatcher+E4r
		dw offset loc_CA15	; jump table for switch	statement
		dw offset loc_CA15
		dw offset loc_C718
		dw offset loc_C73E
		dw offset loc_C765
		dw offset loc_C8C2
		dw offset loc_C9A1
		dw offset loc_C6C8
		dw offset loc_C6FF

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,90L — timer d'expression faciale/voix (+0x175/+0x15C), déclenche sub_CD4A (sélection de
; ligne) puis ajuste un index de voix (+0xB4) via un switch à 4 cas : sélecteur
; d'expression/réplique du pilote selon le contexte.
; ==============================================================================================
Voice_ExpressionTimer	proc far		; CODE XREF: seg004:06DBP seg004:0A83P ...

var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+175h]
		sar	eax, 8
		sub	eax, es:[bx+15Ch]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 3
		jle	short loc_CB2D
		mov	al, es:[bx+0B4h]
		mov	[bp+var_5], al
		mov	eax, es:[bx+175h]
		sar	eax, 8
		mov	es:[bx+15Ch], eax
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Radio_SelectContextMessage
		add	sp, 4
		cbw
		sub	ax, 2
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		ja	short loc_CB0C	; default
		shl	bx, 1
		jmp	cs:off_CB3D[bx]	; switch jump

loc_CAED:				; DATA XREF: seg006:off_CB3Do
		mov	al, [bp+var_5]	; case 0x3
		add	al, 0FBh ; '�'

loc_CAF2:				; CODE XREF: Voice_ExpressionTimer+69j Voice_ExpressionTimer+70j ...
		mov	[bp+var_5], al
		jmp	short loc_CB0C	; default
; ���������������������������������������������������������������������������

loc_CAF7:				; CODE XREF: Voice_ExpressionTimer+55j
					; DATA XREF: seg006:off_CB3Do
		mov	al, [bp+var_5]	; case 0x2
		add	al, 0FDh ; '�'
		jmp	short loc_CAF2
; ���������������������������������������������������������������������������

loc_CAFE:				; CODE XREF: Voice_ExpressionTimer+55j
					; DATA XREF: seg006:off_CB3Do
		mov	al, [bp+var_5]	; case 0x1
		add	al, 4
		jmp	short loc_CAF2
; ���������������������������������������������������������������������������

loc_CB05:				; CODE XREF: Voice_ExpressionTimer+55j
					; DATA XREF: seg006:off_CB3Do
		mov	al, [bp+var_5]	; case 0x0
		add	al, 7
		jmp	short loc_CAF2
; ���������������������������������������������������������������������������

loc_CB0C:				; CODE XREF: Voice_ExpressionTimer+51j Voice_ExpressionTimer+62j
		cmp	[bp+var_5], 7	; default
		jle	short loc_CB17
		mov	ax, 1
		jmp	short loc_CB19
; ���������������������������������������������������������������������������

loc_CB17:				; CODE XREF: Voice_ExpressionTimer+7Dj
		xor	ax, ax

loc_CB19:				; CODE XREF: Voice_ExpressionTimer+82j
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Bh], 0BFh
		shl	al, 6
		or	es:[bx+28Bh], al

loc_CB2D:				; CODE XREF: Voice_ExpressionTimer+22j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 6
		and	ax, 1
		leave
		retf
Voice_ExpressionTimer	endp

; ���������������������������������������������������������������������������
off_CB3D	dw offset loc_CB05	; DATA XREF: Voice_ExpressionTimer+55r
		dw offset loc_CAFE	; jump table for switch	statement
		dw offset loc_CAF7
		dw offset loc_CAED

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,152L — lecteur de message radio : vérifie le flag de suppression (+0x28B bit4), la
; probabilité via sub_CC7A, gère un cas spécial porte-avions (+0x6B==0xC) avec table de
; correspondance de 8 lignes alternatives pour les codes 9/0xA. Appelée dans tout le cluster
; IA avec des dizaines de codes différents (9,0xA,0xB,0xC,0xE,0x10,0x11...).
; ==============================================================================================
Radio_PlayMessage	proc far		; CODE XREF: AI_MissileThreatTrigger_A+12AP
					; AI_MissileThreatTrigger_A+163P ...

var_6		= byte ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 4
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_CB62
		jmp	loc_CC43
; ���������������������������������������������������������������������������

loc_CB62:				; CODE XREF: Radio_PlayMessage+18j
		cmp	[bp+arg_8], 0
		jnz	short loc_CB7F
		mov	al, [bp+arg_6]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Radio_CanPlayMessage
		add	sp, 6
		or	al, al
		jnz	short loc_CB7F
		jmp	loc_CC43
; ���������������������������������������������������������������������������

loc_CB7F:				; CODE XREF: Radio_PlayMessage+21j Radio_PlayMessage+35j
		mov	al, [bp+arg_6]
		mov	[bp+var_2], al
		cmp	[bp+var_2], 0Ah
		jz	short loc_CB91
		cmp	[bp+var_2], 9
		jnz	short loc_CBFA	; default

loc_CB91:				; CODE XREF: Radio_PlayMessage+44j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+6Bh], 0Ch
		jnz	short loc_CBFA	; default
		call	CRT_Rand
		mov	dx, ax
		cmp	[bp+var_2], 9
		jnz	short loc_CBD1
		mov	bx, dx
		and	bx, 7
		cmp	bx, 7		; switch 8 cases
		ja	short loc_CBFA	; default
		shl	bx, 1
		jmp	cs:off_CC6A[bx]	; switch jump

loc_CBB9:				; DATA XREF: seg006:off_CC6Ao
		mov	[bp+var_2], 17h	; case 0x0
		jmp	short loc_CBFA	; default
; ���������������������������������������������������������������������������

loc_CBBF:				; CODE XREF: Radio_PlayMessage+6Fj
					; DATA XREF: seg006:off_CC6Ao
		mov	[bp+var_2], 18h	; case 0x1
		jmp	short loc_CBFA	; default
; ���������������������������������������������������������������������������

loc_CBC5:				; CODE XREF: Radio_PlayMessage+6Fj
					; DATA XREF: seg006:off_CC6Ao
		mov	[bp+var_2], 19h	; case 0x2
		jmp	short loc_CBFA	; default
; ���������������������������������������������������������������������������

loc_CBCB:				; CODE XREF: Radio_PlayMessage+6Fj
					; DATA XREF: seg006:off_CC6Ao
		mov	[bp+var_2], 9	; case 0x6
		jmp	short loc_CBFA	; default
; ���������������������������������������������������������������������������

loc_CBD1:				; CODE XREF: Radio_PlayMessage+61j
		mov	bx, dx
		and	bx, 7
		cmp	bx, 7		; switch 8 cases
		ja	short loc_CBFA	; default
		shl	bx, 1
		jmp	cs:off_CC5A[bx]	; switch jump

loc_CBE2:				; DATA XREF: seg006:off_CC5Ao
		test	dx, 3Fh		; case 0x0
		jnz	short loc_CBF6	; case 0x7
		mov	[bp+var_2], 0
		jmp	short loc_CBFA	; default
; ���������������������������������������������������������������������������
		jmp	short loc_CBF6	; case 0x7
; ���������������������������������������������������������������������������

loc_CBF0:				; CODE XREF: Radio_PlayMessage+98j
					; DATA XREF: seg006:off_CC5Ao
		mov	[bp+var_2], 1Bh	; case 0x1
		jmp	short loc_CBFA	; default
; ���������������������������������������������������������������������������

loc_CBF6:				; CODE XREF: Radio_PlayMessage+98j Radio_PlayMessage+A1j ...
		mov	[bp+var_2], 1Ah	; case 0x7

loc_CBFA:				; CODE XREF: Radio_PlayMessage+4Aj Radio_PlayMessage+54j ...
		mov	ax, [bp+arg_4]	; default
		mov	[bp+var_4], ax
		mov	al, [bp+var_2]
		mov	[bp+var_6], al
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+26h], 0
		jz	short loc_CC28
		push	ax
		push	[bp+var_4]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ah
		push	word ptr [bp+arg_0+2]
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short $+2

loc_CC28:				; CODE XREF: Radio_PlayMessage+C9j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+175h]
		sar	eax, 8
		mov	es:[bx+156h], eax
		mov	al, [bp+arg_6]
		mov	es:[bx+15Ah], al

loc_CC43:				; CODE XREF: Radio_PlayMessage+1Aj Radio_PlayMessage+37j
		cmp	[bp+arg_6], 9
		jz	short loc_CC4F
		cmp	[bp+arg_6], 0Ah
		jnz	short locret_CC58

loc_CC4F:				; CODE XREF: Radio_PlayMessage+102j
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+28Bh], 10h

locret_CC58:				; CODE XREF: Radio_PlayMessage+108j
		leave
		retf
Radio_PlayMessage	endp

; ���������������������������������������������������������������������������
off_CC5A	dw offset loc_CBE2	; DATA XREF: Radio_PlayMessage+98r
		dw offset loc_CBF0	; jump table for switch	statement
		dw offset loc_CBF0
		dw offset loc_CBF0
		dw offset loc_CBF0
		dw offset loc_CBF0
		dw offset loc_CBF0
		dw offset loc_CBF6
off_CC6A	dw offset loc_CBB9	; DATA XREF: Radio_PlayMessage+6Fr
		dw offset loc_CBBF	; jump table for switch	statement
		dw offset loc_CBC5
		dw offset loc_CBC5
		dw offset loc_CBC5
		dw offset loc_CBC5
		dw offset loc_CBCB
		dw offset loc_CBCB

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,104L — gatekeeper de message radio : calcule le temps écoulé depuis le dernier message
; (+0x175-0x156), compare à des seuils par catégorie (switch 6 cas) modulés par le trait de
; bavardage du pilote (+0xB2), empêche la répétition du même message (+0x15A) : retourne si le
; message peut être joué. LUE INTEGRALEMENT (a la demande de Remi). CONFIRME ET PRECISE :
; calcule le temps ecoule (entite+0x175>>8 - entite+0x156), lit le trait de personnalite a
; +0xB2 (bavardage), cherche la categorie du message (arg_4) dans une table a 6 entrees
; (word_CD32) - si non trouvee, utilise un seuil par defaut de 16 (0x10). CAS SPECIAL
; REPETITION : si le meme code de message qu'au dernier appel (entite+0x15A) ET valeur
; effective > 3, REDUIT cette valeur de 3 (rend la repetition du meme message plus difficile a
; autoriser, PAS plus facile). SORTIES IMMEDIATES (toujours autorise) : si la valeur effective
; tombe a 0, OU si entite+0x149==2 (etat special). SINON : verifie le temps ecoule contre un
; seuil PAR PALIER (80/60/40/20 unites) determine par la valeur effective (proche de l'echelle
; 0-16 de bavardage) - plus bavard = seuil de temps plus bas = peut reparler plus souvent.
; Retourne 1 (bloque, ne peut pas jouer) ou 0 (autorise).
; ==============================================================================================
Radio_CanPlayMessage	proc far		; CODE XREF: seg004:2035P seg004:204DP ...

var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+175h]
		sar	eax, 8
		sub	eax, es:[bx+156h]
		mov	[bp+var_4], eax
		mov	[bp+var_5], 0
		mov	dl, es:[bx+0B2h]
		mov	al, [bp+arg_4]
		cbw
		mov	[bp+var_8], ax
		mov	cx, 6		; switch 6 cases
		mov	bx, offset word_CD32

loc_CCAD:				; CODE XREF: Radio_CanPlayMessage+3Ej
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_8]
		jz	short loc_CCBC
		add	bx, 2
		loop	loc_CCAD
		jmp	short loc_CCC2	; default
; ���������������������������������������������������������������������������

loc_CCBC:				; CODE XREF: Radio_CanPlayMessage+39j
		jmp	word ptr cs:[bx+0Ch] ; switch jump
; ���������������������������������������������������������������������������
		jmp	short loc_CCC4	; case 0x6
; ���������������������������������������������������������������������������

loc_CCC2:				; CODE XREF: Radio_CanPlayMessage+40j
		mov	dl, 10h		; default

loc_CCC4:				; CODE XREF: Radio_CanPlayMessage:loc_CCBCj
					; Radio_CanPlayMessage+46j
					; DATA XREF: ...
		les	bx, [bp+arg_0]	; case 0x6
		mov	al, es:[bx+15Ah]
		cmp	al, [bp+arg_4]
		jnz	short loc_CCDF
		cmp	[bp+arg_4], 0FFh
		jz	short loc_CCDF
		cmp	dl, 3
		jle	short loc_CCDF
		add	dl, 0FDh ; '�'

loc_CCDF:				; CODE XREF: Radio_CanPlayMessage+55j Radio_CanPlayMessage+5Bj ...
		mov	al, dl
		cbw
		or	ax, ax
		jz	short loc_CD2D
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+149h], 2
		jz	short loc_CD2D
		cmp	dl, 0Eh
		jle	short loc_CCF8
		jmp	short loc_CD29
; ���������������������������������������������������������������������������

loc_CCF8:				; CODE XREF: Radio_CanPlayMessage+7Aj
		cmp	dl, 4
		jge	short loc_CD06
		cmp	[bp+var_4], 50h	; 'P'
		jle	short loc_CD2D
		jmp	short loc_CD29
; ���������������������������������������������������������������������������

loc_CD06:				; CODE XREF: Radio_CanPlayMessage+81j
		cmp	dl, 8
		jge	short loc_CD14
		cmp	[bp+var_4], 3Ch	; '<'
		jle	short loc_CD2D
		jmp	short loc_CD29
; ���������������������������������������������������������������������������

loc_CD14:				; CODE XREF: Radio_CanPlayMessage+8Fj
		cmp	dl, 0Ch
		jge	short loc_CD22
		cmp	[bp+var_4], 28h	; '('
		jle	short loc_CD2D
		jmp	short loc_CD29
; ���������������������������������������������������������������������������

loc_CD22:				; CODE XREF: Radio_CanPlayMessage+9Dj
		cmp	[bp+var_4], 14h
		jle	short loc_CD2D

loc_CD29:				; CODE XREF: Radio_CanPlayMessage+7Cj Radio_CanPlayMessage+8Aj ...
		mov	[bp+var_5], 1

loc_CD2D:				; CODE XREF: Radio_CanPlayMessage+6Aj Radio_CanPlayMessage+75j ...
		mov	al, [bp+var_5]
		leave
		retf
Radio_CanPlayMessage	endp

; ���������������������������������������������������������������������������
word_CD32	dw	6,     7,     8,   10h ; DATA XREF: Radio_CanPlayMessage+30o
		dw    11h,   20h	; value	table for switch statement
		dw offset loc_CCC4	; jump table for switch	statement
		dw offset loc_CCC4
		dw offset loc_CCC4
		dw offset loc_CCC4
		dw offset loc_CCC4
		dw offset loc_CCC4

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,337L — capteur caché bit5 de +0x28C : calcule la vitesse (sub_43CDC), vérifie les
; munitions (+0x69 via +0xB), sélectionne un code de message par défaut (2) selon le contexte
; : sélecteur de message radio contextuel (état de combat/armement).
; ==============================================================================================
Radio_SelectContextMessage	proc far		; CODE XREF: seg004:068AP AI_MessageDispatcher+EFp ...

var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	[bp+var_2], 2
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Ch]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_CD6D
		jmp	loc_CFD3
; ���������������������������������������������������������������������������

loc_CD6D:				; CODE XREF: Radio_SelectContextMessage+1Ej
		or	byte ptr es:[bx+28Ch], 20h
		mov	si, 64h	; 'd'
		mov	bx, es:[bx+102h]
		mov	ax, [bx+60h]
		mov	dx, [bx+5Eh]

loc_CD81:
		mov	word ptr [bp+var_6+2], ax

loc_CD84:
		mov	word ptr [bp+var_6], dx
		push	ax
		push	dx
		call	Roster_SumAttributeA
		add	sp, 4
		or	ax, ax
		jnz	short loc_CD98
		jmp	loc_CFD3
; ���������������������������������������������������������������������������

loc_CD98:				; CODE XREF: Radio_SelectContextMessage+49j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		cmp	dword ptr [bx+69h], 0
		jz	short loc_CDAB
		mov	ax, 1
		jmp	short loc_CDAD
; ���������������������������������������������������������������������������

loc_CDAB:				; CODE XREF: Radio_SelectContextMessage+5Aj
		xor	ax, ax

loc_CDAD:				; CODE XREF: Radio_SelectContextMessage+5Fj
		or	al, al
		jnz	short loc_CDB4
		jmp	loc_CFD3
; ���������������������������������������������������������������������������

loc_CDB4:				; CODE XREF: Radio_SelectContextMessage+65j
		push	large [bp+var_6]
		call	Roster_SumAttributeB
		add	sp, 4
		or	ax, ax
		jz	short loc_CDC7
		sub	si, 64h	; 'd'

loc_CDC7:				; CODE XREF: Radio_SelectContextMessage+78j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	eax, [bx+6Dh]
		sar	eax, 8
		imul	eax, 33h
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	edx, [bx+69h]
		sar	edx, 8
		push	edx
		cdq
		pop	ebx
		idiv	ebx
		add	ax, si
		add	ax, 0FFCEh
		mov	si, ax
		mov	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+11Dh], 0A7h ; '�'
		jnz	short loc_CE67
		cmp	word ptr es:[bx+137h], 0
		jnz	short loc_CE10
		jmp	loc_CEC4
; ���������������������������������������������������������������������������

loc_CE10:				; CODE XREF: Radio_SelectContextMessage+C1j
		push	word ptr es:[bx+137h]
		mov	bx, es:[bx+137h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		les	bx, [bp+var_A]
		cmp	byte ptr es:[bx+11h], 2
		jnz	short loc_CE4B
		push	0FCh ; '�'
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CEC4
		jmp	short loc_CEC1
; ���������������������������������������������������������������������������

loc_CE4B:				; CODE XREF: Radio_SelectContextMessage+E3j
		push	0F03h
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CEC4
		jmp	short loc_CEC1
; ���������������������������������������������������������������������������

loc_CE67:				; CODE XREF: Radio_SelectContextMessage+B9j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+11Dh], 0A8h ; '�'
		jnz	short loc_CE96
		cmp	word ptr es:[bx+137h], 0
		jz	short loc_CEC1
		push	0F03h
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	ah, 0

loc_CE8E:
		or	ax, ax
		jnz	short loc_CEC4

loc_CE92:
		jmp	short loc_CEC1
; ���������������������������������������������������������������������������
		jmp	short loc_CEC1
; ���������������������������������������������������������������������������

loc_CE96:				; CODE XREF: Radio_SelectContextMessage+127j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jnz	short loc_CEC4
		mov	bx, word_706A0
		mov	al, [bx+6Eh]
		mov	ah, 0
		cmp	ax, 0A8h ; '�'
		jnz	short loc_CEC4
		mov	ax, word_706A0
		add	ax, 68h	; 'h'
		push	ax
		call	Lexer_ResolveSymbol
		pop	cx
		or	ax, ax
		jnz	short loc_CEC4

loc_CEC1:				; CODE XREF: Radio_SelectContextMessage+FFj
					; Radio_SelectContextMessage+11Bj ...
		sub	si, 32h	; '2'

loc_CEC4:				; CODE XREF: Radio_SelectContextMessage+C3j Radio_SelectContextMessage+FDj ...
		cmp	word_706A3, 0
		jnz	short loc_CECE
		jmp	loc_CFD3
; ���������������������������������������������������������������������������

loc_CECE:				; CODE XREF: Radio_SelectContextMessage+17Fj
		mov	ax, word_706A3
		cmp	ax, word_706A5
		jge	short loc_CEDA
		jmp	loc_CFD3
; ���������������������������������������������������������������������������

loc_CEDA:				; CODE XREF: Radio_SelectContextMessage+18Bj
		mov	ax, word_706A7
		cmp	ax, word_706A9
		jge	short loc_CEE6
		jmp	loc_CFD3
; ���������������������������������������������������������������������������

loc_CEE6:				; CODE XREF: Radio_SelectContextMessage+197j
		xor	dx, dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 0FFh
		jnz	short loc_CF03
		mov	di, word_706A3
		sub	di, word_706A5
		mov	ax, word_706A9
		jmp	short loc_CF1C
; ���������������������������������������������������������������������������

loc_CF03:				; CODE XREF: Radio_SelectContextMessage+1AAj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 1
		jnz	short loc_CF1F
		mov	di, word_706A7
		sub	di, word_706A9
		mov	ax, word_706A5

loc_CF1C:				; CODE XREF: Radio_SelectContextMessage+1B7j
		mov	[bp+var_C], ax

loc_CF1F:				; CODE XREF: Radio_SelectContextMessage+1C5j
		or	di, di
		jle	short loc_CF40
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 0
		jz	short loc_CF40
		mov	dx, di
		neg	dx
		shl	dx, 3
		mov	ax, [bp+var_C]
		shl	ax, 5
		sub	dx, ax

loc_CF40:				; CODE XREF: Radio_SelectContextMessage+1D7j
					; Radio_SelectContextMessage+1E5j
		add	si, dx
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 0
		jz	short loc_CF50
		sub	si, 32h	; '2'

loc_CF50:				; CODE XREF: Radio_SelectContextMessage+201j
		les	bx, [bp+arg_0]
		mov	dl, es:[bx+0B3h]
		cmp	dl, 3
		jge	short loc_CF61
		xor	bx, bx
		jmp	short loc_CF82
; ���������������������������������������������������������������������������

loc_CF61:				; CODE XREF: Radio_SelectContextMessage+211j
		cmp	dl, 6
		jge	short loc_CF6B
		mov	bx, 0Fh
		jmp	short loc_CF82
; ���������������������������������������������������������������������������

loc_CF6B:				; CODE XREF: Radio_SelectContextMessage+21Aj
		cmp	dl, 0Ch
		jge	short loc_CF75
		mov	bx, 1Eh
		jmp	short loc_CF82
; ���������������������������������������������������������������������������

loc_CF75:				; CODE XREF: Radio_SelectContextMessage+224j
		cmp	dl, 0Fh
		jge	short loc_CF7F
		mov	bx, 32h	; '2'
		jmp	short loc_CF82
; ���������������������������������������������������������������������������

loc_CF7F:				; CODE XREF: Radio_SelectContextMessage+22Ej
		mov	bx, 4Bh	; 'K'

loc_CF82:				; CODE XREF: Radio_SelectContextMessage+215j
					; Radio_SelectContextMessage+21Fj ...
		add	si, bx
		or	di, di
		jle	short loc_CF90

loc_CF88:
		cmp	si, 50h	; 'P'

loc_CF8B:
		jl	short loc_CF90
		mov	si, 4Fh	; 'O'

loc_CF90:				; CODE XREF: Radio_SelectContextMessage+23Cj
					; Radio_SelectContextMessage:loc_CF8Bj
		cmp	dl, 9
		jle	short loc_CF9D
		cmp	si, 19h
		jge	short loc_CF9D
		mov	si, 19h

loc_CF9D:				; CODE XREF: Radio_SelectContextMessage+249j
					; Radio_SelectContextMessage+24Ej
		or	dl, dl
		jg	short loc_CFA3
		xor	si, si

loc_CFA3:				; CODE XREF: Radio_SelectContextMessage+255j
		cmp	si, 19h
		jge	short loc_CFAE
		mov	[bp+var_2], 5
		jmp	short loc_CFC8
; ���������������������������������������������������������������������������

loc_CFAE:				; CODE XREF: Radio_SelectContextMessage+25Cj
		cmp	si, 32h	; '2'
		jge	short loc_CFB9
		mov	[bp+var_2], 4
		jmp	short loc_CFC8
; ���������������������������������������������������������������������������

loc_CFB9:				; CODE XREF: Radio_SelectContextMessage+267j
		cmp	si, 50h	; 'P'
		jge	short loc_CFC4
		mov	[bp+var_2], 3
		jmp	short loc_CFC8
; ���������������������������������������������������������������������������

loc_CFC4:				; CODE XREF: Radio_SelectContextMessage+272j
		mov	[bp+var_2], 2

loc_CFC8:				; CODE XREF: Radio_SelectContextMessage+262j
					; Radio_SelectContextMessage+26Dj ...
		les	bx, [bp+arg_0]
		mov	al, [bp+var_2]
		mov	es:[bx+0F5h], al

loc_CFD3:				; CODE XREF: Radio_SelectContextMessage+20j Radio_SelectContextMessage+4Bj ...
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0F5h]
		pop	di
		pop	si
		leave
		retf
Radio_SelectContextMessage	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,86L — selon l'état d'escorte (+0x27F ==1 ou 2), soit propage la cible du leader (+0x287)
; soit interroge le leader (+0x281, vtable[0x38]/[0]/[0x34]) pour valider sa disponibilité :
; requête de validité du leader pour la logique d'ailier/formation.
; ==============================================================================================
Escort_QueryLeaderValid	proc far		; CODE XREF: Goal_FollowAllyExec+10Bp

var_2		= byte ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+27Fh]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_D003
		cmp	ax, 2
		jz	short loc_D01B
		jmp	short loc_D05B
; ���������������������������������������������������������������������������

loc_D003:				; CODE XREF: Escort_QueryLeaderValid+1Bj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+287h], 0
		jz	short loc_D05B
		mov	[bp+var_2], 3
		mov	ax, es:[bx+287h]
		mov	[si], ax
		jmp	short loc_D05B
; ���������������������������������������������������������������������������

loc_D01B:				; CODE XREF: Escort_QueryLeaderValid+20j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+281h], 0
		jz	short loc_D05B
		push	word ptr es:[bx+281h]
		mov	bx, es:[bx+281h]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[si], ax
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_D051
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_D053
; ���������������������������������������������������������������������������

loc_D051:				; CODE XREF: Escort_QueryLeaderValid+64j
		mov	al, 17h

loc_D053:				; CODE XREF: Escort_QueryLeaderValid+70j
		cmp	al, 6
		jnz	short loc_D05B
		mov	[bp+var_2], 3

loc_D05B:				; CODE XREF: Escort_QueryLeaderValid+22j Escort_QueryLeaderValid+2Dj ...
		cmp	[bp+var_2], 0
		jnz	short loc_D066
		mov	ax, 1
		jmp	short loc_D068
; ���������������������������������������������������������������������������

loc_D066:				; CODE XREF: Escort_QueryLeaderValid+80j
		xor	ax, ax

loc_D068:				; CODE XREF: Escort_QueryLeaderValid+85j
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Bh], 0FDh
		shl	al, 1
		or	es:[bx+28Bh], al
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
Escort_QueryLeaderValid	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,944L — la plus grosse fonction documentée jusqu'ici. Vérifie flag combat (+0x28B bit3),
; récupère vitesse de la cible/leader (+0x145, vtable+0x3C+0xC) et vitesse propre : candidat
; très fort pour la solution de guidage de formation/rejointe (followAlly), appelée par
; sub_DAA9 — à disséquer en détail dans une session dédiée.
; ==============================================================================================
Formation_GuidanceSolution	proc far		; CODE XREF: Goal_FollowAllyExec+1B2p

var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
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
var_23		= byte ptr -23h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_19		= byte ptr -19h
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp

loc_D082:
		mov	bp, sp
		sub	sp, 0C4h
		push	si
		les	bx, [bp+arg_0]

loc_D08C:
		mov	al, es:[bx+28Bh]
		shr	ax, 3

loc_D094:
		and	ax, 1
		mov	[bp+var_1], al
		push	word ptr es:[bx+145h]
		mov	bx, es:[bx+145h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_58], eax
		mov	eax, [si+4]
		mov	[bp+var_54], eax
		mov	eax, [si+8]
		mov	[bp+var_50], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_64], eax
		mov	eax, [si+4]
		mov	[bp+var_60], eax
		mov	eax, [si+8]
		mov	[bp+var_5C], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+145h]
		mov	si, [bx+51h]
		add	si, 8
		mov	eax, [si]
		mov	[bp+var_88], eax
		mov	eax, [si+4]
		mov	[bp+var_84], eax
		mov	eax, [si+8]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_88]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_84]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_84], eax
		mov	eax, [bp+var_80]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_80], eax
		lea	ax, [bp+var_88]
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		lea	ax, [bp+var_70]
		push	ax
		push	large [bp+arg_0]
		call	Goal_FollowAllyFormation
		add	sp, 6
		push	large [bp+var_68]
		push	large [bp+var_6C]
		push	large [bp+var_70]
		call	Math_VectorLength3D_Raw_5828E
		push	dx

loc_D193:
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+145h]
		add	si, 12h
		mov	eax, [bp+var_70]
		add	eax, [si]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_6C]
		add	eax, [si+4]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_68]
		add	eax, [si+8]
		mov	[bp+var_74], eax
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [si]
		sub	[bp+var_7C], eax
		mov	eax, [si+4]
		sub	[bp+var_78], eax
		mov	eax, [si+8]
		sub	[bp+var_74], eax
		push	large [bp+var_74]
		push	large [bp+var_78]
		push	large [bp+var_7C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_18], eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_C]
		shl	eax, 2
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	eax, [bp+var_14]
		cmp	eax, [bp+var_22]
		jle	short loc_D22D
		mov	ax, 1
		jmp	short loc_D22F
; ���������������������������������������������������������������������������

loc_D22D:				; CODE XREF: Formation_GuidanceSolution+1A5j
		xor	ax, ax

loc_D22F:				; CODE XREF: Formation_GuidanceSolution+1AAj
		mov	[bp+var_19], al
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	eax, [bp+var_28]
		or	eax, eax
		jge	short loc_D253
		neg	eax

loc_D253:				; CODE XREF: Formation_GuidanceSolution+1CDj
		mov	[bp+var_28], eax
		cmp	[bp+var_28], 0A000h
		jle	short loc_D266
		mov	ax, 1
		jmp	short loc_D268
; ���������������������������������������������������������������������������

loc_D266:				; CODE XREF: Formation_GuidanceSolution+1DEj
		xor	ax, ax

loc_D268:				; CODE XREF: Formation_GuidanceSolution+1E3j
		mov	[bp+var_23], al
		cmp	[bp+var_19], 0
		jz	short loc_D277
		mov	[bp+var_1], 0
		jmp	short loc_D2B5
; ���������������������������������������������������������������������������

loc_D277:				; CODE XREF: Formation_GuidanceSolution+1EEj
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D2B5
		lea	ax, [bp+var_64]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	eax, [bp+var_2C]
		or	eax, eax
		jge	short loc_D2A1
		neg	eax

loc_D2A1:				; CODE XREF: Formation_GuidanceSolution+21Bj
		mov	[bp+var_2C], eax
		mov	ax, word ptr [bp+var_2C+1]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0Fh
		jge	short loc_D2B5
		mov	[bp+var_1], 1

loc_D2B5:				; CODE XREF: Formation_GuidanceSolution+1F4j
					; Formation_GuidanceSolution+1FDj ...
		cmp	[bp+var_1], 0
		jnz	short loc_D2BE
		jmp	loc_DAA3
; ���������������������������������������������������������������������������

loc_D2BE:				; CODE XREF: Formation_GuidanceSolution+238j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 3
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_D2DE
		cmp	dword ptr es:[bx+16Ah],	0
		jz	short loc_D2DE
		jmp	loc_D409
; ���������������������������������������������������������������������������

loc_D2DE:				; CODE XREF: Formation_GuidanceSolution+24Fj
					; Formation_GuidanceSolution+258j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+16Ah],	0
		jnz	short loc_D312
		push	seg seg006
		push	offset AllocateIfNull_12Bytes_DCEE
		push	5
		push	large 40h ; '@'
		push	large 0C0000h
		push	0
		call	CRT_Doscan_Core
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+16Ch], dx
		mov	es:[bx+16Ah], ax

loc_D312:				; CODE XREF: Formation_GuidanceSolution+267j
		xor	si, si
		jmp	loc_D3ED
; ���������������������������������������������������������������������������

loc_D317:				; CODE XREF: Formation_GuidanceSolution+371j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	ax, si
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_64]
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	ax, si
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_60]
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	ax, si
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_5C]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	bx, ax
		mov	eax, [bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	dx, si

loc_D380:
		add	dx, 20h	; ' '

loc_D383:
		imul	dx, 0Ch

loc_D386:
		add	bx, dx

loc_D388:
		mov	es:[bx], eax
		les	bx, [bp+arg_0]

loc_D38F:
		push	word ptr es:[bx+102h]

loc_D394:
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	dx, si
		add	dx, 20h	; ' '
		imul	dx, 0Ch
		add	bx, dx
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	dx, si
		add	dx, 20h	; ' '
		imul	dx, 0Ch
		add	bx, dx
		mov	es:[bx+8], eax
		inc	si

loc_D3ED:				; CODE XREF: Formation_GuidanceSolution+293j
		cmp	si, 20h	; ' '
		jge	short loc_D3F5
		jmp	loc_D317
; ���������������������������������������������������������������������������

loc_D3F5:				; CODE XREF: Formation_GuidanceSolution+36Fj
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+172h], ax
		movsx	eax, ax
		mov	es:[bx+16Eh], eax

loc_D409:				; CODE XREF: Formation_GuidanceSolution+25Aj
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_14]
		jge	short loc_D418
		mov	ax, 1
		jmp	short loc_D41A
; ���������������������������������������������������������������������������

loc_D418:				; CODE XREF: Formation_GuidanceSolution+390j
		xor	ax, ax

loc_D41A:				; CODE XREF: Formation_GuidanceSolution+395j
		or	al, al
		jz	short loc_D497
		mov	eax, [bp+var_14]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_8]
		sub	[bp+var_30], eax
		cmp	[bp+var_14], 2EE00h
		jle	short loc_D43D
		mov	ax, 1
		jmp	short loc_D43F
; ���������������������������������������������������������������������������

loc_D43D:				; CODE XREF: Formation_GuidanceSolution+3B5j
		xor	ax, ax

loc_D43F:				; CODE XREF: Formation_GuidanceSolution+3BAj
		or	al, al
		jz	short loc_D453
		cmp	[bp+var_23], 0
		jz	short loc_D453
		mov	[bp+var_34], 3200h
		jmp	short loc_D45B
; ���������������������������������������������������������������������������

loc_D453:				; CODE XREF: Formation_GuidanceSolution+3C0j
					; Formation_GuidanceSolution+3C6j
		mov	[bp+var_34], 1400h

loc_D45B:				; CODE XREF: Formation_GuidanceSolution+3D0j
		mov	eax, [bp+var_34]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_30]
		cmp	eax, [bp+var_34]
		jle	short loc_D47F
		mov	ax, 1
		jmp	short loc_D481
; ���������������������������������������������������������������������������

loc_D47F:				; CODE XREF: Formation_GuidanceSolution+3F7j
		xor	ax, ax

loc_D481:				; CODE XREF: Formation_GuidanceSolution+3FCj
		or	al, al
		jz	short loc_D48D
		mov	eax, [bp+var_34]
		mov	[bp+var_30], eax

loc_D48D:				; CODE XREF: Formation_GuidanceSolution+402j
		mov	eax, [bp+var_30]
		add	[bp+var_8], eax
		jmp	short loc_D49F
; ���������������������������������������������������������������������������

loc_D497:				; CODE XREF: Formation_GuidanceSolution+39Bj
		mov	eax, [bp+var_14]
		mov	[bp+var_8], eax

loc_D49F:				; CODE XREF: Formation_GuidanceSolution+414j
		lea	ax, [bp+var_B8]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+145h]
		push	large dword ptr	[bx+55h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+145h]
		les	bx, [bx+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	word ptr [bp+var_30+2],	dx
		mov	word ptr [bp+var_30], ax
		mov	[bp+var_34], 0
		cmp	[bp+var_30], 0
		jz	short loc_D523
		mov	ax, word ptr [bp+var_30+2]
		mov	dx, word ptr [bp+var_30]
		add	dx, 1Fh
		mov	word ptr [bp+var_38+2],	ax
		mov	word ptr [bp+var_38], dx
		les	bx, [bp+var_38]
		mov	eax, es:[bx]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		or	eax, eax
		jge	short loc_D50D
		neg	eax

loc_D50D:				; CODE XREF: Formation_GuidanceSolution+487j
		mov	[bp+var_34], eax
		les	bx, [bp+var_30]
		mov	al, es:[bx+1Eh]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Eh], al

loc_D523:				; CODE XREF: Formation_GuidanceSolution+45Cj
		mov	eax, [bp+var_8]
		mov	[bp+var_40], eax
		cmp	[bp+var_23], 0
		jz	short loc_D543
		mov	[bp+var_44], 4Ch ; 'L'
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_44]
		jmp	short loc_D553
; ���������������������������������������������������������������������������

loc_D543:				; CODE XREF: Formation_GuidanceSolution+4AEj
		mov	[bp+var_48], 19h
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_48]

loc_D553:				; CODE XREF: Formation_GuidanceSolution+4C0j
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		sub	[bp+var_8], eax
		jmp	loc_D7BB
; ���������������������������������������������������������������������������

loc_D56A:				; CODE XREF: Formation_GuidanceSolution+746j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+172h]
		imul	ax, 0Ch
		add	bx, ax

loc_D580:
		mov	eax, [bp+var_58]
		pop	es
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es

loc_D592:
		mov	es, word ptr [bp+arg_0+2]
		mov	ax, es:[si+172h]
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_54]
		pop	es
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es
		mov	es, word ptr [bp+arg_0+2]
		mov	ax, es:[si+172h]
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_50]
		pop	es
		mov	es:[bx+8], eax
		cmp	[bp+var_34], 200h
		jle	short loc_D5D8
		mov	ax, 1
		jmp	short loc_D5DA
; ���������������������������������������������������������������������������

loc_D5D8:				; CODE XREF: Formation_GuidanceSolution+550j
		xor	ax, ax

loc_D5DA:				; CODE XREF: Formation_GuidanceSolution+555j
		or	al, al
		jnz	short loc_D5E1
		jmp	loc_D6FB
; ���������������������������������������������������������������������������

loc_D5E1:				; CODE XREF: Formation_GuidanceSolution+55Bj
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+145h]
		mov	bx, es:[bx+145h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_C4], eax
		mov	eax, [si+4]
		mov	[bp+var_C0], eax
		mov	eax, [si+8]
		mov	[bp+var_BC], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+172h]
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		pop	es
		mov	eax, es:[bx]
		add	eax, [bp+var_C4]
		sar	eax, 1
		mov	[bp+var_4C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es
		mov	es, word ptr [bp+arg_0+2]
		mov	ax, es:[si+172h]
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_4C]
		pop	es
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es
		mov	es, word ptr [bp+arg_0+2]
		mov	ax, es:[si+172h]
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		pop	es
		mov	eax, es:[bx+4]
		add	eax, [bp+var_C0]
		sar	eax, 1

loc_D683:
		mov	[bp+var_4C], eax

loc_D687:
		les	bx, [bp+arg_0]

loc_D68A:
		les	bx, es:[bx+16Ah]
		push	es
		mov	es, word ptr [bp+arg_0+2]

loc_D693:
		mov	ax, es:[si+172h]
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_4C]
		pop	es
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es
		mov	es, word ptr [bp+arg_0+2]
		mov	ax, es:[si+172h]
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		pop	es
		mov	eax, es:[bx+8]
		add	eax, [bp+var_BC]
		sar	eax, 1
		mov	[bp+var_4C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es
		mov	es, word ptr [bp+arg_0+2]
		mov	ax, es:[si+172h]
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_4C]
		pop	es
		mov	es:[bx+8], eax
		jmp	loc_D7A3
; ���������������������������������������������������������������������������

loc_D6FB:				; CODE XREF: Formation_GuidanceSolution+55Dj
		mov	eax, [bp+var_64]
		mov	[bp+var_C4], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_C0], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_BC], eax
		push	1
		lea	ax, [bp+var_C4]
		push	ax
		call	Vec_NegateSwapPair
		add	sp, 4
		mov	[bp+var_BC], 0
		lea	ax, [bp+var_C4]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+172h]
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_C4]
		pop	es
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es
		mov	es, word ptr [bp+arg_0+2]
		mov	ax, es:[si+172h]
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_C0]
		pop	es
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		push	es
		mov	es, word ptr [bp+arg_0+2]
		mov	ax, es:[si+172h]
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		pop	es
		mov	dword ptr es:[bx+8], 0

loc_D7A3:				; CODE XREF: Formation_GuidanceSolution+677j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+172h]
		inc	ax
		and	ax, 1Fh
		mov	es:[bx+172h], ax
		sub	dword ptr es:[bx+16Eh],	20h ; ' '

loc_D7BB:				; CODE XREF: Formation_GuidanceSolution+4E6j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+16Eh],	20h ; ' '
		jl	short loc_D7CA
		jmp	loc_D56A
; ���������������������������������������������������������������������������

loc_D7CA:				; CODE XREF: Formation_GuidanceSolution+744j
		mov	eax, dword_70458
		add	es:[bx+16Eh], eax
		les	bx, es:[bx+16Ah]
		mov	eax, es:[bx]
		mov	[bp+var_94], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_90], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_8C], eax
		mov	eax, es:[bx+180h]
		mov	[bp+var_B8], eax
		mov	eax, es:[bx+184h]
		mov	[bp+var_B4], eax
		mov	eax, es:[bx+188h]
		mov	[bp+var_B0], eax
		mov	cx, 1
		jmp	loc_D8BB
; ���������������������������������������������������������������������������

loc_D81D:				; CODE XREF: Formation_GuidanceSolution+83Fj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	ax, cx
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx]
		add	[bp+var_94], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	ax, cx
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+4]
		add	[bp+var_90], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	ax, cx
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+8]
		add	[bp+var_8C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	ax, cx
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx]
		add	[bp+var_B8], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	ax, cx
		add	ax, 20h	; ' '
		imul	ax, 0Ch

loc_D892:
		add	bx, ax
		mov	eax, es:[bx+4]
		add	[bp+var_B4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16Ah]
		mov	ax, cx
		add	ax, 20h	; ' '
		imul	ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+8]
		add	[bp+var_B0], eax
		inc	cx

loc_D8BB:				; CODE XREF: Formation_GuidanceSolution+799j
		cmp	cx, 20h	; ' '
		jge	short loc_D8C3
		jmp	loc_D81D
; ���������������������������������������������������������������������������

loc_D8C3:				; CODE XREF: Formation_GuidanceSolution+83Dj
		mov	eax, [bp+var_94]
		sar	eax, 5
		mov	[bp+var_94], eax
		mov	eax, [bp+var_90]
		sar	eax, 5
		mov	[bp+var_90], eax
		mov	eax, [bp+var_8C]
		sar	eax, 5
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_B8]
		sar	eax, 5
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_B4]
		sar	eax, 5
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B0]
		sar	eax, 5
		mov	[bp+var_B0], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+145h]
		mov	bx, es:[bx+145h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_AC], eax
		mov	eax, [si+4]
		mov	[bp+var_A8], eax
		mov	eax, [si+8]
		mov	[bp+var_A4], eax
		lea	ax, [bp+var_B8]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		mov	eax, [bp+var_94]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_94], eax
		mov	eax, [bp+var_90]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_90], eax
		mov	eax, [bp+var_8C]

loc_D985:
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_94]
		sub	[bp+var_7C], eax
		mov	eax, [bp+var_90]
		sub	[bp+var_78], eax
		mov	eax, [bp+var_8C]
		sub	[bp+var_74], eax
		lea	ax, [bp+var_7C]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp+var_7C]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_74]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_7C]
		add	[bp+var_94], eax
		mov	eax, [bp+var_78]
		add	[bp+var_90], eax
		mov	eax, [bp+var_74]
		add	[bp+var_8C], eax
		mov	eax, [bp+var_94]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_94], eax
		mov	eax, [bp+var_90]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_90], eax
		mov	eax, [bp+var_8C]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8C], eax
		lea	ax, [bp+var_B8]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		lea	ax, [bp+var_94]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]

loc_DA83:
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 4
		push	3748h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+60h]
		add	sp, 4

loc_DAA3:				; CODE XREF: Formation_GuidanceSolution+23Aj
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Formation_GuidanceSolution	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,260L — orchestrateur GOAL followAlly : valide le leader (vtable/+0x59 statut), met à
; jour l'escorte (+0x145 via sub_3A44E), vérifie l'état GOAL 0xAA, appelle sub_CFDF (validité
; leader) et sub_D081 (guidage) : exécuteur complet du GOAL 'suivre/former avec un allié'.
; ==============================================================================================
Goal_FollowAllyExec	proc far		; CODE XREF: seg003:0E67P seg004:2132P ...

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jnz	short loc_DAD4
		mov	bx, es:[bx+102h]
		mov	al, [bx+59h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DAD9

loc_DAD4:				; CODE XREF: Goal_FollowAllyExec+1Bj
		mov	ax, 1
		jmp	short loc_DADB
; ���������������������������������������������������������������������������

loc_DAD9:				; CODE XREF: Goal_FollowAllyExec+29j
		xor	ax, ax

loc_DADB:				; CODE XREF: Goal_FollowAllyExec+2Ej
		mov	[bp+var_2], al
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+145h], 0
		jnz	short loc_DAEC
		jmp	loc_DC64
; ���������������������������������������������������������������������������

loc_DAEC:				; CODE XREF: Goal_FollowAllyExec+3Ej
		mov	bx, es:[bx+145h]
		push	word ptr [bx+51h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+145h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	si, ax
		mov	al, [si+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_DB28
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 145h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_DB28:				; CODE XREF: Goal_FollowAllyExec+69j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+145h], 0
		jnz	short loc_DB36
		jmp	loc_DC64
; ���������������������������������������������������������������������������

loc_DB36:				; CODE XREF: Goal_FollowAllyExec+88j
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jz	short loc_DB42
		jmp	loc_DC64
; ���������������������������������������������������������������������������

loc_DB42:				; CODE XREF: Goal_FollowAllyExec+94j
		cmp	[bp+var_2], 0
		jnz	short loc_DB4B
		jmp	loc_DC64
; ���������������������������������������������������������������������������

loc_DB4B:				; CODE XREF: Goal_FollowAllyExec+9Dj
		cmp	byte ptr es:[bx+149h], 0
		jz	short loc_DB56
		jmp	loc_DC64
; ���������������������������������������������������������������������������

loc_DB56:				; CODE XREF: Goal_FollowAllyExec+A8j
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_DB6C
		jmp	loc_DC64
; ���������������������������������������������������������������������������

loc_DB6C:				; CODE XREF: Goal_FollowAllyExec+BEj
		mov	bx, [si]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_DB7A
		jmp	loc_DC64
; ���������������������������������������������������������������������������

loc_DB7A:				; CODE XREF: Goal_FollowAllyExec+CCj
		mov	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 0
		jz	short loc_DB88
		jmp	loc_DC64
; ���������������������������������������������������������������������������

loc_DB88:				; CODE XREF: Goal_FollowAllyExec+DAj
		mov	bx, es:[bx+145h]
		mov	ax, [bx+57h]
		mov	dx, [bx+55h]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		les	bx, [bp+var_6]
		cmp	byte ptr es:[bx+6], 1
		jz	short loc_DBA6
		jmp	loc_DC4B
; ���������������������������������������������������������������������������

loc_DBA6:				; CODE XREF: Goal_FollowAllyExec+F8j
		mov	[bp+var_8], 0
		lea	ax, [bp+var_8]
		push	ax
		push	word ptr [bp+var_6+2]
		push	dx
		push	cs
		call	near ptr Escort_QueryLeaderValid
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+149h], al
		mov	al, es:[bx+149h]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_DBD6
		cmp	ax, 3
		jz	short loc_DBE4
		jmp	loc_DC56
; ���������������������������������������������������������������������������

loc_DBD6:				; CODE XREF: Goal_FollowAllyExec+123j
		push	large [bp+arg_0]
		push	cs
		call	near ptr Goal_TransferToWingman
		add	sp, 4
		jmp	loc_DC64
; ���������������������������������������������������������������������������

loc_DBE4:				; CODE XREF: Goal_FollowAllyExec+128j
		mov	ax, [bp+var_8]
		mov	[bp+var_A], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 137h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, [bp+var_8]
		mov	[bp+var_C], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 285h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, [bp+var_8]
		mov	[bp+var_E], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+160h], 0
		mov	eax, es:[bx+175h]
		sar	eax, 8
		mov	es:[bx+162h], eax
		jmp	short loc_DC64
; ���������������������������������������������������������������������������

loc_DC4B:				; CODE XREF: Goal_FollowAllyExec+FAj
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+149h], 0
		jnz	short loc_DC64

loc_DC56:				; CODE XREF: Goal_FollowAllyExec+12Aj
		push	large [bp+arg_0]
		push	cs
		call	near ptr Formation_GuidanceSolution
		add	sp, 4
		mov	[bp+var_1], al

loc_DC64:				; CODE XREF: Goal_FollowAllyExec+40j Goal_FollowAllyExec+8Aj ...
		cmp	[bp+var_1], 0
		jz	short loc_DC81
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jnz	short loc_DC81
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Goal_FollowWaypoints
		add	sp, 4

loc_DC81:				; CODE XREF: Goal_FollowAllyExec+1BFj
					; Goal_FollowAllyExec+1CAj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_DCC0
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DCC0
		cmp	dword ptr es:[bx+16Ah],	0
		jz	short loc_DCB3
		push	large dword ptr	es:[bx+16Ah]
		call	CRT_Free_NearOrFar
		add	sp, 4

loc_DCB3:				; CODE XREF: Goal_FollowAllyExec+1FAj
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+16Ah],	0

loc_DCC0:				; CODE XREF: Goal_FollowAllyExec+1E8j
					; Goal_FollowAllyExec+1F1j
		mov	al, [bp+var_1]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Bh], 0F7h
		shl	al, 3
		or	es:[bx+28Bh], al
		cmp	[bp+var_2], 0
		jz	short loc_DCE8
		mov	bx, es:[bx+102h]
		mov	al, [bp+var_1]
		mov	[bx+59h], al

loc_DCE8:				; CODE XREF: Goal_FollowAllyExec+232j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Goal_FollowAllyExec	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 26 lignes - JAMAIS DOCUMENTEE AVANT. Utilitaire generique 'allocate-if-null' : si le
; pointeur passe en argument est NULL, alloue 12 octets (sub_694) et retourne ce nouveau
; pointeur ; sinon retourne simplement le pointeur deja fourni tel quel. Referencee comme
; donnee depuis Formation_GuidanceSolution_D081 (+0x26C, probablement stockee dans une table
; de pointeurs de fonction plutot qu'appelee directement). Motif classique de type 'placement
; new' pour un petit objet de 12 octets.
; ==============================================================================================
AllocateIfNull_12Bytes_DCEE:				; DATA XREF: Formation_GuidanceSolution+26Co
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+6], 0
		jnz	short loc_DD0D
		push	large 0Ch
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+8],	dx
		mov	[bp+6],	ax
		or	ax, dx
		jz	short loc_DD19

loc_DD0D:				; CODE XREF: seg006:23A6j
		mov	ax, [bp+6]
		add	ax, 4
		mov	ax, [bp+6]
		add	ax, 8

loc_DD19:				; CODE XREF: seg006:23BBj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	bp

locret_DD20:
		retf
seg006		ends
