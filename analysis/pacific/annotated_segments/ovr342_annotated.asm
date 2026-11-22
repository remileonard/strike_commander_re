ovr342		segment	para public 'OVERLAY' use16
		assume cs:ovr342
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA8A0		proc far

var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+arg_6]
		mov	di, [bp+arg_8]
		movzx	eax, si
		movzx	edx, di
		imul	eax, edx
		mov	[bp+var_4], eax
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[bp+var_8], eax
		movzx	eax, di
		mov	[bp+var_C], eax
		movzx	eax, si
		mov	[bp+var_10], eax
		inc	[bp+var_4]
		and	[bp+var_4], 0FFFFFFFEh
		inc	[bp+var_8]
		and	[bp+var_8], 0FFFFFFFEh
		cmp	byte_7752B, 0
		jz	short loc_BA8FA
		mov	[bp+arg_A], 3

loc_BA8FA:
		push	1
		push	0
		mov	al, [bp+arg_A]
		push	ax
		cmp	word_7974E, 0
		jz	short loc_BA910
		cmp	word_79750, 0
		jnz	short loc_BA917

loc_BA910:
		cmp	word_79752, 0
		jz	short loc_BA91D

loc_BA917:
		mov	eax, [bp+var_8]
		jmp	short loc_BA921

loc_BA91D:
		mov	eax, [bp+var_4]

loc_BA921:
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		cmp	[bp+var_14], 0
		jnz	short loc_BA944
		push	9030h
		call	sub_1DDFE
		pop	cx

loc_BA944:
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_A]
		mov	es:[bx+0Ch], al
		mov	es:[bx+8], si
		mov	es:[bx+0Ah], di
		mov	al, es:[bx+0Ch]
		push	ax
		push	large [bp+var_14]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_18], eax
		push	1
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		mov	eax, [bp+var_C]
		shl	eax, 2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2], dx
		mov	word ptr [bp+var_1C], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	dx
		push	word ptr [bp+var_1C]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		cmp	[bp+var_1C], 0
		jnz	short loc_BA9C6
		push	9030h
		call	sub_1DDFE
		pop	cx

loc_BA9C6:
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large [bp+var_1C]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_1E], dx
		mov	[bp+var_20], ax
		mov	[bp+var_24], 0
		jmp	short loc_BAA4C

loc_BA9EF:
		cmp	word_7974E, 0
		jz	short loc_BA9FD
		cmp	word_79750, 0
		jnz	short loc_BAA04

loc_BA9FD:
		cmp	word_79752, 0
		jz	short loc_BAA29

loc_BAA04:
		mov	eax, [bp+var_C]
		dec	eax
		cmp	eax, [bp+var_24]
		jle	short loc_BAA21
		mov	eax, [bp+var_24]

loc_BAA14:
		mov	ebx, 2
		cdq
		idiv	ebx
		jmp	short loc_BAA2D

loc_BAA21:
		mov	eax, [bp+var_24]
		dec	eax
		jmp	short loc_BAA14

loc_BAA29:
		mov	eax, [bp+var_24]

loc_BAA2D:
		imul	eax, [bp+var_10]
		mov	edx, [bp+var_18]
		add	edx, eax
		mov	ax, word ptr [bp+var_24]
		shl	ax, 2
		les	bx, [bp+var_20]
		add	bx, ax
		mov	es:[bx], edx
		inc	[bp+var_24]

loc_BAA4C:
		mov	eax, [bp+var_24]
		cmp	eax, [bp+var_C]
		jl	short loc_BA9EF
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large [bp+var_1C]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		push	2
		mov	ax, [bp+arg_0]
		add	ax, 4
		push	[bp+arg_2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		push	[bp+arg_2]
		push	bx
		nop
		push	cs
		call	near ptr sub_BAAAE
		add	sp, 4
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_BA8A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAAAE		proc far

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+4], 0
		jnz	short loc_BAAC3
		jmp	loc_BABBB

loc_BAAC3:
		push	large es:[bx+4]
		call	sub_63512
		add	sp, 4
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_A], eax
		mov	al, [si+4]
		mov	[bp+var_6], al
		mov	al, [si+5]
		mov	[bp+var_5], al
		mov	eax, [si+6]
		mov	[bp+var_4], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		les	bx, [bp+var_E]
		push	large es:[bx]
		call	sub_63512
		add	sp, 4
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	al, [si+4]
		mov	[bp+var_14], al
		mov	al, [si+5]
		mov	[bp+var_13], al
		mov	eax, [si+6]
		mov	[bp+var_12], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large [bp+var_18]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], ax
		cmp	[bp+var_13], 0
		jz	short loc_BAB7B
		cmp	[bp+var_18], 0
		jz	short loc_BAB7B
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_BAB7B

loc_BAB7B:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_5], 0
		jz	short loc_BABB3
		cmp	[bp+var_A], 0
		jz	short loc_BABB3
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_BABB3

loc_BABB3:
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]
		jmp	short loc_BABBF

loc_BABBB:
		xor	dx, dx
		xor	ax, ax

loc_BABBF:
		pop	si
		leave
		retf
sub_BAAAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BABC2		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	word_79750, 1
		push	2
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_BA8A0
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_BABF8
		jmp	loc_BAD34

loc_BABF8:
		cmp	word_7974E, 0
		jnz	short loc_BAC02
		jmp	loc_BACE4

loc_BAC02:
		cmp	word_79752, 0
		jz	short loc_BAC0C
		jmp	loc_BACE4

loc_BAC0C:
		movsx	eax, [bp+arg_8]
		movsx	edx, [bp+arg_6]
		imul	eax, edx
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		push	0
		push	3
		push	dx
		push	ax
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		push	large [bp+var_8]
		push	dx
		push	ax
		mov	bx, [bp+arg_A]
		push	large [bx+4Dh]
		push	bx
		call	sub_1C532
		add	sp, 0Eh
		push	0
		push	3
		push	large [bp+var_C]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		push	large [bp+var_8]
		push	dx
		push	ax
		push	large dword_7748F
		call	sub_6418B
		add	sp, 0Ch
		push	0
		push	3
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_BAAAE
		add	sp, 4
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		push	es
		push	ds
		pushaw
		les	di, [bp+var_14]
		lds	si, word ptr dword_7748F
		mov	bx, [bp+arg_6]
		mov	dx, bx
		mov	cx, [bp+arg_8]
		shr	cx, 1

loc_BACC8:
		push	si

loc_BACC9:
		mov	al, [si]
		mov	es:[di], al
		add	si, 1
		inc	di
		dec	bx
		jnz	short loc_BACC9
		pop	si
		add	si, dx
		add	si, dx
		mov	bx, dx
		dec	cx
		jnz	short loc_BACC8
		popaw
		pop	ds
		pop	es
		jmp	short loc_BAD3D

loc_BACE4:
		cmp	word_79752, 0
		jz	short loc_BAD11
		movsx	eax, [bp+arg_6]
		push	eax
		mov	ax, [bp+arg_8]
		cwd
		sub	ax, dx
		sar	ax, 1
		movsx	eax, ax
		pop	edx
		imul	edx, eax
		mov	[bp+var_4], edx
		inc	[bp+var_4]
		and	[bp+var_4], 0FFFFFFFEh

loc_BAD11:
		push	large [bp+var_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_BAAAE
		add	sp, 4
		push	dx
		push	ax
		mov	bx, [bp+arg_A]
		push	large [bx+4Dh]
		push	bx
		call	sub_1C532
		add	sp, 0Eh
		jmp	short loc_BAD3D

loc_BAD34:
		push	0B00Bh
		call	sub_1DDFE
		pop	cx

loc_BAD3D:
		cmp	[bp+var_4], 0
		jz	short loc_BAD49
		mov	ax, 1
		jmp	short loc_BAD4B

loc_BAD49:
		xor	ax, ax

loc_BAD4B:
		pop	di
		pop	si
		leave
		retf
sub_BABC2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Lit 4 octets (largeur et hauteur sur 2 octets chacune, constat sur
; ACCPACK.PAK : 120 × 126), réserve l'image dans l'enregistrement (sub_BA8A0) puis lit les
; points (un octet de palette par point). Rend 1 si l'image est chargée.
; ==============================================================================================
TextureRecord_ReadImage_BAD4F		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_6]
		mov	word_79750, 0
		push	large 0FFFFFFFFh
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	word_79750, 0
		push	2
		push	large [bp+var_4]
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_BA8A0
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		cmp	eax, 0
		jz	short loc_BADB6
		push	large 0FFFFFFFFh
		push	eax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_BAAAE
		add	sp, 4
		push	dx
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh

loc_BADB6:
		cmp	[bp+var_8], 0
		jz	short loc_BADC2
		mov	ax, 1
		jmp	short loc_BADC4

loc_BADC2:
		xor	ax, ax

loc_BADC4:
		pop	si
		leave
		retf
TextureRecord_ReadImage_BAD4F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BADC7		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	word_79750, 0
		push	2
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_BA8A0
		add	sp, 0Ch
		mov	si, ax
		or	si, si
		jz	short loc_BAE0E
		push	large 0FFFFFFFFh
		movsx	eax, si
		push	eax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_BAAAE
		add	sp, 4
		push	dx
		push	ax
		push	[bp+arg_A]
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh

loc_BAE0E:
		or	si, si
		jz	short loc_BAE17
		mov	ax, 1
		jmp	short loc_BAE19

loc_BAE17:
		xor	ax, ax

loc_BAE19:
		pop	si
		pop	bp
		retf
sub_BADC7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Avec un PAK : se place sur l'entrée demandée (sub_7844) puis
; TextureRecord_ReadImage_BAD4F. Sans PAK : ouvre TXM\<nom> (extension aTXM_1) et lit l'image
; de ce fichier.
; ==============================================================================================
TextureRecord_LoadFromPakOrFile_BAE1C		proc far

var_B0		= word ptr -0B0h
var_52		= word ptr -52h
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	[bp+var_1], 0
		or	di, di
		jz	short loc_BAE51
		push	[bp+arg_8]
		push	di
		call	sub_7844
		add	sp, 4
		push	di
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr TextureRecord_ReadImage_BAD4F
		add	sp, 8
		mov	[bp+var_1], al
		jmp	short loc_BAEAC

loc_BAE51:
		push	ds
		push	offset aTXM_1
		push	ds
		push	si
		push	ds
		push	offset aTXM
		lea	ax, [bp+var_52]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantC_6BFD4
		add	sp, 6
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ValidateState_6C307
		pop	cx
		or	al, al
		jz	short loc_BAE9D
		lea	ax, [bp+var_B0]
		push	ax
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr TextureRecord_ReadImage_BAD4F
		add	sp, 8
		mov	[bp+var_1], al

loc_BAE9D:
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_Close_6C110
		add	sp, 4

loc_BAEAC:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
TextureRecord_LoadFromPakOrFile_BAE1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAEB3		proc far

var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Ch], 0FFh
		jnz	short loc_BAEC9
		mov	ax, 1
		jmp	short loc_BAECB

loc_BAEC9:
		xor	ax, ax

loc_BAECB:
		or	al, al
		jz	short loc_BAEEB
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+4], 0
		mov	dword ptr es:[bx], 0
		mov	byte ptr es:[bx+0Ch], 2
		jmp	loc_BB017

loc_BAEEB:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+4], 0
		jnz	short loc_BAEF9
		jmp	loc_BB017

loc_BAEF9:
		push	large es:[bx+4]
		call	sub_63512
		add	sp, 4
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_A], eax
		mov	al, [si+4]
		mov	[bp+var_6], al
		mov	al, [si+5]
		mov	[bp+var_5], al
		mov	eax, [si+6]
		mov	[bp+var_4], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		les	bx, [bp+var_E]
		push	large es:[bx]
		call	sub_63512
		add	sp, 4
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	al, [si+4]
		mov	[bp+var_14], al
		mov	al, [si+5]
		mov	[bp+var_13], al
		mov	eax, [si+6]
		mov	[bp+var_12], eax
		cmp	word_79754, 0
		jnz	short loc_BAF8E
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_BAF8E:
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+4], 0
		mov	dword ptr es:[bx], 0
		cmp	[bp+var_13], 0
		jz	short loc_BAFDF
		cmp	[bp+var_18], 0
		jz	short loc_BAFDF
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_BAFDF

loc_BAFDF:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_5], 0
		jz	short loc_BB017
		cmp	[bp+var_A], 0
		jz	short loc_BB017
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_BB017

loc_BB017:
		pop	si
		leave
		retf
sub_BAEB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextCycler_ReleaseResource_A7538 (sub_A7538 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine TextCycler_Helper2_A74E3 et sub_346
; (désallocation runtime).
; ==============================================================================================
TextCycler_ReleaseResource_BB01A		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_BB045
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_BAEB3
		add	sp, 4
		test	si, 1
		jz	short loc_BB045
		push	large [bp+arg_0]
		call	sub_3C0
		add	sp, 4

loc_BB045:
		pop	si
		pop	bp
		retf
TextCycler_ReleaseResource_BB01A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB048		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_6]
		mov	di, [bp+arg_8]
		mov	word_79750, 0
		cmp	word_79752, 0
		jz	short loc_BB090
		movsx	eax, si
		push	eax
		movsx	eax, di
		mov	ebx, 2
		cdq
		idiv	ebx
		pop	edx
		imul	edx, eax
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], dx
		inc	word ptr es:[bx+16h]
		and	word ptr es:[bx+16h], 0FFFEh
		jmp	short loc_BB0A3

loc_BB090:
		movsx	eax, si
		movsx	edx, di
		imul	eax, edx
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], ax

loc_BB0A3:
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_A]
		mov	es:[bx+0Eh], ax
		push	seg stub342
		push	offset sub_75165
		push	15h
		movsx	eax, word ptr es:[bx+0Eh]
		push	eax
		push	large 0E0000h
		push	0
		call	sub_149D
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], dx
		mov	es:[bx+10h], ax
		mov	eax, es:[bx+10h]
		mov	[bp+var_4], eax
		mov	[bp+var_6], 0
		jmp	short loc_BB101

loc_BB0E8:
		push	2
		push	di
		push	si
		push	[bp+arg_4]
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_BA8A0
		add	sp, 0Ch
		inc	[bp+var_6]
		add	word ptr [bp+var_4], 0Eh

loc_BB101:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Eh]
		cmp	ax, [bp+var_6]
		jg	short loc_BB0E8
		mov	[bp+var_8], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_8]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], ax
		push	[bp+arg_2]
		push	bx
		call	sub_5087B
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_BB048		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB144		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	cx, [bp+arg_6]
		mov	word_79750, 0
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Eh], cx
		jle	short loc_BB1A2
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		mov	bx, cx
		imul	bx, bx, 0Eh
		add	dx, bx
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+4], 0
		jz	short loc_BB1A2
		push	large 0FFFFFFFFh
		les	bx, [bp+arg_0]
		movsx	eax, word ptr es:[bx+16h]
		push	eax
		push	[bp+var_2]
		push	dx
		push	cs
		call	near ptr sub_BAAAE
		add	sp, 4
		push	dx
		push	ax
		push	[bp+arg_4]
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh

loc_BB1A2:
		leave
		retf
sub_BB144		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB1A4		proc far

var_C		= word ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	word_79750, 0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Eh]
		cmp	ax, [bp+arg_6]
		jg	short loc_BB1C1
		jmp	loc_BB240

loc_BB1C1:
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		mov	bx, [bp+arg_6]
		imul	bx, bx, 0Eh
		add	dx, bx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+4], 0
		jz	short loc_BB240
		jmp	short loc_BB214
		push	es
		push	ds
		pushaw
		les	di, [bp+var_C]
		lds	si, word ptr dword_7748F
		mov	bx, word ptr [bp+var_8+2]
		mov	dx, bx
		mov	cx, word ptr [bp+var_8]
		shr	cx, 1

loc_BB1F8:
		push	si

loc_BB1F9:
		mov	al, [si]
		mov	es:[di], al
		add	si, 1
		inc	di
		dec	bx
		jnz	short loc_BB1F9
		pop	si
		add	si, dx
		add	si, dx
		mov	bx, dx
		dec	cx
		jnz	short loc_BB1F8
		popaw
		pop	ds
		pop	es
		jmp	short loc_BB240

loc_BB214:
		les	bx, [bp+arg_0]
		movsx	eax, word ptr es:[bx+16h]
		mov	[bp+var_8], eax
		push	eax
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_BAAAE
		add	sp, 4
		push	dx
		push	ax
		mov	bx, [bp+arg_4]
		push	large [bx+4Dh]
		push	bx
		call	sub_1C532
		add	sp, 0Eh

loc_BB240:
		pop	di
		pop	si
		leave
		retf
sub_BB1A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB244		proc far

var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	di, [bp+arg_8]
		mov	word_79750, 0
		mov	ax, di
		imul	[bp+arg_A]
		movzx	eax, ax
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_C]
		mov	es:[bx+0Eh], ax
		push	seg stub342
		push	offset sub_75165
		push	15h
		movsx	eax, word ptr es:[bx+0Eh]
		push	eax
		push	large 0E0000h
		push	0
		call	sub_149D
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], dx
		mov	es:[bx+10h], ax
		cmp	dword ptr es:[bx+10h], 0
		jnz	short loc_BB2A8
		push	9029h
		call	sub_1DDFE
		pop	cx

loc_BB2A8:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+10h]
		mov	[bp+var_8], eax
		xor	si, si
		jmp	short loc_BB2ED

loc_BB2B8:
		push	2
		push	[bp+arg_A]
		push	di
		push	[bp+arg_6]
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_BA8A0
		add	sp, 0Ch
		push	large [bp+var_4]
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_BAAAE
		add	sp, 4
		push	dx
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		inc	si
		add	word ptr [bp+var_8], 0Eh

loc_BB2ED:
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Eh], si
		jg	short loc_BB2B8
		mov	ax, es:[bx+0Eh]
		mov	[bp+var_A], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_A]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], ax
		push	[bp+arg_2]
		push	bx
		call	sub_5087B
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_BB244		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB331		proc far

var_16		= word ptr -16h
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		mov	word_79750, 0
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_6]
		mov	es:[bx+0Eh], ax
		push	seg stub342
		push	offset sub_75165
		push	15h
		movsx	eax, word ptr es:[bx+0Eh]
		push	eax
		push	large 0E0000h
		push	0
		call	sub_149D
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], dx
		mov	es:[bx+10h], ax
		cmp	dword ptr es:[bx+10h], 0
		jnz	short loc_BB384
		push	902Ah
		call	sub_1DDFE
		pop	cx

loc_BB384:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+10h]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_BB3C4

loc_BB394:
		push	si
		push	[bp+arg_4]
		push	3026h
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	ax, [bp+arg_A]
		add	ax, si
		push	ax
		push	[bp+arg_8]
		lea	ax, [bp+var_16]
		push	ax
		push	large [bp+var_4]
		push	cs
		call	near ptr TextureRecord_LoadFromPakOrFile_BAE1C
		add	sp, 0Ah
		add	word ptr [bp+var_4], 0Eh
		inc	si

loc_BB3C4:
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Eh], si
		jg	short loc_BB394
		mov	ax, es:[bx+0Eh]
		mov	[bp+var_6], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_6]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], ax
		push	[bp+arg_2]
		push	bx
		call	sub_5087B
		add	sp, 4
		pop	si
		leave
		retf
sub_BB331		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB407		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_BB467
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+4], 0
		mov	dword ptr es:[bx], 0
		mov	byte ptr es:[bx+0Ch], 2
		push	seg stub342
		push	offset sub_7518D
		push	1Dh
		push	large 0
		push	0Eh
		push	large es:[bx+10h]
		call	sub_1034
		add	sp, 10h
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr TextCycler_ReleaseResource_BB01A
		add	sp, 6
		test	si, 1
		jz	short loc_BB467
		push	large [bp+arg_0]
		call	sub_3C0
		add	sp, 4

loc_BB467:
		pop	si
		pop	bp
		retf
sub_BB407		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Range les deux nombres (images simples +0, animées +2) et alloue les
; deux tables : simples à pas de 14 octets (+4), animées à pas de 24 (+8) ; erreur 902Bh /
; 902Ch si l'allocation échoue.
; ==============================================================================================
TextureTable_Allocate_BB46A		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx], ax
		mov	ax, [bp+arg_6]
		mov	es:[bx+2], ax
		cmp	word ptr es:[bx], 0
		jz	short loc_BB4BE
		push	seg stub342
		push	offset sub_75165
		push	15h
		movzx	eax, word ptr es:[bx]
		push	eax
		push	large 0E0000h
		push	0
		call	sub_149D
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+6], dx
		mov	es:[bx+4], ax
		cmp	dword ptr es:[bx+4], 0
		jnz	short loc_BB4BE
		push	902Bh
		call	sub_1DDFE
		pop	cx

loc_BB4BE:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_BB504
		push	seg stub342
		push	offset sub_75160
		push	15h
		movzx	eax, word ptr es:[bx+2]
		push	eax
		push	large 180000h
		push	0
		call	sub_149D
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], dx
		mov	es:[bx+8], ax
		cmp	dword ptr es:[bx+8], 0
		jnz	short loc_BB504
		push	902Ch
		call	sub_1DDFE
		pop	cx

loc_BB504:
		pop	bp
		retf
TextureTable_Allocate_BB46A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Image simple n° place : erreur 902Dh si place ≥ nombre d'images simples
; ; sinon TextureRecord_LoadFromPakOrFile_BAE1C sur l'enregistrement table+14×place.
; ==============================================================================================
TextureTable_LoadImage_BB506		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_4]
		les	bx, [bp+arg_0]
		cmp	es:[bx], cx
		jbe	short loc_BB536
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, es:[bx+4]
		mov	dx, cx
		imul	dx, dx, 0Eh
		add	ax, dx
		push	word ptr es:[bx+6]
		push	ax
		push	cs
		call	near ptr TextureRecord_LoadFromPakOrFile_BAE1C
		add	sp, 0Ah
		jmp	short loc_BB53F

loc_BB536:
		push	902Dh
		call	sub_1DDFE
		pop	cx

loc_BB53F:
		pop	bp
		retf
TextureTable_LoadImage_BB506		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05 (en-tête seulement). Image animée : place − nombre d'images simples =
; rang dans la table des animées (pas de 24) ; erreur 902Eh au-delà ; sub_BB331 (pas lue)
; remplit l'enregistrement.
; ==============================================================================================
TextureTable_LoadAnimated_BB541		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_4]
		les	bx, [bp+arg_0]
		sub	cx, es:[bx]
		cmp	es:[bx+2], cx
		jbe	short loc_BB578
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, es:[bx+8]
		mov	dx, cx
		imul	dx, dx, 18h
		add	ax, dx
		push	word ptr es:[bx+0Ah]
		push	ax
		push	cs
		call	near ptr sub_BB331
		add	sp, 0Ch
		jmp	short loc_BB581

loc_BB578:
		push	902Eh
		call	sub_1DDFE
		pop	cx

loc_BB581:
		pop	bp
		retf
TextureTable_LoadAnimated_BB541		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB583		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	seg stub342
		push	offset sub_7518D
		push	1Dh
		push	large 0
		push	0Eh
		les	bx, [bp+arg_0]
		push	large es:[bx+4]
		call	sub_1034
		add	sp, 10h
		push	seg stub342
		push	offset sub_751AB
		push	1Dh
		push	large 0
		push	18h
		les	bx, [bp+arg_0]
		push	large es:[bx+8]
		call	sub_1034
		add	sp, 10h
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	es:[bx+4], eax
		xor	ax, ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		pop	bp
		retf
sub_BB583		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextCycler_ReleaseResource_A7538 (sub_A7538 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine TextCycler_Helper2_A74E3 et sub_346
; (désallocation runtime).
; ==============================================================================================
TextCycler_ReleaseResource_BB5DB		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_BB606
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_BB583
		add	sp, 4
		test	si, 1
		jz	short loc_BB606
		push	large [bp+arg_0]
		call	sub_3C0
		add	sp, 4

loc_BB606:
		pop	si
		pop	bp
		retf
TextCycler_ReleaseResource_BB5DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB609		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_BB628
		push	large 0Eh
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_BB641

loc_BB628:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+4], 0
		mov	dword ptr es:[bx], 0
		mov	byte ptr es:[bx+0Ch], 2

loc_BB641:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_BB609		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB649		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_BB668
		push	large 18h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_BB694

loc_BB668:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+4], 0
		mov	dword ptr es:[bx], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	dword ptr es:[bx+10h], 0
		xor	ax, ax
		mov	es:[bx+14h], ax
		mov	es:[bx+0Eh], ax

loc_BB694:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_BB649		endp
ovr342		ends
