seg092		segment	para public 'CODE' use16
		assume cs:seg092
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

sub_3DE30		proc far
		call	sub_3E5D8
		cmp	ax, 200h
		jge	short loc_3DE3E
		xor	ax, ax
		jmp	short loc_3DE41

loc_3DE3E:
		mov	ax, 200h

loc_3DE41:
		mov	bx, word_5D254
		cmp	ax, bx
		jz	short loc_3DE4E
		call	sub_406BD

loc_3DE4E:
		retf
sub_3DE30		endp

; START OF FUNCTION CHUNK FOR sub_3DE30
		call	sub_3E5D8
		cmp	ax, 200h
		jge	short loc_3DE5E
		mov	ax, 0
		jmp	short loc_3DE61

loc_3DE5E:
		mov	ax, 200h

loc_3DE61:
		mov	bx, word_5D254
		cmp	ax, bx
		jz	short loc_3DE6D
		mov	ax, 1
		retf

loc_3DE6D:
		mov	ax, 0
		retf
		cmp	word_5D256, 0
		jz	short loc_3DE82
		xor	ax, ax
		mov	word_5D256, ax
		call	sub_3E590

loc_3DE82:
		retf
; END OF FUNCTION CHUNK FOR sub_3DE30

; ----------------------------------------------------------------------

sub_3DE83		proc far
		cmp	word_5D256, 0
		jnz	short loc_3DEE6
		push	word_5D65A
		call	sub_3E0F9
		pop	word_5D65A
		mov	ax, word_5D662
		mov	dx, word_5D664
		push	dx
		push	ax
		call	sub_3E18D
		pop	bx
		pop	bx
		jb	short loc_3DEE9
		call	sub_3E359
		jb	short loc_3DEE9
		push	word_5D660
		mov	ax, 400h
		push	ax
		push	word_5D660
		mov	ax, word_5D65C
		push	ax
		call	sub_3E374
		add	sp, 8
		mov	ax, 2B11h
		push	ax
		call	sub_3E3BE
		pop	ax
		call	sub_3E3A8
		jb	short loc_3DEE9
		call	sub_3E474
		jb	short loc_3DEE9
		mov	ax, 1
		mov	word_5D256, ax

loc_3DEE6:
		xor	ax, ax
		retf

loc_3DEE9:
		xor	ax, ax
		mov	word_5D256, ax
		call	sub_3E1C0
		mov	ax, 0FFFFh
		retf
sub_3DE83		endp

; ----------------------------------------------------------------------

sub_3DEF7		proc far
		push	ax
		push	dx
		mov	word_5D65C, bx
		mov	word_5D660, si
		mov	word_5D65A, di
		mov	dx, si
		mov	ax, bx
		push	cs
		call	near ptr sub_3DFA8
		mov	bx, dx
		mov	dx, si
		mov	ax, 200h
		add	ax, word_5D65C
		push	cs
		call	near ptr sub_3DFA8
		cmp	bx, dx
		jnz	short loc_3DF48
		pop	dx
		pop	ax
		pushf
		sti
		mov	bx, dx
		mov	cx, ax
		neg	bx
		sbb	bx, bx
		neg	cx
		sbb	cx, cx
		and	bx, cx
		jnz	short loc_3DF3B
		call	sub_3E1CE
		jb	short loc_3DF48

loc_3DF3B:
		mov	word_5D662, ax
		mov	word_5D664, dx
		push	cs
		call	near ptr sub_3DE83
		popf
		retf

loc_3DF48:
		xor	ax, ax
		mov	word_5D256, ax
		call	sub_3E1C0
		mov	ax, 0FFFFh
		popf
		retf
sub_3DEF7		endp

; ----------------------------------------------------------------------

sub_3DF57		proc far
		push	si
		pushf
		cmp	word_5D256, 0
		jz	short loc_3DF6A
		xor	ax, ax
		mov	word_5D256, ax
		call	sub_3E1C0

loc_3DF6A:
		popf
		pop	si
		retf
sub_3DF57		endp

; ----------------------------------------------------------------------

sub_3DF6D		proc far
		mov	ax, 1
		mov	word_5D252, ax
		retf
sub_3DF6D		endp

; ----------------------------------------------------------------------

sub_3DF74		proc far
		xor	ax, ax
		mov	word_5D252, ax
		retf
sub_3DF74		endp

; ----------------------------------------------------------------------

sub_3DF7A		proc far
		push	si
		push	di
		push	es
		cld
		mov	ax, word_5D660
		mov	es, ax
		mov	cx, 200h
		xor	ax, ax
		mov	ax, word_5D254
		mov	di, word_5D65C
		add	di, ax

loc_3DF91:
		mov	bx, gs:[si]
		add	si, 2
		mov	al, [bx+373Ah]
		stosb
		loop	short loc_3DF91
		xor	word_5D254, 200h
		pop	es
		pop	di
		pop	si
		retf
sub_3DF7A		endp

; ----------------------------------------------------------------------

sub_3DFA8		proc far
		push	cx
		push	cx
		mov	cl, 4
		rol	dx, cl
		mov	cx, dx
		and	dx, 0Fh
		and	cx, 0FFF0h
		add	ax, cx
		adc	dx, 0
		pop	cx
		pop	cx
		retf
sub_3DFA8		endp

; START OF FUNCTION CHUNK FOR sub_3DFA8
		db 0
; END OF FUNCTION CHUNK FOR sub_3DFA8
seg092		ends
