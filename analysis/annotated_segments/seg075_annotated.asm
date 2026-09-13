seg075		segment	byte public 'CODE' use16
		assume cs:seg075
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		mov	al, es:[bx+3]
		les	bx, [bp+6]
		mov	es:[bx], al
		mov	bx, es:[bx+2]

loc_36761:
		mov	es, word ptr dword_6EA68+2

loc_36765:
		les	bx, es:[bx+11h]

loc_36769:
		movzx	eax, word ptr es:[bx]

loc_3676E:
		mov	[bp-8],	eax

loc_36772:
		les	bx, [bp+6]

loc_36775:
		mov	bx, es:[bx+4]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		movzx	eax, word ptr es:[bx]
		mov	[bp-4],	eax
		cmp	eax, [bp-8]
		jle	short loc_367B1
		les	bx, [bp+6]
		mov	bx, es:[bx+4]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		mov	al, es:[bx+3]
		les	bx, [bp+6]
		mov	es:[bx], al
		mov	eax, [bp-4]
		mov	[bp-8],	eax

loc_367B1:				; CODE XREF: seg075:005Ej
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		movzx	eax, word ptr es:[bx]
		cmp	eax, [bp-8]
		jle	short locret_367E4
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	es, word ptr dword_6EA68+2
		les	bx, es:[bx+11h]
		mov	al, es:[bx+3]
		les	bx, [bp+6]
		mov	es:[bx], al

locret_367E4:				; CODE XREF: seg075:0099j
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,61L — copie 9 coordonnées (3 sommets) dans un buffer partagé (word_72778...), teste si
; le triangle est plat sur un axe (Z constant) → appelle Render_PolygonPrimitive_20848
; (seg037, cas simplifié 2D) ; sinon appelle Render_MeshPrimitive_21085 (cas général 3D) :
; dispatcher de rastérisation choisissant entre le rasterizer plat et le rasterizer
; perspective, confirmant le rôle des 4 grosses fonctions du seg037.
; ==============================================================================================
Render_DispatchFlatOrPerspective	proc far		; CODE XREF: seg075:0149p seg075:01D9p
					; DATA XREF: ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]

loc_367F0:
		mov	word_72778, ax

loc_367F3:
		mov	ax, es:[bx+8]
		mov	word_7277A, ax
		mov	ax, es:[bx+0Ah]
		mov	word_7277C, ax
		mov	ax, es:[bx+0Ch]
		mov	word_7278E, ax
		mov	ax, es:[bx+0Eh]
		mov	word_72790, ax
		mov	ax, es:[bx+10h]
		mov	word_72792, ax
		mov	ax, es:[bx+12h]
		mov	word_727A4, ax
		mov	ax, es:[bx+14h]
		mov	word_727A6, ax
		mov	ax, es:[bx+16h]
		mov	word_727A8, ax
		mov	ax, word_7277C
		cmp	ax, word_72792
		jnz	short loc_3685A
		cmp	ax, word_727A8
		jnz	short loc_3685A
		sar	word_7277C, 8
		sar	word_72792, 8
		sar	word_727A8, 8
		push	ds
		push	offset word_72778
		push	3
		push	word_70E60
		call	Render_PolygonPrimitive_20848
		jmp	short loc_36869
; ���������������������������������������������������������������������������

loc_3685A:				; CODE XREF: Render_DispatchFlatOrPerspective+4Cj
					; Render_DispatchFlatOrPerspective+52j
		push	ds
		push	offset word_72778
		push	3
		push	word_70E60

loc_36864:
		call	Render_MeshPrimitive_21085

loc_36869:				; CODE XREF: Render_DispatchFlatOrPerspective+72j
		add	sp, 8
		pop	bp
		retf
Render_DispatchFlatOrPerspective	endp

; ���������������������������������������������������������������������������

loc_3686E:				; DATA XREF: seg339:off_6EB26o
		push	bp

loc_3686F:
		mov	bp, sp
		sub	sp, 4
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr Render_DispatchFlatOrPerspective
		add	sp, 4
		les	bx, [bp+6]
		mov	ax, es:[bx+18h]
		mov	word_7277E, ax
		mov	ax, es:[bx+1Ah]
		mov	word_72780, ax
		mov	ax, es:[bx+1Ch]
		mov	word_72794, ax
		mov	ax, es:[bx+1Eh]
		mov	word_72796, ax
		mov	ax, es:[bx+20h]
		mov	word_727AA, ax
		mov	ax, es:[bx+22h]
		mov	word_727AC, ax
		push	word ptr es:[bx+24h]
		call	Terrain_SectorLoadOnDemand
		pop	cx
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		cmp	dword ptr [bp-4], 0
		jz	short locret_368FC
		les	bx, [bp+6]
		mov	al, es:[bx+26h]
		cbw
		push	ax
		push	541Ah
		call	Text_ResolveTruncated
		add	sp, 4
		push	dx
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+24h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	large dword ptr	[bp-4]
		push	ds
		push	offset word_72778
		push	3
		push	word_70E60
		call	Render_MeshPrimitive_216F6
		add	sp, 12h

locret_368FC:				; CODE XREF: seg075:0191j
		leave
		retf
; ���������������������������������������������������������������������������

loc_368FE:				; DATA XREF: seg339:off_6EB22o
		push	bp

loc_368FF:
		mov	bp, sp

loc_36901:
		sub	sp, 4
		push	large dword ptr	[bp+6]

loc_36908:
		push	cs
		call	near ptr Render_DispatchFlatOrPerspective
		add	sp, 4
		les	bx, [bp+6]
		mov	ax, es:[bx+18h]
		mov	word_7277E, ax
		mov	ax, es:[bx+1Ah]
		mov	word_72780, ax
		mov	eax, es:[bx+27h]
		mov	dword_72782, eax
		mov	eax, es:[bx+2Bh]
		mov	dword_72786, eax
		mov	eax, es:[bx+2Fh]
		mov	dword_7278A, eax
		mov	ax, es:[bx+1Ch]
		mov	word_72794, ax
		mov	ax, es:[bx+1Eh]
		mov	word_72796, ax
		mov	eax, es:[bx+33h]
		mov	dword_72798, eax
		mov	eax, es:[bx+37h]
		mov	dword_7279C, eax
		mov	eax, es:[bx+3Bh]

loc_36960:
		mov	dword_727A0, eax
		mov	ax, es:[bx+20h]
		mov	word_727AA, ax

loc_3696B:
		mov	ax, es:[bx+22h]
		mov	word_727AC, ax
		mov	eax, es:[bx+3Fh]
		mov	dword_727AE, eax
		mov	eax, es:[bx+43h]
		mov	dword_727B2, eax
		mov	eax, es:[bx+47h]
		mov	dword_727B6, eax
		push	word ptr es:[bx+24h]
		call	Terrain_SectorLoadOnDemand
		pop	cx
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		cmp	dword ptr [bp-4], 0
		jz	short locret_369DA
		les	bx, [bp+6]
		mov	al, es:[bx+26h]
		cbw
		push	ax
		push	541Ah
		call	Text_ResolveTruncated
		add	sp, 4
		push	dx
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+24h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	large dword ptr	[bp-4]
		push	56C8h
		push	word_70E60
		call	Mesh_SubdivideRecursive
		add	sp, 0Eh

locret_369DA:				; CODE XREF: seg075:0272j
		leave
		retf
; ���������������������������������������������������������������������������

loc_369DC:				; DATA XREF: seg339:off_71EC0o
		push	bp
		mov	bp, sp
		mov	word_726EE, 11E8h
		mov	word_726EE, 193Ah
		mov	word_72706, 11E8h
		mov	word_72706, 193Ah

loc_369F7:
		mov	word_72706, 1A76h

loc_369FD:
		mov	word_7272D, 11E8h
		mov	word_7272D, 193Ah
		mov	word_7272D, 1A76h
		mov	word_7272D, 1A72h
		xor	ax, ax
		mov	word_727BC, ax
		mov	word_727BA, ax
		xor	ax, ax
		mov	word_727C0, ax
		mov	word_727BE, ax
		mov	dword_727C2, 0
		mov	byte_727C6, 2
		mov	byte_727C7, 0
		mov	dword_727C8, 0
		mov	dword_6EB14, 100h
		mov	dword_6EB18, 0A00h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_36A55:				; DATA XREF: seg339:off_71FC2o
		push	bp
		mov	bp, sp
		cmp	byte_727C7, 0
		jz	short loc_36A7D
		cmp	dword_727C2, 0
		jz	short loc_36A7D
		push	0

loc_36A69:
		mov	al, byte_727C6
		push	ax
		push	5712h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_36A7D:				; CODE XREF: seg075:032Dj seg075:0335j
		mov	dword_727C2, 0
		mov	byte_727C7, 0
		mov	dword_727C8, 0
		push	0
		push	ds
		push	offset word_727BA
		call	VROOMM_StubThunk_6CD76

loc_36A9F:
		add	sp, 6
		pop	bp
		retf
seg075		ends
