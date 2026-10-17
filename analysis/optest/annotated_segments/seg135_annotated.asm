seg135		segment	byte public 'CODE' use16
		assume cs:seg135
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_38BB6	proc far		; CODE XREF: seg131:0011P seg131:0036P ...
		mov	ax, ss:46F8h
		cmp	ax, ss:4737h
		jl	short loc_38BE4
		mov	ax, ss:46FCh
		cmp	ax, ss:473Bh
		jg	short loc_38BE4
		mov	ax, ss:46FAh
		cmp	ax, ss:4739h
		jl	short loc_38BE4
		mov	ax, ss:46FEh
		cmp	ax, ss:473Dh
		jg	short loc_38BE4
		clc
		retf
; ���������������������������������������������������������������������������

loc_38BE4:				; CODE XREF: sub_38BB6+9j
					; sub_38BB6+14j ...
		stc
		retf
sub_38BB6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_38BE6	proc far		; CODE XREF: seg135:0E22p seg135:0E54p
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	si, [bp+6]
		mov	di, 4733h
		mov	cx, 6
		rep movsw
		mov	si, word_47759
		shl	si, 1
		add	si, ss:4735h
		mov	ax, [si+2]
		sub	ax, [si]
		mov	word_4775F, ax
		lds	si, [bp+0Ch]
		mov	bx, [bp+10h]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4],	bx
		jb	short loc_38C84
		stc
		jz	short loc_38C84
		mov	ax, ds
		mov	dx, 0
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		add	ax, si
		adc	dx, 0
		add	ax, [bx+si]
		adc	dx, [bx+si+2]
		mov	si, ax
		and	si, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		mov	ds, ax
		lodsw
		mov	ss:4700h, ax
		mov	di, ax
		lodsw
		mov	ss:4702h, ax
		stc
		adc	ax, di
		mov	ss:46F0h, ax
		lodsw
		mov	ss:4704h, ax
		mov	di, ax
		neg	ax
		mov	ss:46EEh, ax
		lodsw
		mov	ss:4706h, ax
		stc
		adc	ax, di
		mov	ss:46F2h, ax
		mov	ax, ss:4733h
		mov	es, ax
		assume es:nothing
		clc

loc_38C84:				; CODE XREF: sub_38BE6+30j
					; sub_38BE6+33j
		jb	short locret_38CCE
		mov	bx, [bp+12h]
		or	bx, bx
		jns	short loc_38C91
		add	bx, 168h

loc_38C91:				; CODE XREF: sub_38BE6+A5j
		mov	cl, ss:[bx+4190h]
		mov	ss:4716h, cl
		mov	ch, ss:[bx+41EAh]
		mov	ss:4717h, ch
		mov	al, ss:[bx+4352h]
		add	al, ss:[bx+44BAh]
		xor	al, [bp+16h]
		cbw
		mov	di, ax
		mov	ax, [bp+14h]
		mov	ss:4720h, ax
		cmp	ax, 100h
		jnb	short loc_38CC6
		jmp	word ptr ss:[di+46ACh]
; ���������������������������������������������������������������������������

loc_38CC6:				; CODE XREF: sub_38BE6+D9j
		add	di, 8
		jmp	word ptr ss:[di+46ACh]
; ���������������������������������������������������������������������������

locret_38CCE:				; CODE XREF: sub_38BE6:loc_38C84j
		retf
sub_38BE6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_38CCF	proc far		; CODE XREF: seg133:loc_37DDAP
		mov	dh, al
		mov	ax, ss:4702h
		mov	cx, ss:4704h
		jmp	short loc_38D01
; ���������������������������������������������������������������������������

loc_38CDC:				; CODE XREF: seg133:loc_37F1BP
		mov	dh, al
		mov	ax, ss:4700h
		mov	cx, ss:4704h
		jmp	short loc_38D01
; ���������������������������������������������������������������������������

loc_38CE9:				; CODE XREF: seg133:loc_37F47P
		mov	dh, al
		mov	ax, ss:4702h
		mov	cx, ss:4706h
		jmp	short loc_38D01
; ���������������������������������������������������������������������������

loc_38CF6:				; CODE XREF: seg133:loc_37F72P
		mov	dh, al
		mov	ax, ss:4700h
		mov	cx, ss:4706h

loc_38D01:				; CODE XREF: sub_38CCF+Bj
					; sub_38CCF+18j ...
		mov	bx, [bp+8]
		mul	dh
		neg	al
		mov	ss:4626h, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ss:4708h, bx
		mov	ss:46F8h, bx
		cmp	bx, ss:473Bh
		jg	short loc_38D91
		mov	bp, [bp+0Ah]
		mov	ax, cx
		mul	dh
		neg	al
		mov	ss:4627h, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, bp
		mov	ss:470Ah, ax
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_38D91
		mov	ax, ss:46F0h
		mul	dh
		add	al, ss:4626h
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46F4h, ax
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_38D91
		mov	ax, ss:46F2h
		mul	dh
		add	al, ss:4627h
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46F6h, ax
		add	ax, bp
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_38D91
		clc
		retf
; ���������������������������������������������������������������������������

loc_38D91:				; CODE XREF: sub_38CCF+52j
					; sub_38CCF+76j ...
		stc
		retf
sub_38CCF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_38D93	proc far		; CODE XREF: seg136:loc_39B8CP
		mov	dh, al
		mov	ax, ss:4706h
		mov	cx, ss:4702h
		jmp	short loc_38DC5
; ���������������������������������������������������������������������������

loc_38DA0:				; CODE XREF: seg136:loc_39BB8P
		mov	dh, al
		mov	ax, ss:4704h
		mov	cx, ss:4702h
		jmp	short loc_38DC5
; ���������������������������������������������������������������������������

loc_38DAD:				; CODE XREF: seg136:loc_39BE8P
		mov	dh, al
		mov	ax, ss:4706h
		mov	cx, ss:4700h
		jmp	short loc_38DC5
; ���������������������������������������������������������������������������

loc_38DBA:				; CODE XREF: seg136:loc_39C14P
		mov	dh, al
		mov	ax, ss:4704h
		mov	cx, ss:4700h

loc_38DC5:				; CODE XREF: sub_38D93+Bj
					; sub_38D93+18j ...
		mov	bx, [bp+8]
		mul	dh
		neg	al
		mov	ss:4626h, al
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ss:4708h, bx
		mov	ss:46F8h, bx
		cmp	bx, ss:473Bh
		jg	short loc_38E57
		mov	bp, [bp+0Ah]
		mov	ax, cx
		mul	dh
		neg	al
		mov	ch, al
		mov	ss:4627h, al
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:470Ah, bp
		mov	ss:46FAh, bp
		cmp	bp, ss:473Dh
		jg	short loc_38E57
		mov	ax, ss:46F0h
		mul	dh
		add	al, ss:4627h
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46F6h, ax
		add	ax, bp
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_38E57
		mov	ax, ss:46F2h
		mul	dh
		add	al, ss:4626h
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46F4h, ax
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_38E57
		clc
		retf
; ���������������������������������������������������������������������������

loc_38E57:				; CODE XREF: sub_38D93+52j
					; sub_38D93+78j ...
		stc
		retf
sub_38D93	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_38E59	proc far		; CODE XREF: sub_38EC9+1p sub_38F48+1p ...
		mov	dl, al
		mov	al, cl
		mul	dl
		mov	al, ah
		xor	ah, ah
		mov	cl, al
		or	ax, ax
		jnz	short loc_38E6A
		inc	ax

loc_38E6A:				; CODE XREF: sub_38E59+Ej
		mov	ss:4712h, ax
		mov	al, ch
		mul	dl
		mov	al, ah
		xor	ah, ah
		mov	ch, al
		or	ax, ax
		jnz	short loc_38E7D
		inc	ax

loc_38E7D:				; CODE XREF: sub_38E59+21j
		mov	ss:4714h, ax
		mov	ss:4716h, cx
		mov	ax, ss:46F2h
		mul	cl
		mov	di, ax
		mov	ax, ss:46F0h
		mul	ch
		add	ax, di
		neg	al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46F6h, ax
		mov	ax, ss:46F2h
		mul	ch
		mov	di, ax
		mov	ax, ss:46F0h
		mul	cl
		add	ax, di
		neg	al
		adc	ah, 0
		mov	al, ah
		xor	ah, ah
		inc	ax
		mov	ss:46F4h, ax
		mov	bx, [bp+8]
		mov	bp, [bp+0Ah]
		retf
sub_38E59	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_38EC9	proc far		; CODE XREF: seg131:loc_3406AP
		push	cs
		call	near ptr sub_38E59
		mov	ax, ss:4704h
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:46FAh, bp
		cmp	bp, ss:473Dh
		jg	short loc_38F46
		mov	ax, ss:46F6h
		add	ax, bp
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_38F46
		mov	ax, ss:46F2h
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bx
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_38F46
		add	ax, ss:46F4h
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_38F46
		clc
		retf
; ���������������������������������������������������������������������������

loc_38F46:				; CODE XREF: sub_38EC9+3Ej
					; sub_38EC9+4Fj ...
		stc
		retf
sub_38EC9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_38F48	proc far		; CODE XREF: seg131:loc_3408FP
		push	cs
		call	near ptr sub_38E59
		mov	ax, ss:4704h
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ss:46FCh, bx
		cmp	bx, ss:4737h
		jl	short loc_38FC7
		mov	ax, ss:46F4h
		neg	ax
		add	ax, bx
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_38FC7
		mov	ax, ss:46F0h
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_38FC7
		add	ax, ss:46F6h
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_38FC7
		clc
		retf
; ���������������������������������������������������������������������������

loc_38FC7:				; CODE XREF: sub_38F48+3Ej
					; sub_38F48+51j ...
		stc
		retf
sub_38F48	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_38FC9	proc far		; CODE XREF: seg131:loc_34149P
		push	cs
		call	near ptr sub_38E59
		mov	ax, ss:4704h
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:46F8h, bx
		cmp	bx, ss:473Bh
		jg	short loc_39046
		mov	ax, ss:46F4h
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_39046
		mov	ax, ss:46F2h
		mul	cl
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_39046
		add	ax, ss:46F6h
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_39046
		clc
		retf
; ���������������������������������������������������������������������������

loc_39046:				; CODE XREF: sub_38FC9+3Ej
					; sub_38FC9+4Fj ...
		stc
		retf
sub_38FC9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_39048	proc far		; CODE XREF: seg131:loc_3416EP
		push	cs
		call	near ptr sub_38E59
		mov	ax, ss:4704h
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ss:46FEh, bp
		cmp	bp, ss:4739h
		jl	short loc_390C5
		mov	ax, ss:46F6h
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_390C5
		mov	ax, ss:46F2h
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_390C5
		sub	ax, ss:46F4h
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_390C5
		clc
		retf
; ���������������������������������������������������������������������������

loc_390C5:				; CODE XREF: sub_39048+3Ej
					; sub_39048+51j ...
		stc
		retf
sub_39048	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_390C7	proc far		; CODE XREF: seg131:loc_35078P
		push	cs
		call	near ptr sub_38E59
		mov	ax, ss:4704h
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:46FCh, bx
		cmp	bx, ss:4737h
		jl	short loc_39146
		mov	ax, ss:46F4h
		neg	ax
		add	ax, bx
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_39146
		mov	ax, ss:46F2h
		mul	cl
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_39146
		add	ax, ss:46F6h
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_39146
		clc
		retf
; ���������������������������������������������������������������������������

loc_39146:				; CODE XREF: sub_390C7+3Ej
					; sub_390C7+51j ...
		stc
		retf
sub_390C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_39148	proc far		; CODE XREF: seg131:loc_3509DP
		push	cs
		call	near ptr sub_38E59
		mov	ax, ss:4704h
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ss:46FEh, bp
		cmp	bp, ss:4739h
		jl	short loc_391C5
		mov	ax, ss:46F6h
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_391C5
		mov	ax, ss:46F0h
		mul	cl
		mov	al, ah
		xor	ah, ah
		inc	ax
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_391C5
		sub	ax, ss:46F4h
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_391C5
		clc
		retf
; ���������������������������������������������������������������������������

loc_391C5:				; CODE XREF: sub_39148+3Ej
					; sub_39148+51j ...
		stc
		retf
sub_39148	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_391C7	proc far		; CODE XREF: seg131:loc_3516AP
		push	cs
		call	near ptr sub_38E59
		mov	ax, ss:4704h
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		add	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ss:46FAh, bp
		cmp	bp, ss:473Dh
		jg	short loc_39242
		mov	ax, ss:46F6h
		add	ax, bp
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_39242
		mov	ax, ss:46F2h
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_39242
		sub	ax, ss:46F4h
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_39242
		clc
		retf
; ���������������������������������������������������������������������������

loc_39242:				; CODE XREF: sub_391C7+3Ej
					; sub_391C7+4Fj ...
		stc
		retf
sub_391C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_39244	proc far		; CODE XREF: seg131:loc_3518FP
		push	cs
		call	near ptr sub_38E59
		mov	ax, ss:4704h
		mov	di, ax
		mul	ch
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	cl
		mov	al, ah
		xor	ah, ah
		sub	bx, ax
		mov	ax, di
		mul	ch
		mov	al, ah
		xor	ah, ah
		add	bp, ax
		mov	ss:46F8h, bx
		cmp	bx, ss:473Bh
		jg	short loc_392C1
		mov	ax, ss:46F4h
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_392C1
		mov	ax, ss:46F0h
		mul	ch
		mov	al, ah
		xor	ah, ah
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_392C1
		add	ax, ss:46F6h
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_392C1
		clc
		retf
; ���������������������������������������������������������������������������

loc_392C1:				; CODE XREF: sub_39244+3Ej
					; sub_39244+4Fj ...
		stc
		retf
sub_39244	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_392C3	proc far		; CODE XREF: seg134:loc_383F2P
		mov	bx, ax
		mov	ax, ss:4702h
		mov	cx, ss:4704h
		jmp	short loc_392F5
sub_392C3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_392D0	proc far		; CODE XREF: seg134:loc_383C4P
		mov	bx, ax
		mov	ax, ss:4700h
		mov	cx, ss:4704h
		jmp	short loc_392F5
; ���������������������������������������������������������������������������

loc_392DD:				; CODE XREF: seg134:loc_38534P
		mov	bx, ax
		mov	ax, ss:4702h
		mov	cx, ss:4706h
		jmp	short loc_392F5
; ���������������������������������������������������������������������������

loc_392EA:				; CODE XREF: seg134:loc_3855AP
		mov	bx, ax
		mov	ax, ss:4700h
		mov	cx, ss:4706h

loc_392F5:				; CODE XREF: sub_392C3+Bj sub_392D0+Bj ...
		mul	bx
		neg	al
		mov	ss:4626h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+8]
		mov	ss:4708h, ax
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_39389
		mov	ax, cx
		mul	bx
		neg	al
		mov	ss:4627h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+0Ah]
		mov	ss:470Ah, ax
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_39389
		mov	ax, ss:46F0h
		mul	bx
		add	al, ss:4626h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_39389
		add	ax, ss:4708h
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_39389
		mov	ax, ss:46F2h
		mul	bx
		add	al, ss:4627h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_39389
		add	ax, ss:470Ah
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_39389
		clc
		retf
; ���������������������������������������������������������������������������

loc_39389:				; CODE XREF: sub_392D0+43j
					; sub_392D0+65j ...
		stc
		retf
sub_392D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_3938B	proc far		; CODE XREF: sub_39418+1p sub_394B5+1p ...
		mov	di, ax
		xor	ax, ax
		mov	al, cl
		mul	di
		mov	al, ah
		mov	ah, dl
		mov	ss:4712h, ax
		mov	ss:4718h, ah
		mov	ss:471Ah, ah
		xor	ax, ax
		mov	al, ch
		mul	di
		mov	al, ah
		mov	ah, dl
		mov	ss:4714h, ax
		mov	ss:4719h, ah
		mov	ss:471Bh, ah
		mov	ax, ss:46F2h
		mul	word ptr ss:4712h
		mov	di, dx
		mov	bx, ax
		mov	ax, ss:46F0h
		mul	word ptr ss:4714h
		add	ax, bx
		adc	dx, di
		neg	al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	ss:46F6h, ax
		mov	ax, ss:46F2h
		mul	word ptr ss:4714h
		mov	di, dx
		mov	bx, ax
		mov	ax, ss:46F0h
		mul	word ptr ss:4712h
		add	ax, bx
		adc	dx, di
		neg	al
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	ss:46F4h, ax
		mov	bx, [bp+8]
		mov	bp, [bp+0Ah]
		retf
sub_3938B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_39418	proc far		; CODE XREF: seg132:loc_35289P
		push	cs
		call	near ptr sub_3938B
		mov	ax, ss:4704h
		mov	di, ax
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:46FAh, bp
		cmp	bp, ss:473Dh
		jg	short loc_394B3
		mov	ax, ss:46F6h
		add	ax, bp
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_394B3
		mov	ax, ss:46F2h
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bx
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_394B3
		add	ax, ss:46F4h
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_394B3
		mov	ss:4708h, bx
		mov	ss:470Ah, bp
		mov	bx, ss:4716h
		clc
		retf
; ���������������������������������������������������������������������������

loc_394B3:				; CODE XREF: sub_39418+4Aj
					; sub_39418+5Bj ...
		stc
		retf
sub_39418	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_394B5	proc far		; CODE XREF: seg132:loc_35248P
		push	cs
		call	near ptr sub_3938B
		mov	ax, ss:4704h
		mov	di, ax
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:46FCh, bx
		cmp	bx, ss:4737h
		jl	short loc_39552
		mov	ax, ss:46F4h
		neg	ax
		add	ax, bx
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_39552
		mov	ax, ss:46F0h
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_39552
		add	ax, ss:46F6h
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_39552
		mov	ss:4708h, bx
		mov	ss:470Ah, bp
		mov	bx, ss:4716h
		clc
		retf
; ���������������������������������������������������������������������������

loc_39552:				; CODE XREF: sub_394B5+4Aj
					; sub_394B5+5Dj ...
		stc
		retf
sub_394B5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_39554	proc far		; CODE XREF: seg132:loc_353B8P
		push	cs
		call	near ptr sub_3938B
		mov	ax, ss:4704h
		mov	di, ax
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:46F8h, bx
		cmp	bx, ss:473Bh
		jg	short loc_395EF
		mov	ax, ss:46F4h
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_395EF
		mov	ax, ss:46F2h
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_395EF
		add	ax, ss:46F6h
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_395EF
		mov	ss:4708h, bx
		mov	ss:470Ah, bp
		mov	bx, ss:4716h
		clc
		retf
; ���������������������������������������������������������������������������

loc_395EF:				; CODE XREF: sub_39554+4Aj
					; sub_39554+5Bj ...
		stc
		retf
sub_39554	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_395F1	proc far		; CODE XREF: seg132:loc_353F9P
		push	cs
		call	near ptr sub_3938B
		mov	ax, ss:4704h
		mov	di, ax
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:46FEh, bp
		cmp	bp, ss:4739h
		jl	short loc_3968C
		mov	ax, ss:46F6h
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_3968C
		mov	ax, ss:46F2h
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		inc	ax
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_3968C
		sub	ax, ss:46F4h
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_3968C
		mov	ss:4708h, bx
		mov	ss:470Ah, bp
		mov	bx, ss:4716h
		clc
		retf
; ���������������������������������������������������������������������������

loc_3968C:				; CODE XREF: sub_395F1+4Aj
					; sub_395F1+5Dj ...
		stc
		retf
sub_395F1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_3968E	proc far		; CODE XREF: seg137:loc_3A1C2P
		mov	bx, ax
		mov	ax, ss:4706h
		mov	cx, ss:4702h
		jmp	short loc_396C0
sub_3968E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_3969B	proc far		; CODE XREF: seg137:loc_3A18CP
		mov	bx, ax
		mov	ax, ss:4704h
		mov	cx, ss:4702h
		jmp	short loc_396C0
; ���������������������������������������������������������������������������

loc_396A8:				; CODE XREF: seg137:loc_3A310P
		mov	bx, ax
		mov	ax, ss:4706h
		mov	cx, ss:4700h
		jmp	short loc_396C0
; ���������������������������������������������������������������������������

loc_396B5:				; CODE XREF: seg137:loc_3A336P
		mov	bx, ax
		mov	ax, ss:4704h
		mov	cx, ss:4700h

loc_396C0:				; CODE XREF: sub_3968E+Bj sub_3969B+Bj ...
		inc	ax
		mul	bx
		mov	ss:4626h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+8]
		mov	ss:4708h, ax
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_39751
		mov	ax, cx
		mul	bx
		mov	ss:4627h, al
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, [bp+0Ah]
		mov	ss:470Ah, ax
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_39751
		mov	ax, ss:46F2h
		mul	bx
		add	al, ss:4626h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_39751
		add	ax, ss:4708h
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_39751
		mov	ax, ss:46F0h
		mul	bx
		add	al, ss:4627h
		adc	ah, 0
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		dec	ax
		jl	short loc_39751
		add	ax, ss:470Ah
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_39751
		clc
		retf
; ���������������������������������������������������������������������������

loc_39751:				; CODE XREF: sub_3969B+42j
					; sub_3969B+62j ...
		stc
		retf
sub_3969B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_39753	proc far		; CODE XREF: seg132:loc_367E1P
		push	cs
		call	near ptr sub_3938B
		mov	ax, ss:4704h
		mov	di, ax
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:46FCh, bx
		cmp	bx, ss:4737h
		jl	short loc_397F0
		mov	ax, ss:46F4h
		neg	ax
		add	ax, bx
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_397F0
		mov	ax, ss:46F2h
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_397F0
		add	ax, ss:46F6h
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_397F0
		mov	ss:4708h, bx
		mov	ss:470Ah, bp
		mov	bx, ss:4716h
		clc
		retf
; ���������������������������������������������������������������������������

loc_397F0:				; CODE XREF: sub_39753+4Aj
					; sub_39753+5Dj ...
		stc
		retf
sub_39753	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_397F2	proc far		; CODE XREF: seg132:loc_36824P
		push	cs
		call	near ptr sub_3938B
		mov	ax, ss:4704h
		mov	di, ax
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:46FEh, bp
		cmp	bp, ss:4739h
		jl	short loc_3988D
		mov	ax, ss:46F6h
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_3988D
		mov	ax, ss:46F0h
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		inc	ax
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_3988D
		sub	ax, ss:46F4h
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_3988D
		mov	ss:4708h, bx
		mov	ss:470Ah, bp
		mov	bx, ss:4716h
		clc
		retf
; ���������������������������������������������������������������������������

loc_3988D:				; CODE XREF: sub_397F2+4Aj
					; sub_397F2+5Dj ...
		stc
		retf
sub_397F2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_3988F	proc far		; CODE XREF: seg132:loc_36867P
		push	cs
		call	near ptr sub_3938B
		mov	ax, ss:4704h
		mov	di, ax
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		add	bx, ax
		mov	ax, di
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ss:46FAh, bp
		cmp	bp, ss:473Dh
		jg	short loc_39928
		mov	ax, ss:46F6h
		add	ax, bp
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_39928
		mov	ax, ss:46F2h
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		inc	ax
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_39928
		sub	ax, ss:46F4h
		mov	ss:46F8h, ax
		cmp	ax, ss:473Bh
		jg	short loc_39928
		mov	ss:4708h, bx
		mov	ss:470Ah, bp
		mov	bx, ss:4716h
		clc
		retf
; ���������������������������������������������������������������������������

loc_39928:				; CODE XREF: sub_3988F+4Aj
					; sub_3988F+5Bj ...
		stc
		retf
sub_3988F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_3992A	proc far		; CODE XREF: seg132:loc_368AAP
		push	cs
		call	near ptr sub_3938B
		mov	ax, ss:4704h
		mov	di, ax
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		sub	bp, ax
		mov	ax, ss:4702h
		mov	di, ax
		mul	word ptr ss:4712h
		mov	al, ah
		mov	ah, dl
		sub	bx, ax
		mov	ax, di
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		add	bp, ax
		mov	ss:46F8h, bx
		cmp	bx, ss:473Bh
		jg	short loc_399C5
		mov	ax, ss:46F4h
		add	ax, bx
		mov	ss:46FCh, ax
		cmp	ax, ss:4737h
		jl	short loc_399C5
		mov	ax, ss:46F0h
		mul	word ptr ss:4714h
		mov	al, ah
		mov	ah, dl
		inc	ax
		neg	ax
		add	ax, bp
		mov	ss:46FAh, ax
		cmp	ax, ss:473Dh
		jg	short loc_399C5
		add	ax, ss:46F6h
		mov	ss:46FEh, ax
		cmp	ax, ss:4739h
		jl	short loc_399C5
		mov	ss:4708h, bx
		mov	ss:470Ah, bp
		mov	bx, ss:4716h
		clc
		retf
; ���������������������������������������������������������������������������

loc_399C5:				; CODE XREF: sub_3992A+4Aj
					; sub_3992A+5Bj ...
		stc
		retf
sub_3992A	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	di
		push	ds
		push	ds
		mov	ax, [bp+18h]
		push	ax
		push	cs
		call	near ptr sub_38BE6
		pop	ax
		pop	ds
		jb	short loc_399EF
		mov	di, ax
		mov	bx, 6

loc_399DE:				; CODE XREF: seg135:0E38j
		mov	ax, ss:[bx+46F8h]
		mov	[bx+di], ax
		sub	bx, 2
		jge	short loc_399DE
		mov	ax, 1
		jmp	short loc_399F2
; ���������������������������������������������������������������������������

loc_399EF:				; CODE XREF: seg135:0E27j
		mov	ax, 0

loc_399F2:				; CODE XREF: seg135:0E3Dj
		pop	ds
		pop	di
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		mov	ax, [bp+18h]
		mov	ss:488Ah, al
		push	cs
		call	near ptr sub_38BE6
		jb	short loc_39A75
		mov	bx, ss:46F8h
		mov	ax, ss:46FCh
		cmp	ax, ss:473Bh
		jle	short loc_39A1D
		mov	ax, ss:473Bh

loc_39A1D:				; CODE XREF: seg135:0E67j
		cmp	bx, ss:4737h
		jge	short loc_39A29
		mov	bx, ss:4737h

loc_39A29:				; CODE XREF: seg135:0E72j
		sub	ax, bx
		inc	ax
		mov	dx, ax
		mov	bp, ss:46FAh
		mov	ax, ss:46FEh
		cmp	ax, ss:473Dh
		jle	short loc_39A42
		mov	ax, ss:473Dh

loc_39A42:				; CODE XREF: seg135:0E8Cj
		cmp	bp, ss:4739h
		jge	short loc_39A4E
		mov	bp, ss:4739h

loc_39A4E:				; CODE XREF: seg135:0E97j
		sub	ax, bp
		inc	ax
		mov	si, ax
		shl	bp, 1
		add	bp, ss:4735h
		mov	al, ss:488Ah
		mov	ah, al

loc_39A60:				; CODE XREF: seg135:0EC3j
		mov	di, [bp+0]
		add	di, bx
		mov	cx, dx
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		add	bp, 2
		dec	si
		jg	short loc_39A60

loc_39A75:				; CODE XREF: seg135:0E57j
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_39A7A	proc far		; CODE XREF: seg014:0091P

arg_0		= word ptr  6
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= byte ptr  16h
arg_418A	= byte ptr  4190h
arg_41E4	= byte ptr  41EAh
arg_434C	= byte ptr  4352h
arg_44B4	= byte ptr  44BAh
arg_4626	= dword	ptr  462Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		cmp	[bp+arg_E], 100h
		jnz	short loc_39A9B
		mov	bx, [bp+arg_C]
		mov	al, [bp+arg_10]
		cbw
		cmp	ax, bx
		jnz	short loc_39A9B
		pop	ds
		pop	di
		pop	si
		pop	bp
		jmp	Render_MeasureOrDrawTextString_32CD8
; ���������������������������������������������������������������������������

loc_39A9B:				; CODE XREF: sub_39A7A+Bj
					; sub_39A7A+16j
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	si, [bp+arg_0]
		mov	di, 4733h
		mov	cx, 6
		rep movsw
		mov	si, word_47759
		shl	si, 1
		add	si, ss:4735h
		mov	ax, [si+2]
		sub	ax, [si]
		mov	word_4775F, ax
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4],	bx
		jb	short loc_39B39
		stc
		jz	short loc_39B39
		mov	ax, ds
		mov	dx, 0
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		add	ax, si
		adc	dx, 0
		add	ax, [bx+si]
		adc	dx, [bx+si+2]
		mov	si, ax
		and	si, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		mov	ds, ax
		lodsw
		mov	ss:4700h, ax
		mov	di, ax
		lodsw
		mov	ss:4702h, ax
		stc
		adc	ax, di
		mov	ss:46F0h, ax
		lodsw
		mov	ss:4704h, ax
		mov	di, ax
		neg	ax
		mov	ss:46EEh, ax
		lodsw
		mov	ss:4706h, ax
		stc
		adc	ax, di
		mov	ss:46F2h, ax
		mov	ax, ss:4733h
		mov	es, ax
		assume es:nothing
		clc

loc_39B39:				; CODE XREF: sub_39A7A+51j
					; sub_39A7A+54j
		jnb	short loc_39B40
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39B40:				; CODE XREF: sub_39A7A:loc_39B39j
		mov	bx, [bp+arg_C]
		or	bx, bx
		jns	short loc_39B4B
		add	bx, 168h

loc_39B4B:				; CODE XREF: sub_39A7A+CBj
		mov	cl, ss:[bx+arg_418A]
		mov	ss:4716h, cl
		mov	ch, ss:[bx+arg_41E4]
		mov	ss:4717h, ch
		mov	al, ss:[bx+arg_434C]
		add	al, ss:[bx+arg_44B4]
		xor	al, [bp+arg_10]
		cbw
		mov	di, ax
		mov	ax, [bp+arg_E]
		mov	ss:4720h, ax
		cmp	ax, 100h
		jnb	short loc_39B82
		shl	di, 1
		jmp	ss:[di+arg_4626]
; ���������������������������������������������������������������������������

loc_39B82:				; CODE XREF: sub_39A7A+FFj
		add	di, 8
		shl	di, 1
		jmp	ss:[di+arg_4626]
sub_39A7A	endp

seg135		ends
