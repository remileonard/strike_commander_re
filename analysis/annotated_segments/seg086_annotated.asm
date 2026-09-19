seg086		segment	byte public 'CODE' use16
		assume cs:seg086
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_3DDBA:				; DATA XREF: seg339:off_6F814o
		push	bp

loc_3DDBB:				; DATA XREF: seg216:0376o
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 5
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,58L — calcule la position caméra (sub_3D9FB) puis récupère la vitesse de la cible
; secondaire (+0x55, vtable[8]) : résolution position+vitesse pour la caméra externe orientée
; cible.
; ==============================================================================================
Camera_ResolvePositionVelocity_3DDC4	proc far		; CODE XREF: seg087:0026P
					; DATA XREF: seg339:off_6F7F0o

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si

loc_3DDCF:
		call	WorldObject_UpdateWithAIEntity_3D9FB
		pop	cx
		or	al, al
		jz	short loc_3DE17
		cmp	dword ptr [si+55h], 0
		jz	short loc_3DDF2
		push	large dword ptr	[si+55h]
		les	bx, [si+55h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_3DDF6
; ���������������������������������������������������������������������������

loc_3DDF2:				; CODE XREF: Camera_ResolvePositionVelocity_3DDC4+1Aj
		xor	dx, dx
		xor	ax, ax

loc_3DDF6:				; CODE XREF: Camera_ResolvePositionVelocity_3DDC4+2Cj
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		cmp	dword ptr [si+5Ah], 0
		jz	short loc_3DE13
		push	dx
		push	ax
		push	large dword ptr	[si+5Ah]
		call	HUD_RenderSymbologyAlt
		add	sp, 8
		jmp	short $+2

loc_3DE13:				; CODE XREF: Camera_ResolvePositionVelocity_3DDC4+3Dj
		mov	al, 1
		jmp	short loc_3DE19
; ���������������������������������������������������������������������������

loc_3DE17:				; CODE XREF: Camera_ResolvePositionVelocity_3DDC4+13j
		mov	al, 0

loc_3DE19:				; CODE XREF: Camera_ResolvePositionVelocity_3DDC4+51j
		pop	si
		leave
		retf
Camera_ResolvePositionVelocity_3DDC4	endp

; ���������������������������������������������������������������������������

loc_3DE1C:				; DATA XREF: seg339:24E4o
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,42L — destructeur (type 0x24DC) libérant une référence far (+0x4A, sub_6C40C) puis
; appelant le destructeur parent (sub_3DCDB) : destructeur composé de caméra avec libération
; de ressource additionnelle.
; ==============================================================================================
Camera_DestructCompoundA	proc far		; CODE XREF: seg087:069AP
					; DATA XREF: seg339:24DCo

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_3DE7A
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 24DCh
		push	3
		push	large dword ptr	es:[bx+4Ah]
		call	VROOMM_StubThunk_6C40C
		add	sp, 6
		push	0
		push	large [bp+arg_0]
		call	Camera_DestructTypeC
		add	sp, 6
		test	si, 1
		jz	short loc_3DE7A
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_3DE7A:				; CODE XREF: Camera_DestructCompoundA+Fj
					; Camera_DestructCompoundA+3Aj
		pop	si
		leave
		retf
Camera_DestructCompoundA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,11L — accesseur identité : getter trivial.
; ==============================================================================================
Camera_GetHandle	proc far		; CODE XREF: Camera_InitAndGetHandle+16p
					; Camera_ConstructWithHandle_9D610:loc_9D664P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
Camera_GetHandle	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,22L — initialise (sub_3DD55) puis retourne l'identité (sub_3DE7D) :
; constructeur/initialisation avec retour de handle.
; ==============================================================================================
Camera_InitAndGetHandle	proc far		; CODE XREF: Camera_ConstructWithSecondaryFlag_9D3BA+58P
					; Camera_InitAndGetHandleWrapper_9D4B5+CP

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Camera_InitWithSecondaryTarget
		add	sp, 6
		push	si
		push	cs
		call	near ptr Camera_GetHandle
		pop	cx
		pop	si
		pop	bp
		retf
Camera_InitAndGetHandle	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — destructeur (type 0x2730) libérant une référence (+0x5A) puis destructeur parent
; (sub_3DD71) : destructeur composé du système de caméra à cible secondaire.
; ==============================================================================================
Camera_DestructCompoundB	proc far		; CODE XREF: seg087:0624P
					; DATA XREF: seg339:off_6F7F8o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3DEDB
		mov	word ptr [si], 2730h
		push	3
		push	large dword ptr	[si+5Ah]
		call	VROOMM_StubThunk_6C40C
		add	sp, 6
		push	0
		push	si
		call	Camera_DestructSecondaryTarget
		add	sp, 4
		test	di, 1
		jz	short loc_3DEDB
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_3DEDB:				; CODE XREF: Camera_DestructCompoundB+Dj
					; Camera_DestructCompoundB+30j
		pop	di
		pop	si
		pop	bp
		retf
Camera_DestructCompoundB	endp

; ���������������������������������������������������������������������������

loc_3DEDF:				; DATA XREF: seg339:off_6F7FCo
		push	bp

loc_3DEE0:
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
seg086		ends
