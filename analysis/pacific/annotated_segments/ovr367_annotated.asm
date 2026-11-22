ovr367		segment	para public 'OVERLAY' use16
		assume cs:ovr367
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CD720		proc far

var_68		= word ptr -68h
var_B		= dword ptr -0Bh
var_7		= dword ptr -7
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [di], 0
		jnz	short loc_CD736
		jmp	loc_CD8A2

loc_CD736:
		mov	[bp+var_2], di
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_68], 508h
		mov	[bp+var_7], 100h
		mov	[bp+var_B], 0
		mov	[bp+var_68], 0E61h
		push	0
		push	[bp+var_2]
		lea	ax, [bp+var_68]
		push	ax
		mov	bx, [bp+var_68]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 7
		push	ds
		push	word_76D3E
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 170h
		push	ds
		mov	ax, si
		add	ax, 4EEh
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		push	large 150015h
		call	GameVar_Set_564BB
		add	sp, 4
		push	large 0FFFFFFFFh
		push	large 200h
		push	large word_7D00A
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 400h
		push	large word_7D00E
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		push	offset unk_776C4
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		push	offset unk_776D8
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		push	offset unk_776EC
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	word ptr [si+69Bh]
		lea	ax, [bp+var_68]
		push	ax
		call	sub_6B479
		add	sp, 8
		push	large 0FFFFFFFFh
		push	large 3Dh
		push	ds
		mov	ax, si
		add	ax, 65Eh
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 2
		push	ds
		push	word_7D190
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		cmp	word_7D190, 0
		jz	short loc_CD88A
		push	large 0FFFFFFFFh
		push	large 299h
		push	ds
		push	word_7D190
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh

loc_CD88A:
		lea	ax, [bp+var_68]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_CD8A2:
		pop	di
		pop	si
		leave
		retf
sub_CD720		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CD8A6		proc far

var_6A		= word ptr -6Ah
var_D		= dword ptr -0Dh
var_9		= dword ptr -9
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [di], 0
		jnz	short loc_CD8BC
		jmp	loc_CDA62

loc_CD8BC:
		mov	[bp+var_2], di
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_6A], 508h
		mov	[bp+var_9], 100h
		mov	[bp+var_D], 0
		mov	[bp+var_6A], 0E61h
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_6A]
		push	ax
		mov	bx, [bp+var_6A]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_757F9
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CD90E
		push	0F00Dh
		call	sub_1DDFE
		pop	cx

loc_CD90E:
		push	large 0FFFFFFFFh
		push	large 170h
		push	ds
		mov	ax, si
		add	ax, 4EEh
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 200h
		push	large word_7D00A
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 400h
		push	large word_7D00E
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	byte_79C9E, 1
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		push	offset unk_776C4
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		push	offset unk_776D8
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 14h
		push	ds
		push	offset unk_776EC
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_6A]
		push	ax
		call	Handle_ReadWordField_6B4D0
		add	sp, 6
		mov	[si+69Bh], ax
		push	large 0FFFFFFFFh
		push	large 3Dh
		push	ds
		mov	ax, si
		add	ax, 65Eh
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		cmp	byte ptr [si+566h], 0
		jnz	short loc_CD9DD
		mov	byte ptr [si+566h], 1

loc_CD9DD:
		cmp	word_7D190, 0
		jz	short loc_CD9F4
		push	word_7D190
		call	sub_3B2
		pop	cx
		mov	word_7D190, 0

loc_CD9F4:
		cmp	word_7D18E, 0
		jz	short loc_CDA0B
		push	word_7D18E
		call	sub_3B2
		pop	cx
		mov	word_7D18E, 0

loc_CDA0B:
		push	large 0FFFFFFFFh
		push	large 2
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		cmp	[bp+var_4], 0
		jz	short loc_CDA4A
		push	0
		call	sub_7594F
		pop	cx
		mov	word_7D190, ax
		push	large 0FFFFFFFFh
		push	large 299h
		push	ds
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh

loc_CDA4A:
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_CDA62:
		pop	di
		pop	si
		leave
		retf
sub_CD8A6		endp
ovr367		ends
