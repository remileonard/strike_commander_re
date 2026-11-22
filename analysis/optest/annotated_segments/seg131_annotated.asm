seg131		segment	byte public 'CODE' use16
		assume cs:seg131
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_3406A:				; DATA XREF: dseg:4630o
		call	sub_38EC9
		jb	short loc_34081
		call	sub_38BB6
		jnb	short loc_34086
		mov	word ptr ss:4882h, 271h
		jmp	short loc_340B2
; ���������������������������������������������������������������������������

loc_34081:				; CODE XREF: seg131:000Fj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_34086:				; CODE XREF: seg131:0016j
		mov	word ptr ss:4882h, 1DBh
		jmp	short loc_340B2
; ���������������������������������������������������������������������������

loc_3408F:				; DATA XREF: dseg:4650o
		call	sub_38F48
		jb	short loc_340A6
		call	sub_38BB6
		jnb	short loc_340AB
		mov	word ptr ss:4882h, 502h
		jmp	short loc_340B2
; ���������������������������������������������������������������������������

loc_340A6:				; CODE XREF: seg131:0034j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_340AB:				; CODE XREF: seg131:003Bj
		mov	word ptr ss:4882h, 46Ch

loc_340B2:				; CODE XREF: seg131:001Fj seg131:002Dj ...
		xor	dx, dx

loc_340B4:				; CODE XREF: seg131:00E1j
		mov	ss:4624h, dx
		mov	ss:4708h, bx
		mov	ss:470Ah, bp

loc_340C3:				; CODE XREF: seg131:loc_340F6j
					; seg131:009Dj
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_340CB
		jmp	short loc_34144
; ���������������������������������������������������������������������������

loc_340CB:				; CODE XREF: seg131:0067j
		mov	dx, [si+4]
		cmp	dx, ss:46EEh
		jz	short loc_340F8
		jl	short loc_340D9
		jmp	short loc_340FF
; ���������������������������������������������������������������������������

loc_340D9:				; CODE XREF: seg131:0075j
		add	si, 6
		shr	ax, 1
		jb	short loc_340E4
		add	si, ax
		jmp	short loc_340F6
; ���������������������������������������������������������������������������

loc_340E4:				; CODE XREF: seg131:007Ej
		push	di
		mov	di, ax

loc_340E7:				; CODE XREF: seg131:0093j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_340F1
		add	si, ax
		dec	si

loc_340F1:				; CODE XREF: seg131:008Cj
		sub	di, ax
		jnz	short loc_340E7
		pop	di

loc_340F6:				; CODE XREF: seg131:0082j
		jmp	short loc_340C3
; ���������������������������������������������������������������������������

loc_340F8:				; CODE XREF: seg131:0073j
		call	word ptr ss:4882h
		jmp	short loc_340C3
; ���������������������������������������������������������������������������

loc_340FF:				; CODE XREF: seg131:0077j
		mov	bx, ss:4708h
		mov	bp, ss:470Ah
		mov	dx, ss:4624h

loc_3410E:				; CODE XREF: seg131:00CFj
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_34144
		mov	ax, 0
		add	dl, ch
		jnb	short loc_3412B
		dec	bx
		cmp	cl, ch
		jl	short loc_34131
		mov	ax, 2
		jmp	short loc_34131
; ���������������������������������������������������������������������������

loc_3412B:				; CODE XREF: seg131:00BFj
		add	dh, cl
		jb	short loc_34135
		jnb	short loc_3410E

loc_34131:				; CODE XREF: seg131:00C4j seg131:00C9j
		add	dh, cl
		jnb	short loc_3413D

loc_34135:				; CODE XREF: seg131:00CDj
		inc	bp
		cmp	cl, ch
		jge	short loc_3413D
		mov	ax, 2

loc_3413D:				; CODE XREF: seg131:00D3j seg131:00D8j
		mov	ss:462Ah, ax
		jmp	loc_340B4
; ���������������������������������������������������������������������������

loc_34144:				; CODE XREF: seg131:0069j seg131:00B8j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_34149:				; DATA XREF: dseg:4670o
		call	sub_38FC9
		jb	short loc_34160
		call	sub_38BB6
		jnb	short loc_34165
		mov	word ptr ss:4882h, 271h
		jmp	short loc_34191
; ���������������������������������������������������������������������������

loc_34160:				; CODE XREF: seg131:00EEj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_34165:				; CODE XREF: seg131:00F5j
		mov	word ptr ss:4882h, 1DBh
		jmp	short loc_34191
; ���������������������������������������������������������������������������

loc_3416E:				; DATA XREF: dseg:4690o
		call	sub_39048
		jb	short loc_34185
		call	sub_38BB6
		jnb	short loc_3418A
		mov	word ptr ss:4882h, 502h
		jmp	short loc_34191
; ���������������������������������������������������������������������������

loc_34185:				; CODE XREF: seg131:0113j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3418A:				; CODE XREF: seg131:011Aj
		mov	word ptr ss:4882h, 46Ch

loc_34191:				; CODE XREF: seg131:00FEj seg131:010Cj ...
		xor	dx, dx
		mov	ss:4624h, dx

loc_34198:				; CODE XREF: seg131:01D3j
		mov	ss:4708h, bx
		mov	ss:470Ah, bp

loc_341A2:				; CODE XREF: seg131:loc_341D6j
					; seg131:017Dj
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_341AB
		jmp	loc_34236
; ���������������������������������������������������������������������������

loc_341AB:				; CODE XREF: seg131:0146j
		mov	dx, [si+4]
		cmp	dx, ss:46EEh
		jz	short loc_341D8
		jl	short loc_341B9
		jmp	short loc_341DF
; ���������������������������������������������������������������������������

loc_341B9:				; CODE XREF: seg131:0155j
		add	si, 6
		shr	ax, 1
		jb	short loc_341C4
		add	si, ax
		jmp	short loc_341D6
; ���������������������������������������������������������������������������

loc_341C4:				; CODE XREF: seg131:015Ej
		push	di
		mov	di, ax

loc_341C7:				; CODE XREF: seg131:0173j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_341D1
		add	si, ax
		dec	si

loc_341D1:				; CODE XREF: seg131:016Cj
		sub	di, ax
		jnz	short loc_341C7
		pop	di

loc_341D6:				; CODE XREF: seg131:0162j
		jmp	short loc_341A2
; ���������������������������������������������������������������������������

loc_341D8:				; CODE XREF: seg131:0153j
		call	word ptr ss:4882h
		jmp	short loc_341A2
; ���������������������������������������������������������������������������

loc_341DF:				; CODE XREF: seg131:0157j
		mov	bx, ss:4708h
		mov	bp, ss:470Ah
		mov	dx, ss:4624h

loc_341EE:				; CODE XREF: seg131:01A8j
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_34236
		mov	ax, 0
		add	dl, ch
		jnb	short loc_34204
		inc	bx
		jmp	short loc_3420A
; ���������������������������������������������������������������������������

loc_34204:				; CODE XREF: seg131:019Fj
		add	dh, cl
		jb	short loc_3420E
		jnb	short loc_341EE

loc_3420A:				; CODE XREF: seg131:01A2j
		add	dh, cl
		jnb	short loc_3420F

loc_3420E:				; CODE XREF: seg131:01A6j
		dec	bp

loc_3420F:				; CODE XREF: seg131:01ACj
		mov	ss:4624h, dx
		cmp	cl, ch
		jge	short loc_34222

loc_34218:				; CODE XREF: seg131:01C0j
		add	dl, ch
		jb	short loc_3422C
		add	dh, cl
		jb	short loc_3422F
		jmp	short loc_34218
; ���������������������������������������������������������������������������

loc_34222:				; CODE XREF: seg131:01B6j seg131:01CAj
		add	dh, cl
		jb	short loc_3422C
		add	dl, ch
		jb	short loc_3422F
		jmp	short loc_34222
; ���������������������������������������������������������������������������

loc_3422C:				; CODE XREF: seg131:01BAj seg131:01C4j
		mov	ax, 2

loc_3422F:				; CODE XREF: seg131:01BEj seg131:01C8j
		mov	ss:462Ah, ax
		jmp	loc_34198
; ���������������������������������������������������������������������������

loc_34236:				; CODE XREF: seg131:0148j seg131:0198j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		mov	ax, [si+2]
		add	ax, ss:4702h
		mov	bx, ss:4708h
		mov	di, ss:470Ah
		push	ax
		mul	cl
		mov	dl, al
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		pop	ax
		mul	ch
		mov	dh, al
		mov	al, ah
		xor	ah, ah
		add	di, ax
		shl	di, 1
		add	di, ss:4735h
		add	bx, ss:[di]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_342BA
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_34282:				; CODE XREF: seg131:0234j seg131:0247j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_34298
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_34282
		jz	short loc_342A9

loc_34298:				; CODE XREF: seg131:0228j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_34282

loc_342A9:				; CODE XREF: seg131:0236j
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		mov	cx, ss:4716h
		jmp	short loc_342C0
; ���������������������������������������������������������������������������

loc_342BA:				; CODE XREF: seg131:0214j
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_342C0:				; CODE XREF: seg131:0258j
		mov	ah, al
		mov	di, ss:462Ah
		add	di, 4170h
		call	word ptr ss:[di]
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		mov	ax, [si+2]
		jnb	short loc_34324
		push	ax
		add	si, 6
		mov	bx, ss:4729h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_342ED:				; CODE XREF: seg131:029Fj seg131:02B2j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_34303
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_342ED
		jz	short loc_34314

loc_34303:				; CODE XREF: seg131:0293j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_342ED

loc_34314:				; CODE XREF: seg131:02A1j
		pop	es
		mov	cx, ss:4716h
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_34330
; ���������������������������������������������������������������������������

loc_34324:				; CODE XREF: seg131:027Aj
		add	si, 6
		mov	di, si
		add	di, ss:4729h
		push	di
		push	ds

loc_34330:				; CODE XREF: seg131:02C2j
		add	ax, ss:4702h
		mov	byte ptr ss:4724h, 0
		mov	bx, ss:4708h
		mov	bp, ss:470Ah
		mov	di, ax
		mul	cl
		mov	ss:4626h, al
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:4627h, al
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, bx
		cmp	ax, ss:473Bh
		jle	short loc_3436D
		jmp	loc_344C9
; ���������������������������������������������������������������������������

loc_3436D:				; CODE XREF: seg131:0308j
		sub	ax, ss:4737h
		jge	short loc_343C8
		or	byte ptr ss:4724h, 1
		or	ax, ax
		jns	short loc_34380
		neg	ax

loc_34380:				; CODE XREF: seg131:031Cj
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:4712h
		or	dx, dx
		jz	short loc_3439D
		inc	ax

loc_3439D:				; CODE XREF: seg131:033Aj
		add	si, ax
		sub	ss:4729h, ax
		jle	short loc_343D1
		push	ax
		mul	cl
		add	ss:4626h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		pop	ax
		mul	ch
		add	ss:4627h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax

loc_343C8:				; CODE XREF: seg131:0312j
		mov	ax, bp
		cmp	ax, ss:473Dh
		jle	short loc_343D4

loc_343D1:				; CODE XREF: seg131:0344j seg131:03A5j
		jmp	loc_344C9
; ���������������������������������������������������������������������������

loc_343D4:				; CODE XREF: seg131:036Fj
		sub	ax, ss:4739h
		jge	short loc_3442F
		or	ax, ax
		jns	short loc_343E1
		neg	ax

loc_343E1:				; CODE XREF: seg131:037Dj
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4627h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:4714h
		or	dx, dx
		jz	short loc_343FE
		inc	ax

loc_343FE:				; CODE XREF: seg131:039Bj
		add	si, ax
		sub	ss:4729h, ax
		jle	short loc_343D1
		push	ax
		mul	ch
		add	ss:4627h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		pop	ax
		mul	cl
		add	ss:4626h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		or	byte ptr ss:4724h, 2

loc_3442F:				; CODE XREF: seg131:0379j
		mov	ax, ss:473Bh
		inc	ax
		sub	ax, bx
		jle	short loc_34459
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	cl
		add	al, ss:4626h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:4737h
		jge	short loc_3445B

loc_34459:				; CODE XREF: seg131:03D6j seg131:040Fj
		jmp	short loc_344C9
; ���������������������������������������������������������������������������

loc_3445B:				; CODE XREF: seg131:03F7j
		sub	ax, ss:473Bh
		jle	short loc_34468
		or	byte ptr ss:4724h, 4

loc_34468:				; CODE XREF: seg131:0400j
		mov	ax, ss:473Dh
		inc	ax
		sub	ax, bp
		jle	short loc_34459
		mov	ss:4731h, ax
		mov	ax, ss:4729h
		mul	ch
		add	al, ss:4627h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bp
		cmp	ax, ss:4739h
		jge	short loc_34494
		jmp	short loc_344C9
; ���������������������������������������������������������������������������

loc_34494:				; CODE XREF: seg131:0430j
		sub	ax, ss:473Dh
		jle	short loc_344A1
		or	byte ptr ss:4724h, 8

loc_344A1:				; CODE XREF: seg131:0439j
		mov	ax, bp
		shl	bp, 1
		add	bp, ss:4735h
		add	bx, [bp+0]
		mov	bp, ax
		mov	ah, ss:4729h
		or	ah, ah
		jz	short loc_344C9
		mov	dx, ss:4626h
		mov	di, ss:462Ah
		add	di, 4174h
		call	word ptr ss:[di]

loc_344C9:				; CODE XREF: seg131:030Aj
					; seg131:loc_343D1j ...
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		mov	ax, [si+2]
		add	ax, ss:4702h
		mov	bx, ss:4708h
		mov	di, ss:470Ah
		push	ax
		mul	cl
		mov	dl, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		pop	ax
		mul	ch
		mov	dh, al
		mov	al, ah
		xor	ah, ah
		sub	di, ax
		shl	di, 1
		add	di, ss:4735h
		add	bx, ss:[di]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_3454B
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_34513:				; CODE XREF: seg131:04C5j seg131:04D8j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_34529
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_34513
		jz	short loc_3453A

loc_34529:				; CODE XREF: seg131:04B9j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_34513

loc_3453A:				; CODE XREF: seg131:04C7j
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		mov	cx, ss:4716h
		jmp	short loc_34551
; ���������������������������������������������������������������������������

loc_3454B:				; CODE XREF: seg131:04A5j
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_34551:				; CODE XREF: seg131:04E9j
		mov	ah, al
		mov	di, ss:462Ah
		add	di, 4178h
		call	word ptr ss:[di]
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		mov	ax, [si+2]
		jnb	short loc_345B5
		push	ax
		add	si, 6
		mov	bx, ss:4729h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_3457E:				; CODE XREF: seg131:0530j seg131:0543j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_34594
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3457E
		jz	short loc_345A5

loc_34594:				; CODE XREF: seg131:0524j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3457E

loc_345A5:				; CODE XREF: seg131:0532j
		pop	es
		mov	cx, ss:4716h
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_345C1
; ���������������������������������������������������������������������������

loc_345B5:				; CODE XREF: seg131:050Bj
		add	si, 6
		mov	di, si
		add	di, ss:4729h
		push	di
		push	ds

loc_345C1:				; CODE XREF: seg131:0553j
		add	ax, ss:4702h
		mov	byte ptr ss:4724h, 0
		mov	bx, ss:4708h
		mov	bp, ss:470Ah
		mov	di, ax
		mul	cl
		mov	ss:4626h, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:4627h, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, bx
		cmp	ax, ss:4737h
		jge	short loc_345FE
		jmp	loc_34754
; ���������������������������������������������������������������������������

loc_345FE:				; CODE XREF: seg131:0599j
		sub	ax, ss:473Bh
		jle	short loc_34653
		or	byte ptr ss:4724h, 4
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:4712h
		or	dx, dx
		jz	short loc_34628
		inc	ax

loc_34628:				; CODE XREF: seg131:05C5j
		add	si, ax
		sub	ss:4729h, ax
		jle	short loc_3465C
		push	ax
		mul	cl
		add	ss:4626h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		pop	ax
		mul	ch
		add	ss:4627h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax

loc_34653:				; CODE XREF: seg131:05A3j
		mov	ax, bp
		cmp	ax, ss:4739h
		jge	short loc_3465F

loc_3465C:				; CODE XREF: seg131:05CFj seg131:062Aj
		jmp	loc_34754
; ���������������������������������������������������������������������������

loc_3465F:				; CODE XREF: seg131:05FAj
		sub	ax, ss:473Dh
		jle	short loc_346B4
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4627h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:4714h
		or	dx, dx
		jz	short loc_34683
		inc	ax

loc_34683:				; CODE XREF: seg131:0620j
		add	si, ax
		sub	ss:4729h, ax
		jle	short loc_3465C
		push	ax
		mul	ch
		add	ss:4627h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		pop	ax
		mul	cl
		add	ss:4626h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		or	byte ptr ss:4724h, 8

loc_346B4:				; CODE XREF: seg131:0604j
		mov	ax, bx
		inc	ax
		sub	ax, ss:4737h
		jle	short loc_346E1
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	cl
		add	al, ss:4626h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		sub	ax, bx
		neg	ax
		cmp	ax, ss:473Bh
		jle	short loc_346E3

loc_346E1:				; CODE XREF: seg131:065Cj seg131:0698j
		jmp	short loc_34754
; ���������������������������������������������������������������������������

loc_346E3:				; CODE XREF: seg131:067Fj
		sub	ax, ss:4737h
		jge	short loc_346F0
		or	byte ptr ss:4724h, 1

loc_346F0:				; CODE XREF: seg131:0688j
		mov	ax, bp
		inc	ax
		sub	ax, ss:4739h
		jle	short loc_346E1
		mov	ss:4731h, ax
		mov	ax, ss:4729h
		mul	ch
		add	al, ss:4627h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		sub	ax, bp
		neg	ax
		cmp	ax, ss:473Dh
		jle	short loc_3471F
		jmp	short loc_34754
; ���������������������������������������������������������������������������

loc_3471F:				; CODE XREF: seg131:06BBj
		sub	ax, ss:4739h
		jge	short loc_3472C
		or	byte ptr ss:4724h, 2

loc_3472C:				; CODE XREF: seg131:06C4j
		mov	ax, bx
		shl	bp, 1
		add	bp, ss:4735h
		add	bx, [bp+0]
		mov	bp, ax
		mov	ah, ss:4729h
		or	ah, ah
		jz	short loc_34754
		mov	dx, ss:4626h
		mov	di, ss:462Ah
		add	di, 417Ch
		call	word ptr ss:[di]

loc_34754:				; CODE XREF: seg131:059Bj
					; seg131:loc_3465Cj ...
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		mov	ax, [si+2]
		add	ax, ss:4702h
		mov	bx, ss:4708h
		mov	bp, ss:470Ah
		mov	di, ax
		mul	cl
		mov	dl, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	dh, al
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		shl	bp, 1
		add	bp, ss:4735h
		add	bx, [bp+0]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_347D8
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_347A0:				; CODE XREF: seg131:0752j seg131:0765j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_347B6
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_347A0
		jz	short loc_347C7

loc_347B6:				; CODE XREF: seg131:0746j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_347A0

loc_347C7:				; CODE XREF: seg131:0754j
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		mov	cx, ss:4716h
		jmp	short loc_347DE
; ���������������������������������������������������������������������������

loc_347D8:				; CODE XREF: seg131:0732j
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_347DE:				; CODE XREF: seg131:0776j
		mov	ah, al
		mov	di, ss:462Ah
		add	di, 4180h
		call	word ptr ss:[di]
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		mov	ax, [si+2]
		jnb	short loc_34842
		push	ax
		add	si, 6
		mov	bx, ss:4729h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_3480B:				; CODE XREF: seg131:07BDj seg131:07D0j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_34821
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3480B
		jz	short loc_34832

loc_34821:				; CODE XREF: seg131:07B1j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3480B

loc_34832:				; CODE XREF: seg131:07BFj
		pop	es
		mov	cx, ss:4716h
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_3484E
; ���������������������������������������������������������������������������

loc_34842:				; CODE XREF: seg131:0798j
		add	si, 6
		mov	di, si
		add	di, ss:4729h
		push	di
		push	ds

loc_3484E:				; CODE XREF: seg131:07E0j
		add	ax, ss:4702h
		mov	byte ptr ss:4724h, 0
		mov	bx, ss:4708h
		mov	bp, ss:470Ah
		mov	di, ax
		mul	cl
		mov	ss:4626h, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:4627h, al
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, bx
		cmp	ax, ss:4737h
		jge	short loc_3488B
		jmp	loc_349E4
; ���������������������������������������������������������������������������

loc_3488B:				; CODE XREF: seg131:0826j
		sub	ax, ss:473Bh
		jle	short loc_348E0
		or	byte ptr ss:4724h, 4
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:4712h
		or	dx, dx
		jz	short loc_348B5
		inc	ax

loc_348B5:				; CODE XREF: seg131:0852j
		add	si, ax
		sub	ss:4729h, ax
		jle	short loc_348E9
		push	ax
		mul	cl
		add	ss:4626h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		pop	ax
		mul	ch
		add	ss:4627h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax

loc_348E0:				; CODE XREF: seg131:0830j
		mov	ax, bp
		cmp	ax, ss:473Dh
		jle	short loc_348EC

loc_348E9:				; CODE XREF: seg131:085Cj seg131:08BDj
		jmp	loc_349E4
; ���������������������������������������������������������������������������

loc_348EC:				; CODE XREF: seg131:0887j
		sub	ax, ss:4739h
		jge	short loc_34947
		or	ax, ax
		jns	short loc_348F9
		neg	ax

loc_348F9:				; CODE XREF: seg131:0895j
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4627h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:4714h
		or	dx, dx
		jz	short loc_34916
		inc	ax

loc_34916:				; CODE XREF: seg131:08B3j
		add	si, ax
		sub	ss:4729h, ax
		jle	short loc_348E9
		push	ax
		mul	ch
		add	ss:4627h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		pop	ax
		mul	cl
		add	ss:4626h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		or	byte ptr ss:4724h, 2

loc_34947:				; CODE XREF: seg131:0891j
		mov	ax, bx
		inc	ax
		sub	ax, ss:4737h
		jle	short loc_34974
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	cl
		add	al, ss:4626h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		mov	dx, bx
		sub	dx, ax
		cmp	dx, ss:473Bh
		jle	short loc_34976

loc_34974:				; CODE XREF: seg131:08EFj seg131:092Aj
		jmp	short loc_349E4
; ���������������������������������������������������������������������������

loc_34976:				; CODE XREF: seg131:0912j
		cmp	dx, ss:4737h
		jge	short loc_34983
		or	byte ptr ss:4724h, 1

loc_34983:				; CODE XREF: seg131:091Bj
		mov	ax, ss:473Dh
		inc	ax
		sub	ax, bp
		jle	short loc_34974
		mov	ss:4731h, ax
		mov	ax, ss:4729h
		mul	ch
		add	al, ss:4627h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bp
		cmp	ax, ss:4739h
		jge	short loc_349AF
		jmp	short loc_349E4
; ���������������������������������������������������������������������������

loc_349AF:				; CODE XREF: seg131:094Bj
		cmp	ax, ss:473Dh
		jle	short loc_349BC
		or	byte ptr ss:4724h, 8

loc_349BC:				; CODE XREF: seg131:0954j
		mov	ax, bp
		shl	bp, 1
		add	bp, ss:4735h
		add	bx, [bp+0]
		mov	bp, ax
		mov	ah, ss:4729h
		or	ah, ah
		jz	short loc_349E4
		mov	dx, ss:4626h
		mov	di, ss:462Ah
		add	di, 4184h
		call	word ptr ss:[di]

loc_349E4:				; CODE XREF: seg131:0828j
					; seg131:loc_348E9j ...
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		mov	ax, [si+2]
		add	ax, ss:4702h
		mov	bx, ss:4708h
		mov	bp, ss:470Ah
		mov	di, ax
		mul	cl
		mov	dl, al
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	dh, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		shl	bp, 1
		add	bp, ss:4735h
		add	bx, [bp+0]
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jnb	short loc_34A68
		push	ax
		push	bx
		mov	bx, ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_34A30:				; CODE XREF: seg131:09E2j seg131:09F5j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_34A46
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_34A30
		jz	short loc_34A57

loc_34A46:				; CODE XREF: seg131:09D6j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_34A30

loc_34A57:				; CODE XREF: seg131:09E4j
		pop	es
		pop	bx
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		mov	cx, ss:4716h
		jmp	short loc_34A6E
; ���������������������������������������������������������������������������

loc_34A68:				; CODE XREF: seg131:09C2j
		mov	di, si
		add	di, ax
		push	di
		push	ds

loc_34A6E:				; CODE XREF: seg131:0A06j
		mov	ah, al
		mov	di, ss:462Ah
		add	di, 4188h
		call	word ptr ss:[di]
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		mov	ax, [si+2]
		jnb	short loc_34AD2
		push	ax
		add	si, 6
		mov	bx, ss:4729h
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_34A9B:				; CODE XREF: seg131:0A4Dj seg131:0A60j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_34AB1
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_34A9B
		jz	short loc_34AC2

loc_34AB1:				; CODE XREF: seg131:0A41j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_34A9B

loc_34AC2:				; CODE XREF: seg131:0A4Fj
		pop	es
		mov	cx, ss:4716h
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_34ADE
; ���������������������������������������������������������������������������

loc_34AD2:				; CODE XREF: seg131:0A28j
		add	si, 6
		mov	di, si
		add	di, ss:4729h
		push	di
		push	ds

loc_34ADE:				; CODE XREF: seg131:0A70j
		add	ax, ss:4702h
		mov	byte ptr ss:4724h, 0
		mov	bx, ss:4708h
		mov	bp, ss:470Ah
		mov	di, ax
		mul	cl
		mov	ss:4626h, al
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	ss:4627h, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, bx
		cmp	ax, ss:473Bh
		jle	short loc_34B1B
		jmp	loc_34C6E
; ���������������������������������������������������������������������������

loc_34B1B:				; CODE XREF: seg131:0AB6j
		sub	ax, ss:4737h
		jge	short loc_34B72
		neg	ax
		or	byte ptr ss:4724h, 1
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:4712h
		or	dx, dx
		jz	short loc_34B47
		inc	ax

loc_34B47:				; CODE XREF: seg131:0AE4j
		add	si, ax
		sub	ss:4729h, ax
		jle	short loc_34B7B
		push	ax
		mul	cl
		add	ss:4626h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		pop	ax
		mul	ch
		add	ss:4627h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax

loc_34B72:				; CODE XREF: seg131:0AC0j
		mov	ax, bp
		cmp	ax, ss:4739h
		jge	short loc_34B7E

loc_34B7B:				; CODE XREF: seg131:0AEEj seg131:0B49j
		jmp	loc_34C6E
; ���������������������������������������������������������������������������

loc_34B7E:				; CODE XREF: seg131:0B19j
		sub	ax, ss:473Dh
		jle	short loc_34BD3
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4627h
		sbb	ah, 0
		sbb	dx, 0
		div	word ptr ss:4714h
		or	dx, dx
		jz	short loc_34BA2
		inc	ax

loc_34BA2:				; CODE XREF: seg131:0B3Fj
		add	si, ax
		sub	ss:4729h, ax
		jle	short loc_34B7B
		push	ax
		mul	ch
		add	ss:4627h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		pop	ax
		mul	cl
		add	ss:4626h, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		or	byte ptr ss:4724h, 8

loc_34BD3:				; CODE XREF: seg131:0B23j
		mov	ax, ss:473Bh
		inc	ax
		sub	ax, bx
		jle	short loc_34BFD
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	cl
		add	al, ss:4626h
		adc	ah, 0
		mov	di, ax
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:4737h
		jge	short loc_34BFF

loc_34BFD:				; CODE XREF: seg131:0B7Aj seg131:0BB4j
		jmp	short loc_34C6E
; ���������������������������������������������������������������������������

loc_34BFF:				; CODE XREF: seg131:0B9Bj
		cmp	ax, ss:473Bh
		jle	short loc_34C0C
		or	byte ptr ss:4724h, 4

loc_34C0C:				; CODE XREF: seg131:0BA4j
		mov	ax, bp
		inc	ax
		sub	ax, ss:4739h
		jle	short loc_34BFD
		mov	ss:4731h, ax
		mov	ax, ss:4729h
		mul	ch
		add	al, ss:4627h
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		neg	ax
		add	ax, bp
		cmp	ax, ss:473Dh
		jle	short loc_34C39
		jmp	short loc_34C6E
; ���������������������������������������������������������������������������

loc_34C39:				; CODE XREF: seg131:0BD5j
		cmp	ax, ss:4739h
		jge	short loc_34C46
		or	byte ptr ss:4724h, 2

loc_34C46:				; CODE XREF: seg131:0BDEj
		mov	ax, bx
		shl	bp, 1
		add	bp, ss:4735h
		add	bx, [bp+0]
		mov	bp, ax
		mov	ah, ss:4729h
		or	ah, ah
		jz	short loc_34C6E
		mov	dx, ss:4626h
		mov	di, ss:462Ah
		add	di, 418Ch
		call	word ptr ss:[di]

loc_34C6E:				; CODE XREF: seg131:0AB8j
					; seg131:loc_34B7Bj ...
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������

loc_34C71:				; CODE XREF: seg131:0C3Cj
		mov	di, ss:473Fh
		jmp	short loc_34C8D
; ���������������������������������������������������������������������������

loc_34C78:				; CODE XREF: seg131:0C23j seg131:0C33j
		add	dl, cl
		jb	short loc_34C86
		add	dh, ch
		jb	short loc_34C8B
		inc	si
		dec	ah
		jnz	short loc_34C78
		retn
; ���������������������������������������������������������������������������

loc_34C86:				; CODE XREF: seg131:0C1Aj
		inc	bx
		add	dh, ch
		jnb	short loc_34C8D

loc_34C8B:				; CODE XREF: seg131:0C1Ej
		add	bx, di

loc_34C8D:				; CODE XREF: seg131:0C16j seg131:0C29j
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34C78
		retn
; ���������������������������������������������������������������������������
		test	byte ptr ss:4724h, 0Ch
		jz	short loc_34C71
		mov	di, ss:473Fh
		jmp	short loc_34CC8
; ���������������������������������������������������������������������������

loc_34CA5:				; CODE XREF: seg131:0C50j seg131:0C6Ej
		add	dl, cl
		jb	short loc_34CB3
		add	dh, ch
		jb	short loc_34CBF
		inc	si
		dec	ah
		jnz	short loc_34CA5
		retn
; ���������������������������������������������������������������������������

loc_34CB3:				; CODE XREF: seg131:0C47j
		dec	word ptr ss:472Fh
		jle	short locret_34CD0
		inc	bx
		add	dh, ch
		jnb	short loc_34CC8

loc_34CBF:				; CODE XREF: seg131:0C4Bj
		dec	word ptr ss:4731h
		jle	short locret_34CD0
		add	bx, di

loc_34CC8:				; CODE XREF: seg131:0C43j seg131:0C5Dj
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34CA5

locret_34CD0:				; CODE XREF: seg131:0C58j seg131:0C64j
		retn
; ���������������������������������������������������������������������������

loc_34CD1:				; CODE XREF: seg131:0CACj
		mov	di, ss:473Fh
		jmp	short loc_34CF0
; ���������������������������������������������������������������������������

loc_34CD8:				; CODE XREF: seg131:0C83j seg131:0C96j
		add	dl, cl
		jb	short loc_34CE6
		add	dh, ch
		jb	short loc_34CEE
		lodsb
		dec	ah
		jnz	short loc_34CD8
		retn
; ���������������������������������������������������������������������������

loc_34CE6:				; CODE XREF: seg131:0C7Aj
		inc	bx
		add	dh, ch
		jnb	short loc_34CF0
		mov	es:[bx], al

loc_34CEE:				; CODE XREF: seg131:0C7Ej
		add	bx, di

loc_34CF0:				; CODE XREF: seg131:0C76j seg131:0C89j
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34CD8
		retn
; ���������������������������������������������������������������������������
		mov	di, ss:473Fh
		test	byte ptr ss:4724h, 1
		jnz	short loc_34D15
		test	byte ptr ss:4724h, 0Ch
		jz	short loc_34CD1
		mov	ah, ss:4729h
		jmp	short loc_34D60
; ���������������������������������������������������������������������������

loc_34D15:				; CODE XREF: seg131:0CA4j
		cmp	bp, ss:4739h
		jz	short loc_34D60
		push	si
		push	dx

loc_34D1E:				; CODE XREF: seg131:0CD4j
		dec	si
		sub	dl, cl
		jnb	short loc_34D32
		sub	dh, ch
		jnb	short loc_34D36
		mov	al, [si]
		sub	bx, di
		mov	es:[bx], al
		add	bx, di
		jmp	short loc_34D36
; ���������������������������������������������������������������������������

loc_34D32:				; CODE XREF: seg131:0CC1j
		sub	dh, ch
		jnb	short loc_34D1E

loc_34D36:				; CODE XREF: seg131:0CC5j seg131:0CD0j
		pop	dx
		pop	si
		jmp	short loc_34D60
; ���������������������������������������������������������������������������

loc_34D3A:				; CODE XREF: seg131:0CE5j seg131:0D06j
		add	dl, cl
		jb	short loc_34D48
		add	dh, ch
		jb	short loc_34D57
		lodsb
		dec	ah
		jnz	short loc_34D3A
		retn
; ���������������������������������������������������������������������������

loc_34D48:				; CODE XREF: seg131:0CDCj
		dec	word ptr ss:472Fh
		jle	short locret_34D68
		inc	bx
		add	dh, ch
		jnb	short loc_34D60
		mov	es:[bx], al

loc_34D57:				; CODE XREF: seg131:0CE0j
		add	bx, di
		dec	word ptr ss:4731h
		jle	short locret_34D68

loc_34D60:				; CODE XREF: seg131:0CB3j seg131:0CBAj ...
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34D3A

locret_34D68:				; CODE XREF: seg131:0CEDj seg131:0CFEj
		retn
; ���������������������������������������������������������������������������

loc_34D69:				; CODE XREF: seg131:0D34j
		mov	di, ss:473Fh
		jmp	short loc_34D85
; ���������������������������������������������������������������������������

loc_34D70:				; CODE XREF: seg131:0D1Bj seg131:0D2Bj
		add	dl, cl
		jb	short loc_34D7E
		add	dh, ch
		jb	short loc_34D83
		inc	si
		dec	ah
		jnz	short loc_34D70
		retn
; ���������������������������������������������������������������������������

loc_34D7E:				; CODE XREF: seg131:0D12j
		inc	bx
		add	dh, ch
		jnb	short loc_34D85

loc_34D83:				; CODE XREF: seg131:0D16j
		sub	bx, di

loc_34D85:				; CODE XREF: seg131:0D0Ej seg131:0D21j
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34D70
		retn
; ���������������������������������������������������������������������������
		test	byte ptr ss:4724h, 6
		jz	short loc_34D69
		mov	di, ss:473Fh
		jmp	short loc_34DC0
; ���������������������������������������������������������������������������

loc_34D9D:				; CODE XREF: seg131:0D48j seg131:0D66j
		add	dl, cl
		jb	short loc_34DAB
		add	dh, ch
		jb	short loc_34DB7
		inc	si
		dec	ah
		jnz	short loc_34D9D
		retn
; ���������������������������������������������������������������������������

loc_34DAB:				; CODE XREF: seg131:0D3Fj
		dec	word ptr ss:472Fh
		jle	short locret_34DC8
		inc	bx
		add	dh, ch
		jnb	short loc_34DC0

loc_34DB7:				; CODE XREF: seg131:0D43j
		dec	word ptr ss:4731h
		jle	short locret_34DC8
		sub	bx, di

loc_34DC0:				; CODE XREF: seg131:0D3Bj seg131:0D55j
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34D9D

locret_34DC8:				; CODE XREF: seg131:0D50j seg131:0D5Cj
		retn
; ���������������������������������������������������������������������������

loc_34DC9:				; CODE XREF: seg131:0DAFj
		mov	di, ss:473Fh
		jmp	short loc_34DE8
; ���������������������������������������������������������������������������

loc_34DD0:				; CODE XREF: seg131:0D7Bj seg131:0D8Ej ...
		add	dl, cl
		jb	short loc_34DDE
		add	dh, ch
		jb	short loc_34DF1
		lodsb
		dec	ah
		jnz	short loc_34DD0
		retn
; ���������������������������������������������������������������������������

loc_34DDE:				; CODE XREF: seg131:0D72j
		add	dh, ch
		jnb	short loc_34DE7
		sub	bx, di
		mov	es:[bx], al

loc_34DE7:				; CODE XREF: seg131:0D80j
		inc	bx

loc_34DE8:				; CODE XREF: seg131:0D6Ej
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34DD0
		retn
; ���������������������������������������������������������������������������

loc_34DF1:				; CODE XREF: seg131:0D76j
		sub	bx, di
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34DD0
		retn
; ���������������������������������������������������������������������������
		mov	di, ss:473Fh
		test	byte ptr ss:4724h, 8
		jnz	short loc_34E13
		test	byte ptr ss:4724h, 6
		jz	short loc_34DC9
		jmp	short loc_34E6E
; ���������������������������������������������������������������������������

loc_34E13:				; CODE XREF: seg131:0DA7j
		cmp	bp, ss:4737h
		jz	short loc_34E6E
		push	si
		push	dx

loc_34E1C:				; CODE XREF: seg131:0DD0j
		dec	si
		sub	dl, cl
		jnb	short loc_34E2E
		sub	dh, ch
		jnb	short loc_34E32
		mov	al, [si]
		dec	bx
		mov	es:[bx], al
		inc	bx
		jmp	short loc_34E32
; ���������������������������������������������������������������������������

loc_34E2E:				; CODE XREF: seg131:0DBFj
		sub	dh, ch
		jnb	short loc_34E1C

loc_34E32:				; CODE XREF: seg131:0DC3j seg131:0DCCj
		pop	dx
		pop	si
		jmp	short loc_34E6E
; ���������������������������������������������������������������������������

loc_34E36:				; CODE XREF: seg131:0DE1j seg131:0E02j ...
		add	dl, cl
		jb	short loc_34E44
		add	dh, ch
		jb	short loc_34E65
		lodsb
		dec	ah
		jnz	short loc_34E36
		retn
; ���������������������������������������������������������������������������

loc_34E44:				; CODE XREF: seg131:0DD8j
		add	dh, ch
		jnb	short loc_34E54
		dec	word ptr ss:4731h
		jle	short locret_34E76
		sub	bx, di
		mov	es:[bx], al

loc_34E54:				; CODE XREF: seg131:0DE6j
		dec	word ptr ss:472Fh
		jle	short locret_34E76
		inc	bx
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34E36
		retn
; ���������������������������������������������������������������������������

loc_34E65:				; CODE XREF: seg131:0DDCj
		sub	bx, di
		dec	word ptr ss:4731h
		jle	short locret_34E76

loc_34E6E:				; CODE XREF: seg131:0DB1j seg131:0DB8j ...
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34E36

locret_34E76:				; CODE XREF: seg131:0DEDj seg131:0DF9j ...
		retn
; ���������������������������������������������������������������������������

loc_34E77:				; CODE XREF: seg131:0E42j
		mov	di, ss:473Fh
		jmp	short loc_34E93
; ���������������������������������������������������������������������������

loc_34E7E:				; CODE XREF: seg131:0E29j seg131:0E39j
		add	dl, cl
		jb	short loc_34E8C
		add	dh, ch
		jb	short loc_34E91
		inc	si
		dec	ah
		jnz	short loc_34E7E
		retn
; ���������������������������������������������������������������������������

loc_34E8C:				; CODE XREF: seg131:0E20j
		dec	bx
		add	dh, ch
		jnb	short loc_34E93

loc_34E91:				; CODE XREF: seg131:0E24j
		add	bx, di

loc_34E93:				; CODE XREF: seg131:0E1Cj seg131:0E2Fj
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34E7E
		retn
; ���������������������������������������������������������������������������
		test	byte ptr ss:4724h, 9
		jz	short loc_34E77
		mov	di, ss:473Fh
		jmp	short loc_34ECE
; ���������������������������������������������������������������������������

loc_34EAB:				; CODE XREF: seg131:0E56j seg131:0E74j
		add	dl, cl
		jb	short loc_34EB9
		add	dh, ch
		jb	short loc_34EC5
		inc	si
		dec	ah
		jnz	short loc_34EAB
		retn
; ���������������������������������������������������������������������������

loc_34EB9:				; CODE XREF: seg131:0E4Dj
		dec	word ptr ss:472Fh
		jle	short locret_34ED6
		dec	bx
		add	dh, ch
		jnb	short loc_34ECE

loc_34EC5:				; CODE XREF: seg131:0E51j
		dec	word ptr ss:4731h
		jle	short locret_34ED6
		add	bx, di

loc_34ECE:				; CODE XREF: seg131:0E49j seg131:0E63j
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34EAB

locret_34ED6:				; CODE XREF: seg131:0E5Ej seg131:0E6Aj
		retn
; ���������������������������������������������������������������������������

loc_34ED7:				; CODE XREF: seg131:0EB2j
		mov	di, ss:473Fh
		jmp	short loc_34EF6
; ���������������������������������������������������������������������������

loc_34EDE:				; CODE XREF: seg131:0E89j seg131:0E9Cj
		add	dl, cl
		jb	short loc_34EEC
		add	dh, ch
		jb	short loc_34EF4
		lodsb
		dec	ah
		jnz	short loc_34EDE
		retn
; ���������������������������������������������������������������������������

loc_34EEC:				; CODE XREF: seg131:0E80j
		dec	bx
		add	dh, ch
		jnb	short loc_34EF6
		mov	es:[bx], al

loc_34EF4:				; CODE XREF: seg131:0E84j
		add	bx, di

loc_34EF6:				; CODE XREF: seg131:0E7Cj seg131:0E8Fj
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34EDE
		retn
; ���������������������������������������������������������������������������
		mov	di, ss:473Fh
		test	byte ptr ss:4724h, 4
		jnz	short loc_34F16
		test	byte ptr ss:4724h, 9
		jz	short loc_34ED7
		jmp	short loc_34F61
; ���������������������������������������������������������������������������

loc_34F16:				; CODE XREF: seg131:0EAAj
		cmp	bp, ss:4739h
		jz	short loc_34F61
		push	si
		push	dx

loc_34F1F:				; CODE XREF: seg131:0ED5j
		dec	si
		sub	dl, cl
		jnb	short loc_34F33
		sub	dh, ch
		jnb	short loc_34F37
		sub	bx, di
		mov	al, [si]
		mov	es:[bx], al
		add	bx, di
		jmp	short loc_34F37
; ���������������������������������������������������������������������������

loc_34F33:				; CODE XREF: seg131:0EC2j
		sub	dh, ch
		jnb	short loc_34F1F

loc_34F37:				; CODE XREF: seg131:0EC6j seg131:0ED1j
		pop	dx
		pop	si
		jmp	short loc_34F61
; ���������������������������������������������������������������������������

loc_34F3B:				; CODE XREF: seg131:0EE6j seg131:0F07j
		add	dl, cl
		jb	short loc_34F49
		add	dh, ch
		jb	short loc_34F58
		lodsb
		dec	ah
		jnz	short loc_34F3B
		retn
; ���������������������������������������������������������������������������

loc_34F49:				; CODE XREF: seg131:0EDDj
		dec	word ptr ss:472Fh
		jle	short locret_34F69
		dec	bx
		add	dh, ch
		jnb	short loc_34F61
		mov	es:[bx], al

loc_34F58:				; CODE XREF: seg131:0EE1j
		add	bx, di
		dec	word ptr ss:4731h
		jle	short locret_34F69

loc_34F61:				; CODE XREF: seg131:0EB4j seg131:0EBBj ...
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34F3B

locret_34F69:				; CODE XREF: seg131:0EEEj seg131:0EFFj
		retn
; ���������������������������������������������������������������������������

loc_34F6A:				; CODE XREF: seg131:0F35j
		mov	di, ss:473Fh
		jmp	short loc_34F86
; ���������������������������������������������������������������������������

loc_34F71:				; CODE XREF: seg131:0F1Cj seg131:0F2Cj
		add	dl, cl
		jb	short loc_34F7F
		add	dh, ch
		jb	short loc_34F84
		inc	si
		dec	ah
		jnz	short loc_34F71
		retn
; ���������������������������������������������������������������������������

loc_34F7F:				; CODE XREF: seg131:0F13j
		dec	bx
		add	dh, ch
		jnb	short loc_34F86

loc_34F84:				; CODE XREF: seg131:0F17j
		sub	bx, di

loc_34F86:				; CODE XREF: seg131:0F0Fj seg131:0F22j
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34F71
		retn
; ���������������������������������������������������������������������������
		test	byte ptr ss:4724h, 3
		jz	short loc_34F6A
		mov	di, ss:473Fh
		jmp	short loc_34FC1
; ���������������������������������������������������������������������������

loc_34F9E:				; CODE XREF: seg131:0F49j seg131:0F67j
		add	dl, cl
		jb	short loc_34FAC
		add	dh, ch
		jb	short loc_34FB8
		inc	si
		dec	ah
		jnz	short loc_34F9E
		retn
; ���������������������������������������������������������������������������

loc_34FAC:				; CODE XREF: seg131:0F40j
		dec	word ptr ss:472Fh
		jle	short locret_34FC9
		dec	bx
		add	dh, ch
		jnb	short loc_34FC1

loc_34FB8:				; CODE XREF: seg131:0F44j
		dec	word ptr ss:4731h
		jle	short locret_34FC9
		sub	bx, di

loc_34FC1:				; CODE XREF: seg131:0F3Cj seg131:0F56j
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34F9E

locret_34FC9:				; CODE XREF: seg131:0F51j seg131:0F5Dj
		retn
; ���������������������������������������������������������������������������

loc_34FCA:				; CODE XREF: seg131:0FB0j
		mov	di, ss:473Fh
		jmp	short loc_34FF4
; ���������������������������������������������������������������������������

loc_34FD1:				; CODE XREF: seg131:0F7Cj seg131:0F8Fj ...
		add	dl, cl
		jb	short loc_34FDF
		add	dh, ch
		jb	short loc_34FF2
		lodsb
		dec	ah
		jnz	short loc_34FD1
		retn
; ���������������������������������������������������������������������������

loc_34FDF:				; CODE XREF: seg131:0F73j
		add	dh, ch
		jnb	short loc_34FE8
		sub	bx, di
		mov	es:[bx], al

loc_34FE8:				; CODE XREF: seg131:0F81j
		dec	bx
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34FD1
		retn
; ���������������������������������������������������������������������������

loc_34FF2:				; CODE XREF: seg131:0F77j
		sub	bx, di

loc_34FF4:				; CODE XREF: seg131:0F6Fj
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_34FD1
		retn
; ���������������������������������������������������������������������������
		mov	di, ss:473Fh
		test	byte ptr ss:4724h, 8
		jnz	short loc_35014
		test	byte ptr ss:4724h, 3
		jz	short loc_34FCA
		jmp	short loc_3506F
; ���������������������������������������������������������������������������

loc_35014:				; CODE XREF: seg131:0FA8j
		cmp	bp, ss:473Bh
		jge	short loc_3506F
		push	si
		push	dx

loc_3501D:				; CODE XREF: seg131:0FD1j
		dec	si
		sub	dl, cl
		jnb	short loc_3502F
		sub	dh, ch
		jnb	short loc_35033
		inc	bx
		mov	al, [si]
		mov	es:[bx], al
		dec	bx
		jmp	short loc_35033
; ���������������������������������������������������������������������������

loc_3502F:				; CODE XREF: seg131:0FC0j
		sub	dh, ch
		jnb	short loc_3501D

loc_35033:				; CODE XREF: seg131:0FC4j seg131:0FCDj
		pop	dx
		pop	si
		jmp	short loc_3506F
; ���������������������������������������������������������������������������

loc_35037:				; CODE XREF: seg131:0FE2j seg131:1003j ...
		add	dl, cl
		jb	short loc_35045
		add	dh, ch
		jb	short loc_35066
		lodsb
		dec	ah
		jnz	short loc_35037
		retn
; ���������������������������������������������������������������������������

loc_35045:				; CODE XREF: seg131:0FD9j
		add	dh, ch
		jnb	short loc_35055
		dec	word ptr ss:4731h
		jle	short locret_35077
		sub	bx, di
		mov	es:[bx], al

loc_35055:				; CODE XREF: seg131:0FE7j
		dec	word ptr ss:472Fh
		jle	short locret_35077
		dec	bx
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_35037
		retn
; ���������������������������������������������������������������������������

loc_35066:				; CODE XREF: seg131:0FDDj
		sub	bx, di
		dec	word ptr ss:4731h
		jle	short locret_35077

loc_3506F:				; CODE XREF: seg131:0FB2j seg131:0FB9j ...
		lodsb
		mov	es:[bx], al
		dec	ah
		jnz	short loc_35037

locret_35077:				; CODE XREF: seg131:0FEEj seg131:0FFAj ...
		retn
; ���������������������������������������������������������������������������

loc_35078:				; DATA XREF: dseg:4638o
		call	sub_390C7
		jb	short loc_3508F
		call	sub_38BB6
		jnb	short loc_35094
		mov	word ptr ss:4882h, 78Fh
		jmp	short loc_350C0
; ���������������������������������������������������������������������������

loc_3508F:				; CODE XREF: seg131:101Dj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_35094:				; CODE XREF: seg131:1024j
		mov	word ptr ss:4882h, 6F7h
		jmp	short loc_350C0
; ���������������������������������������������������������������������������

loc_3509D:				; DATA XREF: dseg:4658o
		call	sub_39148
		jb	short loc_350B4
		call	sub_38BB6
		jnb	short loc_350B9
		mov	word ptr ss:4882h, 0A1Fh
		jmp	short loc_350C0
; ���������������������������������������������������������������������������

loc_350B4:				; CODE XREF: seg131:1042j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_350B9:				; CODE XREF: seg131:1049j
		mov	word ptr ss:4882h, 987h

loc_350C0:				; CODE XREF: seg131:102Dj seg131:103Bj ...
		xor	dx, dx
		mov	ss:4624h, dx

loc_350C7:				; CODE XREF: seg131:1102j
		mov	ss:4708h, bx
		mov	ss:470Ah, bp

loc_350D1:				; CODE XREF: seg131:loc_35105j
					; seg131:10ACj
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_350DA
		jmp	loc_35165
; ���������������������������������������������������������������������������

loc_350DA:				; CODE XREF: seg131:1075j
		mov	dx, [si+4]
		cmp	dx, ss:46EEh
		jz	short loc_35107
		jl	short loc_350E8
		jmp	short loc_3510E
; ���������������������������������������������������������������������������

loc_350E8:				; CODE XREF: seg131:1084j
		add	si, 6
		shr	ax, 1
		jb	short loc_350F3
		add	si, ax
		jmp	short loc_35105
; ���������������������������������������������������������������������������

loc_350F3:				; CODE XREF: seg131:108Dj
		push	di
		mov	di, ax

loc_350F6:				; CODE XREF: seg131:10A2j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_35100
		add	si, ax
		dec	si

loc_35100:				; CODE XREF: seg131:109Bj
		sub	di, ax
		jnz	short loc_350F6
		pop	di

loc_35105:				; CODE XREF: seg131:1091j
		jmp	short loc_350D1
; ���������������������������������������������������������������������������

loc_35107:				; CODE XREF: seg131:1082j
		call	word ptr ss:4882h
		jmp	short loc_350D1
; ���������������������������������������������������������������������������

loc_3510E:				; CODE XREF: seg131:1086j
		mov	bx, ss:4708h
		mov	bp, ss:470Ah
		mov	dx, ss:4624h

loc_3511D:				; CODE XREF: seg131:10D7j
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_35165
		mov	ax, 0
		add	dl, ch
		jnb	short loc_35133
		dec	bx
		jmp	short loc_35139
; ���������������������������������������������������������������������������

loc_35133:				; CODE XREF: seg131:10CEj
		add	dh, cl
		jb	short loc_3513D
		jnb	short loc_3511D

loc_35139:				; CODE XREF: seg131:10D1j
		add	dh, cl
		jnb	short loc_3513E

loc_3513D:				; CODE XREF: seg131:10D5j
		dec	bp

loc_3513E:				; CODE XREF: seg131:10DBj
		mov	ss:4624h, dx
		cmp	cl, ch
		jge	short loc_35151

loc_35147:				; CODE XREF: seg131:10EFj
		add	dl, ch
		jb	short loc_3515B
		add	dh, cl
		jb	short loc_3515E
		jmp	short loc_35147
; ���������������������������������������������������������������������������

loc_35151:				; CODE XREF: seg131:10E5j seg131:10F9j
		add	dh, cl
		jb	short loc_3515B
		add	dl, ch
		jb	short loc_3515E
		jmp	short loc_35151
; ���������������������������������������������������������������������������

loc_3515B:				; CODE XREF: seg131:10E9j seg131:10F3j
		mov	ax, 2

loc_3515E:				; CODE XREF: seg131:10EDj seg131:10F7j
		mov	ss:462Ah, ax
		jmp	loc_350C7
; ���������������������������������������������������������������������������

loc_35165:				; CODE XREF: seg131:1077j seg131:10C7j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3516A:				; DATA XREF: dseg:4678o
		call	sub_391C7
		jb	short loc_35181
		call	sub_38BB6
		jnb	short loc_35186
		mov	word ptr ss:4882h, 78Fh
		jmp	short loc_351B2
; ���������������������������������������������������������������������������

loc_35181:				; CODE XREF: seg131:110Fj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_35186:				; CODE XREF: seg131:1116j
		mov	word ptr ss:4882h, 6F7h
		jmp	short loc_351B2
; ���������������������������������������������������������������������������

loc_3518F:				; DATA XREF: dseg:4698o
		call	sub_39244
		jb	short loc_351A6
		call	sub_38BB6
		jnb	short loc_351AB
		mov	word ptr ss:4882h, 0A1Fh
		jmp	short loc_351B2
; ���������������������������������������������������������������������������

loc_351A6:				; CODE XREF: seg131:1134j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_351AB:				; CODE XREF: seg131:113Bj
		mov	word ptr ss:4882h, 987h

loc_351B2:				; CODE XREF: seg131:111Fj seg131:112Dj ...
		xor	dx, dx

loc_351B4:				; CODE XREF: seg131:11DFj
		mov	ss:4624h, dx
		mov	ss:4708h, bx
		mov	ss:470Ah, bp

loc_351C3:				; CODE XREF: seg131:loc_351F6j
					; seg131:119Dj
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_351CB
		jmp	short loc_35242
; ���������������������������������������������������������������������������

loc_351CB:				; CODE XREF: seg131:1167j
		mov	dx, [si+4]
		cmp	dx, ss:46EEh
		jz	short loc_351F8
		jl	short loc_351D9
		jmp	short loc_351FF
; ���������������������������������������������������������������������������

loc_351D9:				; CODE XREF: seg131:1175j
		add	si, 6
		shr	ax, 1
		jb	short loc_351E4
		add	si, ax
		jmp	short loc_351F6
; ���������������������������������������������������������������������������

loc_351E4:				; CODE XREF: seg131:117Ej
		push	di
		mov	di, ax

loc_351E7:				; CODE XREF: seg131:1193j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_351F1
		add	si, ax
		dec	si

loc_351F1:				; CODE XREF: seg131:118Cj
		sub	di, ax
		jnz	short loc_351E7
		pop	di

loc_351F6:				; CODE XREF: seg131:1182j
		jmp	short loc_351C3
; ���������������������������������������������������������������������������

loc_351F8:				; CODE XREF: seg131:1173j
		call	word ptr ss:4882h
		jmp	short loc_351C3
; ���������������������������������������������������������������������������

loc_351FF:				; CODE XREF: seg131:1177j
		mov	bx, ss:4708h
		mov	bp, ss:470Ah
		mov	dx, ss:4624h

loc_3520E:				; CODE XREF: seg131:11D1j
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_35242
		mov	ax, 0
		add	dl, ch
		jnb	short loc_3522F
		inc	bx
		cmp	cl, ch
		jl	short loc_35229
		mov	ax, 2

loc_35229:				; CODE XREF: seg131:11C4j
		add	dh, cl
		jb	short loc_35233
		jmp	short loc_3523B
; ���������������������������������������������������������������������������

loc_3522F:				; CODE XREF: seg131:11BFj
		add	dh, cl
		jnb	short loc_3520E

loc_35233:				; CODE XREF: seg131:11CBj
		inc	bp
		cmp	cl, ch
		jge	short loc_3523B
		mov	ax, 2

loc_3523B:				; CODE XREF: seg131:11CDj seg131:11D6j
		mov	ss:462Ah, ax
		jmp	loc_351B4
; ���������������������������������������������������������������������������

loc_35242:				; CODE XREF: seg131:1169j seg131:11B8j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
seg131		ends
