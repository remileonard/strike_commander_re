seg010		segment	byte public 'CODE' use16
		assume cs:seg010
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 102 lignes, LUE EN ENTIER. Argument : pointeur far vers un bloc d'états de 0x2B octets
; (vtable 0x130, créé par loc_1297E ; l'entité IA le référence à +0x07/+0x09). Appelle
; WorldObjectA_Method_NoOp_737E0 (via VROOMM_StubThunk_6AA2F, non lue), puis met à zéro les 8
; bits de l'octet +0x1B, les 8 bits de +0x1C et les bits 0-1 de +0x1D (la valeur écrite vient
; de mov al,0) : REMISE À ZÉRO d'un bloc de drapeaux, pas un encodage. Aucun affichage, aucune
; lecture d'un état d'avion. Appelée par HUD_ResetPanel, Player_MainUpdate et
; AIEntity_MasterTick_5ACC : le bloc est donc commun au joueur et aux entités IA. Anciennement
; HUD_EncodeInstruments ('encodeur d'état des instruments de bord') : nom trompeur, rien de
; HUD dans le corps.
; ==============================================================================================
AircraftStateBits_Clear_12806	proc far		; CODE XREF: seg003:0DE2P
					; AircraftStateBlock_Reset_12931+17p ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]

loc_1280D:				; DATA XREF: seg216:010Eo
		call	VROOMM_StubThunk_6AA2F
		add	sp, 4
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+1Ch], 0FBh
		mov	al, 0
		and	byte ptr es:[bx+1Ch], 0F7h
		mov	dx, ax
		shl	al, 3
		or	es:[bx+1Ch], al
		and	dx, 1
		and	byte ptr es:[bx+1Ch], 0FDh
		mov	ax, dx
		shl	dl, 1
		or	es:[bx+1Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+1Dh], 0FDh
		mov	dx, ax
		shl	al, 1
		or	es:[bx+1Dh], al
		and	dx, 1
		and	byte ptr es:[bx+1Dh], 0FEh
		mov	ax, dx
		or	es:[bx+1Dh], dl
		and	ax, 1
		and	byte ptr es:[bx+1Ch], 7Fh
		mov	dx, ax
		shl	al, 7
		or	es:[bx+1Ch], al
		and	dx, 1
		and	byte ptr es:[bx+1Ch], 0BFh
		mov	ax, dx
		shl	dl, 6
		or	es:[bx+1Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+1Ch], 0DFh
		mov	dx, ax
		shl	al, 5
		or	es:[bx+1Ch], al
		and	dx, 1
		and	byte ptr es:[bx+1Ch], 0EFh
		mov	ax, dx
		shl	dl, 4
		or	es:[bx+1Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+1Ch], 0FEh
		mov	dx, ax
		or	es:[bx+1Ch], al
		and	dx, 1
		and	byte ptr es:[bx+1Bh], 7Fh
		mov	ax, dx
		shl	dl, 7
		or	es:[bx+1Bh], dl
		and	ax, 1
		and	byte ptr es:[bx+1Bh], 0BFh
		mov	dx, ax
		shl	al, 6
		or	es:[bx+1Bh], al
		and	dx, 1
		and	byte ptr es:[bx+1Bh], 0DFh
		mov	ax, dx
		shl	dl, 5
		or	es:[bx+1Bh], dl
		and	ax, 1

loc_128E3:
		and	byte ptr es:[bx+1Bh], 0EFh
		mov	dx, ax

loc_128EA:
		shl	al, 4
		or	es:[bx+1Bh], al
		and	dx, 1
		and	byte ptr es:[bx+1Bh], 0F7h
		mov	ax, dx
		shl	dl, 3
		or	es:[bx+1Bh], dl
		and	ax, 1
		and	byte ptr es:[bx+1Bh], 0FBh
		mov	dx, ax
		shl	al, 2
		or	es:[bx+1Bh], al
		and	dx, 1
		and	byte ptr es:[bx+1Bh], 0FDh
		mov	ax, dx
		shl	dl, 1
		or	es:[bx+1Bh], dl
		and	ax, 1
		and	byte ptr es:[bx+1Bh], 0FEh
		or	es:[bx+1Bh], al
		pop	bp
		retf
AircraftStateBits_Clear_12806	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 35 lignes, LUE EN ENTIER. Réinitialise le bloc d'états de 0x2B octets :
; VROOMM_StubThunk_6AA34 (constructeur de base), AircraftStateBits_Clear_12806 (remise à zéro
; des drapeaux +0x1B..+0x1D), octet +0x1E = 0, dwords +0x1F, +0x23, +0x27 = 0, puis
; AircraftStateBits_Clear_12806 à nouveau. Appelée par le constructeur de ce bloc (loc_1297E,
; slot 0 de la vtable 0x130), par AIEntity_Construct_74B43, Player_MainUpdate et
; SubObject_Attach. Le bloc = 3 octets de drapeaux (+0x1B..0x1D), un octet de code (+0x1E) et
; 3 dwords (+0x1F/0x23/0x27) : probable enregistrement de commandes de pilotage (boutons + 3
; axes) commun au joueur et à l'IA — HYPOTHÈSE, non prouvée. Aucun rapport avec un affichage.
; Anciennement HUD_ResetPanel (nom trompeur).
; ==============================================================================================
AircraftStateBlock_Reset_12931	proc far		; CODE XREF: seg010:01C1p
					; SubObject_Attach+62P ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6AA34
		add	sp, 4
		push	large [bp+arg_0]
		push	cs
		call	near ptr AircraftStateBits_Clear_12806
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+1Eh], 0
		mov	[bp+var_4], 0

loc_1295E:
		mov	eax, [bp+var_4]

loc_12962:
		mov	es:[bx+27h], eax
		mov	es:[bx+23h], eax
		mov	es:[bx+1Fh], eax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr AircraftStateBits_Clear_12806
		add	sp, 4
		leave
		retf
AircraftStateBlock_Reset_12931	endp

; ���������������������������������������������������������������������������

loc_1297E:				; DATA XREF: seg339:0130o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	1
		push	0
		push	2
		push	large 2Bh ; '+'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		or	ax, dx
		jz	short loc_129CF
		les	bx, [bp-4]
		mov	word ptr es:[bx], 0C6h ; '�'
		push	dx
		push	bx
		call	VROOMM_StubThunk_6AA34
		add	sp, 4
		les	bx, [bp-4]
		mov	word ptr es:[bx], 130h
		push	word ptr [bp-2]
		push	bx
		push	cs
		call	near ptr AircraftStateBlock_Reset_12931
		add	sp, 4
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		jmp	short locret_129D5
; ���������������������������������������������������������������������������

loc_129CF:				; CODE XREF: seg010:01A0j
		mov	dx, [bp-2]
		mov	ax, [bp-4]

locret_129D5:				; CODE XREF: seg010:01CDj
		leave
		retf
; ���������������������������������������������������������������������������

loc_129D7:				; DATA XREF: seg339:0134o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_12A1F

loc_129E8:
		les	bx, [bp+6]
		mov	word ptr es:[bx], 130h
		push	0
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6AA3E
		add	sp, 6
		test	si, 1
		jz	short loc_12A1F
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_12A1F:				; CODE XREF: seg010:01E6j seg010:0202j
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,132L — notifie via vtable trois références attachées (+0x7,+0x11,+0x15) d'un événement
; (code 3) : propagation d'un événement (probable destruction/largage) vers des sous-objets
; attachés (armement externe?).
; ==============================================================================================
SubObject_NotifyEvent	proc far		; CODE XREF: seg011:00E4P
					; AIEntity_Destruct_74E1C+13BP
					; DATA XREF: ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_12A36
		jmp	loc_12B4B
; ���������������������������������������������������������������������������

loc_12A36:				; CODE XREF: SubObject_NotifyEvent+Fj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 390h
		cmp	dword ptr es:[bx+7], 0
		jz	short loc_12A64
		cmp	dword ptr es:[bx+7], 0
		jz	short loc_12A64
		push	3
		push	large dword ptr	es:[bx+7]
		les	bx, es:[bx+7]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short $+2

loc_12A64:				; CODE XREF: SubObject_NotifyEvent+22j
					; SubObject_NotifyEvent+2Aj
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_12A8C

loc_12A6F:
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_12A8C

loc_12A77:
		push	3
		push	large dword ptr	es:[bx+15h]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short $+2

loc_12A8C:				; CODE XREF: SubObject_NotifyEvent+4Bj
					; SubObject_NotifyEvent+53j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+11h], 0
		jz	short loc_12AB4
		cmp	dword ptr es:[bx+11h], 0
		jz	short loc_12AB4
		push	3
		push	large dword ptr	es:[bx+11h]
		les	bx, es:[bx+11h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short $+2

loc_12AB4:				; CODE XREF: SubObject_NotifyEvent+73j
					; SubObject_NotifyEvent+7Bj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+1Ah], 38Ch
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ah
		push	word ptr [bp+arg_0+2]
		push	ax
		call	RadioQueue_RemoveByPos
		add	sp, 4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+21h], 0
		jz	short loc_12B02
		cmp	dword ptr es:[bx+1Ch], 0
		jz	short loc_12B02
		push	0

loc_12AE3:
		mov	al, es:[bx+20h]
		push	ax

loc_12AE8:
		mov	eax, es:[bx+1Ch]
		mov	[bp+var_4], eax

loc_12AF1:
		lea	ax, [bp+var_4]
		push	ax

loc_12AF5:
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_12B02:				; CODE XREF: SubObject_NotifyEvent+B5j
					; SubObject_NotifyEvent+BDj
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+1Ch], 0
		mov	byte ptr es:[bx+21h], 0
		mov	dword ptr es:[bx+22h], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6AA48
		add	sp, 6
		test	si, 1
		jz	short loc_12B4B
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_12B4B:				; CODE XREF: SubObject_NotifyEvent+11j
					; SubObject_NotifyEvent+10Cj
		pop	si
		leave
		retf
SubObject_NotifyEvent	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle en slot +0 de la vtable de classe de l'entité IA (seg339:0x110, celle
; qui contient AIEntity_MasterTick_5ACC en +0xC) ; même entrée partagée par d'autres vtables
; de seg339 (off_6D41C et suivantes). FABRIQUE PAR TYPE : appelle le slot +0 de l'objet source
; (arg [bp+0Ah]) pour obtenir une structure, lit l'octet de type à +0x34 ; type 1 → alloue
; 0x28E octets (tag 0x5C44), pose la vtable 0x110, initialise le sous-objet +0x1A (vtable
; 0x368) et appelle AIEntity_Construct_74B43 ; type 2 → alloue 0xBD octets (vtable 0xAA puis
; 0x36C) et appelle SubObject_Attach ; autre type → ne crée rien. Aucun appelant direct trouvé
; (appelée uniquement via vtable). Nom proposé, non prouvé côté appelant.
; ==============================================================================================
AIEntity_CreateByType_12B4E:				; DATA XREF: seg339:0110o
					; seg339:off_6D41Co ...
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+0Ah]
		mov	dword ptr [bp-4], 0
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax

loc_12B68:
		mov	es, dx

loc_12B6A:
		mov	al, es:[bx+34h]
		mov	ah, 0

loc_12B70:
		cmp	ax, 1
		jnz	short loc_12B78
		jmp	loc_12C39
; ���������������������������������������������������������������������������

loc_12B78:				; CODE XREF: seg010:0373j
		cmp	ax, 2
		jz	short loc_12B80
		jmp	loc_12DAA
; ���������������������������������������������������������������������������

loc_12B80:				; CODE XREF: seg010:037Bj
		mov	[bp-6],	si
		push	1
		push	0
		push	2
		push	large 0BDh ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp-8],	dx
		mov	[bp-0Ah], ax
		or	ax, dx
		jnz	short loc_12BA7
		jmp	loc_12C30
; ���������������������������������������������������������������������������

loc_12BA7:				; CODE XREF: seg010:03A2j
		les	bx, [bp-0Ah]
		mov	word ptr es:[bx], 0AAh ; '�'
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx+4], 0FFFFh
		push	dx
		push	bx
		call	VROOMM_StubThunk_6AA43
		add	sp, 4
		les	bx, [bp-0Ah]
		mov	word ptr es:[bx], 390h
		mov	ax, [bp-0Ah]
		add	ax, 1Ah
		push	word ptr [bp-8]
		push	ax
		call	VROOMM_StubThunk_6B630
		add	sp, 4
		les	bx, [bp-0Ah]

loc_12BE1:
		mov	word ptr es:[bx+1Ah], 368h

loc_12BE7:
		mov	dword ptr es:[bx+7], 0
		mov	word ptr es:[bx+2], 0
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx], 36Ch
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		push	bx
		call	SubObject_Attach
		add	sp, 6
		mov	dx, [bp-8]
		mov	ax, [bp-0Ah]

loc_12C2D:				; CODE XREF: seg010:059Bj
		jmp	loc_12DA4
; ���������������������������������������������������������������������������

loc_12C30:				; CODE XREF: seg010:03A4j
		mov	dx, [bp-8]
		mov	ax, [bp-0Ah]
		jmp	loc_12DA4
; ���������������������������������������������������������������������������

loc_12C39:				; CODE XREF: seg010:0375j
		mov	[bp-0Ch], si
		push	1
		push	0
		push	2
		push	large 28Eh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp-0Eh], dx
		mov	[bp-10h], ax
		or	ax, dx
		jnz	short loc_12C60
		jmp	loc_12D9E
; ���������������������������������������������������������������������������

loc_12C60:				; CODE XREF: seg010:045Bj
		les	bx, [bp-10h]

loc_12C63:
		mov	word ptr es:[bx], 0AAh ; '�'
		mov	byte ptr es:[bx+6], 0

loc_12C6D:
		mov	word ptr es:[bx+4], 0FFFFh
		push	dx

loc_12C74:
		push	bx
		call	VROOMM_StubThunk_6AA43
		add	sp, 4
		les	bx, [bp-10h]
		mov	word ptr es:[bx], 390h
		mov	ax, [bp-10h]
		add	ax, 1Ah
		push	word ptr [bp-0Eh]
		push	ax
		call	VROOMM_StubThunk_6B630
		add	sp, 4
		les	bx, [bp-10h]
		mov	word ptr es:[bx+1Ah], 368h
		mov	dword ptr es:[bx+7], 0
		mov	word ptr es:[bx+2], 0
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx], 110h
		mov	word ptr es:[bx+10Fh], 0
		mov	word ptr es:[bx+137h], 0

loc_12CDF:
		mov	word ptr es:[bx+145h], 0
		mov	word ptr es:[bx+147h], 0
		mov	dword ptr [bp-14h], 19h
		mov	eax, [bp-14h]
		add	dword_6D3BE, eax
		mov	eax, dword_6D3BE
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	es:[bx+175h], eax
		mov	byte ptr es:[bx+179h], 3
		and	byte ptr es:[bx+174h], 0F7h
		mov	al, 0
		and	byte ptr es:[bx+174h], 0FBh
		mov	dx, ax
		shl	al, 2
		or	es:[bx+174h], al
		and	dx, 1
		and	byte ptr es:[bx+174h], 0FDh
		mov	ax, dx
		shl	dl, 1
		or	es:[bx+174h], dl
		and	ax, 1
		and	byte ptr es:[bx+174h], 0FEh
		or	es:[bx+174h], al
		mov	ax, [bp-10h]
		add	ax, 17Ch
		push	word ptr [bp-0Eh]
		push	ax
		call	HUD_EncodeHelper_57E9E
		add	sp, 4
		les	bx, [bp-10h]
		mov	word ptr es:[bx+281h], 0
		mov	word ptr es:[bx+283h], 0

loc_12D71:
		mov	word ptr es:[bx+285h], 0
		mov	word ptr es:[bx+287h], 0
		mov	word ptr es:[bx+289h], 0
		push	word ptr [bp-0Ch]
		push	word ptr [bp-0Eh]
		push	bx
		call	VROOMM_StubThunk_6AB02
		add	sp, 6
		mov	dx, [bp-0Eh]
		mov	ax, [bp-10h]
		jmp	loc_12C2D
; ���������������������������������������������������������������������������

loc_12D9E:				; CODE XREF: seg010:045Dj
		mov	dx, [bp-0Eh]
		mov	ax, [bp-10h]

loc_12DA4:				; CODE XREF: seg010:loc_12C2Dj
					; seg010:0436j
		mov	[bp-2],	dx
		mov	[bp-4],	ax

loc_12DAA:				; CODE XREF: seg010:037Dj
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,55L — si la cible n'est pas de type 0x12, notifie via sub_6AB54 ; réinitialise le HUD
; (sub_12806, code 4) et les champs de commande, positionne un indicateur selon le flag pilote
; (+0x75 bit1) : handler de fin de manoeuvre/retour à un état neutre.
; ==============================================================================================
Goal_ResetNeutralState	proc far		; CODE XREF: Pilot_LowLevelControlCommand+31P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_12DDF
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+21h], 12h
		jz	short loc_12DDF
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4

loc_12DDF:				; CODE XREF: Goal_ResetNeutralState+Fj
					; Goal_ResetNeutralState+1Aj
		les	bx, [bp+arg_0]

loc_12DE2:
		push	large dword ptr	es:[bx+7]
		push	cs
		call	near ptr AircraftStateBits_Clear_12806
		add	sp, 4
		les	bx, [bp+arg_0]

loc_12DF1:
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 4
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	es:[bx+27h], eax
		mov	es:[bx+23h], eax
		mov	es:[bx+1Fh], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+75h], 0FBh
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 1
		and	ax, 1
		and	ax, 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0EFh
		shl	al, 4
		or	es:[bx+1Ch], al
		leave
		retf
Goal_ResetNeutralState	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, methode de vtable (referencee via DATA XREF seg339, jamais couverte par l'inventaire
; proc precedent) - chargeur du sous-chunk ATRB (attributs du profil pilote) : valide _AI_
; (tag 0x5F49415F) puis ATRB (tag 0x42525441), verifie que la taille du chunk vaut EXACTEMENT
; 0x0A (10 octets, PAS 9 comme suppose dans RSProf.cpp) via
; ResourceRecord_ReadFieldGroupA_64A19. Les 10 octets sont dispatches vers des offsets NON
; sequentiels et NON dans l'ordre de lecture : octet-fichier 0->+0x97, 1->+0x99, 2->+0x98,
; 3->+0x9A, 4->+0x96, 5->+0x9B, 6->+0x9C, 7->+0x9D, 8->+0x9E, 9->+0x9F (ce dernier ecrete a un
; maximum de 3). Les octets 4,5,6 (valeurs a +0x96, +0x9B, +0x9C) sont ensuite dupliques a
; +0xA0, +0xA1, +0xA2 (stockage miroir, meme motif que le systeme de proprietes nommees
; courant/defaut). En l'absence du chunk ou taille incorrecte, des valeurs par defaut NON
; NULLES sont appliquees : 8 pour +0x97/+0x98/+0x99/+0x9A/+0x9D/+0x9E, 0xA (10) pour
; +0x96/+0x9B/+0x9C, 0 pour +0x9F - CONTREDIT l'hypothese de RSProf.cpp (tous a zero par
; defaut). Correction majeure pour le portage : format 10 octets avec reordonnancement et
; defauts non nuls, pas 9 octets sequentiels a zero par defaut.
; ==============================================================================================
PilotProfile_LoadATRB_12E47:				; DATA XREF: seg339:0368o
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+0Ah]
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6B63F
		add	sp, 6
		push	0
		push	large 5F49415Fh
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_12E76
		jmp	loc_12F8F
; ���������������������������������������������������������������������������

loc_12E76:				; CODE XREF: seg010:0671j
		push	0
		push	large 42525441h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_12E8E
		jmp	loc_12F30
; ���������������������������������������������������������������������������

loc_12E8E:				; CODE XREF: seg010:0689j
		cmp	dword ptr [si+72h], 0Ah
		jz	short loc_12E98
		jmp	loc_12F30
; ���������������������������������������������������������������������������

loc_12E98:				; CODE XREF: seg010:0693j
		push	large 0Ah
		push	ss
		lea	ax, [bp-0Ah]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		les	bx, [bp+6]
		mov	al, [bp-0Ah]
		mov	es:[bx+97h], al
		mov	al, [bp-9]
		mov	es:[bx+99h], al
		mov	al, [bp-8]
		mov	es:[bx+98h], al
		mov	al, [bp-7]
		mov	es:[bx+9Ah], al
		mov	al, [bp-6]
		mov	es:[bx+96h], al
		mov	al, [bp-5]
		mov	es:[bx+9Bh], al
		mov	al, [bp-4]

loc_12EDF:
		mov	es:[bx+9Ch], al
		mov	al, [bp-3]

loc_12EE7:
		mov	es:[bx+9Dh], al

loc_12EEC:
		mov	al, [bp-2]
		mov	es:[bx+9Eh], al
		mov	al, [bp-1]
		mov	es:[bx+9Fh], al
		cmp	byte ptr es:[bx+9Fh], 3
		jbe	short loc_12F0A
		mov	byte ptr es:[bx+9Fh], 3

loc_12F0A:				; CODE XREF: seg010:0702j
		les	bx, [bp+6]
		mov	al, [bp-6]
		mov	es:[bx+0A0h], al
		mov	al, [bp-5]
		mov	es:[bx+0A1h], al
		mov	al, [bp-4]
		mov	es:[bx+0A2h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	loc_12FC6
; ���������������������������������������������������������������������������

loc_12F30:				; CODE XREF: seg010:068Bj seg010:0695j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+97h], 8
		mov	byte ptr es:[bx+99h], 8
		mov	byte ptr es:[bx+98h], 8
		mov	byte ptr es:[bx+9Ah], 8
		mov	byte ptr es:[bx+96h], 0Ah
		mov	byte ptr es:[bx+9Bh], 0Ah
		mov	byte ptr es:[bx+9Ch], 0Ah

loc_12F5D:
		mov	byte ptr es:[bx+9Dh], 8

loc_12F63:
		mov	byte ptr es:[bx+9Eh], 8

loc_12F69:
		mov	byte ptr es:[bx+9Fh], 0

loc_12F6F:
		mov	al, es:[bx+96h]

loc_12F74:
		mov	es:[bx+0A0h], al
		mov	al, es:[bx+9Bh]
		mov	es:[bx+0A1h], al
		mov	al, es:[bx+9Ch]
		mov	es:[bx+0A2h], al
		jmp	short loc_12FC6
; ���������������������������������������������������������������������������

loc_12F8F:				; CODE XREF: seg010:0673j
		les	bx, [bp+6]
		mov	al, 0
		mov	es:[bx+98h], al
		mov	es:[bx+9Fh], al
		mov	es:[bx+9Eh], al
		mov	es:[bx+9Dh], al
		mov	es:[bx+9Ch], al
		mov	es:[bx+9Bh], al
		mov	es:[bx+9Ah], al
		mov	es:[bx+99h], al
		mov	es:[bx+97h], al
		mov	es:[bx+96h], al

loc_12FC6:				; CODE XREF: seg010:072Dj seg010:078Dj
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 25 lignes - LUE INTEGRALEMENT (recherche d'usage des traits ATRB non retraces, a la
; demande de Remi - verification rigoureuse par lecture complete, pas par heuristique). RELIT
; le cache duplique de FL/AG/AA (+0xA0/+0xA1/+0xA2, deja documente comme pose par
; PilotProfile_LoadATRB_12E47), applique un DECALAGE A DROITE (sar) par word_7235F (compare a
; 1 et 2 ailleurs dans le code - tres probablement un NIVEAU DE DIFFICULTE 0/1/2), et ECRIT LE
; RESULTAT DANS LES CHAMPS ORIGINAUX (+0x96=FL, +0x9B=AG, +0x9C=AA). CONFIRME un mecanisme de
; remise a l'echelle de la competence de pilotage PAR LA DIFFICULTE DU JEU - plus la
; difficulte est elevee (word_7235F petit), moins le decalage reduit la competence effective.
; Appelee depuis Cockpit_ReadControlsFrame_8F720 (contexte de lecture des commandes cockpit -
; le profil concerne par cet appel precis n'est pas confirme avec certitude, role exact a
; eclaircir si necessaire). PREMIERE CONFIRMATION D'USAGE REEL POUR AG ET AA, distincte du
; role de FL deja connu (bonus quadratique dans MVRS_ID14b) - ce mecanisme de difficulte
; s'applique en amont, sur la valeur de base, avant toute consommation par le tournoi.
; ==============================================================================================
PilotProfile_RescaleSkillByDifficulty_12FC9	proc far		; CODE XREF: Cockpit_ReadControlsFrame_8F720+1B8P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0A0h]
		cbw
		mov	cl, byte ptr word_7235F
		sar	ax, cl
		mov	es:[bx+96h], al
		mov	al, es:[bx+0A1h]
		cbw
		sar	ax, cl
		mov	es:[bx+9Bh], al

loc_12FED:
		mov	al, es:[bx+0A2h]
		cbw
		sar	ax, cl
		mov	es:[bx+9Ch], al
		pop	bp
		retf
PilotProfile_RescaleSkillByDifficulty_12FC9	endp

seg010		ends
