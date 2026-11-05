seg182		segment	para public 'CODE' use16
		assume cs:seg182
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 5Dh, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69BD4		proc far

saved_0		= word ptr  0
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		cmp	[bp+arg_6], 0
		jz	short loc_69BE5
		cmp	[bp+arg_8], 0
		jnz	short loc_69C12

loc_69BE5:
		push	[bp+arg_A]
		mov	ax, [bp+arg_4]
		add	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, [bp+arg_6]
		push	ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+arg_6]
		push	ax
		push	[bp+arg_0]
		call	sub_69F22
		add	sp, 0Ch
		jmp	loc_69F1D

loc_69C12:
		mov	si, [bp+arg_0]
		mov	es, [si]
		mov	ax, [si+8]
		mov	word_7B0A0, ax
		mov	ax, [si+4]
		mov	word_7B09C, ax
		mov	ax, [si+6]
		shl	ax, 1
		mov	word_7B09A, ax
		mov	ax, [si+0Ah]
		shl	ax, 1
		mov	word_7B09E, ax
		mov	ax, [bp+arg_A]
		mov	ah, al
		mov	word_7B094, ax
		mov	ax, [bp+arg_2]
		mov	word_7B0A2, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		mov	word_7B0A4, ax
		mov	word_7B096, 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	word_7B098, ax
		mov	ax, [bp+arg_6]
		mul	ax
		mov	word_7B0A6, ax
		mov	word_7B0A8, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_7B0AA, ax
		mov	word_7B0AC, dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	word_7B0AE, ax
		mov	word_7B0B0, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_7B0B2, ax
		mov	word_7B0B4, dx
		mov	word_7B0B6, 0
		mov	word_7B0B8, 0
		mov	ax, word_7B0AA
		mov	dx, word_7B0AC
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		mov	word_7B0BA, ax
		mov	word_7B0BC, dx
		mov	ax, word_7B0A6
		mov	dx, word_7B0A8
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, word_7B0AE
		add	dx, word_7B0B0
		mov	word_7B0BE, ax
		mov	word_7B0C0, dx
		mov	ax, word_7B0A6
		mov	dx, word_7B0A8
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	cx, ax
		pop	dx
		mul	dx
		add	dx, cx
		sub	word_7B0BE, ax
		sbb	word_7B0C0, dx
		mov	bx, [bp+arg_8]
		mov	bp, [si+2]

loc_69CEE:
		mov	ax, word_7B0B6
		mov	dx, word_7B0B8
		sub	ax, word_7B0BA
		sbb	dx, word_7B0BC
		js	short loc_69D02
		jmp	loc_69DF2

loc_69D02:
		mov	dx, word_7B094
		mov	di, word_7B0A2
		add	di, word_7B096
		cmp	di, word_7B0A0
		jg	short loc_69D50
		cmp	di, word_7B09C
		jl	short loc_69D50
		mov	ax, di
		mov	si, word_7B0A4
		add	si, word_7B098
		cmp	si, word_7B09A
		jl	short loc_69D37
		cmp	si, word_7B09E
		jg	short loc_69D37
		add	di, [bp+si+saved_0]
		mov	es:[di], dl
		mov	di, ax

loc_69D37:
		mov	si, word_7B0A4
		sub	si, word_7B098
		cmp	si, word_7B09A
		jl	short loc_69D50
		cmp	si, word_7B09E
		jg	short loc_69D50
		add	di, [bp+si+saved_0]
		mov	es:[di], dl

loc_69D50:
		mov	di, word_7B0A2
		sub	di, word_7B096
		cmp	di, word_7B0A0
		jg	short loc_69D9A
		cmp	di, word_7B09C
		jl	short loc_69D9A
		mov	ax, di
		mov	si, word_7B0A4
		add	si, word_7B098
		cmp	si, word_7B09A
		jl	short loc_69D81
		cmp	si, word_7B09E
		jg	short loc_69D81
		add	di, [bp+si+saved_0]
		mov	es:[di], dl
		mov	di, ax

loc_69D81:
		mov	si, word_7B0A4
		sub	si, word_7B098
		cmp	si, word_7B09A
		jl	short loc_69D9A
		cmp	si, word_7B09E
		jg	short loc_69D9A
		add	di, [bp+si+saved_0]
		mov	es:[di], dl

loc_69D9A:
		cmp	word_7B0C0, 0
		js	short loc_69DC5
		sub	word_7B098, 2
		dec	bx
		mov	ax, word_7B0BA
		mov	dx, word_7B0BC
		sub	ax, word_7B0AA
		sbb	dx, word_7B0AC
		mov	word_7B0BA, ax
		mov	word_7B0BC, dx
		sub	word_7B0BE, ax
		sbb	word_7B0C0, dx

loc_69DC5:
		inc	word_7B096
		mov	ax, word_7B0B6
		mov	dx, word_7B0B8
		add	ax, word_7B0B2
		adc	dx, word_7B0B4
		mov	word_7B0B6, ax
		mov	word_7B0B8, dx
		add	ax, word_7B0AE
		adc	dx, word_7B0B0
		add	word_7B0BE, ax
		adc	word_7B0C0, dx
		jmp	loc_69CEE

loc_69DF2:
		push	bx
		mov	ax, word_7B0A6
		mov	dx, word_7B0A8
		sub	ax, word_7B0AE
		sbb	dx, word_7B0B0
		mov	bx, ax
		mov	cx, dx
		sar	dx, 1
		rcr	ax, 1
		add	ax, bx
		adc	dx, cx
		sub	ax, word_7B0B6
		sbb	dx, word_7B0B8
		sub	ax, word_7B0BA
		sbb	dx, word_7B0BC
		sar	dx, 1
		rcr	ax, 1
		add	word_7B0BE, ax
		adc	word_7B0C0, dx
		pop	bx

loc_69E2B:
		mov	dx, word_7B094
		mov	di, word_7B0A2
		add	di, word_7B096
		cmp	di, word_7B0A0
		jg	short loc_69E79
		cmp	di, word_7B09C
		jl	short loc_69E79
		mov	ax, di
		mov	si, word_7B0A4
		add	si, word_7B098
		cmp	si, word_7B09A
		jl	short loc_69E60
		cmp	si, word_7B09E
		jg	short loc_69E60
		add	di, [bp+si+saved_0]
		mov	es:[di], dl
		mov	di, ax

loc_69E60:
		mov	si, word_7B0A4
		sub	si, word_7B098
		cmp	si, word_7B09A
		jl	short loc_69E79
		cmp	si, word_7B09E
		jg	short loc_69E79
		add	di, [bp+si+saved_0]
		mov	es:[di], dl

loc_69E79:
		mov	di, word_7B0A2
		sub	di, word_7B096
		cmp	di, word_7B0A0
		jg	short loc_69EC3
		cmp	di, word_7B09C
		jl	short loc_69EC3
		mov	ax, di
		mov	si, word_7B0A4
		add	si, word_7B098
		cmp	si, word_7B09A
		jl	short loc_69EAA
		cmp	si, word_7B09E
		jg	short loc_69EAA
		add	di, [bp+si+saved_0]
		mov	es:[di], dl
		mov	di, ax

loc_69EAA:
		mov	si, word_7B0A4
		sub	si, word_7B098
		cmp	si, word_7B09A
		jl	short loc_69EC3
		cmp	si, word_7B09E
		jg	short loc_69EC3
		add	di, [bp+si+saved_0]
		mov	es:[di], dl

loc_69EC3:
		cmp	word_7B0C0, 0
		jns	short loc_69EEC
		inc	word_7B096
		mov	ax, word_7B0B6
		mov	dx, word_7B0B8
		add	ax, word_7B0B2
		adc	dx, word_7B0B4
		mov	word_7B0B6, ax
		mov	word_7B0B8, dx
		add	word_7B0BE, ax
		adc	word_7B0C0, dx

loc_69EEC:
		sub	word_7B098, 2
		mov	ax, word_7B0BA
		mov	dx, word_7B0BC
		sub	ax, word_7B0AA
		sbb	dx, word_7B0AC
		mov	word_7B0BA, ax
		mov	word_7B0BC, dx
		sub	ax, word_7B0A6
		sbb	dx, word_7B0A8
		sub	word_7B0BE, ax
		sbb	word_7B0C0, dx
		dec	bx
		js	short loc_69F1D
		jmp	loc_69E2B

loc_69F1D:
		pop	di
		pop	si
		pop	bp
sub_69BD4		endp
seg182		ends
