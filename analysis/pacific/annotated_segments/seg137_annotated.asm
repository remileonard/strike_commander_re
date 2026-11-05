seg137		segment	para public 'CODE' use16
		assume cs:seg137
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C2h, 5, 0B0h, 0Fh, 0EEh

loc_5D3C5:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; VoicePlayer_SetDriver_7A3D (sub_7A3D de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-17. Lecteur de voix numérisée : +2 = pilote
; numérique (word_4684B dans mid1).
; ==============================================================================================
VoicePlayer_SetDriver_5D3C8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+2], ax
		pop	si
		pop	bp
		retf
VoicePlayer_SetDriver_5D3C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D3D8		proc far

var_6E		= word ptr -6Eh
var_11		= dword ptr -11h
var_D		= dword ptr -0Dh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_5D3EB
		jmp	loc_5D50D

loc_5D3EB:
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_6E], 508h
		mov	[bp+var_D], 100h
		mov	[bp+var_11], 0
		mov	[bp+var_6E], 0E61h
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_6E]
		push	ax
		mov	bx, [bp+var_6E]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_5D428
		jmp	loc_5D4FF

loc_5D428:
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+0Ch], eax
		cmp	byte ptr [si+15h], 0
		jz	short loc_5D460
		cmp	dword ptr [si+10h], 0
		jz	short loc_5D460
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5D460

loc_5D460:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	eax, [si+0Ch]
		mov	[bp+var_4], eax
		push	1
		push	8
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_6B53F
		add	sp, 6
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[si+0Ah], dx
		mov	[si+8], ax
		mov	ax, [bp+arg_4]
		mov	[si+4], ax
		mov	ax, [bp+arg_6]
		mov	[si+6], ax

loc_5D4FF:
		push	0
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_5D50D:
		pop	si
		leave
		retf
sub_5D3D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D510		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5D576
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		or	al, al
		jz	short loc_5D53C
		cmp	word ptr [si+2], 0
		jz	short loc_5D53C
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB8F
		pop	cx
		jmp	short loc_5D53C

loc_5D53C:
		cmp	byte ptr [si+15h], 0
		jz	short loc_5D562
		cmp	dword ptr [si+10h], 0
		jz	short loc_5D562
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5D562

loc_5D562:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0

loc_5D576:
		pop	si
		pop	bp
		retf
sub_5D510		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D579		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5D5A2
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr VoicePlayer_SetDriver_5D3C8
		add	sp, 4
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_5D3D8
		add	sp, 8

loc_5D5A2:
		pop	si
		pop	bp
		retf
sub_5D579		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D5A5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5D5EB
		cmp	dword ptr [si+10h], 0
		jz	short loc_5D5BE
		mov	ax, 1
		jmp	short loc_5D5C0

loc_5D5BE:
		xor	ax, ax

loc_5D5C0:
		or	ax, ax
		jz	short loc_5D5EB
		push	ds
		mov	ax, si
		add	ax, 4
		push	ax
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB65
		add	sp, 8
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB89
		add	sp, 4

loc_5D5EB:
		pop	si
		pop	bp
		retf
sub_5D5A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D5EE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5D619
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB71
		add	sp, 4
		cmp	ax, 3
		jnz	short loc_5D615
		mov	ax, 1
		jmp	short loc_5D617

loc_5D615:
		xor	ax, ax

loc_5D617:
		jmp	short loc_5D61B

loc_5D619:
		mov	al, 1

loc_5D61B:
		pop	si
		pop	bp
		retf
sub_5D5EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D61E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5D649
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB71
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_5D645
		mov	ax, 1
		jmp	short loc_5D647

loc_5D645:
		xor	ax, ax

loc_5D647:
		jmp	short loc_5D64B

loc_5D649:
		mov	al, 0

loc_5D64B:
		pop	si
		pop	bp
		retf
sub_5D61E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D64E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5D679
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB71
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_5D675
		mov	ax, 1
		jmp	short loc_5D677

loc_5D675:
		xor	ax, ax

loc_5D677:
		jmp	short loc_5D67B

loc_5D679:
		mov	al, 1

loc_5D67B:
		pop	si
		pop	bp
		retf
sub_5D64E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D67E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5D6A8
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB71
		add	sp, 4
		or	ax, ax
		jnz	short loc_5D6A4
		mov	ax, 1
		jmp	short loc_5D6A6

loc_5D6A4:
		xor	ax, ax

loc_5D6A6:
		jmp	short loc_5D6AA

loc_5D6A8:
		mov	al, 1

loc_5D6AA:
		pop	si
		pop	bp
		retf
sub_5D67E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D6AD		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [si+10h]
		cmp	eax, [di]
		jz	short loc_5D73F
		cmp	byte ptr [si+15h], 0
		jz	short loc_5D6EA
		cmp	dword ptr [si+10h], 0
		jz	short loc_5D6EA
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5D6EA

loc_5D6EA:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	dx, di
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	al, [bx+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+10h], eax
		mov	al, [bp+var_5]
		mov	[si+14h], al
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	eax, [bx+6]
		mov	[si+16h], eax
		cmp	byte ptr [di+5], 0
		jz	short loc_5D73F
		mov	byte ptr [di+5], 0
		mov	byte ptr [si+15h], 1

loc_5D73F:
		pop	di
		pop	si
		leave
		retf
sub_5D6AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D743		proc far

var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [bp+arg_4]
		mov	[si+1Ah], ax
		cmp	word ptr [si+2], 0
		jnz	short loc_5D760
		jmp	loc_5DC29

loc_5D760:
		mov	eax, [si+10h]
		cmp	eax, [di]
		jnz	short loc_5D76C
		jmp	loc_5D7ED

loc_5D76C:
		cmp	byte ptr [si+15h], 0
		jz	short loc_5D792
		cmp	dword ptr [si+10h], 0
		jz	short loc_5D792
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5D792

loc_5D792:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	dx, di
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_44], eax
		mov	al, [bx+4]
		mov	[bp+var_45], al
		mov	eax, [bp+var_44]
		mov	[si+10h], eax
		mov	al, [bp+var_45]
		mov	[si+14h], al
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	eax, [bx+6]
		mov	[si+16h], eax
		cmp	byte ptr [di+5], 0
		jz	short loc_5D7ED
		mov	[bp+var_48], di
		mov	bx, [bp+var_48]
		mov	byte ptr [bx+5], 0
		mov	byte ptr [si+15h], 1

loc_5D7ED:
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		mov	dx, 100h
		sub	dx, ax
		movsx	ebx, dx
		mov	eax, 0F4240h
		cdq
		idiv	ebx
		mov	[bp+var_14], eax
		movsx	ebx, word ptr [si+1Ah]
		cdq
		idiv	ebx
		mov	[bp+var_10], eax
		xor	di, di
		mov	[bp+var_1C], 0
		jmp	short loc_5D854

loc_5D842:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0FFFFFFFEh
		inc	[bp+var_1C]

loc_5D854:
		cmp	[bp+var_1C], 200h
		jl	short loc_5D842
		les	bx, [bp+var_4]
		mov	eax, es:[bx+1Ah]
		sar	eax, 8
		add	eax, 0FFFFFFFEh
		mov	[bp+var_C], eax
		cdq
		idiv	[bp+var_10]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_10]
		imul	eax, [bp+var_2C]
		mov	edx, [bp+var_C]
		sub	edx, eax
		mov	[bp+var_30], edx
		mov	[bp+var_34], 0
		jmp	loc_5DA36

loc_5D89B:
		mov	[bp+var_24], 0F423Fh
		mov	[bp+var_28], 0
		mov	[bp+var_20], 0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_34]
		imul	eax, [bp+var_14]
		movsx	ebx, word ptr [si+1Ah]
		cdq
		idiv	ebx
		add	eax, 20h
		mov	[bp+var_38], eax
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_2C]
		jl	short loc_5D8E3
		jmp	loc_5D98B

loc_5D8E3:
		mov	eax, [bp+var_38]
		mov	[bp+var_1C], eax
		jmp	short loc_5D93A

loc_5D8ED:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_28]
		jle	short loc_5D908
		mov	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		mov	[bp+var_28], eax

loc_5D908:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_24]
		jge	short loc_5D923
		mov	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		mov	[bp+var_24], eax

loc_5D923:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		add	[bp+var_8], eax
		inc	[bp+var_20]
		inc	[bp+var_1C]

loc_5D93A:
		mov	eax, [bp+var_38]
		add	eax, [bp+var_10]
		cmp	eax, [bp+var_1C]
		jge	short loc_5D8ED
		cmp	[bp+var_20], 0
		jz	short loc_5D972
		mov	eax, [bp+var_8]
		imul	eax, eax, 3E8h
		xor	edx, edx
		div	[bp+var_20]
		sub	eax, 1F400h
		mov	bx, di
		shl	bx, 2
		mov	[bx+si+1Ch], eax
		jmp	short loc_5D97F

loc_5D972:
		mov	bx, di
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0

loc_5D97F:
		cmp	di, 200h
		jl	short loc_5D988
		jmp	loc_5DA32

loc_5D988:
		jmp	loc_5DA31

loc_5D98B:
		cmp	[bp+var_30], 0
		jg	short loc_5D995
		jmp	loc_5DA32

loc_5D995:
		mov	eax, [bp+var_38]
		mov	[bp+var_1C], eax
		jmp	short loc_5D9EC

loc_5D99F:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_28]
		jle	short loc_5D9BA
		mov	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		mov	[bp+var_28], eax

loc_5D9BA:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_24]
		jge	short loc_5D9D5
		mov	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		mov	[bp+var_24], eax

loc_5D9D5:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		add	[bp+var_8], eax
		inc	[bp+var_20]
		inc	[bp+var_1C]

loc_5D9EC:
		mov	eax, [bp+var_C]
		add	eax, 20h
		cmp	eax, [bp+var_1C]
		jg	short loc_5D99F
		cmp	[bp+var_20], 0
		jz	short loc_5DA24
		mov	eax, [bp+var_8]
		imul	eax, eax, 3E8h
		xor	edx, edx
		div	[bp+var_20]
		sub	eax, 1F400h
		mov	bx, di
		shl	bx, 2
		mov	[bx+si+1Ch], eax
		jmp	short loc_5DA31

loc_5DA24:
		mov	bx, di
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0

loc_5DA31:
		inc	di

loc_5DA32:
		inc	[bp+var_34]

loc_5DA36:
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_2C]
		jg	short loc_5DA43
		jmp	loc_5D89B

loc_5DA43:
		mov	[bp+var_24], 270Fh
		mov	[bp+var_28], 0FFFFD8F1h
		mov	[bp+var_1C], 0
		jmp	short loc_5DAA1

loc_5DA5D:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_28]
		jle	short loc_5DA7D
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_1C]
		mov	[bp+var_3C], ax

loc_5DA7D:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_24]
		jge	short loc_5DA9D
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	[bp+var_24], eax
		mov	ax, word ptr [bp+var_1C]
		mov	[bp+var_3A], ax

loc_5DA9D:
		inc	[bp+var_1C]

loc_5DAA1:
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jg	short loc_5DA5D
		mov	[bp+var_24], 270Fh
		mov	[bp+var_28], 0FFFFD8F1h
		mov	[bp+var_1C], 0
		jmp	short loc_5DB13

loc_5DAC5:
		movsx	eax, [bp+var_3A]
		cmp	eax, [bp+var_1C]
		jz	short loc_5DB0F
		movsx	eax, [bp+var_3C]
		cmp	eax, [bp+var_1C]
		jz	short loc_5DB0F
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_28]
		jle	short loc_5DAF5
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	[bp+var_28], eax

loc_5DAF5:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_24]
		jge	short loc_5DB0F
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	[bp+var_24], eax

loc_5DB0F:
		inc	[bp+var_1C]

loc_5DB13:
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jg	short loc_5DAC5
		push	large [bp+var_28]
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	large [bp+var_24]
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		pop	edx
		cmp	edx, eax
		jle	short loc_5DB4C
		push	large [bp+var_28]
		jmp	short loc_5DB50

loc_5DB4C:
		push	large [bp+var_24]

loc_5DB50:
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_40], eax
		mov	[bp+var_1C], 0
		jmp	loc_5DC1C

loc_5DB6B:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		push	word ptr [bx+si+1Ch]
		call	CRT_Abs16_377
		pop	cx
		movsx	eax, ax
		push	eax
		mov	eax, [bp+var_40]
		pop	edx
		sub	eax, edx
		imul	eax, eax, 64h
		cdq
		idiv	[bp+var_40]
		mov	[bp+var_18], eax
		cmp	[bp+var_18], 5Fh
		jl	short loc_5DBAE
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0FFFFFFFFh
		jmp	short loc_5DC18

loc_5DBAE:
		cmp	[bp+var_18], 4Eh
		jl	short loc_5DBC5
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 8
		jmp	short loc_5DC18

loc_5DBC5:
		cmp	[bp+var_18], 41h
		jl	short loc_5DBDC
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 3
		jmp	short loc_5DC18

loc_5DBDC:
		cmp	[bp+var_18], 2Ah
		jl	short loc_5DBF3
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 2
		jmp	short loc_5DC18

loc_5DBF3:
		cmp	[bp+var_18], 19h
		jl	short loc_5DC0A
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0Ah
		jmp	short loc_5DC18

loc_5DC0A:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0Bh

loc_5DC18:
		inc	[bp+var_1C]

loc_5DC1C:
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jle	short loc_5DC29
		jmp	loc_5DB6B

loc_5DC29:
		pop	di
		pop	si
		leave
		retf
sub_5D743		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5DC2D		proc far

var_6E		= word ptr -6Eh
var_11		= dword ptr -11h
var_D		= dword ptr -0Dh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_5DC40
		jmp	loc_5DD33

loc_5DC40:
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_6E], 508h
		mov	[bp+var_D], 100h
		mov	[bp+var_11], 0
		mov	[bp+var_6E], 0E61h
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_6E]
		push	ax
		mov	bx, [bp+var_6E]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_5DC7D
		jmp	loc_5DD25

loc_5DC7D:
		cmp	byte ptr [si+15h], 0
		jz	short loc_5DCA3
		cmp	dword ptr [si+10h], 0
		jz	short loc_5DCA3
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5DCA3

loc_5DCA3:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		push	1
		push	8
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_6B53F
		add	sp, 6

loc_5DD25:
		push	0
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_5DD33:
		pop	si
		leave
		retf
sub_5DC2D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5DD36		proc far

var_80		= word ptr -80h
var_1F		= dword ptr -1Fh
var_13		= word ptr -13h
var_F		= dword ptr -0Fh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		cmp	word ptr [si+2], 0
		jnz	short loc_5DD4E
		jmp	loc_5DE35

loc_5DD4E:
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_80]
		push	ax
		mov	bx, [bp+var_80]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	sub_7844
		add	sp, 4
		cmp	byte ptr [si+15h], 0
		jz	short loc_5DD9D
		cmp	dword ptr [si+10h], 0
		jz	short loc_5DD9D
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5DD9D

loc_5DD9D:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	ax, [bp+var_13]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_5DDC2
		mov	eax, [bp+var_1F]
		jmp	short loc_5DDC6

loc_5DDC2:
		mov	eax, [bp+var_F]

loc_5DDC6:
		mov	[bp+var_4], eax
		push	1
		push	8
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	sub_75C8
		add	sp, 8
		push	2
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_5DE35:
		pop	di
		pop	si
		leave
		retf
sub_5DD36		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5DE39		proc far

var_22		= word ptr -22h
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_79E30, 0
		jnz	short loc_5DE6B
		inc	byte_79E30
		mov	dword_7D0AE, 0
		mov	byte_7D0B2, 2
		mov	byte_7D0B3, 0
		mov	dword_7D0B4, 0

loc_5DE6B:
		cmp	word ptr [si+2], 0
		jnz	short loc_5DE74
		jmp	loc_5E0EC

loc_5DE74:
		cmp	dword ptr [si+10h], 0
		jz	short loc_5DE80
		mov	ax, 1
		jmp	short loc_5DE82

loc_5DE80:
		xor	ax, ax

loc_5DE82:
		or	ax, ax
		jnz	short loc_5DE89
		jmp	loc_5E0EC

loc_5DE89:
		cmp	byte_7D0B3, 0
		jz	short loc_5DEAE
		cmp	dword_7D0AE, 0
		jz	short loc_5DEAE
		push	0
		mov	al, byte_7D0B2
		push	ax
		push	697Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5DEAE

loc_5DEAE:
		mov	dword_7D0AE, 0
		mov	byte_7D0B3, 0
		mov	dword_7D0B4, 0
		mov	eax, [si+16h]
		mov	[bp+var_4], eax
		push	0
		push	8
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	dword_7D0AE, eax
		mov	byte_7D0B2, 2
		mov	byte_7D0B3, 1
		mov	dword_7D0B4, 0
		mov	eax, [bp+var_4]
		mov	dword_7D0B4, eax
		cmp	dword_7D0AE, 0
		jnz	short loc_5DF14
		jmp	loc_5E05E

loc_5DF14:
		cmp	dword ptr [si+10h], 0
		jnz	short loc_5DF1E
		jmp	loc_5E022

loc_5DF1E:
		cmp	dword_7D0AE, 0
		jz	short loc_5DF34
		mov	eax, [si+16h]
		cmp	eax, dword_7D0B4
		jg	short loc_5DF34
		jmp	loc_5DFBE

loc_5DF34:
		cmp	byte_7D0B3, 0
		jz	short loc_5DF59
		cmp	dword_7D0AE, 0
		jz	short loc_5DF59
		push	0
		mov	al, byte_7D0B2
		push	ax
		push	697Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5DF59

loc_5DF59:
		mov	dword_7D0AE, 0
		mov	byte_7D0B3, 0
		mov	dword_7D0B4, 0
		mov	eax, [si+16h]
		mov	[bp+var_C], eax
		mov	al, [si+14h]
		mov	[bp+var_D], al
		push	1
		push	0
		push	ax
		push	large [bp+var_C]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	dword_7D0AE, eax
		mov	al, [bp+var_D]
		mov	byte_7D0B2, al
		mov	byte_7D0B3, 1
		mov	dword_7D0B4, 0
		mov	eax, [bp+var_C]
		mov	dword_7D0B4, eax
		jmp	short loc_5DFBE

loc_5DFBE:
		cmp	byte_7D0B2, 3
		jnz	short loc_5DFE9
		cmp	byte ptr [si+14h], 3
		jnz	short loc_5DFE9
		push	0
		push	3
		push	large [si+16h]
		push	large [si+10h]
		push	large dword_7D0AE

loc_5DFDC:
		push	6B04h
		call	Memory_TypedAllocDispatch_6530C
		add	sp, 12h
		jmp	short loc_5E022

loc_5DFE9:
		push	0
		push	2
		push	large [si+16h]
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		mov	al, byte_7D0B2
		push	ax
		push	large dword_7D0AE
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		jmp	short loc_5DFDC

loc_5E022:
		cmp	byte ptr [si+15h], 0
		jz	short loc_5E048
		cmp	dword ptr [si+10h], 0
		jz	short loc_5E048
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5E048

loc_5E048:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		jmp	short loc_5E094

loc_5E05E:
		mov	di, si
		add	di, 10h
		mov	eax, [di]
		mov	[bp+var_16], eax
		mov	al, [di+4]
		mov	[bp+var_17], al
		mov	eax, [bp+var_16]
		mov	dword_7D0AE, eax
		mov	al, [bp+var_17]
		mov	byte_7D0B2, al
		mov	byte_7D0B3, 0
		mov	dword_7D0B4, 0
		mov	eax, [di+6]
		mov	dword_7D0B4, eax

loc_5E094:
		push	697Eh
		lea	ax, [bp+var_22]
		push	ax
		call	GlyphObject_ConstructWithBuffer_1CE31
		add	sp, 4
		push	[bp+arg_2]
		lea	ax, [bp+var_22]
		push	ax
		call	sub_1CE74
		pop	cx
		push	dx
		push	ax
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB77
		add	sp, 8
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB89
		add	sp, 4
		mov	eax, dword_7B29D
		mov	[si+81Dh], eax
		mov	byte ptr [si+81Ch], 1
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	sub_1CD03
		add	sp, 4

loc_5E0EC:
		pop	di
		pop	si
		leave
		retf
sub_5DE39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E0F0		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	dx, 0FFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_5E144
		mov	ax, si
		add	ax, 81Ch
		push	ax
		call	Stopwatch_Elapsed_6F8FA
		push	dx
		push	ax
		pop	eax
		pop	cx
		movsx	edx, word ptr [si+1Ah]
		imul	eax, edx
		mov	ebx, 3Ch
		xor	edx, edx
		div	ebx
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 200h
		jge	short loc_5E141
		mov	bx, word ptr [bp+var_4]
		shl	bx, 2
		mov	dx, [bx+si+1Ch]
		jmp	short loc_5E144

loc_5E141:
		mov	dx, 0FFFEh

loc_5E144:
		mov	ax, dx
		pop	si
		leave
		retf
sub_5E0F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E149		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5E170
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB83
		pop	cx
		cmp	ax, 3
		jnz	short loc_5E16C
		mov	ax, 1
		jmp	short loc_5E16E

loc_5E16C:
		xor	ax, ax

loc_5E16E:
		jmp	short loc_5E172

loc_5E170:
		mov	al, 1

loc_5E172:
		pop	si
		pop	bp
		retf
sub_5E149		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E175		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5E19C
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB83
		pop	cx
		cmp	ax, 2
		jnz	short loc_5E198
		mov	ax, 1
		jmp	short loc_5E19A

loc_5E198:
		xor	ax, ax

loc_5E19A:
		jmp	short loc_5E19E

loc_5E19C:
		mov	al, 0

loc_5E19E:
		pop	si
		pop	bp
		retf
sub_5E175		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E1A1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5E1C8
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB83
		pop	cx
		cmp	ax, 1
		jnz	short loc_5E1C4
		mov	ax, 1
		jmp	short loc_5E1C6

loc_5E1C4:
		xor	ax, ax

loc_5E1C6:
		jmp	short loc_5E1CA

loc_5E1C8:
		mov	al, 1

loc_5E1CA:
		pop	si
		pop	bp
		retf
sub_5E1A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E1CD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_5E1F3
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_1DB83
		pop	cx
		or	ax, ax
		jnz	short loc_5E1EF
		mov	ax, 1
		jmp	short loc_5E1F1

loc_5E1EF:
		xor	ax, ax

loc_5E1F1:
		jmp	short loc_5E1F5

loc_5E1F3:
		mov	al, 1

loc_5E1F5:
		pop	si
		pop	bp
		retf
sub_5E1CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E1F8		proc far
		push	bp
		mov	bp, sp
		cmp	byte_79E30, 0
		jz	short loc_5E23E
		cmp	byte_7D0B3, 0
		jz	short loc_5E227
		cmp	dword_7D0AE, 0
		jz	short loc_5E227
		push	0
		mov	al, byte_7D0B2
		push	ax
		push	697Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5E227

loc_5E227:
		mov	dword_7D0AE, 0
		mov	byte_7D0B3, 0
		mov	dword_7D0B4, 0

loc_5E23E:
		pop	bp
		retf
sub_5E1F8		endp
seg137		ends
