seg133		segment	byte public 'CODE' use16
		assume cs:seg133
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_37DDA:				; DATA XREF: dseg:462Co
		call	sub_38CCF
		jb	short loc_37DF2
		call	sub_38BB6
		jnb	short loc_37DF7
		mov	word ptr ss:4882h, 3D5h
		jmp	loc_37E72
; ���������������������������������������������������������������������������

loc_37DF2:				; CODE XREF: seg133:000Fj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37DF7:				; CODE XREF: seg133:0016j
		mov	word ptr ss:4882h, 2EEh

loc_37DFE:				; CODE XREF: seg133:016Fj
		mov	ax, ss:470Ah
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:4735h
		mov	ch, ss:4627h
		mov	cl, ss:46F2h

loc_37E15:				; CODE XREF: seg133:0050j seg133:009Bj
		add	ch, dh
		jb	short loc_37E27
		inc	word ptr ss:46EEh
		dec	cl
		jnz	short loc_37E15
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37E27:				; CODE XREF: seg133:0047j seg133:008Dj
		mov	di, ss:46EEh

loc_37E2C:				; CODE XREF: seg133:loc_37E56j
		mov	ax, [si]
		or	ax, ax
		jz	short loc_37E6D
		cmp	[si+4],	di
		jz	short loc_37E58
		jg	short loc_37E5F
		add	si, 6
		shr	ax, 1
		jb	short loc_37E44
		add	si, ax
		jmp	short loc_37E56
; ���������������������������������������������������������������������������

loc_37E44:				; CODE XREF: seg133:006Ej
		push	di
		mov	di, ax

loc_37E47:				; CODE XREF: seg133:0083j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_37E51
		add	si, ax
		dec	si

loc_37E51:				; CODE XREF: seg133:007Cj
		sub	di, ax
		jnz	short loc_37E47
		pop	di

loc_37E56:				; CODE XREF: seg133:0072j
		jmp	short loc_37E2C
; ���������������������������������������������������������������������������

loc_37E58:				; CODE XREF: seg133:0065j
		call	word ptr ss:4882h
		jmp	short loc_37E27
; ���������������������������������������������������������������������������

loc_37E5F:				; CODE XREF: seg133:0067j
		inc	word ptr ss:46EEh
		add	bp, 2
		dec	cl
		jz	short loc_37E6D
		jmp	short loc_37E15
; ���������������������������������������������������������������������������

loc_37E6D:				; CODE XREF: seg133:0060j seg133:0099j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37E72:				; CODE XREF: seg133:001Fj seg133:0160j
		mov	ax, ss:470Ah
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:4735h
		mov	ch, ss:4627h
		mov	cl, ss:46F2h
		cmp	ax, ss:4739h
		jge	short loc_37EAE

loc_37E90:				; CODE XREF: seg133:00DAj
		inc	word ptr ss:46EEh
		add	ch, dh
		jnb	short loc_37EA8
		add	bp, 2
		inc	ax
		mov	ss:470Ah, ax
		cmp	ax, ss:4739h
		jge	short loc_37EAE

loc_37EA8:				; CODE XREF: seg133:00C7j
		dec	cl
		jnz	short loc_37E90
		jz	short loc_37EBB

loc_37EAE:				; CODE XREF: seg133:00BEj seg133:00D6j ...
		add	ch, dh
		jb	short loc_37EC0
		inc	word ptr ss:46EEh
		dec	cl
		jnz	short loc_37EAE

loc_37EBB:				; CODE XREF: seg133:00DCj seg133:00F9j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37EC0:				; CODE XREF: seg133:00E0j seg133:0128j
		mov	di, ss:46EEh

loc_37EC5:				; CODE XREF: seg133:loc_37EF1j
		mov	ax, [si]
		or	ax, ax
		jz	short loc_37EBB
		cmp	[si+4],	di
		jz	short loc_37EF3
		jl	short loc_37ED4
		jmp	short loc_37EFA
; ���������������������������������������������������������������������������

loc_37ED4:				; CODE XREF: seg133:0100j
		add	si, 6
		shr	ax, 1
		jb	short loc_37EDF
		add	si, ax
		jmp	short loc_37EF1
; ���������������������������������������������������������������������������

loc_37EDF:				; CODE XREF: seg133:0109j
		push	di
		mov	di, ax

loc_37EE2:				; CODE XREF: seg133:011Ej
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_37EEC
		add	si, ax
		dec	si

loc_37EEC:				; CODE XREF: seg133:0117j
		sub	di, ax
		jnz	short loc_37EE2
		pop	di

loc_37EF1:				; CODE XREF: seg133:010Dj
		jmp	short loc_37EC5
; ���������������������������������������������������������������������������

loc_37EF3:				; CODE XREF: seg133:00FEj
		call	word ptr ss:4882h
		jmp	short loc_37EC0
; ���������������������������������������������������������������������������

loc_37EFA:				; CODE XREF: seg133:0102j
		inc	word ptr ss:46EEh
		add	bp, 2
		inc	word ptr ss:470Ah
		mov	ax, ss:470Ah
		cmp	ax, ss:473Dh
		jg	short loc_37F16
		dec	cl
		jnz	short loc_37EAE

loc_37F16:				; CODE XREF: seg133:0140j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37F1B:				; DATA XREF: dseg:464Co
		call	loc_38CDC
		jb	short loc_37F42
		call	sub_38BB6
		jnb	short loc_37F33
		mov	word ptr ss:4882h, 4E7h
		jmp	loc_37E72
; ���������������������������������������������������������������������������

loc_37F33:				; CODE XREF: seg133:0157j
		mov	word ptr ss:4882h, 35Ch
		mov	bx, ss:46FCh
		jmp	loc_37DFE
; ���������������������������������������������������������������������������

loc_37F42:				; CODE XREF: seg133:0150j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37F47:				; DATA XREF: dseg:466Co
		call	loc_38CE9
		jb	short loc_37F6D
		call	sub_38BB6
		jnb	short loc_37F5F
		mov	word ptr ss:4882h, 3D5h
		jmp	loc_38011
; ���������������������������������������������������������������������������

loc_37F5F:				; CODE XREF: seg133:0183j
		mov	word ptr ss:4882h, 2EEh
		mov	bx, ss:46F8h
		jmp	short loc_37F9D
; ���������������������������������������������������������������������������

loc_37F6D:				; CODE XREF: seg133:017Cj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37F72:				; DATA XREF: dseg:468Co
		call	loc_38CF6
		jb	short loc_37F98
		call	sub_38BB6
		jnb	short loc_37F8A
		mov	word ptr ss:4882h, 4E7h
		jmp	loc_38011
; ���������������������������������������������������������������������������

loc_37F8A:				; CODE XREF: seg133:01AEj
		mov	word ptr ss:4882h, 35Ch
		mov	bx, ss:46FCh
		jmp	short loc_37F9D
; ���������������������������������������������������������������������������

loc_37F98:				; CODE XREF: seg133:01A7j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37F9D:				; CODE XREF: seg133:019Bj seg133:01C6j
		mov	ax, ss:46FEh
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:4735h
		mov	ch, ss:4627h
		mov	cl, ss:46F2h

loc_37FB4:				; CODE XREF: seg133:01EFj seg133:023Aj
		add	ch, dh
		jb	short loc_37FC6
		inc	word ptr ss:46EEh
		dec	cl
		jnz	short loc_37FB4
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_37FC6:				; CODE XREF: seg133:01E6j seg133:022Cj
		mov	di, ss:46EEh

loc_37FCB:				; CODE XREF: seg133:loc_37FF5j
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3800C
		cmp	[si+4],	di
		jz	short loc_37FF7
		jg	short loc_37FFE
		add	si, 6
		shr	ax, 1
		jb	short loc_37FE3
		add	si, ax
		jmp	short loc_37FF5
; ���������������������������������������������������������������������������

loc_37FE3:				; CODE XREF: seg133:020Dj
		push	di
		mov	di, ax

loc_37FE6:				; CODE XREF: seg133:0222j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_37FF0
		add	si, ax
		dec	si

loc_37FF0:				; CODE XREF: seg133:021Bj
		sub	di, ax
		jnz	short loc_37FE6
		pop	di

loc_37FF5:				; CODE XREF: seg133:0211j
		jmp	short loc_37FCB
; ���������������������������������������������������������������������������

loc_37FF7:				; CODE XREF: seg133:0204j
		call	word ptr ss:4882h
		jmp	short loc_37FC6
; ���������������������������������������������������������������������������

loc_37FFE:				; CODE XREF: seg133:0206j
		inc	word ptr ss:46EEh
		sub	bp, 2
		dec	cl
		jz	short loc_3800C
		jmp	short loc_37FB4
; ���������������������������������������������������������������������������

loc_3800C:				; CODE XREF: seg133:01FFj seg133:0238j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_38011:				; CODE XREF: seg133:018Cj seg133:01B7j
		mov	ax, ss:46FEh
		mov	ss:470Ah, ax
		mov	bp, ax
		shl	bp, 1
		add	bp, ss:4735h
		mov	ch, ss:4627h
		mov	cl, ss:46F2h
		cmp	ax, ss:473Dh
		jle	short loc_38051

loc_38033:				; CODE XREF: seg133:027Dj
		inc	word ptr ss:46EEh
		add	ch, dh
		jnb	short loc_3804B
		sub	bp, 2
		dec	ax
		mov	ss:470Ah, ax
		cmp	ax, ss:473Dh
		jle	short loc_38051

loc_3804B:				; CODE XREF: seg133:026Aj
		dec	cl
		jnz	short loc_38033
		jz	short loc_3805E

loc_38051:				; CODE XREF: seg133:0261j seg133:0279j ...
		add	ch, dh
		jb	short loc_38063
		inc	word ptr ss:46EEh
		dec	cl
		jnz	short loc_38051

loc_3805E:				; CODE XREF: seg133:027Fj seg133:029Cj
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_38063:				; CODE XREF: seg133:0283j seg133:02CBj
		mov	di, ss:46EEh

loc_38068:				; CODE XREF: seg133:loc_38094j
		mov	ax, [si]
		or	ax, ax
		jz	short loc_3805E
		cmp	[si+4],	di
		jz	short loc_38096
		jl	short loc_38077
		jmp	short loc_3809D
; ���������������������������������������������������������������������������

loc_38077:				; CODE XREF: seg133:02A3j
		add	si, 6
		shr	ax, 1
		jb	short loc_38082
		add	si, ax
		jmp	short loc_38094
; ���������������������������������������������������������������������������

loc_38082:				; CODE XREF: seg133:02ACj
		push	di
		mov	di, ax

loc_38085:				; CODE XREF: seg133:02C1j
		lodsb
		inc	si
		shr	al, 1
		cbw
		jb	short loc_3808F
		add	si, ax
		dec	si

loc_3808F:				; CODE XREF: seg133:02BAj
		sub	di, ax
		jnz	short loc_38085
		pop	di

loc_38094:				; CODE XREF: seg133:02B0j
		jmp	short loc_38068
; ���������������������������������������������������������������������������

loc_38096:				; CODE XREF: seg133:02A1j
		call	word ptr ss:4882h
		jmp	short loc_38063
; ���������������������������������������������������������������������������

loc_3809D:				; CODE XREF: seg133:02A5j
		inc	word ptr ss:46EEh
		sub	bp, 2
		dec	word ptr ss:470Ah
		mov	ax, ss:470Ah
		cmp	ax, ss:4739h
		jl	short loc_380B9
		dec	cl
		jnz	short loc_38051

loc_380B9:				; CODE XREF: seg133:02E3j
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
		add	al, ss:4626h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		mov	di, [bp+0]
		add	di, ax
		add	si, 6
		pop	ax
		shr	ax, 1
		jb	short loc_380F9
		mov	ah, al
		inc	ah

loc_380EA:				; CODE XREF: seg133:0321j
		dec	ah
		jz	short locret_380F8

loc_380EE:				; CODE XREF: seg133:0326j
		lodsb
		add	dl, dh
		jnb	short loc_380EA
		stosb
		dec	ah
		jnz	short loc_380EE

locret_380F8:				; CODE XREF: seg133:031Cj
		retn
; ���������������������������������������������������������������������������

loc_380F9:				; CODE XREF: seg133:0314j
		mov	bx, ax

loc_380FB:				; CODE XREF: seg133:0340j seg133:0354j
		lodsb
		shr	al, 1
		jb	short loc_38114
		sub	bl, al
		mov	ah, al

loc_38104:				; CODE XREF: seg133:033Cj
		lodsb
		add	dl, dh
		jnb	short loc_3810A
		stosb

loc_3810A:				; CODE XREF: seg133:0337j
		dec	ah
		jnz	short loc_38104
		or	bl, bl
		jnz	short loc_380FB
		jmp	short loc_38126
; ���������������������������������������������������������������������������

loc_38114:				; CODE XREF: seg133:032Ej
		sub	bl, al
		mov	ah, al
		lodsb

loc_38119:				; CODE XREF: seg133:0350j
		add	dl, dh
		jnb	short loc_3811E
		stosb

loc_3811E:				; CODE XREF: seg133:034Bj
		dec	ah
		jnz	short loc_38119
		or	bl, bl
		jnz	short loc_380FB

loc_38126:				; CODE XREF: seg133:0342j
		mov	bx, ss:4708h
		retn
; ���������������������������������������������������������������������������
		push	ax
		mov	ax, [si+2]
		add	ax, ss:4702h
		mul	dh
		add	al, ss:4626h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	ax, bx
		neg	ax
		mov	di, [bp+0]
		add	di, ax
		add	si, 6
		pop	ax
		shr	ax, 1
		jb	short loc_3816C
		mov	ah, al
		inc	ah

loc_3815A:				; CODE XREF: seg133:0391j
		dec	ah
		jz	short locret_3816B

loc_3815E:				; CODE XREF: seg133:0399j
		lodsb
		add	dl, dh
		jnb	short loc_3815A
		mov	es:[di], al
		dec	di
		dec	ah
		jnz	short loc_3815E

locret_3816B:				; CODE XREF: seg133:038Cj
		retn
; ���������������������������������������������������������������������������

loc_3816C:				; CODE XREF: seg133:0384j
		mov	bx, ax

loc_3816E:				; CODE XREF: seg133:03B6j seg133:03CDj
		lodsb
		shr	al, 1
		jb	short loc_3818A
		sub	bl, al
		mov	ah, al

loc_38177:				; CODE XREF: seg133:03B2j
		lodsb
		add	dl, dh
		jnb	short loc_38180
		mov	es:[di], al
		dec	di

loc_38180:				; CODE XREF: seg133:03AAj
		dec	ah
		jnz	short loc_38177
		or	bl, bl
		jnz	short loc_3816E
		jmp	short loc_3819F
; ���������������������������������������������������������������������������

loc_3818A:				; CODE XREF: seg133:03A1j
		sub	bl, al
		mov	ah, al
		lodsb

loc_3818F:				; CODE XREF: seg133:03C9j
		add	dl, dh
		jnb	short loc_38197
		mov	es:[di], al
		dec	di

loc_38197:				; CODE XREF: seg133:03C1j
		dec	ah
		jnz	short loc_3818F
		or	bl, bl
		jnz	short loc_3816E

loc_3819F:				; CODE XREF: seg133:03B8j
		mov	bx, ss:46FCh
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_381F7
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	cx
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_381BF:				; CODE XREF: seg133:0401j seg133:0414j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_381D5
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_381BF
		jz	short loc_381E6

loc_381D5:				; CODE XREF: seg133:03F5j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_381BF

loc_381E6:				; CODE XREF: seg133:0403j
		pop	es
		pop	ax
		pop	cx
		mov	bx, ss:4708h
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_38203
; ���������������������������������������������������������������������������

loc_381F7:				; CODE XREF: seg133:03DBj
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_38203:				; CODE XREF: seg133:0425j
		add	ax, ss:4702h
		mul	dh
		add	al, ss:4626h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, ss:4708h
		mov	bx, ax
		cmp	ax, ss:473Bh
		jle	short loc_38229
		jmp	loc_382B4
; ���������������������������������������������������������������������������

loc_38229:				; CODE XREF: seg133:0454j
		mov	ax, ss:4729h
		mul	dh
		add	al, dl
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	ax, bx
		cmp	ax, ss:4737h
		jl	short loc_382B4
		cmp	ax, ss:473Bh
		jle	short loc_38266
		mov	ax, ss:473Bh
		inc	ax
		sub	ax, bx
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_382B4
		div	dh
		or	ah, ah
		jz	short loc_38262
		inc	al

loc_38262:				; CODE XREF: seg133:048Ej
		mov	ss:4729h, al

loc_38266:				; CODE XREF: seg133:0476j
		mov	ax, bx
		sub	ax, ss:4737h
		jge	short loc_382A0
		or	ax, ax
		jns	short loc_38275
		neg	ax

loc_38275:				; CODE XREF: seg133:04A1j
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_382B4
		div	dh
		or	ah, ah
		jz	short loc_38288
		inc	al

loc_38288:				; CODE XREF: seg133:04B4j
		xor	ah, ah
		sub	ss:4729h, ax
		jbe	short loc_382B4
		add	si, ax
		mul	dh
		add	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		add	bx, ax

loc_382A0:				; CODE XREF: seg133:049Dj
		mov	di, [bp+0]
		add	di, bx
		mov	ah, ss:4729h

loc_382AA:				; CODE XREF: seg133:04E2j
		lodsb
		add	dl, dh
		jnb	short loc_382B0
		stosb

loc_382B0:				; CODE XREF: seg133:04DDj
		dec	ah
		jnz	short loc_382AA

loc_382B4:				; CODE XREF: seg133:0456j seg133:046Fj ...
		pop	ds
		pop	si
		retn
; ���������������������������������������������������������������������������
		shr	ax, 1
		mov	ss:4729h, ax
		jnb	short loc_38304
		mov	bx, ax
		mov	ax, [si+2]
		add	si, 6
		push	cx
		push	ax
		push	es
		mov	ax, ss
		mov	es, ax
		mov	di, 4742h

loc_382D1:				; CODE XREF: seg133:0513j seg133:0526j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_382E7
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		sub	bx, ax
		jnz	short loc_382D1
		jz	short loc_382F8

loc_382E7:				; CODE XREF: seg133:0507j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		or	bx, bx
		jnz	short loc_382D1

loc_382F8:				; CODE XREF: seg133:0515j
		pop	es
		pop	ax
		pop	cx
		push	si
		push	ds
		push	ss
		pop	ds
		mov	si, 4742h
		jmp	short loc_38310
; ���������������������������������������������������������������������������

loc_38304:				; CODE XREF: seg133:04EDj
		mov	di, ax
		mov	ax, [si+2]
		add	si, 6
		add	di, si
		push	di
		push	ds

loc_38310:				; CODE XREF: seg133:0532j
		add	ax, ss:4702h
		mul	dh
		add	al, ss:4626h
		mov	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		mov	bx, ss:46FCh
		sub	bx, ax
		cmp	bx, ss:4737h
		jge	short loc_38336
		jmp	loc_383C1
; ���������������������������������������������������������������������������

loc_38336:				; CODE XREF: seg133:0561j
		mov	ax, ss:4729h
		mul	dh
		add	al, dl
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	ax, bx
		neg	ax
		cmp	ax, ss:473Bh
		jg	short loc_383C1
		cmp	ax, ss:4737h
		jge	short loc_38376
		mov	ax, bx
		inc	ax
		sub	ax, ss:4737h
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_383C1
		div	dh
		or	ah, ah
		jz	short loc_38372
		inc	al

loc_38372:				; CODE XREF: seg133:059Ej
		mov	ss:4729h, al

loc_38376:				; CODE XREF: seg133:0585j
		mov	ax, bx
		sub	ax, ss:473Bh
		jle	short loc_383AA
		mov	ah, al
		xor	al, al
		sub	al, dl
		sbb	ah, 0
		jb	short loc_383C1
		div	dh
		or	ah, ah
		jz	short loc_38392
		inc	al

loc_38392:				; CODE XREF: seg133:05BEj
		xor	ah, ah
		sub	ss:4729h, ax
		jbe	short loc_383C1
		add	si, ax
		mul	dh
		add	dl, al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		sub	bx, ax

loc_383AA:				; CODE XREF: seg133:05ADj
		mov	di, [bp+0]
		add	di, bx
		mov	ah, ss:4729h

loc_383B4:				; CODE XREF: seg133:05EFj
		lodsb
		add	dl, dh
		jnb	short loc_383BD
		mov	es:[di], al
		dec	di

loc_383BD:				; CODE XREF: seg133:05E7j
		dec	ah
		jnz	short loc_383B4

loc_383C1:				; CODE XREF: seg133:0563j seg133:057Ej ...
		pop	ds
		pop	si
		retn
seg133		ends
