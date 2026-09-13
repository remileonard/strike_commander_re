seg062		segment	byte public 'CODE' use16
		assume cs:seg062
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_2D942:				; DATA XREF: seg339:15A0o
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+0Ah]

loc_2D94C:				; DATA XREF: seg216:02B6o
		cmp	dword ptr [bp+6], 0
		jz	short loc_2D9A6

loc_2D953:
		les	bx, [bp+6]
		mov	word ptr es:[bx], 15A0h
		push	0
		push	2
		mov	eax, es:[bx+1Eh]

loc_2D964:
		mov	[bp-4],	eax
		lea	ax, [bp-4]
		push	ax
		push	5C44h

loc_2D96F:
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_2D977:
		push	0
		push	large dword ptr	[bp+6]

loc_2D97D:
		call	Widget_DestructWithLabel
		add	sp, 6
		test	si, 1
		jz	short loc_2D9A6
		mov	eax, [bp+6]
		mov	[bp-8],	eax
		push	0
		push	2
		lea	ax, [bp-8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_2D9A6:				; CODE XREF: seg062:0011j seg062:0049j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2D9A9:				; DATA XREF: seg339:15A4o
		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+6]
		mov	[bp-8],	eax
		mov	ax, [bp+0Ah]
		mov	[bp-0Ah], ax
		push	1
		push	0
		push	2

loc_2D9C3:
		push	large 20h ; ' '
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp-0Ch], dx

loc_2D9D4:
		mov	[bp-0Eh], ax
		or	ax, dx
		jz	short loc_2DA30
		les	bx, [bp-0Eh]

loc_2D9DE:
		mov	word ptr es:[bx], 155Ch

loc_2D9E3:
		push	dx
		push	bx

loc_2D9E5:
		call	Descriptor_Reset
		add	sp, 4
		les	bx, [bp-0Eh]
		mov	word ptr es:[bx], 189Eh
		mov	word ptr es:[bx+0Fh], 11E8h
		mov	word ptr es:[bx+0Fh], 1836h
		push	word ptr [bp-0Ch]
		push	bx
		call	Descriptor_ResetSingleChild
		add	sp, 4
		les	bx, [bp-0Eh]
		mov	word ptr es:[bx], 18CAh
		push	word ptr [bp-0Ah]
		push	large dword ptr	[bp-8]
		push	word ptr [bp-0Ch]
		push	bx

loc_2DA20:
		call	VROOMM_StubThunk_6BBB5
		add	sp, 0Ah
		mov	dx, [bp-0Ch]
		mov	ax, [bp-0Eh]
		jmp	short loc_2DA36
; ���������������������������������������������������������������������������

loc_2DA30:				; CODE XREF: seg062:0099j
		mov	dx, [bp-0Ch]

loc_2DA33:
		mov	ax, [bp-0Eh]

loc_2DA36:				; CODE XREF: seg062:00EEj
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,18L — initialise un indicateur avec caractère glyphe par défaut 'W' et échelle 1:1
; (+0x18/0x1A), référence à 0 : constructeur d'icône/indicateur HUD avec valeur par défaut.
; ==============================================================================================
HudIcon_ConstructDefault	proc far		; CODE XREF: HudIcon_ConstructAndLoadFromIFF_97370+BP

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+17h], 57h ; 'W'
		mov	word ptr es:[bx+18h], 1

loc_2DA4F:
		mov	word ptr es:[bx+1Ah], 1

loc_2DA55:
		mov	dword ptr es:[bx+1Eh], 0
		pop	bp
		retf
HudIcon_ConstructDefault	endp

; ���������������������������������������������������������������������������

loc_2DA60:				; DATA XREF: seg339:15A8o
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2DA67:				; DATA XREF: seg339:18F2o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_2DAAF
		les	bx, [bp+6]
		mov	word ptr es:[bx], 18CAh

loc_2DA80:
		push	0
		push	word ptr [bp+8]
		push	bx
		call	Widget_DestructComposite
		add	sp, 6
		test	si, 1

loc_2DA92:
		jz	short loc_2DAAF

loc_2DA94:
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_2DAAF:				; CODE XREF: seg062:0136j
					; seg062:loc_2DA92j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large dword ptr	[bp+6]
		call	Descriptor_ResetSingleChild

loc_2DAC1:
		add	sp, 4
		les	bx, [bp+6]

loc_2DAC7:
		mov	word ptr es:[bx+1Eh], 0

loc_2DACD:
		mov	dword ptr [bp-4], 0
		mov	eax, [bp-4]

loc_2DAD9:
		mov	es:[bx+1Ah], eax
		leave
		retf
; ���������������������������������������������������������������������������

loc_2DAE0:				; DATA XREF: seg339:18EEo
		push	bp

loc_2DAE1:
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2DAE7:				; DATA XREF: seg339:18E2o
		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di

loc_2DAEF:
		mov	byte ptr [bp-1], 1

loc_2DAF3:
		mov	ax, [bp+8]

loc_2DAF6:
		mov	dx, [bp+6]
		add	dx, 1Ah
		mov	[bp-8],	ax
		mov	[bp-0Ah], dx
		les	bx, [bp-0Ah]
		mov	eax, es:[bx]
		mov	[bp-6],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+2]
		mov	[bp-0Eh], eax
		cmp	dword ptr es:[bx+9], 0
		jnz	short loc_2DB24

loc_2DB21:
		jmp	loc_2DCB9
; ���������������������������������������������������������������������������

loc_2DB24:				; CODE XREF: seg062:01DFj
		les	bx, [bp-0Eh]

loc_2DB27:
		mov	ax, es:[bx+18h]

loc_2DB2B:
		mov	[bp-18h], ax
		movsx	eax, word ptr [bp-18h]
		shl	eax, 8
		mov	[bp-1Ch], eax
		mov	eax, [bp-1Ch]
		mov	edx, eax
		mov	ecx, dword_70454
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-20h], eax
		mov	eax, [bp-20h]
		mov	[bp-16h], eax
		cmp	dword ptr [bp-16h], 0
		jge	short loc_2DB6A
		mov	ax, 1
		jmp	short loc_2DB6C
; ���������������������������������������������������������������������������

loc_2DB6A:				; CODE XREF: seg062:0223j
		xor	ax, ax

loc_2DB6C:				; CODE XREF: seg062:0228j
		or	al, al
		jz	short loc_2DBA4
		mov	eax, [bp-16h]
		add	[bp-6],	eax
		cmp	dword ptr [bp-6], 100h
		jl	short loc_2DB87

loc_2DB82:
		mov	ax, 1

loc_2DB85:
		jmp	short loc_2DB89
; ���������������������������������������������������������������������������

loc_2DB87:				; CODE XREF: seg062:0240j
		xor	ax, ax

loc_2DB89:				; CODE XREF: seg062:loc_2DB85j
		or	al, al
		jz	short loc_2DB9F

loc_2DB8D:
		mov	dword ptr [bp-24h], 0
		mov	eax, [bp-24h]
		mov	[bp-6],	eax
		jmp	short loc_2DBA4
; ���������������������������������������������������������������������������

loc_2DB9F:				; CODE XREF: seg062:024Bj
		mov	al, 1
		jmp	loc_2DCD0
; ���������������������������������������������������������������������������

loc_2DBA4:				; CODE XREF: seg062:022Ej seg062:025Dj
		les	bx, [bp-0Eh]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2DBB6
		mov	si, es:[bx+1Ch]
		dec	si
		jmp	short loc_2DBBE
; ���������������������������������������������������������������������������

loc_2DBB6:				; CODE XREF: seg062:026Dj
		les	bx, [bp-0Eh]
		mov	si, es:[bx+2]
		dec	si

loc_2DBBE:				; CODE XREF: seg062:0274j
		les	bx, [bp+6]
		mov	ax, es:[bx+1Eh]
		les	bx, [bp-0Eh]
		add	ax, es:[bx+1Ah]
		mov	di, ax
		mov	al, es:[bx+17h]

loc_2DBD2:
		cbw

loc_2DBD3:
		sub	ax, 52h	; 'R'
		mov	bx, ax
		cmp	bx, 5		; switch 6 cases
		jbe	short loc_2DBE0

loc_2DBDD:				; default
		jmp	loc_2DC6B
; ���������������������������������������������������������������������������

loc_2DBE0:				; CODE XREF: seg062:029Bj
		shl	bx, 1

loc_2DBE2:				; switch jump
		jmp	cs:off_2DCD4[bx]

loc_2DBE7:				; DATA XREF: seg062:off_2DCD4o
		cmp	di, si		; case 0x2
		jg	short loc_2DBEF
		or	di, di
		jge	short loc_2DC64

loc_2DBEF:				; CODE XREF: seg062:02A9j
		mov	byte ptr [bp-1], 0
		jmp	short loc_2DC6B	; default
; ���������������������������������������������������������������������������
		jmp	short loc_2DC64
; ���������������������������������������������������������������������������

loc_2DBF7:				; CODE XREF: seg062:loc_2DBE2j
					; DATA XREF: seg062:off_2DCD4o
		les	bx, [bp+6]	; case 0x5
		mov	es:[bx+1Eh], di

loc_2DBFE:
		cmp	es:[bx+1Eh], si

loc_2DC02:
		jle	short loc_2DC0A

loc_2DC04:
		mov	word ptr es:[bx+1Eh], 0

loc_2DC0A:				; CODE XREF: seg062:loc_2DC02j
		les	bx, [bp+6]
		cmp	word ptr es:[bx+1Eh], 0
		jge	short loc_2DC6B	; default
		mov	es:[bx+1Eh], si
		jmp	short loc_2DC6B	; default
; ���������������������������������������������������������������������������

loc_2DC1A:				; CODE XREF: seg062:loc_2DBE2j
					; DATA XREF: seg062:off_2DCD4o
		les	bx, [bp+6]	; case 0x0
		mov	es:[bx+1Eh], di
		cmp	es:[bx+1Eh], si
		jl	short loc_2DC37
		les	bx, [bp-0Eh]
		mov	word ptr es:[bx+1Ah], 0FFFFh
		les	bx, [bp+6]
		mov	es:[bx+1Eh], si

loc_2DC37:				; CODE XREF: seg062:02E5j
		les	bx, [bp+6]
		cmp	word ptr es:[bx+1Eh], 0
		jg	short loc_2DC6B	; default
		les	bx, [bp-0Eh]
		mov	word ptr es:[bx+1Ah], 1
		les	bx, [bp+6]
		mov	word ptr es:[bx+1Eh], 0
		jmp	short loc_2DC6B	; default
; ���������������������������������������������������������������������������

loc_2DC55:				; CODE XREF: seg062:loc_2DBE2j
					; DATA XREF: seg062:off_2DCD4o
		cmp	di, si		; case 0x1
		jle	short loc_2DC64
		les	bx, [bp-0Eh]
		mov	word ptr es:[bx+1Ah], 0
		jmp	short loc_2DC6B	; default
; ���������������������������������������������������������������������������

loc_2DC64:				; CODE XREF: seg062:02ADj seg062:02B5j ...
		les	bx, [bp+6]
		mov	es:[bx+1Eh], di

loc_2DC6B:				; CODE XREF: seg062:loc_2DBDDj
					; seg062:loc_2DBE2j ...
		les	bx, [bp-0Eh]	; default

loc_2DC6E:
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2DCA7

loc_2DC76:
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2DC94
		les	bx, es:[bx+1Eh]
		push	es
		les	si, [bp+6]
		mov	ax, es:[si+1Eh]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		jmp	short loc_2DC9B
; ���������������������������������������������������������������������������

loc_2DC94:				; CODE XREF: seg062:033Cj
		les	bx, [bp+6]
		mov	ax, es:[bx+1Eh]

loc_2DC9B:				; CODE XREF: seg062:0352j
		mov	[bp-26h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+9]
		jmp	short loc_2DCB5
; ���������������������������������������������������������������������������

loc_2DCA7:				; CODE XREF: seg062:0334j
		les	bx, [bp+6]
		mov	ax, es:[bx+1Eh]
		mov	[bp-28h], ax
		les	bx, es:[bx+9]

loc_2DCB5:				; CODE XREF: seg062:0365j
		mov	es:[bx+6], ax

loc_2DCB9:				; CODE XREF: seg062:loc_2DB21j
		mov	eax, [bp-6]
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		les	bx, [bp+6]
		mov	es:[bx+1Ah], eax
		mov	al, [bp-1]

loc_2DCD0:				; CODE XREF: seg062:0261j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_2DCD4	dw offset loc_2DC1A	; DATA XREF: seg062:loc_2DBE2r
		dw offset loc_2DC55	; jump table for switch	statement
		dw offset loc_2DBE7
		dw offset loc_2DC6B
		dw offset loc_2DC6B
		dw offset loc_2DBF7

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,84L — recherche une clé (sub_54DF4, probable recherche dichotomique) dans une table
; triée référencée par un objet (+2), résout un index (+0x1E) puis une valeur associée dans un
; tableau : résolution de valeur par recherche dans une table triée (jauge/barre graduée avec
; interpolation).
; ==============================================================================================
Gauge_ResolveInterpolated	proc far		; CODE XREF: Debris_SpawnAtAttachPoint+1C5P
					; Debris_SpawnOrchestrator+2FFP

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_2DCE3:
		sub	sp, 8
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]

loc_2DCF6:
		cmp	dword ptr es:[bx+1Eh], 0

loc_2DCFC:
		jz	short loc_2DD04
		mov	dx, es:[bx+1Ch]

loc_2DD02:
		jmp	short loc_2DD0B
; ���������������������������������������������������������������������������

loc_2DD04:				; CODE XREF: Gauge_ResolveInterpolated:loc_2DCFCj
		les	bx, [bp+var_4]
		mov	dx, es:[bx+2]

loc_2DD0B:				; CODE XREF: Gauge_ResolveInterpolated:loc_2DD02j
		mov	ax, dx
		call	Math_RandomScale_54DF4
		les	bx, [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2DD55
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2DD42
		les	bx, es:[bx+1Eh]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+1Eh]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		jmp	short loc_2DD49
; ���������������������������������������������������������������������������

loc_2DD42:				; CODE XREF: Gauge_ResolveInterpolated+4Aj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Eh]

loc_2DD49:				; CODE XREF: Gauge_ResolveInterpolated+60j
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]

loc_2DD4F:
		les	bx, es:[bx+9]

loc_2DD53:
		jmp	short loc_2DD63
; ���������������������������������������������������������������������������

loc_2DD55:				; CODE XREF: Gauge_ResolveInterpolated+42j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Eh]
		mov	[bp+var_8], ax

loc_2DD5F:
		les	bx, es:[bx+9]

loc_2DD63:				; CODE XREF: Gauge_ResolveInterpolated:loc_2DD53j
		mov	es:[bx+6], ax
		pop	si
		leave
		retf
Gauge_ResolveInterpolated	endp

seg062		ends
