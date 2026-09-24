seg015		segment	byte public 'CODE' use16
		assume cs:seg015
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,120L — PAS un portrait (aucune image/blit) malgre l ancien nom : affiche une LEGENDE
; TEXTE a l ecran en 1 ou 2 lignes, une etape par appel (typewriter). VERIFIE (2026-09-12,
; trace ASM directe) : ce widget est lie au LIBELLE DE VUE ("Chase Plane"/"External
; View"/"Target View" -- ces chaines sont ecrites dans word_72A94 par Mission_TriggerEvaluator
; via GlyphObject_Helper9_80467 au moment de l activation F2/F6/F7, seg040) -- lien exact
; entre word_72A94 et si[+0x135] pas encore trace. PISTE NON VERIFIEE (suggeree par Remi, a
; confirmer par trace ASM) : le meme widget afficherait aussi les messages radio -- ne pas
; prendre pour acquis tant que non trace. si=objet controleur (memes offsets que
; Camera_ExternalView_VtSlotC_14FD7, l appelant), di=&si+2 (buffer texte embarque). (1) si
; si[+0x135]==0 -> rien, sortie immediate. (2) sinon resout la ressource texte si[+0x135] via
; Memory_TypedAllocDispatchB_5C832(5C44h) puis rend/mesure via
; Render_MeasureOrDrawTextString_61F52 (meme couple d appels que le moteur de rendu des
; messages journal/kneeboard). (3) si si[+0x21C]==0xFF (sentinelle termine) -> sortie. (4) si
; si[+0x21E] : choisit une 2e source de chaine selon si[+0x140] (0 -> si[+0x208]/[+0x20C],
; sinon -> si[+0x212]/[+0x216]), meme resolution+rendu si la source est non nulle. (5)
; si[+0x21C]++ ; si >=2 -> si[+0x21C]=0xFF (fige l affichage). PRECISION (2026-09-12, Remi) :
; Betty (cf. Cockpit_LoadBettyPack) est une banque SON pour les avertissements, sans rapport
; avec ce widget texte -- toute mention anterieure de Betty ici etait un lien errone. RESTE
; OUVERT : lien exact entre si[+0x135] et word_72A94, si le widget sert aussi aux messages
; radio, semantique exacte de si[+0x140] et si[+0x21E]/[+0x21F]. Lu ligne a ligne le
; 2026-09-12 sur demande de Remi (le nom precedent "DrawPilotPortrait" etait faux, aucun
; portrait n existe dans la simulation).
; ==============================================================================================
Cockpit_CaptionTextRenderStep_14EFA	proc far		; CODE XREF: seg015:014Dp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	dword ptr [si+135h], 0
		jz	short loc_14F12
		mov	ax, 1
		jmp	short loc_14F14
; ���������������������������������������������������������������������������

loc_14F12:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+11j
		xor	ax, ax

loc_14F14:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+16j
		or	ax, ax
		jnz	short loc_14F1B
		jmp	loc_14FD3
; ���������������������������������������������������������������������������

loc_14F1B:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+1Cj
		push	large 0
		mov	al, [si+139h]
		push	ax
		push	large dword ptr	[si+135h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		cmp	byte ptr [si+21Ch], 0FFh
		jnz	short loc_14F4B
		jmp	loc_14FD3
; ���������������������������������������������������������������������������

loc_14F4B:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+4Cj
		cmp	byte ptr [si+21Eh], 0
		jz	short loc_14FC0
		cmp	byte ptr [si+140h], 0
		jz	short loc_14F81
		cmp	dword ptr [si+212h], 0
		jz	short loc_14F66
		mov	ax, 1
		jmp	short loc_14F68
; ���������������������������������������������������������������������������

loc_14F66:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+65j
		xor	ax, ax

loc_14F68:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+6Aj
		or	ax, ax
		jz	short loc_14FC0
		mov	al, [si+21Ch]
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+216h]
		push	ax
		push	large dword ptr	[si+212h]
		jmp	short loc_14FA7
; ���������������������������������������������������������������������������

loc_14F81:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+5Dj
		cmp	dword ptr [si+208h], 0
		jz	short loc_14F8E
		mov	ax, 1
		jmp	short loc_14F90
; ���������������������������������������������������������������������������

loc_14F8E:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+8Dj
		xor	ax, ax

loc_14F90:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+92j
		or	ax, ax
		jz	short loc_14FC0
		mov	al, [si+21Ch]
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+20Ch]
		push	ax
		push	large dword ptr	[si+208h]

loc_14FA7:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+85j
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_14FC0:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+56j
					; Cockpit_CaptionTextRenderStep_14EFA+70j ...
		mov	al, [si+21Ch]
		inc	al
		mov	[si+21Ch], al
		cmp	al, 2
		jb	short loc_14FD3
		mov	byte ptr [si+21Ch], 0FFh

loc_14FD3:				; CODE XREF: Cockpit_CaptionTextRenderStep_14EFA+1Ej
					; Cockpit_CaptionTextRenderStep_14EFA+4Ej ...
		pop	di
		pop	si
		pop	bp
		retf
Cockpit_CaptionTextRenderStep_14EFA	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far,~230L — slot [+0x0C] de la vtable +0x50 des entrees camera CAMR (tag 0x79C). PAS juste
; "init/rendu overlay" (ancien resume devine) : GESTIONNAIRE PAR-FRAME DE L HABILLAGE UI DE LA
; VUE EXTERNE -- legende de vue, widget liste/tooltip type kneeboard, et effet de secousse
; ecran lie aux degats joueur. si=objet vue (1 seul argument, [bp+6]). (1) garde : si
; si[+2]==0 -> sortie immediate. (2) deux branches selon si[+0x1BC] : branche B (!=0)
; rafraichit (si+0xF5)->vtable[0xC](), avance le typewriter de legende
; Text_TypewriterFrame(&word_72A94, si+2) -- CONFIRME le lien exact entre word_72A94 (buffer
; global des libelles "Chase Plane"/etc, ecrit par Mission_TriggerEvaluator) et si+2 (buffer
; lu par Cockpit_CaptionTextRenderStep_14EFA) -- puis Resource_AccessUnified(5130h). branche A
; (==0) : pose si[+0x21F] ("vient d etre rafraichi") selon byte_72340/byte_721F0==2,
; sauvegarde si[+0x1A], le remplace temporairement par word_70E62[+0xA], appelle
; Cockpit_CaptionTextRenderStep_14EFA si si[+0x21F] vient d etre pose, puis si si[+0x21E] :
; UI_ContainerCloseDispatch(si[+0x24] ou si[+0x22] selon si[+0x140]),
; UI_NotifyListEvent(&si+0x26), List_RefreshAllTooltips(&si+0x2C), rafraichit
; (si+0xF5)->vtable[0xC](), typewriter, Resource_AccessUnified(5130h), restaure
; si[+0x1A]/[+0xC]. (3) EFFET DE SECOUSSE (sans rapport avec le reste) : si word_722E6[+0x68]
; > 0 (word_722E6 = entite joueur courante) -> Video_SetHorizontalShake(si[+0x1F8 + idx*2]) --
; ressemble a un shake de degats/impact. (4) si si[+0x21C]==0xFF (sequence de legende
; terminee) -> efface si[+0x21F]. RESTE OUVERT : semantique exacte de si[+0x1BC] (mode) et
; si[+0x21E] (widget liste actif ?), la table si[+0x1F8] (paliers de shake ?) et l origine de
; l index [bp-9] (non trace). Lu ligne a ligne le 2026-09-12.
; ==============================================================================================
Camera_ExternalView_VtSlotC_14FD7:				; DATA XREF: seg339:0768o
		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jnz	short loc_14FEB
		jmp	loc_15128
; ���������������������������������������������������������������������������

loc_14FEB:				; CODE XREF: seg015:00F6j
		mov	al, [si+1BCh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_14FF8
		jmp	loc_150B7
; ���������������������������������������������������������������������������

loc_14FF8:				; CODE XREF: seg015:0103j
		cmp	byte_72340, 0
		jnz	short loc_15011
		cmp	byte_721F0, 2
		jnz	short loc_1500B
		mov	ax, 1
		jmp	short loc_1500D
; ���������������������������������������������������������������������������

loc_1500B:				; CODE XREF: seg015:0114j
		xor	ax, ax

loc_1500D:				; CODE XREF: seg015:0119j
		or	ax, ax
		jz	short loc_1501B

loc_15011:				; CODE XREF: seg015:010Dj
		mov	byte_72340, 0
		mov	byte ptr [si+21Fh], 1

loc_1501B:				; CODE XREF: seg015:011Fj
		mov	ax, [si+1Ah]
		mov	[bp-2],	ax
		cmp	byte ptr [si+21Fh], 0
		jz	short loc_15043
		mov	bx, word_70E62
		mov	ax, [bx+0Ah]
		mov	[si+0Ch], ax
		mov	[si+1Ah], ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	si
		push	cs
		call	near ptr Cockpit_CaptionTextRenderStep_14EFA
		add	sp, 4

loc_15043:				; CODE XREF: seg015:0136j
		cmp	byte ptr [si+21Eh], 0
		jz	short loc_150A3
		cmp	byte ptr [si+140h], 0
		jz	short loc_1505C
		cmp	word ptr [si+24h], 0
		jz	short loc_1506B
		push	word ptr [si+24h]
		jmp	short loc_15065
; ���������������������������������������������������������������������������

loc_1505C:				; CODE XREF: seg015:015Fj
		cmp	word ptr [si+22h], 0
		jz	short loc_1506B
		push	word ptr [si+22h]

loc_15065:				; CODE XREF: seg015:016Aj
		call	UI_ContainerCloseDispatch
		pop	cx

loc_1506B:				; CODE XREF: seg015:0165j seg015:0170j
		mov	ax, si
		add	ax, 26h	; '&'
		push	ax
		call	UI_NotifyListEvent
		pop	cx
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	List_RefreshAllTooltips
		pop	cx
		mov	ax, si
		add	ax, 0F5h ; '�'
		push	ax
		mov	bx, [si+0F5h]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	ax, si
		add	ax, 2
		push	ax
		push	ds
		push	offset word_72A94
		call	Text_TypewriterFrame
		add	sp, 6

loc_150A3:				; CODE XREF: seg015:0158j
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		mov	ax, [bp-2]
		mov	[si+0Ch], ax
		mov	[si+1Ah], ax
		jmp	short loc_150E0
; ���������������������������������������������������������������������������

loc_150B7:				; CODE XREF: seg015:0105j
		mov	ax, si
		add	ax, 0F5h ; '�'
		push	ax
		mov	bx, [si+0F5h]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	ax, si
		add	ax, 2
		push	ax
		push	ds
		push	offset word_72A94
		call	Text_TypewriterFrame
		add	sp, 6
		push	5130h
		call	Resource_AccessUnified
		pop	cx

loc_150E0:				; CODE XREF: seg015:01C5j
		mov	di, word_722E6
		add	di, 68h	; 'h'
		mov	eax, [di]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 0
		jle	short loc_150FA
		mov	ax, 1
		jmp	short loc_150FC
; ���������������������������������������������������������������������������

loc_150FA:				; CODE XREF: seg015:0203j
		xor	ax, ax

loc_150FC:				; CODE XREF: seg015:0208j
		mov	[bp-5],	al
		cmp	byte ptr [bp-5], 0
		jz	short loc_15128
		mov	eax, [bp-4]
		shl	eax, 3
		mov	[bp-0Eh], eax
		mov	[bp-0Ah], eax
		mov	bx, [bp-9]
		shl	bx, 1
		mov	ax, [bx+si+1F8h]
		mov	[bp-10h], ax
		push	ax
		call	Video_SetHorizontalShake
		pop	cx

loc_15128:				; CODE XREF: seg015:00F8j seg015:0213j
		cmp	byte ptr [si+21Ch], 0FFh
		jnz	short loc_15134
		mov	byte ptr [si+21Fh], 0

loc_15134:				; CODE XREF: seg015:023Dj
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — deux appels à sub_5A95E(0,6) et sub_5A95E(0,7) : initialisation de deux
; ressources/canaux (son ou UI) par index.
; ==============================================================================================
Resource_InitTwoChannels	proc far		; CODE XREF: Video_InitShakeEffect_85D95+7P
		push	bp
		mov	bp, sp
		push	0
		push	6
		call	Weapon_HUDBox_TimerCaseJ_5A95E
		add	sp, 4
		push	0
		push	7
		call	Weapon_HUDBox_TimerCaseJ_5A95E
		add	sp, 4
		pop	bp
		retf
Resource_InitTwoChannels	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,41L — charge 'betty.pak' depuis '..\..\data\cockpits\' (sub_2B031, sub_5AAD7) si mode 4
; (byte_72A8E) : chargement du pack de ressources 'Betty'. PRECISION (2026-09-12, Remi) :
; Betty est une BANQUE SON pour les messages d avertissement (audio, ex. alertes
; radar/systeme), PAS un systeme de dialogue/portrait visuel -- ne pas relier a
; Cockpit_CaptionTextRenderStep_14EFA (legende texte de vue), lien errone fait par une session
; precedente.
; ==============================================================================================
Cockpit_LoadBettyPack	proc far		; CODE XREF: Cockpit_DetectPlayerMissile+6Ep
					; Cockpit_DetectPlayerMissile+C1p ...

var_50		= word ptr -50h
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		cmp	byte_72A8E, 4
		jnz	short locret_1519C
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aBetty	; "betty"
		push	ds
		push	offset a____DataCockpi ; "..\\..\\data\\cockpits\\"
		lea	ax, [bp+var_50]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		mov	al, [bp+arg_0]
		mov	ah, 0
		push	ax
		push	0
		lea	ax, [bp+var_50]
		push	ax
		call	Widget_Helper_5AAD7
		add	sp, 8
		or	al, al
		jz	short locret_1519C
		push	1
		call	Widget_Helper_5AB09
		pop	cx

locret_1519C:				; CODE XREF: Cockpit_LoadBettyPack+Bj
					; Cockpit_LoadBettyPack+3Dj
		leave
		retf
Cockpit_LoadBettyPack	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, ~460L — MISE À JOUR PAR FRAME DE LA VUE EXTERNE/CHASE (ex-inconnu). Slot [+0x14] de la
; vtable +0x50 des entrées caméra CAMR (tag 0x79C = CHAS, cf.
; HUDSymbol_ConstructVariantM_856F3) ; invoquée à chaque frame par View_RenderFrame_2DF0D
; (seg065) sur l'objet vue actif word_72A8F, et une fois à l'activation par
; Kneeboard_ApplySelection (son retour AL = code d'état stocké dans manager[+0x11]). Args : si
; = contrôleur de vue (>0x220 o, seg015), di = entrée caméra. Corps : (1) subject = di[+0x89]
; (l'avion, lié depuis le nom sujet du chunk CHAS 'PLAYER'/'AIRHEAD') ;
; subject->vtable[+0x3C]() -> scalaire (masse) ; (2) di[+0x14/+0x18/+0x1C] (POSITION CAMÉRA
; MONDE 24.8) := subject[+0x12/+0x16/+0x1A] (POSITION AVION) — copie directe, campos =
; pos_avion ; (3) si si[+0x1BB]==0 (pas de verrou cible) -> jmp loc_15485 (fin position) ; (4)
; branche verrou cible : direction de référence D = refpos - campos (refpos via
; subject[+0x5A]->[+0x0D..]), normalisée (sub_55B04/5593A), scalaire borné a +/-0x100 (+/-1.0)
; via sub_5505B/5493E, comparé a di[+0x60] (= dword de queue des params du chunk = seuil) et
; aux bornes si[+0x183/+0x185/+0x187], PUIS porté a 0x6400 = 100.0 unités (distance chase) ;
; (5) LISSAGE DU LAG : vecteur avant si[+0x14F] ramené vers la cible avec pas max 0x600 = 6.0
; unités/frame (sub_55A9E = clamp de longueur) — c'est le 'lag', un simple rate-limit par
; frame, PAS une force physique ; (6) reconstruction matrice d'orientation si[+0x143] (3x3)
; via Matrix_BuildFromAngle_56D72 / Matrix_BuildAxisZ_572BC / Matrix_BuildAxisX_56EC3 /
; sub_57660, tangage/lacet si[+0x189]/si[+0x18B] ; (7) messages 'Eyes locked on target' /
; 'Target tracking OFF' (toggle si[+0x1BB] par scancode) ; (8) switch word_72352 (= TYPE DE
; PÉRIPHÉRIQUE D'ENTRÉE, pas la vue) -> Input_ProcessFrame_7A9E0 /
; Input_ReadMouseAndAxes_7AAF0 / Input_ReadJoystick* -> pan joueur via
; AIManeuver_BuildRotationAndLookup_7A800 ; (9) Cockpit_ViewPanTransitionMain_15B67. NB :
; remplace le modèle 'corps rigide debris' des passes 2026-09-06
; (Camera_ComputeMountedPosition_3D31D seg085) qui concerne une AUTRE caméra
; (arme/cinématique), pas la chase F2. Détail : DATA_MODEL.md §6.6b-ter.
; ==============================================================================================
Camera_ExternalViewComputeMain_1519E:				; DATA XREF: seg339:0770o
		push	bp
		mov	bp, sp
		sub	sp, 0BAh
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	dword ptr [bp-6], 0
		mov	dword ptr [bp-0Ah], 6400h
		mov	dword ptr [bp-0Eh], 0
		mov	eax, [bp-6]
		mov	[bp-72h], eax
		mov	eax, [bp-0Ah]
		mov	[bp-6Eh], eax
		mov	eax, [bp-0Eh]
		mov	[bp-6Ah], eax
		mov	ax, [di+89h]
		mov	[bp-10h], ax
		push	ax
		mov	bx, [bp-10h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp-12h], ax
		mov	ax, [bp-10h]
		add	ax, 12h
		mov	[bp-14h], ax
		mov	bx, [bp-14h]
		mov	eax, [bx]
		mov	[di+14h], eax
		mov	eax, [bx+4]
		mov	[di+18h], eax
		mov	eax, [bx+8]
		mov	[di+1Ch], eax
		mov	bx, [bp-10h]
		les	bx, [bx+5Ah]
		mov	ax, es:[bx+0Dh]
		mov	[bp-16h], ax
		cmp	byte ptr [si+1BBh], 0
		jnz	short loc_1522B
		jmp	loc_15485
; ���������������������������������������������������������������������������

loc_1522B:				; CODE XREF: seg015:0336j
		cmp	word ptr [bp-16h], 0
		jnz	short loc_15234
		jmp	loc_1547B
; ���������������������������������������������������������������������������

loc_15234:				; CODE XREF: seg015:033Fj
		add	ax, 12h
		mov	[bp-2Ah], ax
		mov	ax, di
		add	ax, 14h
		mov	[bp-2Ch], ax
		mov	bx, [bp-2Ah]
		mov	eax, [bx]
		mov	bx, [bp-2Ch]
		sub	eax, [bx]
		mov	[bp-0AEh], eax
		mov	bx, [bp-2Ah]
		mov	eax, [bx+4]
		mov	bx, [bp-2Ch]
		sub	eax, [bx+4]
		mov	[bp-0AAh], eax
		mov	bx, [bp-2Ah]
		mov	eax, [bx+8]
		mov	bx, [bp-2Ch]
		sub	eax, [bx+8]
		mov	[bp-0A6h], eax
		mov	eax, [bp-0AEh]
		mov	[bp-0A2h], eax
		mov	eax, [bp-0AAh]
		mov	[bp-9Eh], eax
		mov	eax, [bp-0A6h]
		mov	[bp-9Ah], eax
		lea	ax, [bp-0A2h]
		push	ax
		call	Vector_PrescaleBelow256_55B04
		pop	cx
		lea	ax, [bp-0A2h]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	ax, [bp-12h]
		add	ax, 0Ch
		push	ax
		lea	ax, [bp-0A2h]
		push	ax
		push	ss
		lea	ax, [bp-30h]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		cmp	dword ptr [bp-30h], 100h
		jle	short loc_152D5
		mov	ax, 1
		jmp	short loc_152D7
; ���������������������������������������������������������������������������

loc_152D5:				; CODE XREF: seg015:03DEj
		xor	ax, ax

loc_152D7:				; CODE XREF: seg015:03E3j
		or	al, al
		jz	short loc_152ED
		mov	dword ptr [bp-34h], 100h
		mov	eax, [bp-34h]
		mov	[bp-30h], eax
		jmp	short loc_15312
; ���������������������������������������������������������������������������

loc_152ED:				; CODE XREF: seg015:03E9j
		cmp	dword ptr [bp-30h], 0FFFFFF00h
		jge	short loc_152FC
		mov	ax, 1
		jmp	short loc_152FE
; ���������������������������������������������������������������������������

loc_152FC:				; CODE XREF: seg015:0405j
		xor	ax, ax

loc_152FE:				; CODE XREF: seg015:040Aj
		or	al, al
		jz	short loc_15312
		mov	dword ptr [bp-38h], 0FFFFFF00h
		mov	eax, [bp-38h]
		mov	[bp-30h], eax

loc_15312:				; CODE XREF: seg015:03FBj seg015:0410j
		lea	ax, [bp-30h]
		push	ax
		push	ss
		lea	ax, [bp-3Ch]
		push	ax
		call	Math_AcosDeg_5493E
		add	sp, 6
		mov	eax, [di+60h]
		cmp	eax, [bp-3Ch]
		jg	short loc_15332
		mov	ax, 1
		jmp	short loc_15334
; ���������������������������������������������������������������������������

loc_15332:				; CODE XREF: seg015:043Bj
		xor	ax, ax

loc_15334:				; CODE XREF: seg015:0440j
		or	al, al
		jnz	short loc_1533B
		jmp	loc_15474
; ���������������������������������������������������������������������������

loc_1533B:				; CODE XREF: seg015:0446j
		push	word ptr [bp-12h]
		lea	ax, [bp-0A2h]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		lea	ax, [bp-0A2h]
		push	ax
		push	ss
		lea	ax, [bp-40h]
		push	ax
		call	AI_ComputeApproachAngles_553CF
		add	sp, 6
		lea	ax, [bp-0A2h]
		push	ax
		push	ss
		lea	ax, [bp-44h]
		push	ax
		call	Math_ElevationAngle_552E1
		add	sp, 6
		mov	byte_6D8AC, 0
		cmp	dword ptr [bp-44h], 0
		jle	short loc_15380
		mov	ax, 1
		jmp	short loc_15382
; ���������������������������������������������������������������������������

loc_15380:				; CODE XREF: seg015:0489j
		xor	ax, ax

loc_15382:				; CODE XREF: seg015:048Ej
		or	al, al
		jnz	short loc_15389
		jmp	loc_15485
; ���������������������������������������������������������������������������

loc_15389:				; CODE XREF: seg015:0494j
		mov	ax, [si+183h]
		mov	[bp-46h], ax
		movsx	eax, word ptr [bp-46h]
		shl	eax, 8
		cmp	eax, [bp-44h]
		jle	short loc_153A4
		mov	ax, 1
		jmp	short loc_153A6
; ���������������������������������������������������������������������������

loc_153A4:				; CODE XREF: seg015:04ADj
		xor	ax, ax

loc_153A6:				; CODE XREF: seg015:04B2j
		or	al, al
		jnz	short loc_153AD
		jmp	loc_15485
; ���������������������������������������������������������������������������

loc_153AD:				; CODE XREF: seg015:04B8j
		mov	ax, [si+185h]
		mov	[bp-48h], ax
		movsx	eax, word ptr [bp-48h]
		shl	eax, 8
		cmp	eax, [bp-40h]
		jge	short loc_153C8
		mov	ax, 1
		jmp	short loc_153CA
; ���������������������������������������������������������������������������

loc_153C8:				; CODE XREF: seg015:04D1j
		xor	ax, ax

loc_153CA:				; CODE XREF: seg015:04D6j
		or	al, al
		jnz	short loc_153D1
		jmp	loc_15485
; ���������������������������������������������������������������������������

loc_153D1:				; CODE XREF: seg015:04DCj
		mov	ax, [si+187h]
		mov	[bp-4Ah], ax
		movsx	eax, word ptr [bp-4Ah]
		shl	eax, 8
		cmp	eax, [bp-40h]
		jle	short loc_153EC
		mov	ax, 1
		jmp	short loc_153EE
; ���������������������������������������������������������������������������

loc_153EC:				; CODE XREF: seg015:04F5j
		xor	ax, ax

loc_153EE:				; CODE XREF: seg015:04FAj
		or	al, al
		jnz	short loc_153F5
		jmp	loc_15485
; ���������������������������������������������������������������������������

loc_153F5:				; CODE XREF: seg015:0500j
		mov	eax, [bp-0A2h]
		mov	[bp-72h], eax
		mov	eax, [bp-9Eh]
		mov	[bp-6Eh], eax
		mov	eax, [bp-9Ah]
		mov	[bp-6Ah], eax
		mov	dword ptr [bp-4Eh], 6400h
		mov	eax, [bp-72h]
		mov	edx, [bp-4Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-72h], eax
		mov	eax, [bp-6Eh]
		mov	edx, [bp-4Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-6Eh], eax
		mov	eax, [bp-6Ah]
		mov	edx, [bp-4Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-6Ah], eax
		mov	byte ptr [si+1BDh], 1
		mov	byte_6D8AC, 1
		mov	al, [si+1BCh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15485
		push	di
		push	si
		call	VROOMM_StubThunk_6ACB0
		add	sp, 4
		jmp	short loc_15485
; ���������������������������������������������������������������������������

loc_15474:				; CODE XREF: seg015:0448j
		mov	byte_6D8AC, 1
		jmp	short loc_15485
; ���������������������������������������������������������������������������

loc_1547B:				; CODE XREF: seg015:0341j
		mov	byte_6D8AC, 0
		mov	byte ptr [si+1BBh], 0

loc_15485:				; CODE XREF: seg015:0338j seg015:0496j ...
		push	word ptr [bp-10h]
		push	si
		nop
		push	cs
		call	near ptr Cockpit_ViewPanTransitionMain_15B67
		add	sp, 4
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, word_6E46F
		jz	short loc_154A3
		mov	al, byte_722D1
		mov	ah, 0
		jmp	short loc_154A5
; ���������������������������������������������������������������������������

loc_154A3:				; CODE XREF: seg015:05AAj
		xor	ax, ax

loc_154A5:				; CODE XREF: seg015:05B1j
		mov	[bp-17h], al
		mov	ah, 0
		cmp	ax, 15h
		jz	short loc_154B7
		cmp	ax, 3Bh	; ';'
		jz	short loc_1550A
		jmp	loc_1554B
; ���������������������������������������������������������������������������

loc_154B7:				; CODE XREF: seg015:05BDj
		cmp	word ptr [bp-16h], 0
		jnz	short loc_154C0
		jmp	loc_155A5
; ���������������������������������������������������������������������������

loc_154C0:				; CODE XREF: seg015:05CBj
		xor	byte ptr [si+1BBh], 1
		cmp	byte ptr [si+1BBh], 0
		jz	short loc_154EB
		sub	sp, 4
		mov	dword ptr [bp-0C2h], 100h
		push	ds
		push	offset aEyesLockedOnTa ; "Eyes locked on target"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	loc_155A5
; ���������������������������������������������������������������������������

loc_154EB:				; CODE XREF: seg015:05DAj
		sub	sp, 4
		mov	dword ptr [bp-0C2h], 100h
		push	ds
		push	offset aTargetTracking ; "Target tracking OFF"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	loc_155A5
; ���������������������������������������������������������������������������

loc_1550A:				; CODE XREF: seg015:05C2j
		cmp	byte ptr [si+1BCh], 0
		jz	short loc_15542
		cmp	byte ptr [si+1BBh], 0
		jz	short loc_15534
		sub	sp, 4
		mov	dword ptr [bp-0C2h], 100h
		push	ds
		push	offset aTargetTracki_0 ; "Target tracking OFF"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch

loc_15534:				; CODE XREF: seg015:0626j
		mov	byte ptr [si+1BBh], 0
		push	si
		call	VROOMM_StubThunk_6ACB5
		pop	cx
		jmp	short loc_155A5
; ���������������������������������������������������������������������������

loc_15542:				; CODE XREF: seg015:061Fj
		push	si
		call	VROOMM_StubThunk_6B080
		pop	cx
		jmp	short loc_155A5
; ���������������������������������������������������������������������������

loc_1554B:				; CODE XREF: seg015:05C4j
		mov	word ptr [bp-2], 0
		jmp	short loc_1559C
; ���������������������������������������������������������������������������

loc_15552:				; CODE XREF: seg015:06B3j
		mov	ax, [bp-2]
		imul	ax, 1Dh
		mov	bx, [si+133h]
		add	bx, ax
		cmp	byte ptr [bx], 0FFh
		jz	short loc_15599
		mov	ax, [bp-2]
		imul	ax, 1Dh
		mov	bx, [si+133h]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp-17h]
		jnz	short loc_15599
		push	word ptr [bp-2]
		push	si
		call	VROOMM_StubThunk_6B08A
		add	sp, 4
		mov	byte ptr [si+21Eh], 0
		mov	bx, [si+20h]
		cmp	word ptr [bx+2], 0
		jnz	short loc_155A5
		push	bx
		call	Radar_Project3DToScreen
		pop	cx
		jmp	short loc_155A5
; ���������������������������������������������������������������������������

loc_15599:				; CODE XREF: seg015:0671j seg015:0684j
		inc	word ptr [bp-2]

loc_1559C:				; CODE XREF: seg015:0660j
		mov	ax, [si+123h]
		cmp	ax, [bp-2]
		jg	short loc_15552

loc_155A5:				; CODE XREF: seg015:05CDj seg015:05F8j ...
		cmp	word_72352, 3
		jz	short loc_15601
		cmp	word_72352, 4
		jz	short loc_15601
		push	2
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jz	short loc_155F2
		push	0
		call	Joystick_GetAxisMin_67BC9
		pop	cx
		sar	ax, 1
		mov	[bp-2Ah], ax
		push	0
		call	Joystick_GetAxisMax_67BD8
		pop	cx
		sar	ax, 1
		mov	[bp-2Ch], ax
		push	di
		push	word ptr [bp-2Ah]
		push	ax
		push	si
		call	VROOMM_StubThunk_6ACBA
		add	sp, 8
		mov	byte ptr [si+1BEh], 0
		jmp	short loc_15601
; ���������������������������������������������������������������������������

loc_155F2:				; CODE XREF: seg015:06D1j
		mov	al, [si+1BEh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15601
		mov	byte ptr [si+1BDh], 1

loc_15601:				; CODE XREF: seg015:06BAj seg015:06C1j ...
		mov	bx, word_72352
		cmp	bx, 5		; switch 6 cases
		ja	short loc_1563F	; default
		shl	bx, 1
		jmp	cs:off_15ABA[bx] ; switch jump

loc_15611:				; DATA XREF: seg015:off_15ABAo
		push	di		; case 0x1
		push	si
		call	VROOMM_StubThunk_6AD10
		add	sp, 4
		jmp	short loc_1563F	; default
; ���������������������������������������������������������������������������

loc_1561D:				; CODE XREF: seg015:071Cj
					; DATA XREF: seg015:off_15ABAo
		push	di		; case 0x0
		push	si
		call	VROOMM_StubThunk_6ACE0
		add	sp, 4
		jmp	short loc_1563F	; default
; ���������������������������������������������������������������������������

loc_15629:				; CODE XREF: seg015:071Cj
					; DATA XREF: seg015:off_15ABAo
		push	di		; case 0x3
		push	si
		call	VROOMM_StubThunk_6AD70
		add	sp, 4
		jmp	short loc_1563F	; default
; ���������������������������������������������������������������������������

loc_15635:				; CODE XREF: seg015:071Cj
					; DATA XREF: seg015:off_15ABAo
		push	di		; case 0x4
		push	si
		call	VROOMM_StubThunk_6AD75
		add	sp, 4

loc_1563F:				; CODE XREF: seg015:0718j seg015:071Cj ...
		cmp	byte ptr [si+1BCh], 0 ;	default
		jnz	short loc_15649
		jmp	loc_158D0
; ���������������������������������������������������������������������������

loc_15649:				; CODE XREF: seg015:0754j
		mov	al, [si+1BDh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_156BA
		mov	ax, si
		add	ax, 143h
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	ax, [si+18Bh]
		mov	[bp-1Ah], ax
		movsx	eax, word ptr [bp-1Ah]
		shl	eax, 8
		mov	[bp-1Eh], eax
		lea	ax, [bp-1Eh]
		push	ax
		mov	ax, si
		add	ax, 143h
		push	ax
		call	Matrix_BuildAxisZ_572BC
		add	sp, 4
		mov	ax, [si+189h]
		mov	[bp-20h], ax
		movsx	eax, word ptr [bp-20h]
		shl	eax, 8
		mov	[bp-24h], eax
		lea	ax, [bp-24h]
		push	ax
		mov	ax, si
		add	ax, 143h
		push	ax
		call	Matrix_BuildAxisX_56EC3
		add	sp, 4
		mov	ax, si
		add	ax, 143h
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		jmp	loc_158D0
; ���������������������������������������������������������������������������

loc_156BA:				; CODE XREF: seg015:0761j
		mov	ax, si
		add	ax, 14Fh
		mov	[bp-2Ah], ax
		mov	dword ptr [bp-2Eh], 6400h
		mov	bx, [bp-2Ah]
		mov	eax, [bx]
		mov	edx, [bp-2Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-32h], eax
		mov	eax, [bp-32h]
		mov	[bp-36h], eax
		mov	eax, [bx+4]
		mov	edx, [bp-2Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-3Ah], eax
		mov	eax, [bp-3Ah]
		mov	[bp-3Eh], eax
		mov	eax, [bx+8]
		mov	edx, [bp-2Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-42h], eax
		mov	eax, [bp-42h]
		mov	[bp-46h], eax
		mov	eax, [bp-36h]
		mov	[bp-0A2h], eax
		mov	eax, [bp-3Eh]
		mov	[bp-9Eh], eax
		mov	eax, [bp-46h]
		mov	[bp-9Ah], eax
		mov	eax, [bp-72h]
		sub	eax, [bp-0A2h]
		mov	[bp-0BAh], eax
		mov	eax, [bp-6Eh]
		sub	eax, [bp-9Eh]
		mov	[bp-0B6h], eax
		mov	eax, [bp-6Ah]
		sub	eax, [bp-9Ah]
		mov	[bp-0B2h], eax
		mov	eax, [bp-0BAh]
		mov	[bp-0AEh], eax
		mov	eax, [bp-0B6h]
		mov	[bp-0AAh], eax
		mov	eax, [bp-0B2h]
		mov	[bp-0A6h], eax
		push	eax
		push	large dword ptr	[bp-0AAh]
		push	large dword ptr	[bp-0AEh]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-4Ah], eax
		mov	[bp-4Eh], eax
		mov	dword ptr [bp-52h], 600h
		cmp	eax, [bp-52h]
		jle	short loc_157B6
		mov	ax, 1
		jmp	short loc_157B8
; ���������������������������������������������������������������������������

loc_157B6:				; CODE XREF: seg015:08BFj
		xor	ax, ax

loc_157B8:				; CODE XREF: seg015:08C4j
		or	al, al
		jnz	short loc_157BF
		jmp	loc_15870
; ���������������������������������������������������������������������������

loc_157BF:				; CODE XREF: seg015:08CAj
		mov	dword ptr [bp-56h], 600h
		mov	eax, [bp-0AEh]
		mov	edx, eax
		mov	ecx, [bp-56h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-0AEh], eax
		mov	eax, [bp-0AAh]
		mov	edx, eax
		mov	ecx, [bp-56h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-0AAh], eax
		mov	eax, [bp-0A6h]
		mov	edx, eax
		mov	ecx, [bp-56h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-0A6h], eax
		push	large dword ptr	[bp-0A6h]
		push	large dword ptr	[bp-0AAh]
		push	large dword ptr	[bp-0AEh]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-5Ah], eax
		mov	[bp-5Eh], eax
		mov	dword ptr [bp-62h], 600h
		cmp	eax, [bp-62h]
		jge	short loc_15851
		mov	ax, 1
		jmp	short loc_15853
; ���������������������������������������������������������������������������

loc_15851:				; CODE XREF: seg015:095Aj
		xor	ax, ax

loc_15853:				; CODE XREF: seg015:095Fj
		or	al, al
		jz	short loc_15870
		mov	dword ptr [bp-66h], 600h
		lea	ax, [bp-66h]
		push	ax
		lea	ax, [bp-0AEh]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4

loc_15870:				; CODE XREF: seg015:08CCj seg015:0965j
		mov	eax, [bp-0AEh]
		add	[bp-0A2h], eax
		mov	eax, [bp-0AAh]
		add	[bp-9Eh], eax
		mov	eax, [bp-0A6h]
		add	[bp-9Ah], eax
		cmp	dword ptr [bp-0A2h], 0
		jnz	short loc_1589B
		mov	ax, 1
		jmp	short loc_1589D
; ���������������������������������������������������������������������������

loc_1589B:				; CODE XREF: seg015:09A4j
		xor	ax, ax

loc_1589D:				; CODE XREF: seg015:09A9j
		or	al, al
		jz	short loc_158BD
		cmp	dword ptr [bp-9Ah], 0
		jnz	short loc_158AE
		mov	ax, 1
		jmp	short loc_158B0
; ���������������������������������������������������������������������������

loc_158AE:				; CODE XREF: seg015:09B7j
		xor	ax, ax

loc_158B0:				; CODE XREF: seg015:09BCj
		or	al, al
		jz	short loc_158BD
		push	si
		call	VROOMM_StubThunk_6ACB5
		pop	cx
		jmp	short loc_158D0
; ���������������������������������������������������������������������������

loc_158BD:				; CODE XREF: seg015:09AFj seg015:09C2j
		lea	ax, [bp-0A2h]
		push	ax
		mov	ax, si
		add	ax, 143h
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4

loc_158D0:				; CODE XREF: seg015:0756j seg015:07C7j ...
		mov	ax, si
		add	ax, 143h
		push	ax
		mov	ax, di
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		push	word ptr [bp-12h]
		mov	ax, di
		add	ax, 20h	; ' '
		push	ax
		call	WorldObject_ApplyOrientationVariantB_5779A
		add	sp, 4
		mov	ax, si
		add	ax, 167h
		mov	[bp-26h], ax
		mov	bx, [bp-26h]
		mov	eax, [bx]
		mov	[bp-7Eh], eax
		mov	eax, [bx+4]
		mov	[bp-7Ah], eax
		mov	eax, [bx+8]
		mov	[bp-76h], eax
		push	word ptr [bp-12h]
		lea	ax, [bp-7Eh]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	ax, [bp-10h]
		add	ax, 12h
		mov	[bp-28h], ax
		mov	bx, [bp-28h]
		mov	eax, [bx]
		add	eax, [bp-7Eh]
		mov	[bp-8Ah], eax
		mov	eax, [bx+4]
		add	eax, [bp-7Ah]
		mov	[bp-86h], eax
		mov	eax, [bx+8]
		add	eax, [bp-76h]
		mov	[bp-82h], eax
		mov	eax, [bp-8Ah]
		mov	[bp-96h], eax
		mov	eax, [bp-86h]
		mov	[bp-92h], eax
		mov	eax, [bp-82h]
		mov	[bp-8Eh], eax
		mov	eax, [bp-96h]
		mov	[di+14h], eax
		mov	eax, [bp-92h]
		mov	[di+18h], eax
		mov	eax, [bp-8Eh]
		mov	[di+1Ch], eax
		cmp	byte ptr [si+21Eh], 0
		jz	short loc_159F6
		mov	al, [si+1BCh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_159F6
		cmp	word ptr [si+20h], 0
		jz	short loc_159B1
		push	word ptr [si+20h]
		call	Radar_Project3DToScreen
		pop	cx

loc_159B1:				; CODE XREF: seg015:0AB6j
		cmp	byte ptr [si+140h], 0
		jz	short loc_159CC
		cmp	word ptr [si+24h], 0
		jz	short loc_159DE
		push	di
		push	word ptr [si+24h]
		call	UI_ContainerLifecycle
		add	sp, 4
		jmp	short loc_159DE
; ���������������������������������������������������������������������������

loc_159CC:				; CODE XREF: seg015:0AC6j
		cmp	word ptr [si+22h], 0
		jz	short loc_159DE
		push	di
		push	word ptr [si+22h]
		call	UI_ContainerLifecycle
		add	sp, 4

loc_159DE:				; CODE XREF: seg015:0ACCj seg015:0ADAj ...
		mov	ax, si
		add	ax, 26h	; '&'
		push	ax
		call	UI_NotifyListRepaint
		pop	cx
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Widget_MainHandler
		pop	cx

loc_159F6:				; CODE XREF: seg015:0AA6j seg015:0AB0j
		push	si
		mov	ax, si
		add	ax, 0F5h ; '�'
		push	ax
		call	Subtitle_WidgetInit
		add	sp, 4
		mov	ax, si
		add	ax, 0F5h ; '�'
		push	ax
		mov	bx, [si+0F5h]
		call	dword ptr [bx+8]
		pop	cx
		cmp	byte ptr [si+1BCh], 0
		jnz	short loc_15A1D
		jmp	loc_15A9C
; ���������������������������������������������������������������������������

loc_15A1D:				; CODE XREF: seg015:0B28j
		push	word ptr [bp-12h]
		push	word ptr [si+173h]
		mov	bx, [si+173h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	di, si
		add	di, 175h
		mov	eax, [di]
		mov	[bp-0A2h], eax
		mov	eax, [di+4]
		mov	[bp-9Eh], eax
		mov	eax, [di+8]
		mov	[bp-9Ah], eax
		push	word ptr [bp-12h]
		lea	ax, [bp-0A2h]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	di, [bp-10h]
		add	di, 12h
		mov	eax, [di]
		mov	bx, [si+173h]
		mov	[bx+12h], eax
		mov	eax, [di+4]
		mov	[bx+16h], eax
		mov	eax, [di+8]
		mov	[bx+1Ah], eax
		mov	eax, [bp-0A2h]
		add	[bx+12h], eax
		mov	eax, [bp-9Eh]
		add	[bx+16h], eax
		mov	eax, [bp-9Ah]
		add	[bx+1Ah], eax

loc_15A9C:				; CODE XREF: seg015:0B2Aj
		cmp	byte_72B41, 0
		jnz	short loc_15AAA
		cmp	byte_721CA, 0
		jz	short loc_15AAF

loc_15AAA:				; CODE XREF: seg015:0BB1j
		mov	byte ptr [si+21Fh], 1

loc_15AAF:				; CODE XREF: seg015:0BB8j
		push	si
		nop
		push	cs
		call	near ptr Cockpit_DetectPlayerMissile
		pop	cx
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_15ABA	dw offset loc_1561D	; DATA XREF: seg015:071Cr
		dw offset loc_15611	; jump table for switch	statement
		dw offset loc_1563F
		dw offset loc_15629
		dw offset loc_15635
		dw offset loc_1563F

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,49L — recherche dans une table de 0x1D octets/entrée (+0x133) l'entrée dont le premier
; octet correspond à arg_2 ; si trouvée, invoque sub_23C82(code 4) : sélection d'une entrée de
; liste (radar/cible) par touche.
; ==============================================================================================
Radar_SelectEntryByKey	proc far		; CODE XREF: Mission_TriggerEvaluator+217P

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_15B0C
; ���������������������������������������������������������������������������

loc_15AD1:				; CODE XREF: Radar_SelectEntryByKey+4Aj
		mov	ax, dx
		imul	ax, 1Dh
		mov	bx, [si+133h]
		add	bx, ax
		cmp	byte ptr [bx], 0FFh
		jz	short loc_15B0B
		mov	ax, dx
		imul	ax, 1Dh
		mov	bx, [si+133h]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+arg_2]
		jnz	short loc_15B0B
		mov	byte ptr [si+21Eh], 0
		mov	[si+125h], dx
		push	4
		push	59CDh
		call	EntityTracker_SelectByStateCode
		add	sp, 4
		jmp	short loc_15B12
; ���������������������������������������������������������������������������

loc_15B0B:				; CODE XREF: Radar_SelectEntryByKey+19j
					; Radar_SelectEntryByKey+2Bj
		inc	dx

loc_15B0C:				; CODE XREF: Radar_SelectEntryByKey+9j
		cmp	[si+123h], dx
		jg	short loc_15AD1

loc_15B12:				; CODE XREF: Radar_SelectEntryByKey+43j
		pop	si
		pop	bp
		retf
Radar_SelectEntryByKey	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,45L — bascule le suivi radar : affiche 'Target tracking OFF' (sub_6AEF3) si conditions
; remplies, appelle sub_6ACB5 ou sub_6B085 selon l'état : handler ON/OFF du suivi de cible
; radar (UI cockpit).
; ==============================================================================================
Radar_ToggleTracking	proc far		; CODE XREF: EntityTracker_SelectByStateCode+3EP

var_6		= dword	ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1BCh], 0
		jz	short loc_15B53
		cmp	byte ptr [si+1BBh], 0
		jz	short loc_15B45
		sub	sp, 4
		mov	[bp+var_6], 100h
		push	ds
		push	offset aTargetTracki_1 ; "Target tracking OFF"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch

loc_15B45:				; CODE XREF: Radar_ToggleTracking+13j
		mov	byte ptr [si+1BBh], 0
		push	si
		call	VROOMM_StubThunk_6ACB5
		pop	cx
		jmp	short loc_15B64
; ���������������������������������������������������������������������������

loc_15B53:				; CODE XREF: Radar_ToggleTracking+Cj
		mov	al, [si+21Eh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15B64
		push	si
		call	VROOMM_StubThunk_6B085
		pop	cx

loc_15B64:				; CODE XREF: Radar_ToggleTracking+3Cj
					; Radar_ToggleTracking+46j
		pop	si
		pop	bp
		retf
Radar_ToggleTracking	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,515L — appelée UNE FOIS PAR FRAME depuis Camera_ExternalViewComputeMain_1519E
; (loc_15485), memes args (si=controleur de vue, di=sujet avion) : PAS une mise a jour HUD
; generique (ancien resume faux/devine) mais une MACHINE A ETATS DE TRANSITION DE VUE/PAN. (1)
; garde de reentree byte_6E1C1, pan initial optionnel si byte_6E4CF && si[+0x1F4] ->
; Cockpit_PanAzimuthUpdate(541Ah,&1.0). (2) di->vtable[0x34]() code d etat compare a 6 ; si
; different, tout le reste est saute -- signification du code 6 NON CONFIRMEE (l ancien
; commentaire devinait "detruit", aucune preuve). (3)+(4) deux machines a etat quasi
; identiques (si[+0x1BF/1C3]->[+0x1D7] cible [+0x1D3], si[+0x1C7/1CB] meme motif) : rampe
; si[+0x1D7] vers si[+0x1D3] au rythme dword_70458, stubs VROOMM non resolus
; (6B099/6B08F/6B094) -- ressemble a une animation zoom/transition MFD en 2 etapes, PAS un
; calcul camera 3D. (5) bloc cle (garde byte_72365) : relit si[+0x14F] (LE MEME champ vecteur
; avant que Camera_ExternalViewComputeMain_1519E rate-limite a 6.0u/frame), le fait tourner
; via Matrix_LocalToWorld_58828(forward, subject->vtable[0x3C]()), calcule bearing/elevation
; via Targeting_ComputeBearingElevation_55B1A(5AA7h,&forward) ; si si[+0x1EC] >= bearing_elev
; -> declenche un VRAI pan de camera Camera_PanTransitionExtended(541Ah,&value,si[+0x1E5..E7])
; (value = si[+0x1F0]*bearing_elev + si[+0x1E8]), sinon si si[+0x1E4] etait actif -> retour
; neutre Cockpit_PanAzimuthUpdate(541Ah,&1.0). C EST DONC UN MECANISME DE RATTRAPAGE/SNAP DE
; REGARD quand la cible sort du cadre, reutilisant directement le vecteur avant de la camera
; chase -- pertinent pour le mecanisme padlock/TARGET. (6) bloc similaire (garde byte_6E4CF)
; avec une constante fixe 4Ch (76) au lieu du calcul bearing/elevation -- probable retour a
; une position fixe. RESTE OUVERT : semantique exacte de vtable[0x34]()/vtable[0x3C](),
; Targeting_ComputeBearingElevation_55B1A et Camera_PanTransitionExtended non tracees en
; detail, stubs VROOMM 6B099/6B08F/6B094/6B080/6B085 non resolus. Lu integralement ligne a
; ligne le 2026-09-12 (demande explicite de verification, ancien resume issu d une passe
; rapide/partielle).
; ==============================================================================================
Cockpit_ViewPanTransitionMain_15B67	proc far		; CODE XREF: seg015:059Bp

var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, byte_6E1C1
		mov	ah, 0
		or	ax, ax
		jz	short loc_15B81
		jmp	loc_15FCF
; ���������������������������������������������������������������������������

loc_15B81:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+15j
		mov	byte_6E1C1, 1
		cmp	byte_6E4CF, 0
		jz	short loc_15BB5
		cmp	byte ptr [si+1F4h], 0
		jz	short loc_15BB5
		mov	[bp+var_4], 100h
		lea	ax, [bp+var_4]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		mov	byte ptr [si+1F4h], 0
		mov	byte_6E4CF, 0

loc_15BB5:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+24j
					; Cockpit_ViewPanTransitionMain_15B67+2Bj
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_15BC3
		jmp	loc_15E79
; ���������������������������������������������������������������������������

loc_15BC3:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+57j
		mov	al, [si+1E4h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_15BD0
		jmp	loc_15E79
; ���������������������������������������������������������������������������

loc_15BD0:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+64j
		cmp	byte_72364, 0
		jnz	short loc_15BDA
		jmp	loc_15E79
; ���������������������������������������������������������������������������

loc_15BDA:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+6Ej
		mov	[bp+var_A], di
		mov	bx, [bp+var_A]
		push	word ptr [bx+51h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		add	ax, 7Ch	; '|'
		mov	word ptr [bp+var_10], ax
		mov	bx, word ptr [bp+var_10]
		mov	eax, [bx]
		mov	[bp+var_10+2], eax
		mov	eax, [si+1BFh]
		cmp	eax, [bp+var_10+2]
		jge	short loc_15C0C
		mov	ax, 1
		jmp	short loc_15C0E
; ���������������������������������������������������������������������������

loc_15C0C:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+9Ej
		xor	ax, ax

loc_15C0E:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+A3j
		or	al, al
		jnz	short loc_15C15
		jmp	loc_15D03
; ���������������������������������������������������������������������������

loc_15C15:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+A9j
		cmp	byte ptr [si+1E0h], 0
		jz	short loc_15C72
		mov	eax, [si+1D7h]
		cmp	eax, [si+1D3h]
		jge	short loc_15C2D
		mov	ax, 1
		jmp	short loc_15C2F
; ���������������������������������������������������������������������������

loc_15C2D:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+BFj
		xor	ax, ax

loc_15C2F:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+C4j
		or	al, al
		jz	short loc_15C44
		push	si
		call	VROOMM_StubThunk_6B099
		pop	cx
		push	si
		call	VROOMM_StubThunk_6B094
		pop	cx
		jmp	loc_15E79
; ���������������������������������������������������������������������������

loc_15C44:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+CAj
		mov	eax, [si+1D3h]
		mov	[si+1D7h], eax
		mov	byte ptr [si+1DFh], 1
		mov	byte ptr [si+1E0h], 0
		mov	[bp+var_14], 100h
		lea	ax, [bp+var_14]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		jmp	loc_15E79
; ���������������������������������������������������������������������������

loc_15C72:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+B3j
		mov	ax, si
		add	ax, 1C3h
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	[bp+var_20], eax
		mov	ax, si
		add	ax, 1BFh
		mov	[bp+var_24], ax
		mov	bx, [bp+var_24]
		mov	eax, [bp+var_10+2]
		sub	eax, [bx]
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		sub	[si+1D7h], eax
		cmp	dword ptr [si+1D7h], 0
		jge	short loc_15CDD
		mov	ax, 1
		jmp	short loc_15CDF
; ���������������������������������������������������������������������������

loc_15CDD:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+16Fj
		xor	ax, ax

loc_15CDF:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+174j
		or	al, al
		jz	short loc_15CF4
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]
		mov	[si+1D7h], eax

loc_15CF4:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+17Aj
		push	si
		call	VROOMM_StubThunk_6B08F
		pop	cx
		mov	byte ptr [si+1DFh], 1
		jmp	loc_15E79
; ���������������������������������������������������������������������������

loc_15D03:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+ABj
		mov	eax, [si+1C7h]
		cmp	eax, [bp+var_10+2]
		jle	short loc_15D13
		mov	ax, 1
		jmp	short loc_15D15
; ���������������������������������������������������������������������������

loc_15D13:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+1A5j
		xor	ax, ax

loc_15D15:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+1AAj
		or	al, al
		jnz	short loc_15D1C
		jmp	loc_15E09
; ���������������������������������������������������������������������������

loc_15D1C:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+1B0j
		cmp	byte ptr [si+1DFh], 0
		jz	short loc_15D79

loc_15D23:
		mov	eax, [si+1D7h]

loc_15D28:
		cmp	eax, [si+1D3h]

loc_15D2D:
		jge	short loc_15D34

loc_15D2F:
		mov	ax, 1

loc_15D32:
		jmp	short loc_15D36
; ���������������������������������������������������������������������������

loc_15D34:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67:loc_15D2Dj
		xor	ax, ax

loc_15D36:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67:loc_15D32j
		or	al, al
		jz	short loc_15D4B
		push	si
		call	VROOMM_StubThunk_6B099
		pop	cx
		push	si
		call	VROOMM_StubThunk_6B08F
		pop	cx
		jmp	loc_15E79
; ���������������������������������������������������������������������������

loc_15D4B:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+1D1j
		mov	eax, [si+1D3h]
		mov	[si+1D7h], eax
		mov	byte ptr [si+1DFh], 0
		mov	byte ptr [si+1E0h], 1
		mov	[bp+var_18], 100h
		lea	ax, [bp+var_18]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		jmp	loc_15E79
; ���������������������������������������������������������������������������

loc_15D79:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+1BAj
		mov	ax, si
		add	ax, 1CBh
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	[bp+var_20], eax
		mov	ax, si
		add	ax, 1C7h
		mov	[bp+var_24], ax
		mov	bx, [bp+var_24]
		mov	eax, [bp+var_10+2]
		sub	eax, [bx]
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		sub	[si+1D7h], eax
		cmp	dword ptr [si+1D7h], 0
		jge	short loc_15DE4
		mov	ax, 1
		jmp	short loc_15DE6
; ���������������������������������������������������������������������������

loc_15DE4:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+276j
		xor	ax, ax

loc_15DE6:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+27Bj
		or	al, al
		jz	short loc_15DFB
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]
		mov	[si+1D7h], eax

loc_15DFB:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+281j
		push	si
		call	VROOMM_StubThunk_6B094
		pop	cx
		mov	byte ptr [si+1E0h], 1
		jmp	short loc_15E79
; ���������������������������������������������������������������������������

loc_15E09:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+1B2j
		cmp	byte ptr [si+1DFh], 0
		jnz	short loc_15E17
		cmp	byte ptr [si+1E0h], 0
		jz	short loc_15E79

loc_15E17:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+2A7j
		mov	eax, [si+1D7h]
		cmp	eax, [si+1D3h]
		jge	short loc_15E28
		mov	ax, 1

loc_15E26:
		jmp	short loc_15E2A
; ���������������������������������������������������������������������������

loc_15E28:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+2BAj
		xor	ax, ax

loc_15E2A:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67:loc_15E26j
		or	al, al
		jz	short loc_15E4E
		push	si

loc_15E2F:
		call	VROOMM_StubThunk_6B099
		pop	cx
		cmp	byte ptr [si+1DFh], 0
		jz	short loc_15E45
		push	si
		call	VROOMM_StubThunk_6B08F
		pop	cx
		jmp	short loc_15E79
; ���������������������������������������������������������������������������

loc_15E45:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+2D3j
		push	si
		call	VROOMM_StubThunk_6B094
		pop	cx
		jmp	short loc_15E79
; ���������������������������������������������������������������������������

loc_15E4E:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+2C5j
		mov	eax, [si+1D3h]
		mov	[si+1D7h], eax
		mov	byte ptr [si+1DFh], 0
		mov	byte ptr [si+1E0h], 0
		mov	[bp+var_1C], 100h
		lea	ax, [bp+var_1C]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4

loc_15E79:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+59j
					; Cockpit_ViewPanTransitionMain_15B67+66j ...
		cmp	byte_70477, 0
		jnz	short loc_15E83
		jmp	loc_15F7C
; ���������������������������������������������������������������������������

loc_15E83:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+317j
		mov	al, [si+1DFh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_15E90
		jmp	loc_15F7C
; ���������������������������������������������������������������������������

loc_15E90:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+324j
		mov	al, [si+1E0h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_15E9D
		jmp	loc_15F7C
; ���������������������������������������������������������������������������

loc_15E9D:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+331j
		cmp	byte_72365, 0
		jnz	short loc_15EA7
		jmp	loc_15F7C
; ���������������������������������������������������������������������������

loc_15EA7:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+33Bj
		mov	cx, si
		add	cx, 14Fh
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_3C], eax
		mov	eax, [bx+4]
		mov	[bp+var_38], eax
		mov	eax, [bx+8]
		mov	[bp+var_34], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		push	5AA7h
		lea	ax, [bp+var_3C]
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	eax, [si+1ECh]
		cmp	eax, dword ptr [bp+var_C]
		jl	short loc_15EFE
		mov	ax, 1
		jmp	short loc_15F00
; ���������������������������������������������������������������������������

loc_15EFE:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+390j
		xor	ax, ax

loc_15F00:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+395j
		or	al, al
		jz	short loc_15F59
		mov	di, si
		add	di, 1F0h
		mov	eax, [di]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	edx, dword ptr [bp+var_C]
		imul	edx
		shrd	eax, edx, 8

loc_15F21:
		mov	[bp+var_14], eax
		mov	di, si
		add	di, 1E8h

loc_15F2B:
		mov	eax, [di]
		add	[bp+var_14], eax
		mov	di, si
		add	di, 1E5h
		mov	al, [di+2]
		push	ax
		mov	al, [di+1]
		push	ax
		mov	al, [di]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		push	541Ah
		call	Camera_PanTransitionExtended
		add	sp, 0Ah
		mov	byte ptr [si+1E4h], 1
		jmp	short loc_15F7C
; ���������������������������������������������������������������������������

loc_15F59:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+39Bj
		cmp	byte ptr [si+1E4h], 0
		jz	short loc_15F7C
		mov	[bp+var_10], 100h
		lea	ax, [bp+var_10]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		mov	byte ptr [si+1E4h], 0

loc_15F7C:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+319j
					; Cockpit_ViewPanTransitionMain_15B67+326j ...
		cmp	byte_6E4CF, 0
		jz	short loc_15FCF
		mov	[bp+var_8], 100h
		lea	ax, [bp+var_8]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		mov	[bp+var_10], 4Ch ; 'L'
		mov	eax, [bp+var_10]
		mov	[bp-0Ch], eax
		mov	di, si
		add	di, 1F5h
		mov	al, [di+2]
		push	ax
		mov	al, [di+1]
		push	ax
		mov	al, [di]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		push	541Ah
		call	Camera_PanTransitionExtended
		add	sp, 0Ah
		mov	byte ptr [si+1F4h], 1

loc_15FCF:				; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+17j
					; Cockpit_ViewPanTransitionMain_15B67+41Aj
		pop	di
		pop	si
		leave
		retf
Cockpit_ViewPanTransitionMain_15B67	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,242L — parcourt tous les objets du monde (sub_224DA, type 0x59C3) cherchant un objet de
; type 8 (missile) dont le propriétaire (+0x55) est le joueur (word_722E6) : détection
; 'missile actif du joueur' pour affichage d'alerte cockpit.
; ==============================================================================================
Cockpit_DetectPlayerMissile	proc far		; CODE XREF: seg015:0BC2p

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_4], 0
		jmp	short loc_16014
; ���������������������������������������������������������������������������

loc_15FE9:				; CODE XREF: Cockpit_DetectPlayerMissile+52j
		mov	di, [bp+var_4]
		or	di, di
		jz	short loc_16014
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_16014
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 8
		jnz	short loc_16014
		mov	ax, [di+55h]
		cmp	ax, word_722E6
		jnz	short loc_16014
		mov	[bp+var_1], 1
		jmp	short loc_16027
; ���������������������������������������������������������������������������

loc_16014:				; CODE XREF: Cockpit_DetectPlayerMissile+14j
					; Cockpit_DetectPlayerMissile+1Bj ...
		lea	ax, [bp+var_4]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_15FE9

loc_16027:				; CODE XREF: Cockpit_DetectPlayerMissile+3Fj
		cmp	[bp+var_1], 0
		jz	short loc_16048
		mov	al, byte_6D8AD
		mov	ah, 0
		or	ax, ax
		jz	short loc_16039
		jmp	loc_16112
; ���������������������������������������������������������������������������

loc_16039:				; CODE XREF: Cockpit_DetectPlayerMissile+61j
		mov	byte_6D8AD, 1
		push	1
		push	cs
		call	near ptr Cockpit_LoadBettyPack
		pop	cx
		jmp	loc_16112
; ���������������������������������������������������������������������������

loc_16048:				; CODE XREF: Cockpit_DetectPlayerMissile+58j
		mov	byte_6D8AD, 0
		mov	bx, [si+20h]
		mov	bx, [bx+2]
		mov	di, [bx+51h]
		push	di
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	Physics_ApplyGroundHeightConstraint
		add	sp, 6
		cmp	[bp+var_A], 400h
		jle	short loc_16073
		mov	ax, 1
		jmp	short loc_16075
; ���������������������������������������������������������������������������

loc_16073:				; CODE XREF: Cockpit_DetectPlayerMissile+99j
		xor	ax, ax

loc_16075:				; CODE XREF: Cockpit_DetectPlayerMissile+9Ej
		or	al, al
		jz	short loc_1609A
		cmp	word_70466, 2
		jbe	short loc_1609A
		mov	al, byte_6D8AE
		mov	ah, 0
		or	ax, ax
		jz	short loc_1608C
		jmp	loc_16112
; ���������������������������������������������������������������������������

loc_1608C:				; CODE XREF: Cockpit_DetectPlayerMissile+B4j
		mov	byte_6D8AE, 1
		push	2
		push	cs
		call	near ptr Cockpit_LoadBettyPack
		pop	cx
		jmp	short loc_16112
; ���������������������������������������������������������������������������

loc_1609A:				; CODE XREF: Cockpit_DetectPlayerMissile+A4j
					; Cockpit_DetectPlayerMissile+ABj
		mov	byte_6D8AE, 0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+48h]
		pop	cx
		mov	di, ax
		mov	al, [di+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_160CC
		mov	al, byte_6D8AF
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16112
		mov	byte_6D8AF, 1
		push	0
		push	cs
		call	near ptr Cockpit_LoadBettyPack
		pop	cx
		jmp	short loc_16112
; ���������������������������������������������������������������������������

loc_160CC:				; CODE XREF: Cockpit_DetectPlayerMissile+E0j
		mov	byte_6D8AF, 0
		mov	eax, [di+69h]
		sar	eax, 3
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	eax, [di+6Dh]
		cmp	eax, [bp+var_12]
		jge	short loc_160F0
		mov	ax, 1
		jmp	short loc_160F2
; ���������������������������������������������������������������������������

loc_160F0:				; CODE XREF: Cockpit_DetectPlayerMissile+116j
		xor	ax, ax

loc_160F2:				; CODE XREF: Cockpit_DetectPlayerMissile+11Bj
		or	al, al
		jz	short loc_1610D
		mov	al, byte_6D8B0
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16112
		mov	byte_6D8B0, 1
		push	0
		push	cs
		call	near ptr Cockpit_LoadBettyPack
		pop	cx
		jmp	short loc_16112
; ���������������������������������������������������������������������������

loc_1610D:				; CODE XREF: Cockpit_DetectPlayerMissile+121j
		mov	byte_6D8B0, 0

loc_16112:				; CODE XREF: Cockpit_DetectPlayerMissile+63j
					; Cockpit_DetectPlayerMissile+72j ...
		mov	bx, [si+20h]
		mov	al, [bx+95h]
		mov	[bp+var_6], al
		cmp	[bp+var_6], 1
		jnz	short loc_1616F

loc_16122:
		cmp	word ptr [bx+8Fh], 0

loc_16127:
		jle	short loc_1616F

loc_16129:
		mov	ax, [bx+5Ch]
		mov	word ptr [bp+var_A+2], ax

loc_1612F:
		cmp	word ptr [bp+var_A+2], 0
		jz	short loc_16146

loc_16135:
		cmp	byte ptr [bx+96h], 0
		jz	short loc_16146
		mov	byte ptr [bp+var_A], 7
		mov	byte ptr [bp+var_E+2], 6
		jmp	short loc_1614E
; ���������������������������������������������������������������������������

loc_16146:				; CODE XREF: Cockpit_DetectPlayerMissile+160j
					; Cockpit_DetectPlayerMissile+167j
		mov	byte ptr [bp+var_A], 6
		mov	byte ptr [bp+var_E+2], 7

loc_1614E:				; CODE XREF: Cockpit_DetectPlayerMissile+171j
		push	0
		mov	al, byte ptr [bp+var_E+2]
		push	ax
		call	Weapon_HUDBox_TimerCaseJ_5A95E
		add	sp, 4
		push	0
		push	large 0
		mov	al, byte ptr [bp+var_A]
		push	ax
		call	Weapon_HUDBox_TimerCaseI_5A906
		add	sp, 8
		jmp	short loc_16187
; ���������������������������������������������������������������������������

loc_1616F:				; CODE XREF: Cockpit_DetectPlayerMissile+14Dj
					; Cockpit_DetectPlayerMissile:loc_16127j
		push	0
		push	6
		call	Weapon_HUDBox_TimerCaseJ_5A95E
		add	sp, 4
		push	0
		push	7

loc_1617F:
		call	Weapon_HUDBox_TimerCaseJ_5A95E
		add	sp, 4

loc_16187:				; CODE XREF: Cockpit_DetectPlayerMissile+19Aj
		pop	di
		pop	si
		leave
		retf
Cockpit_DetectPlayerMissile	endp

seg015		ends
