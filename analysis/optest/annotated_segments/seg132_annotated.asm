seg132		segment	byte public 'CODE' use16
		assume cs:seg132
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_35248:				; DATA XREF: dseg:4660o seg170:04F6o
		call	sub_394B5
		jb	short loc_3526D
		call	sub_38BB6
		jnb	short loc_35272
		mov	word ptr ss:4882h, 0DD9h
		mov	ax, 0EC4h
		cmp	bl, bh
		jb	short loc_35267
		mov	ax, 1202h

loc_35267:				; CODE XREF: seg132:0022j
		mov	ss:4884h, ax
		jmp	short loc_352C8
; ���������������������������������������������������������������������������

loc_3526D:				; CODE XREF: seg132:000Dj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_35272:				; CODE XREF: seg132:0014j
		mov	word ptr ss:4882h, 466h
		mov	ax, 4BDh
		cmp	bl, bh
		jb	short loc_35283
		mov	ax, 558h

loc_35283:				; CODE XREF: seg132:003Ej
		mov	ss:4884h, ax
		jmp	short loc_352C8
; ���������������������������������������������������������������������������

loc_35289:				; DATA XREF: dseg:4640o
		call	sub_39418
		jb	short loc_352AE
		call	sub_38BB6
		jnb	short loc_352B3
		mov	word ptr ss:4882h, 5F2h
		mov	ax, 6E1h
		cmp	bl, bh
		jb	short loc_352A8
		mov	ax, 0A43h

loc_352A8:				; CODE XREF: seg132:0063j
		mov	ss:4884h, ax
		jmp	short loc_352C8
; ���������������������������������������������������������������������������

loc_352AE:				; CODE XREF: seg132:004Ej
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_352B3:				; CODE XREF: seg132:0055j
		mov	word ptr ss:4882h, 2EDh
		mov	ax, 340h
		cmp	bl, bh
		jb	short loc_352C4
		mov	ax, 3CCh

loc_352C4:				; CODE XREF: seg132:007Fj
		mov	ss:4884h, ax

loc_352C8:				; CODE XREF: seg132:002Bj seg132:0047j ...
		mov	word ptr ss:4624h, 0

loc_352CF:				; CODE XREF: seg132:0170j
		mov	dx, ss:4714h
		mov	cx, ss:4712h
		add	ss:4624h, dl
		adc	dh, 0
		add	ss:4625h, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:471Ah, cx
		or	cx, cx
		jnz	short loc_352F7
		jmp	loc_353A4
; ���������������������������������������������������������������������������

loc_352F7:				; CODE XREF: seg132:00B2j
		xor	ax, ax
		mov	al, cl
		sub	ss:4708h, ax
		mov	al, ch
		add	ss:470Ah, ax

loc_35307:				; CODE XREF: seg132:loc_3533Cj
					; seg132:0161j
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_35310
		jmp	loc_353B3
; ���������������������������������������������������������������������������

loc_35310:				; CODE XREF: seg132:00CBj
		mov	dx, [si+4]
		cmp	dx, ss:46EEh
		jz	short loc_3533E
		jl	short loc_3531F
		jmp	loc_353A4
; ���������������������������������������������������������������������������

loc_3531F:				; CODE XREF: seg132:00DAj
		add	si, 6
		shr	ax, 1
		jb	short loc_3532A
		add	si, ax
		jmp	short loc_3533C
; ���������������������������������������������������������������������������

loc_3532A:				; CODE XREF: seg132:00E4j
		push	di
		mov	di, ax

loc_3532D:				; CODE XREF: seg132:00F9j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_35337
		add	si, ax
		dec	si

loc_35337:				; CODE XREF: seg132:00F2j
		sub	di, ax
		jnz	short loc_3532D
		pop	di

loc_3533C:				; CODE XREF: seg132:00E8j
		jmp	short loc_35307
; ���������������������������������������������������������������������������

loc_3533E:				; CODE XREF: seg132:00D8j
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_3538E
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_35357:				; CODE XREF: seg132:0129j seg132:013Cj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3536D
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_35357
		jz	short loc_3537E

loc_3536D:				; CODE XREF: seg132:011Dj
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_35357

loc_3537E:				; CODE XREF: seg132:012Bj
		pop	es
		pop	ax
		mov	bx, ss:4716h
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_3539A
; ���������������������������������������������������������������������������

loc_3538E:				; CODE XREF: seg132:0104j
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_3539A:				; CODE XREF: seg132:014Cj
		call	word ptr ss:4882h
		pop	ds
		pop	si
		jmp	loc_35307
; ���������������������������������������������������������������������������

loc_353A4:				; CODE XREF: seg132:00B4j seg132:00DCj
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_353B3
		jmp	loc_352CF
; ���������������������������������������������������������������������������

loc_353B3:				; CODE XREF: seg132:00CDj seg132:016Ej
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_353B8:				; DATA XREF: dseg:4680o
		call	sub_39554
		jb	short loc_353DD
		call	sub_38BB6
		jnb	short loc_353E2
		mov	word ptr ss:4882h, 5F2h
		mov	ax, 6E1h
		cmp	bl, bh
		jb	short loc_353D7
		mov	ax, 0A43h

loc_353D7:				; CODE XREF: seg132:0192j
		mov	ss:4884h, ax
		jmp	short loc_35438
; ���������������������������������������������������������������������������

loc_353DD:				; CODE XREF: seg132:017Dj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_353E2:				; CODE XREF: seg132:0184j
		mov	word ptr ss:4882h, 2EDh
		mov	ax, 340h
		cmp	bl, bh
		jb	short loc_353F3
		mov	ax, 3CCh

loc_353F3:				; CODE XREF: seg132:01AEj
		mov	ss:4884h, ax
		jmp	short loc_35438
; ���������������������������������������������������������������������������

loc_353F9:				; DATA XREF: dseg:46A0o
		call	sub_395F1
		jb	short loc_3541E
		call	sub_38BB6
		jnb	short loc_35423
		mov	word ptr ss:4882h, 0DD9h
		mov	ax, 0EC4h
		cmp	bl, bh
		jb	short loc_35418
		mov	ax, 1202h

loc_35418:				; CODE XREF: seg132:01D3j
		mov	ss:4884h, ax
		jmp	short loc_35438
; ���������������������������������������������������������������������������

loc_3541E:				; CODE XREF: seg132:01BEj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_35423:				; CODE XREF: seg132:01C5j
		mov	word ptr ss:4882h, 466h
		mov	ax, 4BDh
		cmp	bl, bh
		jb	short loc_35434
		mov	ax, 558h

loc_35434:				; CODE XREF: seg132:01EFj
		mov	ss:4884h, ax

loc_35438:				; CODE XREF: seg132:019Bj seg132:01B7j ...
		xor	dx, dx
		mov	ss:4624h, dx

loc_3543F:				; CODE XREF: seg132:02E5j
		mov	dx, ss:4714h
		mov	cx, ss:4712h
		add	ss:4624h, dl
		adc	dh, 0
		add	ss:4625h, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:471Ah, cx
		or	cx, cx
		jnz	short loc_35467
		jmp	loc_35504
; ���������������������������������������������������������������������������

loc_35467:				; CODE XREF: seg132:0222j
					; seg132:loc_3549Cj ...
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_35470
		jmp	loc_35528
; ���������������������������������������������������������������������������

loc_35470:				; CODE XREF: seg132:022Bj
		mov	dx, [si+4]
		cmp	dx, ss:46EEh
		jz	short loc_3549E
		jl	short loc_3547F
		jmp	loc_35504
; ���������������������������������������������������������������������������

loc_3547F:				; CODE XREF: seg132:023Aj
		add	si, 6
		shr	ax, 1
		jb	short loc_3548A
		add	si, ax
		jmp	short loc_3549C
; ���������������������������������������������������������������������������

loc_3548A:				; CODE XREF: seg132:0244j
		push	di
		mov	di, ax

loc_3548D:				; CODE XREF: seg132:0259j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_35497
		add	si, ax
		dec	si

loc_35497:				; CODE XREF: seg132:0252j
		sub	di, ax
		jnz	short loc_3548D
		pop	di

loc_3549C:				; CODE XREF: seg132:0248j
		jmp	short loc_35467
; ���������������������������������������������������������������������������

loc_3549E:				; CODE XREF: seg132:0238j
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_354EE
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_354B7:				; CODE XREF: seg132:0289j seg132:029Cj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_354CD
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_354B7
		jz	short loc_354DE

loc_354CD:				; CODE XREF: seg132:027Dj
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_354B7

loc_354DE:				; CODE XREF: seg132:028Bj
		pop	es
		pop	ax
		mov	bx, ss:4716h
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_354FA
; ���������������������������������������������������������������������������

loc_354EE:				; CODE XREF: seg132:0264j
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_354FA:				; CODE XREF: seg132:02ACj
		call	word ptr ss:4882h
		pop	ds
		pop	si
		jmp	loc_35467
; ���������������������������������������������������������������������������

loc_35504:				; CODE XREF: seg132:0224j seg132:023Cj
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_35528
		mov	cx, ss:471Ah
		xor	ax, ax
		mov	al, cl
		add	ss:4708h, ax
		mov	al, ch
		sub	ss:470Ah, ax
		jmp	loc_3543F
; ���������������������������������������������������������������������������

loc_35528:				; CODE XREF: seg132:022Dj seg132:02CEj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		add	ax, ss:4702h
		mul	word ptr ss:4720h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4627h, al
		mov	ss:471Fh, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:470Ah
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:4626h, al
		mov	ss:471Eh, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4708h
		add	di, ax
		mov	dl, cl
		jmp	word ptr ss:4884h
; ���������������������������������������������������������������������������
		mov	cx, ss:4714h
		mov	al, ss:4627h
		add	ss:471Fh, cl
		adc	ch, 0
		mov	ss:4719h, ch
		mov	cx, ss:471Ah
		mov	dh, dl
		or	ch, ch
		jz	short loc_355AD

loc_355A1:				; CODE XREF: seg132:036Bj
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	ch, 0
		jnz	short loc_355A1

loc_355AD:				; CODE XREF: seg132:035Fj
		mov	ch, al

loc_355AF:				; CODE XREF: seg132:0944j
		cmp	byte ptr ss:4719h, 0
		jle	short loc_355E7

loc_355B7:				; CODE XREF: seg132:03C9j
		mov	al, [si]

loc_355B9:				; CODE XREF: seg132:03A5j
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		add	di, ss:473Fh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_355CC:				; CODE XREF: seg132:0395j
		add	dl, bl
		jnb	short loc_355D3
		dec	cl
		inc	di

loc_355D3:				; CODE XREF: seg132:038Ej
		add	ch, bh
		jnb	short loc_355CC

loc_355D7:				; CODE XREF: seg132:039Ej
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_355D7
		dec	byte ptr ss:4719h
		jnz	short loc_355B9

loc_355E7:				; CODE XREF: seg132:0375j
		mov	bp, cx
		mov	cx, ss:4714h

loc_355EE:				; CODE XREF: seg132:03C0j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_3560B
		or	ch, ch
		jz	short loc_355EE
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_355B7
; ���������������������������������������������������������������������������

locret_3560B:				; CODE XREF: seg132:03BCj
		retn
; ���������������������������������������������������������������������������
		mov	cx, ss:4712h
		add	ss:471Eh, cl
		adc	ch, 0
		mov	ss:4718h, ch
		mov	cx, ss:471Ah
		mov	ah, ss:4627h
		xchg	ch, cl
		mov	dh, dl
		or	ch, ch
		jz	short loc_3563C

loc_35630:				; CODE XREF: seg132:03FAj
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	ch, 0
		jnz	short loc_35630

loc_3563C:				; CODE XREF: seg132:03EEj
		mov	ch, ss:4627h

loc_35641:				; CODE XREF: seg132:0CE6j
		mov	bp, ss:473Fh
		mov	al, [si]
		cmp	byte ptr ss:4718h, 0
		jz	short loc_3567C

loc_35650:				; CODE XREF: seg132:0463j
		mov	al, [si]

loc_35652:				; CODE XREF: seg132:043Aj
		push	cx
		push	di

loc_35654:				; CODE XREF: seg132:041Bj
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_35654
		pop	di
		pop	cx
		inc	di

loc_35660:				; CODE XREF: seg132:042Aj
		add	ch, bh
		jnb	short loc_35668
		inc	cl
		add	di, bp

loc_35668:				; CODE XREF: seg132:0422j
		add	dl, bl
		jnb	short loc_35660

loc_3566C:				; CODE XREF: seg132:0433j
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_3566C
		dec	byte ptr ss:4718h
		jnz	short loc_35652

loc_3567C:				; CODE XREF: seg132:040Ej
		mov	bp, cx
		mov	cx, ss:4712h

loc_35683:				; CODE XREF: seg132:0455j
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_356A5
		or	ch, ch
		jle	short loc_35683
		mov	ss:4718h, ch
		mov	cx, bp
		mov	bp, ss:473Fh
		jmp	short loc_35650
; ���������������������������������������������������������������������������

locret_356A5:				; CODE XREF: seg132:0451j
		retn
; ���������������������������������������������������������������������������
		add	ax, ss:4702h
		mul	word ptr ss:4720h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4627h, al
		mov	ss:471Fh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:470Ah
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:4626h, al
		mov	ss:471Eh, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:4708h
		add	di, ax
		mov	dl, cl
		jmp	word ptr ss:4884h
; ���������������������������������������������������������������������������
		mov	cx, ss:4714h
		mov	al, ss:4627h
		add	ss:471Fh, cl
		adc	ch, 0
		mov	ss:4719h, ch
		mov	ah, ss:4627h
		mov	ch, ah
		mov	dl, ss:4626h
		mov	dh, dl
		mov	cl, ss:471Ah
		mov	al, ss:471Bh
		or	al, al
		jz	short loc_35739

loc_3572E:				; CODE XREF: seg132:04F7j
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	al, 0
		jg	short loc_3572E

loc_35739:				; CODE XREF: seg132:04ECj
		mov	ch, al

loc_3573B:				; CODE XREF: seg132:1131j
		cmp	byte ptr ss:4719h, 0
		jle	short loc_35773

loc_35743:				; CODE XREF: seg132:0555j
		mov	al, [si]

loc_35745:				; CODE XREF: seg132:0531j
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		sub	di, ss:473Fh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_35758:				; CODE XREF: seg132:0521j
		add	dl, bl
		jnb	short loc_3575F
		inc	cl
		dec	di

loc_3575F:				; CODE XREF: seg132:051Aj
		add	ch, bh
		jnb	short loc_35758

loc_35763:				; CODE XREF: seg132:052Aj
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_35763
		dec	byte ptr ss:4719h
		jnz	short loc_35745

loc_35773:				; CODE XREF: seg132:0501j
		mov	bp, cx
		mov	cx, ss:4714h

loc_3577A:				; CODE XREF: seg132:054Cj
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_35797
		or	ch, ch
		jz	short loc_3577A
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_35743
; ���������������������������������������������������������������������������

locret_35797:				; CODE XREF: seg132:0548j
		retn
; ���������������������������������������������������������������������������
		mov	cx, ss:4712h
		add	ss:471Eh, cl
		adc	ch, 0
		mov	ss:4718h, ch
		mov	cx, ss:471Ah
		mov	ah, ss:4627h
		xchg	ch, cl
		mov	dh, dl
		or	ch, ch
		jz	short loc_357C8

loc_357BC:				; CODE XREF: seg132:0586j
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	ch, 0
		jg	short loc_357BC

loc_357C8:				; CODE XREF: seg132:057Aj
		mov	ch, ss:4627h

loc_357CD:				; CODE XREF: seg132:1493j
		mov	bp, ss:473Fh
		mov	al, [si]
		cmp	byte ptr ss:4718h, 0
		jz	short loc_35808

loc_357DC:				; CODE XREF: seg132:05EFj
		mov	al, [si]

loc_357DE:				; CODE XREF: seg132:05C6j
		push	cx
		push	di

loc_357E0:				; CODE XREF: seg132:05A7j
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_357E0
		pop	di
		pop	cx
		dec	di

loc_357EC:				; CODE XREF: seg132:05B6j
		add	ch, bh
		jnb	short loc_357F4
		dec	cl
		sub	di, bp

loc_357F4:				; CODE XREF: seg132:05AEj
		add	dl, bl
		jnb	short loc_357EC

loc_357F8:				; CODE XREF: seg132:05BFj
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_357F8
		dec	byte ptr ss:4718h
		jnz	short loc_357DE

loc_35808:				; CODE XREF: seg132:059Aj
		mov	bp, cx
		mov	cx, ss:4712h

loc_3580F:				; CODE XREF: seg132:05E1j
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_35831
		or	ch, ch
		jle	short loc_3580F
		mov	ss:4718h, ch
		mov	cx, bp
		mov	bp, ss:473Fh
		jmp	short loc_357DC
; ���������������������������������������������������������������������������

locret_35831:				; CODE XREF: seg132:05DDj
		retn
; ���������������������������������������������������������������������������
		add	ax, ss:4702h
		mul	word ptr ss:4720h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4627h, al
		mov	cx, ss:4714h
		add	al, cl
		adc	ch, 0
		mov	ss:4719h, ch
		mov	ss:471Fh, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:470Ah
		mov	ss:4710h, ax
		mov	di, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		mov	ss:4626h, al
		mov	ss:471Eh, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4708h
		mov	ss:470Eh, ax
		mov	bp, ax
		mov	word ptr ss:4725h, 0
		mov	word ptr ss:4727h, 0
		mov	byte ptr ss:4724h, 0
		cmp	ax, ss:473Bh
		jle	short loc_358AA
		jmp	short locret_35920
; ���������������������������������������������������������������������������

loc_358AA:				; CODE XREF: seg132:0666j
		mov	ax, ss:4710h
		sub	ax, ss:4739h
		jge	short loc_3591B
		or	ax, ax
		jns	short loc_358BB
		neg	ax

loc_358BB:				; CODE XREF: seg132:0677j
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4627h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_358D9
		inc	ax

loc_358D9:				; CODE XREF: seg132:0696j
		push	ax
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4727h, ax
		add	ss:4710h, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:470Eh, ax
		add	ss:4725h, ax
		or	byte ptr ss:4724h, 2

loc_3591B:				; CODE XREF: seg132:0673j
		jmp	word ptr ss:4884h
; ���������������������������������������������������������������������������

locret_35920:				; CODE XREF: seg132:0668j
		retn
; ���������������������������������������������������������������������������
		xor	ax, ax
		mov	al, ss:471Ah
		mov	ch, ss:471Bh
		xor	dx, dx
		or	ch, ch
		jz	short loc_3593E

loc_35932:				; CODE XREF: seg132:06FCj
		add	dl, bl
		adc	ax, 0
		add	dh, bh
		sbb	ch, 0
		jg	short loc_35932

loc_3593E:				; CODE XREF: seg132:06F0j
		inc	ax
		mov	ss:471Ch, ax
		mov	dx, ax
		mov	ax, ss:470Eh
		add	ax, dx
		sub	ax, ss:4737h
		jl	short loc_35954
		jmp	short loc_359B3
; ���������������������������������������������������������������������������

loc_35954:				; CODE XREF: seg132:0710j
		or	ax, ax
		jns	short loc_3595A
		neg	ax

loc_3595A:				; CODE XREF: seg132:0716j
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_35978
		inc	ax

loc_35978:				; CODE XREF: seg132:0735j
		push	ax
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:470Eh, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4710h, ax
		add	ss:4727h, ax
		or	byte ptr ss:4724h, 1

loc_359B3:				; CODE XREF: seg132:0712j
		mov	ax, ss:473Bh
		inc	ax
		sub	ax, ss:470Eh
		jg	short loc_359C0

locret_359BF:				; CODE XREF: seg132:07A8j
		retn
; ���������������������������������������������������������������������������

loc_359C0:				; CODE XREF: seg132:077Dj
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4712h
		add	al, ss:471Eh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, bp
		add	ax, ss:471Ch
		cmp	ax, ss:4737h
		jl	short locret_359BF
		cmp	ax, ss:473Bh
		jle	short loc_359F7
		or	byte ptr ss:4724h, 4

loc_359F7:				; CODE XREF: seg132:07AFj
		mov	ax, ss:473Dh
		inc	ax
		sub	ax, ss:4710h
		mov	ss:4731h, ax
		jle	short locret_35A6C
		mov	ax, ss:4729h
		mul	word ptr ss:4714h
		add	al, ss:471Fh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:4739h
		jl	short locret_35A6C
		cmp	ax, ss:473Dh
		jle	short loc_35A35
		or	byte ptr ss:4724h, 8

loc_35A35:				; CODE XREF: seg132:07EDj
		test	byte ptr ss:4724h, 3
		jz	short loc_35A96
		mov	ax, ss:4727h
		or	ax, ax
		jz	short loc_35A96
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4627h
		sub	al, ss:471Fh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:4714h
		div	cx
		add	si, ax
		sub	ss:4729h, ax
		jg	short loc_35A6D

locret_35A6C:				; CODE XREF: seg132:07C5j seg132:07E6j
		retn
; ���������������������������������������������������������������������������

loc_35A6D:				; CODE XREF: seg132:082Aj
		mul	cx
		add	ss:471Fh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:471Fh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:4727h
		mov	ss:4719h, al
		jmp	short loc_35AA8
; ���������������������������������������������������������������������������

loc_35A96:				; CODE XREF: seg132:07FBj seg132:0803j
		mov	cx, ss:4714h
		add	ss:471Fh, cl
		adc	ch, 0
		mov	ss:4719h, ch

loc_35AA8:				; CODE XREF: seg132:0854j
		mov	ax, ss:4710h
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:470Eh
		mov	ah, ss:4627h
		mov	ch, ah
		mov	dl, ss:4626h
		mov	dh, dl
		mov	cl, ss:471Ah
		mov	al, ss:471Bh
		or	al, al
		jz	short loc_35AE3

loc_35AD8:				; CODE XREF: seg132:08A1j
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	al, 0
		jg	short loc_35AD8

loc_35AE3:				; CODE XREF: seg132:0896j
		push	cx
		xor	ch, ch
		sub	ss:472Fh, cx
		pop	cx
		jg	short loc_35AF1
		jmp	loc_35C03
; ���������������������������������������������������������������������������

loc_35AF1:				; CODE XREF: seg132:08ACj
		cmp	byte ptr ss:4719h, 0
		jle	short loc_35B51

loc_35AF9:				; CODE XREF: seg132:0933j
		mov	al, [si]

loc_35AFB:				; CODE XREF: seg132:090Fj
		push	di
		push	dx
		push	cx
		xor	ch, ch
		mov	dx, ss:4737h
		sub	dx, ss:470Eh
		jle	short loc_35B79
		sub	cx, dx
		jle	short loc_35B14
		add	di, dx
		rep stosb

loc_35B14:				; CODE XREF: seg132:08CEj
		pop	cx
		pop	dx
		pop	di
		add	di, ss:473Fh

loc_35B1C:				; CODE XREF: seg132:08EAj
		add	dl, bl
		jnb	short loc_35B28
		dec	cl
		inc	di
		inc	word ptr ss:470Eh

loc_35B28:				; CODE XREF: seg132:08DEj
		add	ch, bh
		jnb	short loc_35B1C

loc_35B2C:				; CODE XREF: seg132:08F9j
		add	dh, bl
		jnb	short loc_35B37
		dec	word ptr ss:472Fh
		inc	cl

loc_35B37:				; CODE XREF: seg132:08EEj
		add	ah, bh
		jnb	short loc_35B2C
		dec	word ptr ss:4731h
		jle	short locret_35B75
		cmp	word ptr ss:472Fh, 0
		jle	short loc_35B76
		dec	byte ptr ss:4719h
		jg	short loc_35AFB

loc_35B51:				; CODE XREF: seg132:08B7j seg132:094Dj
		mov	bp, cx
		mov	cx, ss:4714h

loc_35B58:				; CODE XREF: seg132:092Aj
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_35B75
		or	ch, ch
		jz	short loc_35B58
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_35AF9
; ���������������������������������������������������������������������������

locret_35B75:				; CODE XREF: seg132:0900j seg132:0926j
		retn
; ���������������������������������������������������������������������������

loc_35B76:				; CODE XREF: seg132:0908j seg132:0990j
		jmp	loc_35BFE
; ���������������������������������������������������������������������������

loc_35B79:				; CODE XREF: seg132:08CAj
		pop	cx
		pop	dx
		pop	di
		test	byte ptr ss:4724h, 0Ch
		jnz	short loc_35B87
		jmp	loc_355AF
; ���������������������������������������������������������������������������

loc_35B87:				; CODE XREF: seg132:0942j
		cmp	byte ptr ss:4719h, 0
		jle	short loc_35B51

loc_35B8F:				; CODE XREF: seg132:09BBj
		mov	al, [si]

loc_35B91:				; CODE XREF: seg132:0997j
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		add	di, ss:473Fh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_35BA4:				; CODE XREF: seg132:0972j
		add	dl, bl
		jnb	short loc_35BB0
		dec	cl
		inc	di
		inc	word ptr ss:470Eh

loc_35BB0:				; CODE XREF: seg132:0966j
		add	ch, bh
		jnb	short loc_35BA4

loc_35BB4:				; CODE XREF: seg132:0981j
		add	dh, bl
		jnb	short loc_35BBF
		dec	word ptr ss:472Fh
		inc	cl

loc_35BBF:				; CODE XREF: seg132:0976j
		add	ah, bh
		jnb	short loc_35BB4
		dec	word ptr ss:4731h
		jle	short locret_35BFD
		cmp	word ptr ss:472Fh, 0
		jle	short loc_35B76
		dec	byte ptr ss:4719h
		jg	short loc_35B91
		mov	bp, cx
		mov	cx, ss:4714h

loc_35BE0:				; CODE XREF: seg132:09B2j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_35BFD
		or	ch, ch
		jz	short loc_35BE0
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_35B8F
; ���������������������������������������������������������������������������

locret_35BFD:				; CODE XREF: seg132:0988j seg132:09AEj
		retn
; ���������������������������������������������������������������������������

loc_35BFE:				; CODE XREF: seg132:loc_35B76j
		dec	byte ptr ss:4719h

loc_35C03:				; CODE XREF: seg132:08AEj
		cmp	byte ptr ss:4719h, 0
		jle	short loc_35C5E

loc_35C0B:				; CODE XREF: seg132:0A40j
		mov	al, [si]

loc_35C0D:				; CODE XREF: seg132:0A1Cj
		push	di
		push	cx
		xor	ch, ch
		mov	bp, ss:470Eh
		add	bp, cx
		stc
		sbb	bp, ss:473Bh
		jle	short loc_35C22
		sub	cx, bp

loc_35C22:				; CODE XREF: seg132:09DEj
		rep stosb
		pop	cx
		pop	di
		add	di, ss:473Fh

loc_35C2B:				; CODE XREF: seg132:0A05j
		add	dl, bl
		jnb	short loc_35C43
		dec	cl
		inc	di
		inc	word ptr ss:470Eh
		mov	bp, ss:470Eh
		cmp	bp, ss:473Bh
		jg	short locret_35C82

loc_35C43:				; CODE XREF: seg132:09EDj
		add	ch, bh
		jnb	short loc_35C2B

loc_35C47:				; CODE XREF: seg132:0A0Ej
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_35C47
		dec	word ptr ss:4731h
		jle	short locret_35C82
		dec	byte ptr ss:4719h
		jg	short loc_35C0D

loc_35C5E:				; CODE XREF: seg132:09C9j
		mov	bp, cx
		mov	cx, ss:4714h

loc_35C65:				; CODE XREF: seg132:0A37j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_35C82
		or	ch, ch
		jz	short loc_35C65
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_35C0B
; ���������������������������������������������������������������������������

locret_35C82:				; CODE XREF: seg132:0A01j seg132:0A15j ...
		retn
; ���������������������������������������������������������������������������
		xor	ax, ax
		mov	al, ss:471Bh
		mov	ch, ss:471Ah
		xor	dx, dx
		or	ch, ch
		jz	short loc_35CA0

loc_35C94:				; CODE XREF: seg132:0A5Ej
		sub	dh, bh
		adc	ax, 0
		sub	dl, bl
		sbb	ch, 0
		jg	short loc_35C94

loc_35CA0:				; CODE XREF: seg132:0A52j
		inc	ax
		mov	ss:471Ch, ax
		mov	ax, ss:470Eh
		sub	ax, ss:4737h
		jl	short loc_35CB2
		jmp	short loc_35D11
; ���������������������������������������������������������������������������

loc_35CB2:				; CODE XREF: seg132:0A6Ej
		or	ax, ax
		jns	short loc_35CB8
		neg	ax

loc_35CB8:				; CODE XREF: seg132:0A74j
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_35CD6
		inc	ax

loc_35CD6:				; CODE XREF: seg132:0A93j
		push	ax
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:470Eh, ax
		add	ss:4725h, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4710h, ax
		or	byte ptr ss:4724h, 1

loc_35D11:				; CODE XREF: seg132:0A70j
		mov	ax, ss:473Bh
		inc	ax
		sub	ax, ss:470Eh
		jg	short loc_35D1E

locret_35D1D:				; CODE XREF: seg132:0B01j
		retn
; ���������������������������������������������������������������������������

loc_35D1E:				; CODE XREF: seg132:0ADBj
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4712h
		add	al, ss:471Eh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, bp
		cmp	ax, ss:4737h
		jl	short locret_35D1D
		cmp	ax, ss:473Bh
		jle	short loc_35D50
		or	byte ptr ss:4724h, 4

loc_35D50:				; CODE XREF: seg132:0B08j
		mov	ax, ss:473Dh
		inc	ax
		sub	ax, ss:4710h
		mov	ss:4731h, ax
		jg	short loc_35D69
		add	ax, ss:471Ch
		jle	short locret_35DCA
		jg	short loc_35D91

loc_35D69:				; CODE XREF: seg132:0B1Ej
		mov	ax, ss:4729h
		mul	word ptr ss:4714h
		add	al, ss:471Fh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:4739h
		jl	short locret_35DCA
		cmp	ax, ss:473Dh
		jl	short loc_35D97

loc_35D91:				; CODE XREF: seg132:0B27j
		or	byte ptr ss:4724h, 8

loc_35D97:				; CODE XREF: seg132:0B4Fj
		test	byte ptr ss:4724h, 3
		jz	short loc_35DF4
		mov	ax, ss:4725h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4626h
		sub	al, ss:471Eh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:4712h
		div	cx
		add	si, ax
		sub	ss:4729h, ax
		jg	short loc_35DCB

locret_35DCA:				; CODE XREF: seg132:0B25j seg132:0B48j
		retn
; ���������������������������������������������������������������������������

loc_35DCB:				; CODE XREF: seg132:0B88j
		mul	cx
		add	ss:471Eh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:471Eh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:4725h
		mov	ss:4718h, al
		jmp	short loc_35E06
; ���������������������������������������������������������������������������

loc_35DF4:				; CODE XREF: seg132:0B5Dj
		mov	cx, ss:4712h
		add	ss:471Eh, cl
		adc	ch, 0
		mov	ss:4718h, ch

loc_35E06:				; CODE XREF: seg132:0BB2j
		mov	ax, ss:4710h
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:470Eh
		mov	ah, ss:4627h
		mov	ch, ah
		mov	dl, ss:4626h
		mov	dh, dl
		mov	cl, ss:471Bh
		mov	al, ss:471Ah
		or	al, al
		jz	short loc_35E41

loc_35E36:				; CODE XREF: seg132:0BFFj
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	al, 0
		jg	short loc_35E36

loc_35E41:				; CODE XREF: seg132:0BF4j
		mov	bp, ss:4710h
		cmp	bp, ss:473Dh
		jl	short loc_35E78
		jz	short loc_35E75
		sub	bp, ss:473Dh
		mov	al, ch
		xor	ch, ch
		sub	cx, bp
		mov	ch, al
		jg	short loc_35E5F
		retn
; ���������������������������������������������������������������������������

loc_35E5F:				; CODE XREF: seg132:0C1Cj
		mov	bp, ss:473Dh
		shl	bp, 1
		add	bp, ss:4735h
		mov	di, bp
		mov	di, ss:[di]
		add	di, ss:470Eh

loc_35E75:				; CODE XREF: seg132:0C0Dj
		jmp	loc_35FB4
; ���������������������������������������������������������������������������

loc_35E78:				; CODE XREF: seg132:0C0Bj
		push	cx
		xor	ch, ch
		dec	cx
		sub	bp, cx
		pop	cx
		cmp	bp, ss:4739h
		jl	short loc_35E89

loc_35E86:				; CODE XREF: seg132:0C58j
		jmp	loc_35F1E
; ���������������������������������������������������������������������������

loc_35E89:				; CODE XREF: seg132:0C44j
		cmp	byte ptr ss:4718h, 0
		jz	short loc_35EF7

loc_35E91:				; CODE XREF: seg132:0CD7j
		mov	al, [si]

loc_35E93:				; CODE XREF: seg132:0CB5j
		cmp	bp, ss:4739h
		jge	short loc_35E86
		push	cx
		push	di
		push	dx
		mov	dx, bp
		sub	dx, ss:4739h
		xor	ch, ch
		add	cx, dx
		pop	dx

loc_35EA9:				; CODE XREF: seg132:0C73j
		mov	es:[di], al
		sub	di, ss:473Fh
		dec	cl
		jg	short loc_35EA9
		pop	di
		pop	cx
		inc	di
		inc	word ptr ss:470Eh

loc_35EBD:				; CODE XREF: seg132:0C8Fj
		add	ch, bh
		jnb	short loc_35ECD
		inc	cl
		add	di, ss:473Fh
		dec	word ptr ss:4731h

loc_35ECD:				; CODE XREF: seg132:0C7Fj
		add	dl, bl
		jnb	short loc_35EBD

loc_35ED1:				; CODE XREF: seg132:0C9Aj
		add	ah, bh
		jnb	short loc_35ED8
		inc	bp
		dec	cl

loc_35ED8:				; CODE XREF: seg132:0C93j
		add	dh, bl
		jnb	short loc_35ED1
		dec	word ptr ss:472Fh
		jz	short loc_35F1B
		push	ax
		mov	ax, ss:470Eh
		cmp	ax, ss:473Bh
		pop	ax
		jg	short loc_35F1B
		dec	byte ptr ss:4718h
		jnz	short loc_35E93

loc_35EF7:				; CODE XREF: seg132:0C4Fj
		push	cx
		mov	cx, ss:4712h

loc_35EFD:				; CODE XREF: seg132:0CCFj
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short loc_35F1A
		or	ch, ch
		jle	short loc_35EFD
		mov	ss:4718h, ch
		pop	cx
		jmp	loc_35E91
; ���������������������������������������������������������������������������

loc_35F1A:				; CODE XREF: seg132:0CCBj
		pop	cx

loc_35F1B:				; CODE XREF: seg132:0CA1j seg132:0CAEj
		jmp	locret_36018
; ���������������������������������������������������������������������������

loc_35F1E:				; CODE XREF: seg132:loc_35E86j
		test	byte ptr ss:4724h, 0Ch
		jnz	short loc_35F29
		jmp	loc_35641
; ���������������������������������������������������������������������������

loc_35F29:				; CODE XREF: seg132:0CE4j
		mov	bp, ss:473Fh
		cmp	byte ptr ss:4718h, 0
		jz	short loc_35F7D

loc_35F36:				; CODE XREF: seg132:0D64j
		mov	al, [si]

loc_35F38:				; CODE XREF: seg132:0D3Bj
		push	cx
		push	di

loc_35F3A:				; CODE XREF: seg132:0D01j
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_35F3A
		pop	di
		pop	cx
		inc	di

loc_35F46:				; CODE XREF: seg132:0D17j
		add	ch, bh
		jnb	short loc_35F55
		dec	word ptr ss:4731h
		jle	short loc_35F55
		inc	cl
		add	di, bp

loc_35F55:				; CODE XREF: seg132:0D08j seg132:0D0Fj
		add	dl, bl
		jnb	short loc_35F46

loc_35F59:				; CODE XREF: seg132:0D20j
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_35F59
		inc	word ptr ss:470Eh
		dec	word ptr ss:472Fh
		jz	short loc_35FA7
		cmp	word ptr ss:4731h, 0
		jle	short loc_35FA7
		dec	byte ptr ss:4718h
		jnz	short loc_35F38

loc_35F7D:				; CODE XREF: seg132:0CF4j
		mov	bp, cx
		mov	cx, ss:4712h

loc_35F84:				; CODE XREF: seg132:0D56j
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_35FA6
		or	ch, ch
		jle	short loc_35F84
		mov	ss:4718h, ch
		mov	cx, bp
		mov	bp, ss:473Fh
		jmp	short loc_35F36
; ���������������������������������������������������������������������������

locret_35FA6:				; CODE XREF: seg132:0D52j
		retn
; ���������������������������������������������������������������������������

loc_35FA7:				; CODE XREF: seg132:0D2Cj seg132:0D34j
		test	byte ptr ss:4724h, 8
		jz	short locret_36018
		dec	byte ptr ss:4718h

loc_35FB4:				; CODE XREF: seg132:loc_35E75j
		mov	bp, ss:470Eh
		cmp	bp, ss:473Bh
		jg	short locret_36018
		cmp	byte ptr ss:4718h, 0
		jle	short loc_35FF5

loc_35FC8:				; CODE XREF: seg132:0DD5j
		mov	al, [si]

loc_35FCA:				; CODE XREF: seg132:0DB3j
		push	cx
		push	di

loc_35FCC:				; CODE XREF: seg132:0D96j
		mov	es:[di], al
		sub	di, ss:473Fh
		dec	cl
		jg	short loc_35FCC
		pop	di
		pop	cx
		inc	di
		inc	bp
		cmp	bp, ss:473Bh
		jg	short locret_36018

loc_35FE3:				; CODE XREF: seg132:0DACj
		add	ah, bh
		sbb	cl, 0
		jle	short locret_36018
		add	dh, bl
		jnb	short loc_35FE3
		dec	byte ptr ss:4718h
		jnz	short loc_35FCA

loc_35FF5:				; CODE XREF: seg132:0D86j
		push	cx
		mov	cx, ss:4712h

loc_35FFB:				; CODE XREF: seg132:0DCDj
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short loc_36017
		or	ch, ch
		jle	short loc_35FFB
		mov	ss:4718h, ch
		pop	cx
		jmp	short loc_35FC8
; ���������������������������������������������������������������������������

loc_36017:				; CODE XREF: seg132:0DC9j
		pop	cx

locret_36018:				; CODE XREF: seg132:loc_35F1Bj
					; seg132:0D6Dj	...
		retn
; ���������������������������������������������������������������������������
		add	ax, ss:4702h
		mul	word ptr ss:4720h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4627h, al
		mov	cx, ss:4714h
		add	al, cl
		adc	ch, 0
		mov	ss:4719h, ch
		mov	ss:471Fh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:470Ah
		mov	ss:4710h, ax
		mov	di, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		mov	ss:4626h, al
		mov	ss:471Eh, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:4708h
		mov	ss:470Eh, ax
		mov	bp, ax
		mov	word ptr ss:4725h, 0
		mov	word ptr ss:4727h, 0
		mov	byte ptr ss:4724h, 0
		cmp	ax, ss:4737h
		jge	short loc_36095
		jmp	short locret_36103
; ���������������������������������������������������������������������������

loc_36095:				; CODE XREF: seg132:0E51j
		mov	ax, ss:470Eh
		sub	ax, ss:473Bh
		jle	short loc_360FE
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_360BE
		inc	ax

loc_360BE:				; CODE XREF: seg132:0E7Bj
		push	ax
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:470Eh, ax
		add	ss:4725h, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:4710h, ax
		add	ss:4727h, ax
		or	byte ptr ss:4724h, 4

loc_360FE:				; CODE XREF: seg132:0E5Ej
		call	word ptr ss:4884h

locret_36103:				; CODE XREF: seg132:0E53j
		retn
; ���������������������������������������������������������������������������
		xor	ax, ax
		mov	al, ss:471Ah
		mov	ch, ss:471Bh
		xor	dx, dx
		or	ch, ch
		jz	short loc_36121

loc_36115:				; CODE XREF: seg132:0EDFj
		sub	dl, bl
		adc	ax, 0
		sub	dh, bh
		sbb	ch, 0
		jg	short loc_36115

loc_36121:				; CODE XREF: seg132:0ED3j
		inc	ax
		mov	ss:471Ch, ax
		mov	ax, ss:4710h
		sub	ax, ss:473Dh
		jle	short loc_3618C
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4627h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_3614F
		inc	ax

loc_3614F:				; CODE XREF: seg132:0F0Cj
		push	ax
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4727h, ax
		sub	ss:4710h, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:470Eh, ax
		or	byte ptr ss:4724h, 8

loc_3618C:				; CODE XREF: seg132:0EEFj
		mov	ax, ss:470Eh
		inc	ax
		sub	ax, ss:4737h
		jg	short loc_361A0
		add	ax, ss:471Ch
		jg	short loc_361CF
		retn
; ���������������������������������������������������������������������������

loc_361A0:				; CODE XREF: seg132:0F56j
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4712h
		add	al, ss:471Eh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, bp
		sub	dx, ax
		cmp	dx, ss:473Bh
		jle	short loc_361C8
		retn
; ���������������������������������������������������������������������������

loc_361C8:				; CODE XREF: seg132:0F85j
		cmp	dx, ss:4737h
		jge	short loc_361D5

loc_361CF:				; CODE XREF: seg132:0F5Dj
		or	byte ptr ss:4724h, 1

loc_361D5:				; CODE XREF: seg132:0F8Dj
		mov	ax, ss:4710h
		inc	ax
		sub	ax, ss:4739h
		jle	short locret_3624C
		mov	ss:4731h, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4714h
		add	al, ss:471Fh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:473Dh
		jg	short locret_3624C
		cmp	ax, ss:4739h
		jge	short loc_36215
		or	byte ptr ss:4724h, 2

loc_36215:				; CODE XREF: seg132:0FCDj
		test	byte ptr ss:4724h, 0Ch
		jz	short loc_36276
		mov	ax, ss:4727h
		or	ax, ax
		jz	short loc_36276
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4627h
		sub	al, ss:471Fh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:4714h
		div	cx
		add	si, ax
		sub	ss:4729h, ax
		jg	short loc_3624D

locret_3624C:				; CODE XREF: seg132:0F9Fj seg132:0FC6j
		retn
; ���������������������������������������������������������������������������

loc_3624D:				; CODE XREF: seg132:100Aj
		mul	cx
		add	ss:471Fh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:471Fh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:4727h
		mov	ss:4719h, al
		jmp	short loc_36288
; ���������������������������������������������������������������������������

loc_36276:				; CODE XREF: seg132:0FDBj seg132:0FE3j
		mov	cx, ss:4714h
		add	ss:471Fh, cl
		adc	ch, 0
		mov	ss:4719h, ch

loc_36288:				; CODE XREF: seg132:1034j
		mov	ax, ss:4710h
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:470Eh
		mov	ah, ss:4627h
		mov	ch, ah
		mov	dl, ss:4626h
		mov	dh, dl
		mov	cl, ss:471Ah
		mov	al, ss:471Bh
		or	al, al
		jz	short loc_362C3

loc_362B8:				; CODE XREF: seg132:1081j
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	al, 0
		jg	short loc_362B8

loc_362C3:				; CODE XREF: seg132:1076j
		test	byte ptr ss:4724h, 1
		jz	short loc_362E0
		mov	bp, ss:470Eh
		sub	bp, ss:4737h
		jg	short loc_362E0
		neg	bp
		add	di, bp
		sub	cx, bp
		jmp	loc_363F0
; ���������������������������������������������������������������������������

loc_362E0:				; CODE XREF: seg132:1089j seg132:1095j
		cmp	byte ptr ss:4719h, 0
		jle	short loc_3633E

loc_362E8:				; CODE XREF: seg132:1120j
		mov	al, [si]

loc_362EA:				; CODE XREF: seg132:10FCj
		push	di
		push	dx
		push	cx
		xor	ch, ch
		mov	dx, ss:473Bh
		inc	dx
		sub	dx, ss:470Eh
		cmp	cx, dx
		jle	short loc_36366
		mov	cx, dx
		rep stosb
		pop	cx
		pop	dx
		pop	di
		sub	di, ss:473Fh

loc_3630A:				; CODE XREF: seg132:10DDj
		add	dl, bl
		jnb	short loc_3631B
		inc	cl
		dec	word ptr ss:470Eh
		dec	di
		dec	word ptr ss:472Fh

loc_3631B:				; CODE XREF: seg132:10CCj
		add	ch, bh
		jnb	short loc_3630A

loc_3631F:				; CODE XREF: seg132:10E6j
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_3631F
		dec	word ptr ss:4731h
		jle	short locret_36362
		cmp	word ptr ss:472Fh, 0
		jle	short loc_36363
		dec	byte ptr ss:4719h
		jg	short loc_362EA

loc_3633E:				; CODE XREF: seg132:10A6j seg132:113Aj
		mov	bp, cx
		mov	cx, ss:4714h

loc_36345:				; CODE XREF: seg132:1117j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_36362
		or	ch, ch
		jz	short loc_36345
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_362E8
; ���������������������������������������������������������������������������

locret_36362:				; CODE XREF: seg132:10EDj seg132:1113j
		retn
; ���������������������������������������������������������������������������

loc_36363:				; CODE XREF: seg132:10F5j
		jmp	loc_363E9
; ���������������������������������������������������������������������������

loc_36366:				; CODE XREF: seg132:10BCj
		pop	cx
		pop	dx
		pop	di
		test	byte ptr ss:4724h, 3
		jnz	short loc_36374
		jmp	loc_3573B
; ���������������������������������������������������������������������������

loc_36374:				; CODE XREF: seg132:112Fj
		cmp	byte ptr ss:4719h, 0
		jle	short loc_3633E

loc_3637C:				; CODE XREF: seg132:11A6j
		mov	al, [si]

loc_3637E:				; CODE XREF: seg132:1182j
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		sub	di, ss:473Fh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_36391:				; CODE XREF: seg132:1161j
		add	dl, bl
		jnb	short loc_3639F
		dec	word ptr ss:472Fh
		jle	short loc_3639F
		inc	cl
		dec	di

loc_3639F:				; CODE XREF: seg132:1153j seg132:115Aj
		add	ch, bh
		jnb	short loc_36391

loc_363A3:				; CODE XREF: seg132:116Cj
		add	dh, bl
		sbb	cl, 0
		jle	short locret_363E8
		add	ah, bh
		jnb	short loc_363A3
		dec	word ptr ss:4731h
		jle	short locret_363E8
		cmp	word ptr ss:472Fh, 0
		jle	short loc_363E9
		dec	byte ptr ss:4719h
		jg	short loc_3637E
		mov	bp, cx
		mov	cx, ss:4714h

loc_363CB:				; CODE XREF: seg132:119Dj
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_363E8
		or	ch, ch
		jz	short loc_363CB
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_3637C
; ���������������������������������������������������������������������������

locret_363E8:				; CODE XREF: seg132:1168j seg132:1173j ...
		retn
; ���������������������������������������������������������������������������

loc_363E9:				; CODE XREF: seg132:loc_36363j
					; seg132:117Bj
		dec	byte ptr ss:4719h
		jle	short loc_3641D

loc_363F0:				; CODE XREF: seg132:109Dj seg132:11FFj
		cmp	cl, 0
		jle	short locret_363E8
		mov	al, [si]

loc_363F7:				; CODE XREF: seg132:11DBj
		push	di
		push	cx
		xor	ch, ch
		rep stosb
		pop	cx
		pop	di
		sub	di, ss:473Fh

loc_36404:				; CODE XREF: seg132:11CDj
		add	dh, bl
		sbb	cl, 0
		jle	short locret_36441
		add	ah, bh
		jnb	short loc_36404
		dec	word ptr ss:4731h
		jle	short locret_36441
		dec	byte ptr ss:4719h
		jg	short loc_363F7

loc_3641D:				; CODE XREF: seg132:11AEj
		mov	bp, cx
		mov	cx, ss:4714h

loc_36424:				; CODE XREF: seg132:11F6j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_36441
		or	ch, ch
		jz	short loc_36424
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_363F0
; ���������������������������������������������������������������������������

locret_36441:				; CODE XREF: seg132:11C9j seg132:11D4j ...
		retn
; ���������������������������������������������������������������������������
		xor	ax, ax
		mov	al, ss:471Bh
		mov	ch, ss:471Ah
		xor	dx, dx
		or	ch, ch
		jz	short loc_3645F

loc_36453:				; CODE XREF: seg132:121Dj
		add	dh, bh
		adc	ax, 0
		add	dl, bl
		sbb	ch, 0
		jg	short loc_36453

loc_3645F:				; CODE XREF: seg132:1211j
		inc	ax
		mov	ss:471Ch, ax
		mov	dx, ax
		mov	ax, ss:4710h
		sub	ax, ss:473Dh
		jle	short loc_364D0
		sub	ax, dx
		jle	short loc_364D0
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4627h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_36493
		inc	ax

loc_36493:				; CODE XREF: seg132:1250j
		push	ax
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:4710h, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:470Eh, ax
		add	ss:4725h, ax
		or	byte ptr ss:4724h, 8

loc_364D0:				; CODE XREF: seg132:122Fj seg132:1233j
		mov	ax, ss:470Eh
		inc	ax
		sub	ax, ss:4737h
		jg	short loc_364DD

locret_364DC:				; CODE XREF: seg132:12C2j seg132:12DBj
		retn
; ���������������������������������������������������������������������������

loc_364DD:				; CODE XREF: seg132:129Aj
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4712h
		add	al, ss:471Eh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, bp
		cmp	ax, ss:473Bh
		jg	short locret_364DC
		cmp	ax, ss:4737h
		jge	short loc_36511
		or	byte ptr ss:4724h, 1

loc_36511:				; CODE XREF: seg132:12C9j
		mov	ax, ss:4710h
		inc	ax
		sub	ax, ss:4739h
		jle	short locret_364DC
		mov	ss:4731h, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4714h
		add	al, ss:471Fh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:471Ch
		neg	ax
		add	ax, di
		cmp	ax, ss:473Dh
		jg	short locret_36589
		cmp	ax, ss:4739h
		jge	short loc_36556
		or	byte ptr ss:4724h, 2

loc_36556:				; CODE XREF: seg132:130Ej
		test	byte ptr ss:4724h, 0Ch
		jz	short loc_365B3
		mov	ax, ss:4725h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4626h
		sub	al, ss:471Eh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:4712h
		div	cx
		add	si, ax
		sub	ss:4729h, ax
		jg	short loc_3658A

locret_36589:				; CODE XREF: seg132:1307j
		retn
; ���������������������������������������������������������������������������

loc_3658A:				; CODE XREF: seg132:1347j
		mul	cx
		add	ss:471Eh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:471Eh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:4725h
		mov	ss:4718h, al
		jmp	short loc_365C5
; ���������������������������������������������������������������������������

loc_365B3:				; CODE XREF: seg132:131Cj
		mov	cx, ss:4712h
		add	ss:471Eh, cl
		adc	ch, 0
		mov	ss:4718h, ch

loc_365C5:				; CODE XREF: seg132:1371j
		mov	ax, ss:4710h
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:470Eh
		mov	cl, ss:471Bh
		mov	al, ss:471Ah
		mov	ah, ss:4627h
		mov	ch, ah
		mov	dl, ss:4626h
		mov	dh, dl
		or	al, al
		jz	short loc_36600

loc_365F5:				; CODE XREF: seg132:13BEj
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	al, 0
		jg	short loc_365F5

loc_36600:				; CODE XREF: seg132:13B3j
		test	byte ptr ss:4724h, 2
		jz	short loc_36617
		push	cx
		xor	ch, ch
		inc	cx
		sub	ss:4731h, cx
		pop	cx
		jge	short loc_36617
		jmp	loc_36765
; ���������������������������������������������������������������������������

loc_36617:				; CODE XREF: seg132:13C6j seg132:13D2j
		mov	bp, ss:4710h
		cmp	bp, ss:473Dh
		jg	short loc_36626

loc_36623:				; CODE XREF: seg132:1410j
		jmp	loc_366CB
; ���������������������������������������������������������������������������

loc_36626:				; CODE XREF: seg132:13E1j
		mov	bp, ss:473Dh
		shl	bp, 1
		add	bp, ss:4735h
		mov	di, bp
		mov	di, ss:[di]
		add	di, ss:470Eh
		mov	bp, ss:4710h
		cmp	byte ptr ss:4718h, 0
		jz	short loc_366A5

loc_36649:				; CODE XREF: seg132:1485j
		mov	al, [si]

loc_3664B:				; CODE XREF: seg132:1463j
		cmp	bp, ss:473Dh
		jle	short loc_36623
		push	cx
		push	di
		push	dx
		mov	dx, bp
		sub	dx, ss:473Dh
		xor	ch, ch
		sub	cx, dx
		pop	dx
		jle	short loc_3666F

loc_36663:				; CODE XREF: seg132:142Dj
		mov	es:[di], al
		sub	di, ss:473Fh
		dec	cl
		jg	short loc_36663

loc_3666F:				; CODE XREF: seg132:1421j
		pop	di
		pop	cx
		dec	di

loc_36672:				; CODE XREF: seg132:144Cj
		add	ch, bh
		jnb	short loc_3668A
		dec	cl
		dec	word ptr ss:4731h
		dec	bp
		cmp	bp, ss:473Dh
		jge	short loc_3668A
		sub	di, ss:473Fh

loc_3668A:				; CODE XREF: seg132:1434j seg132:1443j
		add	dl, bl
		jnb	short loc_36672

loc_3668E:				; CODE XREF: seg132:1455j
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_3668E
		dec	word ptr ss:472Fh
		jz	short loc_366C8
		dec	byte ptr ss:4718h
		jnz	short loc_3664B

loc_366A5:				; CODE XREF: seg132:1407j
		push	cx
		mov	cx, ss:4712h

loc_366AB:				; CODE XREF: seg132:147Dj
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short loc_366C7
		or	ch, ch
		jle	short loc_366AB
		mov	ss:4718h, ch
		pop	cx
		jmp	short loc_36649
; ���������������������������������������������������������������������������

loc_366C7:				; CODE XREF: seg132:1479j
		pop	cx

loc_366C8:				; CODE XREF: seg132:145Cj
		jmp	locret_367E0
; ���������������������������������������������������������������������������

loc_366CB:				; CODE XREF: seg132:loc_36623j
		test	byte ptr ss:4724h, 3
		jnz	short loc_366D6
		jmp	loc_357CD
; ���������������������������������������������������������������������������

loc_366D6:				; CODE XREF: seg132:1491j
		mov	ss:4710h, bp
		mov	bp, ss:473Fh
		cmp	byte ptr ss:4718h, 0
		jz	short loc_3672D

loc_366E8:				; CODE XREF: seg132:1514j
		mov	al, [si]

loc_366EA:				; CODE XREF: seg132:14EBj
		push	cx
		push	di

loc_366EC:				; CODE XREF: seg132:14B3j
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_366EC
		pop	di
		pop	cx
		dec	di

loc_366F8:				; CODE XREF: seg132:14CCj
		add	ch, bh
		jnb	short loc_3670A
		dec	word ptr ss:4731h
		dec	cl
		sub	di, bp
		dec	word ptr ss:4710h

loc_3670A:				; CODE XREF: seg132:14BAj
		add	dl, bl
		jnb	short loc_366F8

loc_3670E:				; CODE XREF: seg132:14D5j
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_3670E
		dec	word ptr ss:472Fh
		jle	short locret_36756
		cmp	word ptr ss:4731h, 0
		jle	short loc_36757
		dec	byte ptr ss:4718h
		jnz	short loc_366EA

loc_3672D:				; CODE XREF: seg132:14A6j
		mov	bp, cx
		mov	cx, ss:4712h

loc_36734:				; CODE XREF: seg132:1506j
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_36756
		or	ch, ch
		jle	short loc_36734
		mov	ss:4718h, ch
		mov	cx, bp
		mov	bp, ss:473Fh
		jmp	short loc_366E8
; ���������������������������������������������������������������������������

locret_36756:				; CODE XREF: seg132:14DCj seg132:1502j
		retn
; ���������������������������������������������������������������������������

loc_36757:				; CODE XREF: seg132:14E4j
		test	byte ptr ss:4724h, 2
		jnz	short loc_36760
		retn
; ���������������������������������������������������������������������������

loc_36760:				; CODE XREF: seg132:151Dj
		dec	byte ptr ss:4718h

loc_36765:				; CODE XREF: seg132:13D4j
		mov	bp, ss:4710h
		cmp	byte ptr ss:4718h, 0
		jle	short loc_367BD

loc_36772:				; CODE XREF: seg132:159Dj
		mov	al, [si]

loc_36774:				; CODE XREF: seg132:157Bj
		push	cx
		push	di
		push	bp

loc_36777:				; CODE XREF: seg132:1549j
		cmp	bp, ss:4739h
		jl	short loc_3678B
		mov	es:[di], al
		sub	di, ss:473Fh
		dec	bp
		dec	cl
		jg	short loc_36777

loc_3678B:				; CODE XREF: seg132:153Cj
		pop	bp
		pop	di
		pop	cx
		dec	di
		dec	word ptr ss:472Fh
		jle	short locret_367E0

loc_36796:				; CODE XREF: seg132:156Bj
		add	ch, bh
		jnb	short loc_367A9
		dec	cl
		sub	di, ss:473Fh
		dec	bp
		cmp	bp, ss:4739h
		jl	short locret_367E0

loc_367A9:				; CODE XREF: seg132:1558j
		add	dl, bl
		jnb	short loc_36796

loc_367AD:				; CODE XREF: seg132:1574j
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_367AD
		dec	byte ptr ss:4718h
		jnz	short loc_36774

loc_367BD:				; CODE XREF: seg132:1530j
		push	cx
		mov	cx, ss:4712h

loc_367C3:				; CODE XREF: seg132:1595j
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short loc_367DF
		or	ch, ch
		jle	short loc_367C3
		mov	ss:4718h, ch
		pop	cx
		jmp	short loc_36772
; ���������������������������������������������������������������������������

loc_367DF:				; CODE XREF: seg132:1591j
		pop	cx

locret_367E0:				; CODE XREF: seg132:loc_366C8j
					; seg132:1554j	...
		retn
; ���������������������������������������������������������������������������

loc_367E1:				; DATA XREF: dseg:4648o
		call	sub_39753
		jb	short loc_36807
		call	sub_38BB6
		jnb	short loc_3680C
		mov	word ptr ss:4882h, 1BCEh
		mov	ax, 1CBFh
		cmp	bl, bh
		jb	short loc_36800
		mov	ax, 1FB0h

loc_36800:				; CODE XREF: seg132:15BBj
		mov	ss:4884h, ax
		jmp	loc_36BEB
; ���������������������������������������������������������������������������

loc_36807:				; CODE XREF: seg132:15A6j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3680C:				; CODE XREF: seg132:15ADj
		mov	word ptr ss:4882h, 16ADh
		mov	ax, 1702h
		cmp	bl, bh
		jb	short loc_3681D
		mov	ax, 1790h

loc_3681D:				; CODE XREF: seg132:15D8j
		mov	ss:4884h, ax
		jmp	loc_36BEB
; ���������������������������������������������������������������������������

loc_36824:				; DATA XREF: dseg:4668o
		call	sub_397F2
		jb	short loc_3684A
		call	sub_38BB6
		jnb	short loc_3684F
		mov	word ptr ss:4882h, 2349h
		mov	ax, 23BFh
		cmp	bl, bh
		jb	short loc_36843
		mov	ax, 2793h

loc_36843:				; CODE XREF: seg132:15FEj
		mov	ss:4884h, ax
		jmp	loc_36BEB
; ���������������������������������������������������������������������������

loc_3684A:				; CODE XREF: seg132:15E9j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3684F:				; CODE XREF: seg132:15F0j
		mov	word ptr ss:4882h, 182Ch
		mov	ax, 1881h
		cmp	bl, bh
		jb	short loc_36860
		mov	ax, 190Fh

loc_36860:				; CODE XREF: seg132:161Bj
		mov	ss:4884h, ax
		jmp	loc_36BEB
; ���������������������������������������������������������������������������

loc_36867:				; DATA XREF: dseg:4688o
		call	sub_3988F
		jb	short loc_3688D
		call	sub_38BB6
		jnb	short loc_36892
		mov	word ptr ss:4882h, 1BCEh
		mov	ax, 1CBFh
		cmp	bl, bh
		jb	short loc_36886
		mov	ax, 1FB0h

loc_36886:				; CODE XREF: seg132:1641j
		mov	ss:4884h, ax
		jmp	loc_36CF8
; ���������������������������������������������������������������������������

loc_3688D:				; CODE XREF: seg132:162Cj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_36892:				; CODE XREF: seg132:1633j
		mov	word ptr ss:4882h, 16ADh
		mov	ax, 1702h
		cmp	bl, bh
		jb	short loc_368A3
		mov	ax, 1790h

loc_368A3:				; CODE XREF: seg132:165Ej
		mov	ss:4884h, ax
		jmp	loc_36CF8
; ���������������������������������������������������������������������������

loc_368AA:				; DATA XREF: dseg:46A8o
		call	sub_3992A
		jb	short loc_368D0
		call	sub_38BB6
		jnb	short loc_368D5
		mov	word ptr ss:4882h, 2349h
		mov	ax, 23BFh
		cmp	bl, bh
		jb	short loc_368C9
		mov	ax, 2793h

loc_368C9:				; CODE XREF: seg132:1684j
		mov	ss:4884h, ax
		jmp	loc_36CF8
; ���������������������������������������������������������������������������

loc_368D0:				; CODE XREF: seg132:166Fj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_368D5:				; CODE XREF: seg132:1676j
		mov	word ptr ss:4882h, 182Ch
		mov	ax, 1881h
		cmp	bl, bh
		jb	short loc_368E6
		mov	ax, 190Fh

loc_368E6:				; CODE XREF: seg132:16A1j
		mov	ss:4884h, ax
		jmp	loc_36CF8
; ���������������������������������������������������������������������������
		add	ax, ss:4702h
		mul	word ptr ss:4720h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4627h, al
		mov	ss:471Fh, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:470Ah
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:4626h, al
		mov	ss:471Eh, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		mov	dx, ss:4708h
		sub	dx, ax
		add	di, dx
		mov	dl, cl
		jmp	word ptr ss:4884h
; ���������������������������������������������������������������������������
		mov	cx, ss:4714h
		add	ss:471Fh, cl
		adc	ch, 0
		mov	ss:4719h, ch
		mov	cx, ss:471Ah
		mov	al, ss:4627h
		mov	ah, al
		mov	dh, dl
		or	ch, ch
		jz	short loc_36971

loc_36965:				; CODE XREF: seg132:172Fj
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	ch, 0
		jg	short loc_36965

loc_36971:				; CODE XREF: seg132:1723j
		mov	ch, al

loc_36973:				; CODE XREF: seg132:1EE2j
		cmp	byte ptr ss:4719h, 0
		jle	short loc_369AB

loc_3697B:				; CODE XREF: seg132:178Dj
		mov	al, [si]

loc_3697D:				; CODE XREF: seg132:1769j
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		xor	ch, ch
		sub	di, cx
		mov	cx, bp
		add	di, ss:473Fh

loc_36990:				; CODE XREF: seg132:1759j
		add	dl, bl
		jnb	short loc_36997
		inc	cl
		dec	di

loc_36997:				; CODE XREF: seg132:1752j
		add	ch, bh
		jnb	short loc_36990

loc_3699B:				; CODE XREF: seg132:1762j
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_3699B
		dec	byte ptr ss:4719h
		jnz	short loc_3697D

loc_369AB:				; CODE XREF: seg132:1739j
		mov	bp, cx
		mov	cx, ss:4714h

loc_369B2:				; CODE XREF: seg132:1784j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_369CF
		or	ch, ch
		jz	short loc_369B2
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_3697B
; ���������������������������������������������������������������������������

locret_369CF:				; CODE XREF: seg132:1780j
		retn
; ���������������������������������������������������������������������������
		mov	cx, ss:4712h
		mov	ax, cx
		add	ss:471Eh, cl
		adc	ch, 0
		mov	ss:4718h, ch
		mov	cx, ss:471Ah
		mov	ah, ss:4627h
		xchg	ch, cl
		mov	dh, dl
		or	ch, ch
		jz	short loc_36A02

loc_369F6:				; CODE XREF: seg132:17C0j
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	ch, 0
		jnz	short loc_369F6

loc_36A02:				; CODE XREF: seg132:17B4j
		mov	ch, ss:4627h

loc_36A07:				; CODE XREF: seg132:224Fj
		mov	bp, ss:473Fh
		mov	al, [si]
		cmp	byte ptr ss:4718h, 0
		jz	short loc_36A42

loc_36A16:				; CODE XREF: seg132:1829j
		mov	al, [si]

loc_36A18:				; CODE XREF: seg132:1800j
		push	cx
		push	di

loc_36A1A:				; CODE XREF: seg132:17E1j
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_36A1A
		pop	di
		pop	cx
		dec	di

loc_36A26:				; CODE XREF: seg132:17F0j
		add	ch, bh
		jnb	short loc_36A2E
		inc	cl
		add	di, bp

loc_36A2E:				; CODE XREF: seg132:17E8j
		add	dl, bl
		jnb	short loc_36A26

loc_36A32:				; CODE XREF: seg132:17F9j
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_36A32
		dec	byte ptr ss:4718h
		jnz	short loc_36A18

loc_36A42:				; CODE XREF: seg132:17D4j
		mov	bp, cx
		mov	cx, ss:4712h

loc_36A49:				; CODE XREF: seg132:181Bj
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_36A6B
		or	ch, ch
		jle	short loc_36A49
		mov	ss:4718h, ch
		mov	cx, bp
		mov	bp, ss:473Fh
		jmp	short loc_36A16
; ���������������������������������������������������������������������������

locret_36A6B:				; CODE XREF: seg132:1817j
		retn
; ���������������������������������������������������������������������������
		add	ax, ss:4702h
		mul	word ptr ss:4720h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4627h, al
		mov	ss:471Fh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:470Ah
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		pop	ax
		mov	cl, bl
		mul	cx
		mov	ss:4626h, al
		mov	ss:471Eh, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4708h
		add	di, ax
		mov	dl, cl
		jmp	word ptr ss:4884h
; ���������������������������������������������������������������������������
		mov	cx, ss:4714h
		add	ss:471Fh, cl
		adc	ch, 0
		mov	ss:4719h, ch
		mov	cx, ss:471Ah
		mov	al, ss:4627h
		mov	ah, al
		mov	dh, dl
		or	ch, ch
		jz	short loc_36AF0

loc_36AE4:				; CODE XREF: seg132:18AEj
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	ch, 0
		jg	short loc_36AE4

loc_36AF0:				; CODE XREF: seg132:18A2j
		mov	ch, al

loc_36AF2:				; CODE XREF: seg132:2694j
		cmp	byte ptr ss:4719h, 0
		jle	short loc_36B2A

loc_36AFA:				; CODE XREF: seg132:190Cj
		mov	al, [si]

loc_36AFC:				; CODE XREF: seg132:18E8j
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		xor	ch, ch
		sub	di, cx
		mov	cx, bp
		sub	di, ss:473Fh

loc_36B0F:				; CODE XREF: seg132:18D8j
		add	dl, bl
		jnb	short loc_36B16
		dec	cl
		inc	di

loc_36B16:				; CODE XREF: seg132:18D1j
		add	ch, bh
		jnb	short loc_36B0F

loc_36B1A:				; CODE XREF: seg132:18E1j
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_36B1A
		dec	byte ptr ss:4719h
		jnz	short loc_36AFC

loc_36B2A:				; CODE XREF: seg132:18B8j
		mov	bp, cx
		mov	cx, ss:4714h

loc_36B31:				; CODE XREF: seg132:1903j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_36B4E
		or	ch, ch
		jz	short loc_36B31
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_36AFA
; ���������������������������������������������������������������������������

locret_36B4E:				; CODE XREF: seg132:18FFj
		retn
; ���������������������������������������������������������������������������
		mov	cx, ss:4712h
		mov	ax, cx
		add	ss:471Eh, cl
		adc	ch, 0
		mov	ss:4718h, ch
		mov	cx, ss:471Ah
		mov	ah, ss:4627h
		xchg	ch, cl
		mov	dh, dl
		or	ch, ch
		jz	short loc_36B81

loc_36B75:				; CODE XREF: seg132:193Fj
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	ch, 0
		jnz	short loc_36B75

loc_36B81:				; CODE XREF: seg132:1933j
		mov	ch, ss:4627h

loc_36B86:				; CODE XREF: seg132:2A8Bj
		mov	bp, ss:473Fh
		mov	al, [si]
		cmp	byte ptr ss:4718h, 0
		jz	short loc_36BC1

loc_36B95:				; CODE XREF: seg132:19A8j
		mov	al, [si]

loc_36B97:				; CODE XREF: seg132:197Fj
		push	cx
		push	di

loc_36B99:				; CODE XREF: seg132:1960j
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_36B99
		pop	di
		pop	cx
		inc	di

loc_36BA5:				; CODE XREF: seg132:196Fj
		add	ch, bh
		jnb	short loc_36BAD
		dec	cl
		sub	di, bp

loc_36BAD:				; CODE XREF: seg132:1967j
		add	dl, bl
		jnb	short loc_36BA5

loc_36BB1:				; CODE XREF: seg132:1978j
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_36BB1
		dec	byte ptr ss:4718h
		jnz	short loc_36B97

loc_36BC1:				; CODE XREF: seg132:1953j
		mov	bp, cx
		mov	cx, ss:4712h

loc_36BC8:				; CODE XREF: seg132:199Aj
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_36BEA
		or	ch, ch
		jle	short loc_36BC8
		mov	ss:4718h, ch
		mov	cx, bp
		mov	bp, ss:473Fh
		jmp	short loc_36B95
; ���������������������������������������������������������������������������

locret_36BEA:				; CODE XREF: seg132:1996j
		retn
; ���������������������������������������������������������������������������

loc_36BEB:				; CODE XREF: seg132:15C4j seg132:15E1j ...
		mov	word ptr ss:4624h, 0

loc_36BF2:				; CODE XREF: seg132:loc_36CF0j
		mov	dx, ss:4714h
		add	ss:4624h, dl
		adc	dh, 0
		mov	cx, ss:4712h
		add	ss:4625h, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:471Ah, cx
		cmp	bl, bh
		jnb	short loc_36C27
		xor	ax, ax
		mov	al, cl
		sub	ss:4708h, ax
		mov	al, ch
		sub	ss:470Ah, ax

loc_36C27:				; CODE XREF: seg132:19D5j
		or	cx, cx
		jnz	short loc_36C2E
		jmp	loc_36CCB
; ���������������������������������������������������������������������������

loc_36C2E:				; CODE XREF: seg132:19E9j
					; seg132:loc_36C63j ...
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_36C37
		jmp	loc_36CF3
; ���������������������������������������������������������������������������

loc_36C37:				; CODE XREF: seg132:19F2j
		mov	dx, [si+4]
		cmp	dx, ss:46EEh
		jz	short loc_36C65
		jl	short loc_36C46
		jmp	loc_36CCB
; ���������������������������������������������������������������������������

loc_36C46:				; CODE XREF: seg132:1A01j
		add	si, 6
		shr	ax, 1
		jb	short loc_36C51
		add	si, ax
		jmp	short loc_36C63
; ���������������������������������������������������������������������������

loc_36C51:				; CODE XREF: seg132:1A0Bj
		push	di
		mov	di, ax

loc_36C54:				; CODE XREF: seg132:1A20j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_36C5E
		add	si, ax
		dec	si

loc_36C5E:				; CODE XREF: seg132:1A19j
		sub	di, ax
		jnz	short loc_36C54
		pop	di

loc_36C63:				; CODE XREF: seg132:1A0Fj
		jmp	short loc_36C2E
; ���������������������������������������������������������������������������

loc_36C65:				; CODE XREF: seg132:19FFj
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_36CB5
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_36C7E:				; CODE XREF: seg132:1A50j seg132:1A63j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_36C94
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_36C7E
		jz	short loc_36CA5

loc_36C94:				; CODE XREF: seg132:1A44j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_36C7E

loc_36CA5:				; CODE XREF: seg132:1A52j
		pop	es
		pop	ax
		mov	bx, ss:4716h
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_36CC1
; ���������������������������������������������������������������������������

loc_36CB5:				; CODE XREF: seg132:1A2Bj
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_36CC1:				; CODE XREF: seg132:1A73j
		call	word ptr ss:4882h
		pop	ds
		pop	si
		jmp	loc_36C2E
; ���������������������������������������������������������������������������

loc_36CCB:				; CODE XREF: seg132:19EBj seg132:1A03j
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_36CF3
		mov	cx, ss:471Ah
		cmp	bl, bh
		jb	short loc_36CF0
		xor	ax, ax
		mov	al, cl
		sub	ss:4708h, ax
		mov	al, ch
		sub	ss:470Ah, ax

loc_36CF0:				; CODE XREF: seg132:1A9Ej
		jmp	loc_36BF2
; ���������������������������������������������������������������������������

loc_36CF3:				; CODE XREF: seg132:19F4j seg132:1A95j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_36CF8:				; CODE XREF: seg132:164Aj seg132:1667j ...
		cmp	bl, bh
		jb	short loc_36D01
		dec	word ptr ss:470Ah

loc_36D01:				; CODE XREF: seg132:1ABAj
		mov	word ptr ss:4624h, 0

loc_36D08:				; CODE XREF: seg132:loc_36E06j
		mov	dx, ss:4714h
		add	ss:4624h, dl
		adc	dh, 0
		mov	cx, ss:4712h
		add	ss:4625h, cl
		adc	ch, 0
		mov	cl, dh
		mov	ss:471Ah, cx
		cmp	bl, bh
		jb	short loc_36D3D
		xor	ax, ax
		mov	al, cl
		add	ss:4708h, ax
		mov	al, ch
		add	ss:470Ah, ax

loc_36D3D:				; CODE XREF: seg132:1AEBj
		or	cx, cx
		jnz	short loc_36D44
		jmp	loc_36DE1
; ���������������������������������������������������������������������������

loc_36D44:				; CODE XREF: seg132:1AFFj
					; seg132:loc_36D79j ...
		mov	ax, [si]
		or	ax, ax
		jnz	short loc_36D4D
		jmp	loc_36E09
; ���������������������������������������������������������������������������

loc_36D4D:				; CODE XREF: seg132:1B08j
		mov	dx, [si+4]
		cmp	dx, ss:46EEh
		jz	short loc_36D7B
		jl	short loc_36D5C
		jmp	loc_36DE1
; ���������������������������������������������������������������������������

loc_36D5C:				; CODE XREF: seg132:1B17j
		add	si, 6
		shr	ax, 1
		jb	short loc_36D67
		add	si, ax
		jmp	short loc_36D79
; ���������������������������������������������������������������������������

loc_36D67:				; CODE XREF: seg132:1B21j
		push	di
		mov	di, ax

loc_36D6A:				; CODE XREF: seg132:1B36j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_36D74
		add	si, ax
		dec	si

loc_36D74:				; CODE XREF: seg132:1B2Fj
		sub	di, ax
		jnz	short loc_36D6A
		pop	di

loc_36D79:				; CODE XREF: seg132:1B25j
		jmp	short loc_36D44
; ���������������������������������������������������������������������������

loc_36D7B:				; CODE XREF: seg132:1B15j
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_36DCB
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_36D94:				; CODE XREF: seg132:1B66j seg132:1B79j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_36DAA
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_36D94
		jz	short loc_36DBB

loc_36DAA:				; CODE XREF: seg132:1B5Aj
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_36D94

loc_36DBB:				; CODE XREF: seg132:1B68j
		pop	es
		pop	ax
		mov	bx, ss:4716h
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_36DD7
; ���������������������������������������������������������������������������

loc_36DCB:				; CODE XREF: seg132:1B41j
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_36DD7:				; CODE XREF: seg132:1B89j
		call	word ptr ss:4882h
		pop	ds
		pop	si
		jmp	loc_36D44
; ���������������������������������������������������������������������������

loc_36DE1:				; CODE XREF: seg132:1B01j seg132:1B19j
		inc	word ptr ss:46EEh
		dec	word ptr ss:46F2h
		jz	short loc_36E09
		mov	cx, ss:471Ah
		cmp	bl, bh
		jnb	short loc_36E06
		xor	ax, ax
		mov	al, cl
		add	ss:4708h, ax
		mov	al, ch
		add	ss:470Ah, ax

loc_36E06:				; CODE XREF: seg132:1BB4j
		jmp	loc_36D08
; ���������������������������������������������������������������������������

loc_36E09:				; CODE XREF: seg132:1B0Aj seg132:1BABj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		add	ax, ss:4702h
		mul	word ptr ss:4720h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4627h, al
		mov	cx, ss:4714h
		add	al, cl
		adc	ch, 0
		mov	ss:4719h, ch
		mov	ss:471Fh, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:470Ah
		mov	ss:4710h, ax
		mov	di, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		mov	ss:4626h, al
		mov	ss:471Eh, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		mov	dx, ss:4708h
		sub	dx, ax
		mov	ax, dx
		mov	ss:470Eh, ax
		mov	bp, ax
		mov	word ptr ss:4725h, 0
		mov	word ptr ss:4727h, 0
		mov	byte ptr ss:4724h, 0
		cmp	ax, ss:4737h
		jge	short loc_36E89
		retn
; ���������������������������������������������������������������������������

loc_36E89:				; CODE XREF: seg132:1C46j
		mov	ax, ss:4710h
		sub	ax, ss:4739h
		jge	short loc_36EFA
		or	ax, ax
		jns	short loc_36E9A
		neg	ax

loc_36E9A:				; CODE XREF: seg132:1C56j
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4627h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_36EB8
		inc	ax

loc_36EB8:				; CODE XREF: seg132:1C75j
		push	ax
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4727h, ax
		add	ss:4710h, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:470Eh, ax
		add	ss:4725h, ax
		or	byte ptr ss:4724h, 2

loc_36EFA:				; CODE XREF: seg132:1C52j
		jmp	word ptr ss:4884h
; ���������������������������������������������������������������������������
		mov	ax, ss:470Eh
		sub	ax, ss:473Bh
		jle	short loc_36F63
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_36F28
		inc	ax

loc_36F28:				; CODE XREF: seg132:1CE5j
		push	ax
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:470Eh, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4710h, ax
		add	ss:4727h, ax
		or	byte ptr ss:4724h, 4

loc_36F63:				; CODE XREF: seg132:1CC8j
		mov	ax, ss:470Eh
		inc	ax
		sub	ax, ss:4737h
		jg	short loc_36F70
		retn
; ���������������������������������������������������������������������������

loc_36F70:				; CODE XREF: seg132:1D2Dj
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4712h
		add	al, ss:471Eh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, bp
		sub	dx, ax
		cmp	dx, ss:473Bh
		jle	short loc_36F98
		retn
; ���������������������������������������������������������������������������

loc_36F98:				; CODE XREF: seg132:1D55j
		cmp	dx, ss:4737h
		jge	short loc_36FA5
		or	byte ptr ss:4724h, 1

loc_36FA5:				; CODE XREF: seg132:1D5Dj
		mov	ax, ss:473Dh
		inc	ax
		sub	ax, ss:4710h
		mov	ss:4731h, ax
		jle	short locret_3701A
		mov	ax, ss:4729h
		mul	word ptr ss:4714h
		add	al, ss:471Fh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:4739h
		jl	short locret_3701A
		cmp	ax, ss:473Dh
		jle	short loc_36FE3
		or	byte ptr ss:4724h, 8

loc_36FE3:				; CODE XREF: seg132:1D9Bj
		test	byte ptr ss:4724h, 6
		jz	short loc_37044
		mov	ax, ss:4727h
		or	ax, ax
		jz	short locret_3701A
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4627h
		sub	al, ss:471Fh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:4714h
		div	cx
		add	si, ax
		sub	ss:4729h, ax
		jg	short loc_3701B

locret_3701A:				; CODE XREF: seg132:1D73j seg132:1D94j ...
		retn
; ���������������������������������������������������������������������������

loc_3701B:				; CODE XREF: seg132:1DD8j
		mul	cx
		add	ss:471Fh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:471Fh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:4727h
		mov	ss:4719h, al
		jmp	short loc_37056
; ���������������������������������������������������������������������������

loc_37044:				; CODE XREF: seg132:1DA9j
		mov	cx, ss:4714h
		add	ss:471Fh, cl
		adc	ch, 0
		mov	ss:4719h, ch

loc_37056:				; CODE XREF: seg132:1E02j
		mov	ax, ss:4710h
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:470Eh
		mov	ah, ss:4627h
		mov	ch, ah
		mov	dl, ss:4626h
		mov	dh, dl
		mov	cl, ss:471Ah
		mov	al, ss:471Bh
		or	al, al
		jz	short loc_37091

loc_37086:				; CODE XREF: seg132:1E4Fj
		sub	dh, bl
		adc	cl, 0
		sub	ah, bh
		sbb	al, 0
		jg	short loc_37086

loc_37091:				; CODE XREF: seg132:1E44j
		cmp	byte ptr ss:4719h, 0
		jle	short loc_370EF

loc_37099:				; CODE XREF: seg132:1ED1j
		mov	al, [si]

loc_3709B:				; CODE XREF: seg132:1EADj
		push	di
		push	dx
		push	cx
		xor	ch, ch
		mov	dx, ss:473Bh
		inc	dx
		sub	dx, ss:470Eh
		cmp	cx, dx
		jle	short loc_37117
		mov	cx, dx
		rep stosb
		pop	cx
		pop	dx
		pop	di
		add	di, ss:473Fh

loc_370BB:				; CODE XREF: seg132:1E8Ej
		add	dl, bl
		jnb	short loc_370CC
		inc	cl
		dec	word ptr ss:470Eh
		dec	di
		dec	word ptr ss:472Fh

loc_370CC:				; CODE XREF: seg132:1E7Dj
		add	ch, bh
		jnb	short loc_370BB

loc_370D0:				; CODE XREF: seg132:1E97j
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_370D0
		dec	word ptr ss:4731h
		jle	short locret_37113
		cmp	word ptr ss:472Fh, 0
		jle	short loc_37114
		dec	byte ptr ss:4719h
		jg	short loc_3709B

loc_370EF:				; CODE XREF: seg132:1E57j seg132:1EEBj
		mov	bp, cx
		mov	cx, ss:4714h

loc_370F6:				; CODE XREF: seg132:1EC8j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_37113
		or	ch, ch
		jz	short loc_370F6
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_37099
; ���������������������������������������������������������������������������

locret_37113:				; CODE XREF: seg132:1E9Ej seg132:1EC4j
		retn
; ���������������������������������������������������������������������������

loc_37114:				; CODE XREF: seg132:1EA6j
		jmp	loc_37198
; ���������������������������������������������������������������������������

loc_37117:				; CODE XREF: seg132:1E6Dj
		pop	cx
		pop	dx
		pop	di
		test	byte ptr ss:4724h, 9
		jnz	short loc_37125
		jmp	loc_36973
; ���������������������������������������������������������������������������

loc_37125:				; CODE XREF: seg132:1EE0j
		cmp	byte ptr ss:4719h, 0
		jle	short loc_370EF

loc_3712D:				; CODE XREF: seg132:1F55j
		mov	al, [si]

loc_3712F:				; CODE XREF: seg132:1F31j
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		add	di, ss:473Fh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_37142:				; CODE XREF: seg132:1F12j
		add	dl, bl
		jnb	short loc_37150
		dec	word ptr ss:472Fh
		jle	short loc_37150
		inc	cl
		dec	di

loc_37150:				; CODE XREF: seg132:1F04j seg132:1F0Bj
		add	ch, bh
		jnb	short loc_37142

loc_37154:				; CODE XREF: seg132:1F1Bj
		add	dh, bl
		sbb	cl, 0
		add	ah, bh
		jnb	short loc_37154
		dec	word ptr ss:4731h
		jle	short locret_37197
		cmp	word ptr ss:472Fh, 0
		jle	short loc_37198
		dec	byte ptr ss:4719h
		jg	short loc_3712F
		mov	bp, cx
		mov	cx, ss:4714h

loc_3717A:				; CODE XREF: seg132:1F4Cj
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_37197
		or	ch, ch
		jz	short loc_3717A
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_3712D
; ���������������������������������������������������������������������������

locret_37197:				; CODE XREF: seg132:1F22j seg132:1F48j ...
		retn
; ���������������������������������������������������������������������������

loc_37198:				; CODE XREF: seg132:loc_37114j
					; seg132:1F2Aj
		or	cl, cl
		jle	short locret_37197
		dec	byte ptr ss:4719h
		jle	short loc_371CB

loc_371A3:				; CODE XREF: seg132:1FADj
		mov	al, [si]

loc_371A5:				; CODE XREF: seg132:1F89j
		push	di
		push	cx
		xor	ch, ch
		rep stosb
		pop	cx
		pop	di
		add	di, ss:473Fh

loc_371B2:				; CODE XREF: seg132:1F7Bj
		add	dh, bl
		sbb	cl, 0
		jz	short locret_371EF
		add	ah, bh
		jnb	short loc_371B2
		dec	word ptr ss:4731h
		jle	short locret_371EF
		dec	byte ptr ss:4719h
		jg	short loc_371A5

loc_371CB:				; CODE XREF: seg132:1F61j
		mov	bp, cx
		mov	cx, ss:4714h

loc_371D2:				; CODE XREF: seg132:1FA4j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_371EF
		or	ch, ch
		jz	short loc_371D2
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_371A3
; ���������������������������������������������������������������������������

locret_371EF:				; CODE XREF: seg132:1F77j seg132:1F82j ...
		retn
; ���������������������������������������������������������������������������
		xor	ax, ax
		mov	ch, ss:471Ah
		mov	al, ss:471Bh
		xor	dx, dx
		or	ch, ch
		jz	short loc_3720D

loc_37201:				; CODE XREF: seg132:1FCBj
		sub	dh, bh
		adc	ax, 0
		sub	dl, bl
		sbb	ch, 0
		jg	short loc_37201

loc_3720D:				; CODE XREF: seg132:1FBFj
		inc	ax
		mov	ss:471Ch, ax
		mov	ax, ss:470Eh
		sub	ax, ss:473Bh
		jg	short loc_3721F
		jmp	short loc_37278
; ���������������������������������������������������������������������������

loc_3721F:				; CODE XREF: seg132:1FDBj
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_3723D
		inc	ax

loc_3723D:				; CODE XREF: seg132:1FFAj
		push	ax
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:470Eh, ax
		add	ss:4725h, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4710h, ax
		or	byte ptr ss:4724h, 4

loc_37278:				; CODE XREF: seg132:1FDDj
		mov	ax, ss:470Eh
		inc	ax
		sub	ax, ss:4737h
		jg	short loc_37285

locret_37284:				; CODE XREF: seg132:206Aj
		retn
; ���������������������������������������������������������������������������

loc_37285:				; CODE XREF: seg132:2042j
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4712h
		add	al, ss:471Eh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	dx, bp
		sub	dx, ax
		cmp	dx, ss:473Bh
		jg	short locret_37284
		cmp	dx, ss:4737h
		jge	short loc_372B9
		or	byte ptr ss:4724h, 1

loc_372B9:				; CODE XREF: seg132:2071j
		mov	ax, ss:473Dh
		inc	ax
		sub	ax, ss:4710h
		mov	ss:4731h, ax
		jg	short loc_372D2
		add	ax, ss:471Ch
		jle	short locret_37333
		jg	short loc_372FA

loc_372D2:				; CODE XREF: seg132:2087j
		mov	ax, ss:4729h
		mul	word ptr ss:4714h
		add	al, ss:471Fh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, di
		cmp	ax, ss:4739h
		jl	short locret_37333
		cmp	ax, ss:473Dh
		jl	short loc_37300

loc_372FA:				; CODE XREF: seg132:2090j
		or	byte ptr ss:4724h, 8

loc_37300:				; CODE XREF: seg132:20B8j
		test	byte ptr ss:4724h, 6
		jz	short loc_3735D
		mov	ax, ss:4725h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4626h
		sub	al, ss:471Eh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:4712h
		div	cx
		add	si, ax
		sub	ss:4729h, ax
		jg	short loc_37334

locret_37333:				; CODE XREF: seg132:208Ej seg132:20B1j
		retn
; ���������������������������������������������������������������������������

loc_37334:				; CODE XREF: seg132:20F1j
		mul	cx
		add	ss:471Eh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:471Eh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:4725h
		mov	ss:4718h, al
		jmp	short loc_3736F
; ���������������������������������������������������������������������������

loc_3735D:				; CODE XREF: seg132:20C6j
		mov	cx, ss:4712h
		add	ss:471Eh, cl
		adc	ch, 0
		mov	ss:4718h, ch

loc_3736F:				; CODE XREF: seg132:211Bj
		mov	ax, ss:4710h
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:470Eh
		mov	cl, ss:471Bh
		mov	al, ss:471Ah
		mov	ah, ss:4627h
		mov	ch, ah
		mov	dl, ss:4626h
		mov	dh, dl
		or	al, al
		jz	short loc_373AA

loc_3739F:				; CODE XREF: seg132:2168j
		sub	ah, bh
		adc	cl, 0
		sub	dh, bl
		sbb	al, 0
		jg	short loc_3739F

loc_373AA:				; CODE XREF: seg132:215Dj
		mov	bp, ss:4710h
		cmp	bp, ss:473Dh
		jl	short loc_373E1
		jz	short loc_373DE
		sub	bp, ss:473Dh
		mov	al, ch
		xor	ch, ch
		sub	cx, bp
		mov	ch, al
		jg	short loc_373C8
		retn
; ���������������������������������������������������������������������������

loc_373C8:				; CODE XREF: seg132:2185j
		mov	bp, ss:473Dh
		shl	bp, 1
		add	bp, ss:4735h
		mov	di, bp
		mov	di, ss:[di]
		add	di, ss:470Eh

loc_373DE:				; CODE XREF: seg132:2176j
		jmp	loc_3751D
; ���������������������������������������������������������������������������

loc_373E1:				; CODE XREF: seg132:2174j
		push	cx
		xor	ch, ch
		dec	cx
		sub	bp, cx
		pop	cx
		cmp	bp, ss:4739h
		jl	short loc_373F2

loc_373EF:				; CODE XREF: seg132:21C1j
		jmp	loc_37487
; ���������������������������������������������������������������������������

loc_373F2:				; CODE XREF: seg132:21ADj
		cmp	byte ptr ss:4718h, 0
		jz	short loc_37460

loc_373FA:				; CODE XREF: seg132:2240j
		mov	al, [si]

loc_373FC:				; CODE XREF: seg132:221Ej
		cmp	bp, ss:4739h
		jge	short loc_373EF
		push	cx
		push	di
		push	dx
		mov	dx, bp
		sub	dx, ss:4739h
		xor	ch, ch
		add	cx, dx
		pop	dx

loc_37412:				; CODE XREF: seg132:21DCj
		mov	es:[di], al
		sub	di, ss:473Fh
		dec	cl
		jg	short loc_37412
		pop	di
		pop	cx
		dec	di
		dec	word ptr ss:470Eh

loc_37426:				; CODE XREF: seg132:21F8j
		add	ch, bh
		jnb	short loc_37436
		inc	cl
		add	di, ss:473Fh
		dec	word ptr ss:4731h

loc_37436:				; CODE XREF: seg132:21E8j
		add	dl, bl
		jnb	short loc_37426

loc_3743A:				; CODE XREF: seg132:2203j
		add	ah, bh
		jnb	short loc_37441
		inc	bp
		dec	cl

loc_37441:				; CODE XREF: seg132:21FCj
		add	dh, bl
		jnb	short loc_3743A
		dec	word ptr ss:472Fh
		jz	short loc_37484
		push	ax
		mov	ax, ss:470Eh
		cmp	ax, ss:4737h
		pop	ax
		jl	short loc_37484
		dec	byte ptr ss:4718h
		jnz	short loc_373FC

loc_37460:				; CODE XREF: seg132:21B8j
		push	cx
		mov	cx, ss:4712h

loc_37466:				; CODE XREF: seg132:2238j
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short loc_37483
		or	ch, ch
		jle	short loc_37466
		mov	ss:4718h, ch
		pop	cx
		jmp	loc_373FA
; ���������������������������������������������������������������������������

loc_37483:				; CODE XREF: seg132:2234j
		pop	cx

loc_37484:				; CODE XREF: seg132:220Aj seg132:2217j
		jmp	locret_37588
; ���������������������������������������������������������������������������

loc_37487:				; CODE XREF: seg132:loc_373EFj
		test	byte ptr ss:4724h, 9
		jnz	short loc_37492
		jmp	loc_36A07
; ���������������������������������������������������������������������������

loc_37492:				; CODE XREF: seg132:224Dj
		mov	bp, ss:473Fh
		cmp	byte ptr ss:4718h, 0
		jz	short loc_374E6

loc_3749F:				; CODE XREF: seg132:22CDj
		mov	al, [si]

loc_374A1:				; CODE XREF: seg132:22A4j
		push	cx
		push	di

loc_374A3:				; CODE XREF: seg132:226Aj
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_374A3
		pop	di
		pop	cx
		dec	di

loc_374AF:				; CODE XREF: seg132:2280j
		add	ch, bh
		jnb	short loc_374BE
		dec	word ptr ss:4731h
		jle	short loc_374BE
		inc	cl
		add	di, bp

loc_374BE:				; CODE XREF: seg132:2271j seg132:2278j
		add	dl, bl
		jnb	short loc_374AF

loc_374C2:				; CODE XREF: seg132:2289j
		add	ah, bh
		sbb	cl, 0
		add	dh, bl
		jnb	short loc_374C2
		dec	word ptr ss:470Eh
		dec	word ptr ss:472Fh
		jle	short locret_3750F
		cmp	word ptr ss:4731h, 0
		jle	short loc_37510
		dec	byte ptr ss:4718h
		jnz	short loc_374A1

loc_374E6:				; CODE XREF: seg132:225Dj
		mov	bp, cx
		mov	cx, ss:4712h

loc_374ED:				; CODE XREF: seg132:22BFj
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_3750F
		or	ch, ch
		jle	short loc_374ED
		mov	ss:4718h, ch
		mov	cx, bp
		mov	bp, ss:473Fh
		jmp	short loc_3749F
; ���������������������������������������������������������������������������

locret_3750F:				; CODE XREF: seg132:2295j seg132:22BBj
		retn
; ���������������������������������������������������������������������������

loc_37510:				; CODE XREF: seg132:229Dj
		test	byte ptr ss:4724h, 8
		jz	short locret_37588
		dec	byte ptr ss:4718h

loc_3751D:				; CODE XREF: seg132:loc_373DEj
		mov	bp, ss:470Eh
		cmp	bp, ss:473Bh
		jg	short locret_37588
		cmp	byte ptr ss:4718h, 0
		jle	short loc_37565

loc_37531:				; CODE XREF: seg132:2345j
		mov	al, [si]

loc_37533:				; CODE XREF: seg132:2323j
		push	cx
		push	di

loc_37535:				; CODE XREF: seg132:22FFj
		mov	es:[di], al
		sub	di, ss:473Fh
		dec	cl
		jg	short loc_37535
		pop	di
		pop	cx
		dec	di
		dec	bp
		cmp	bp, ss:4737h
		jl	short locret_37588

loc_3754C:				; CODE XREF: seg132:2315j
		add	ah, bh
		sbb	cl, 0
		jle	short locret_37588
		add	dh, bl
		jnb	short loc_3754C
		dec	word ptr ss:472Fh
		jle	short locret_37588
		dec	byte ptr ss:4718h
		jnz	short loc_37533

loc_37565:				; CODE XREF: seg132:22EFj
		push	cx
		mov	cx, ss:4712h

loc_3756B:				; CODE XREF: seg132:233Dj
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short loc_37587
		or	ch, ch
		jle	short loc_3756B
		mov	ss:4718h, ch
		pop	cx
		jmp	short loc_37531
; ���������������������������������������������������������������������������

loc_37587:				; CODE XREF: seg132:2339j
		pop	cx

locret_37588:				; CODE XREF: seg132:loc_37484j
					; seg132:22D6j	...
		retn
; ���������������������������������������������������������������������������
		add	ax, ss:4702h
		mul	word ptr ss:4720h
		mov	al, ah
		mov	ah, dl
		push	ax
		xor	cx, cx
		mov	cl, bh
		mul	cx
		mov	ss:4627h, al
		mov	cx, ss:4714h
		add	al, cl
		adc	ch, 0
		mov	ss:4719h, ch
		mov	ss:471Fh, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, ss:470Ah
		mov	ss:4710h, ax
		mov	di, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		mov	ss:4626h, al
		mov	ss:471Eh, al
		mov	cl, al
		mov	al, ah
		mov	ah, dl
		add	ax, ss:4708h
		mov	ss:470Eh, ax
		mov	bp, ax
		mov	word ptr ss:4725h, 0
		mov	word ptr ss:4727h, 0
		mov	byte ptr ss:4724h, 0
		jmp	word ptr ss:4884h
; ���������������������������������������������������������������������������
		xor	ax, ax
		mov	al, ss:471Ah
		mov	ch, ss:471Bh
		xor	dx, dx
		or	ch, ch
		jz	short loc_3761C

loc_37610:				; CODE XREF: seg132:23DAj
		add	dl, bl
		adc	ax, 0
		add	dh, bh
		sbb	ch, 0
		jg	short loc_37610

loc_3761C:				; CODE XREF: seg132:23CEj
		inc	ax
		mov	ss:471Ch, ax
		mov	dx, ax
		mov	ax, ss:470Eh
		add	ax, dx
		sub	ax, ss:4737h
		jl	short loc_37632
		jmp	short loc_37691
; ���������������������������������������������������������������������������

loc_37632:				; CODE XREF: seg132:23EEj
		or	ax, ax
		jns	short loc_37638
		neg	ax

loc_37638:				; CODE XREF: seg132:23F4j
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_37656
		inc	ax

loc_37656:				; CODE XREF: seg132:2413j
		push	ax
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:470Eh, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:4710h, ax
		add	ss:4727h, ax
		or	byte ptr ss:4724h, 1

loc_37691:				; CODE XREF: seg132:23F0j
		mov	ax, ss:4710h
		sub	ax, ss:473Dh
		jle	short loc_376F7
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4627h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_376BA
		inc	ax

loc_376BA:				; CODE XREF: seg132:2477j
		push	ax
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:4727h, ax
		sub	ss:4710h, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:470Eh, ax
		or	byte ptr ss:4724h, 8

loc_376F7:				; CODE XREF: seg132:245Aj
		mov	ax, ss:473Bh
		inc	ax
		sub	ax, ss:470Eh
		jg	short loc_37704
		retn
; ���������������������������������������������������������������������������

loc_37704:				; CODE XREF: seg132:24C1j
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4712h
		add	al, ss:471Eh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, bp
		stc
		adc	al, ss:471Ah
		adc	ah, 0
		cmp	ax, ss:4737h
		jge	short loc_37733
		retn
; ���������������������������������������������������������������������������

loc_37733:				; CODE XREF: seg132:24F0j
		cmp	ax, ss:473Bh
		jle	short loc_37740
		or	byte ptr ss:4724h, 4

loc_37740:				; CODE XREF: seg132:24F8j
		mov	ax, ss:4710h
		inc	ax
		sub	ax, ss:4739h
		jle	short locret_377B7
		mov	ss:4731h, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4714h
		add	al, ss:471Fh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, di
		cmp	ax, ss:473Dh
		jg	short locret_377B7
		cmp	ax, ss:4739h
		jge	short loc_37780
		or	byte ptr ss:4724h, 2

loc_37780:				; CODE XREF: seg132:2538j
		test	byte ptr ss:4724h, 9
		jz	short loc_377E1
		mov	ax, ss:4727h
		or	ax, ax
		jz	short loc_377E1
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4627h
		sub	al, ss:471Fh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:4714h
		div	cx
		add	si, ax
		sub	ss:4729h, ax
		jg	short loc_377B8

locret_377B7:				; CODE XREF: seg132:250Aj seg132:2531j
		retn
; ���������������������������������������������������������������������������

loc_377B8:				; CODE XREF: seg132:2575j
		mul	cx
		add	ss:471Fh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:471Fh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:4727h
		mov	ss:4719h, al
		jmp	short loc_377F3
; ���������������������������������������������������������������������������

loc_377E1:				; CODE XREF: seg132:2546j seg132:254Ej
		mov	cx, ss:4714h
		add	ss:471Fh, cl
		adc	ch, 0
		mov	ss:4719h, ch

loc_377F3:				; CODE XREF: seg132:259Fj
		mov	ax, ss:4710h
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:470Eh
		mov	ah, ss:4627h
		mov	ch, ah
		mov	dl, ss:4626h
		mov	dh, dl
		mov	cl, ss:471Ah
		mov	al, ss:471Bh
		or	al, al
		jz	short loc_3782E

loc_37823:				; CODE XREF: seg132:25ECj
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		sbb	al, 0
		jg	short loc_37823

loc_3782E:				; CODE XREF: seg132:25E1j
		push	cx
		xor	ch, ch
		sub	ss:472Fh, cx
		pop	cx
		jg	short loc_3783C
		jmp	loc_37953
; ���������������������������������������������������������������������������

loc_3783C:				; CODE XREF: seg132:25F7j
		cmp	byte ptr ss:4719h, 0
		jle	short loc_3789C

loc_37844:				; CODE XREF: seg132:267Ej
		mov	al, [si]

loc_37846:				; CODE XREF: seg132:265Aj
		push	di
		push	dx
		push	cx
		xor	ch, ch
		mov	dx, ss:4737h
		sub	dx, ss:470Eh
		jle	short loc_378C4
		sub	cx, dx
		jle	short loc_3785F
		add	di, dx
		rep stosb

loc_3785F:				; CODE XREF: seg132:2619j
		pop	cx
		pop	dx
		pop	di
		sub	di, ss:473Fh

loc_37867:				; CODE XREF: seg132:2635j
		add	dl, bl
		jnb	short loc_37873
		dec	cl
		inc	di
		inc	word ptr ss:470Eh

loc_37873:				; CODE XREF: seg132:2629j
		add	ch, bh
		jnb	short loc_37867

loc_37877:				; CODE XREF: seg132:2644j
		add	dh, bl
		jnb	short loc_37882
		dec	word ptr ss:472Fh
		inc	cl

loc_37882:				; CODE XREF: seg132:2639j
		add	ah, bh
		jnb	short loc_37877
		dec	word ptr ss:4731h
		jle	short locret_378C0
		cmp	word ptr ss:472Fh, 0
		jle	short loc_378C1
		dec	byte ptr ss:4719h
		jg	short loc_37846

loc_3789C:				; CODE XREF: seg132:2602j seg132:269Dj
		mov	bp, cx
		mov	cx, ss:4714h

loc_378A3:				; CODE XREF: seg132:2675j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_378C0
		or	ch, ch
		jz	short loc_378A3
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_37844
; ���������������������������������������������������������������������������

locret_378C0:				; CODE XREF: seg132:264Bj seg132:2671j
		retn
; ���������������������������������������������������������������������������

loc_378C1:				; CODE XREF: seg132:2653j seg132:26E0j
		jmp	loc_3794E
; ���������������������������������������������������������������������������

loc_378C4:				; CODE XREF: seg132:2615j
		pop	cx
		pop	dx
		pop	di
		test	byte ptr ss:4724h, 6
		jnz	short loc_378D7
		mov	bp, ss:4729h
		jmp	loc_36AF2
; ���������������������������������������������������������������������������

loc_378D7:				; CODE XREF: seg132:268Dj
		cmp	byte ptr ss:4719h, 0
		jle	short loc_3789C

loc_378DF:				; CODE XREF: seg132:270Bj
		mov	al, [si]

loc_378E1:				; CODE XREF: seg132:26E7j
		mov	bp, cx
		xor	ch, ch
		rep stosb
		mov	cx, bp
		sub	di, ss:473Fh
		xor	ch, ch
		sub	di, cx
		mov	cx, bp

loc_378F4:				; CODE XREF: seg132:26C2j
		add	dl, bl
		jnb	short loc_37900
		dec	cl
		inc	di
		inc	word ptr ss:470Eh

loc_37900:				; CODE XREF: seg132:26B6j
		add	ch, bh
		jnb	short loc_378F4

loc_37904:				; CODE XREF: seg132:26D1j
		add	dh, bl
		jnb	short loc_3790F
		dec	word ptr ss:472Fh
		inc	cl

loc_3790F:				; CODE XREF: seg132:26C6j
		add	ah, bh
		jnb	short loc_37904
		dec	word ptr ss:4731h
		jle	short locret_3794D
		cmp	word ptr ss:472Fh, 0
		jle	short loc_378C1
		dec	byte ptr ss:4719h
		jg	short loc_378E1
		mov	bp, cx
		mov	cx, ss:4714h

loc_37930:				; CODE XREF: seg132:2702j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_3794D
		or	ch, ch
		jz	short loc_37930
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_378DF
; ���������������������������������������������������������������������������

locret_3794D:				; CODE XREF: seg132:26D8j seg132:26FEj
		retn
; ���������������������������������������������������������������������������

loc_3794E:				; CODE XREF: seg132:loc_378C1j
		dec	byte ptr ss:4719h

loc_37953:				; CODE XREF: seg132:25F9j
		cmp	byte ptr ss:4719h, 0
		jle	short loc_379AE

loc_3795B:				; CODE XREF: seg132:2790j
		mov	al, [si]

loc_3795D:				; CODE XREF: seg132:276Cj
		push	di
		push	cx
		xor	ch, ch
		mov	bp, ss:470Eh
		add	bp, cx
		stc
		sbb	bp, ss:473Bh
		jle	short loc_37972
		sub	cx, bp

loc_37972:				; CODE XREF: seg132:272Ej
		rep stosb
		pop	cx
		pop	di
		sub	di, ss:473Fh

loc_3797B:				; CODE XREF: seg132:2755j
		add	dl, bl
		jnb	short loc_37993
		dec	cl
		inc	di
		inc	word ptr ss:470Eh
		mov	bp, ss:470Eh
		cmp	bp, ss:473Bh
		jg	short locret_379D2

loc_37993:				; CODE XREF: seg132:273Dj
		add	ch, bh
		jnb	short loc_3797B

loc_37997:				; CODE XREF: seg132:275Ej
		add	dh, bl
		adc	cl, 0
		add	ah, bh
		jnb	short loc_37997
		dec	word ptr ss:4731h
		jle	short locret_379D2
		dec	byte ptr ss:4719h
		jg	short loc_3795D

loc_379AE:				; CODE XREF: seg132:2719j
		mov	bp, cx
		mov	cx, ss:4714h

loc_379B5:				; CODE XREF: seg132:2787j
		inc	si
		add	ss:471Fh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_379D2
		or	ch, ch
		jz	short loc_379B5
		mov	ss:4719h, ch
		mov	cx, bp
		jmp	short loc_3795B
; ���������������������������������������������������������������������������

locret_379D2:				; CODE XREF: seg132:2751j seg132:2765j ...
		retn
; ���������������������������������������������������������������������������
		xor	ax, ax
		mov	ch, ss:471Ah
		mov	al, ss:471Bh
		xor	dx, dx
		or	ch, ch
		jz	short loc_379F0

loc_379E4:				; CODE XREF: seg132:27AEj
		add	dh, bh
		adc	ax, 0
		add	dl, bl
		sbb	ch, 0
		jg	short loc_379E4

loc_379F0:				; CODE XREF: seg132:27A2j
		inc	ax
		mov	ss:471Ch, ax
		mov	ax, ss:470Eh
		sub	ax, ss:4737h
		jl	short loc_37A02
		jmp	short loc_37A5D
; ���������������������������������������������������������������������������

loc_37A02:				; CODE XREF: seg132:27BEj
		neg	ax
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4626h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bl
		div	cx
		or	dx, dx
		jz	short loc_37A22
		inc	ax

loc_37A22:				; CODE XREF: seg132:27DFj
		push	ax
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:470Eh, ax
		add	ss:4725h, ax
		pop	ax
		mov	cl, bh
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:4710h, ax
		or	byte ptr ss:4724h, 1

loc_37A5D:				; CODE XREF: seg132:27C0j
		mov	ax, ss:4710h
		sub	ax, ss:473Dh
		jle	short loc_37ACA
		sub	ax, ss:471Ch
		jle	short loc_37ACA
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		sub	al, ss:4627h
		sbb	ah, 0
		sbb	dx, 0
		xor	cx, cx
		mov	cl, bh
		div	cx
		or	dx, dx
		jz	short loc_37A8D
		inc	ax

loc_37A8D:				; CODE XREF: seg132:284Aj
		push	ax
		mul	cx
		add	ss:4627h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		sub	ss:4710h, ax
		pop	ax
		xor	cx, cx
		mov	cl, bl
		mul	cx
		add	ss:4626h, al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ss:470Eh, ax
		add	ss:4725h, ax
		or	byte ptr ss:4724h, 8

loc_37ACA:				; CODE XREF: seg132:2826j seg132:282Dj
		mov	ax, ss:473Bh
		inc	ax
		sub	ax, ss:470Eh
		jg	short loc_37AD7

locret_37AD6:				; CODE XREF: seg132:28BAj seg132:28D3j
		retn
; ���������������������������������������������������������������������������

loc_37AD7:				; CODE XREF: seg132:2894j
		mov	ss:472Fh, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4712h
		add	al, ss:471Eh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, bp
		cmp	ax, ss:4737h
		jl	short locret_37AD6
		cmp	ax, ss:473Bh
		jle	short loc_37B09
		or	byte ptr ss:4724h, 4

loc_37B09:				; CODE XREF: seg132:28C1j
		mov	ax, ss:4710h
		inc	ax
		sub	ax, ss:4739h
		jle	short locret_37AD6
		mov	ss:4731h, ax
		mov	ax, ss:4729h
		mul	word ptr ss:4714h
		add	al, ss:471Fh
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		add	ax, ss:471Ch
		neg	ax
		add	ax, di
		cmp	ax, ss:473Dh
		jg	short locret_37B81
		cmp	ax, ss:4739h
		jge	short loc_37B4E
		or	byte ptr ss:4724h, 2

loc_37B4E:				; CODE XREF: seg132:2906j
		test	byte ptr ss:4724h, 9
		jz	short loc_37BAB
		mov	ax, ss:4725h
		xor	dx, dx
		mov	dl, ah
		mov	ah, al
		xor	al, al
		mov	al, ss:4626h
		sub	al, ss:471Eh
		sbb	ah, 0
		sbb	dx, 0
		mov	cx, ss:4712h
		div	cx
		add	si, ax
		sub	ss:4729h, ax
		jg	short loc_37B82

locret_37B81:				; CODE XREF: seg132:28FFj
		retn
; ���������������������������������������������������������������������������

loc_37B82:				; CODE XREF: seg132:293Fj
		mul	cx
		add	ss:471Eh, al
		adc	ah, 0
		adc	dx, 0
		add	ss:471Eh, cl
		adc	ch, 0
		mov	al, ah
		mov	ah, dl
		add	al, ch
		adc	ah, 0
		sub	ax, ss:4725h
		mov	ss:4718h, al
		jmp	short loc_37BBD
; ���������������������������������������������������������������������������

loc_37BAB:				; CODE XREF: seg132:2914j
		mov	cx, ss:4712h
		add	ss:471Eh, cl
		adc	ch, 0
		mov	ss:4718h, ch

loc_37BBD:				; CODE XREF: seg132:2969j
		mov	ax, ss:4710h
		shl	ax, 1
		add	ax, ss:4735h
		mov	di, ax
		mov	di, ss:[di]
		add	di, ss:470Eh
		mov	cl, ss:471Bh
		mov	al, ss:471Ah
		mov	ah, ss:4627h
		mov	ch, ah
		mov	dl, ss:4626h
		mov	dh, dl
		or	al, al
		jz	short loc_37BF8

loc_37BED:				; CODE XREF: seg132:29B6j
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		sbb	al, 0
		jg	short loc_37BED

loc_37BF8:				; CODE XREF: seg132:29ABj
		test	byte ptr ss:4724h, 2
		jz	short loc_37C0F
		push	cx
		xor	ch, ch
		inc	cx
		sub	ss:4731h, cx
		pop	cx
		jge	short loc_37C0F
		jmp	loc_37D5D
; ���������������������������������������������������������������������������

loc_37C0F:				; CODE XREF: seg132:29BEj seg132:29CAj
		mov	bp, ss:4710h
		cmp	bp, ss:473Dh
		jg	short loc_37C1E

loc_37C1B:				; CODE XREF: seg132:2A08j
		jmp	loc_37CC3
; ���������������������������������������������������������������������������

loc_37C1E:				; CODE XREF: seg132:29D9j
		mov	bp, ss:473Dh
		shl	bp, 1
		add	bp, ss:4735h
		mov	di, bp
		mov	di, ss:[di]
		add	di, ss:470Eh
		mov	bp, ss:4710h
		cmp	byte ptr ss:4718h, 0
		jz	short loc_37C9D

loc_37C41:				; CODE XREF: seg132:2A7Dj
		mov	al, [si]

loc_37C43:				; CODE XREF: seg132:2A5Bj
		cmp	bp, ss:473Dh
		jle	short loc_37C1B
		push	cx
		push	di
		push	dx
		mov	dx, bp
		sub	dx, ss:473Dh
		xor	ch, ch
		sub	cx, dx
		pop	dx
		jle	short loc_37C67

loc_37C5B:				; CODE XREF: seg132:2A25j
		mov	es:[di], al
		sub	di, ss:473Fh
		dec	cl
		jg	short loc_37C5B

loc_37C67:				; CODE XREF: seg132:2A19j
		pop	di
		pop	cx
		inc	di

loc_37C6A:				; CODE XREF: seg132:2A44j
		add	ch, bh
		jnb	short loc_37C82
		dec	cl
		dec	word ptr ss:4731h
		dec	bp
		cmp	bp, ss:473Dh
		jge	short loc_37C82
		sub	di, ss:473Fh

loc_37C82:				; CODE XREF: seg132:2A2Cj seg132:2A3Bj
		add	dl, bl
		jnb	short loc_37C6A

loc_37C86:				; CODE XREF: seg132:2A4Dj
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_37C86
		dec	word ptr ss:472Fh
		jz	short loc_37CC0
		dec	byte ptr ss:4718h
		jnz	short loc_37C43

loc_37C9D:				; CODE XREF: seg132:29FFj
		push	cx
		mov	cx, ss:4712h

loc_37CA3:				; CODE XREF: seg132:2A75j
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short loc_37CBF
		or	ch, ch
		jle	short loc_37CA3
		mov	ss:4718h, ch
		pop	cx
		jmp	short loc_37C41
; ���������������������������������������������������������������������������

loc_37CBF:				; CODE XREF: seg132:2A71j
		pop	cx

loc_37CC0:				; CODE XREF: seg132:2A54j
		jmp	locret_37DD8
; ���������������������������������������������������������������������������

loc_37CC3:				; CODE XREF: seg132:loc_37C1Bj
		test	byte ptr ss:4724h, 6
		jnz	short loc_37CCE
		jmp	loc_36B86
; ���������������������������������������������������������������������������

loc_37CCE:				; CODE XREF: seg132:2A89j
		mov	ss:4710h, bp
		mov	bp, ss:473Fh
		cmp	byte ptr ss:4718h, 0
		jz	short loc_37D25

loc_37CE0:				; CODE XREF: seg132:2B0Cj
		mov	al, [si]

loc_37CE2:				; CODE XREF: seg132:2AE3j
		push	cx
		push	di

loc_37CE4:				; CODE XREF: seg132:2AABj
		mov	es:[di], al
		sub	di, bp
		dec	cl
		jg	short loc_37CE4
		pop	di
		pop	cx
		inc	di

loc_37CF0:				; CODE XREF: seg132:2AC4j
		add	ch, bh
		jnb	short loc_37D02
		dec	word ptr ss:4731h
		dec	cl
		sub	di, bp
		dec	word ptr ss:4710h

loc_37D02:				; CODE XREF: seg132:2AB2j
		add	dl, bl
		jnb	short loc_37CF0

loc_37D06:				; CODE XREF: seg132:2ACDj
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_37D06
		dec	word ptr ss:472Fh
		jle	short locret_37D4E
		cmp	word ptr ss:4731h, 0
		jle	short loc_37D4F
		dec	byte ptr ss:4718h
		jnz	short loc_37CE2

loc_37D25:				; CODE XREF: seg132:2A9Ej
		mov	bp, cx
		mov	cx, ss:4712h

loc_37D2C:				; CODE XREF: seg132:2AFEj
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short locret_37D4E
		or	ch, ch
		jle	short loc_37D2C
		mov	ss:4718h, ch
		mov	cx, bp
		mov	bp, ss:473Fh
		jmp	short loc_37CE0
; ���������������������������������������������������������������������������

locret_37D4E:				; CODE XREF: seg132:2AD4j seg132:2AFAj
		retn
; ���������������������������������������������������������������������������

loc_37D4F:				; CODE XREF: seg132:2ADCj
		test	byte ptr ss:4724h, 2
		jnz	short loc_37D58
		retn
; ���������������������������������������������������������������������������

loc_37D58:				; CODE XREF: seg132:2B15j
		dec	byte ptr ss:4718h

loc_37D5D:				; CODE XREF: seg132:29CCj
		mov	bp, ss:4710h
		cmp	byte ptr ss:4718h, 0
		jle	short loc_37DB5

loc_37D6A:				; CODE XREF: seg132:2B95j
		mov	al, [si]

loc_37D6C:				; CODE XREF: seg132:2B73j
		push	cx
		push	di
		push	bp

loc_37D6F:				; CODE XREF: seg132:2B41j
		cmp	bp, ss:4739h
		jl	short loc_37D83
		mov	es:[di], al
		sub	di, ss:473Fh
		dec	bp
		dec	cl
		jg	short loc_37D6F

loc_37D83:				; CODE XREF: seg132:2B34j
		pop	bp
		pop	di
		pop	cx
		inc	di
		dec	word ptr ss:472Fh
		jle	short locret_37DD8

loc_37D8E:				; CODE XREF: seg132:2B63j
		add	ch, bh
		jnb	short loc_37DA1
		dec	cl
		sub	di, ss:473Fh
		dec	bp
		cmp	bp, ss:4739h
		jl	short locret_37DD8

loc_37DA1:				; CODE XREF: seg132:2B50j
		add	dl, bl
		jnb	short loc_37D8E

loc_37DA5:				; CODE XREF: seg132:2B6Cj
		add	ah, bh
		adc	cl, 0
		add	dh, bl
		jnb	short loc_37DA5
		dec	byte ptr ss:4718h
		jnz	short loc_37D6C

loc_37DB5:				; CODE XREF: seg132:2B28j
		push	cx
		mov	cx, ss:4712h

loc_37DBB:				; CODE XREF: seg132:2B8Dj
		inc	si
		add	ss:471Eh, cl
		adc	ch, 0
		dec	word ptr ss:4729h
		jle	short loc_37DD7
		or	ch, ch
		jle	short loc_37DBB
		mov	ss:4718h, ch
		pop	cx
		jmp	short loc_37D6A
; ���������������������������������������������������������������������������

loc_37DD7:				; CODE XREF: seg132:2B89j
		pop	cx

locret_37DD8:				; CODE XREF: seg132:loc_37CC0j
					; seg132:2B4Cj	...
		retn
seg132		ends
