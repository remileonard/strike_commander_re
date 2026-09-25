seg005		segment	byte public 'CODE' use16
		assume cs:seg005
		;org 7
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, 405 lignes (methode de vtable, DEUX points d'entree : loc_A307 via seg339:off_6D1D0, ET
; loc_A30A/+3octets via seg216:00E6 - la table de dispatch de messages partagee). ENTIEREMENT
; TRACEE. C'est LE VERITABLE IMPLEMENTEUR de la famille d'opcodes OP_SET_OBJ_*
; (161-191/0xA1-0xBF), celui vers lequel MissionScript_CallNativeHandler_52513 delegue
; effectivement (confirme par la meme structure de switch 31 cas sur la meme plage).
; Parametres : entite (bp+6), operande principal 'si' (bp+0xA, le CODE OBJECTIF a fixer),
; cible (bp+0xC), pointeur vers donnees etendues 'di' (bp+0xE), buffer (bp+0x10). GATE INITIAL
; : si le bit 5 de entite+0x28B (mode formation/escorte) est pose, COURT-CIRCUITE tout le
; switch et saute directement a la queue commune (loc_A641) - un objectif ne peut pas etre
; change tant que l'entite est sous controle de formation. 13 GESTIONNAIRES DISTINCTS COUVRANT
; LES 31 CODES (jump table off_A695) : 0xA1 TAKE_OFF (loc_A3FA) : goal_state=code, rien
; d'autre. 0xA2 LAND (loc_A459) : ecrit +0x11F/+0x123/+0x127 PUIS +0x12B/+0x12F/+0x133 (deux
; vecteurs 3D consecutifs, source=operande di puis di). 0xA4/0xA5 (non nommes cote
; libRealSpace, loc_A405, partagent le meme gestionnaire) : ecrit +0x12B/+0x12F/+0x133
; (source=buffer bp+0x10) PUIS +0x11F/+0x123/+0x127 (source=di) - ORDRE INVERSE de 0xA2. 0xA7
; DESTROY_TARGET (loc_A4CA) : SetReference sur +0x137 (confirme le champ deja connu via
; Goal_IsComplete). 0xA8 DEFEND_TARGET (loc_A38D) : SetReference sur +0x10F PUIS +0x137
; (continuation partagee loc_A5D5). 0xA9 DEFEND_AREA et 0xBF DEACTIVATE_OBJ (loc_A3BE, MEME
; gestionnaire) : efface la reference +0x10F (NULL), copie un vecteur 3D (source=di) dans
; +0x111/+0x115/+0x119 (champ 'centre de zone', DIFFERENT de +0x14A/+0x14E/+0x152 utilise par
; FOLLOW_ALLY). 0xAA FOLLOW_ALLY (loc_A341, deja documente separement) : SetReference sur
; +0x145, +0x149=0, copie position (source=di) dans +0x14A/+0x14E/+0x152 (continuation
; partagee loc_A368). 0xAB SET_MESSAGE (loc_A4AF) : appelle DIRECTEMENT Radio_PlayMessage_CB45
; avec l'operande comme identifiant de message. 0xAC (non nomme, loc_A4EE) : ecrit
; +0x11F/+0x123/+0x127 ET +0x111/+0x115/+0x119 (deux vecteurs), efface +0x10F, PUIS ECRIT
; DYNAMIQUEMENT +0x139 ET +0x141 depuis l'operande buffer (bp+0x10, rescale >>8) - CONFIRME
; que +0x139 (seuil de proximite radio, AI_ProximityRadioCalloutTrigger_A002) et +0x141
; (troisieme constante mysterieuse du constructeur d'entite) sont des PARAMETRES DE DETECTION
; CONFIGURABLES PAR OPCODE, pas de simples constantes fixes - probable 'SET
; DETECTION/AWARENESS RANGE'. 0xB1 (non nomme, loc_A588) : ecrit +0x13D (source=di+8) - MEME
; champ que 0xAC via une continuation partagee (loc_A598) - donc +0x13D peut AUSSI etre
; configure independamment par ce code. 0xB2 (non nomme, loc_A5E3) : ecrit +0x141
; (source=di+4) - encore une voie d'ecriture pour ce champ. 0xB3 (non nomme, loc_A5A4) :
; SetReference sur +0x145 (MEME champ que FOLLOW_ALLY !), efface +0x149 - variante
; d'assignation de cible d'escorte sans changer goal_state. 0xB5 (non nomme, loc_A5C8) :
; SetReference sur +0x147 (le champ 'cible == joueur ?' de Goal_ActiveWingmanEngagement_878F),
; via la MEME continuation que 0xA8 (loc_A5D5). DEFAUT (loc_A5FE, pour tous les codes non
; geres explicitement - 0xA3,0xA6,0xAD-0xB0,0xB6-0xBE) : efface +0x10F, copie la position
; PROPRE de l'objet lie (entite+0x102+0x12) dans +0x111/+0x115/+0x119 (position de repli sur
; soi-meme), FORCE goal_state=0xBF (DEACTIVATE_OBJ) - un vrai comportement de
; secours/desactivation pour tout code non reconnu. QUEUE COMMUNE (loc_A641, apres N'IMPORTE
; QUEL cas) : (1) si goal_state==0xAA OU bit3 de +0x28B pose, appelle IMMEDIATEMENT
; Goal_FollowAllyExec_DAA9 (meme fonction que le court-circuit de AIEntity_MasterTick_5ACC !)
; - l'objectif FOLLOW_ALLY prend effet sans attendre le prochain tick. (2) SAUF SI bit5 de
; +0x28B est deja pose (deja verifie une fois en formation), appelle Goal_IsComplete_A6D3
; IMMEDIATEMENT sur le nouvel etat pour verifier s'il est deja trivialement rempli, et
; retourne ce booleen comme resultat de la fonction entiere. Anciennement compris seulement
; partiellement (case 0xAA lue isolement lors de l'investigation des commandes radio) -
; desormais documente dans son integralite comme UNE SEULE fonction coherente plutot que des
; labels loc_ fragmentes et non catalogues.
; ==============================================================================================
Goal_SetObjective_A307:				; DATA XREF: seg339:off_6D1D0o
		push	bp
		mov	bp, sp

loc_A30A:				; DATA XREF: seg216:00E6o
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Eh]
		les	bx, [bp+6]
		mov	al, es:[bx+28Bh]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_A32C
		jmp	loc_A641
; ���������������������������������������������������������������������������

loc_A32C:				; CODE XREF: seg005:0027j
		mov	bx, si
		sub	bx, 0A1h	; switch 31 cases
		cmp	bx, 1Eh
		jbe	short loc_A33A
		jmp	loc_A5FE	; default
; ���������������������������������������������������������������������������

loc_A33A:				; CODE XREF: seg005:0035j
		shl	bx, 1
		jmp	cs:off_A695[bx]	; switch jump

loc_A341:				; DATA XREF: seg005:off_A695o
		mov	ax, [bp+0Ch]	; case 0xAA
		mov	[bp-2],	ax
		push	ax
		mov	ax, [bp+6]
		add	ax, 145h
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+6]
		mov	es:[bx+11Dh], si
		mov	byte ptr es:[bx+149h], 0

loc_A368:				; CODE XREF: seg005:loc_A585j
		mov	si, di
		mov	eax, [si]
		les	bx, [bp+6]
		mov	es:[bx+14Ah], eax
		mov	eax, [si+4]
		mov	es:[bx+14Eh], eax
		mov	eax, [si+8]
		mov	es:[bx+152h], eax
		jmp	loc_A641
; ���������������������������������������������������������������������������

loc_A38D:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		les	bx, [bp+6]	; case 0xA8
		mov	es:[bx+11Dh], si
		mov	ax, [bp+0Ch]
		mov	[bp-4],	ax
		push	ax
		mov	ax, [bp+6]
		add	ax, 10Fh
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		push	ax
		mov	ax, [bp+6]
		add	ax, 137h
		jmp	loc_A5D5
; ���������������������������������������������������������������������������

loc_A3BE:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		push	0		; case 0xA9

loc_A3C0:
		mov	ax, [bp+6]
		add	ax, 10Fh
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6

loc_A3D2:
		mov	eax, [di]
		les	bx, [bp+6]
		mov	es:[bx+111h], eax
		mov	eax, [di+4]
		mov	es:[bx+115h], eax
		mov	eax, [di+8]
		mov	es:[bx+119h], eax
		mov	es:[bx+11Dh], si
		jmp	loc_A641
; ���������������������������������������������������������������������������

loc_A3FA:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		les	bx, [bp+6]	; case 0xA1
		mov	es:[bx+11Dh], si
		jmp	loc_A641
; ���������������������������������������������������������������������������

loc_A405:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		mov	dx, [bp+10h]	; case 0xA4
		mov	bx, dx
		mov	eax, [bx]
		les	bx, [bp+6]
		mov	es:[bx+12Bh], eax
		mov	bx, dx
		mov	eax, [bx+4]
		mov	bx, [bp+6]
		mov	es:[bx+12Fh], eax
		mov	bx, dx
		mov	eax, [bx+8]
		mov	bx, [bp+6]
		mov	es:[bx+133h], eax
		mov	eax, [di]
		mov	es:[bx+11Fh], eax
		mov	eax, [di+4]
		mov	es:[bx+123h], eax
		mov	eax, [di+8]
		mov	es:[bx+127h], eax
		mov	es:[bx+11Dh], si
		jmp	loc_A641
; ���������������������������������������������������������������������������

loc_A459:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		mov	dx, [bp+10h]	; case 0xA2
		mov	bx, dx
		mov	eax, [bx]
		les	bx, [bp+6]
		mov	es:[bx+11Fh], eax
		mov	bx, dx
		mov	eax, [bx+4]
		mov	bx, [bp+6]
		mov	es:[bx+123h], eax
		mov	bx, dx
		mov	eax, [bx+8]
		mov	bx, [bp+6]
		mov	es:[bx+127h], eax
		mov	es:[bx+11Dh], si
		mov	si, di
		mov	eax, [si]
		mov	es:[bx+12Bh], eax
		mov	eax, [si+4]
		mov	es:[bx+12Fh], eax
		mov	eax, [si+8]
		mov	es:[bx+133h], eax
		jmp	loc_A641
; ���������������������������������������������������������������������������

loc_A4AF:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		mov	al, [bp+10h]	; case 0xAB
		mov	[bp-1Eh], al
		push	1
		push	ax
		push	word ptr [bp+0Ch]
		push	large dword ptr	[bp+6]
		call	Radio_PlayMessage

loc_A4C4:
		add	sp, 0Ah

loc_A4C7:
		jmp	loc_A641
; ���������������������������������������������������������������������������

loc_A4CA:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		mov	ax, [bp+0Ch]	; case 0xA7

loc_A4CD:
		mov	[bp-8],	ax
		push	ax

loc_A4D1:
		mov	ax, [bp+6]
		add	ax, 137h
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+6]
		mov	es:[bx+11Dh], si
		jmp	loc_A641
; ���������������������������������������������������������������������������

loc_A4EE:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		les	bx, [bp+6]	; case 0xAC
		mov	es:[bx+11Dh], si
		mov	si, di
		mov	eax, [si]
		mov	es:[bx+11Fh], eax
		mov	eax, [si+4]
		mov	es:[bx+123h], eax
		mov	eax, [si+8]
		mov	es:[bx+127h], eax
		mov	si, di
		mov	eax, [si]
		mov	es:[bx+111h], eax
		mov	eax, [si+4]
		mov	es:[bx+115h], eax
		mov	eax, [si+8]
		mov	es:[bx+119h], eax
		push	0
		mov	ax, [bp+6]
		add	ax, 10Fh
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		mov	bx, [bp+10h]
		mov	eax, [bx]
		sar	eax, 8
		les	bx, [bp+6]
		mov	es:[bx+139h], eax
		mov	si, [bp+10h]
		add	si, 4
		mov	eax, [si]
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	es:[bx+141h], eax
		mov	si, [bp+10h]
		add	si, 8
		mov	eax, [si]
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		jmp	short loc_A598
; ���������������������������������������������������������������������������

loc_A585:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		jmp	loc_A368	; case 0xB4
; ���������������������������������������������������������������������������

loc_A588:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		mov	si, di		; case 0xB1
		add	si, 8
		mov	eax, [si]
		mov	[bp-14h], eax
		mov	eax, [bp-14h]

loc_A598:				; CODE XREF: seg005:0283j
		les	bx, [bp+6]
		mov	es:[bx+13Dh], eax
		jmp	loc_A641
; ���������������������������������������������������������������������������

loc_A5A4:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		mov	ax, [bp+0Ch]	; case 0xB3
		mov	[bp-16h], ax
		push	ax
		mov	ax, [bp+6]
		add	ax, 145h
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+6]
		mov	byte ptr es:[bx+149h], 0
		jmp	short loc_A641
; ���������������������������������������������������������������������������

loc_A5C8:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		mov	ax, [bp+0Ch]	; case 0xB5
		mov	[bp-18h], ax
		push	ax
		mov	ax, [bp+6]
		add	ax, 147h

loc_A5D5:				; CODE XREF: seg005:00BBj
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		jmp	short loc_A641
; ���������������������������������������������������������������������������

loc_A5E3:				; CODE XREF: seg005:003Cj
					; DATA XREF: seg005:off_A695o
		mov	si, di		; case 0xB2
		add	si, 4
		mov	eax, [si]
		mov	[bp-1Ch], eax
		mov	eax, [bp-1Ch]
		les	bx, [bp+6]
		mov	es:[bx+141h], eax
		jmp	short loc_A641
; ���������������������������������������������������������������������������

loc_A5FE:				; CODE XREF: seg005:0037j seg005:003Cj
					; DATA XREF: ...
		push	0		; default
		mov	ax, [bp+6]
		add	ax, 10Fh
		push	word ptr [bp+8]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+6]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [si]
		mov	es:[bx+111h], eax
		mov	eax, [si+4]
		mov	es:[bx+115h], eax
		mov	eax, [si+8]
		mov	es:[bx+119h], eax
		mov	word ptr es:[bx+11Dh], 0BFh ; '�'

loc_A641:				; CODE XREF: seg005:0029j seg005:008Aj ...
		les	bx, [bp+6]
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jz	short loc_A668
		mov	al, es:[bx+28Bh]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_A668
		push	word ptr [bp+8]
		push	bx
		call	Goal_FollowAllyExec
		add	sp, 4

loc_A668:				; CODE XREF: seg005:034Bj seg005:035Aj
		les	bx, [bp+6]
		mov	al, es:[bx+28Bh]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jnz	short loc_A68A
		push	word ptr [bp+8]
		push	bx
		nop
		push	cs
		call	near ptr Goal_IsComplete
		add	sp, 4
		or	al, al
		jz	short loc_A68F

loc_A68A:				; CODE XREF: seg005:0378j
		mov	ax, 1
		jmp	short loc_A691
; ���������������������������������������������������������������������������

loc_A68F:				; CODE XREF: seg005:0388j
		xor	ax, ax

loc_A691:				; CODE XREF: seg005:038Dj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_A695	dw offset loc_A3FA	; DATA XREF: seg005:003Cr
		dw offset loc_A459	; jump table for switch	statement
		dw offset loc_A5FE
		dw offset loc_A405
		dw offset loc_A405
		dw offset loc_A5FE
		dw offset loc_A4CA
		dw offset loc_A38D
		dw offset loc_A3BE
		dw offset loc_A341
		dw offset loc_A4AF
		dw offset loc_A4EE
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A588
		dw offset loc_A5E3
		dw offset loc_A5A4
		dw offset loc_A585
		dw offset loc_A5C8
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A5FE
		dw offset loc_A3BE

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,235L — switch sur 11 cas du code d'état/but IA (offset +0x11D, valeurs 0xA1-0xAC) : pour
; chaque type de GOAL, vérifie si la condition de complétion est remplie (ex: 0xA1=cible
; valide de type 0x11, 0xA9=distance parcourue vs seuil, 0xA4=distance à un point <0x1F400).
; 'Is-Goal-Complete' checker — correspond directement aux GOAL types déjà documentés
; (takeOff/land/flyToWaypoint/destroyTarget/defendTarget/followAlly).
; ==============================================================================================
Goal_IsComplete	proc far		; CODE XREF: seg005:0380p Goal_ExecuteAction_A8AC+Cp

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+11Dh]
		mov	[bp+var_4], ax
		mov	cx, 0Bh		; switch 11 cases
		mov	bx, offset word_A880

loc_A6EF:				; CODE XREF: Goal_IsComplete+27j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4]
		jz	short loc_A6FF
		add	bx, 2
		loop	loc_A6EF
		jmp	loc_A864	; default
; ���������������������������������������������������������������������������

loc_A6FF:				; CODE XREF: Goal_IsComplete+22j
		jmp	word ptr cs:[bx+16h] ; switch jump
; ���������������������������������������������������������������������������
		jmp	loc_A864	; default
; ���������������������������������������������������������������������������

loc_A706:				; CODE XREF: Goal_IsComplete:loc_A6FFj
					; DATA XREF: seg005:0596o
		jmp	loc_A864	; case 0xFFFF
; ���������������������������������������������������������������������������

loc_A709:				; CODE XREF: Goal_IsComplete:loc_A6FFj
					; DATA XREF: seg005:0596o
		les	bx, [bp+arg_0]	; case 0xAA
		cmp	word ptr es:[bx+145h], 0
		jz	short loc_A717
		jmp	loc_A85B
; ���������������������������������������������������������������������������

loc_A717:				; CODE XREF: Goal_IsComplete+3Fj Goal_IsComplete+83j ...
		xor	ax, ax

loc_A719:				; CODE XREF: Goal_IsComplete+18Bj
		mov	[bp+var_1], al
		jmp	loc_A87A
; ���������������������������������������������������������������������������

loc_A71F:				; CODE XREF: Goal_IsComplete:loc_A6FFj
					; DATA XREF: seg005:0596o
		jmp	loc_A810	; case 0xAC
; ���������������������������������������������������������������������������

loc_A722:				; CODE XREF: Goal_IsComplete:loc_A6FFj
					; DATA XREF: seg005:0596o
		les	bx, [bp+arg_0]	; case 0xA1
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_A73B
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+21h], 11h
		jnz	short loc_A73B
		jmp	loc_A85B
; ���������������������������������������������������������������������������

loc_A73B:				; CODE XREF: Goal_IsComplete+58j Goal_IsComplete+63j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_A74D
		jmp	loc_A85B
; ���������������������������������������������������������������������������

loc_A74D:				; CODE XREF: Goal_IsComplete+75j
		mov	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+15h], 0
		jnz	short loc_A717
		jmp	loc_A85B
; ���������������������������������������������������������������������������
		jmp	short loc_A717
; ���������������������������������������������������������������������������

loc_A75D:				; CODE XREF: Goal_IsComplete:loc_A6FFj
					; DATA XREF: seg005:0596o
		les	bx, [bp+arg_0]	; case 0xA2
		cmp	byte ptr es:[bx+19h], 12h
		jz	short loc_A717
		jmp	loc_A85B
; ���������������������������������������������������������������������������
		jmp	short loc_A717
; ���������������������������������������������������������������������������

loc_A76C:				; CODE XREF: Goal_IsComplete:loc_A6FFj
					; DATA XREF: seg005:0596o
		les	bx, [bp+arg_0]	; case 0xA4
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_1C], eax
		mov	eax, [si+4]
		mov	[bp+var_18], eax
		mov	eax, [si+8]
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 11Fh
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_28], eax
		mov	eax, es:[si+4]
		mov	[bp+var_24], eax
		mov	eax, es:[si+8]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		sub	[bp+var_1C], eax

loc_A7C3:
		mov	eax, [bp+var_24]
		sub	[bp+var_18], eax
		mov	eax, [bp+var_20]
		sub	[bp+var_14], eax
		mov	[bp+var_14], 0
		push	large [bp+var_14]
		push	large [bp+var_18]
		push	large [bp+var_1C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 1F400h
		jle	short loc_A80A
		mov	ax, 1
		jmp	short loc_A80C
; ���������������������������������������������������������������������������

loc_A80A:				; CODE XREF: Goal_IsComplete+130j
		xor	ax, ax

loc_A80C:				; CODE XREF: Goal_IsComplete+135j
		or	al, al
		jz	short loc_A87A

loc_A810:				; CODE XREF: Goal_IsComplete:loc_A71Fj
		mov	[bp+var_1], 1
		jmp	short loc_A87A
; ���������������������������������������������������������������������������

loc_A816:				; CODE XREF: Goal_IsComplete:loc_A6FFj
					; DATA XREF: seg005:0596o
		les	bx, [bp+arg_0]	; case 0xA9
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 1
		jnz	short loc_A82E
		mov	dx, word_706A7
		sub	dx, word_706A9
		jmp	short loc_A836
; ���������������������������������������������������������������������������

loc_A82E:				; CODE XREF: Goal_IsComplete+14Fj
		mov	dx, word_706A3
		sub	dx, word_706A5

loc_A836:				; CODE XREF: Goal_IsComplete+159j
		mov	ax, dx
		jmp	short loc_A872
; ���������������������������������������������������������������������������

loc_A83A:				; CODE XREF: Goal_IsComplete:loc_A6FFj
					; DATA XREF: seg005:0596o
		les	bx, [bp+arg_0]	; case 0xA8
		cmp	word ptr es:[bx+137h], 0
		jnz	short loc_A848
		jmp	loc_A717
; ���������������������������������������������������������������������������

loc_A848:				; CODE XREF: Goal_IsComplete+170j
		jmp	short loc_A85B
; ���������������������������������������������������������������������������
		jmp	loc_A717
; ���������������������������������������������������������������������������

loc_A84D:				; CODE XREF: Goal_IsComplete:loc_A6FFj
					; DATA XREF: seg005:0596o
		les	bx, [bp+arg_0]	; case 0xA7
		cmp	word ptr es:[bx+137h], 0
		jnz	short loc_A85B
		jmp	loc_A717
; ���������������������������������������������������������������������������

loc_A85B:				; CODE XREF: Goal_IsComplete+41j Goal_IsComplete+65j ...
		mov	ax, 1
		jmp	loc_A719
; ���������������������������������������������������������������������������
		jmp	loc_A717
; ���������������������������������������������������������������������������

loc_A864:				; CODE XREF: Goal_IsComplete+29j Goal_IsComplete+30j ...
		les	bx, [bp+arg_0]	; default
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0

loc_A872:				; CODE XREF: Goal_IsComplete+165j
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_1], al

loc_A87A:				; CODE XREF: Goal_IsComplete+49j
					; Goal_IsComplete+13Bj ...
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Goal_IsComplete	endp

; ���������������������������������������������������������������������������
word_A880	dw 0FFFFh,  0A1h,  0A2h,  0A4h ; DATA XREF: Goal_IsComplete+19o
		dw   0A5h,  0A7h,  0A8h,  0A9h ; value table for switch	statement
		dw   0AAh,  0ACh,  0BFh
		dw offset loc_A706	; jump table for switch	statement
		dw offset loc_A722
		dw offset loc_A75D
		dw offset loc_A76C
		dw offset loc_A76C
		dw offset loc_A84D
		dw offset loc_A83A
		dw offset loc_A816
		dw offset loc_A709
		dw offset loc_A71F
		dw offset loc_A71F

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,486L — appelle d'abord sub_A6D3 (test complétion), puis re-dispatch sur le MÊME switch
; 11 cas +0x11D pour exécuter l'action associée à chaque GOAL (délègue souvent à vtable[0xC]
; de la cible si présente). 'Execute-Goal-Action' dispatcher — cœur du système d'exécution de
; GOAL IA. DECOUVERTE : dans son traitement du code 0xA1, construit un noeud de propriete
; nommee via le MEME mecanisme generique que le chargement PROF/MVRS/ATRB
; (Memory_TypedFreeWrapper_5C6F3 + VROOMM_StubThunk_6AB4A ->
; PilotProfile_NamedPropertyNode_Construct_755A0), en enveloppant une valeur CALCULEE au
; runtime (derivee de deux positions 3D de l'entite, +0x11F et +0x12B) plutot qu'une valeur
; chargee depuis le fichier - confirme que ce systeme de noeud generique (tag 0x5C44) sert a
; la fois au chargement de configuration statique ET au transport de valeurs calculees
; dynamiquement, mais n'etablit PAS de lien direct avec les valeurs MVRS specifiquement
; chargees en memoire.
; ==============================================================================================
Goal_ExecuteAction_A8AC	proc far		; CODE XREF: AI_TopLevelThink+376P
					; Goal_SelectTransition+2ADP
					; DATA XREF: ...

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
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 40h
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr Goal_IsComplete
		add	sp, 4
		mov	[bp+var_1], al
		mov	ah, 0

loc_A8C3:
		or	ax, ax
		jnz	short loc_A8DF
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_A8DF
		and	byte ptr es:[bx+28Bh], 0DFh

loc_A8DF:				; CODE XREF: Goal_ExecuteAction_A8AC+19j Goal_ExecuteAction_A8AC+2Bj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 0FFh
		jnz	short loc_A8F2
		mov	ax, 1
		jmp	short loc_A8F4
; ���������������������������������������������������������������������������

loc_A8F2:				; CODE XREF: Goal_ExecuteAction_A8AC+3Fj
		xor	ax, ax

loc_A8F4:				; CODE XREF: Goal_ExecuteAction_A8AC+44j
		mov	dl, al
		cmp	[bp+var_1], 0
		jnz	short loc_A8FF
		jmp	loc_ACE1
; ���������������������������������������������������������������������������

loc_A8FF:				; CODE XREF: Goal_ExecuteAction_A8AC+4Ej
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+11Dh]
		mov	[bp+var_6], ax
		mov	cx, 0Bh		; switch 11 cases
		mov	bx, offset word_ACE7

loc_A910:				; CODE XREF: Goal_ExecuteAction_A8AC+6Fj
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_6]
		jz	short loc_A920
		add	bx, 2
		loop	loc_A910
		jmp	loc_ACC1	; default
; ���������������������������������������������������������������������������

loc_A920:				; CODE XREF: Goal_ExecuteAction_A8AC+6Aj
		jmp	word ptr cs:[bx+16h] ; switch jump

loc_A924:				; DATA XREF: seg005:09FDo
		or	dl, dl		; case 0xAC
		jz	short loc_A92D
		mov	byte_6E4C5, 1

loc_A92D:				; CODE XREF: Goal_ExecuteAction_A8AC+7Aj
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_A950

loc_A938:				; CODE XREF: Goal_ExecuteAction_A8AC+1A3j
					; Goal_ExecuteAction_A8AC+228j ...
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]

loc_A94A:				; CODE XREF: Goal_ExecuteAction_A8AC+12Cj
		add	sp, 4
		jmp	loc_ACE1
; ���������������������������������������������������������������������������

loc_A950:				; CODE XREF: Goal_ExecuteAction_A8AC+8Aj
		push	1
		push	large [bp+arg_0]
		call	AI_BehaviorStateMachine_WeightedOptionSelector_9D05
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A97C
		push	large [bp+arg_0]
		call	AI_NavSolutionToPoint
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_A979
		jmp	loc_ACE1
; ���������������������������������������������������������������������������

loc_A979:				; CODE XREF: Goal_ExecuteAction_A8AC+C8j
		jmp	loc_ACD3
; ���������������������������������������������������������������������������

loc_A97C:				; CODE XREF: Goal_ExecuteAction_A8AC+B6j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+283h], 0
		jnz	short loc_A98A
		jmp	loc_ACE1
; ���������������������������������������������������������������������������

loc_A98A:				; CODE XREF: Goal_ExecuteAction_A8AC+D9j
		mov	ax, es:[bx+283h]
		mov	[bp+var_4], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 137h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		jmp	loc_ACDE
; ���������������������������������������������������������������������������

loc_A9A5:				; CODE XREF: Goal_ExecuteAction_A8AC:loc_A920j
					; DATA XREF: seg005:09FDo
		push	large [bp+arg_0] ; case	0xAA
		call	Goal_SelectTransition
		add	sp, 4
		mov	[bp+var_1], al
		jmp	loc_ACE1
; ���������������������������������������������������������������������������

loc_A9B7:				; CODE XREF: Goal_ExecuteAction_A8AC:loc_A920j
					; DATA XREF: seg005:09FDo
		push	large [bp+arg_0] ; case	0xFFFF
		call	AI_NavSolutionToPoint
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_A9CC
		jmp	loc_ACE1
; ���������������������������������������������������������������������������

loc_A9CC:				; CODE XREF: Goal_ExecuteAction_A8AC+11Bj
		jmp	loc_ACD3
; ���������������������������������������������������������������������������

loc_A9CF:				; CODE XREF: Goal_ExecuteAction_A8AC:loc_A920j
					; DATA XREF: seg005:09FDo
		push	large [bp+arg_0] ; case	0xA4
		nop
		push	cs
		call	near ptr Goal_ReturnToBase
		jmp	loc_A94A
; ���������������������������������������������������������������������������

loc_A9DB:				; CODE XREF: Goal_ExecuteAction_A8AC:loc_A920j
					; DATA XREF: seg005:09FDo
		or	dl, dl		; case 0xA8
		jz	short loc_A9E4
		mov	byte_6E4C5, 1

loc_A9E4:				; CODE XREF: Goal_ExecuteAction_A8AC+131j
		push	large [bp+arg_0]
		call	AI_NavSolutionToPoint
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_A9F9
		jmp	loc_ACE1
; ���������������������������������������������������������������������������

loc_A9F9:				; CODE XREF: Goal_ExecuteAction_A8AC+148j
		push	0
		push	large [bp+arg_0]
		call	AI_BehaviorStateMachine_WeightedOptionSelector_9D05
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jz	short loc_AA10
		jmp	loc_ACE1
; ���������������������������������������������������������������������������

loc_AA10:				; CODE XREF: Goal_ExecuteAction_A8AC+15Fj
		jmp	loc_ACD3
; ���������������������������������������������������������������������������

loc_AA13:				; CODE XREF: Goal_ExecuteAction_A8AC:loc_A920j
					; DATA XREF: seg005:09FDo
		or	dl, dl		; case 0xA7
		jz	short loc_AA1C
		mov	byte_6E4C5, 1

loc_AA1C:				; CODE XREF: Goal_ExecuteAction_A8AC+169j
		mov	[bp+var_A], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+137h], 0
		jz	short loc_AA44
		push	word ptr es:[bx+137h]
		mov	bx, es:[bx+137h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax

loc_AA44:				; CODE XREF: Goal_ExecuteAction_A8AC+181j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_AA52
		jmp	loc_A938
; ���������������������������������������������������������������������������

loc_AA52:				; CODE XREF: Goal_ExecuteAction_A8AC+1A1j
		cmp	[bp+var_A], 0
		jz	short loc_AABB
		les	bx, [bp+var_A]
		cmp	byte ptr es:[bx+11h], 2
		jnz	short loc_AABB
		mov	[bp+var_14], 0
		xor	ax, ax
		mov	[bp+var_10], ax
		mov	[bp+var_12], ax
		mov	[bp+var_18], 200h
		mov	eax, [bp+var_18]
		mov	[bp+var_E], eax
		lea	ax, [bp+var_14]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0D9h]
		les	bx, es:[bx+0D9h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		or	al, al
		jz	short loc_AAB4
		lea	ax, [bp+var_14]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0D9h]
		les	bx, es:[bx+0D9h]
		jmp	loc_ACB9
; ���������������������������������������������������������������������������

loc_AAB4:				; CODE XREF: Goal_ExecuteAction_A8AC+1F1j
		mov	[bp+var_1], 0
		jmp	loc_ACE1
; ���������������������������������������������������������������������������

loc_AABB:				; CODE XREF: Goal_ExecuteAction_A8AC+1ABj
					; Goal_ExecuteAction_A8AC+1B5j
		push	0
		push	large [bp+arg_0]
		call	AI_BehaviorStateMachine_WeightedOptionSelector_9D05
		jmp	loc_ACDE
; ���������������������������������������������������������������������������

loc_AAC9:				; CODE XREF: Goal_ExecuteAction_A8AC:loc_A920j
					; DATA XREF: seg005:09FDo
		les	bx, [bp+arg_0]	; case 0xA2
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_AAD7
		jmp	loc_A938
; ���������������������������������������������������������������������������

loc_AAD7:				; CODE XREF: Goal_ExecuteAction_A8AC+226j
		mov	[bp+var_14], 0
		xor	ax, ax
		mov	[bp+var_10], ax
		mov	[bp+var_12], ax
		mov	[bp+var_18], 200h
		mov	eax, [bp+var_18]
		mov	[bp+var_E], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 11Fh
		mov	word ptr [bp+var_1C+2],	ax
		mov	word ptr [bp+var_1C], dx
		les	si, [bp+var_1C]
		mov	eax, es:[si]
		mov	[bp+var_34], eax
		mov	eax, es:[si+4]
		mov	[bp+var_30], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 12Bh
		mov	word ptr [bp+var_20+2],	ax
		mov	word ptr [bp+var_20], dx
		les	si, [bp+var_20]
		mov	eax, es:[si]
		mov	[bp+var_40], eax
		mov	eax, es:[si+4]
		mov	[bp+var_3C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_38], eax
		lea	ax, [bp+var_34]
		mov	[bp+var_12], ax
		lea	ax, [bp+var_40]
		mov	[bp+var_10], ax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+11h], 0
		jnz	short loc_ABC4
		mov	eax, [bp+arg_0]
		mov	[bp+var_24], eax
		push	1
		push	0
		push	2
		push	large 0A1h ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_28+2],	dx
		mov	word ptr [bp+var_28], ax
		or	ax, dx
		jz	short loc_ABB3
		push	large [bp+var_24]
		push	dx
		push	word ptr [bp+var_28]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_28]
		mov	word ptr es:[bx], 326h
		mov	byte ptr es:[bx+21h], 12h
		mov	dx, word ptr [bp+var_28+2]
		mov	ax, word ptr [bp+var_28]
		jmp	short loc_ABB9
; ���������������������������������������������������������������������������

loc_ABB3:				; CODE XREF: Goal_ExecuteAction_A8AC+2E0j
		mov	dx, word ptr [bp+var_28+2]
		mov	ax, word ptr [bp+var_28]

loc_ABB9:				; CODE XREF: Goal_ExecuteAction_A8AC+305j
		les	bx, [bp+arg_0]
		mov	es:[bx+13h], dx
		mov	es:[bx+11h], ax

loc_ABC4:				; CODE XREF: Goal_ExecuteAction_A8AC+2B7j
		lea	ax, [bp+var_14]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+11h]
		les	bx, es:[bx+11h]
		jmp	loc_ACB9
; ���������������������������������������������������������������������������

loc_ABD7:				; CODE XREF: Goal_ExecuteAction_A8AC:loc_A920j
					; DATA XREF: seg005:09FDo
		les	bx, [bp+arg_0]	; case 0xA1
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_ABE5
		jmp	loc_A938
; ���������������������������������������������������������������������������

loc_ABE5:				; CODE XREF: Goal_ExecuteAction_A8AC+334j
		mov	[bp+var_14], 0
		xor	ax, ax
		mov	[bp+var_10], ax
		mov	[bp+var_12], ax
		mov	[bp+var_18], 200h
		mov	eax, [bp+var_18]
		mov	[bp+var_E], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_34], eax
		mov	eax, [si+4]
		mov	[bp+var_30], eax
		mov	eax, [si+8]
		mov	[bp+var_2C], eax
		lea	ax, [bp+var_34]
		mov	[bp+var_10], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+102h]
		add	ax, 12h
		mov	[bp+var_12], ax
		cmp	dword ptr es:[bx+15h], 0
		jnz	short loc_ACA9
		mov	eax, [bp+arg_0]
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	2
		push	large 5Ah ; 'Z'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2],	dx
		mov	word ptr [bp+var_20], ax
		or	ax, dx
		jz	short loc_AC98
		push	large [bp+var_1C]
		push	dx
		push	word ptr [bp+var_20]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 312h
		mov	byte ptr es:[bx+21h], 11h
		mov	dx, word ptr [bp+var_20+2]
		mov	ax, word ptr [bp+var_20]
		jmp	short loc_AC9E
; ���������������������������������������������������������������������������

loc_AC98:				; CODE XREF: Goal_ExecuteAction_A8AC+3C5j
		mov	dx, word ptr [bp+var_20+2]
		mov	ax, word ptr [bp+var_20]

loc_AC9E:				; CODE XREF: Goal_ExecuteAction_A8AC+3EAj
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], dx
		mov	es:[bx+15h], ax

loc_ACA9:				; CODE XREF: Goal_ExecuteAction_A8AC+39Fj
		lea	ax, [bp+var_14]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+15h]
		les	bx, es:[bx+15h]

loc_ACB9:				; CODE XREF: Goal_ExecuteAction_A8AC+205j
					; Goal_ExecuteAction_A8AC+328j
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		jmp	short loc_ACDE
; ���������������������������������������������������������������������������

loc_ACC1:				; CODE XREF: Goal_ExecuteAction_A8AC+71j
		push	large [bp+arg_0] ; default
		call	AI_NavSolutionToPoint
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_ACE1

loc_ACD3:				; CODE XREF: Goal_ExecuteAction_A8AC:loc_A979j
					; Goal_ExecuteAction_A8AC:loc_A9CCj ...
		push	0
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Goal_WanderRandom

loc_ACDE:				; CODE XREF: Goal_ExecuteAction_A8AC+F6j
					; Goal_ExecuteAction_A8AC+21Aj ...
		add	sp, 6

loc_ACE1:				; CODE XREF: Goal_ExecuteAction_A8AC+50j Goal_ExecuteAction_A8AC+A1j ...
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Goal_ExecuteAction_A8AC	endp

; ���������������������������������������������������������������������������
word_ACE7	dw 0FFFFh,  0A1h,  0A2h,  0A4h ; DATA XREF: Goal_ExecuteAction_A8AC+61o
		dw   0A5h,  0A7h,  0A8h,  0A9h ; value table for switch	statement
		dw   0AAh,  0ACh,  0BFh
		dw offset loc_A9B7	; jump table for switch	statement
		dw offset loc_ABD7
		dw offset loc_AAC9
		dw offset loc_A9CF
		dw offset loc_A9CF
		dw offset loc_AA13
		dw offset loc_A9DB
		dw offset loc_A9DB
		dw offset loc_A9A5
		dw offset loc_A924
		dw offset loc_A9B7

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 246L, LUE INTEGRALEMENT (2026-09-20). Handler du GOAL 'errance'. (1) Si l'objet en
; cours de l'entite (+0x0D) existe : delegue a son vtable+0xC et renvoie 1. (2) Sinon, sauf si
; [[entite+7]+0x1A]==0 et entite+0x19==0x15 (role non lu), tire deux valeurs
; rand()%20000-10000 (0x4E20 / 0xD8F0), les prend comme direction horizontale, la normalise
; (Vector_NormalizeInPlace_5593A = normalisation) et la multiplie par 0x753000 (30000 en 24.8)
; : point a 30000 unites dans une direction aleatoire. Altitude : Terrain_QueryAltitudeAt +
; entite+0x13D (altitude de croisiere NUMS) - altitude actuelle (objet +0x102, +0x1A), bornee
; a +/-1000 puis ajoutee a la position courante. Ecrit le point dans le bloc d'etat commun
; ([[entite+7]] +0x2/+0x6/+0xA), la vitesse voulue (direction * entite+0x141) en
; +0xE/+0x12/+0x16, et le point dans entite+0x11F/+0x123/+0x127. (3) Efface l'octet +0xC du
; noeud entite+0xD1 (MVRS ID 21) et appelle son vtable+8. Renvoie toujours 1. Appelee par
; Goal_ExecuteAction_A8AC (cas par defaut) et Formation_DamageReactionHandler.
; ==============================================================================================
Goal_WanderRandom	proc far		; CODE XREF: Goal_ExecuteAction_A8AC+42Fp
					; AI_EngageAttackerReaction_E246+34FP
					; DATA XREF: ...

var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
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

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_AD3A
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	loc_AFF7
; ���������������������������������������������������������������������������

loc_AD3A:				; CODE XREF: Goal_WanderRandom+10j
		mov	[bp+var_A], 0
		xor	ax, ax
		mov	[bp+var_6], ax
		mov	[bp+var_8], ax
		mov	[bp+var_E], 200h
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		mov	[bp+var_12], 1E00h
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Ah], 0
		jnz	short loc_AD82
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+19h], 15h
		jnz	short loc_AD82
		jmp	loc_AFCF
; ���������������������������������������������������������������������������

loc_AD82:				; CODE XREF: Goal_WanderRandom+60j Goal_WanderRandom+6Aj
		call	CRT_Rand
		mov	bx, 4E20h
		cwd
		idiv	bx
		add	dx, 0D8F0h
		movsx	eax, dx
		mov	[bp+var_16], eax
		shl	eax, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_52], eax
		call	CRT_Rand
		mov	bx, 4E20h
		cwd
		idiv	bx
		add	dx, 0D8F0h
		movsx	eax, dx
		mov	[bp+var_1E], eax
		shl	eax, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], 0
		lea	ax, [bp+var_52]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp+var_52]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_56], eax
		mov	[bp+var_26], 753000h
		mov	eax, [bp+var_52]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_4E]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4A]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 13Dh
		mov	word ptr [bp+var_2A+2],	ax
		mov	word ptr [bp+var_2A], dx
		les	bx, [bp+var_2A]
		mov	eax, es:[bx]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_4A], eax
		push	0
		mov	[bp+var_32], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_6A], eax
		mov	[bp+var_36], 0
		mov	eax, [bp+var_36]
		mov	[bp+var_66], eax
		mov	[bp+var_3A], 100h
		mov	eax, [bp+var_3A]
		mov	[bp+var_62], eax
		lea	ax, [bp+var_6A]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+102h]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_3E]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_3E]
		add	[bp+var_4A], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 1Ah
		mov	eax, [si]
		sub	[bp+var_4A], eax
		cmp	[bp+var_4A], 0FFFC1800h
		jge	short loc_AEE2
		mov	[bp+var_4A], 0FFFC1800h
		jmp	short loc_AEF4
; ���������������������������������������������������������������������������

loc_AEE2:				; CODE XREF: Goal_WanderRandom+1C3j
		cmp	[bp+var_4A], 3E800h
		jle	short loc_AEF4
		mov	[bp+var_4A], 3E800h

loc_AEF4:				; CODE XREF: Goal_WanderRandom+1CDj
					; Goal_WanderRandom+1D7j
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [si]
		add	[bp+var_52], eax
		mov	eax, [si+4]
		add	[bp+var_4E], eax
		mov	eax, [si+8]
		add	[bp+var_4A], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 141h
		mov	word ptr [bp+var_42+2],	ax
		mov	word ptr [bp+var_42], dx
		les	bx, [bp+var_42]
		mov	eax, es:[bx]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_5E]
		mov	edx, [bp+var_46]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5A]
		mov	edx, [bp+var_46]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_56]
		mov	edx, [bp+var_46]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_56], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_52]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_4E]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_4A]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_52]
		mov	es:[bx+11Fh], eax
		mov	eax, [bp+var_4E]
		mov	es:[bx+123h], eax
		mov	eax, [bp+var_4A]
		mov	es:[bx+127h], eax
		les	bx, es:[bx+7]
		mov	eax, [bp+var_5E]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_5A]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_56]
		mov	es:[bx+16h], eax

loc_AFCF:				; CODE XREF: Goal_WanderRandom+6Cj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0D1h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0D1h]
		les	bx, es:[bx+0D1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6

loc_AFF7:				; CODE XREF: Goal_WanderRandom+24j
		mov	al, 1
		pop	si
		leave
		retf
Goal_WanderRandom	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,305L — handler GOAL utilisant un champ route/waypoint (+0x145→+0x51), teste un flag
; pilote (+0x75 bit5) : probable handler flyToWaypoint suivant une liste de points de passage.
; ==============================================================================================
Goal_FollowWaypoints	proc far		; CODE XREF: Goal_SelectTransition+24EP
					; Goal_FollowAllyExec+1D0P

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

		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_B024
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	loc_B32D
; ���������������������������������������������������������������������������

loc_B024:				; CODE XREF: Goal_FollowWaypoints+11j
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
		jz	short loc_B063
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 145h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		jmp	loc_B32A
; ���������������������������������������������������������������������������

loc_B063:				; CODE XREF: Goal_FollowWaypoints+51j
		mov	[bp+var_A], 0
		xor	ax, ax
		mov	[bp+var_6], ax
		mov	[bp+var_8], ax
		mov	[bp+var_E], 200h
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+145h], 0
		jnz	short loc_B08E
		jmp	loc_B32D
; ���������������������������������������������������������������������������

loc_B08E:				; CODE XREF: Goal_FollowWaypoints+8Dj
		push	word ptr es:[bx+145h]
		mov	bx, es:[bx+145h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_40], eax
		mov	eax, [si+4]
		mov	[bp+var_3C], eax
		mov	eax, [si+8]
		mov	[bp+var_38], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+145h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_4C], eax
		mov	eax, [si+4]
		mov	[bp+var_48], eax
		mov	eax, [si+8]
		mov	[bp+var_44], eax
		mov	[bp+var_12], eax
		push	0
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_58], eax
		mov	[bp+var_1A], 0
		mov	eax, [bp+var_1A]
		mov	[bp+var_54], eax
		mov	[bp+var_1E], 100h
		mov	eax, [bp+var_1E]
		mov	[bp+var_50], eax
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_22]
		sub	[bp+var_12], eax
		cmp	[bp+var_12], 14D00h
		jle	short loc_B142
		mov	ax, 1
		jmp	short loc_B144
; ���������������������������������������������������������������������������

loc_B142:				; CODE XREF: Goal_FollowWaypoints+13Fj
		xor	ax, ax

loc_B144:				; CODE XREF: Goal_FollowWaypoints+144j
		or	al, al
		jnz	short loc_B14B
		jmp	loc_B22F
; ���������������������������������������������������������������������������

loc_B14B:				; CODE XREF: Goal_FollowWaypoints+14Aj
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 14Ah
		mov	word ptr [bp+var_2A+2],	ax
		mov	word ptr [bp+var_2A], dx
		les	si, [bp+var_2A]
		mov	eax, es:[si]
		mov	[bp+var_70], eax
		mov	eax, es:[si+4]
		mov	[bp+var_6C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_70]
		or	eax, eax
		jge	short loc_B184
		neg	eax

loc_B184:				; CODE XREF: Goal_FollowWaypoints+183j
		mov	[bp+var_70], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	di, es:[bx+145h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_7C], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_78], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_74], eax
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		cmp	[bp+var_2E], 0
		jge	short loc_B1DE
		mov	ax, 1
		jmp	short loc_B1E0
; ���������������������������������������������������������������������������

loc_B1DE:				; CODE XREF: Goal_FollowWaypoints+1DBj
		xor	ax, ax

loc_B1E0:				; CODE XREF: Goal_FollowWaypoints+1E0j
		or	al, al
		jz	short loc_B1EF
		mov	eax, [bp+var_70]
		neg	eax
		mov	[bp+var_70], eax

loc_B1EF:				; CODE XREF: Goal_FollowWaypoints+1E6j
		lea	ax, [bp+var_70]
		mov	[bp+var_8], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+145h]
		mov	[bp+var_A], ax
		mov	[bp+var_32], 200h
		mov	eax, [bp+var_32]
		mov	[bp+var_4], eax
		les	bx, es:[bx+0D5h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0D5h]
		les	bx, es:[bx+0D5h]
		jmp	loc_B324
; ���������������������������������������������������������������������������

loc_B22F:				; CODE XREF: Goal_FollowWaypoints+14Cj
		add	[bp+var_44], 3E800h
		mov	[bp+var_26], 0C800h
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_38]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+145h]
		mov	si, [bx+51h]
		add	si, 8
		mov	eax, [si]
		mov	[bp+var_64], eax
		mov	eax, [si+4]
		mov	[bp+var_60], eax
		mov	eax, [si+8]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_64]
		add	[bp+var_40], eax
		mov	eax, [bp+var_60]
		add	[bp+var_3C], eax
		mov	eax, [bp+var_5C]
		add	[bp+var_38], eax
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_4C]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_48]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_44]
		mov	es:[bx+0Ah], eax
		mov	eax, [bp+var_40]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_3C]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_38]
		mov	es:[bx+16h], eax
		mov	word ptr [bp+var_32+2],	0
		xor	ax, ax
		mov	word ptr [bp+var_2E+2],	ax
		mov	word ptr [bp+var_2E], ax
		mov	dword ptr [bp-34h], 200h
		mov	eax, [bp-34h]
		mov	[bp+var_2A], eax
		lea	ax, [bp+var_32+2]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0D1h]
		les	bx, es:[bx+0D1h]

loc_B324:				; CODE XREF: Goal_FollowWaypoints+230j
		mov	bx, es:[bx]
		call	dword ptr [bx+8]

loc_B32A:				; CODE XREF: Goal_FollowWaypoints+64j
		add	sp, 6

loc_B32D:				; CODE XREF: Goal_FollowWaypoints+25j Goal_FollowWaypoints+8Fj
		pop	di
		pop	si
		leave
		retf
Goal_FollowWaypoints	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,229L — handler GOAL utilisant la position/vitesse propre (+0x11F) en absence de cible :
; probable handler 'return to base'/'orbit point' (variante sans cible).
; ==============================================================================================
Goal_ReturnToBase	proc far		; CODE XREF: Goal_ExecuteAction_A8AC+129p

var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
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

		push	bp
		mov	bp, sp
		sub	sp, 92h
		push	si
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_B359
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	loc_B5BE
; ���������������������������������������������������������������������������

loc_B359:				; CODE XREF: Goal_ReturnToBase+11j
		mov	[bp+var_A], 0
		xor	ax, ax
		mov	[bp+var_6], ax
		mov	[bp+var_8], ax
		mov	[bp+var_E], 200h
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 11Fh
		mov	word ptr [bp+var_12+2],	ax
		mov	word ptr [bp+var_12], dx
		les	si, [bp+var_12]
		mov	eax, es:[si]
		mov	[bp+var_4A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_46], eax
		mov	eax, es:[si+8]
		mov	[bp+var_42], eax
		lea	ax, [bp+var_4A]
		mov	[bp+var_8], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Ah], 0
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 11Fh
		mov	word ptr [bp+var_16+2],	ax
		mov	word ptr [bp+var_16], dx
		les	si, [bp+var_16]
		mov	eax, es:[si]
		mov	[bp+var_56], eax
		mov	eax, es:[si+4]
		mov	[bp+var_52], eax
		mov	eax, es:[si+8]
		mov	[bp+var_4E], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_56]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_52]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_4E]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+11Dh], 0A5h ; '�'
		jz	short loc_B419
		cmp	word ptr es:[bx+11Dh], 0A4h ; '�'
		jnz	short loc_B466

loc_B419:				; CODE XREF: Goal_ReturnToBase+DDj
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 12Bh
		mov	word ptr [bp+var_1A+2],	ax
		mov	word ptr [bp+var_1A], dx
		les	si, [bp+var_1A]
		mov	eax, es:[si]
		mov	[bp+var_62], eax
		mov	eax, es:[si+4]
		mov	[bp+var_5E], eax
		mov	eax, es:[si+8]
		mov	[bp+var_5A], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_62]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_5E]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_5A]
		jmp	loc_B591
; ���������������������������������������������������������������������������

loc_B466:				; CODE XREF: Goal_ReturnToBase+E6j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 11Fh
		mov	word ptr [bp+var_1E+2],	ax
		mov	word ptr [bp+var_1E], dx
		les	si, [bp+var_1E]
		mov	eax, es:[si]
		mov	[bp+var_6E], eax
		mov	eax, es:[si+4]
		mov	[bp+var_6A], eax
		mov	eax, es:[si+8]
		mov	[bp+var_66], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [bp+var_6E]
		sub	eax, [si]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_6A]
		sub	eax, [si+4]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_66]
		sub	eax, [si+8]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_7E], eax
		lea	ax, [bp+var_86]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	si, ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 141h
		mov	word ptr [bp+var_22+2],	ax
		mov	word ptr [bp+var_22], dx
		les	bx, [bp+var_22]
		mov	eax, es:[bx]
		mov	[bp+var_26], eax
		mov	eax, [si]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_36], eax
		mov	eax, [si+8]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_8A], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_92]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_8E]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_8A]

loc_B591:				; CODE XREF: Goal_ReturnToBase+132j
		mov	es:[bx+16h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0D1h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0D1h]
		les	bx, es:[bx+0D1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6

loc_B5BE:				; CODE XREF: Goal_ReturnToBase+25j
		pop	si
		leave
		retf
Goal_ReturnToBase	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,269L — handler GOAL utilisant la vitesse d'un objet référence (vtable+0x3C+0xC), teste
; un type d'objet (+0x6B==9, probable porte-avions) et une position de formation (+0x14A) :
; probable handler followAlly/formation flying.
; ==============================================================================================
Goal_FollowAllyFormation	proc far		; CODE XREF: Formation_GuidanceSolution+F8P

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
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+145h]
		mov	bx, es:[bx+145h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_28], eax
		mov	eax, [di+4]
		mov	[bp+var_24], eax
		mov	eax, [di+8]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_5C], eax
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+6Bh], 9
		jz	short loc_B62F
		mov	bx, es:[bx+102h]
		cmp	byte ptr [bx+50h], 1
		jnz	short loc_B62F
		cmp	byte_6E4CD, 0
		jz	short loc_B65E

loc_B62F:				; CODE XREF: Goal_FollowAllyFormation+5Aj Goal_FollowAllyFormation+65j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 14Ah
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	di, [bp+var_8]
		mov	eax, es:[di]
		mov	[bp+var_34], eax
		mov	eax, es:[di+4]
		mov	[bp+var_30], eax
		mov	eax, es:[di+8]
		mov	[bp+var_2C], eax
		jmp	short loc_B676
; ���������������������������������������������������������������������������

loc_B65E:				; CODE XREF: Goal_FollowAllyFormation+6Cj
		mov	[bp+var_34], 12C00h
		mov	[bp+var_30], 0FFFF3800h
		mov	[bp+var_2C], 3200h

loc_B676:				; CODE XREF: Goal_FollowAllyFormation+9Bj
		mov	[bp+var_50], 0
		mov	eax, [bp+var_60]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_64]
		neg	eax
		mov	[bp+var_54], eax
		lea	ax, [bp+var_58]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		lea	ax, [bp+var_64]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	ss
		lea	ax, [bp+var_70]
		push	ax
		call	Vector_CrossProduct3D_550B7
		add	sp, 8
		mov	eax, [bp+var_70]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_34]
		or	eax, eax
		jge	short loc_B6D4
		neg	eax

loc_B6D4:				; CODE XREF: Goal_FollowAllyFormation+10Ej
		mov	[bp+var_34], eax
		les	bx, [bp+arg_0]
		mov	di, es:[bx+102h]
		add	di, 12h
		mov	cx, es:[bx+145h]
		add	cx, 12h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_40], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_3C], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_38], eax
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		cmp	[bp+var_C], 0
		jge	short loc_B730
		mov	ax, 1
		jmp	short loc_B732
; ���������������������������������������������������������������������������

loc_B730:				; CODE XREF: Goal_FollowAllyFormation+168j
		xor	ax, ax

loc_B732:				; CODE XREF: Goal_FollowAllyFormation+16Dj
		or	al, al
		jz	short loc_B741
		mov	eax, [bp+var_34]
		neg	eax
		mov	[bp+var_34], eax

loc_B741:				; CODE XREF: Goal_FollowAllyFormation+173j
		mov	eax, [bp+var_58]
		mov	edx, [bp+var_34]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_54]
		mov	edx, [bp+var_34]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_50]
		mov	edx, [bp+var_34]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_64]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_64], eax
		mov	eax, [bp+var_60]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_5C]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_4C]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_48]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_58]
		mov	[si], eax
		mov	eax, [bp+var_54]
		mov	[si+4],	eax
		mov	eax, [bp+var_50]
		mov	[si+8],	eax
		mov	eax, [bp+var_64]
		add	[si], eax
		mov	eax, [bp+var_60]
		add	[si+4],	eax
		mov	eax, [bp+var_5C]
		add	[si+8],	eax
		mov	eax, [bp+var_4C]
		add	[si], eax
		mov	eax, [bp+var_48]
		add	[si+4],	eax
		mov	eax, [bp+var_44]
		add	[si+8],	eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+145h]
		mov	eax, [bx+1Ah]
		mov	[bp+var_4], eax
		push	0
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_7C], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_78], eax
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	[bp+var_74], eax
		lea	ax, [bp+var_7C]
		push	ax
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+145h]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_1C]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		add	eax, [si+8]
		cmp	eax, 1F400h
		jge	short loc_B8BD
		mov	dword ptr [si+8], 1F400h

loc_B8BD:				; CODE XREF: Goal_FollowAllyFormation+2F2j
		pop	di
		pop	si
		leave
		retf
Goal_FollowAllyFormation	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 31 lignes (methode de vtable, DATA XREF seg339) - JAMAIS DOCUMENTEE AVANT. Destructeur
; generique pour un petit objet avec reference faible embarquee a +0x13 : invalide cette
; reference (WeakRef_InvalidateFar_3A432) si le pointeur n'est pas nul, puis libere
; conditionnellement l'objet lui-meme (Memory_TypedFree_5C7B6, tag 0x5C44) si le bit0 de
; l'argument est pose - meme motif que le destructeur de la classe de reference notifiable
; (ovr229) mais sur une classe distincte (offset de reference different : +0x13 ici contre
; +0x08/+0x13 selon les champs pour l'autre classe). loc_B8C1 et loc_B90A sont
; structurellement identiques (code dupplique), rattaches a deux emplacements de vtable
; differents (seg339:0312 et seg339:0326) - probablement deux classes soeurs partageant un
; destructeur trivial generique.
; ==============================================================================================
GenericSmallObject_Destructor_B8C1:				; DATA XREF: seg339:0312o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_B907
		mov	ax, [bp+6]
		add	ax, 13h
		push	word ptr [bp+8]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_B907
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_B907:				; CODE XREF: seg005:15D0j seg005:15E8j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 31 lignes (methode de vtable, DATA XREF seg339) - JAMAIS DOCUMENTEE AVANT. Destructeur
; generique pour un petit objet avec reference faible embarquee a +0x13 : invalide cette
; reference (WeakRef_InvalidateFar_3A432) si le pointeur n'est pas nul, puis libere
; conditionnellement l'objet lui-meme (Memory_TypedFree_5C7B6, tag 0x5C44) si le bit0 de
; l'argument est pose - meme motif que le destructeur de la classe de reference notifiable
; (ovr229) mais sur une classe distincte (offset de reference different : +0x13 ici contre
; +0x08/+0x13 selon les champs pour l'autre classe). loc_B8C1 et loc_B90A sont
; structurellement identiques (code dupplique), rattaches a deux emplacements de vtable
; differents (seg339:0312 et seg339:0326) - probablement deux classes soeurs partageant un
; destructeur trivial generique.
; ==============================================================================================
GenericSmallObject_Destructor_B90A:				; DATA XREF: seg339:0326o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_B950
		mov	ax, [bp+6]
		add	ax, 13h
		push	word ptr [bp+8]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_B950
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_B950:				; CODE XREF: seg005:1619j seg005:1631j
		pop	si
		leave
		retf
seg005		ends
