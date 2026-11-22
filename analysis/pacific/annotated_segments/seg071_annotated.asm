seg071		segment	para public 'CODE' use16
		assume cs:seg071
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1, 16h, 65h, 83h, 0C4h, 8, 0EBh, 0

loc_2B978:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B97B		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_2B9DF
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 119Ch
		push	0
		push	2
		mov	eax, es:[bx+1Eh]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	large [bp+arg_0]
		call	Widget_DestructWithLabel
		add	sp, 6
		test	si, 1
		jz	short loc_2B9DF
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_2B9DF:
		pop	si
		leave
		retf
sub_2B97B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B9E2		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_A], ax
		push	1
		push	0
		push	2
		push	large 24h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		or	ax, dx
		jz	short loc_2BA69
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 1100h
		push	dx
		push	bx
		call	Descriptor_Reset
		add	sp, 4
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 1382h
		mov	word ptr es:[bx+0Fh], 338h
		mov	word ptr es:[bx+0Fh], 1236h
		push	[bp+var_C]
		push	bx
		call	Descriptor_ResetSingleChild
		add	sp, 4
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 13AEh
		push	[bp+var_A]
		push	large [bp+var_8]
		push	[bp+var_C]
		push	bx
		call	sub_73D55
		add	sp, 0Ah
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		jmp	short loc_2BA6F

loc_2BA69:
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]

loc_2BA6F:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
sub_2B9E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; HudIcon_ConstructDefault (sub_2DA3E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,18L — initialise un indicateur avec caractère glyphe par
; défaut 'W' et échelle 1:1 (+0x18/0x1A), référence à 0 : constructeur d'icône/indicateur HUD
; avec valeur par défaut.
; ==============================================================================================
HudIcon_ConstructDefault		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+17h], 57h
		mov	word ptr es:[bx+18h], 1
		mov	word ptr es:[bx+1Ah], 1
		mov	dword ptr es:[bx+1Eh], 0
		pop	bp
		retf
HudIcon_ConstructDefault		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BA99		proc far
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
sub_2BA99		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BAA0		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_2BAE8
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 13AEh
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Widget_DestructComposite
		add	sp, 6
		test	si, 1
		jz	short loc_2BAE8
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_2BAE8:
		pop	si
		leave
		retf
sub_2BAA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BAEB		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_0]
		call	Descriptor_ResetSingleChild
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+22h], 0
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	es:[bx+1Eh], eax
		leave
		retf
sub_2BAEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BB19		proc far
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
sub_2BB19		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BB20		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	[bp+var_1], 1
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_6], eax
		cmp	dword ptr es:[bx+9], 0
		jnz	short loc_2BB42
		jmp	loc_2BC4F

loc_2BB42:
		les	bx, word ptr [bp+var_6]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2BB54
		mov	dx, es:[bx+1Ch]
		dec	dx
		jmp	short loc_2BB5C

loc_2BB54:
		les	bx, word ptr [bp+var_6]
		mov	dx, es:[bx+2]
		dec	dx

loc_2BB5C:
		les	bx, [bp+arg_0]
		mov	cx, es:[bx+22h]
		les	bx, word ptr [bp+var_6]
		add	cx, es:[bx+1Ah]
		mov	al, es:[bx+17h]
		cbw
		sub	ax, 52h
		mov	bx, ax
		cmp	bx, 5
		jbe	short loc_2BB7C
		jmp	loc_2BC01

loc_2BB7C:
		shl	bx, 1
		jmp	cs:off_2BC55[bx]	; switch jump

loc_2BB83:
		cmp	cx, dx
		jg	short loc_2BB8B
		or	cx, cx
		jge	short loc_2BBFA

loc_2BB8B:
		mov	[bp+var_1], 0
		jmp	short loc_2BC01
		jmp	short loc_2BBFA

loc_2BB93:
		les	bx, [bp+arg_0]
		mov	es:[bx+22h], cx
		cmp	es:[bx+22h], dx
		jle	short loc_2BBA2
		jmp	short loc_2BBE0

loc_2BBA2:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+22h], 0
		jge	short loc_2BC01
		jmp	short loc_2BBC4

loc_2BBAE:
		les	bx, [bp+arg_0]
		mov	es:[bx+22h], cx
		cmp	es:[bx+22h], dx
		jl	short loc_2BBCD
		les	bx, word ptr [bp+var_6]
		mov	word ptr es:[bx+1Ah], 0FFFFh

loc_2BBC4:
		les	bx, [bp+arg_0]
		mov	es:[bx+22h], dx
		jmp	short loc_2BC01

loc_2BBCD:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+22h], 0
		jg	short loc_2BC01
		les	bx, word ptr [bp+var_6]
		mov	word ptr es:[bx+1Ah], 1

loc_2BBE0:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+22h], 0
		jmp	short loc_2BC01

loc_2BBEB:
		cmp	cx, dx
		jle	short loc_2BBFA
		les	bx, word ptr [bp+var_6]
		mov	word ptr es:[bx+1Ah], 0
		jmp	short loc_2BC01

loc_2BBFA:
		les	bx, [bp+arg_0]
		mov	es:[bx+22h], cx

loc_2BC01:
		les	bx, word ptr [bp+var_6]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2BC3D
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2BC2A
		les	bx, es:[bx+1Eh]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+22h]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		jmp	short loc_2BC31

loc_2BC2A:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+22h]

loc_2BC31:
		mov	[bp+var_8], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+9]
		jmp	short loc_2BC4B

loc_2BC3D:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+22h]
		mov	[bp+var_A], ax
		les	bx, es:[bx+9]

loc_2BC4B:
		mov	es:[bx+4], ax

loc_2BC4F:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_2BB20		endp

; START OF FUNCTION CHUNK FOR sub_2BB20
off_2BC55	dw offset loc_2BBAE
		dw offset loc_2BBEB
		dw offset loc_2BB83
		dw offset loc_2BC01
		dw offset loc_2BC01
		dw offset loc_2BB93
; END OF FUNCTION CHUNK FOR sub_2BB20

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BC61		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2BC85
		mov	dx, es:[bx+1Ch]
		jmp	short loc_2BC8C

loc_2BC85:
		les	bx, word ptr [bp+var_4]
		mov	dx, es:[bx+2]

loc_2BC8C:
		mov	ax, dx
		call	Math_RandomScale_56C2F
		les	bx, [bp+arg_0]
		mov	es:[bx+22h], ax
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2BCD6
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_2BCC3
		les	bx, es:[bx+1Eh]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+22h]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		jmp	short loc_2BCCA

loc_2BCC3:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+22h]

loc_2BCCA:
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+9]
		jmp	short loc_2BCE4

loc_2BCD6:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+22h]
		mov	[bp+var_8], ax
sub_2BC61		endp
seg071		ends
