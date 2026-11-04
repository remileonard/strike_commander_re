seg010		segment	para public 'CODE' use16
		assume cs:seg010
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61E0		proc far

var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[bp+var_3], al
		push	8
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_621D
		mov	word ptr [di], 4F8h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 4FCh
		mov	al, [bp+var_3]
		mov	[di+4], al
		mov	word ptr [di+5], 0
		mov	ax, di
		jmp	short loc_621F

loc_621D:
		mov	ax, di

loc_621F:
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_36616
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_61E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6232		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6243

loc_6243:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jz	short loc_625F
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_6243

loc_625F:
		cmp	[bp+var_2], 0
		jz	short loc_6273
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6

loc_6273:
		pop	si
		leave
		retf
sub_6232		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6276		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_629A

loc_6287:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		mov	[bp+var_2], 0

loc_629A:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_6287
		mov	word ptr [si+4], 0
		pop	si
		leave
		retf
sub_6276		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62B3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_62D5

loc_62C4:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_62D5
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf

loc_62D5:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_62C4
		xor	ax, ax
		pop	si
		leave
		retf
sub_62B3		endp

; START OF FUNCTION CHUNK FOR sub_62B3
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_62B3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Gameflow_CheckSpriteRequirements_3604 (sub_3604 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-22. Évalue un chunk REQU (paires condition, drapeau [partie+0FDh+n]) : visible
; au départ ; 0 n → caché si le drapeau n est posé ; 1 n → caché s'il ne l'est pas ; 2 n → si
; le drapeau n n'est pas posé, la condition suivante est ignorée ; 3 n → si le drapeau n est
; posé, la condition suivante est ignorée ; autre valeur ignorée. Appelée par
; Gameflow_BuildScene_4A60B. GAMEFLOW_SYSTEM.md § 4.
; ==============================================================================================
Gameflow_CheckSpriteRequirements_62EE		proc far

var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_1], 1
		mov	cl, 0
		xor	si, si
		jmp	loc_639A

loc_6307:
		mov	bx, si
		mov	al, [bx+di]
		mov	[bp+var_2], al
		mov	bx, di
		mov	al, [bx+si+1]
		mov	[bp+var_3], al
		mov	al, [bp+var_2]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		ja	short loc_6397
		shl	bx, 1
		jmp	cs:off_63B1[bx]	; switch jump

loc_6329:
		mov	al, [bp+var_3]
		mov	ah, 0
		mov	bx, dx
		add	bx, ax
		cmp	byte ptr [bx+0FEh], 0
		jz	short loc_6345
		mov	al, cl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6345
		mov	[bp+var_1], 0

loc_6345:
		mov	cl, 0
		jmp	short loc_6397

loc_6349:
		mov	al, [bp+var_3]
		mov	ah, 0
		mov	bx, dx
		add	bx, ax
		mov	al, [bx+0FEh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6368
		mov	al, cl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6368
		mov	[bp+var_1], 0

loc_6368:
		mov	cl, 0
		jmp	short loc_6397

loc_636C:
		mov	al, [bp+var_3]
		mov	ah, 0
		mov	bx, dx
		add	bx, ax
		mov	al, [bx+0FEh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6381
		mov	cl, 1

loc_6381:
		jmp	short loc_6397

loc_6383:
		mov	al, [bp+var_3]
		mov	ah, 0
		mov	bx, dx
		add	bx, ax
		cmp	byte ptr [bx+0FEh], 0
		jz	short loc_6395
		mov	cl, 1

loc_6395:
		jmp	short loc_6397

loc_6397:
		add	si, 2

loc_639A:
		mov	al, [bp+arg_2]
		mov	ah, 0
		cmp	ax, si
		jle	short loc_63A6
		jmp	loc_6307

loc_63A6:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Gameflow_CheckSpriteRequirements_62EE		endp

; START OF FUNCTION CHUNK FOR Gameflow_CheckSpriteRequirements_62EE
		pop	di
		pop	si
		leave
		retf
off_63B1	dw offset loc_6329
		dw offset loc_6349
		dw offset loc_636C
		dw offset loc_6383
; END OF FUNCTION CHUNK FOR Gameflow_CheckSpriteRequirements_62EE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-02. Interpréteur des scripts EFCT de GAMEFLOW.IFF / GAMEFLO2.IFF, même
; structure que Gameflow_RunScriptPairs_36CF d'OPTEST (blocs conditionnels, OR_GROUP, liste
; des tests comptés pendant un saut inchangée : 9, 10, 20, 21, 22, 28, 32, 35, 37). 46
; commandes (cmp bx, 2Dh, table off_684C) au lieu de 39 : 0 à 38 comme OPTEST disquette,
; champs de la partie décalés de +1 ; 39 à 42 comme le CD (IF_RESULT_4 à 6 : [+985] à [+987] ;
; 42 teste [+983], 7e valeur de STAT) ; 43 = second écran d'armement
; (Gameflow_WeaponLoadoutAlt_58DEB, test comme 22) ; 44 n = remet le pilote n (n < 8) au
; tableau ([+676 + n × 26] = 1, inverse de REMOVE_PILOT) ; 45 = second écran des marques de
; victoires (Gameflow_ShowKillMarksAlt_56D57, même condition que 26). Commande 32
; (IF_MISSION_SUCCESS) : en plus, si code de sortie [+249] = 2 et drapeau 88 ([+342]) = 1 →
; [+983] = 1. Commande 16 : fichier gensave.tm1 au lieu de gensave.tmp.
; analysis/topt/README.md § 6.
; ==============================================================================================
Gameflow_RunScriptPairs_63B9		proc far

var_A8		= word ptr -0A8h
var_58		= word ptr -58h
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0A8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		mov	[bp+var_4], 0
		mov	[bp+var_5], 0
		xor	di, di
		jmp	loc_683C

loc_63DE:
		cmp	[bp+var_3], 0
		jz	short loc_63E7
		jmp	loc_6848

loc_63E7:
		mov	bx, [bp+arg_4]
		add	bx, di
		mov	al, [bx]
		mov	[bp+var_6], al
		mov	bx, [bp+arg_4]
		mov	al, [bx+di+1]
		mov	[bp+var_7], al
		cmp	[bp+var_2], 0
		jz	short loc_6450
		cmp	[bp+var_6], 9
		jz	short loc_6441
		cmp	[bp+var_6], 0Ah
		jz	short loc_6441
		cmp	[bp+var_6], 14h
		jz	short loc_6441
		cmp	[bp+var_6], 15h
		jz	short loc_6441
		cmp	[bp+var_6], 16h
		jz	short loc_6441
		cmp	[bp+var_6], 1Ch
		jz	short loc_6441
		cmp	[bp+var_6], 20h
		jz	short loc_6441
		cmp	[bp+var_6], 23h
		jz	short loc_6441
		cmp	[bp+var_6], 25h
		jz	short loc_6441
		push	41Ch
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_6441:
		cmp	[bp+var_5], 0
		jnz	short loc_644D
		mov	[bp+var_2], 0
		jmp	short loc_6450

loc_644D:
		dec	[bp+var_5]

loc_6450:
		cmp	[bp+var_6], 1Eh
		jnz	short loc_646C
		cmp	[bp+var_4], 0
		jnz	short loc_6469
		mov	al, [bp+var_1]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_1], al

loc_6469:
		jmp	loc_6839

loc_646C:
		cmp	[bp+var_6], 1Fh
		jnz	short loc_6484
		cmp	[bp+var_4], 0
		jnz	short loc_647E
		mov	[bp+var_1], 0
		jmp	short loc_6481

loc_647E:
		dec	[bp+var_4]

loc_6481:
		jmp	loc_6839

loc_6484:
		cmp	[bp+var_6], 21h
		jnz	short loc_6497
		mov	[bp+var_2], 1
		mov	al, [bp+var_7]
		mov	[bp+var_5], al
		jmp	loc_6839

loc_6497:
		cmp	[bp+var_1], 0
		jz	short loc_64E2
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_64E2
		cmp	[bp+var_6], 9
		jz	short loc_64DC
		cmp	[bp+var_6], 0Ah
		jz	short loc_64DC
		cmp	[bp+var_6], 14h
		jz	short loc_64DC
		cmp	[bp+var_6], 15h
		jz	short loc_64DC
		cmp	[bp+var_6], 16h
		jz	short loc_64DC
		cmp	[bp+var_6], 1Ch
		jz	short loc_64DC
		cmp	[bp+var_6], 20h
		jz	short loc_64DC
		cmp	[bp+var_6], 23h
		jz	short loc_64DC
		cmp	[bp+var_6], 25h
		jnz	short loc_64DF

loc_64DC:
		inc	[bp+var_4]

loc_64DF:
		jmp	loc_6839

loc_64E2:
		mov	al, [bp+var_6]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 2Dh
		jbe	short loc_64F1
		jmp	loc_6837

loc_64F1:
		shl	bx, 1
		jmp	cs:off_684C[bx]	; switch jump

loc_64F8:
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	sub_47883
		add	sp, 4
		jmp	loc_6839

loc_6508:
		mov	al, [bp+var_7]
		mov	[si+0FDh], al
		mov	byte ptr [si+0E4h], 1
		jmp	loc_6839

loc_6517:
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	sub_47888
		add	sp, 4
		jmp	loc_6839

loc_6527:
		mov	al, [bp+var_7]
		mov	[si+0FAh], al
		mov	byte ptr [si+0E9h], 1
		jmp	loc_6839

loc_6536:
		jmp	loc_6839

loc_6539:
		mov	al, [bp+var_7]
		mov	[si+0FAh], al
		jmp	loc_6839

loc_6543:
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	bx, ax
		mov	byte ptr [bx+si+0FEh], 1
		jmp	loc_6839

loc_6552:
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	bx, ax
		mov	byte ptr [bx+si+0FEh], 0
		jmp	loc_6839

loc_6561:
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	sub_47897
		add	sp, 4
		jmp	loc_6839

loc_6571:
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+si+0FEh], 0
		jz	short loc_6583
		mov	[bp+var_1], 1

loc_6583:
		jmp	loc_6839

loc_6586:
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+si+0FEh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_659B
		mov	[bp+var_1], 1

loc_659B:
		jmp	loc_6839

loc_659E:
		jmp	loc_6839

loc_65A1:
		mov	al, [bp+var_7]
		mov	[si+0FAh], al
		jmp	loc_6839

loc_65AB:
		mov	al, [bp+var_7]
		mov	[si+0FCh], al
		jmp	loc_6839

loc_65B5:
		mov	byte ptr [si+0E9h], 1
		jmp	loc_6839

loc_65BD:
		mov	byte ptr [si+0E9h], 2
		jmp	loc_6839

loc_65C5:
		lea	ax, [bp+var_A8]
		push	ax
		push	si
		call	sub_47916
		add	sp, 4
		cmp	byte ptr [bp+var_A8], 0
		jz	short loc_660D
		lea	ax, [bp+var_A8]
		push	ax
		push	si
		call	sub_47907
		add	sp, 4
		push	ds
		push	offset aTm1
		push	ds
		push	offset aGensave
		push	ds
		push	offset a_
		lea	ax, [bp+var_58]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_58]
		push	ax
		push	si
		call	sub_47907
		add	sp, 4

loc_660D:
		jmp	loc_6839

loc_6610:
		push	0
		push	si
		call	sub_4791B
		add	sp, 4
		cmp	byte ptr [si+94h], 0
		jz	short loc_6627
		mov	byte ptr [si+0E9h], 3

loc_6627:
		jmp	loc_6839

loc_662A:
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	sub_47A4A
		add	sp, 4
		jmp	loc_6839

loc_663A:
		push	si
		call	sub_479B9
		add	sp, 2
		jmp	loc_6839

loc_6646:
		mov	al, [si+35Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6654
		mov	[bp+var_1], 1

loc_6654:
		jmp	loc_6839

loc_6657:
		cmp	byte ptr [si+35Ch], 0
		jz	short loc_6662
		mov	[bp+var_1], 1

loc_6662:
		jmp	loc_6839

loc_6665:
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	sub_479F4
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_667C
		mov	[bp+var_1], 1

loc_667C:
		jmp	loc_6839

loc_667F:
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	sub_47A08
		add	sp, 4
		jmp	loc_6839

loc_668F:
		mov	al, [bp+var_7]
		mov	[si+0EAh], al
		mov	al, [si+0EAh]
		mov	ah, 0
		push	ax
		call	sub_2D974
		add	sp, 2
		jmp	loc_6839

loc_66A8:
		push	si
		call	sub_47A0D
		add	sp, 2
		jmp	loc_6839

loc_66B4:
		cmp	byte ptr [si+0EEh], 0
		jz	short loc_66CB
		cmp	byte ptr [si+0F9h], 2
		jz	short loc_66CB
		push	si
		call	sub_479AF
		add	sp, 2

loc_66CB:
		jmp	loc_6839

loc_66CE:
		cmp	[bp+var_7], 8
		jnb	short loc_66E6
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+2A4h], 0

loc_66E6:
		jmp	loc_6839

loc_66E9:
		push	si
		call	sub_479AA
		add	sp, 2
		or	al, al
		jz	short loc_66FA
		mov	[bp+var_3], 1

loc_66FA:
		jmp	loc_6839

loc_66FD:
		jmp	loc_6839

loc_6700:
		jmp	loc_6839

loc_6703:
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+si+1FEh], 1
		jz	short loc_6715
		mov	[bp+var_1], 1

loc_6715:
		cmp	byte ptr [si+0F9h], 2
		jnz	short loc_6728
		cmp	byte ptr [si+156h], 1
		jnz	short loc_6728
		mov	byte ptr [si+3D7h], 1

loc_6728:
		jmp	loc_6839

loc_672B:
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	sub_479A5
		add	sp, 4
		jmp	loc_6839

loc_673B:
		cmp	word ptr [si+0EBh], 0
		jnz	short loc_6742

loc_6742:
		mov	[bp+var_1], 1
		jmp	loc_6839

loc_6749:
		cmp	word ptr [si+0EBh], 0
		jz	short loc_6780
		mov	byte ptr [si+0EAh], 8
		mov	al, [si+0EAh]
		mov	ah, 0
		push	ax
		call	sub_2D974
		add	sp, 2
		mov	[bp+var_8], 0FDh
		cmp	byte ptr [si+0F9h], 2
		jz	short loc_6773
		mov	[bp+var_8], 0FCh

loc_6773:
		mov	al, [bp+var_8]
		push	ax
		push	si
		call	sub_47883
		add	sp, 4

loc_6780:
		jmp	loc_6839

loc_6783:
		mov	al, [si+3D8h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6791
		mov	[bp+var_1], 1

loc_6791:
		jmp	loc_6839

loc_6794:
		mov	al, [bp+var_7]
		mov	[si+3DCh], al
		mov	al, [si+3DCh]
		push	ax
		call	Music_PlayGameflowTune_2D9E3
		add	sp, 2
		jmp	loc_6839

loc_67AB:
		mov	al, [si+3D9h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_67B9
		mov	[bp+var_1], 1

loc_67B9:
		jmp	short loc_6839

loc_67BB:
		mov	al, [si+3DAh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_67C9
		mov	[bp+var_1], 1

loc_67C9:
		jmp	short loc_6839

loc_67CB:
		mov	al, [si+3DBh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_67D9
		mov	[bp+var_1], 1

loc_67D9:
		jmp	short loc_6839

loc_67DB:
		mov	al, [si+3D7h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_67E9
		mov	[bp+var_1], 1

loc_67E9:
		jmp	short loc_6839

loc_67EB:
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	sub_479FE
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6802
		mov	[bp+var_1], 1

loc_6802:
		jmp	short loc_6839

loc_6804:
		cmp	[bp+var_7], 8
		jnb	short loc_681C
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+2A4h], 1

loc_681C:
		jmp	short loc_6839

loc_681E:
		cmp	byte ptr [si+0EEh], 0
		jz	short loc_6835
		cmp	byte ptr [si+0F9h], 2
		jz	short loc_6835
		push	si
		call	sub_479B4
		add	sp, 2

loc_6835:
		jmp	short loc_6839

loc_6837:
		jmp	short loc_6839

loc_6839:
		add	di, 2

loc_683C:
		mov	al, [bp+arg_2]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_6848
		jmp	loc_63DE

loc_6848:
		pop	di
		pop	si
		leave
		retf
Gameflow_RunScriptPairs_63B9		endp

; START OF FUNCTION CHUNK FOR Gameflow_RunScriptPairs_63B9
off_684C	dw offset loc_64F8
		dw offset loc_6508
		dw offset loc_6517
		dw offset loc_6527
		dw offset loc_6536
		dw offset loc_6539
		dw offset loc_6543
		dw offset loc_6552
		dw offset loc_6561
		dw offset loc_6571
		dw offset loc_6586
		dw offset loc_659E
		dw offset loc_65A1
		dw offset loc_65AB
		dw offset loc_65B5
		dw offset loc_65BD
		dw offset loc_65C5
		dw offset loc_6610
		dw offset loc_662A
		dw offset loc_663A
		dw offset loc_6646
		dw offset loc_6657
		dw offset loc_6665
		dw offset loc_667F
		dw offset loc_668F
		dw offset loc_66A8
		dw offset loc_66B4
		dw offset loc_66CE
		dw offset loc_6837
		dw offset loc_66E9
		dw offset loc_66FD
		dw offset loc_6700
		dw offset loc_6703
		dw offset loc_6837
		dw offset loc_672B
		dw offset loc_673B
		dw offset loc_6749
		dw offset loc_6783
		dw offset loc_6794
		dw offset loc_67AB
		dw offset loc_67BB
		dw offset loc_67CB
		dw offset loc_67DB
		dw offset loc_67EB
		dw offset loc_6804
		dw offset loc_681E
; END OF FUNCTION CHUNK FOR Gameflow_RunScriptPairs_63B9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68A8		proc far

var_11C		= word ptr -11Ch
var_BF		= dword ptr -0BFh
var_BB		= dword ptr -0BBh
var_B7		= dword ptr -0B7h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_74		= word ptr -74h
var_6A		= word ptr -6Ah
var_55		= word ptr -55h
var_47		= word ptr -47h
var_3A		= word ptr -3Ah
var_34		= byte ptr -34h
var_1F		= byte ptr -1Fh
var_14		= byte ptr -14h
var_13		= word ptr -13h
var_11		= word ptr -11h
var_F		= word ptr -0Fh
var_D		= word ptr -0Dh
var_B		= word ptr -0Bh
var_6		= byte ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 11Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+0FBh]
		mov	byte_4EAAB, al
		mov	byte_4F55C, 0
		cmp	byte ptr [si+0E4h], 0
		jz	short loc_68DD
		mov	byte ptr [si+0E4h], 0
		push	si
		push	cs
		call	near ptr sub_6276
		add	sp, 2
		push	si
		call	sub_4787E
		add	sp, 2

loc_68DD:
		mov	al, [si+0FDh]
		mov	[bp+var_2], al
		mov	di, [si+0E5h]
		lea	ax, [bp+var_11C]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_11C], 480h
		mov	[bp+var_BB], 100h
		mov	[bp+var_BF], 0
		mov	[bp+var_11C], 498h
		mov	[bp+var_A0], 0
		xor	ax, ax
		mov	[bp+var_A2], ax
		movsx	eax, ax
		mov	[bp+var_B7], eax
		push	di
		push	word_4D36E
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_74]
		push	ax
		call	sub_7A04
		add	sp, 0Ah
		mov	[bp+var_11C], 4B0h
		mov	[bp+var_74], 4C8h
		mov	[bp+var_6A], 4E8h
		mov	[bp+var_11], 1E4h
		xor	ax, ax
		mov	[bp+var_D], ax
		mov	[bp+var_F], ax
		mov	[bp+var_11], 47Ch
		push	100h
		push	0
		lea	ax, [bp+var_B]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_1F], 0
		mov	[bp+var_14], 0
		mov	al, [bp+var_2]
		mov	[bp+var_34], al
		mov	[bp+var_6], 0FFh
		mov	[bp+var_13], di
		mov	[bp+var_4], 0
		jmp	short loc_69A1

loc_698D:
		mov	bx, [bp+var_4]
		mov	al, [bx+4]
		push	ax
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_8543
		add	sp, 4

loc_69A1:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_698D
		push	0
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_870B
		add	sp, 4
		cmp	[bp+var_6], 0FFh
		jz	short loc_69CE
		mov	al, [bp+var_6]
		mov	[si+0EAh], al

loc_69CE:
		mov	al, [si+0EAh]
		mov	ah, 0
		push	ax
		call	sub_2D974
		add	sp, 2
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_9243
		add	sp, 2
		mov	[bp+var_1], al
		lea	ax, [bp+var_B]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_11]
		push	ax
		nop
		push	cs
		call	near ptr sub_6EDA
		add	sp, 4
		mov	[bp+var_74], 44Ch
		mov	[bp+var_6A], 46Ch
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	byte_4F77A, 0
		cmp	[bp+var_47], 0
		jz	short loc_6A3D
		mov	ax, [bp+var_47]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	[bp+var_47]
		call	sub_39C
		add	sp, 2
		jmp	short loc_6A3D

loc_6A3D:
		push	2
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_77A1
		add	sp, 4
		lea	ax, [bp+var_55]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		mov	[bp+var_11C], 498h
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_11C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	al, [bp+var_1]
		push	ax
		push	si
		push	cs
		call	near ptr sub_62B3
		add	sp, 4
		mov	bx, ax
		push	word ptr [bx+5]
		mov	al, [bp+var_1]
		push	ax
		push	si
		push	cs
		call	near ptr sub_62B3
		add	sp, 4
		mov	bx, ax
		mov	al, [bx+7]
		push	ax
		push	si
		push	cs
		call	near ptr Gameflow_RunScriptPairs_63B9
		add	sp, 6
		cmp	byte ptr [si+0E4h], 0
		jz	short loc_6AC7
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4

loc_6AC7:
		pop	di
		pop	si
		leave
		retf
sub_68A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6ACB		proc far

var_5A		= word ptr -5Ah
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0F9h], 1
		mov	byte ptr [si+3DCh], 0FFh
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	byte ptr [bp+var_A], 0
		mov	byte ptr [bp+var_A+1], 0
		mov	[bp+var_8], 0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_FillRange_34CAC
		add	sp, 8
		push	0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		lea	ax, [bp+var_6]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2

loc_6B43:
		mov	[bp+var_1], 1
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		mov	al, [si+0E9h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_6B5F
		jmp	loc_6C83

loc_6B5F:
		shl	bx, 1
		jmp	cs:off_6E34[bx]	; switch jump

loc_6B66:
		push	si
		call	sub_4789C
		add	sp, 2
		mov	[si+0F9h], al
		mov	al, [si+0F9h]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_6BCF
		shl	bx, 1
		jmp	cs:off_6E2A[bx]	; switch jump

loc_6B88:
		jmp	short loc_6BCF

loc_6B8A:
		push	21h
		push	si
		call	sub_47888
		add	sp, 4
		mov	[bp+var_2], 1
		jmp	short loc_6BCF

loc_6B9B:
		push	ds
		push	offset aTm1_1
		push	ds
		push	offset aGensave
		push	ds
		push	offset a_
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_5A]
		push	ax
		push	si
		call	sub_47902
		add	sp, 4
		mov	[bp+var_1], 0
		jmp	short loc_6BCF

loc_6BC6:
		mov	byte ptr [si+0E8h], 2
		mov	[bp+var_2], 1

loc_6BCF:
		jmp	loc_6C93

loc_6BD2:
		cmp	byte ptr [si+0E8h], 0
		jnz	short loc_6BEB
		call	sub_47CE5
		mov	al, byte_4F55C
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_3], al

loc_6BEB:
		mov	[bp+var_2], 1
		jmp	loc_6C93

loc_6BF2:
		mov	al, [si+0FCh]
		mov	[si+0FBh], al
		mov	byte ptr [si+0FCh], 0FFh
		jmp	loc_6C93

loc_6C02:
		push	2Eh
		mov	ax, si
		add	ax, 94h
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	di, ax
		push	61h
		push	di
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_6C3F
		mov	byte_4EEA4, 0
		mov	ax, si
		add	ax, 94h
		push	ax
		push	si
		call	sub_47902
		add	sp, 4
		mov	[bp+var_1], 0
		jmp	short loc_6C5C

loc_6C3F:
		mov	byte_4EEA4, 1
		push	si
		call	sub_4786F
		add	sp, 2
		mov	ax, si
		add	ax, 94h
		push	ax
		push	si
		call	sub_4790C
		add	sp, 4

loc_6C5C:
		push	ds
		push	offset aTm1
		push	ds
		push	offset aGensave
		push	ds
		push	offset a_
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_5A]
		push	ax
		push	si
		call	sub_47907
		add	sp, 4
		jmp	short loc_6C93

loc_6C83:
		push	25h
		push	word_48BCC
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4
		jmp	short loc_6C93

loc_6C93:
		mov	byte ptr [si+0E9h], 4
		cmp	[bp+var_2], 0
		jnz	short loc_6CA1
		jmp	loc_6D8D

loc_6CA1:
		mov	[bp+var_4], 1
		cmp	byte ptr [si+0E8h], 1
		jnz	short loc_6CB2
		mov	byte ptr [bp+var_6], 0
		jmp	short loc_6CC2

loc_6CB2:
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	sub_47975
		add	sp, 4
		mov	byte ptr [bp+var_6], al

loc_6CC2:
		mov	al, byte ptr [bp+var_6]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 5
		jbe	short loc_6CD1
		jmp	loc_6D81

loc_6CD1:
		shl	bx, 1
		jmp	cs:off_6E1E[bx]	; switch jump

loc_6CD8:
		push	si
		call	sub_4786F
		add	sp, 2
		cmp	byte ptr [si+0E8h], 1
		jz	short loc_6CF1
		push	si
		call	sub_47970
		add	sp, 2

loc_6CF1:
		jmp	loc_6D81

loc_6CF4:
		push	ds
		push	offset aTm1
		push	ds
		push	offset aGensave
		push	ds
		push	offset a_
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_5A]
		push	ax
		push	si
		call	sub_47902
		add	sp, 4
		mov	[bp+var_1], 0
		jmp	short loc_6D81

loc_6D1F:
		cmp	byte ptr [si+94h], 0
		jz	short loc_6D31
		mov	[bp+var_1], 0
		mov	byte ptr [si+0E9h], 3
		jmp	short loc_6D35

loc_6D31:
		mov	[bp+var_4], 0

loc_6D35:
		jmp	short loc_6D81

loc_6D37:
		push	si
		call	sub_47A7F
		add	sp, 2
		or	al, al
		jz	short loc_6D54
		mov	byte ptr [si+0FAh], 0FEh
		mov	byte ptr [si+0E9h], 1
		mov	[bp+var_1], 0
		jmp	short loc_6D58

loc_6D54:
		mov	[bp+var_4], 0

loc_6D58:
		jmp	short loc_6D81

loc_6D5A:
		push	si
		call	sub_183F8
		add	sp, 2
		mov	[bp+var_4], 0
		jmp	short loc_6D81

loc_6D69:
		call	sub_47CE5
		mov	al, byte_4F55C
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_3], al
		mov	[bp+var_4], 0
		jmp	short loc_6D81

loc_6D81:
		mov	al, [bp+var_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6D8D
		jmp	loc_6CA1

loc_6D8D:
		mov	byte ptr [si+0E4h], 1
		cmp	[bp+var_1], 0
		jz	short loc_6DE6
		push	si
		call	sub_47879
		add	sp, 2
		mov	ax, si
		add	ax, 8
		push	ax
		mov	al, [si+7]
		push	ax
		push	si
		push	cs
		call	near ptr Gameflow_RunScriptPairs_63B9
		add	sp, 6
		cmp	byte ptr [si+0E9h], 4
		jz	short loc_6DC1
		cmp	byte ptr [si+0E9h], 2
		jnz	short loc_6DE6

loc_6DC1:
		push	ds
		push	offset aTm1
		push	ds
		push	offset aGensave
		push	ds
		push	offset a_
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_5A]
		push	ax
		push	si
		call	sub_47907
		add	sp, 4

loc_6DE6:
		jmp	short loc_6DF0

loc_6DE8:
		push	si
		push	cs
		call	near ptr sub_68A8
		add	sp, 2

loc_6DF0:
		cmp	byte ptr [si+0E9h], 4
		jz	short loc_6DE8
		cmp	byte ptr [si+0E9h], 1
		jz	short loc_6E01
		jmp	loc_6B43

loc_6E01:
		cmp	byte ptr [si+0FAh], 0FEh
		jz	short loc_6E11
		push	si
		call	sub_478A1
		add	sp, 2

loc_6E11:
		push	si
		call	sub_478A6
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_6ACB		endp

; START OF FUNCTION CHUNK FOR sub_6ACB
off_6E1E	dw offset loc_6CD8
		dw offset loc_6CF4
		dw offset loc_6D1F
		dw offset loc_6D37
		dw offset loc_6D5A
		dw offset loc_6D69
off_6E2A	dw offset loc_6B88
		dw offset loc_6B88
		dw offset loc_6B8A
		dw offset loc_6B9B
		dw offset loc_6BC6
off_6E34	dw offset loc_6BD2
		dw offset loc_6B66
		dw offset loc_6BF2
		dw offset loc_6C02
; END OF FUNCTION CHUNK FOR sub_6ACB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E3C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6E5A

loc_6E4D:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_6E5A
		jmp	short loc_6E6B

loc_6E5A:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_6E4D

loc_6E6B:
		cmp	[bp+var_2], 0
		jz	short loc_6E79
		mov	bx, [bp+var_2]
		mov	ax, [bx+5]
		jmp	short loc_6E7B

loc_6E79:
		xor	ax, ax

loc_6E7B:
		pop	si
		leave
		retf
sub_6E3C		endp

; START OF FUNCTION CHUNK FOR sub_6E3C
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_6E3C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E81		proc far

var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[bp+var_3], al
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	7
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_6EC5
		mov	word ptr [di], 4F8h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 448h
		mov	al, [bp+var_3]
		mov	[di+4], al
		mov	ax, [bp+var_6]
		mov	[di+5], ax
		mov	ax, di
		jmp	short loc_6EC7

loc_6EC5:
		mov	ax, di

loc_6EC7:
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_36616
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_6E81		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EDA		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6F4B
		mov	word ptr [si], 47Ch
		mov	[bp+var_2], 0
		jmp	short loc_6F1E

loc_6EF7:
		mov	bx, [bp+var_2]
		push	word ptr [bx+5]
		mov	bx, [bp+var_2]
		mov	bx, [bx+5]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 2
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		mov	[bp+var_2], 0

loc_6F1E:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_6EF7
		mov	word ptr [si], 1E4h
		push	si
		call	sub_36702
		add	sp, 2
		test	di, 1
		jz	short loc_6F4B
		push	si
		call	sub_39C
		add	sp, 2

loc_6F4B:
		pop	di
		pop	si
		leave
		retf
sub_6EDA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F4F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6F71
		mov	word ptr [si], 448h
		test	di, 1
		jz	short loc_6F71
		push	si
		call	sub_39C
		add	sp, 2

loc_6F71:
		pop	di
		pop	si
		pop	bp
		retf
sub_6F4F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F75		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6FF1
		mov	word ptr [si], 44Ch
		mov	word ptr [si+0Ah], 46Ch
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	byte_4F77A, 0
		cmp	word ptr [si+2Dh], 0
		jz	short loc_6FB9
		mov	ax, [si+2Dh]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	word ptr [si+2Dh]
		call	sub_39C
		add	sp, 2
		jmp	short loc_6FB9

loc_6FB9:
		push	2
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	sub_77A1
		add	sp, 4
		mov	ax, si
		add	ax, 1Fh
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		push	si
		call	Scene_Destruct_33D48
		add	sp, 4
		test	di, 1
		jz	short loc_6FF1
		push	si
		call	sub_39C
		add	sp, 2

loc_6FF1:
		pop	di
		pop	si
		pop	bp
		retf
sub_6F75		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FF5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_6FF5		endp

; ----------------------------------------------------------------------

sub_6FFD		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_33D8B
sub_6FFD		endp

; ----------------------------------------------------------------------

sub_7009		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_33DAD
sub_7009		endp

; ----------------------------------------------------------------------

sub_7015		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_33D83
sub_7015		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7021		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7057
		mov	word ptr [si], 498h
		push	si
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		test	di, 1
		jz	short loc_7057
		push	si
		call	sub_39C
		add	sp, 2

loc_7057:
		pop	di
		pop	si
		pop	bp
		retf
sub_7021		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_705B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_706D
		jmp	loc_712B

loc_706D:
		mov	word ptr [si], 4B0h
		mov	word ptr [si+0A8h], 4C8h
		mov	word ptr [si+0B2h], 4E8h
		mov	ax, si
		add	ax, 111h
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		mov	ax, si
		add	ax, 10Bh
		push	ax
		nop
		push	cs
		call	near ptr sub_6EDA
		add	sp, 4
		mov	word ptr [si+0A8h], 44Ch
		mov	word ptr [si+0B2h], 46Ch
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	byte_4F77A, 0
		cmp	word ptr [si+0D5h], 0
		jz	short loc_70D6
		mov	ax, [si+0D5h]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	word ptr [si+0D5h]
		call	sub_39C
		add	sp, 2
		jmp	short loc_70D6

loc_70D6:
		push	2
		mov	ax, si
		add	ax, 0E2h
		push	ax
		call	sub_77A1
		add	sp, 4
		mov	ax, si
		add	ax, 0C7h
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		mov	word ptr [si], 498h
		push	si
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		test	di, 1
		jz	short loc_712B
		push	si
		call	sub_39C
		add	sp, 2

loc_712B:
		pop	di
		pop	si
		pop	bp
		retf
sub_705B		endp

; ----------------------------------------------------------------------

sub_712F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_33D8B
sub_712F		endp

; ----------------------------------------------------------------------

sub_713B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_33DAD
sub_713B		endp

; ----------------------------------------------------------------------

sub_7147		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_33D83
sub_7147		endp

; ----------------------------------------------------------------------

sub_7153		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FF58h
		nop
		nop
		jmp	sub_705B
sub_7153		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7160		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7182
		mov	word ptr [si], 4F8h
		test	di, 1
		jz	short loc_7182
		push	si
		call	sub_39C
		add	sp, 2

loc_7182:
		pop	di
		pop	si
		pop	bp
		retf
sub_7160		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7186		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_71B9
		mov	word ptr [si], 4FCh
		cmp	word ptr [si+5], 0
		jz	short loc_71AA
		push	word ptr [si+5]
		call	sub_39C
		add	sp, 2

loc_71AA:
		test	di, 1
		jz	short loc_71B9
sub_7186		endp
seg010		ends
