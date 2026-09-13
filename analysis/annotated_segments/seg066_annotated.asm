seg066		segment	byte public 'CODE' use16
		assume cs:seg066
		;org 1
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,54L — programme le DAC de palette VGA (port 0x3C8/0x3C9, synchronisation retrace via
; word_70EA0) avec une plage de triplets RGB : chargement de palette couleur VGA (bas niveau
; matériel).
; ==============================================================================================
VGA_LoadPalette	proc far		; CODE XREF: Camera_PanTransitionController+203p
					; Camera_PanTransitionExtended+20Fp ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [si+3]

loc_2E80B:				; DATA XREF: seg216:02D6o
		mov	ah, [si+2]
		mov	cx, [si]
		mov	dx, 3C8h

loc_2E813:				; CODE XREF: VGA_LoadPalette+48j
		test	cl, 7Fh
		jnz	short loc_2E826
		mov	dx, word_70EA0

loc_2E81C:				; CODE XREF: VGA_LoadPalette+1Ej
		in	al, dx
		test	al, 8
		jnz	short loc_2E81C

loc_2E821:				; CODE XREF: VGA_LoadPalette+23j
		in	al, dx
		test	al, 8
		jz	short loc_2E821

loc_2E826:				; CODE XREF: VGA_LoadPalette+15j
		mov	dx, 3C8h
		mov	al, ah
		inc	ah
		out	dx, al
		jmp	short $+2
		inc	dx
		mov	al, es:[bx]
		out	dx, al
		jmp	short $+2
		mov	al, es:[bx+1]
		out	dx, al
		jmp	short $+2
		mov	al, es:[bx+2]
		out	dx, al
		jmp	short $+2
		add	bx, 3
		dec	dx
		loop	loc_2E813
		pop	si
		pop	bp
		retf
VGA_LoadPalette	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,44L — lit un type et une taille depuis un flux, alloue une chaîne (taille×3, RGB) et la
; remplit (sub_2D24=memcpy) : parseur de bloc palette depuis un fichier (format image
; LBM/PCX).
; ==============================================================================================
Palette_ParseBlock	proc far		; CODE XREF: TextureLoader_LoadWithDwordFields_98784+ADP

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	al, es:[bx]
		mov	[si+2],	al
		add	word ptr [bp+arg_2], 2

loc_2E863:
		les	bx, [bp+arg_2]
		mov	ax, es:[bx]
		mov	[si], ax
		add	word ptr [bp+arg_2], 2
		mov	di, [si]
		imul	di, 3

loc_2E874:
		push	1
		push	0
		push	2
		movzx	eax, di
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+5],	dx
		mov	[si+3],	ax
		push	di
		push	large [bp+arg_2]
		push	large dword ptr	[si+3]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		pop	di
		pop	si
		pop	bp
		retf
Palette_ParseBlock	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,21L — libère une chaîne (+3 via sub_5C7B6) et réinitialise le pointeur : destructeur de
; ressource palette.
; ==============================================================================================
Palette_DestructResource	proc far		; CODE XREF: TextureLoader_ReleaseMultipleB_9829D+155P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	2
		mov	ax, si
		add	ax, 3
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+3], 0
		pop	si
		pop	bp
		retf
Palette_DestructResource	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,27L — résout une valeur (sub_2F55E) puis l'applique via sub_2E8F1 : wrapper de
; résolution+application de texte/valeur (probable étiquette de jauge).
; ==============================================================================================
Gauge_ResolveAndApplyLabel	proc far		; CODE XREF: seg055:0AC1P seg055:123BP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_2E8D1:
		mov	si, [bp+arg_0]
		push	large [bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Interp_ResolveNormalizedIndex
		add	sp, 8
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Text_ResolveTruncated
		add	sp, 4
		pop	si
		pop	bp
		retf
Gauge_ResolveAndApplyLabel	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,82L — résout un texte (sub_5C832) borné par une largeur maximale (+0x52), utilisé par
; les keyframes d'easing (seg024/029194) : résolution de texte tronqué à une largeur (utilisé
; dans le système d'interpolation/easing des keyframes).
; ==============================================================================================
Text_ResolveTruncated	proc far		; CODE XREF: Keyframe_InitWithEasing:loc_24BB2P
					; Keyframe_ResolveEasingValue+23P ...

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jnz	short loc_2E90D
		mov	[bp+var_4], 0
		jmp	short loc_2E96B
; ���������������������������������������������������������������������������

loc_2E90D:				; CODE XREF: Text_ResolveTruncated+10j
		or	di, di
		jle	short loc_2E930
		cmp	[si+52h], di
		jge	short loc_2E919
		mov	di, [si+52h]

loc_2E919:				; CODE XREF: Text_ResolveTruncated+23j
		push	0
		mov	al, [si+62h]
		push	ax
		push	large dword ptr	[si+5Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		jmp	short loc_2E95D
; ���������������������������������������������������������������������������

loc_2E930:				; CODE XREF: Text_ResolveTruncated+1Ej
		mov	[bp+var_6], di

loc_2E933:
		mov	ax, [bp+var_6]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	di, ax
		cmp	[si+52h], di
		jge	short loc_2E945
		mov	di, [si+52h]

loc_2E945:				; CODE XREF: Text_ResolveTruncated+4Fj
		push	0
		mov	al, [si+62h]
		push	ax
		push	large dword ptr	[si+5Eh]
		push	5C44h

loc_2E952:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		add	ax, [si+50h]

loc_2E95D:				; CODE XREF: Text_ResolveTruncated+3Dj
		mov	bx, di
		dec	bx
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2E96B:				; CODE XREF: Text_ResolveTruncated+1Aj
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave

locret_2E974:
		retf
Text_ResolveTruncated	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,72L — recherche linéaire dans une table de plages (pas 0xF octets, base+longueur) où une
; valeur tombe, retourne l'index : table lookup par intervalle — utilisée par les fonctions de
; teinte de dommage du seg055 (sub_29A0D/sub_29DB3).
; ==============================================================================================
Table_LookupByRange	proc far		; CODE XREF: Render_DamageTintResolve+21P
					; Render_DamageTintResolveAlt+23P ...

var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0FFFFh
		mov	[bp+var_3], 0
		xor	cx, cx
		jmp	short loc_2E9D0
; ���������������������������������������������������������������������������

loc_2E990:				; CODE XREF: Table_LookupByRange+67j
		mov	ax, cx
		imul	ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	[bx+6],	di
		jg	short loc_2E9C2
		mov	ax, cx
		imul	ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		mov	ax, [bx+6]
		mov	dx, cx
		imul	dx, 0Fh
		mov	bx, [si+5Ah]
		add	bx, dx
		add	ax, [bx+0Dh]
		cmp	ax, di
		jl	short loc_2E9C2
		mov	ax, 1
		jmp	short loc_2E9C4
; ���������������������������������������������������������������������������

loc_2E9C2:				; CODE XREF: Table_LookupByRange+28j
					; Table_LookupByRange+46j
		xor	ax, ax

loc_2E9C4:				; CODE XREF: Table_LookupByRange+4Bj
		or	al, al
		jz	short loc_2E9CF
		mov	[bp+var_2], cx
		mov	[bp+var_3], 1

loc_2E9CF:				; CODE XREF: Table_LookupByRange+51j
		inc	cx

loc_2E9D0:				; CODE XREF: Table_LookupByRange+19j
		cmp	[si+58h], cx
		jle	short loc_2E9DE
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_2E990

loc_2E9DE:				; CODE XREF: Table_LookupByRange+5Ej
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
Table_LookupByRange	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	word ptr [bp-2], 0FFFFh
		mov	byte ptr [bp-3], 0
		xor	cx, cx
		jmp	short loc_2EA6B
; ���������������������������������������������������������������������������

loc_2EA00:				; CODE XREF: seg066:0277j
		mov	ax, cx
		imul	ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	[bx+6],	di
		jg	short loc_2EA32
		mov	ax, cx
		imul	ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		mov	ax, [bx+6]
		mov	dx, cx
		imul	dx, 0Fh
		mov	bx, [si+5Ah]

loc_2EA24:
		add	bx, dx
		add	ax, [bx+0Dh]
		cmp	ax, di
		jl	short loc_2EA32
		mov	ax, 1
		jmp	short loc_2EA34
; ���������������������������������������������������������������������������

loc_2EA32:				; CODE XREF: seg066:020Dj seg066:022Bj
		xor	ax, ax

loc_2EA34:				; CODE XREF: seg066:0230j
		or	al, al
		jz	short loc_2EA6A
		mov	ax, cx
		imul	ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	byte ptr [bx+2], 0
		jz	short loc_2EA5D
		mov	ax, cx
		imul	ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax

loc_2EA52:
		cmp	byte ptr [bx+3], 0
		jz	short loc_2EA5D
		mov	ax, 1
		jmp	short loc_2EA5F
; ���������������������������������������������������������������������������

loc_2EA5D:				; CODE XREF: seg066:0246j seg066:0256j
		xor	ax, ax

loc_2EA5F:				; CODE XREF: seg066:025Bj
		or	al, al
		jz	short loc_2EA6A
		mov	[bp-2],	cx
		mov	byte ptr [bp-3], 1

loc_2EA6A:				; CODE XREF: seg066:0236j seg066:0261j
		inc	cx

loc_2EA6B:				; CODE XREF: seg066:01FEj
		cmp	[si+58h], cx
		jle	short loc_2EA79
		mov	al, [bp-3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_2EA00

loc_2EA79:				; CODE XREF: seg066:026Ej
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,57L — calcule un pointeur de mip-level de texture selon un décalage binaire (mipmapping,
; shift par +0x4E), met en cache la base et une valeur de fin : sélection de niveau de mipmap
; pour le texture mapping.
; ==============================================================================================
Texture_SelectMipLevel	proc far		; CODE XREF: Terrain_UpdateLODPerFrame+1A1P
					; TextureLoader_SelectMipLevel_980F0+55P

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	eax, [di+7Ch]
		cmp	eax, [bp+arg_2]
		jg	short loc_2EAAE
		mov	ax, [di+44h]
		mov	dx, [di+42h]
		mov	bx, [di+46h]
		dec	bx
		mov	cl, [di+4Eh]
		shl	bx, cl
		shl	bx, 2
		add	dx, bx
		mov	[di+4Ah], ax
		mov	[di+48h], dx
		jmp	short loc_2EACE
; ���������������������������������������������������������������������������

loc_2EAAE:				; CODE XREF: Texture_SelectMipLevel+10j
		mov	cl, [di+7Ah]
		mov	eax, [bp+arg_2]
		sar	eax, cl
		mov	cl, [di+4Eh]
		shl	ax, cl
		shl	ax, 2
		mov	dx, [di+44h]

loc_2EAC3:
		mov	bx, [di+42h]
		add	bx, ax
		mov	[di+4Ah], dx
		mov	[di+48h], bx

loc_2EACE:				; CODE XREF: Texture_SelectMipLevel+2Cj
		les	bx, [di+48h]
		mov	eax, es:[bx]
		mov	[di+72h], eax
		mov	ax, [di+4Ch]
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx-4]
		mov	[di+76h], eax
		mov	dword_6E9BA, 0FFFFFFFFh
		pop	di
		pop	si
		pop	bp
		retf
Texture_SelectMipLevel	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,164L — variante avec cache (dword_6E9BA/BE/C2) de la sélection de mip-level selon la
; distance/échelle : résolution de mipmap avec cache d'état (optimisation du texture mapping).
; ==============================================================================================
Texture_ResolveMipCached	proc far		; CODE XREF: Render_ObjectPipelineMain+1C5AP
					; Render_TerrainPipelineMain+204DP

var_B		= byte ptr -0Bh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		sar	eax, 8
		mov	[bp+arg_2], eax
		cmp	dword_6E9BA, 0FFFFFFFFh
		jz	short loc_2EB38
		cmp	eax, dword_6E9BA
		jl	short loc_2EB38
		mov	eax, [si+76h]

loc_2EB20:
		cmp	eax, dword_6E9BA
		jg	short loc_2EB2A
		jmp	loc_2EC36
; ���������������������������������������������������������������������������

loc_2EB2A:				; CODE XREF: Texture_ResolveMipCached+2Ej
		mov	eax, [bp+arg_2]
		cmp	eax, dword_6E9BE
		jge	short loc_2EB38
		jmp	loc_2EC36
; ���������������������������������������������������������������������������

loc_2EB38:				; CODE XREF: Texture_ResolveMipCached+1Cj
					; Texture_ResolveMipCached+23j ...
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_2]
		jle	short loc_2EB59
		mov	dword_6E9BA, 0
		mov	dword_6E9BE, eax
		xor	eax, eax

loc_2EB52:				; CODE XREF: Texture_ResolveMipCached+78j
					; Texture_ResolveMipCached+13Cj
		mov	dword_6E9C2, eax
		jmp	loc_2EC3A
; ���������������������������������������������������������������������������

loc_2EB59:				; CODE XREF: Texture_ResolveMipCached+49j
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_2]
		jg	short loc_2EB71
		mov	dword_6E9BA, eax
		mov	dword_6E9BE, eax
		mov	eax, [si+6Ah]
		jmp	short loc_2EB52
; ���������������������������������������������������������������������������

loc_2EB71:				; CODE XREF: Texture_ResolveMipCached+6Aj
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], ax
		mov	[bp+var_B], 0
		jmp	loc_2EC17
; ���������������������������������������������������������������������������

loc_2EB85:				; CODE XREF: Texture_ResolveMipCached+129j
		dec	[bp+var_2]
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		mov	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jl	short loc_2EBCB
		cmp	eax, [bp+var_A]
		jge	short loc_2EBCB
		mov	eax, [bp+var_6]
		mov	dword_6E9BA, eax
		mov	eax, [bp+var_A]
		jmp	short loc_2EBED
; ���������������������������������������������������������������������������

loc_2EBCB:				; CODE XREF: Texture_ResolveMipCached+BEj
					; Texture_ResolveMipCached+C4j
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_A]
		jnz	short loc_2EBF7
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_6E9BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_2EBED:				; CODE XREF: Texture_ResolveMipCached+D2j
		mov	dword_6E9BE, eax
		mov	[bp+var_B], 1
		jmp	short loc_2EC17
; ���������������������������������������������������������������������������

loc_2EBF7:				; CODE XREF: Texture_ResolveMipCached+DCj
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jge	short loc_2EC0D
		mov	ax, 1
		mov	cl, byte ptr [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_2EC17
; ���������������������������������������������������������������������������

loc_2EC0D:				; CODE XREF: Texture_ResolveMipCached+108j
		mov	ax, 1
		mov	cl, byte ptr [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_2EC17:				; CODE XREF: Texture_ResolveMipCached+8Bj
					; Texture_ResolveMipCached+FEj ...
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2EC23
		jmp	loc_2EB85
; ���������������������������������������������������������������������������

loc_2EC23:				; CODE XREF: Texture_ResolveMipCached+127j
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cl, [si+68h]
		sub	cl, [si+4Eh]
		shl	eax, cl
		jmp	loc_2EB52
; ���������������������������������������������������������������������������

loc_2EC36:				; CODE XREF: Texture_ResolveMipCached+30j
					; Texture_ResolveMipCached+3Ej
		mov	eax, dword_6E9C2

loc_2EC3A:				; CODE XREF: Texture_ResolveMipCached+5Fj
		shld	edx, eax, 10h
		pop	si
		leave
		retf
Texture_ResolveMipCached	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,285L — machine de transition/interpolation animée (compare à seuil 0x100) : contrôleur
; de transition douce (pan) pour une valeur d'orientation caméra/HUD.
; ==============================================================================================
Camera_PanTransitionController	proc far		; CODE XREF: Cockpit_PanAzimuthUpdate+20p
					; Cockpit_PanElevationUpdate+20p

var_36		= dword	ptr -36h
var_2C		= dword	ptr -2Ch
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_21		= byte ptr -21h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	dword ptr [di],	100h
		jle	short loc_2EC5E
		mov	ax, 1
		jmp	short loc_2EC60
; ���������������������������������������������������������������������������

loc_2EC5E:				; CODE XREF: Camera_PanTransitionController+15j
		xor	ax, ax

loc_2EC60:				; CODE XREF: Camera_PanTransitionController+1Aj
		or	al, al
		jz	short loc_2EC73
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	[di], eax

loc_2EC73:				; CODE XREF: Camera_PanTransitionController+20j
		cmp	dword ptr [di],	0
		jz	short loc_2EC7E
		mov	ax, 1
		jmp	short loc_2EC80
; ���������������������������������������������������������������������������

loc_2EC7E:				; CODE XREF: Camera_PanTransitionController+35j
		xor	ax, ax

loc_2EC80:				; CODE XREF: Camera_PanTransitionController+3Aj
		or	al, al
		jz	short loc_2EC8A
		mov	byte ptr [si+3Bh], 1
		jmp	short loc_2EC8E
; ���������������������������������������������������������������������������

loc_2EC8A:				; CODE XREF: Camera_PanTransitionController+40j
		mov	byte ptr [si+3Bh], 0

loc_2EC8E:				; CODE XREF: Camera_PanTransitionController+46j
		cmp	dword ptr [di],	100h
		jnz	short loc_2EC9C
		mov	ax, 1
		jmp	short loc_2EC9E
; ���������������������������������������������������������������������������

loc_2EC9C:				; CODE XREF: Camera_PanTransitionController+53j
		xor	ax, ax

loc_2EC9E:				; CODE XREF: Camera_PanTransitionController+58j
		or	al, al
		jz	short loc_2ECAC
		cmp	byte ptr [si+3Eh], 0
		jnz	short loc_2ECAC
		mov	byte ptr [si+3Bh], 0

loc_2ECAC:				; CODE XREF: Camera_PanTransitionController+5Ej
					; Camera_PanTransitionController+64j
		push	1
		sub	sp, 4
		mov	eax, dword_72212
		mov	[bp+var_36], eax
		push	si
		nop
		push	cs
		call	near ptr Interp_FractionalCompute
		add	sp, 8
		push	0
		mov	bx, [bp+arg_4]
		mov	al, [bx+4]
		push	ax
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		add	word ptr [bp+var_8], 4
		push	0
		mov	al, [si+21h]
		push	ax
		push	large dword ptr	[si+1Dh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [si+3]
		mov	[bp+var_10], eax
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large dword ptr	[si+9]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		add	word ptr [bp+var_14], 4
		mov	eax, [bp+var_8]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	al, [si+3Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2ED88
		mov	byte ptr [si+3Ch], 0
		mov	[bp+var_1E], 0
		jmp	short loc_2ED7C
; ���������������������������������������������������������������������������

loc_2ED49:				; CODE XREF: Camera_PanTransitionController+140j
		les	bx, [bp+var_18]
		mov	cl, es:[bx]
		les	bx, [bp+var_14]
		sub	cl, es:[bx]
		les	bx, [bp+var_1C]
		mov	es:[bx], cl
		mov	al, cl
		cbw
		mov	[bp+var_20], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	cl, al
		cmp	[si+3Ch], cl
		jge	short loc_2ED70
		mov	[si+3Ch], cl

loc_2ED70:				; CODE XREF: Camera_PanTransitionController+129j
		inc	[bp+var_1E]
		inc	word ptr [bp+var_1C]
		inc	word ptr [bp+var_18]
		inc	word ptr [bp+var_14]

loc_2ED7C:				; CODE XREF: Camera_PanTransitionController+105j
		mov	ax, [si+7]
		cmp	ax, [bp+var_1E]
		jg	short loc_2ED49
		mov	byte ptr [si+3Dh], 1

loc_2ED88:				; CODE XREF: Camera_PanTransitionController+FAj
		cmp	dword ptr [di],	0
		jle	short loc_2ED93
		mov	ax, 1
		jmp	short loc_2ED95
; ���������������������������������������������������������������������������

loc_2ED93:				; CODE XREF: Camera_PanTransitionController+14Aj
		xor	ax, ax

loc_2ED95:				; CODE XREF: Camera_PanTransitionController+14Fj
		or	al, al
		jnz	short loc_2ED9C
		jmp	loc_2EE49
; ���������������������������������������������������������������������������

loc_2ED9C:				; CODE XREF: Camera_PanTransitionController+155j
		mov	al, [si+3Ch]
		cbw
		mov	[bp+var_28], ax
		movsx	eax, [bp+var_28]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_2C], edx
		mov	eax, [bp+var_2C]
		mov	[bp+var_26], eax
		cmp	[bp+var_26], 0
		jg	short loc_2EDC7
		mov	ax, 1
		jmp	short loc_2EDC9
; ���������������������������������������������������������������������������

loc_2EDC7:				; CODE XREF: Camera_PanTransitionController+17Ej
		xor	ax, ax

loc_2EDC9:				; CODE XREF: Camera_PanTransitionController+183j
		or	al, al
		jz	short loc_2EDD3
		mov	[bp+var_21], 0
		jmp	short loc_2EDE8
; ���������������������������������������������������������������������������

loc_2EDD3:				; CODE XREF: Camera_PanTransitionController+189j
		mov	eax, [bp+var_26]
		sar	eax, 8
		mov	[bp+var_21], al
		cmp	[bp+var_21], 0
		jnz	short loc_2EDE8
		mov	[bp+var_21], 1

loc_2EDE8:				; CODE XREF: Camera_PanTransitionController+18Fj
					; Camera_PanTransitionController+1A0j
		mov	[bp+var_1E], 0
		jmp	short loc_2EE3B
; ���������������������������������������������������������������������������

loc_2EDEF:				; CODE XREF: Camera_PanTransitionController+1FFj
		les	bx, [bp+var_C]
		mov	cl, es:[bx]
		or	cl, cl
		jle	short loc_2EE07
		cmp	cl, [bp+var_21]
		jle	short loc_2EE03
		sub	cl, [bp+var_21]
		jmp	short loc_2EE21
; ���������������������������������������������������������������������������

loc_2EE03:				; CODE XREF: Camera_PanTransitionController+1BAj
		mov	cl, 0
		jmp	short loc_2EE21
; ���������������������������������������������������������������������������

loc_2EE07:				; CODE XREF: Camera_PanTransitionController+1B5j
		or	cl, cl
		jge	short loc_2EE21
		mov	al, cl
		cbw
		neg	ax
		push	ax
		mov	al, [bp+var_21]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_2EE1F
		add	cl, [bp+var_21]
		jmp	short loc_2EE21
; ���������������������������������������������������������������������������

loc_2EE1F:				; CODE XREF: Camera_PanTransitionController+1D6j
		mov	cl, 0

loc_2EE21:				; CODE XREF: Camera_PanTransitionController+1BFj
					; Camera_PanTransitionController+1C3j ...
		les	bx, [bp+var_8]
		mov	al, es:[bx]
		sub	al, cl
		les	bx, [bp+var_10]
		mov	es:[bx], al
		inc	[bp+var_1E]
		inc	word ptr [bp+var_C]
		inc	word ptr [bp+var_8]
		inc	word ptr [bp+var_10]

loc_2EE3B:				; CODE XREF: Camera_PanTransitionController+1ABj
		mov	ax, [si+7]
		cmp	ax, [bp+var_1E]
		jg	short loc_2EDEF
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		pop	cx

loc_2EE49:				; CODE XREF: Camera_PanTransitionController+157j
		pop	di
		pop	si
		leave
		retf
Camera_PanTransitionController	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,319L — variante de sub_2EC42 avec paramètres supplémentaires (3 flags) : contrôleur de
; transition douce avec options étendues (probable easing configurable).
; ==============================================================================================
Camera_PanTransitionExtended	proc far		; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+3E3P
					; Cockpit_ViewPanTransitionMain_15B67+45BP ...

var_30		= dword	ptr -30h
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1B		= byte ptr -1Bh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx],	100h
		jle	short loc_2EE69
		mov	ax, 1
		jmp	short loc_2EE6B
; ���������������������������������������������������������������������������

loc_2EE69:				; CODE XREF: Camera_PanTransitionExtended+15j
		xor	ax, ax

loc_2EE6B:				; CODE XREF: Camera_PanTransitionExtended+1Aj
		or	al, al
		jz	short loc_2EE81
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	bx, [bp+arg_2]
		mov	[bx], eax

loc_2EE81:				; CODE XREF: Camera_PanTransitionExtended+20j
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx],	0
		jz	short loc_2EE8F
		mov	ax, 1
		jmp	short loc_2EE91
; ���������������������������������������������������������������������������

loc_2EE8F:				; CODE XREF: Camera_PanTransitionExtended+3Bj
		xor	ax, ax

loc_2EE91:				; CODE XREF: Camera_PanTransitionExtended+40j
		or	al, al
		jz	short loc_2EE9B
		mov	byte ptr [si+3Bh], 1
		jmp	short loc_2EE9F
; ���������������������������������������������������������������������������

loc_2EE9B:				; CODE XREF: Camera_PanTransitionExtended+46j
		mov	byte ptr [si+3Bh], 0

loc_2EE9F:				; CODE XREF: Camera_PanTransitionExtended+4Cj
		push	1

loc_2EEA1:
		sub	sp, 4

loc_2EEA4:
		mov	eax, dword_72212
		mov	[bp+var_30], eax

loc_2EEAC:
		push	si

loc_2EEAD:
		nop
		push	cs

loc_2EEAF:
		call	near ptr Interp_FractionalCompute

loc_2EEB2:
		add	sp, 8

loc_2EEB5:
		cmp	byte ptr [si+3Eh], 2
		jnz	short loc_2EED3
		mov	al, [si+3Fh]
		cmp	al, [bp+arg_4]
		jz	short loc_2EEED
		mov	al, [si+40h]
		cmp	al, [bp+arg_6]
		jz	short loc_2EEED
		mov	al, [si+41h]
		cmp	al, [bp+arg_8]
		jz	short loc_2EEED

loc_2EED3:				; CODE XREF: Camera_PanTransitionExtended+6Cj
		mov	byte ptr [si+3Eh], 2
		mov	byte ptr [si+3Dh], 0
		mov	al, [bp+arg_4]
		mov	[si+3Fh], al
		mov	al, [bp+arg_6]
		mov	[si+40h], al
		mov	al, [bp+arg_8]
		mov	[si+41h], al

loc_2EEED:				; CODE XREF: Camera_PanTransitionExtended+74j
					; Camera_PanTransitionExtended+7Cj ...
		push	0
		mov	al, [si+21h]
		push	ax
		push	large dword ptr	[si+1Dh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [si+3]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_14], eax
		mov	di, si
		add	di, 3Fh	; '?'
		mov	al, [si+3Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2EF86
		mov	byte ptr [si+3Ch], 0
		mov	[bp+var_16], 0
		jmp	short loc_2EF7B
; ���������������������������������������������������������������������������

loc_2EF39:				; CODE XREF: Camera_PanTransitionExtended+133j
		mov	[bp+var_18], 0
		jmp	short loc_2EF6D
; ���������������������������������������������������������������������������

loc_2EF40:				; CODE XREF: Camera_PanTransitionExtended+124j
		mov	cl, [di]
		les	bx, [bp+var_14]
		sub	cl, es:[bx]
		les	bx, [bp+var_10]
		mov	es:[bx], cl
		mov	al, cl
		cbw
		mov	[bp+var_1A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	cl, al
		cmp	[si+3Ch], cl
		jge	short loc_2EF63
		mov	[si+3Ch], cl

loc_2EF63:				; CODE XREF: Camera_PanTransitionExtended+111j
		inc	[bp+var_18]
		inc	word ptr [bp+var_10]
		inc	word ptr [bp+var_14]
		inc	di

loc_2EF6D:				; CODE XREF: Camera_PanTransitionExtended+F1j
		cmp	[bp+var_18], 3
		jl	short loc_2EF40
		mov	di, si
		add	di, 3Fh	; '?'
		inc	[bp+var_16]

loc_2EF7B:				; CODE XREF: Camera_PanTransitionExtended+EAj
		mov	ax, [si]
		cmp	ax, [bp+var_16]
		ja	short loc_2EF39
		mov	byte ptr [si+3Dh], 1

loc_2EF86:				; CODE XREF: Camera_PanTransitionExtended+DFj
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx],	0
		jle	short loc_2EF94
		mov	ax, 1
		jmp	short loc_2EF96
; ���������������������������������������������������������������������������

loc_2EF94:				; CODE XREF: Camera_PanTransitionExtended+140j
		xor	ax, ax

loc_2EF96:				; CODE XREF: Camera_PanTransitionExtended+145j
		or	al, al
		jnz	short loc_2EF9D
		jmp	loc_2F060
; ���������������������������������������������������������������������������

loc_2EF9D:				; CODE XREF: Camera_PanTransitionExtended+14Bj
		mov	al, [si+3Ch]
		cbw
		mov	[bp+var_22], ax

loc_2EFA4:
		movsx	eax, [bp+var_22]
		mov	bx, [bp+arg_2]
		mov	edx, [bx]

loc_2EFAF:
		imul	edx, eax
		mov	[bp+var_26], edx
		mov	eax, [bp+var_26]
		mov	[bp+var_20], eax
		cmp	[bp+var_20], 0
		jg	short loc_2EFCB
		mov	ax, 1
		jmp	short loc_2EFCD
; ���������������������������������������������������������������������������

loc_2EFCB:				; CODE XREF: Camera_PanTransitionExtended+177j
		xor	ax, ax

loc_2EFCD:				; CODE XREF: Camera_PanTransitionExtended+17Cj
		or	al, al
		jz	short loc_2EFD7
		mov	[bp+var_1B], 0
		jmp	short loc_2EFEC
; ���������������������������������������������������������������������������

loc_2EFD7:				; CODE XREF: Camera_PanTransitionExtended+182j
		mov	eax, [bp+var_20]
		sar	eax, 8
		mov	[bp+var_1B], al
		cmp	[bp+var_1B], 0
		jnz	short loc_2EFEC
		mov	[bp+var_1B], 1

loc_2EFEC:				; CODE XREF: Camera_PanTransitionExtended+188j
					; Camera_PanTransitionExtended+199j
		mov	di, si
		add	di, 3Fh	; '?'
		mov	[bp+var_16], 0
		jmp	short loc_2F053
; ���������������������������������������������������������������������������

loc_2EFF8:				; CODE XREF: Camera_PanTransitionExtended+20Bj
		mov	[bp+var_18], 0
		jmp	short loc_2F045
; ���������������������������������������������������������������������������

loc_2EFFF:				; CODE XREF: Camera_PanTransitionExtended+1FCj
		les	bx, [bp+var_8]
		mov	cl, es:[bx]
		or	cl, cl
		jle	short loc_2F017
		cmp	cl, [bp+var_1B]
		jle	short loc_2F013
		sub	cl, [bp+var_1B]
		jmp	short loc_2F031
; ���������������������������������������������������������������������������

loc_2F013:				; CODE XREF: Camera_PanTransitionExtended+1BFj
		mov	cl, 0
		jmp	short loc_2F031
; ���������������������������������������������������������������������������

loc_2F017:				; CODE XREF: Camera_PanTransitionExtended+1BAj
		or	cl, cl
		jge	short loc_2F031
		mov	al, cl
		cbw
		neg	ax
		push	ax
		mov	al, [bp+var_1B]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_2F02F
		add	cl, [bp+var_1B]
		jmp	short loc_2F031
; ���������������������������������������������������������������������������

loc_2F02F:				; CODE XREF: Camera_PanTransitionExtended+1DBj
		mov	cl, 0

loc_2F031:				; CODE XREF: Camera_PanTransitionExtended+1C4j
					; Camera_PanTransitionExtended+1C8j ...
		mov	al, [di]
		sub	al, cl
		les	bx, [bp+var_C]
		mov	es:[bx], al
		inc	[bp+var_18]
		inc	word ptr [bp+var_8]
		inc	word ptr [bp+var_C]
		inc	di

loc_2F045:				; CODE XREF: Camera_PanTransitionExtended+1B0j
		cmp	[bp+var_18], 3
		jl	short loc_2EFFF
		mov	di, si
		add	di, 3Fh	; '?'
		inc	[bp+var_16]

loc_2F053:				; CODE XREF: Camera_PanTransitionExtended+1A9j
		mov	ax, [si]
		cmp	ax, [bp+var_16]
		ja	short loc_2EFF8
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		pop	cx

loc_2F060:				; CODE XREF: Camera_PanTransitionExtended+14Dj
		pop	di
		pop	si
		leave
		retf
Camera_PanTransitionExtended	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,28L — reset optionnel d'état (+0x3D/0x3E) puis appelle sub_2EC42 sur le champ +9 :
; pilotage de la transition d'azimut/pan de la caméra du cockpit (appelé par
; Cockpit_ViewPanTransitionMain_15B67).
; ==============================================================================================
Cockpit_PanAzimuthUpdate	proc far		; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+3CP
					; Cockpit_ViewPanTransitionMain_15B67+100P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+3Eh], 0
		jz	short loc_2F079
		mov	byte ptr [si+3Eh], 0
		mov	byte ptr [si+3Dh], 0

loc_2F079:				; CODE XREF: Cockpit_PanAzimuthUpdate+Bj
		mov	ax, si
		add	ax, 9
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Camera_PanTransitionController
		add	sp, 6
		pop	si
		pop	bp
		retf
Cockpit_PanAzimuthUpdate	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,29L — variante de sub_2F064 sur le champ +0x13 : pilotage de la transition d'un second
; axe caméra (probable tangage/élévation).
; ==============================================================================================
Cockpit_PanElevationUpdate	proc far		; CODE XREF: Cockpit_PanElevationFrame_85103+73P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+3Eh], 1
		jz	short loc_2F0A2
		mov	byte ptr [si+3Eh], 1
		mov	byte ptr [si+3Dh], 0

loc_2F0A2:				; CODE XREF: Cockpit_PanElevationUpdate+Bj
		mov	ax, si
		add	ax, 13h
		push	ax
		push	[bp+arg_2]
		push	si

loc_2F0AC:
		push	cs
		call	near ptr Camera_PanTransitionController
		add	sp, 6
		pop	si
		pop	bp
		retf
Cockpit_PanElevationUpdate	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,123L — division fixed-point avec un diviseur situé à +0x37 de l'objet, calcul de partie
; entière/fractionnaire : calcul d'interpolation fractionnaire (utilisé par le contrôleur de
; transition sub_2EC42).
; ==============================================================================================
Interp_FractionalCompute	proc far		; CODE XREF: Camera_ComputeViewMatrix+40EP
					; Camera_PanTransitionController+7Ap ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si

loc_2F0C3:
		add	di, 37h	; '7'

loc_2F0C6:
		mov	eax, [bp+arg_2]

loc_2F0CA:
		mov	edx, eax

loc_2F0CD:
		mov	ecx, [di]

loc_2F0D0:
		sar	edx, 18h

loc_2F0D4:
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	di, word ptr [bp+var_4+1]
		or	di, di
		jnz	short loc_2F0F1
		mov	di, 1

loc_2F0F1:				; CODE XREF: Interp_FractionalCompute+36j
		mov	ax, [si+33h]
		sub	ax, di
		mov	di, ax
		or	di, di
		jge	short loc_2F0FE
		xor	di, di

loc_2F0FE:				; CODE XREF: Interp_FractionalCompute+44j
		cmp	[bp+arg_6], 0
		jnz	short loc_2F10C
		cmp	[si+31h], di
		jnz	short loc_2F10C
		jmp	loc_2F18E
; ���������������������������������������������������������������������������

loc_2F10C:				; CODE XREF: Interp_FractionalCompute+4Cj
					; Interp_FractionalCompute+51j
		mov	al, [bp+arg_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2F11F
		mov	eax, [si+3]
		mov	[bp+var_C], eax
		jmp	short loc_2F13E
; ���������������������������������������������������������������������������

loc_2F11F:				; CODE XREF: Interp_FractionalCompute+5Dj
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large dword ptr	[si+9]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		add	word ptr [bp+var_C], 4

loc_2F13E:				; CODE XREF: Interp_FractionalCompute+67j
		push	0
		mov	al, [si+2Bh]
		push	ax
		push	large dword ptr	[si+27h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		add	word ptr [bp+var_C], 2D0h
		mov	bx, [si+35h]
		imul	bx, 3
		mov	ax, di
		imul	bx
		add	word ptr [bp+var_10], ax
		push	bx
		push	large [bp+var_10]
		push	large [bp+var_C]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		mov	al, [bp+arg_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2F18B
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		pop	cx

loc_2F18B:				; CODE XREF: Interp_FractionalCompute+CDj
		mov	[si+31h], di

loc_2F18E:				; CODE XREF: Interp_FractionalCompute+53j
		pop	di
		pop	si
		leave
		retf
Interp_FractionalCompute	endp

; ���������������������������������������������������������������������������

loc_2F192:				; DATA XREF: seg339:off_71E9Co
		push	bp
		mov	bp, sp
		mov	word_724CA, 0
		mov	dword_724CD, 0

loc_2F1A4:
		mov	dword_724D3, 0
		mov	byte_724D7, 2
		mov	byte_724D8, 0
		mov	dword_724D9, 0

loc_2F1C0:
		mov	dword_724DD, 0
		mov	byte_724E1, 2

loc_2F1CE:
		mov	byte_724E2, 0
		mov	dword_724E3, 0
		mov	dword_724E7, 0
		mov	byte_724EB, 2
		mov	byte_724EC, 0
		mov	dword_724ED, 0
		mov	dword_724F1, 0
		mov	byte_724F5, 2
		mov	byte_724F6, 0
		mov	dword_724F7, 0
		mov	dword_72528, 0
		mov	byte_7252C, 2

loc_2F222:
		mov	byte_7252D, 0

loc_2F227:
		mov	dword_7252E, 0

loc_2F230:
		push	541Ah

loc_2F233:
		call	VROOMM_StubThunk_6BC97
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2F23B:				; DATA XREF: seg339:4EFAo
		push	bp
		mov	bp, sp
		push	2

loc_2F240:
		push	541Ah
		call	VROOMM_StubThunk_6BCA6
		add	sp, 4
		pop	bp
		retf
seg066		ends
