seg071		segment	byte public 'CODE' use16
		assume cs:seg071
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_3262A:				; DATA XREF: seg339:1986o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]

loc_32631:
		cmp	byte ptr [si+9], 0
		jz	short loc_32657
		cmp	dword ptr [si+4], 0
		jz	short loc_32657
		push	0
		mov	al, [si+8]

loc_32643:
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6

loc_32652:
		add	sp, 8
		jmp	short $+2

loc_32657:				; CODE XREF: seg071:0015j seg071:001Cj
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,347L — divise des coordonnées par une taille de tuile (+0x86), calcule un index de tuile
; avec bornage (0..+0x7) : résolution d'index de tuile de texture terrain (tile lookup pour le
; rendu du sol/terrain).
; ==============================================================================================
Terrain_TileIndexResolve	proc far		; CODE XREF: Terrain_ComputeLODMesh+3B9p

var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	ax, [di]
		cwd
		idiv	word ptr [si+86h]
		mov	[bp+var_2], ax
		mov	ax, [di+2]
		cwd
		idiv	word ptr [si+86h]

loc_3268E:
		mov	[bp+var_4], ax
		mov	ax, [di]

loc_32693:
		cwd
		idiv	word ptr [si+86h]

loc_32698:
		mov	cx, dx
		mov	ax, [di+2]
		cwd
		idiv	word ptr [si+86h]

loc_326A2:
		mov	di, dx
		or	cx, cx
		jge	short loc_326AB

loc_326A8:
		dec	[bp+var_2]

loc_326AB:				; CODE XREF: Terrain_TileIndexResolve+38j
		or	di, di

loc_326AD:
		jge	short loc_326B2
		dec	[bp+var_4]

loc_326B2:				; CODE XREF: Terrain_TileIndexResolve:loc_326ADj
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		cmp	[bp+var_6], 0
		jge	short loc_326CB
		mov	[bp+var_6], 0
		jmp	short loc_326D7
; ���������������������������������������������������������������������������

loc_326CB:				; CODE XREF: Terrain_TileIndexResolve+54j
		mov	ax, [si+7]
		cmp	ax, [bp+var_6]
		jg	short loc_326D7
		dec	ax
		mov	[bp+var_6], ax

loc_326D7:				; CODE XREF: Terrain_TileIndexResolve+5Bj
					; Terrain_TileIndexResolve+63j
		cmp	[bp+var_8], 0
		jge	short loc_326E4
		mov	[bp+var_8], 0
		jmp	short loc_326F0
; ���������������������������������������������������������������������������

loc_326E4:				; CODE XREF: Terrain_TileIndexResolve+6Dj
		mov	ax, [si+7]
		cmp	ax, [bp+var_8]
		jg	short loc_326F0
		dec	ax
		mov	[bp+var_8], ax

loc_326F0:				; CODE XREF: Terrain_TileIndexResolve+74j
					; Terrain_TileIndexResolve+7Cj
		mov	[bp+var_A], cx
		mov	[bp+var_C], di
		cmp	[bp+var_A], 0
		jge	short loc_32703
		mov	ax, [si+86h]
		add	[bp+var_A], ax

loc_32703:				; CODE XREF: Terrain_TileIndexResolve+8Cj
		cmp	[bp+var_C], 0
		jge	short loc_32710
		mov	ax, [si+86h]
		add	[bp+var_C], ax

loc_32710:				; CODE XREF: Terrain_TileIndexResolve+99j
		mov	eax, [si+3]
		mov	[bp+var_10], eax
		mov	ax, [bp+var_8]
		imul	word ptr [si+7]
		add	ax, [bp+var_6]
		shl	ax, 1

loc_32723:
		add	word ptr [bp+var_10], ax

loc_32726:
		mov	bx, [bp+arg_2]
		mov	ax, [bx+17h]

loc_3272C:
		mov	[bp+var_18], ax
		push	0
		les	bx, [bp+var_10]
		mov	bx, es:[bx]
		mov	al, [bx+8]
		push	ax
		mov	bx, word ptr [bp+var_10]
		mov	bx, es:[bx]

loc_32741:
		push	large dword ptr	[bx+4]
		push	5C44h

loc_32748:
		call	Memory_TypedAllocDispatchB_5C832

loc_3274D:
		add	sp, 0Ah
		mov	word ptr [bp+var_22+2],	dx
		mov	word ptr [bp+var_22], ax
		mov	ax, [bp+var_C]
		imul	word ptr [si+86h]
		add	ax, [bp+var_A]
		imul	ax, 6
		add	word ptr [bp+var_22], ax
		les	bx, [bp+var_10]
		mov	bx, es:[bx]
		movsx	eax, word ptr [bx+12h]
		mov	[bp+var_26], eax
		mov	[bp+var_28], 1
		mov	[bp+var_2C], 0
		jmp	loc_328D6
; ���������������������������������������������������������������������������

loc_32782:				; CODE XREF: Terrain_TileIndexResolve+273j
		mov	ax, [si+86h]
		cmp	ax, [bp+var_C]

loc_32789:
		jg	short loc_32801

loc_3278B:
		mov	[bp+var_C], 0

loc_32790:
		inc	[bp+var_4]
		mov	ax, [si+7]
		cmp	ax, [bp+var_4]
		jg	short loc_3279E
		dec	ax
		jmp	short loc_327AE
; ���������������������������������������������������������������������������

loc_3279E:				; CODE XREF: Terrain_TileIndexResolve+12Bj
		cmp	[bp+var_4], 0
		jge	short loc_327AB
		mov	[bp+var_8], 0
		jmp	short loc_327B1
; ���������������������������������������������������������������������������

loc_327AB:				; CODE XREF: Terrain_TileIndexResolve+134j
		mov	ax, [bp+var_4]

loc_327AE:				; CODE XREF: Terrain_TileIndexResolve+12Ej
		mov	[bp+var_8], ax

loc_327B1:				; CODE XREF: Terrain_TileIndexResolve+13Bj
		mov	eax, [si+3]
		mov	[bp+var_10], eax
		mov	ax, [bp+var_8]
		imul	word ptr [si+7]
		add	ax, [bp+var_6]
		shl	ax, 1
		add	word ptr [bp+var_10], ax
		les	bx, [bp+var_10]
		mov	di, es:[bx]
		or	di, di
		jz	short loc_32801
		push	0
		mov	al, [di+8]
		push	ax
		push	large dword ptr	[di+4]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_22+2],	dx
		mov	word ptr [bp+var_22], ax
		mov	ax, [bp+var_A]
		imul	ax, 6
		add	word ptr [bp+var_22], ax
		movsx	eax, word ptr [di+12h]
		add	[bp+var_26], eax
		inc	[bp+var_28]

loc_32801:				; CODE XREF: Terrain_TileIndexResolve:loc_32789j
					; Terrain_TileIndexResolve+161j
		mov	ax, [bp+var_A]
		mov	[bp+var_1A], ax
		mov	eax, [bp+var_22]
		mov	[bp+var_1E], eax
		mov	ax, [bp+var_2]
		mov	[bp+var_16], ax
		mov	[bp+var_2A], 0
		jmp	loc_328B8
; ���������������������������������������������������������������������������

loc_3281D:				; CODE XREF: Terrain_TileIndexResolve+255j
		mov	ax, [si+86h]
		cmp	ax, [bp+var_1A]
		jg	short loc_3289C
		mov	[bp+var_1A], 0
		inc	[bp+var_16]
		mov	ax, [si+7]
		cmp	ax, [bp+var_16]
		jg	short loc_3283C
		mov	cx, [si+7]
		dec	cx
		jmp	short loc_32849
; ���������������������������������������������������������������������������

loc_3283C:				; CODE XREF: Terrain_TileIndexResolve+1C6j
		cmp	[bp+var_16], 0
		jge	short loc_32846
		xor	cx, cx
		jmp	short loc_32849
; ���������������������������������������������������������������������������

loc_32846:				; CODE XREF: Terrain_TileIndexResolve+1D2j
		mov	cx, [bp+var_16]

loc_32849:				; CODE XREF: Terrain_TileIndexResolve+1CCj
					; Terrain_TileIndexResolve+1D6j
		mov	eax, [si+3]
		mov	[bp+var_14], eax
		mov	ax, [bp+var_8]
		imul	word ptr [si+7]
		add	ax, cx
		shl	ax, 1
		add	word ptr [bp+var_14], ax
		les	bx, [bp+var_14]
		mov	di, es:[bx]
		or	di, di
		jz	short loc_3289C
		push	0
		mov	al, [di+8]
		push	ax
		push	large dword ptr	[di+4]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_1E+2],	dx

loc_32880:
		mov	word ptr [bp+var_1E], ax

loc_32883:
		mov	ax, [bp+var_C]
		imul	word ptr [si+86h]
		imul	ax, 6

loc_3288D:
		add	word ptr [bp+var_1E], ax

loc_32890:
		movsx	eax, word ptr [di+12h]
		add	[bp+var_26], eax
		inc	[bp+var_28]

loc_3289C:				; CODE XREF: Terrain_TileIndexResolve+1B6j
					; Terrain_TileIndexResolve+1F8j
		mov	bx, [bp+var_18]
		mov	ax, word ptr [bp+var_1E+2]
		mov	dx, word ptr [bp+var_1E]
		mov	[bx+2],	ax
		mov	[bx], dx
		add	word ptr [bp+var_1E], 6
		add	[bp+var_18], 4
		inc	[bp+var_1A]
		inc	[bp+var_2A]

loc_328B8:				; CODE XREF: Terrain_TileIndexResolve+1ACj
		mov	bx, [bp+arg_2]
		mov	ax, [bx+11h]
		cmp	ax, [bp+var_2A]
		jle	short loc_328C6
		jmp	loc_3281D
; ���������������������������������������������������������������������������

loc_328C6:				; CODE XREF: Terrain_TileIndexResolve+253j
		mov	ax, [si+86h]
		imul	ax, 6
		add	word ptr [bp+var_22], ax
		inc	[bp+var_C]
		inc	[bp+var_2C]

loc_328D6:				; CODE XREF: Terrain_TileIndexResolve+111j
		mov	bx, [bp+arg_2]
		mov	ax, [bx+11h]
		cmp	ax, [bp+var_2C]
		jle	short loc_328E4
		jmp	loc_32782
; ���������������������������������������������������������������������������

loc_328E4:				; CODE XREF: Terrain_TileIndexResolve+271j
		movsx	ebx, [bp+var_28]
		mov	eax, [bp+var_26]
		cdq
		idiv	ebx
		mov	[bp+var_26], eax
		mov	bx, [bp+arg_2]
		mov	[bx+0Dh], eax
		pop	di
		pop	si
		leave
		retf
Terrain_TileIndexResolve	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,184L — division fixed-point par la taille de tuile (+0x86), boucle sur une grille de
; hauteur de terrain (buffer local important) : échantillonnage/interpolation d'une grille de
; hauteur de terrain (heightfield).
; ==============================================================================================
Terrain_HeightSample	proc far		; CODE XREF: Camera_TransformIfVisible+59p
					; Terrain_UpdateLODPerFrame+119P ...

var_4C		= word ptr -4Ch
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= word ptr -42h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= word ptr -14h
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
		mov	di, [bp+arg_0]
		movsx	ebx, word ptr [di+86h]
		mov	eax, [di+82h]
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		mov	si, [bp+arg_2]
		mov	eax, [si]
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_6], eax

loc_32941:
		mov	ax, [bp+var_2]

loc_32944:
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]

loc_3294C:
		shl	eax, 8

loc_32950:
		mov	[bp+var_18], eax

loc_32954:
		mov	eax, [bp+var_A]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_6]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_20], eax

loc_32990:
		mov	eax, [bp+var_6]
		mov	[bp+var_1C], eax
		mov	ax, [di+88h]
		sar	ax, 1
		mov	[bp+var_22], ax

loc_329A1:
		movsx	eax, [bp+var_22]

loc_329A6:
		shl	eax, 8
		sub	eax, [bp+var_6]
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	ax, [di+86h]
		mov	[bp+var_2C], ax
		movsx	ebx, [bp+var_2C]
		mov	eax, [bp+var_2A]
		cdq
		idiv	ebx
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	si, word ptr [bp+var_34+1]
		mov	ax, [di+88h]
		sar	ax, 1
		mov	[bp+var_38], ax
		movsx	eax, [bp+var_38]
		shl	eax, 8
		mov	edx, [bp+var_A]
		add	edx, eax
		mov	[bp+var_3C], edx
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	ax, [di+86h]
		mov	[bp+var_42], ax
		movsx	ebx, [bp+var_42]
		mov	eax, [bp+var_40]
		cdq
		idiv	ebx
		mov	[bp+var_46], eax
		mov	[bp+var_4A], eax
		mov	ax, word ptr [bp+var_4A+1]
		mov	[bp+var_36], ax

loc_32A1E:
		cmp	[bp+var_36], 0

loc_32A22:
		jge	short loc_32A2B

loc_32A24:
		mov	[bp+var_36], 0
		jmp	short loc_32A37
; ���������������������������������������������������������������������������

loc_32A2B:				; CODE XREF: Terrain_HeightSample:loc_32A22j
		mov	ax, [di+7]
		cmp	ax, [bp+var_36]
		jg	short loc_32A37
		dec	ax
		mov	[bp+var_36], ax

loc_32A37:				; CODE XREF: Terrain_HeightSample+128j
					; Terrain_HeightSample+130j
		or	si, si
		jge	short loc_32A3F
		xor	si, si
		jmp	short loc_32A48
; ���������������������������������������������������������������������������

loc_32A3F:				; CODE XREF: Terrain_HeightSample+138j
		cmp	[di+7],	si

loc_32A42:
		jg	short loc_32A48

loc_32A44:
		mov	si, [di+7]

loc_32A47:
		dec	si

loc_32A48:				; CODE XREF: Terrain_HeightSample+13Cj
					; Terrain_HeightSample:loc_32A42j
		mov	ax, [di+7]
		imul	si

loc_32A4D:
		mov	dx, [bp+var_36]
		add	dx, ax
		mov	[bp+var_4C], dx
		les	bx, [di+8Ah]
		mov	ax, [bp+var_4C]
		shl	ax, 1
		add	bx, ax
		movzx	eax, word ptr es:[bx]
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
Terrain_HeightSample	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,610L — grosse fonction du cluster terrain (buffer local 0x86, itère sur +0x11 niveaux),
; appelée par sub_3756E (probable coordinateur de rendu terrain) : candidat pour le calcul de
; mesh de terrain adaptatif (LOD/tessellation du sol par tuile), à approfondir.
; ==============================================================================================
Terrain_ComputeLODMesh	proc far		; CODE XREF: Terrain_UpdateLODPerFrame+99P

var_86		= word ptr -86h
var_84		= word ptr -84h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_72		= word ptr -72h
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
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+11h]
		dec	ax
		mov	[bp+var_6], ax
		mov	[bp+var_10], di
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		mov	[bp+var_18], eax
		mov	eax, [bx+4]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_A], eax
		mov	eax, [si+9]

loc_32AAD:
		mov	[bp+var_1C], eax

loc_32AB1:
		shl	eax, 8

loc_32AB5:
		mov	[bp+var_20], eax
		mov	eax, [bp+var_E]
		mov	edx, eax
		mov	ecx, [bp+var_20]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_E], eax
		mov	eax, [bp+var_A]
		mov	edx, eax
		mov	ecx, [bp+var_20]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_24], eax
		cmp	dword ptr [di],	0
		jge	short loc_32B08
		mov	ax, 1
		jmp	short loc_32B0A
; ���������������������������������������������������������������������������

loc_32B08:				; CODE XREF: Terrain_ComputeLODMesh+93j
		xor	ax, ax

loc_32B0A:				; CODE XREF: Terrain_ComputeLODMesh+98j
		or	al, al
		jz	short loc_32B16
		sub	[bp+var_E], 100h

loc_32B16:				; CODE XREF: Terrain_ComputeLODMesh+9Ej
		cmp	dword ptr [di+4], 0
		jle	short loc_32B22
		mov	ax, 1
		jmp	short loc_32B24
; ���������������������������������������������������������������������������

loc_32B22:				; CODE XREF: Terrain_ComputeLODMesh+ADj
		xor	ax, ax

loc_32B24:				; CODE XREF: Terrain_ComputeLODMesh+B2j
		or	al, al
		jz	short loc_32B30

loc_32B28:
		add	[bp+var_A], 100h

loc_32B30:				; CODE XREF: Terrain_ComputeLODMesh+B8j
		mov	ax, word ptr [bp+var_E+1]

loc_32B33:
		mov	[bp+var_2E], ax

loc_32B36:
		mov	ax, word ptr [bp+var_A+1]
		mov	[bp+var_30], ax
		mov	ax, [bp+var_2E]
		mov	word ptr [bp+var_2C], ax

loc_32B42:
		mov	ax, [bp+var_30]
		mov	word ptr [bp+var_2C+2],	ax
		mov	ax, [si+13h]

loc_32B4B:
		sub	word ptr [bp+var_2C], ax

loc_32B4E:
		add	word ptr [bp+var_2C+2],	ax

loc_32B51:
		mov	eax, [bp+var_2C]

loc_32B55:
		mov	[si+3Fh], eax
		mov	ax, word ptr [bp+var_2C]
		mov	[bp+var_32], ax
		movsx	eax, [bp+var_32]
		shl	eax, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3E], eax
		mov	ax, word ptr [bp+var_2C+2]
		mov	[bp+var_40], ax
		movsx	eax, [bp+var_40]

loc_32B7F:
		shl	eax, 8

loc_32B83:
		mov	[bp+var_44], eax

loc_32B87:
		mov	eax, [bp+var_44]
		mov	[bp+var_3A], eax

loc_32B8F:
		mov	eax, [bp+var_3E]

loc_32B93:
		mov	[si+57h], eax
		mov	eax, [bp+var_3A]
		mov	[si+5Bh], eax
		mov	di, si
		add	di, 57h	; 'W'
		mov	eax, [di]

loc_32BA7:
		mov	[si+5Fh], eax

loc_32BAB:
		mov	eax, [di+4]

loc_32BAF:
		mov	[si+63h], eax
		mov	ax, [bp+var_6]
		mov	[bp+var_46], ax
		movsx	eax, [bp+var_46]
		shl	eax, 8
		add	[si+5Fh], eax
		mov	ax, [bp+var_6]
		mov	[bp+var_48], ax
		movsx	eax, [bp+var_48]
		shl	eax, 8
		sub	[si+63h], eax
		mov	di, si
		add	di, 57h	; 'W'
		mov	eax, [si+9]
		mov	[bp+var_4C], eax
		shl	eax, 8
		mov	[bp+var_50], eax
		mov	eax, [di]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[di], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[di+4],	eax
		mov	ax, di
		add	ax, 4
		mov	eax, [di]
		mov	[bp+var_58], eax
		add	di, 4
		mov	eax, [di]

loc_32C26:
		mov	[bp+var_54], eax
		mov	di, si

loc_32C2C:
		add	di, 5Fh	; '_'

loc_32C2F:
		mov	eax, [si+9]
		mov	[bp+var_5C], eax
		shl	eax, 8
		mov	[bp+var_60], eax
		mov	eax, [di]
		mov	edx, [bp+var_60]
		imul	edx

loc_32C49:
		shrd	eax, edx, 8
		mov	[di], eax

loc_32C51:
		mov	eax, [di+4]
		mov	edx, [bp+var_60]
		imul	edx
		shrd	eax, edx, 8
		mov	[di+4],	eax
		mov	ax, di
		add	ax, 4
		mov	eax, [di]
		mov	[bp+var_68], eax
		add	di, 4
		mov	eax, [di]
		mov	[bp+var_64], eax
		mov	bx, [si+45h]

loc_32C7E:
		mov	bx, [bx+88h]
		sar	bx, 1
		add	word ptr [bp+var_2C], bx
		mov	ax, bx
		sub	ax, word ptr [bp+var_2C+2]
		mov	word ptr [bp+var_2C+2],	ax
		mov	ax, word_70466
		mov	[bp+var_78], ax
		mov	ax, [si+53h]
		cmp	ax, word ptr [bp+var_2C]
		jnz	short loc_32CAE
		mov	ax, [si+55h]

loc_32CA0:
		cmp	ax, word ptr [bp+var_2C+2]

loc_32CA3:
		jnz	short loc_32CAE
		cmp	[bp+arg_4], 0
		jnz	short loc_32CAE

loc_32CAB:
		jmp	loc_32E38
; ���������������������������������������������������������������������������

loc_32CAE:				; CODE XREF: Terrain_ComputeLODMesh+22Dj
					; Terrain_ComputeLODMesh:loc_32CA3j	...
		mov	eax, [bp+var_2C]

loc_32CB2:
		mov	[bp+var_6C], eax
		mov	ax, [bp+var_6]
		mov	[bp+var_7A], ax
		mov	[bp+var_7C], ax
		mov	word ptr [bp+var_70], ax
		mov	word ptr [bp+var_70+2],	ax
		mov	ax, word ptr [bp+var_2C]
		add	word ptr [bp+var_70], ax
		mov	ax, word ptr [bp+var_2C+2]
		add	word ptr [bp+var_70+2],	ax
		mov	bx, [si+49h]
		mov	ax, word ptr [bp+var_6C]
		cwd
		idiv	bx
		mov	word ptr [bp+var_6C], ax
		mov	ax, word ptr [bp+var_6C+2]
		cwd
		idiv	bx
		mov	word ptr [bp+var_6C+2],	ax
		mov	bx, [si+49h]
		mov	ax, word ptr [bp+var_70]
		cwd
		idiv	bx
		mov	word ptr [bp+var_70], ax
		mov	ax, word ptr [bp+var_70+2]
		cwd
		idiv	bx
		mov	word ptr [bp+var_70+2],	ax
		mov	ax, word ptr [bp+var_6C+2]
		mov	[bp+var_74], ax
		jmp	loc_32E03
; ���������������������������������������������������������������������������

loc_32D04:				; CODE XREF: Terrain_ComputeLODMesh+39Dj
		mov	ax, word ptr [bp+var_6C]
		mov	[bp+var_72], ax
		jmp	loc_32DF5
; ���������������������������������������������������������������������������

loc_32D0D:				; CODE XREF: Terrain_ComputeLODMesh+38Fj
		cmp	[bp+var_72], 0
		jge	short loc_32D17
		xor	di, di
		jmp	short loc_32D28
; ���������������������������������������������������������������������������

loc_32D17:				; CODE XREF: Terrain_ComputeLODMesh+2A3j
		mov	ax, [si+47h]
		cmp	ax, [bp+var_72]
		jg	short loc_32D25
		mov	di, [si+47h]

loc_32D22:
		dec	di

loc_32D23:
		jmp	short loc_32D28
; ���������������������������������������������������������������������������

loc_32D25:				; CODE XREF: Terrain_ComputeLODMesh+2AFj
		mov	di, [bp+var_72]

loc_32D28:				; CODE XREF: Terrain_ComputeLODMesh+2A7j
					; Terrain_ComputeLODMesh:loc_32D23j
		cmp	[bp+var_74], 0

loc_32D2C:
		jge	short loc_32D35

loc_32D2E:
		mov	[bp+var_76], 0

loc_32D33:
		jmp	short loc_32D46
; ���������������������������������������������������������������������������

loc_32D35:				; CODE XREF: Terrain_ComputeLODMesh:loc_32D2Cj
		mov	ax, [si+47h]
		cmp	ax, [bp+var_74]
		jg	short loc_32D40
		dec	ax
		jmp	short loc_32D43
; ���������������������������������������������������������������������������

loc_32D40:				; CODE XREF: Terrain_ComputeLODMesh+2CDj
		mov	ax, [bp+var_74]

loc_32D43:				; CODE XREF: Terrain_ComputeLODMesh+2D0j
		mov	[bp+var_76], ax

loc_32D46:				; CODE XREF: Terrain_ComputeLODMesh:loc_32D33j
		mov	bx, [si+45h]

loc_32D49:
		mov	ax, [bx+5]

loc_32D4C:
		mov	dx, [bx+3]

loc_32D4F:
		mov	word ptr [bp+var_4+2], ax

loc_32D52:
		mov	word ptr [bp+var_4], dx

loc_32D55:
		mov	ax, [bp+var_76]
		imul	word ptr [si+47h]
		add	ax, di
		shl	ax, 1
		add	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0
		jz	short loc_32D79
		mov	ax, [bp+var_78]
		mov	[bp+var_7E], ax
		mov	bx, es:[bx]
		mov	[bx+2],	ax
		jmp	short loc_32DF2
; ���������������������������������������������������������������������������

loc_32D79:				; CODE XREF: Terrain_ComputeLODMesh+2FBj
		mov	ax, [si+45h]
		add	ax, 0Bh

loc_32D7F:
		mov	[bp+var_80], ax
		mov	ax, [bp+var_76]
		imul	word ptr [si+47h]
		add	ax, di
		mov	[bp+var_82], ax
		mov	ax, [bp+var_78]

loc_32D91:
		mov	[bp+var_84], ax
		push	14h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_32DDB
		mov	word ptr [di], 1966h
		mov	word ptr [di], 1986h
		mov	dword ptr [di+4], 0

loc_32DB3:
		mov	byte ptr [di+8], 2
		mov	byte ptr [di+9], 0
		mov	dword ptr [di+0Ah], 0
		push	[bp+var_84]
		push	[bp+var_82]
		push	[bp+var_80]
		push	ax
		call	VROOMM_StubThunk_6BDC0
		add	sp, 8
		mov	ax, di
		jmp	short loc_32DDD
; ���������������������������������������������������������������������������

loc_32DDB:				; CODE XREF: Terrain_ComputeLODMesh+333j
		mov	ax, di

loc_32DDD:				; CODE XREF: Terrain_ComputeLODMesh+36Bj
		les	bx, [bp+var_4]
		mov	es:[bx], ax
		push	word ptr [bp+var_4+2]
		push	bx
		push	5510h
		call	TerrainTile_CacheEntryConstruct
		add	sp, 6

loc_32DF2:				; CODE XREF: Terrain_ComputeLODMesh+309j
		inc	[bp+var_72]

loc_32DF5:				; CODE XREF: Terrain_ComputeLODMesh+29Cj
		mov	ax, [bp+var_72]
		cmp	ax, word ptr [bp+var_70]
		jg	short loc_32E00
		jmp	loc_32D0D
; ���������������������������������������������������������������������������

loc_32E00:				; CODE XREF: Terrain_ComputeLODMesh+38Dj
		inc	[bp+var_74]

loc_32E03:				; CODE XREF: Terrain_ComputeLODMesh+293j
		mov	ax, [bp+var_74]
		cmp	ax, word ptr [bp+var_70+2]
		jg	short loc_32E0E
		jmp	loc_32D04
; ���������������������������������������������������������������������������

loc_32E0E:				; CODE XREF: Terrain_ComputeLODMesh+39Bj
		mov	eax, [bp+var_6C]
		mov	[si+4Bh], eax
		mov	eax, [bp+var_70]
		mov	[si+4Fh], eax
		lea	ax, [bp+var_2C]
		push	ax
		push	si
		push	word ptr [si+45h]
		push	cs
		call	near ptr Terrain_TileIndexResolve
		add	sp, 6
		mov	eax, [bp+var_2C]

loc_32E31:
		mov	[si+53h], eax
		jmp	loc_32ECD
; ���������������������������������������������������������������������������

loc_32E38:				; CODE XREF: Terrain_ComputeLODMesh:loc_32CABj
		mov	ax, [si+4Dh]
		mov	[bp+var_74], ax
		jmp	loc_32EC2
; ���������������������������������������������������������������������������

loc_32E41:				; CODE XREF: Terrain_ComputeLODMesh+45Cj
		mov	ax, [si+4Bh]
		mov	[bp+var_72], ax

loc_32E47:
		jmp	short loc_32EB7
; ���������������������������������������������������������������������������

loc_32E49:				; CODE XREF: Terrain_ComputeLODMesh+44Fj
		cmp	[bp+var_72], 0
		jge	short loc_32E53
		xor	di, di
		jmp	short loc_32E64
; ���������������������������������������������������������������������������

loc_32E53:				; CODE XREF: Terrain_ComputeLODMesh+3DFj
		mov	ax, [si+47h]
		cmp	ax, [bp+var_72]
		jg	short loc_32E61
		mov	di, [si+47h]
		dec	di
		jmp	short loc_32E64
; ���������������������������������������������������������������������������

loc_32E61:				; CODE XREF: Terrain_ComputeLODMesh+3EBj
		mov	di, [bp+var_72]

loc_32E64:				; CODE XREF: Terrain_ComputeLODMesh+3E3j
					; Terrain_ComputeLODMesh+3F1j
		cmp	[bp+var_74], 0
		jge	short loc_32E71
		mov	[bp+var_76], 0
		jmp	short loc_32E82
; ���������������������������������������������������������������������������

loc_32E71:				; CODE XREF: Terrain_ComputeLODMesh+3FAj
		mov	ax, [si+47h]
		cmp	ax, [bp+var_74]
		jg	short loc_32E7C
		dec	ax
		jmp	short loc_32E7F
; ���������������������������������������������������������������������������

loc_32E7C:				; CODE XREF: Terrain_ComputeLODMesh+409j
		mov	ax, [bp+var_74]

loc_32E7F:				; CODE XREF: Terrain_ComputeLODMesh+40Cj
		mov	[bp+var_76], ax

loc_32E82:				; CODE XREF: Terrain_ComputeLODMesh+401j
		mov	bx, [si+45h]

loc_32E85:
		mov	ax, [bx+5]

loc_32E88:
		mov	dx, [bx+3]
		mov	word ptr [bp+var_4+2], ax

loc_32E8E:
		mov	word ptr [bp+var_4], dx

loc_32E91:
		mov	ax, [bp+var_76]
		imul	word ptr [si+47h]
		add	ax, di
		shl	ax, 1
		add	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0
		jz	short loc_32EB4
		mov	ax, [bp+var_78]
		mov	[bp+var_86], ax
		mov	bx, es:[bx]
		mov	[bx+2],	ax

loc_32EB4:				; CODE XREF: Terrain_ComputeLODMesh+437j
		inc	[bp+var_72]

loc_32EB7:				; CODE XREF: Terrain_ComputeLODMesh:loc_32E47j
		mov	ax, [si+4Fh]
		cmp	ax, [bp+var_72]
		jge	short loc_32E49
		inc	[bp+var_74]

loc_32EC2:				; CODE XREF: Terrain_ComputeLODMesh+3D0j
		mov	ax, [si+51h]
		cmp	ax, [bp+var_74]
		jl	short loc_32ECD
		jmp	loc_32E41
; ���������������������������������������������������������������������������

loc_32ECD:				; CODE XREF: Terrain_ComputeLODMesh+3C7j
					; Terrain_ComputeLODMesh+45Aj
		pop	di
		pop	si
		leave
		retf
Terrain_ComputeLODMesh	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,65L — compare une position à la limite du terrain courant (+0x92 d'un objet référencé
; +0x45) : test de limite de la tuile de terrain courante (déclenche un rechargement si
; dépassée).
; ==============================================================================================
Terrain_TileBoundaryTest	proc far		; CODE XREF: Terrain_UpdateLODPerFrame:loc_3774BP

var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, dword_72540
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+1],	eax
		mov	bx, [si+45h]
		mov	eax, [bx+92h]
		mov	[bp+var_C], eax
		mov	ax, si
		inc	ax
		mov	[bp+var_E], ax
		mov	eax, [bp+var_C]
		shl	eax, 8
		mov	bx, [bp+var_E]
		cmp	eax, [bx]
		jge	short loc_32F1E
		mov	ax, 1
		jmp	short loc_32F20
; ���������������������������������������������������������������������������

loc_32F1E:				; CODE XREF: Terrain_TileBoundaryTest+46j
		xor	ax, ax

loc_32F20:				; CODE XREF: Terrain_TileBoundaryTest+4Bj
		or	al, al
		jz	short loc_32F40
		mov	bx, [si+45h]
		mov	eax, [bx+92h]
		mov	[bp+var_12], eax
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[si+1],	eax

loc_32F40:				; CODE XREF: Terrain_TileBoundaryTest+51j
		mov	eax, [di]
		mov	[si+5],	eax
		push	di
		push	si
		call	Render_TerrainPipelineMain
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Terrain_TileBoundaryTest	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,84L — teste si une position (di) est dans la bounding box du champ de vue caméra
; (+0x57/+0x5B) : test d'inclusion dans le frustum/zone de rendu caméra.
; ==============================================================================================
Camera_FrustumBoundsTest	proc far		; CODE XREF: Camera_TransformIfVisible:loc_33091p
					; Terrain_QueryAltitudeAt+53P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [si+57h]
		cmp	eax, [di]
		jge	short loc_32F6E
		mov	ax, 1
		jmp	short loc_32F70
; ���������������������������������������������������������������������������

loc_32F6E:				; CODE XREF: Camera_FrustumBoundsTest+12j
		xor	ax, ax

loc_32F70:				; CODE XREF: Camera_FrustumBoundsTest+17j
		or	al, al
		jz	short loc_32FB6
		mov	eax, [si+5Bh]
		cmp	eax, [di+4]
		jle	short loc_32F83
		mov	ax, 1
		jmp	short loc_32F85
; ���������������������������������������������������������������������������

loc_32F83:				; CODE XREF: Camera_FrustumBoundsTest+27j
		xor	ax, ax

loc_32F85:				; CODE XREF: Camera_FrustumBoundsTest+2Cj
		or	al, al
		jz	short loc_32FB6
		mov	eax, [si+5Fh]
		cmp	eax, [di]
		jle	short loc_32F97
		mov	ax, 1
		jmp	short loc_32F99
; ���������������������������������������������������������������������������

loc_32F97:				; CODE XREF: Camera_FrustumBoundsTest+3Bj
		xor	ax, ax

loc_32F99:				; CODE XREF: Camera_FrustumBoundsTest+40j
		or	al, al
		jz	short loc_32FB6
		mov	eax, [si+63h]

loc_32FA1:
		cmp	eax, [di+4]
		jge	short loc_32FAC

loc_32FA7:
		mov	ax, 1
		jmp	short loc_32FAE
; ���������������������������������������������������������������������������

loc_32FAC:				; CODE XREF: Camera_FrustumBoundsTest+50j
		xor	ax, ax

loc_32FAE:				; CODE XREF: Camera_FrustumBoundsTest+55j
		or	al, al
		jz	short loc_32FB6
		mov	al, 1

loc_32FB4:
		jmp	short loc_32FB8
; ���������������������������������������������������������������������������

loc_32FB6:				; CODE XREF: Camera_FrustumBoundsTest+1Dj
					; Camera_FrustumBoundsTest+32j ...
		mov	al, 0

loc_32FB8:				; CODE XREF: Camera_FrustumBoundsTest:loc_32FB4j
		pop	di
		pop	si
		pop	bp
		retf
Camera_FrustumBoundsTest	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,138L — calcule le delta de position par rapport à une origine puis teste la limite
; (+0x57) : test de distance à la limite de zone de rendu.
; ==============================================================================================
Camera_DistanceLimitTest	proc far		; CODE XREF: Terrain_CheckAdjacentDistance+2BP

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	[bp+var_2], dx
		mov	eax, [di]
		mov	bx, [bp+var_2]
		sub	eax, [bx]
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	eax, [si+57h]
		cmp	eax, [bp+var_A]
		jge	short loc_32FF0
		mov	ax, 1
		jmp	short loc_32FF2
; ���������������������������������������������������������������������������

loc_32FF0:				; CODE XREF: Camera_DistanceLimitTest+2Dj
		xor	ax, ax

loc_32FF2:				; CODE XREF: Camera_DistanceLimitTest+32j
		or	al, al
		jnz	short loc_32FF9
		jmp	loc_3307A
; ���������������������������������������������������������������������������

loc_32FF9:				; CODE XREF: Camera_DistanceLimitTest+38j
		mov	[bp+var_C], dx
		mov	eax, [di+4]
		mov	bx, [bp+var_C]
		add	eax, [bx]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	eax, [si+5Bh]
		cmp	eax, [bp+var_14]
		jle	short loc_3301D
		mov	ax, 1
		jmp	short loc_3301F
; ���������������������������������������������������������������������������

loc_3301D:				; CODE XREF: Camera_DistanceLimitTest+5Aj
		xor	ax, ax

loc_3301F:				; CODE XREF: Camera_DistanceLimitTest+5Fj
		or	al, al

loc_33021:
		jz	short loc_3307A

loc_33023:
		mov	[bp+var_16], dx

loc_33026:
		mov	eax, [di]

loc_33029:
		mov	bx, [bp+var_16]
		add	eax, [bx]

loc_3302F:
		mov	[bp+var_1A], eax

loc_33033:
		mov	[bp+var_1E], eax
		mov	eax, [si+5Fh]
		cmp	eax, [bp+var_1E]
		jle	short loc_33046

loc_33041:
		mov	ax, 1
		jmp	short loc_33048
; ���������������������������������������������������������������������������

loc_33046:				; CODE XREF: Camera_DistanceLimitTest+83j
		xor	ax, ax

loc_33048:				; CODE XREF: Camera_DistanceLimitTest+88j
		or	al, al
		jz	short loc_3307A
		mov	[bp+var_20], dx

loc_3304F:
		mov	eax, [di+4]

loc_33053:
		mov	bx, [bp+var_20]
		sub	eax, [bx]
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	eax, [si+63h]
		cmp	eax, [bp+var_28]
		jge	short loc_33070
		mov	ax, 1
		jmp	short loc_33072
; ���������������������������������������������������������������������������

loc_33070:				; CODE XREF: Camera_DistanceLimitTest+ADj
		xor	ax, ax

loc_33072:				; CODE XREF: Camera_DistanceLimitTest+B2j
		or	al, al
		jz	short loc_3307A
		mov	al, 1
		jmp	short loc_3307C
; ���������������������������������������������������������������������������

loc_3307A:				; CODE XREF: Camera_DistanceLimitTest+3Aj
					; Camera_DistanceLimitTest:loc_33021j	...
		mov	al, 0

loc_3307C:				; CODE XREF: Camera_DistanceLimitTest+BCj
		pop	di
		pop	si
		leave
		retf
Camera_DistanceLimitTest	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,96L — teste l'inclusion dans le frustum (sub_32F55) puis transforme un point complet
; dans l'espace caméra si visible : transformation complète d'un point dans l'espace caméra
; avec test préalable de frustum (fonction appelée par Camera_TransformPoint).
; ==============================================================================================
Camera_TransformIfVisible	proc far		; CODE XREF: Camera_TransformPoint:loc_2E063P
					; Terrain_QueryAltitudeAt+BDP

var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h
arg_E		= dword	ptr  14h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		lea	ax, [bp+arg_6]
		push	ax
		push	si
		push	cs

loc_33091:
		call	near ptr Camera_FrustumBoundsTest
		add	sp, 4
		or	al, al
		jz	short loc_330CE
		push	[bp+arg_12]
		sub	sp, 0Ch

loc_330A1:
		mov	eax, [bp+arg_6]
		mov	[bp+var_16], eax
		mov	eax, [bp+arg_A]
		mov	[bp+var_12], eax
		mov	eax, [bp+arg_E]
		mov	[bp+var_E], eax
		push	si
		push	large [bp+arg_0]
		call	Terrain_StreamingMain
		add	sp, 14h
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		jmp	short loc_33114
; ���������������������������������������������������������������������������

loc_330CE:				; CODE XREF: Camera_TransformIfVisible+19j
		mov	di, word ptr [bp+arg_0]
		lea	ax, [bp+arg_6]
		push	ax
		push	word ptr [si+45h]
		push	cs
		call	near ptr Terrain_HeightSample
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		or	di, di
		jz	short loc_330EF
		mov	ax, di
		jmp	short loc_330F9
; ���������������������������������������������������������������������������

loc_330EF:				; CODE XREF: Camera_TransformIfVisible+69j
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_330F9:				; CODE XREF: Camera_TransformIfVisible+6Dj
		or	ax, ax
		jz	short loc_3310C
		mov	eax, [bp+var_4]
		shl	eax, 8
		mov	[di], eax
		mov	ax, di
		jmp	short loc_3310E
; ���������������������������������������������������������������������������

loc_3310C:				; CODE XREF: Camera_TransformIfVisible+7Bj
		mov	ax, di

loc_3310E:				; CODE XREF: Camera_TransformIfVisible+8Aj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_33114:				; CODE XREF: Camera_TransformIfVisible+4Cj
		pop	di
		pop	si
		leave
		retf
Camera_TransformIfVisible	endp

seg071		ends
