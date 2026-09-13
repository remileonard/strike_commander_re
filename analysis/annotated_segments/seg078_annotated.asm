seg078		segment	byte public 'CODE' use16
		assume cs:seg078
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,23L — remet à zéro les champs d'accumulation (forces, position, cible, sous-composants)
; : constructeur/reset d'un corps physique de débris.
; ==============================================================================================
Debris_BodyReset	proc far		; CODE XREF: Debris_BodyAttachToSubpart+Cp
					; WorldObject_BaseConstruct+37P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+0Ah], 0
		mov	dword ptr [si+0Eh], 0
		xor	eax, eax
		mov	[si+1Ah], eax
		mov	[si+16h], eax
		mov	[si+12h], eax
		mov	word ptr [si+2Ah], 0
		mov	word ptr [si+24h], 0
		mov	word ptr [si+26h], 0
		mov	word ptr [si+1Eh], 0
		pop	si
		pop	bp
		retf
Debris_BodyReset	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,52L — appelle sub_37C4C (reset), enregistre une référence de sous-composant (+0xE),
; copie sa position d'origine (+0x20) : initialisation d'un corps physique de débris attaché à
; un sous-composant de modèle (probable pièce détachée après dommage).
; ==============================================================================================
Debris_BodyAttachToSubpart	proc far		; CODE XREF: seg079:004DP
					; WorldObject_BaseConstructAttached+5DP ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Debris_BodyReset
		pop	cx
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	[si+0Eh], eax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	[si+20h], eax
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		cmp	byte ptr es:[bx+16h], 0
		jz	short loc_37CDC
		or	byte ptr [si+4], 2
		jmp	short loc_37CE0
; ���������������������������������������������������������������������������

loc_37CDC:				; CODE XREF: Debris_BodyAttachToSubpart+4Bj
		and	byte ptr [si+4], 0FDh

loc_37CE0:				; CODE XREF: Debris_BodyAttachToSubpart+51j
		les	bx, [si+0Eh]
		mov	al, es:[bx+12h]
		mov	[si+28h], al
		mov	al, es:[bx+14h]
		mov	[si+29h], al
		pop	si
		leave
		retf
Debris_BodyAttachToSubpart	endp

; ���������������������������������������������������������������������������

loc_37CF4:				; DATA XREF: seg339:1ADCo seg339:1BDEo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	bx, ax
		mov	dx, [bx+10h]
		mov	ax, [bx+0Eh]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,24L — copie la position 3D (+0x12) d'un objet référencé vers un buffer : lecture de la
; position d'un corps physique de débris.
; ==============================================================================================
Debris_BodyGetPosition	proc far		; CODE XREF: seg030:01C8P seg030:024EP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	di, dx
		add	di, 12h
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4],	eax
		mov	eax, [di+8]
		mov	[si+8],	eax
		pop	di
		pop	si
		pop	bp
		retf
Debris_BodyGetPosition	endp

; ���������������������������������������������������������������������������

loc_37D2E:				; DATA XREF: seg339:1AE4o seg339:1BE6o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+26h], 0
		jz	short loc_37D42
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FEh

loc_37D42:				; CODE XREF: seg078:00F9j
		cmp	word ptr [si+1Eh], 0
		jz	short loc_37D51
		push	word ptr [si+1Eh]
		call	Container_Op_22D32
		pop	cx

loc_37D51:				; CODE XREF: seg078:0106j
		pop	si
		pop	bp

locret_37D53:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,44L — accumule 3 vecteurs de force (+0x12/0x16/0x1A), applique un couple additionnel si
; sous-composant présent (sub_37E4A), notifie l'objet (vtable[8]) : intégration des forces
; appliquées sur un débris (physique de corps rigide détaché).
; ==============================================================================================
Debris_BodyIntegrateForces	proc far		; CODE XREF: seg085:02D2P
					; Camera_ComputeMountedPosition_3D31D+B6P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp

loc_37D55:
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		add	[si+12h], eax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		add	[si+16h], eax
		mov	di, [bp+arg_6]

loc_37D73:
		mov	eax, [di]
		add	[si+1Ah], eax
		cmp	word ptr [si+24h], 0
		jz	short loc_37D89
		push	word ptr [si+24h]
		nop
		push	cs
		call	near ptr Debris_ComputeTorque
		pop	cx

loc_37D89:				; CODE XREF: Debris_BodyIntegrateForces+2Aj
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
Debris_BodyIntegrateForces	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,34L — notifie la cible référencée (+0xA, vtable[0x20]), efface un flag sur le parent
; (+0x26, bit1), notifie via sub_22C8C (conteneur) : destruction/détachement d'un corps
; physique de débris.
; ==============================================================================================
Debris_BodyDetach	proc far		; CODE XREF: seg084:01D2P seg084:01F4P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_37DB2
		push	large dword ptr	[si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_37DB2:				; CODE XREF: Debris_BodyDetach+Cj
		cmp	word ptr [si+26h], 0
		jz	short loc_37DBF
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FDh

loc_37DBF:				; CODE XREF: Debris_BodyDetach+22j
		cmp	word ptr [si+1Eh], 0
		jz	short loc_37DCE
		push	word ptr [si+1Eh]
		call	Container_Op_22C8C
		pop	cx

loc_37DCE:				; CODE XREF: Debris_BodyDetach+2Fj
		pop	si
		pop	bp
		retf
Debris_BodyDetach	endp

; ���������������������������������������������������������������������������

loc_37DD1:				; DATA XREF: seg339:1AE8o seg339:1BEAo ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_37DEF
		push	large dword ptr	[si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_37DEF:				; CODE XREF: seg078:019Dj
		cmp	word ptr [si+26h], 0
		jz	short loc_37E00
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FEh
		and	byte ptr [bx+30h], 0FDh

loc_37E00:				; CODE XREF: seg078:01B3j
		cmp	word ptr [si+1Eh], 0
		jz	short loc_37E0F
		push	word ptr [si+1Eh]
		call	Container_Op_22C8C
		pop	cx

loc_37E0F:				; CODE XREF: seg078:01C4j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37E12:				; DATA XREF: seg339:1B08o seg339:1C0Ao ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		pop	cx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37E23:				; DATA XREF: seg339:1B0Co seg339:1C0Eo ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		pop	cx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37E34:				; DATA XREF: seg339:1B48o
					; seg339:off_6ECFAo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, [bp+8]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37E3F:				; DATA XREF: seg339:1B4Co
					; seg339:off_6ECFEo ...
		push	bp
		mov	bp, sp

loc_37E42:
		mov	ax, [bp+6]
		mov	ax, [bp+8]

loc_37E48:
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,58L — calcule le couple généré par une force appliquée à distance du centre de masse
; (sub_22CC6, produit vectoriel position×force) : calcul de couple (moment de force) pour la
; rotation d'un débris.
; ==============================================================================================
Debris_ComputeTorque	proc far		; CODE XREF: Debris_BodyIntegrateForces+31p
					; Debris_ComputeTorque+55p ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_37E4D:
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jz	short loc_37E95
		les	bx, [si+0Eh]

loc_37E5D:
		mov	ax, es:[bx+0Ah]

loc_37E61:
		mov	dx, es:[bx+8]

loc_37E65:
		add	dx, 10h

loc_37E68:
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	word ptr [si+1Eh]
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Container_Op_22CC6
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+20h], eax

loc_37E95:				; CODE XREF: Debris_ComputeTorque+Ej
		cmp	word ptr [si+24h], 0
		jz	short loc_37EA3
		push	word ptr [si+24h]
		push	cs
		call	near ptr Debris_ComputeTorque
		pop	cx

loc_37EA3:				; CODE XREF: Debris_ComputeTorque+4Fj
		pop	si
		leave
		retf
Debris_ComputeTorque	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — calcule la magnitude du vecteur de force accumulé (sub_5828E) plus une composante
; additionnelle (+0x20, probable gravité) : calcul de la force résultante totale sur un débris
; (avec gravité).
; ==============================================================================================
Debris_ComputeNetForce	proc far		; CODE XREF: Container_Op_22CC6+1DP

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	large dword ptr	[si+1Ah]
		push	large dword ptr	[si+16h]
		push	large dword ptr	[si+12h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		add	si, 20h	; ' '
		add	eax, [si]
		mov	[bp+var_10], eax
		mov	bx, word ptr [bp+var_4]
		mov	[bx], eax
		mov	es, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
Debris_ComputeNetForce	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,30L — si un parent existe, applique le transfert de force (sub_37F18) et retourne son
; buffer de couple ; sinon retourne le buffer de force local : résolution du buffer de
; force/couple actif d'un débris (avec ou sans parent).
; ==============================================================================================
Debris_ResolveForceBuffer	proc far		; CODE XREF: Damage_SimulationTick+A3P
					; Debris_TransferForceToParent+59p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_37F10
		push	si
		nop
		push	cs
		call	near ptr Debris_TransferForceToParent
		pop	cx
		mov	ax, [si+26h]
		add	ax, 24h	; '$'
		jmp	short loc_37F15
; ���������������������������������������������������������������������������

loc_37F10:				; CODE XREF: Debris_ResolveForceBuffer+Bj
		mov	ax, si
		add	ax, 12h

loc_37F15:				; CODE XREF: Debris_ResolveForceBuffer+1Aj
		pop	si
		pop	bp
		retf
Debris_ResolveForceBuffer	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,65L — transfère la position et un flag 'déjà transformé' au parent, applique la force
; sur son vecteur de couple (vtable[0x78]) : transfert récursif de force vers le corps parent
; (chaîne de sous-composants physiques).
; ==============================================================================================
Debris_TransferForceToParent	proc far		; CODE XREF: Debris_ResolveForceBuffer+10p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_37F95
		mov	bx, [si+26h]
		mov	al, [bx+30h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_37F95
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bx+24h], eax
		mov	eax, [di+4]
		mov	[bx+28h], eax
		mov	eax, [di+8]
		mov	[bx+2Ch], eax
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]

loc_37F59:
		call	dword ptr [bx+78h]

loc_37F5C:
		pop	cx
		push	ax
		mov	ax, [si+26h]

loc_37F61:
		add	ax, 24h	; '$'

loc_37F64:
		push	ax
		call	Math_ApplyRotationHelperB_58828
		add	sp, 4
		push	word ptr [si+24h]
		push	cs
		call	near ptr Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	bx, [si+26h]
		add	[bx+24h], eax
		mov	eax, [di+4]
		add	[bx+28h], eax
		mov	eax, [di+8]
		add	[bx+2Ch], eax
		or	byte ptr [bx+30h], 1

loc_37F95:				; CODE XREF: Debris_TransferForceToParent+Cj
					; Debris_TransferForceToParent+1Bj
		pop	di
		pop	si
		pop	bp
		retf
Debris_TransferForceToParent	endp

; ���������������������������������������������������������������������������

loc_37F99:				; DATA XREF: seg339:1B50o
					; seg339:off_6ED02o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,52L — notifie un composant enfant (vtable[0]) et teste son état actif (vtable[8]) avant
; de vérifier un flag de type : notification et validation d'état d'un corps physique enfant.
; ==============================================================================================
Debris_NotifyChildValidate	proc far		; CODE XREF: seg087:0011P seg095:001BP
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_38006
		push	di
		push	large dword ptr	[si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		cmp	word ptr [si+1Eh], 0
		jz	short loc_38006
		push	large dword ptr	[si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		or	al, al
		jz	short loc_38006
		les	bx, [si+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jz	short loc_38006
		push	word ptr [si+0Ch]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_38006
		push	di
		push	word ptr [si+1Eh]
		call	Container_FindByKeyAlt
		add	sp, 4

loc_38006:				; CODE XREF: Debris_NotifyChildValidate+10j
					; Debris_NotifyChildValidate+26j ...
		pop	di
		pop	si
		pop	bp
		retf
Debris_NotifyChildValidate	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — teste l'état d'un enfant (vtable[0x18]) ou d'un flag alternatif (+0x1E) : test
; d'état 'détruit/désactivé' d'un corps physique.
; ==============================================================================================
Debris_TestDestroyedState	proc far		; CODE XREF: WorldObject_IsDestroyed+7P Camera_NotifyFollowTarget+8P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_38032
		push	large dword ptr	[si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_38032
		mov	al, 0
		jmp	short loc_38043
; ���������������������������������������������������������������������������

loc_38032:				; CODE XREF: Debris_TestDestroyedState+Cj
					; Debris_TestDestroyedState+22j
		cmp	word ptr [si+1Eh], 0
		jz	short loc_38041
		push	word ptr [si+1Eh]
		call	WorldObjects_PurgeExpired
		pop	cx

loc_38041:				; CODE XREF: Debris_TestDestroyedState+2Cj
		mov	al, 1

loc_38043:				; CODE XREF: Debris_TestDestroyedState+26j
		pop	si
		pop	bp
		retf
Debris_TestDestroyedState	endp

; ���������������������������������������������������������������������������

loc_38046:				; DATA XREF: seg339:off_6EBA0o
					; seg339:off_6F650o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3804E:				; DATA XREF: seg339:1B40o
					; seg339:off_6ECF2o ...
		push	bp
		mov	bp, sp

loc_38051:
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_38056:				; DATA XREF: seg339:1B44o
					; seg339:off_6ECF6o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp

locret_3805D:
		retf
; ���������������������������������������������������������������������������

loc_3805E:				; DATA XREF: seg339:1B14o seg339:1C16o ...
		push	bp

loc_3805F:
		mov	bp, sp
		mov	dx, [bp+6]

loc_38064:
		mov	ax, dx
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,21L — récupère la position (vtable[0x3C]) et notifie sub_56E29 : positionnement d'un
; widget/marqueur sur un objet physique.
; ==============================================================================================
Debris_PositionWidget	proc far		; CODE XREF: seg030:01B8P seg030:0479P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	[bp+arg_2]
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		pop	si
		pop	bp
		retf
Debris_PositionWidget	endp

; ���������������������������������������������������������������������������

loc_38085:				; DATA XREF: seg339:1B18o
					; seg339:off_6FD94o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, 5B8Ch
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_38090:				; DATA XREF: seg339:1B54o
					; seg339:off_6ED06o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, 5B8Ch
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3809B:				; DATA XREF: seg339:1B20o seg339:25D0o ...
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+0Ah]
		mov	si, [bp+6]
		or	si, si
		jz	short loc_380AD
		mov	ax, si
		jmp	short loc_380B7
; ���������������������������������������������������������������������������

loc_380AD:				; CODE XREF: seg078:0467j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_380B7:				; CODE XREF: seg078:046Bj
		or	ax, ax
		jz	short loc_380D6
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_380D8
; ���������������������������������������������������������������������������

loc_380D6:				; CODE XREF: seg078:0479j
		mov	ax, si

loc_380D8:				; CODE XREF: seg078:0494j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_380E1:				; DATA XREF: seg339:1B30o seg339:1C32o ...
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+0Ah]
		mov	si, [bp+6]
		or	si, si
		jz	short loc_380F3
		mov	ax, si
		jmp	short loc_380FD
; ���������������������������������������������������������������������������

loc_380F3:				; CODE XREF: seg078:04ADj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_380FD:				; CODE XREF: seg078:04B1j
		or	ax, ax
		jz	short loc_3811C
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_3811E
; ���������������������������������������������������������������������������

loc_3811C:				; CODE XREF: seg078:04BFj
		mov	ax, si

loc_3811E:				; CODE XREF: seg078:04DAj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_38127:				; DATA XREF: seg339:1B28o
					; seg339:off_6F688o ...
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+0Ah]
		mov	si, [bp+6]
		or	si, si
		jz	short loc_38139
		mov	ax, si
		jmp	short loc_38143
; ���������������������������������������������������������������������������

loc_38139:				; CODE XREF: seg078:04F3j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx

loc_38141:
		mov	si, ax

loc_38143:				; CODE XREF: seg078:04F7j
		or	ax, ax

loc_38145:
		jz	short loc_38162
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_38164
; ���������������������������������������������������������������������������

loc_38162:				; CODE XREF: seg078:loc_38145j
		mov	ax, si

loc_38164:				; CODE XREF: seg078:0520j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3816D:				; DATA XREF: seg339:1B38o seg339:1C3Ao ...
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+0Ah]
		mov	si, [bp+6]
		or	si, si
		jz	short loc_3817F
		mov	ax, si
		jmp	short loc_38189
; ���������������������������������������������������������������������������

loc_3817F:				; CODE XREF: seg078:0539j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_38189:				; CODE XREF: seg078:053Dj
		or	ax, ax
		jz	short loc_381A8
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_381AA
; ���������������������������������������������������������������������������

loc_381A8:				; CODE XREF: seg078:054Bj
		mov	ax, si

loc_381AA:				; CODE XREF: seg078:0566j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_381B3:				; DATA XREF: seg339:1B1Co
					; seg339:off_6FD98o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_381BB:				; DATA XREF: seg339:1B24o
					; seg339:off_6F684o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_381C3:				; DATA XREF: seg339:1B34o seg339:1C36o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_381CB:				; DATA XREF: seg339:1B2Co seg339:25DCo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_381D3:				; DATA XREF: seg339:1B3Co seg339:1C3Eo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_381DB:				; DATA XREF: seg339:1B10o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_381E5:				; DATA XREF: seg339:1B58o seg339:1C5Ao ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	al, [si+28h]
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — accesseur d'un champ (+0x13 via référence +0xE) : getter d'un attribut de sous-
; composant.
; ==============================================================================================
Debris_GetSubpartAttrib	proc far		; CODE XREF: seg030:0239P
					; HUD_RenderReticleByWeaponType+5AP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		les	bx, [bx+0Eh]
		mov	al, es:[bx+13h]
		pop	bp
		retf
Debris_GetSubpartAttrib	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — accesseur trivial d'un champ (+0x29) : getter d'un flag d'état de débris.
; ==============================================================================================
Debris_GetStateFlag	proc far		; CODE XREF: seg032:014FP
					; HUD_RenderReticleByWeaponType+52P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+29h]
		pop	si
		pop	bp
		retf
Debris_GetStateFlag	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,148L — compare deux objets par vtable[0], combine leurs positions transformées
; (vtable[0x4C]) : fusion/combinaison de deux corps physiques (probable calcul de collision
; entre débris).
; ==============================================================================================
Debris_CombinePhysicsBodies	proc far		; CODE XREF: seg090:013BP
					; DATA XREF: seg339:1B60o ...

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
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_3823E
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		les	bx, [bp+var_6]
		mov	ax, es:[bx+6]
		mov	[bp+var_2], ax

loc_3823E:				; CODE XREF: Debris_CombinePhysicsBodies+16j
		push	si
		push	ss
		lea	ax, [bp+var_40]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	di
		push	ss

loc_3824E:
		lea	ax, [bp+var_4C]
		push	ax

loc_38252:
		mov	bx, [di]
		call	dword ptr [bx+4Ch]

loc_38257:
		add	sp, 6
		mov	eax, [bp+var_40]
		add	eax, [bp+var_4C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_3C]
		add	eax, [bp+var_48]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_38]
		add	eax, [bp+var_44]
		mov	[bp+var_2C], eax
		push	eax
		push	large [bp+var_30]
		push	large [bp+var_34]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	edx, eax
		mov	[bp+var_12], 0C800h
		mov	ecx, [bp+var_12]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], 0A00h
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_1E]
		jge	short loc_382F9
		mov	ax, 1
		jmp	short loc_382FB
; ���������������������������������������������������������������������������

loc_382F9:				; CODE XREF: Debris_CombinePhysicsBodies+E2j
		xor	ax, ax

loc_382FB:				; CODE XREF: Debris_CombinePhysicsBodies+E7j
		or	al, al
		jz	short loc_38304
		lea	ax, [bp+var_16]
		jmp	short loc_38307
; ���������������������������������������������������������������������������

loc_38304:				; CODE XREF: Debris_CombinePhysicsBodies+EDj
		lea	ax, [bp+var_1E]

loc_38307:				; CODE XREF: Debris_CombinePhysicsBodies+F2j
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_22], eax
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	ax, [bp+var_2]
		mov	[bp+var_24], ax
		movsx	eax, [bp+var_24]
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	ax, word ptr [bp+var_A+1]
		pop	di
		pop	si
		leave
		retf
Debris_CombinePhysicsBodies	endp

; ���������������������������������������������������������������������������

loc_38342:				; DATA XREF: seg339:1B64o seg339:1C66o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]

loc_38348:
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3834C:				; DATA XREF: seg339:off_71EC6o
		push	bp
		mov	bp, sp

loc_3834F:
		mov	word_727CC, 75Ch
		xor	ax, ax

loc_38357:
		mov	word_727D0, ax
		mov	word_727CE, ax

loc_3835D:
		mov	word_727CC, 1AD0h
		pop	bp

locret_38364:
		retf
; ���������������������������������������������������������������������������

loc_38365:				; DATA XREF: seg339:off_71FC8o
		push	bp
		mov	bp, sp
		push	2
		push	571Ch

loc_3836D:
		call	Debris_ManagerDestruct
		add	sp, 4
		pop	bp
		retf
seg078		ends
