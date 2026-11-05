seg126		segment	para public 'CODE' use16
		assume cs:seg126
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56233		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_56233		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56238		proc far
		push	bp
		mov	bp, sp
		push	1
		push	0
		push	2
		push	large 200h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_7D00C, dx
		mov	word_7D00A, ax
		push	1
		push	0
		push	2
		push	large 400h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_7D010, dx
		mov	word_7D00E, ax
		push	large 1000000h
		push	large word_7D00A
		call	sub_380B
		add	sp, 8
		push	large 4000000h
		push	large word_7D00E
		call	sub_380B
		add	sp, 8
		pop	bp
		retf
sub_56238		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5629F		proc far

var_F8		= word ptr -0F8h
var_9B		= dword ptr -9Bh
var_97		= dword ptr -97h
var_50		= word ptr -50h

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		mov	byte_79C9E, 1
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aFLAGS
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_F8], 508h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 520h
		push	1
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		mov	bx, [bp+var_F8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 47414C46h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_5636C
		push	0
		push	large 47414C46h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5636C
		xor	si, si
		jmp	short loc_56364

loc_5634E:
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr GameVar_Set_564BB
		add	sp, 4
		inc	si

loc_56364:
		cmp	si, 100h
		jl	short loc_5634E
		jmp	short loc_56375

loc_5636C:
		push	0FEEDh
		call	sub_1DDFE
		pop	cx

loc_56375:
		mov	si, 100h
		jmp	short loc_56382

loc_5637A:
		push	si
		nop
		push	cs
		call	near ptr GameVar_ClearFlag_56520
		pop	cx
		inc	si

loc_56382:
		cmp	si, 20FFh
		jle	short loc_5637A
		mov	[bp+var_F8], 520h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_5629F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_563AB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	cs
		call	near ptr sub_56233
		mov	eax, [si+72h]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	dx, ax
		cmp	dx, 100h
		jbe	short loc_563D0
		mov	dx, 100h

loc_563D0:
		mov	ax, dx
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	large word_7D00A
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
sub_563AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_563EB		proc far
		push	bp
		mov	bp, sp
		push	0
		push	2
		push	68DAh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		push	68DEh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		pop	bp
		retf
sub_563EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Numéro < 256 : rend la variable (mot du tableau word_7D00A) ; ≥ 256 :
; rend 1 si le bit (numéro − 256) du tableau word_7D00E est posé, sinon 0.
; ==============================================================================================
GameVar_Get_56414		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_5660A
		cmp	si, 0FFh
		jbe	short loc_5645D
		sub	si, 100h
		mov	ax, si
		shr	ax, 3
		mov	[bp+var_4], ax
		mov	ax, si
		and	ax, 7
		mov	[bp+var_2], ax
		les	bx, word_7D00E
		add	bx, [bp+var_4]
		mov	al, es:[bx]
		cbw
		mov	dx, 1
		mov	cl, byte ptr [bp+var_2]
		shl	dx, cl
		test	dx, ax
		jz	short loc_56459
		mov	ax, 1
		jmp	short loc_5645B

loc_56459:
		xor	ax, ax

loc_5645B:
		jmp	short loc_5646A

loc_5645D:
		mov	ax, si
		shl	ax, 1
		les	bx, word_7D00A
		add	bx, ax
		mov	ax, es:[bx]

loc_5646A:
		pop	si
		leave
		retf
GameVar_Get_56414		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Numéro < 256 : variable = 1 ; ≥ 256 : bit (numéro − 256) posé.
; ==============================================================================================
GameVar_SetFlag_5646D		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_5660A
		cmp	si, 0FFh
		jle	short loc_564A9
		sub	si, 100h
		mov	ax, si
		sar	ax, 3
		mov	[bp+var_2], ax
		mov	ax, si
		and	ax, 7
		mov	[bp+var_4], ax
		les	bx, word_7D00E
		add	bx, [bp+var_2]
		mov	al, 1
		mov	cl, byte ptr [bp+var_4]
		shl	al, cl
		or	es:[bx], al
		jmp	short loc_564B8

loc_564A9:
		mov	ax, si
		shl	ax, 1
		les	bx, word_7D00A
		add	bx, ax
		mov	word ptr es:[bx], 1

loc_564B8:
		pop	si
		leave
		retf
GameVar_SetFlag_5646D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. (numéro, valeur) : numéro < 256 : variable = valeur ; ≥ 256 : bit posé
; si valeur ≠ 0, effacé sinon.
; ==============================================================================================
GameVar_Set_564BB		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		nop
		push	cs
		call	near ptr sub_5660A
		cmp	si, 0FFh
		jbe	short loc_5650F
		sub	si, 100h
		mov	dx, si
		shr	dx, 3
		mov	ax, si
		and	ax, 7
		mov	[bp+var_2], ax
		or	di, di
		jz	short loc_564FB
		les	bx, word_7D00E
		add	bx, dx
		mov	al, 1
		mov	cl, byte ptr [bp+var_2]
		shl	al, cl
		or	es:[bx], al
		jmp	short loc_5651C

loc_564FB:
		les	bx, word_7D00E
		add	bx, dx
		mov	al, 1
		mov	cl, byte ptr [bp+var_2]
		shl	al, cl
		not	al
		and	es:[bx], al
		jmp	short loc_5651C

loc_5650F:
		mov	ax, si
		shl	ax, 1
		les	bx, word_7D00A
		add	bx, ax
		mov	es:[bx], di

loc_5651C:
		pop	di
		pop	si
		leave
		retf
GameVar_Set_564BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Numéro < 256 : variable = 0 ; ≥ 256 : bit (numéro − 256) effacé.
; ==============================================================================================
GameVar_ClearFlag_56520		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_5660A
		cmp	si, 0FFh
		jbe	short loc_5655E
		sub	si, 100h
		mov	ax, si
		shr	ax, 3
		mov	[bp+var_2], ax
		mov	ax, si
		and	ax, 7
		mov	[bp+var_4], ax
		les	bx, word_7D00E
		add	bx, [bp+var_2]
		mov	al, 1
		mov	cl, byte ptr [bp+var_4]
		shl	al, cl
		not	al
		and	es:[bx], al
		jmp	short loc_5656D

loc_5655E:
		mov	ax, si
		shl	ax, 1
		les	bx, word_7D00A
		add	bx, ax
		mov	word ptr es:[bx], 0

loc_5656D:
		pop	si
		leave
		retf
GameVar_ClearFlag_56520		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56570		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_5660A
		cmp	si, 0FFh
		jbe	short loc_565D7
		push	si
		push	cs
		call	near ptr GameVar_Get_56414
		pop	cx
		sub	si, 100h
		mov	di, si
		shr	di, 3
		mov	ax, si
		and	ax, 7
		mov	[bp+var_4], ax
		mov	ax, si
		add	ax, 100h
		push	ax
		push	cs
		call	near ptr GameVar_Get_56414
		pop	cx
		mov	byte ptr [bp+var_2+1], al
		cmp	byte ptr [bp+var_2+1], 0
		jz	short loc_565C5
		les	bx, word_7D00E
		add	bx, di
		mov	al, 1
		mov	cl, byte ptr [bp+var_4]
		shl	al, cl
		not	al
		and	es:[bx], al
		jmp	short loc_56606

loc_565C5:
		les	bx, word_7D00E
		add	bx, di
		mov	al, 1
		mov	cl, byte ptr [bp+var_4]
		shl	al, cl
		or	es:[bx], al
		jmp	short loc_56606

loc_565D7:
		push	si
		push	cs
		call	near ptr GameVar_Get_56414
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_565F7
		mov	ax, si
		shl	ax, 1
		les	bx, word_7D00A
		add	bx, ax
		mov	word ptr es:[bx], 0
		jmp	short loc_56606

loc_565F7:
		mov	ax, si
		shl	ax, 1
		les	bx, word_7D00A
		add	bx, ax
		mov	word ptr es:[bx], 1

loc_56606:
		pop	di
		pop	si
		leave
		retf
sub_56570		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5660A		proc far
		push	bp
		mov	bp, sp
sub_5660A		endp

; START OF FUNCTION CHUNK FOR sub_5660A
		db 80h
		outsb
; END OF FUNCTION CHUNK FOR sub_5660A
seg126		ends
