ovr393		segment	para public 'OVERLAY' use16
		assume cs:ovr393
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DFB70		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_DFB8D
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_DFBAF

loc_DFB8D:
		push	di
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		push	di
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+2], ax
		push	di
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+4], ax
		mov	word ptr [si+8], 0

loc_DFBAF:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_DFB70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DFBB5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_DFBEB
		push	word ptr [si]
		call	sub_3B2
		pop	cx
		push	word ptr [si+2]
		call	sub_3B2
		pop	cx
		push	word ptr [si+4]
		call	sub_3B2
		pop	cx
		test	di, 1
		jz	short loc_DFBEB
		push	si
		call	sub_3B2
		pop	cx

loc_DFBEB:
		pop	di
		pop	si
		pop	bp
		retf
sub_DFBB5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DFBEF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	dl, 0
		cmp	word_7A9F8, 0
		jz	short loc_DFC14
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	ax, [bx+6]
		cmp	ax, [bp+arg_6]
		jz	short loc_DFC14
		mov	dl, 1

loc_DFC14:
		cmp	word_7A9F8, 0
		jnz	short loc_DFC1D
		mov	dl, 1

loc_DFC1D:
		or	dl, dl
		jnz	short loc_DFC24
		jmp	loc_DFD45

loc_DFC24:
		inc	word_7A9F8
		cmp	word_7A9F8, 5
		jbe	short loc_DFC67
		mov	si, 1
		jmp	short loc_DFC50

loc_DFC34:
		push	3
		mov	bx, si
		shl	bx, 1
		push	word ptr [bx+6A52h]
		push	cs
		call	near ptr sub_DFBB5
		add	sp, 4
		mov	bx, si
		shl	bx, 1
		mov	word ptr [bx+6A52h], 0
		inc	si

loc_DFC50:
		cmp	si, 4
		jbe	short loc_DFC34
		mov	ax, word_7D18C
		mov	word_7D184, ax
		mov	word_7D18C, 0
		mov	word_7A9F8, 2

loc_DFC67:
		push	di
		push	0
		push	cs
		call	near ptr sub_DFB70
		add	sp, 4
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	[bx+6A52h], ax
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	ax, [bp+arg_6]
		mov	[bx+6], ax
		xor	si, si
		jmp	short loc_DFCFF

loc_DFC8F:
		mov	bx, [bp+arg_0]
		add	bx, si
		mov	al, [bx]
		mov	ah, 0
		mov	bx, [bp+arg_2]
		add	bx, si
		mov	dl, [bx]
		mov	dh, 0
		sub	ax, dx
		mov	dx, ax
		or	dx, dx
		jge	short loc_DFCBF
		neg	dx
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	bx, [bx+4]
		add	bx, si
		mov	byte ptr [bx], 1
		jmp	short loc_DFCD1

loc_DFCBF:
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	bx, [bx+4]
		add	bx, si
		mov	byte ptr [bx], 0FFh

loc_DFCD1:
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	bx, [bx+2]
		add	bx, si
		mov	[bx], dl
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		cmp	[bx+8], dx
		jnb	short loc_DFCFE
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	[bx+8], dx

loc_DFCFE:
		inc	si

loc_DFCFF:
		cmp	si, di
		jb	short loc_DFC8F
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	dx, [bx+8]
		shr	dx, 1
		xor	si, si
		jmp	short loc_DFD27

loc_DFD16:
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	bx, [bx]
		add	bx, si
		mov	[bx], dl
		inc	si

loc_DFD27:
		cmp	si, di
		jb	short loc_DFD16
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	ax, [bx+8]
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	[bx+0Ah], ax

loc_DFD45:
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	ax, [bx+0Ah]
		dec	word ptr [bx+0Ah]
		or	ax, ax
		jnz	short loc_DFD81
		push	3
		mov	bx, word_7A9F8
		shl	bx, 1
		push	word ptr [bx+6A52h]
		push	cs
		call	near ptr sub_DFBB5
		add	sp, 4
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	word ptr [bx+6A52h], 0
		dec	word_7A9F8
		mov	al, 0
		jmp	loc_DFE05

loc_DFD81:
		xor	si, si
		jmp	short loc_DFDFF

loc_DFD85:
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	bx, [bx+2]
		add	bx, si
		mov	al, [bx]
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	bx, [bx]
		add	bx, si
		add	[bx], al
		mov	al, [bx]
		mov	ah, 0
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		cmp	ax, [bx+8]
		jbe	short loc_DFDFE
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	bx, [bx]
		add	bx, si
		mov	al, [bx]
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		sub	al, [bx+8]
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	bx, [bx]
		add	bx, si
		mov	[bx], al
		mov	bx, word_7A9F8
		shl	bx, 1
		mov	bx, [bx+6A52h]
		mov	bx, [bx+4]
		add	bx, si
		mov	al, [bx]
		mov	bx, [bp+arg_0]
		add	bx, si
		add	[bx], al

loc_DFDFE:
		inc	si

loc_DFDFF:
		cmp	si, di
		jb	short loc_DFD85
		mov	al, 1

loc_DFE05:
		pop	di
		pop	si
		pop	bp
		retf
sub_DFBEF		endp
ovr393		ends
