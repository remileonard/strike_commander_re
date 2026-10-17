seg136		segment	byte public 'CODE' use16
		assume cs:seg136
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_39B8C:				; DATA XREF: dseg:4634o
		call	sub_38D93
		jb	short loc_39BB3
		mov	bx, ss:46FCh
		call	sub_38BB6
		jnb	short loc_39BA9
		mov	word ptr ss:4882h, 22Ah
		jmp	loc_3A06A
; ���������������������������������������������������������������������������

loc_39BA9:				; CODE XREF: seg136:001Dj
		mov	word ptr ss:4882h, 1ACh
		jmp	loc_39C44
; ���������������������������������������������������������������������������

loc_39BB3:				; CODE XREF: seg136:0011j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39BB8:				; DATA XREF: dseg:4654o
		call	loc_38DA0
		jb	short loc_39BE3
		mov	bx, ss:46FCh
		mov	bp, ss:46FEh
		call	sub_38BB6
		jnb	short loc_39BDA
		mov	word ptr ss:4882h, 3CAh
		jmp	loc_3A06A
; ���������������������������������������������������������������������������

loc_39BDA:				; CODE XREF: seg136:004Ej
		mov	word ptr ss:4882h, 34Ah
		jmp	short loc_39C44
; ���������������������������������������������������������������������������

loc_39BE3:				; CODE XREF: seg136:003Dj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39BE8:				; DATA XREF: dseg:4674o
		call	loc_38DAD
		jb	short loc_39C0F
		mov	bx, ss:46F8h
		call	sub_38BB6
		jnb	short loc_39C05
		mov	word ptr ss:4882h, 22Ah
		jmp	loc_3A0FB
; ���������������������������������������������������������������������������

loc_39C05:				; CODE XREF: seg136:0079j
		mov	word ptr ss:4882h, 1ACh
		jmp	loc_39CB8
; ���������������������������������������������������������������������������

loc_39C0F:				; CODE XREF: seg136:006Dj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39C14:				; DATA XREF: dseg:4694o
		call	loc_38DBA
		jb	short loc_39C3F
		mov	bx, ss:46F8h
		mov	bp, ss:46FEh
		call	sub_38BB6
		jnb	short loc_39C36
		mov	word ptr ss:4882h, 3CAh
		jmp	loc_3A0FB
; ���������������������������������������������������������������������������

loc_39C36:				; CODE XREF: seg136:00AAj
		mov	word ptr ss:4882h, 34Ah
		jmp	short loc_39CB8
; ���������������������������������������������������������������������������

loc_39C3F:				; CODE XREF: seg136:0099j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39C44:				; CODE XREF: seg136:0030j seg136:0061j
		shl	bp, 1
		add	bp, ss:4735h
		mov	ss:470Ah, bp
		mov	ch, ss:4626h
		mov	cl, ss:46F2h
		mov	bp, ss:473Fh

loc_39C5F:				; CODE XREF: seg136:00EAj seg136:0131j
		add	ch, dh
		jb	short loc_39C71
		inc	word ptr ss:46EEh
		dec	cl
		jnz	short loc_39C5F
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39C71:				; CODE XREF: seg136:00E1j seg136:0127j
		mov	di, ss:46EEh

loc_39C76:				; CODE XREF: seg136:loc_39CA0j
		mov	ax, [si]
		or	ax, ax
		jz	short loc_39CB3
		cmp	[si+4],	di
		jz	short loc_39CA2
		jg	short loc_39CA9
		add	si, 6
		shr	ax, 1
		jb	short loc_39C8E
		add	si, ax
		jmp	short loc_39CA0
; ���������������������������������������������������������������������������

loc_39C8E:				; CODE XREF: seg136:0108j
		push	di
		mov	di, ax

loc_39C91:				; CODE XREF: seg136:011Dj
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_39C9B
		add	si, ax
		dec	si

loc_39C9B:				; CODE XREF: seg136:0116j
		sub	di, ax
		jnz	short loc_39C91
		pop	di

loc_39CA0:				; CODE XREF: seg136:010Cj
		jmp	short loc_39C76
; ���������������������������������������������������������������������������

loc_39CA2:				; CODE XREF: seg136:00FFj
		call	word ptr ss:4882h
		jmp	short loc_39C71
; ���������������������������������������������������������������������������

loc_39CA9:				; CODE XREF: seg136:0101j
		inc	word ptr ss:46EEh
		dec	bx
		dec	cl
		jnz	short loc_39C5F

loc_39CB3:				; CODE XREF: seg136:00FAj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39CB8:				; CODE XREF: seg136:008Cj seg136:00BDj
		shl	bp, 1
		add	bp, ss:4735h
		mov	ss:470Ah, bp
		mov	ch, ss:4626h
		mov	cl, ss:46F2h
		mov	bp, ss:473Fh

loc_39CD3:				; CODE XREF: seg136:015Ej seg136:01A5j
		add	ch, dh
		jb	short loc_39CE5
		inc	word ptr ss:46EEh
		dec	cl
		jnz	short loc_39CD3
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39CE5:				; CODE XREF: seg136:0155j seg136:019Bj
		mov	di, ss:46EEh

loc_39CEA:				; CODE XREF: seg136:loc_39D14j
		mov	ax, [si]
		or	ax, ax
		jz	short loc_39D27
		cmp	[si+4],	di
		jz	short loc_39D16
		jg	short loc_39D1D
		add	si, 6
		shr	ax, 1
		jb	short loc_39D02
		add	si, ax
		jmp	short loc_39D14
; ���������������������������������������������������������������������������

loc_39D02:				; CODE XREF: seg136:017Cj
		push	di
		mov	di, ax

loc_39D05:				; CODE XREF: seg136:0191j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_39D0F
		add	si, ax
		dec	si

loc_39D0F:				; CODE XREF: seg136:018Aj
		sub	di, ax
		jnz	short loc_39D05
		pop	di

loc_39D14:				; CODE XREF: seg136:0180j
		jmp	short loc_39CEA
; ���������������������������������������������������������������������������

loc_39D16:				; CODE XREF: seg136:0173j
		call	word ptr ss:4882h
		jmp	short loc_39CE5
; ���������������������������������������������������������������������������

loc_39D1D:				; CODE XREF: seg136:0175j
		inc	word ptr ss:46EEh
		inc	bx
		dec	cl
		jnz	short loc_39CD3

loc_39D27:				; CODE XREF: seg136:016Ej
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	ax
		mov	ax, [si+2]
		add	ax, ss:4702h
		mul	dh
		add	al, ss:4627h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		shl	ax, 1
		add	ax, ss:470Ah
		mov	di, ax
		mov	di, ss:[di]
		add	di, bx
		add	si, 6
		pop	ax
		shr	ax, 1
		jb	short loc_39D72
		mov	ah, al
		inc	ah

loc_39D5F:				; CODE XREF: seg136:01E6j
		dec	ah
		jz	short locret_39D71

loc_39D63:				; CODE XREF: seg136:01EFj
		lodsb
		add	dl, dh
		jnb	short loc_39D5F
		mov	es:[di], al
		add	di, bp
		dec	ah
		jnz	short loc_39D63

locret_39D71:				; CODE XREF: seg136:01E1j
		retn
; ���������������������������������������������������������������������������

loc_39D72:				; CODE XREF: seg136:01D9j
		push	bx
		mov	bx, ax

loc_39D75:				; CODE XREF: seg136:020Ej seg136:0226j
		lodsb
		shr	al, 1
		jb	short loc_39D92
		sub	bl, al
		mov	ah, al

loc_39D7E:				; CODE XREF: seg136:020Aj
		lodsb
		add	dl, dh
		jnb	short loc_39D88
		mov	es:[di], al
		add	di, bp

loc_39D88:				; CODE XREF: seg136:0201j
		dec	ah
		jnz	short loc_39D7E
		or	bl, bl
		jnz	short loc_39D75
		jmp	short loc_39DA8
; ���������������������������������������������������������������������������

loc_39D92:				; CODE XREF: seg136:01F8j
		sub	bl, al
		mov	ah, al
		lodsb

loc_39D97:				; CODE XREF: seg136:0222j
		add	dl, dh
		jnb	short loc_39DA0
		mov	es:[di], al
		add	di, bp

loc_39DA0:				; CODE XREF: seg136:0219j
		dec	ah
		jnz	short loc_39D97
		or	bl, bl
		jnz	short loc_39D75

loc_39DA8:				; CODE XREF: seg136:0210j
		pop	bx
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_39DF7
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	cx
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_39DC4:				; CODE XREF: seg136:0256j seg136:0269j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_39DDA
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_39DC4
		jz	short loc_39DEB

loc_39DDA:				; CODE XREF: seg136:024Aj
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_39DC4

loc_39DEB:				; CODE XREF: seg136:0258j
		pop	es
		pop	ax
		pop	cx
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_39E03
; ���������������������������������������������������������������������������

loc_39DF7:				; CODE XREF: seg136:0230j
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_39E03:				; CODE XREF: seg136:0275j
		add	ax, ss:4702h
		mul	dh
		add	al, ss:4627h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, ss:470Ah
		mov	bx, ax
		cmp	ax, ss:473Dh
		jle	short loc_39E29

loc_39E26:				; CODE XREF: seg136:02BFj
		jmp	loc_39EC7
; ���������������������������������������������������������������������������

loc_39E29:				; CODE XREF: seg136:02A4j
		mov	ax, ss:4729h
		mul	dh
		add	al, dl
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:4739h
		jl	short loc_39E26
		cmp	ax, ss:473Dh
		jle	short loc_39E67
		mov	ax, ss:473Dh
		sub	ax, bx
		mov	ah, al
		xor	al, al
		inc	ah
		sub	al, dl
		sbb	ah, 0
		jb	short loc_39EC7
		div	dh
		or	ah, ah
		jz	short loc_39E63
		inc	al

loc_39E63:				; CODE XREF: seg136:02DFj
		mov	ss:4729h, al

loc_39E67:				; CODE XREF: seg136:02C6j
		mov	ax, bx
		sub	ax, ss:4739h
		jge	short loc_39EA1
		or	ax, ax
		jns	short loc_39E76
		neg	ax

loc_39E76:				; CODE XREF: seg136:02F2j
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_39EC7
		div	dh
		or	ah, ah
		jz	short loc_39E89
		inc	al

loc_39E89:				; CODE XREF: seg136:0305j
		xor	ah, ah
		sub	ss:4729h, ax
		jle	short loc_39EC7
		add	si, ax
		mul	dh
		add	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax

loc_39EA1:				; CODE XREF: seg136:02EEj
		mov	di, bx
		shl	di, 1
		add	di, ss:4735h
		mov	di, ss:[di]
		add	di, bp
		mov	bx, ss:473Fh
		mov	ah, ss:4729h

loc_39EB9:				; CODE XREF: seg136:0345j
		lodsb
		add	dl, dh
		jnb	short loc_39EC3
		mov	es:[di], al
		add	di, bx

loc_39EC3:				; CODE XREF: seg136:033Cj
		dec	ah
		jnz	short loc_39EB9

loc_39EC7:				; CODE XREF: seg136:loc_39E26j
					; seg136:02D9j	...
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		push	ax
		mov	ax, [si+2]
		add	ax, ss:4702h
		mul	dh
		add	al, ss:4627h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		shl	ax, 1
		neg	ax
		add	ax, ss:470Ah
		mov	di, ax
		mov	di, ss:[di]
		add	di, bx
		add	si, 6
		pop	ax
		shr	ax, 1
		jb	short loc_39F12
		mov	ah, al
		inc	ah

loc_39EFF:				; CODE XREF: seg136:0386j
		dec	ah
		jz	short locret_39F11

loc_39F03:				; CODE XREF: seg136:038Fj
		lodsb
		add	dl, dh
		jnb	short loc_39EFF
		mov	es:[di], al
		sub	di, bp
		dec	ah
		jnz	short loc_39F03

locret_39F11:				; CODE XREF: seg136:0381j
		retn
; ���������������������������������������������������������������������������

loc_39F12:				; CODE XREF: seg136:0379j
		push	bx
		mov	bx, ax

loc_39F15:				; CODE XREF: seg136:03AEj seg136:03C6j
		lodsb
		shr	al, 1
		jb	short loc_39F32
		sub	bl, al
		mov	ah, al

loc_39F1E:				; CODE XREF: seg136:03AAj
		lodsb
		add	dl, dh
		jnb	short loc_39F28
		mov	es:[di], al
		sub	di, bp

loc_39F28:				; CODE XREF: seg136:03A1j
		dec	ah
		jnz	short loc_39F1E
		or	bl, bl
		jnz	short loc_39F15
		jmp	short loc_39F48
; ���������������������������������������������������������������������������

loc_39F32:				; CODE XREF: seg136:0398j
		sub	bl, al
		mov	ah, al
		lodsb

loc_39F37:				; CODE XREF: seg136:03C2j
		add	dl, dh
		jnb	short loc_39F40
		mov	es:[di], al
		sub	di, bp

loc_39F40:				; CODE XREF: seg136:03B9j
		dec	ah
		jnz	short loc_39F37
		or	bl, bl
		jnz	short loc_39F15

loc_39F48:				; CODE XREF: seg136:03B0j
		pop	bx
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_39F97
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	cx
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_39F64:				; CODE XREF: seg136:03F6j seg136:0409j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_39F7A
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_39F64
		jz	short loc_39F8B

loc_39F7A:				; CODE XREF: seg136:03EAj
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_39F64

loc_39F8B:				; CODE XREF: seg136:03F8j
		pop	es
		pop	ax
		pop	cx
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_39FA3
; ���������������������������������������������������������������������������

loc_39F97:				; CODE XREF: seg136:03D0j
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_39FA3:				; CODE XREF: seg136:0415j
		add	ax, ss:4702h
		mul	dh
		add	al, ss:4627h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		mov	bx, ss:470Ah
		sub	bx, ax
		mov	ax, bx
		cmp	ax, ss:4739h
		jge	short loc_39FCB

loc_39FC8:				; CODE XREF: seg136:0463j
		jmp	loc_3A067
; ���������������������������������������������������������������������������

loc_39FCB:				; CODE XREF: seg136:0446j
		mov	ax, ss:4729h
		mul	dh
		add	al, dl
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	ax, bx
		neg	ax
		cmp	ax, ss:473Dh
		jg	short loc_39FC8
		cmp	ax, ss:4739h
		jge	short loc_3A00D
		mov	ax, ss:4739h
		sub	ax, bx
		neg	ax
		mov	ah, al
		xor	al, al
		inc	ah
		sub	al, dl
		sbb	ah, 0
		jb	short loc_3A067
		div	dh
		or	ah, ah
		jz	short loc_3A009
		inc	al

loc_3A009:				; CODE XREF: seg136:0485j
		mov	ss:4729h, al

loc_3A00D:				; CODE XREF: seg136:046Aj
		mov	ax, bx
		sub	ax, ss:473Dh
		jle	short loc_3A041
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_3A067
		div	dh
		or	ah, ah
		jz	short loc_3A029
		inc	al

loc_3A029:				; CODE XREF: seg136:04A5j
		xor	ah, ah
		sub	ss:4729h, ax
		jle	short loc_3A067
		add	si, ax
		mul	dh
		add	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax

loc_3A041:				; CODE XREF: seg136:0494j
		mov	di, bx
		shl	di, 1
		add	di, ss:4735h
		mov	di, ss:[di]
		add	di, bp
		mov	bx, ss:473Fh
		mov	ah, ss:4729h

loc_3A059:				; CODE XREF: seg136:04E5j
		lodsb
		add	dl, dh
		jnb	short loc_3A063
		mov	es:[di], al
		sub	di, bx

loc_3A063:				; CODE XREF: seg136:04DCj
		dec	ah
		jnz	short loc_3A059

loc_3A067:				; CODE XREF: seg136:loc_39FC8j
					; seg136:047Fj	...
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������

loc_3A06A:				; CODE XREF: seg136:0026j seg136:0057j
		mov	ss:470Ah, bp
		mov	ch, ss:4626h
		mov	cl, ss:46F2h
		mov	bp, bx
		cmp	bp, ss:473Bh
		jle	short loc_3A099

loc_3A082:				; CODE XREF: seg136:0515j
		inc	word ptr ss:46EEh
		add	ch, dh
		jnb	short loc_3A093
		dec	bp
		cmp	bp, ss:473Bh
		jle	short loc_3A099

loc_3A093:				; CODE XREF: seg136:0509j
		dec	cl
		jnz	short loc_3A082
		jz	short loc_3A0A6

loc_3A099:				; CODE XREF: seg136:0500j seg136:0511j ...
		add	ch, dh
		jb	short loc_3A0AB
		inc	word ptr ss:46EEh
		dec	cl
		jnz	short loc_3A099

loc_3A0A6:				; CODE XREF: seg136:0517j seg136:0534j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A0AB:				; CODE XREF: seg136:051Bj seg136:0563j
		mov	di, ss:46EEh

loc_3A0B0:				; CODE XREF: seg136:loc_3A0DCj
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3A0A6
		cmp	[si+4],	di
		jz	short loc_3A0DE
		jl	short loc_3A0BF
		jmp	short loc_3A0E5
; ���������������������������������������������������������������������������

loc_3A0BF:				; CODE XREF: seg136:053Bj
		add	si, 6
		shr	ax, 1
		jb	short loc_3A0CA
		add	si, ax
		jmp	short loc_3A0DC
; ���������������������������������������������������������������������������

loc_3A0CA:				; CODE XREF: seg136:0544j
		push	di
		mov	di, ax

loc_3A0CD:				; CODE XREF: seg136:0559j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3A0D7
		add	si, ax
		dec	si

loc_3A0D7:				; CODE XREF: seg136:0552j
		sub	di, ax
		jnz	short loc_3A0CD
		pop	di

loc_3A0DC:				; CODE XREF: seg136:0548j
		jmp	short loc_3A0B0
; ���������������������������������������������������������������������������

loc_3A0DE:				; CODE XREF: seg136:0539j
		call	word ptr ss:4882h
		jmp	short loc_3A0AB
; ���������������������������������������������������������������������������

loc_3A0E5:				; CODE XREF: seg136:053Dj
		dec	bp
		cmp	bp, ss:4737h
		jl	short loc_3A0F6
		inc	word ptr ss:46EEh
		dec	cl
		jnz	short loc_3A099

loc_3A0F6:				; CODE XREF: seg136:056Bj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A0FB:				; CODE XREF: seg136:0082j seg136:00B3j
		mov	ss:470Ah, bp
		mov	ch, ss:4626h
		mov	cl, ss:46F2h
		mov	bp, bx
		cmp	bp, ss:4737h
		jge	short loc_3A12A

loc_3A113:				; CODE XREF: seg136:05A6j
		inc	word ptr ss:46EEh
		add	ch, dh
		jnb	short loc_3A124
		inc	bp
		cmp	bp, ss:4737h
		jge	short loc_3A12A

loc_3A124:				; CODE XREF: seg136:059Aj
		dec	cl
		jnz	short loc_3A113
		jz	short loc_3A137

loc_3A12A:				; CODE XREF: seg136:0591j seg136:05A2j ...
		add	ch, dh
		jb	short loc_3A13C
		inc	word ptr ss:46EEh
		dec	cl
		jnz	short loc_3A12A

loc_3A137:				; CODE XREF: seg136:05A8j seg136:05C5j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A13C:				; CODE XREF: seg136:05ACj seg136:05F4j
		mov	di, ss:46EEh

loc_3A141:				; CODE XREF: seg136:loc_3A16Dj
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3A137
		cmp	[si+4],	di
		jz	short loc_3A16F
		jl	short loc_3A150
		jmp	short loc_3A176
; ���������������������������������������������������������������������������

loc_3A150:				; CODE XREF: seg136:05CCj
		add	si, 6
		shr	ax, 1
		jb	short loc_3A15B
		add	si, ax
		jmp	short loc_3A16D
; ���������������������������������������������������������������������������

loc_3A15B:				; CODE XREF: seg136:05D5j
		push	di
		mov	di, ax

loc_3A15E:				; CODE XREF: seg136:05EAj
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3A168
		add	si, ax
		dec	si

loc_3A168:				; CODE XREF: seg136:05E3j
		sub	di, ax
		jnz	short loc_3A15E
		pop	di

loc_3A16D:				; CODE XREF: seg136:05D9j
		jmp	short loc_3A141
; ���������������������������������������������������������������������������

loc_3A16F:				; CODE XREF: seg136:05CAj
		call	word ptr ss:4882h
		jmp	short loc_3A13C
; ���������������������������������������������������������������������������

loc_3A176:				; CODE XREF: seg136:05CEj
		inc	bp
		cmp	bp, ss:473Bh
		jg	short loc_3A187
		inc	word ptr ss:46EEh
		dec	cl
		jnz	short loc_3A12A

loc_3A187:				; CODE XREF: seg136:05FCj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
seg136		ends
