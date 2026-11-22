seg137		segment	byte public 'CODE' use16
		assume cs:seg137
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_3A18C:				; DATA XREF: seg170:051Eo dseg:4664o
		call	sub_3969B
		jb	short loc_3A1B4
		mov	ax, ss:46FCh
		mov	ss:4708h, ax
		mov	ax, ss:46FEh
		mov	ss:470Ah, ax
		call	sub_38BB6
		jnb	short loc_3A1B9
		mov	word ptr ss:4882h, 606h
		jmp	loc_3A24D
; ���������������������������������������������������������������������������

loc_3A1B4:				; CODE XREF: seg137:0011j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A1B9:				; CODE XREF: seg137:0028j
		mov	word ptr ss:4882h, 3AFh
		jmp	short loc_3A1ED
; ���������������������������������������������������������������������������

loc_3A1C2:				; DATA XREF: dseg:4644o
		call	sub_3968E
		jb	short loc_3A1E1
		mov	ax, ss:46FCh
		mov	ss:4708h, ax
		call	sub_38BB6
		jnb	short loc_3A1E6
		mov	word ptr ss:4882h, 467h
		jmp	short loc_3A24D
; ���������������������������������������������������������������������������

loc_3A1E1:				; CODE XREF: seg137:0047j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A1E6:				; CODE XREF: seg137:0056j
		mov	word ptr ss:4882h, 2F9h

loc_3A1ED:				; CODE XREF: seg137:0040j
		inc	word ptr ss:4708h

loc_3A1F2:				; CODE XREF: seg137:00C6j
		xor	ax, ax
		add	ss:4626h, bl
		adc	al, bh
		mov	ss:4723h, al
		sub	ss:4708h, ax

loc_3A204:				; CODE XREF: seg137:loc_3A233j
					; seg137:00BAj
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3A248
		mov	di, ss:46EEh
		cmp	[si+4],	di
		jz	short loc_3A235
		jg	short loc_3A23C
		add	si, 6
		shr	ax, 1
		jb	short loc_3A221
		add	si, ax
		jmp	short loc_3A233
; ���������������������������������������������������������������������������

loc_3A221:				; CODE XREF: seg137:009Bj
		push	di
		mov	di, ax

loc_3A224:				; CODE XREF: seg137:00B0j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3A22E
		add	si, ax
		dec	si

loc_3A22E:				; CODE XREF: seg137:00A9j
		sub	di, ax
		jnz	short loc_3A224
		pop	di

loc_3A233:				; CODE XREF: seg137:009Fj
		jmp	short loc_3A204
; ���������������������������������������������������������������������������

loc_3A235:				; CODE XREF: seg137:0092j
		call	word ptr ss:4882h
		jmp	short loc_3A204
; ���������������������������������������������������������������������������

loc_3A23C:				; CODE XREF: seg137:0094j
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jnz	short loc_3A1F2

loc_3A248:				; CODE XREF: seg137:0088j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A24D:				; CODE XREF: seg137:0031j seg137:005Fj
		mov	ax, ss:4708h
		inc	ax
		mov	ss:4708h, ax
		cmp	ax, ss:473Bh
		jle	short loc_3A28F
		mov	dx, ss:473Bh

loc_3A262:				; CODE XREF: seg137:00FBj
		xor	cx, cx
		add	ss:4626h, bl
		adc	cl, bh
		sub	ax, cx
		cmp	ax, dx
		jle	short loc_3A280
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jnz	short loc_3A262
		jmp	loc_3A30B
; ���������������������������������������������������������������������������

loc_3A280:				; CODE XREF: seg137:00EFj
		mov	ss:4708h, ax
		sub	ax, dx
		or	ax, ax
		jns	short loc_3A28C
		neg	ax

loc_3A28C:				; CODE XREF: seg137:0108j
		inc	ax
		jmp	short loc_3A2B8
; ���������������������������������������������������������������������������

loc_3A28F:				; CODE XREF: seg137:00DBj seg137:0189j
		xor	ax, ax
		add	ss:4626h, bl
		adc	al, bh
		adc	ah, 0
		sub	ss:4708h, ax
		mov	cx, ss:4737h
		sub	cx, ss:4708h
		jle	short loc_3A2B8
		sub	ax, cx
		mov	cx, ss:4737h
		mov	ss:4708h, cx

loc_3A2B8:				; CODE XREF: seg137:010Dj seg137:012Aj
		mov	ss:4723h, al

loc_3A2BC:				; CODE XREF: seg137:loc_3A2EBj
					; seg137:0172j
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3A30B
		mov	di, ss:46EEh
		cmp	[si+4],	di
		jz	short loc_3A2ED
		jg	short loc_3A2F4
		add	si, 6
		shr	ax, 1
		jb	short loc_3A2D9
		add	si, ax
		jmp	short loc_3A2EB
; ���������������������������������������������������������������������������

loc_3A2D9:				; CODE XREF: seg137:0153j
		push	di
		mov	di, ax

loc_3A2DC:				; CODE XREF: seg137:0168j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3A2E6
		add	si, ax
		dec	si

loc_3A2E6:				; CODE XREF: seg137:0161j
		sub	di, ax
		jnz	short loc_3A2DC
		pop	di

loc_3A2EB:				; CODE XREF: seg137:0157j
		jmp	short loc_3A2BC
; ���������������������������������������������������������������������������

loc_3A2ED:				; CODE XREF: seg137:014Aj
		call	word ptr ss:4882h
		jmp	short loc_3A2BC
; ���������������������������������������������������������������������������

loc_3A2F4:				; CODE XREF: seg137:014Cj
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_3A30B
		mov	ax, ss:4708h
		cmp	ax, ss:4737h
		jg	short loc_3A28F

loc_3A30B:				; CODE XREF: seg137:00FDj seg137:0140j ...
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A310:				; DATA XREF: dseg:4684o
		call	loc_396A8
		jb	short loc_3A328
		call	sub_38BB6
		jnb	short loc_3A32D
		mov	word ptr ss:4882h, 467h
		jmp	loc_3A3C2
; ���������������������������������������������������������������������������

loc_3A328:				; CODE XREF: seg137:0195j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A32D:				; CODE XREF: seg137:019Cj
		mov	word ptr ss:4882h, 2F9h
		jmp	short loc_3A361
; ���������������������������������������������������������������������������

loc_3A336:				; DATA XREF: dseg:46A4o
		call	loc_396B5
		jb	short loc_3A355
		mov	ax, ss:46FEh
		mov	ss:470Ah, ax
		call	sub_38BB6
		jnb	short loc_3A35A
		mov	word ptr ss:4882h, 606h
		jmp	short loc_3A3C2
; ���������������������������������������������������������������������������

loc_3A355:				; CODE XREF: seg137:01BBj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A35A:				; CODE XREF: seg137:01CAj
		mov	word ptr ss:4882h, 3AFh

loc_3A361:				; CODE XREF: seg137:01B4j seg137:023Bj
		xor	ax, ax
		add	ss:4626h, bl
		adc	al, bh
		mov	ss:4723h, al

loc_3A36E:				; CODE XREF: seg137:loc_3A39Dj
					; seg137:0224j
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3A3BD
		mov	di, ss:46EEh
		cmp	[si+4],	di
		jz	short loc_3A39F
		jg	short loc_3A3A6
		add	si, 6
		shr	ax, 1
		jb	short loc_3A38B
		add	si, ax
		jmp	short loc_3A39D
; ���������������������������������������������������������������������������

loc_3A38B:				; CODE XREF: seg137:0205j
		push	di
		mov	di, ax

loc_3A38E:				; CODE XREF: seg137:021Aj
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3A398
		add	si, ax
		dec	si

loc_3A398:				; CODE XREF: seg137:0213j
		sub	di, ax
		jnz	short loc_3A38E
		pop	di

loc_3A39D:				; CODE XREF: seg137:0209j
		jmp	short loc_3A36E
; ���������������������������������������������������������������������������

loc_3A39F:				; CODE XREF: seg137:01FCj
		call	word ptr ss:4882h
		jmp	short loc_3A36E
; ���������������������������������������������������������������������������

loc_3A3A6:				; CODE XREF: seg137:01FEj
		xor	ax, ax
		mov	al, ss:4723h
		add	ss:4708h, ax
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jnz	short loc_3A361

loc_3A3BD:				; CODE XREF: seg137:01F2j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A3C2:				; CODE XREF: seg137:01A5j seg137:01D3j
		mov	ax, ss:4708h
		cmp	ax, ss:4737h
		jge	short loc_3A3F9
		mov	dx, ss:4737h

loc_3A3D2:				; CODE XREF: seg137:026Bj
		xor	cx, cx
		add	ss:4626h, bl
		adc	cl, bh
		add	ax, cx
		cmp	ax, dx
		jg	short loc_3A3F0
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jnz	short loc_3A3D2
		jmp	loc_3A474
; ���������������������������������������������������������������������������

loc_3A3F0:				; CODE XREF: seg137:025Fj
		sub	ax, dx
		mov	ss:4708h, dx
		jmp	short loc_3A416
; ���������������������������������������������������������������������������

loc_3A3F9:				; CODE XREF: seg137:024Bj seg137:02F2j
		xor	ax, ax
		add	ss:4626h, bl
		adc	al, bh
		adc	ah, 0
		mov	cx, ss:473Bh
		inc	cx
		sub	cx, ax
		sub	cx, ss:4708h
		jge	short loc_3A416
		add	ax, cx

loc_3A416:				; CODE XREF: seg137:0277j seg137:0292j
		mov	ss:4723h, al

loc_3A41A:				; CODE XREF: seg137:loc_3A449j
					; seg137:02D0j
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3A474
		mov	di, ss:46EEh
		cmp	[si+4],	di
		jz	short loc_3A44B
		jg	short loc_3A452
		add	si, 6
		shr	ax, 1
		jb	short loc_3A437
		add	si, ax
		jmp	short loc_3A449
; ���������������������������������������������������������������������������

loc_3A437:				; CODE XREF: seg137:02B1j
		push	di
		mov	di, ax

loc_3A43A:				; CODE XREF: seg137:02C6j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3A444
		add	si, ax
		dec	si

loc_3A444:				; CODE XREF: seg137:02BFj
		sub	di, ax
		jnz	short loc_3A43A
		pop	di

loc_3A449:				; CODE XREF: seg137:02B5j
		jmp	short loc_3A41A
; ���������������������������������������������������������������������������

loc_3A44B:				; CODE XREF: seg137:02A8j
		call	word ptr ss:4882h
		jmp	short loc_3A41A
; ���������������������������������������������������������������������������

loc_3A452:				; CODE XREF: seg137:02AAj
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_3A474
		xor	ax, ax
		mov	al, ss:4723h
		add	ss:4708h, ax
		mov	ax, ss:4708h
		cmp	ax, ss:473Bh
		jle	short loc_3A3F9

loc_3A474:				; CODE XREF: seg137:026Dj seg137:029Ej ...
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_3A4C8
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_3A492:				; CODE XREF: seg137:0324j seg137:0337j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3A4A8
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3A492
		jz	short loc_3A4B9

loc_3A4A8:				; CODE XREF: seg137:0318j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3A492

loc_3A4B9:				; CODE XREF: seg137:0326j
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_47740
		mov	si, 4742h
		jmp	short loc_3A4D4
; ���������������������������������������������������������������������������

loc_3A4C8:				; CODE XREF: seg137:02FFj
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3A4D4:				; CODE XREF: seg137:0346j
		add	ax, ss:4702h
		mul	bx
		add	al, ss:4627h
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		add	ax, ss:470Ah
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:4708h
		mov	ah, ss:4729h
		xor	cx, cx
		mov	cl, ss:4723h
		mov	bp, cx
		xor	dh, dh

loc_3A514:				; CODE XREF: seg137:03AAj
		add	dl, bl
		adc	dh, bh
		lodsb

loc_3A519:				; CODE XREF: seg137:03A6j
		rep stosb
		mov	cx, bp
		sub	di, cx
		add	di, ss:473Fh
		dec	dh
		jnz	short loc_3A519
		dec	ah
		jnz	short loc_3A514
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_3A57E
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_3A548:				; CODE XREF: seg137:03DAj seg137:03EDj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3A55E
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3A548
		jz	short loc_3A56F

loc_3A55E:				; CODE XREF: seg137:03CEj
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3A548

loc_3A56F:				; CODE XREF: seg137:03DCj
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_47740
		mov	si, 4742h
		jmp	short loc_3A58A
; ���������������������������������������������������������������������������

loc_3A57E:				; CODE XREF: seg137:03B5j
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3A58A:				; CODE XREF: seg137:03FCj
		add	ax, ss:4702h
		mul	bx
		add	al, ss:4627h
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		neg	ax
		add	ax, ss:470Ah
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:4708h
		mov	ah, ss:4729h
		xor	cx, cx
		mov	cl, ss:4723h
		mov	bp, cx
		xor	dh, dh

loc_3A5CC:				; CODE XREF: seg137:0462j
		add	dl, bl
		adc	dh, bh
		lodsb

loc_3A5D1:				; CODE XREF: seg137:045Ej
		rep stosb
		mov	cx, bp
		sub	di, cx
		sub	di, ss:473Fh
		dec	dh
		jnz	short loc_3A5D1
		dec	ah
		jnz	short loc_3A5CC
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_3A636
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_3A600:				; CODE XREF: seg137:0492j seg137:04A5j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3A616
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3A600
		jz	short loc_3A627

loc_3A616:				; CODE XREF: seg137:0486j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3A600

loc_3A627:				; CODE XREF: seg137:0494j
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_47740
		mov	si, 4742h
		jmp	short loc_3A642
; ���������������������������������������������������������������������������

loc_3A636:				; CODE XREF: seg137:046Dj
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3A642:				; CODE XREF: seg137:04B4j
		add	ax, ss:4702h
		mul	bx
		add	al, ss:4627h
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:470Ah
		mov	di, ax
		mov	byte ptr ss:4724h, 0
		cmp	ax, ss:473Dh
		jle	short loc_3A671

loc_3A66E:				; CODE XREF: seg137:050Aj
		jmp	loc_3A783
; ���������������������������������������������������������������������������

loc_3A671:				; CODE XREF: seg137:04ECj
		mov	ax, ss:4729h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:4739h
		jl	short loc_3A66E
		cmp	ax, ss:473Dh
		jle	short loc_3A6CD
		mov	ax, ss:473Dh
		inc	ax
		sub	ax, di
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		or	dx, dx
		jz	short loc_3A6B6
		or	byte ptr ss:4724h, 8

loc_3A6B6:				; CODE XREF: seg137:052Ej
		mov	ss:4729h, ax
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		mov	word_47730, ax

loc_3A6CD:				; CODE XREF: seg137:0511j
		mov	ax, di
		sub	ax, ss:4739h
		jge	short loc_3A71A
		or	ax, ax
		jns	short loc_3A6DC
		neg	ax

loc_3A6DC:				; CODE XREF: seg137:0558j
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		sub	ss:4729h, ax
		add	si, ax
		mul	bx
		add	al, cl
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		mov	di, ss:4739h
		sub	ax, di
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	dh, al
		jmp	short loc_3A722
; ���������������������������������������������������������������������������

loc_3A71A:				; CODE XREF: seg137:0554j
		mov	dx, cx
		xor	dh, dh
		add	dl, bl
		adc	dh, bh

loc_3A722:				; CODE XREF: seg137:0598j
		shl	di, 1
		add	di, ss:4735h
		mov	di, ss:[di]
		add	di, ss:4708h
		xor	cx, cx
		mov	cl, ss:4723h
		mov	bp, cx
		lodsb
		mov	ah, ss:4729h
		or	ah, ah
		jle	short loc_3A760
		or	dh, dh
		jz	short loc_3A757

loc_3A748:				; CODE XREF: seg137:05D5j seg137:05DEj
		rep stosb
		mov	cx, bp
		sub	di, cx
		add	di, ss:473Fh
		dec	dh
		jg	short loc_3A748

loc_3A757:				; CODE XREF: seg137:05C6j
		lodsb
		add	dl, bl
		adc	dh, bh
		dec	ah
		jnz	short loc_3A748

loc_3A760:				; CODE XREF: seg137:05C2j
		test	byte ptr ss:4724h, 8
		jz	short loc_3A783
		mov	dx, ss:473Dh
		inc	dx
		sub	dx, word_47730
		mov	dh, dl

loc_3A774:				; CODE XREF: seg137:0601j
		rep stosb
		mov	cx, bp
		sub	di, cx
		add	di, ss:473Fh
		dec	dh
		jnz	short loc_3A774

loc_3A783:				; CODE XREF: seg137:loc_3A66Ej
					; seg137:05E6j
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_3A7D5
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_3A79F:				; CODE XREF: seg137:0631j seg137:0644j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3A7B5
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_3A79F
		jz	short loc_3A7C6

loc_3A7B5:				; CODE XREF: seg137:0625j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_3A79F

loc_3A7C6:				; CODE XREF: seg137:0633j
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_47740
		mov	si, 4742h
		jmp	short loc_3A7E1
; ���������������������������������������������������������������������������

loc_3A7D5:				; CODE XREF: seg137:060Cj
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3A7E1:				; CODE XREF: seg137:0653j
		add	ax, ss:4702h
		mul	bx
		add	al, ss:4627h
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:470Ah
		mov	di, ax
		mov	byte ptr ss:4724h, 0
		cmp	ax, ss:4739h
		jge	short loc_3A812

loc_3A80F:				; CODE XREF: seg137:06ADj
		jmp	loc_3A927
; ���������������������������������������������������������������������������

loc_3A812:				; CODE XREF: seg137:068Dj
		mov	ax, ss:4729h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:473Dh
		jg	short loc_3A80F
		cmp	ax, ss:4739h
		jge	short loc_3A873
		mov	ax, di
		inc	ax
		sub	ax, ss:4739h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		or	dx, dx
		jz	short loc_3A85A
		or	byte ptr ss:4724h, 2

loc_3A85A:				; CODE XREF: seg137:06D2j
		mov	ss:4729h, ax
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		mov	word_47730, ax

loc_3A873:				; CODE XREF: seg137:06B4j
		mov	ax, di
		sub	ax, ss:473Dh
		jle	short loc_3A8BE
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		sub	ss:4729h, ax
		add	si, ax
		mul	bx
		add	al, cl
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		mov	di, ss:473Dh
		sub	ax, di
		neg	ax
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	dh, al
		jmp	short loc_3A8C6
; ���������������������������������������������������������������������������

loc_3A8BE:				; CODE XREF: seg137:06FAj
		mov	dx, cx
		xor	dh, dh
		add	dl, bl
		adc	dh, bh

loc_3A8C6:				; CODE XREF: seg137:073Cj
		shl	di, 1
		add	di, ss:4735h
		mov	di, ss:[di]
		add	di, ss:4708h
		xor	cx, cx
		mov	cl, ss:4723h
		mov	bp, cx
		lodsb
		mov	ah, ss:4729h
		or	ah, ah
		jle	short loc_3A904
		or	dh, dh
		jz	short loc_3A8FB

loc_3A8EC:				; CODE XREF: seg137:0779j seg137:0782j
		rep stosb
		mov	cx, bp
		sub	di, cx
		sub	di, ss:473Fh
		dec	dh
		jg	short loc_3A8EC

loc_3A8FB:				; CODE XREF: seg137:076Aj
		lodsb
		add	dl, bl
		adc	dh, bh
		dec	ah
		jnz	short loc_3A8EC

loc_3A904:				; CODE XREF: seg137:0766j
		test	byte ptr ss:4724h, 2
		jz	short loc_3A927
		mov	dx, word_47730
		inc	dx
		sub	dx, ss:4739h
		mov	dh, dl

loc_3A918:				; CODE XREF: seg137:07A5j
		rep stosb
		mov	cx, bp
		sub	di, cx
		sub	di, ss:473Fh
		dec	dh
		jnz	short loc_3A918

loc_3A927:				; CODE XREF: seg137:loc_3A80Fj
					; seg137:078Aj
		pop	ds
		pop	si
		retn
seg137		ends
