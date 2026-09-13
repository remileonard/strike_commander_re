ovr229		segment	para public 'OVERLAY' use16
		assume cs:ovr229
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 45 lignes - constructeur generique du noeud de propriete nommee (tag de classe 0x2F8),
; appele via le thunk VROOMM_StubThunk_6AB4A. Prend deux pointeurs far : le noeud deja alloue
; (0x28 octets, tag memoire 0x5C44) et une SOURCE (dans le cas du chargement PROF/MVRS, le
; pointeur PilotProfile lui-meme). Stocke : node[+8] = pointeur source brut (reference arriere
; vers l'objet proprietaire), node[+0x11] = copie du champ a l'offset +2 de la source
; (contexte/type). Les champs [+0xC],[+0x13],[+0x21],[+2] sont initialises a zero. L'appelant
; reecrit ensuite node[0] avec un tag specifique a la propriete (valeurs observees : 0x2A0 par
; defaut, 0x2B4/0x28C/0x278/0x250/0x214/0x188/0x174/0x26/0x36 selon le cas, 0x326 pour un
; usage par Goal_ExecuteAction_A8AC) - la semantique exacte de ces tags n'est PAS resolue.
; Anciennement mal nommee TargetTrackObject_Construct (aucun rapport avec le suivi de cible,
; erreur du balayage rapide initial). CLASSE COMPLETE IDENTIFIEE (ovr229, 5 fonctions, 161
; lignes au total - confirme l'hypothese 'un overlay = une classe C++') : voir
; NotifiableRef_AttachTarget_75612, NotifiableRef_DetachTarget_75661,
; NotifiableRef_SwapTarget_756A4, NotifiableRef_Destructor_756D5.
; ==============================================================================================
PilotProfile_NamedPropertyNode_Construct_755A0	proc far		; CODE XREF: VROOMM_StubThunk_6AB4AJ

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_755C8
		push	1
		push	0
		push	2
		push	large 22h ; '"'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_7560A

loc_755C8:				; CODE XREF: PilotProfile_NamedPropertyNode_Construct_755A0+8j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 2F8h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Dh
		mov	word ptr es:[bx+13h], 0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 15h
		mov	eax, [bp+arg_4]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+0Ch], 0
		les	bx, es:[bx+8]
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+11h], ax
		mov	byte ptr es:[bx+21h], 0
		mov	word ptr es:[bx+2], 0

loc_7560A:				; CODE XREF: PilotProfile_NamedPropertyNode_Construct_755A0+26j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
PilotProfile_NamedPropertyNode_Construct_755A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 31 lignes - CONFIRME methode de la classe 'reference notifiable' (ovr229, meme classe
; que PilotProfile_NamedPropertyNode_Construct_755A0). Appelee via VROOMM_StubThunk_6AB45.
; Copie this+4/+6 (dword) vers l'objet cible dereference (this+8 -> +0xF/+0xD), copie
; this+0x21 (byte) vers cible+0x19, reinitialise this+0xC=0. SI this+4 (dword) == 0 : appelle
; la methode virtuelle [vtable+0x1Ch] du POINTEUR CIBLE avec argument 1 - probable
; notification 'attache-toi a moi' quand la cible n'a pas encore de valeur de retour en cache.
; Anciennement mal nommee TargetTrackObject_Helper (balayage rapide, jamais revalidee).
; ==============================================================================================
NotifiableRef_AttachTarget_75612	proc far		; CODE XREF: VROOMM_StubThunk_6AB45J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		les	bx, es:[bx+8]
		mov	es:[bx+0Fh], ax
		mov	es:[bx+0Dh], dx
		les	bx, [bp+arg_0]
		mov	al, es:[bx+21h]
		les	bx, es:[bx+8]
		mov	es:[bx+19h], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 0
		cmp	dword ptr es:[bx+4], 0
		jnz	short loc_7565F
		push	1
		push	large dword ptr	es:[bx+8]
		les	bx, es:[bx+8]
		mov	bx, es:[bx]
		call	dword ptr [bx+1Ch]
		add	sp, 6

loc_7565F:				; CODE XREF: NotifiableRef_AttachTarget_75612+37j
		pop	bp
		retf
NotifiableRef_AttachTarget_75612	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 25 lignes - CONFIRME methode SOEUR de NotifiableRef_AttachTarget_75612 (meme classe,
; ovr229). Appelee via VROOMM_StubThunk_6AB54 - CONNEXION MAJEURE : ce thunk est le meme que
; celui appele partout dans le code IA pour 'notifier la cible' (AIEntity_MasterTick_5ACC,
; Entity_ProximityTest_ThreatGate_315B, et d'autres) - confirme que le mecanisme de
; notification de cible dissemine dans tout le systeme IA appartient a CETTE CLASSE, qui n'est
; donc PAS reservee aux noeuds de propriete MVRS mais sert de wrapper de reference notifiable
; generique. Remet a zero this+8->+0xF/+0xD (au lieu de copier depuis this+4/+6 comme la
; variante Attach), copie this+0x21 vers cible+0x19, reinitialise this+0xC=0, puis appelle
; INCONDITIONNELLEMENT [vtable+0x1Ch] de la cible avec argument 0 - probable 'detache-toi de
; moi'. Anciennement mal nommee TargetTrackObject_Helper2.
; ==============================================================================================
NotifiableRef_DetachTarget_75661	proc far		; CODE XREF: VROOMM_StubThunk_6AB54J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	word ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+0Dh], 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+21h]
		les	bx, es:[bx+8]
		mov	es:[bx+19h], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 0
		push	0
		push	large dword ptr	es:[bx+8]
		les	bx, es:[bx+8]
		mov	bx, es:[bx]
		call	dword ptr [bx+1Ch]
		add	sp, 6
		pop	bp
		retf
NotifiableRef_DetachTarget_75661	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 21 lignes - CONFIRME methode de la meme classe (ovr229) : operation 'echange' entre
; this et sa cible dereferencee (this+8) - lit cible+0xF/+0xD et les copie vers this+6/+4,
; PUIS ecrit une nouvelle valeur (argument passe en this+2/this) dans cible+0xF/+0xD. Get-
; then-set sur le meme champ. Anciennement mal nommee TargetTrackObject_Helper3.
; ==============================================================================================
NotifiableRef_SwapTarget_756A4	proc far		; CODE XREF: VROOMM_StubThunk_6AB4FJ

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Fh]
		mov	dx, es:[bx+0Dh]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx
		les	bx, es:[bx+8]
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		mov	es:[bx+0Fh], ax
		mov	es:[bx+0Dh], dx
		pop	bp
		retf
NotifiableRef_SwapTarget_756A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 39 lignes - CONFIRME etre le vrai destructeur (convention Borland 'ScalarDeletingDtor')
; de la classe de reference notifiable (ovr229, meme classe que
; PilotProfile_NamedPropertyNode_Construct_755A0). Pose node[0]=0x2F8 (meme tag temporaire que
; le constructeur), appelle WeakRef_InvalidateFar_3A432 sur node+0x13 (liberation de la
; reference faible etablie a la construction - confirme le lien avec le registre de pointeurs
; faibles deja documente, seg081), puis SI le bit0 de l'argument arg_4 est pose : appelle
; Memory_TypedFree_5C7B6 (tag 0x5C44) pour liberer reellement la memoire du noeud -
; destructeur conditionnel classique (delete vs destroy-in-place). Anciennement mal nommee
; TargetTrackObject_ScalarDeletingDtor.
; ==============================================================================================
NotifiableRef_Destructor_756D5	proc far		; CODE XREF: VROOMM_StubThunk_6AB40J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_75721
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 2F8h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	WeakRef_InvalidateFar
		add	sp, 4
		test	si, 1
		jz	short loc_75721
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_75721:				; CODE XREF: NotifiableRef_Destructor_756D5+Fj
					; NotifiableRef_Destructor_756D5+2Fj
		pop	si
		leave
		retf
NotifiableRef_Destructor_756D5	endp

ovr229		ends
