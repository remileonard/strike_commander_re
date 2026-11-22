seg134		segment	byte public 'CODE' use16
		assume cs:seg134
		;org 4
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_383C4:				; DATA XREF: dseg:465Co
		call	sub_392D0

loc_383C9:				; DATA XREF: seg170:0506o
		jb	short loc_383E4
		mov	ax, ss:46FCh
		mov	ss:4708h, ax
		call	sub_38BB6
		jnb	short loc_383E9
		mov	word ptr ss:4882h, 652h
		jmp	loc_3848E
; ���������������������������������������������������������������������������

loc_383E4:				; CODE XREF: seg134:loc_383C9j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_383E9:				; CODE XREF: seg134:0018j
		mov	word ptr ss:4882h, 3D0h
		jmp	short loc_38416
; ���������������������������������������������������������������������������

loc_383F2:				; DATA XREF: dseg:463Co
		call	sub_392C3
		jb	short loc_3840A
		call	sub_38BB6
		jnb	short loc_3840F
		mov	word ptr ss:4882h, 4AAh
		jmp	loc_3848E
; ���������������������������������������������������������������������������

loc_3840A:				; CODE XREF: seg134:0037j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3840F:				; CODE XREF: seg134:003Ej
		mov	word ptr ss:4882h, 2F3h

loc_38416:				; CODE XREF: seg134:0030j
		mov	ax, ss:470Ah
		shl	ax, 1
		add	ax, ss:4735h
		mov	ss:470Ah, ax

loc_38425:				; CODE XREF: seg134:00C7j
		xor	ax, ax
		add	ss:4627h, bl
		adc	al, bh
		mov	ss:4723h, al

loc_38432:				; CODE XREF: seg134:loc_38465j
					; seg134:00ACj
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_3843A
		jmp	short loc_38489
; ���������������������������������������������������������������������������

loc_3843A:				; CODE XREF: seg134:0076j
		mov	di, ss:46EEh
		cmp	[si+4],	di
		jz	short loc_38467
		jl	short loc_38448
		jmp	short loc_3846E
; ���������������������������������������������������������������������������

loc_38448:				; CODE XREF: seg134:0084j
		add	si, 6
		shr	ax, 1
		jb	short loc_38453
		add	si, ax
		jmp	short loc_38465
; ���������������������������������������������������������������������������

loc_38453:				; CODE XREF: seg134:008Dj
		push	di
		mov	di, ax

loc_38456:				; CODE XREF: seg134:00A2j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_38460
		add	si, ax
		dec	si

loc_38460:				; CODE XREF: seg134:009Bj
		sub	di, ax
		jnz	short loc_38456
		pop	di

loc_38465:				; CODE XREF: seg134:0091j
		jmp	short loc_38432
; ���������������������������������������������������������������������������

loc_38467:				; CODE XREF: seg134:0082j
		call	word ptr ss:4882h
		jmp	short loc_38432
; ���������������������������������������������������������������������������

loc_3846E:				; CODE XREF: seg134:0086j
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_38489
		xor	ax, ax
		mov	al, ss:4723h
		shl	ax, 1
		add	ss:470Ah, ax
		jmp	short loc_38425
; ���������������������������������������������������������������������������

loc_38489:				; CODE XREF: seg134:0078j seg134:00B8j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3848E:				; CODE XREF: seg134:0021j seg134:0047j
		mov	ax, ss:470Ah
		cmp	ax, ss:4739h
		jge	short loc_384C4
		mov	dx, ss:4739h

loc_3849E:				; CODE XREF: seg134:00F7j
		xor	cx, cx
		add	ss:4627h, bl
		adc	cl, bh
		add	ax, cx
		cmp	ax, dx
		jg	short loc_384BB
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jnz	short loc_3849E
		jmp	short loc_3852F
; ���������������������������������������������������������������������������

loc_384BB:				; CODE XREF: seg134:00EBj
		mov	ss:470Ah, dx
		sub	ax, dx
		jmp	short loc_384CD
; ���������������������������������������������������������������������������

loc_384C4:				; CODE XREF: seg134:00D7j seg134:016Dj
		xor	ax, ax
		add	ss:4627h, bl
		adc	al, bh

loc_384CD:				; CODE XREF: seg134:0102j
		mov	ss:4723h, al

loc_384D1:				; CODE XREF: seg134:loc_38504j
					; seg134:014Bj
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_384D9
		jmp	short loc_3852F
; ���������������������������������������������������������������������������

loc_384D9:				; CODE XREF: seg134:0115j
		mov	di, ss:46EEh
		cmp	[si+4],	di
		jz	short loc_38506
		jl	short loc_384E7
		jmp	short loc_3850D
; ���������������������������������������������������������������������������

loc_384E7:				; CODE XREF: seg134:0123j
		add	si, 6
		shr	ax, 1
		jb	short loc_384F2
		add	si, ax
		jmp	short loc_38504
; ���������������������������������������������������������������������������

loc_384F2:				; CODE XREF: seg134:012Cj
		push	di
		mov	di, ax

loc_384F5:				; CODE XREF: seg134:0141j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_384FF
		add	si, ax
		dec	si

loc_384FF:				; CODE XREF: seg134:013Aj
		sub	di, ax
		jnz	short loc_384F5
		pop	di

loc_38504:				; CODE XREF: seg134:0130j
		jmp	short loc_384D1
; ���������������������������������������������������������������������������

loc_38506:				; CODE XREF: seg134:0121j
		call	word ptr ss:4882h
		jmp	short loc_384D1
; ���������������������������������������������������������������������������

loc_3850D:				; CODE XREF: seg134:0125j
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_3852F
		xor	ax, ax
		mov	al, ss:4723h
		add	ax, ss:470Ah
		mov	ss:470Ah, ax
		cmp	ax, ss:473Dh
		jle	short loc_384C4

loc_3852F:				; CODE XREF: seg134:00F9j seg134:0117j ...
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_38534:				; DATA XREF: dseg:467Co
		call	loc_392DD
		jb	short loc_3854C
		call	sub_38BB6
		jnb	short loc_38551
		mov	word ptr ss:4882h, 4AAh
		jmp	loc_385F6
; ���������������������������������������������������������������������������

loc_3854C:				; CODE XREF: seg134:0179j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_38551:				; CODE XREF: seg134:0180j
		mov	word ptr ss:4882h, 2F3h
		jmp	short loc_38585
; ���������������������������������������������������������������������������

loc_3855A:				; DATA XREF: dseg:469Co
		call	loc_392EA
		jb	short loc_38579
		mov	ax, ss:46FCh
		mov	ss:4708h, ax
		call	sub_38BB6
		jnb	short loc_3857E
		mov	word ptr ss:4882h, 652h
		jmp	short loc_385F6
; ���������������������������������������������������������������������������

loc_38579:				; CODE XREF: seg134:019Fj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3857E:				; CODE XREF: seg134:01AEj
		mov	word ptr ss:4882h, 3D0h

loc_38585:				; CODE XREF: seg134:0198j
		mov	ax, ss:46FEh
		inc	ax
		shl	ax, 1
		add	ax, ss:4735h
		mov	ss:470Ah, ax

loc_38595:				; CODE XREF: seg134:022Fj
		xor	ax, ax
		add	ss:4627h, bl
		adc	al, bh
		mov	ss:4723h, al
		shl	ax, 1
		sub	ss:470Ah, ax

loc_385A9:				; CODE XREF: seg134:loc_385DCj
					; seg134:0223j
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_385B1
		jmp	short loc_385F1
; ���������������������������������������������������������������������������

loc_385B1:				; CODE XREF: seg134:01EDj
		mov	di, ss:46EEh
		cmp	[si+4],	di
		jz	short loc_385DE
		jl	short loc_385BF
		jmp	short loc_385E5
; ���������������������������������������������������������������������������

loc_385BF:				; CODE XREF: seg134:01FBj
		add	si, 6
		shr	ax, 1
		jb	short loc_385CA
		add	si, ax
		jmp	short loc_385DC
; ���������������������������������������������������������������������������

loc_385CA:				; CODE XREF: seg134:0204j
		push	di
		mov	di, ax

loc_385CD:				; CODE XREF: seg134:0219j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_385D7
		add	si, ax
		dec	si

loc_385D7:				; CODE XREF: seg134:0212j
		sub	di, ax
		jnz	short loc_385CD
		pop	di

loc_385DC:				; CODE XREF: seg134:0208j
		jmp	short loc_385A9
; ���������������������������������������������������������������������������

loc_385DE:				; CODE XREF: seg134:01F9j
		call	word ptr ss:4882h
		jmp	short loc_385A9
; ���������������������������������������������������������������������������

loc_385E5:				; CODE XREF: seg134:01FDj
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jnz	short loc_38595

loc_385F1:				; CODE XREF: seg134:01EFj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_385F6:				; CODE XREF: seg134:0189j seg134:01B7j
		mov	ax, ss:46FEh
		inc	ax
		mov	ss:470Ah, ax
		cmp	ax, ss:473Dh
		jle	short loc_38631
		mov	dx, ss:473Dh

loc_3860B:				; CODE XREF: seg134:0264j
		xor	cx, cx
		add	ss:4627h, bl
		adc	cl, bh
		sub	ax, cx
		cmp	ax, dx
		jle	short loc_38629
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jnz	short loc_3860B
		jmp	loc_386AE
; ���������������������������������������������������������������������������

loc_38629:				; CODE XREF: seg134:0258j
		mov	ss:470Ah, ax
		mov	cx, ax
		jmp	short loc_38657
; ���������������������������������������������������������������������������

loc_38631:				; CODE XREF: seg134:0244j seg134:02ECj
		xor	ax, ax
		add	ss:4627h, bl
		adc	al, bh
		sub	ss:470Ah, ax
		mov	dx, ss:4739h
		sub	dx, ss:470Ah
		jle	short loc_38657
		sub	ax, dx
		mov	dx, ss:4739h
		mov	ss:470Ah, dx

loc_38657:				; CODE XREF: seg134:026Fj seg134:0289j
		mov	ss:4723h, al

loc_3865B:				; CODE XREF: seg134:loc_3868Cj
					; seg134:02D3j
		mov	ax, [si]
		or	ax, ax
		jz	short loc_386AE
		mov	di, ss:46EEh
		cmp	[si+4],	di
		jz	short loc_3868E
		jl	short loc_3866F
		jmp	short loc_38695
; ���������������������������������������������������������������������������

loc_3866F:				; CODE XREF: seg134:02ABj
		add	si, 6
		shr	ax, 1
		jb	short loc_3867A
		add	si, ax
		jmp	short loc_3868C
; ���������������������������������������������������������������������������

loc_3867A:				; CODE XREF: seg134:02B4j
		push	di
		mov	di, ax

loc_3867D:				; CODE XREF: seg134:02C9j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_38687
		add	si, ax
		dec	si

loc_38687:				; CODE XREF: seg134:02C2j
		sub	di, ax
		jnz	short loc_3867D
		pop	di

loc_3868C:				; CODE XREF: seg134:02B8j
		jmp	short loc_3865B
; ���������������������������������������������������������������������������

loc_3868E:				; CODE XREF: seg134:02A9j
		call	word ptr ss:4882h
		jmp	short loc_3865B
; ���������������������������������������������������������������������������

loc_38695:				; CODE XREF: seg134:02ADj
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_386AE
		xor	ax, ax
		mov	ax, ss:470Ah
		cmp	ax, ss:4739h
		jg	short loc_38631

loc_386AE:				; CODE XREF: seg134:0266j seg134:029Fj ...
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		mov	ax, [si+2]
		add	ax, ss:4702h
		mul	bx
		add	al, ss:4626h
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		add	ax, ss:4708h
		mov	ss:470Ch, ax
		mov	di, ss:470Ah
		mov	di, ss:[di]
		add	di, ax
		xor	bp, bp
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jb	short loc_38734
		mov	ah, al
		xor	cx, cx

loc_386F2:				; CODE XREF: seg134:033Dj
		lodsb
		add	dl, bl
		adc	cl, bh
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_386F2

loc_386FF:				; CODE XREF: seg134:03CDj
		mov	dh, ss:4723h
		dec	dh
		jz	short locret_38733
		push	si
		push	ds
		push	es
		pop	ds
		mov	ax, bp
		mov	bp, ss:470Ah

loc_38713:				; CODE XREF: seg134:036Fj
		mov	si, ss:470Ch
		mov	di, si
		add	si, [bp+0]
		add	bp, 2
		add	di, [bp+0]
		mov	cx, ax
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		dec	dh
		jnz	short loc_38713
		pop	ds
		pop	si

locret_38733:				; CODE XREF: seg134:0346j
		retn
; ���������������������������������������������������������������������������

loc_38734:				; CODE XREF: seg134:032Cj
		mov	bx, ax

loc_38736:				; CODE XREF: seg134:039Aj seg134:03C6j
		lodsb
		shr	al, 1
		cbw
		jb	short loc_3875E
		sub	bx, ax
		mov	ah, al
		xor	cx, cx

loc_38742:				; CODE XREF: seg134:0396j
		lodsb
		add	dl, ss:4720h
		adc	cl, ss:4721h
		adc	ch, 0
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_38742
		or	bl, bl
		jnz	short loc_38736
		jmp	short loc_38788
; ���������������������������������������������������������������������������

loc_3875E:				; CODE XREF: seg134:037Aj
		sub	bx, ax
		mov	cx, dx
		mul	word ptr ss:4720h
		add	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, cx
		mov	cx, ax
		lodsb
		mov	ah, al
		add	bp, cx
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bl, bl
		jnz	short loc_38736

loc_38788:				; CODE XREF: seg134:039Cj
		mov	bx, ss:4720h
		jmp	loc_386FF
; ���������������������������������������������������������������������������
		mov	ax, [si+2]
		add	ax, ss:4702h
		mul	bx
		add	al, ss:4626h
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dl, cl
		neg	ax
		add	ax, ss:4708h
		mov	ss:470Ch, ax
		mov	di, ss:470Ah
		mov	di, ss:[di]
		add	di, ax
		xor	bp, bp
		std
		mov	ax, [si]
		add	si, 6
		shr	ax, 1
		jb	short loc_38811
		mov	ah, al
		xor	cx, cx

loc_387D2:				; CODE XREF: seg134:041Fj
		mov	al, [si]
		inc	si
		add	dl, bl
		adc	cl, bh
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_387D2

loc_387E1:				; CODE XREF: seg134:04A7j
		mov	dh, ss:4723h
		dec	dh
		jz	short loc_3880F
		push	si
		push	ds
		push	es
		pop	ds
		mov	ax, bp
		mov	bp, ss:470Ah

loc_387F5:				; CODE XREF: seg134:044Bj
		mov	si, ss:470Ch
		mov	di, si
		add	si, [bp+0]
		add	bp, 2
		add	di, [bp+0]
		mov	cx, ax
		rep movsb
		dec	dh
		jnz	short loc_387F5
		pop	ds
		pop	si

loc_3880F:				; CODE XREF: seg134:0428j
		cld
		retn
; ���������������������������������������������������������������������������

loc_38811:				; CODE XREF: seg134:040Cj
		mov	bx, ax

loc_38813:				; CODE XREF: seg134:0478j seg134:04A0j
		mov	al, [si]
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3883C
		sub	bx, ax
		mov	ah, al
		xor	cx, cx

loc_38821:				; CODE XREF: seg134:0474j
		mov	al, [si]
		inc	si
		add	dl, ss:4720h
		adc	cl, ss:4721h
		add	bp, cx
		rep stosb
		dec	ah
		jnz	short loc_38821
		or	bl, bl
		jnz	short loc_38813
		jmp	short loc_38862
; ���������������������������������������������������������������������������

loc_3883C:				; CODE XREF: seg134:0459j
		sub	bx, ax
		mov	cx, dx
		mul	word ptr ss:4720h
		add	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, cx
		mov	cx, ax
		mov	al, [si]
		inc	si
		mov	ah, al
		add	bp, cx
		rep stosb
		or	bl, bl
		jnz	short loc_38813

loc_38862:				; CODE XREF: seg134:047Aj
		mov	bx, ss:4720h
		jmp	loc_387E1
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_388B9
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_38883:				; CODE XREF: seg134:04D5j seg134:04E8j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_38899
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_38883
		jz	short loc_388AA

loc_38899:				; CODE XREF: seg134:04C9j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_38883

loc_388AA:				; CODE XREF: seg134:04D7j
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_47740
		mov	si, 4742h
		jmp	short loc_388C5
; ���������������������������������������������������������������������������

loc_388B9:				; CODE XREF: seg134:04B0j
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_388C5:				; CODE XREF: seg134:04F7j
		add	ax, ss:4702h
		xor	ch, ch
		mul	bx
		add	al, ss:4626h
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4708h
		mov	di, ax
		cmp	ax, ss:473Bh
		jle	short loc_388F0

loc_388ED:				; CODE XREF: seg134:0549j seg134:0594j ...
		jmp	loc_38A0F
; ���������������������������������������������������������������������������

loc_388F0:				; CODE XREF: seg134:052Bj
		mov	ax, ss:4729h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:4737h
		jl	short loc_388ED
		cmp	ax, ss:473Bh
		jle	short loc_38935
		mov	ax, ss:473Bh
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
		jz	short loc_38931
		mov	ch, 1

loc_38931:				; CODE XREF: seg134:056Dj
		mov	ss:4729h, ax

loc_38935:				; CODE XREF: seg134:0550j
		mov	ax, di
		sub	ax, ss:4737h
		jge	short loc_38986
		or	ax, ax
		jns	short loc_38944
		neg	ax

loc_38944:				; CODE XREF: seg134:0580j
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		jb	short loc_388ED
		div	bx
		sub	ss:4729h, ax
		jb	short loc_388ED
		add	si, ax
		mul	bx
		add	al, cl
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		mov	di, ss:4737h
		sub	ax, di
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	cl, al
		jmp	short loc_3898E
; ���������������������������������������������������������������������������

loc_38986:				; CODE XREF: seg134:057Cj
		mov	dx, cx
		xor	cx, cx
		add	dl, bl
		adc	cl, bh

loc_3898E:				; CODE XREF: seg134:05C4j
		mov	ax, di
		mov	di, ss:470Ah
		shl	di, 1
		add	di, ss:4735h
		mov	di, ss:[di]
		add	di, ax
		push	ax
		mov	ss:470Ch, di
		xor	bp, bp
		mov	ah, ss:4729h
		or	ah, ah
		jz	short loc_389BF

loc_389B2:				; CODE XREF: seg134:05FDj
		lodsb
		add	bp, cx
		rep stosb
		add	dl, bl
		adc	cl, bh
		dec	ah
		jnz	short loc_389B2

loc_389BF:				; CODE XREF: seg134:05F0j
		pop	ax
		or	dh, dh
		jz	short loc_389D9
		add	ax, bp
		stc
		sbb	ax, ss:473Bh
		or	ax, ax
		jns	short loc_389D2
		neg	ax

loc_389D2:				; CODE XREF: seg134:060Ej
		mov	cx, ax
		add	bp, cx
		lodsb
		rep stosb

loc_389D9:				; CODE XREF: seg134:0602j
		mov	dh, ss:4723h
		dec	dh
		jz	short loc_38A0F
		push	es
		pop	ds
		mov	ax, ss:470Ah

loc_389E8:				; CODE XREF: seg134:064Dj
		inc	ax
		cmp	ax, ss:473Dh
		jg	short loc_38A0F
		mov	si, ss:470Ch
		mov	di, si
		add	di, ss:473Fh
		mov	ss:470Ch, di
		mov	cx, bp
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		dec	dh
		jnz	short loc_389E8

loc_38A0F:				; CODE XREF: seg134:loc_388EDj
					; seg134:0620j	...
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_38A61
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_38A2B:				; CODE XREF: seg134:067Dj seg134:0690j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_38A41
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_38A2B
		jz	short loc_38A52

loc_38A41:				; CODE XREF: seg134:0671j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_38A2B

loc_38A52:				; CODE XREF: seg134:067Fj
		pop	es
		pop	ax
		push	si
		push	ds
		push	ss
		pop	ds
		mov	bx, word_47740
		mov	si, 4742h
		jmp	short loc_38A6D
; ���������������������������������������������������������������������������

loc_38A61:				; CODE XREF: seg134:0658j
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_38A6D:				; CODE XREF: seg134:069Fj
		add	ax, ss:4702h
		xor	ch, ch
		mul	bx
		add	al, ss:4626h
		mov	cl, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:4708h
		mov	di, ax
		cmp	ax, ss:4737h
		jge	short loc_38A9A

loc_38A97:				; CODE XREF: seg134:06F5j seg134:0742j
		jmp	loc_38BB1
; ���������������������������������������������������������������������������

loc_38A9A:				; CODE XREF: seg134:06D5j
		mov	ax, ss:4729h
		mul	bx
		add	al, cl
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:473Bh
		jg	short loc_38A97
		cmp	ax, ss:4737h
		jge	short loc_38AE2
		mov	ax, di
		inc	ax
		sub	ax, ss:4737h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		or	dx, dx
		jz	short loc_38ADE
		mov	ch, 1

loc_38ADE:				; CODE XREF: seg134:071Aj
		mov	ss:4729h, ax

loc_38AE2:				; CODE XREF: seg134:06FCj
		mov	ax, di
		sub	ax, ss:473Bh
		jle	short loc_38B2F
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, cl
		sbb	ah, 0
		sbb	dx, 0
		div	bx
		sub	ss:4729h, ax
		jle	short loc_38A97
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
		mov	di, ss:473Bh
		sub	ax, di
		neg	ax
		mov	dx, cx
		add	dl, bl
		adc	al, bh
		xor	cx, cx
		mov	cl, al
		jmp	short loc_38B37
; ���������������������������������������������������������������������������

loc_38B2F:				; CODE XREF: seg134:0729j
		mov	dx, cx
		xor	cx, cx
		add	dl, bl
		adc	cl, bh

loc_38B37:				; CODE XREF: seg134:076Dj
		mov	ax, di
		mov	di, ss:470Ah
		shl	di, 1
		add	di, ss:4735h
		mov	di, ss:[di]
		add	di, ax
		push	ax
		mov	ss:470Ch, di
		std
		xor	bp, bp
		mov	ah, ss:4729h
		or	ah, ah
		jz	short loc_38B6B

loc_38B5C:				; CODE XREF: seg134:07A9j
		mov	al, [si]
		inc	si
		add	bp, cx
		rep stosb
		add	dl, bl
		adc	cl, bh
		dec	ah
		jnz	short loc_38B5C

loc_38B6B:				; CODE XREF: seg134:079Aj
		pop	ax
		or	dh, dh
		jz	short loc_38B81
		sub	ax, bp
		inc	ax
		sub	ax, ss:4737h
		mov	cx, ax
		add	bp, cx
		mov	al, [si]
		inc	si
		rep stosb

loc_38B81:				; CODE XREF: seg134:07AEj
		mov	dh, ss:4723h
		dec	dh
		jz	short loc_38BB1
		push	es
		pop	ds
		mov	ax, ss:470Ah

loc_38B90:				; CODE XREF: seg134:07EFj
		inc	ax
		cmp	ax, ss:473Dh
		jg	short loc_38BB1
		mov	si, ss:470Ch
		mov	di, si
		add	di, ss:473Fh
		mov	ss:470Ch, di
		mov	cx, bp
		rep movsb
		dec	dh
		jnz	short loc_38B90

loc_38BB1:				; CODE XREF: seg134:loc_38A97j
					; seg134:07C8j	...
		cld
		pop	ds
		pop	si
		retn
seg134		ends
