seg093		segment	para public 'CODE' use16
		assume cs:seg093
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

sub_3DFC0		proc far
		mov	dx, word_5D674
		add	dx, 0Ch
		mov	cx, 3E8h

loc_3DFCA:
		in	al, dx
		jmp	short loc_3DFCD

loc_3DFCD:
		jmp	short loc_3DFCF

loc_3DFCF:
		and	al, 80h
		loopne	short loc_3DFCA
		stc
		jnz	short loc_3DFDE
		mov	al, ah
		out	dx, al
		jmp	short loc_3DFDB

loc_3DFDB:
		jmp	short loc_3DFDD

loc_3DFDD:
		clc

loc_3DFDE:
		retf
sub_3DFC0		endp

; ----------------------------------------------------------------------

sub_3DFDF		proc far
		mov	dx, word_5D674
		add	dx, 0Eh
		mov	cx, 3E8h

loc_3DFE9:
		in	al, dx
		jmp	short loc_3DFEC

loc_3DFEC:
		jmp	short loc_3DFEE

loc_3DFEE:
		and	al, 80h
		loope	short loc_3DFE9
		stc
		jz	short loc_3DFFE
		sub	dx, 4
		in	al, dx
		jmp	short loc_3DFFB

loc_3DFFB:
		jmp	short loc_3DFFD

loc_3DFFD:
		clc

loc_3DFFE:
		retf
sub_3DFDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3DFFF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		push	ax
		in	al, 21h
		mov	byte_5D67E, al
		mov	word_5D676, 0
		mov	word_5D678, 0
		mov	word_5D67A, 0
		mov	word_5D67C, 0
		mov	ax, [bp+arg_2]
		mov	word_5D674, ax
		mov	ax, [bp+arg_0]
		mov	word_5D672, ax
		push	cs
		call	near ptr sub_3E2AD
		pop	ax
		leave
		retf
sub_3DFFF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E034		proc far
		enter	0, 0
		push	cx
		mov	ah, 0E1h
		push	cs
		call	near ptr sub_3DFC0
		jb	short loc_3E052
		push	cs
		call	near ptr sub_3DFDF
		jb	short loc_3E052
		mov	ah, al
		push	cs
		call	near ptr sub_3DFDF
		jb	short loc_3E052
		pop	cx
		leave
		retf

loc_3E052:
		mov	ax, 0
		pop	cx
		leave
		retf
sub_3E034		endp

; ----------------------------------------------------------------------

sub_3E058		proc far
		push	ds
		cli
		push	bx
		cmp	bx, 8
		jb	short loc_3E063
		add	bx, 60h

loc_3E063:
		add	bx, 8
		push	bx
		mov	ah, 35h
		mov	al, bl
		int	21h
		mov	ax, es
		shl	eax, 10h
		mov	ax, bx
		mov	[si], eax
		pop	bx
		push	ds
		mov	ah, 25h
		mov	al, bl
		push	cs
		pop	ds
		int	21h
		pop	ds
		pop	cx
		mov	bx, cx
		cmp	cl, 8
		jl	short loc_3E0A9
		mov	al, 60h
		or	al, cl
		out	0A0h, al
		jmp	short loc_3E093

loc_3E093:
		jmp	short loc_3E095

loc_3E095:
		mov	ah, 4
		not	ah
		in	al, 0A1h
		jmp	short loc_3E09D

loc_3E09D:
		jmp	short loc_3E09F

loc_3E09F:
		and	al, ah
		out	0A1h, al
		jmp	short loc_3E0A5

loc_3E0A5:
		jmp	short loc_3E0A7

loc_3E0A7:
		mov	cl, 2

loc_3E0A9:
		mov	al, 60h
		or	al, cl
		out	20h, al
		jmp	short loc_3E0B1

loc_3E0B1:
		jmp	short loc_3E0B3

loc_3E0B3:
		mov	ah, 1
		shl	ah, cl
		not	ah
		in	al, 21h
		jmp	short loc_3E0BD

loc_3E0BD:
		jmp	short loc_3E0BF

loc_3E0BF:
		and	al, ah
		out	21h, al
		jmp	short loc_3E0C5

loc_3E0C5:
		jmp	short loc_3E0C7

loc_3E0C7:
		sti
		pop	ds
		retf
sub_3E058		endp

; ----------------------------------------------------------------------

sub_3E0CA		proc far
		push	ds
		cli
		push	bx
		push	si
		mov	ah, 25h
		mov	al, bl
		mov	dx, si
		int	21h
		pop	si
		pop	cx
		mov	bx, cx
		mov	al, 60h
		or	al, cl
		out	20h, al
		jmp	short loc_3E0E2

loc_3E0E2:
		jmp	short loc_3E0E4

loc_3E0E4:
		mov	ah, 1
		shl	ah, cl
		in	al, 21h
		jmp	short loc_3E0EC

loc_3E0EC:
		jmp	short loc_3E0EE

loc_3E0EE:
		or	al, ah
		out	21h, al
		jmp	short loc_3E0F4

loc_3E0F4:
		jmp	short loc_3E0F6

loc_3E0F6:
		sti
		pop	ds
		retf
sub_3E0CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E0F9		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	[bp+arg_0]
		pop	word ptr byte_5D698
		push	si
		push	ax
		mov	al, byte_5D698
		mov	byte_5D68B, al
		add	byte_5D68B, 4
		mov	byte_5D68C, al
		mov	byte_5D68F, al
		add	byte_5D68C, 58h
		add	byte_5D68F, 48h
		xor	ax, ax
		mov	al, byte_5D698
		mov	si, ax
		mov	al, [si+3970h]
		mov	byte_5D68D, al
		mov	al, [si+3974h]
		mov	byte_5D68E, al
		pop	ax
		pop	si
		leave
		retf
sub_3E0F9		endp

; ----------------------------------------------------------------------

sub_3E13A		proc far
		push	bx
		pushf
		shr	bx, 1
		adc	bx, 0FFFFh
		shl	bx, 2
		lea	si, [bx]
		popf
		pop	bx
		retf
sub_3E13A		endp

; START OF FUNCTION CHUNK FOR sub_3E13A
		push	ax
		mov	ax, 2
		jmp	short loc_3E165
		push	ax
		mov	ax, 3
		jmp	short loc_3E165
		push	ax
		mov	ax, 5
		jmp	short loc_3E165
		push	ax
		mov	ax, 7
		jmp	short loc_3E165
		push	ax
		mov	ax, 0Ah

loc_3E165:
		push	ds
		push	seg dseg
		pop	ds
		mov	word_5D672, ax
		push	dx
		mov	dx, word_5D674
		add	dx, 0Eh
		in	al, dx
		jmp	short loc_3E178

loc_3E178:
		jmp	short loc_3E17A

loc_3E17A:
		cli
		mov	al, 20h
		cmp	word_5D672, 8
		jl	short loc_3E186
		out	0A0h, al

loc_3E186:
		out	20h, al
		sti
		pop	dx
		pop	ds
		pop	ax
		iret
; END OF FUNCTION CHUNK FOR sub_3E13A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E18D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		in	al, 21h
		mov	byte_5D67E, al
		mov	word_5D676, 0
		mov	word_5D678, 0
		mov	word_5D67A, 0
		mov	word_5D67C, 0
		mov	ax, [bp+arg_0]
		mov	word_5D674, ax
		mov	ax, [bp+arg_2]
		mov	word_5D672, ax
		push	cs
		call	near ptr sub_3E2AD
		leave
		retf
sub_3E18D		endp

; ----------------------------------------------------------------------

sub_3E1C0		proc far
		push	cs
		call	near ptr sub_3E590
		mov	al, byte_5D67E
		out	21h, al
		push	cs
		call	near ptr sub_3E2AD
		retf
sub_3E1C0		endp

; ----------------------------------------------------------------------

sub_3E1CE		proc far
		push	si
		push	di
		in	al, 21h
		mov	byte_5D67E, al
		mov	di, 6
		mov	si, 395Fh

loc_3E1DB:
		mov	ax, [si]
		mov	word_5D674, ax
		push	cs
		call	near ptr sub_3E2AD
		mov	ax, word_5D674
		jnb	short loc_3E1F9
		add	si, 2
		dec	di
		jnz	short loc_3E1DB

loc_3E1EF:
		mov	ax, 0FFFFh
		mov	dx, 0FFFFh
		stc
		pop	di
		pop	si
		retf

loc_3E1F9:
		push	ax
		push	si
		in	al, 21h
		mov	byte_5D67E, al
		mov	bx, 0Ah
		mov	dx, 1A1h
		push	cs
		call	near ptr sub_3E13A
		push	cs
		call	near ptr sub_3E058
		mov	bx, 7
		mov	dx, 19Bh
		push	cs
		call	near ptr sub_3E13A
		push	cs
		call	near ptr sub_3E058
		mov	bx, 2
		mov	dx, 189h
		push	cs
		call	near ptr sub_3E13A
		push	cs
		call	near ptr sub_3E058
		mov	bx, 3
		mov	dx, 18Fh
		push	cs
		call	near ptr sub_3E13A
		push	cs
		call	near ptr sub_3E058
		mov	bx, 5
		mov	dx, 195h
		push	cs
		call	near ptr sub_3E13A
		push	cs
		call	near ptr sub_3E058
		pop	si
		mov	word_5D672, 0FFFFh
		mov	ah, 0F2h
		push	cs
		call	near ptr sub_3DFC0
		mov	cx, 1388h

loc_3E256:
		pushf
		push	cx
		mov	cx, 14h

loc_3E25B:
		jmp	short loc_3E25D

loc_3E25D:
		jmp	short loc_3E25F

loc_3E25F:
		push	ax
		pop	ax
		loop	short loc_3E25B
		pop	cx
		popf
		cmp	word_5D672, 0FFFFh
		loope	short loc_3E256
		mov	al, byte_5D67E
		out	21h, al
		mov	bx, 2
		push	cs
		call	near ptr sub_3E13A
		push	cs
		call	near ptr sub_3E0CA
		mov	bx, 3
		push	cs
		call	near ptr sub_3E13A
		push	cs
		call	near ptr sub_3E0CA
		mov	bx, 5
		push	cs
		call	near ptr sub_3E13A
		push	cs
		call	near ptr sub_3E0CA
		mov	bx, 7
		push	cs
		call	near ptr sub_3E13A
		push	cs
		call	near ptr sub_3E0CA
		mov	dx, word_5D672
		pop	ax
		cmp	dx, 0FFFFh
		jz	loc_3E1EF
		clc
		pop	di
		pop	si
		retf
sub_3E1CE		endp

; ----------------------------------------------------------------------

sub_3E2AD		proc far
		mov	dx, word_5D674
		add	dx, 0Eh
		in	al, dx
		jmp	short loc_3E2B7

loc_3E2B7:
		jmp	short loc_3E2B9

loc_3E2B9:
		mov	dx, word_5D674
		add	dx, 6
		mov	al, 1
		out	dx, al
		jmp	short loc_3E2C5

loc_3E2C5:
		jmp	short loc_3E2C7

loc_3E2C7:
		pushf
		push	cx
		mov	cx, 14h

loc_3E2CC:
		jmp	short loc_3E2CE

loc_3E2CE:
		jmp	short loc_3E2D0

loc_3E2D0:
		push	ax
		pop	ax
		loop	short loc_3E2CC
		pop	cx
		popf
		pushf
		push	cx
		mov	cx, 14h

loc_3E2DB:
		jmp	short loc_3E2DD

loc_3E2DD:
		jmp	short loc_3E2DF

loc_3E2DF:
		push	ax
		pop	ax
		loop	short loc_3E2DB
		pop	cx
		popf
		pushf
		push	cx
		mov	cx, 14h

loc_3E2EA:
		jmp	short loc_3E2EC

loc_3E2EC:
		jmp	short loc_3E2EE

loc_3E2EE:
		push	ax
		pop	ax
		loop	short loc_3E2EA
		pop	cx
		popf
		dec	al
		out	dx, al
		jmp	short loc_3E2F9

loc_3E2F9:
		jmp	short loc_3E2FB

loc_3E2FB:
		pushf
		push	cx
		mov	cx, 14h

loc_3E300:
		jmp	short loc_3E302

loc_3E302:
		jmp	short loc_3E304

loc_3E304:
		push	ax
		pop	ax
		loop	short loc_3E300
		pop	cx
		popf
		pushf
		push	cx
		mov	cx, 14h

loc_3E30F:
		jmp	short loc_3E311

loc_3E311:
		jmp	short loc_3E313

loc_3E313:
		push	ax
		pop	ax
		loop	short loc_3E30F
		pop	cx
		popf
		pushf
		push	cx
		mov	cx, 14h

loc_3E31E:
		jmp	short loc_3E320

loc_3E320:
		jmp	short loc_3E322

loc_3E322:
		push	ax
		pop	ax
		loop	short loc_3E31E
		pop	cx
		popf
		mov	cx, 3E8h

loc_3E32B:
		push	cx
		mov	dx, word_5D674
		add	dx, 0Eh
		mov	cx, 3E8h

loc_3E336:
		in	al, dx
		jmp	short loc_3E339

loc_3E339:
		jmp	short loc_3E33B

loc_3E33B:
		and	al, 80h
		loope	short loc_3E336
		stc
		jz	short loc_3E34B
		sub	dx, 4
		in	al, dx
		jmp	short loc_3E348

loc_3E348:
		jmp	short loc_3E34A

loc_3E34A:
		clc

loc_3E34B:
		pop	cx
		cmp	al, 0AAh
		loopne	short loc_3E32B
		stc
		jnz	short loc_3E354
		clc

loc_3E354:
		sbb	ax, ax
		rol	ax, 1
		retf
sub_3E2AD		endp

; ----------------------------------------------------------------------

sub_3E359		proc far
		mov	ah, 0E1h
		push	cs
		call	near ptr sub_3DFC0
		jb	short loc_3E370
		push	cs
		call	near ptr sub_3DFDF
		mov	ah, al
		jb	short loc_3E370
		push	cs
		call	near ptr sub_3DFDF
		jb	short loc_3E370
		retf

loc_3E370:
		mov	ax, 0FFFFh
		retf
sub_3E359		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E374		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		enter	0, 0
		mov	ax, [bp+arg_4]
		mov	word_5D66E, ax
		dec	ax
		mov	word_5D670, ax
		les	ax, [bp+arg_0]
		mov	dx, es
		mov	word_5D666, ax
		mov	word_5D668, dx
		mov	cl, 4
		rol	dx, cl
		mov	bx, dx
		and	dx, 0Fh
		and	bx, 0FFF0h
		add	ax, bx
		adc	dx, 0
		mov	word_5D66C, ax
		mov	byte_5D66A, dl
		leave
		retf
sub_3E374		endp

; ----------------------------------------------------------------------

sub_3E3A8		proc far
		mov	ah, 0D1h
		push	cs
		call	near ptr sub_3DFC0
		sbb	ax, ax
		rol	ax, 1
		retf
sub_3E3A8		endp

; START OF FUNCTION CHUNK FOR sub_3E3A8
		mov	ah, 0D3h
		push	cs
		call	near ptr sub_3DFC0
		sbb	ax, ax
		rol	ax, 1
		retf
; END OF FUNCTION CHUNK FOR sub_3E3A8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E3BE		proc far

arg_0		= word ptr  6

		enter	0, 0
		mov	bx, [bp+arg_0]
		or	bx, bx
		jz	short loc_3E3E3
		mov	dx, 0Fh
		mov	ax, 4240h
		div	bx
		neg	ax
		mov	bx, ax
		mov	ah, 40h
		push	cs
		call	near ptr sub_3DFC0
		jb	short loc_3E3E3
		mov	ah, bl
		push	cs
		call	near ptr sub_3DFC0

loc_3E3E3:
		sbb	ax, ax
		rol	ax, 1
		leave
		retf
sub_3E3BE		endp

; START OF FUNCTION CHUNK FOR sub_3E3BE
		push	ds
		push	ax
		mov	ax, seg dseg
		mov	ds, ax
		inc	word_5D258
		push	cx
		push	dx
		mov	dx, word_5D674
		add	dx, 0Eh
		in	al, dx
		jmp	short loc_3E400

loc_3E400:
		jmp	short loc_3E402

loc_3E402:
		mov	ah, 14h
		mov	dx, word_5D674
		add	dx, 0Ch
		mov	cx, 3E8h

loc_3E40E:
		in	al, dx
		jmp	short loc_3E411

loc_3E411:
		jmp	short loc_3E413

loc_3E413:
		and	al, 80h
		loopne	short loc_3E40E
		stc
		jnz	short loc_3E422
		mov	al, ah
		out	dx, al
		jmp	short loc_3E41F

loc_3E41F:
		jmp	short loc_3E421

loc_3E421:
		clc

loc_3E422:
		mov	ah, 0FFh
		mov	dx, word_5D674
		add	dx, 0Ch
		mov	cx, 3E8h

loc_3E42E:
		in	al, dx
		jmp	short loc_3E431

loc_3E431:
		jmp	short loc_3E433

loc_3E433:
		and	al, 80h
		loopne	short loc_3E42E
		stc
		jnz	short loc_3E442
		mov	al, ah
		out	dx, al
		jmp	short loc_3E43F

loc_3E43F:
		jmp	short loc_3E441

loc_3E441:
		clc

loc_3E442:
		mov	dx, word_5D674
		add	dx, 0Ch
		mov	cx, 3E8h

loc_3E44C:
		in	al, dx
		jmp	short loc_3E44F

loc_3E44F:
		jmp	short loc_3E451

loc_3E451:
		and	al, 80h
		loopne	short loc_3E44C
		stc
		jnz	short loc_3E460
		mov	al, ah
		out	dx, al
		jmp	short loc_3E45D

loc_3E45D:
		jmp	short loc_3E45F

loc_3E45F:
		clc

loc_3E460:
		cli
		mov	al, 20h
		cmp	word_5D672, 8
		jl	short loc_3E46C
		out	0A0h, al

loc_3E46C:
		out	20h, al
		sti
		pop	dx
		pop	cx
		pop	ax
		pop	ds
		iret
; END OF FUNCTION CHUNK FOR sub_3E3BE

; ----------------------------------------------------------------------

sub_3E474		proc far
		mov	al, byte_5D66B
		or	al, al
		clc
		jz	short loc_3E47F
		jmp	loc_3E51D

loc_3E47F:
		mov	al, 1
		mov	byte_5D66B, al
		mov	bx, word_5D672
		mov	dx, 429h
		push	si
		mov	si, 3956h
		push	cs
		call	near ptr sub_3E058
		pop	si
		push	dx
		xor	dx, dx
		mov	al, byte_5D68B
		out	0Ah, al
		jmp	short loc_3E49E

loc_3E49E:
		jmp	short loc_3E4A0

loc_3E4A0:
		mov	al, 0
		out	0Ch, al
		jmp	short loc_3E4A6

loc_3E4A6:
		jmp	short loc_3E4A8

loc_3E4A8:
		mov	al, byte_5D68C
		out	0Bh, al
		jmp	short loc_3E4AF

loc_3E4AF:
		jmp	short loc_3E4B1

loc_3E4B1:
		mov	ax, word_5D66C
		mov	dl, byte_5D698
		shl	dl, 1
		out	dx, al
		jmp	short loc_3E4BD

loc_3E4BD:
		jmp	short loc_3E4BF

loc_3E4BF:
		mov	al, ah
		out	dx, al
		jmp	short loc_3E4C4

loc_3E4C4:
		jmp	short loc_3E4C6

loc_3E4C6:
		mov	al, byte_5D66A
		mov	dl, byte_5D68D
		out	dx, al
		jmp	short loc_3E4D0

loc_3E4D0:
		jmp	short loc_3E4D2

loc_3E4D2:
		mov	bx, word_5D66E
		dec	bx
		mov	dl, byte_5D68E
		mov	al, bl
		out	dx, al
		jmp	short loc_3E4E0

loc_3E4E0:
		jmp	short loc_3E4E2

loc_3E4E2:
		mov	al, bh
		out	dx, al
		jmp	short loc_3E4E7

loc_3E4E7:
		jmp	short loc_3E4E9

loc_3E4E9:
		mov	al, byte_5D698
		out	0Ah, al
		jmp	short loc_3E4F0

loc_3E4F0:
		jmp	short loc_3E4F2

loc_3E4F2:
		pop	dx
		mov	ah, 14h
		push	cs
		call	near ptr sub_3DFC0
		jb	short loc_3E51D
		mov	cx, 4E20h

loc_3E4FE:
		pushf
		push	cx
		mov	cx, 14h

loc_3E503:
		jmp	short loc_3E505

loc_3E505:
		jmp	short loc_3E507

loc_3E507:
		push	ax
		pop	ax
		loop	short loc_3E503
		pop	cx
		popf
		loop	short loc_3E4FE
		mov	ah, 0FFh
		push	cs
		call	near ptr sub_3DFC0
		jb	short loc_3E51D
		push	cs
		call	near ptr sub_3DFC0
		jb	short loc_3E51D

loc_3E51D:
		sbb	ax, ax
		rol	ax, 1
		retf
sub_3E474		endp

; ----------------------------------------------------------------------

sub_3E522		proc far
		push	si
		mov	si, 3956h
		mov	bx, [si+6]
		or	bx, bx
		jz	short loc_3E543
		mov	bx, word_5D672
		push	cs
		call	near ptr sub_3E0CA
		xor	ax, ax
		mov	word_5D676, ax
		mov	word_5D678, ax
		mov	word_5D67A, ax
		mov	word_5D67C, ax

loc_3E543:
		pop	si
		retf
sub_3E522		endp

; ----------------------------------------------------------------------

sub_3E545		proc far
		push	ax
		push	dx
		push	cx
		push	si
		pushf
		mov	ah, 0D0h
		mov	dx, word_5D674
		add	dl, 0Ch
		mov	si, 64h
		dec	si
		or	si, si
		jz	short loc_3E57D
		mov	cx, 64h

loc_3E55E:
		sti
		dec	cx
		jcxz	short loc_3E57D
		cli
		in	al, dx
		jmp	short loc_3E566

loc_3E566:
		jmp	short loc_3E568

loc_3E568:
		or	al, al
		jns	short loc_3E55E
		mov	cx, 64h

loc_3E56F:
		dec	cx
		jcxz	short loc_3E57D
		in	al, dx
		jmp	short loc_3E575

loc_3E575:
		jmp	short loc_3E577

loc_3E577:
		or	al, al
		js	short loc_3E56F
		jmp	short loc_3E57D

loc_3E57D:
		mov	al, ah
		mov	cx, 1

loc_3E582:
		out	dx, al
		jmp	short loc_3E585

loc_3E585:
		jmp	short loc_3E587

loc_3E587:
		loop	short loc_3E582
		sti
		popf
		pop	si
		pop	cx
		pop	dx
		pop	ax
		retf
sub_3E545		endp

; ----------------------------------------------------------------------

sub_3E590		proc far
		cmp	byte_5D66B, 0
		clc
		jz	short loc_3E5D6
		push	cs
		call	near ptr sub_3E545
		cli
		mov	al, byte_5D68B
		out	0Ah, al
		jmp	short loc_3E5A4

loc_3E5A4:
		jmp	short loc_3E5A6

loc_3E5A6:
		mov	dx, word_5D674
		add	dx, 0Eh
		in	al, dx
		jmp	short loc_3E5B0

loc_3E5B0:
		jmp	short loc_3E5B2

loc_3E5B2:
		xor	al, al
		mov	byte_5D66B, al
		mov	bx, word_5D676
		or	bx, bx
		jz	short loc_3E5D6
		push	cs
		call	near ptr sub_3E522
		mov	cx, word_5D672
		cmp	cx, 0FFFFh
		jz	short loc_3E5D6
		mov	ah, 1
		shl	ah, cl
		in	al, 21h
		or	al, ah
		out	21h, al

loc_3E5D6:
		sti
		retf
sub_3E590		endp

; ----------------------------------------------------------------------

sub_3E5D8		proc far
		push	dx
		xor	dx, dx
		mov	dl, byte_5D68E
		in	al, dx
		jmp	short loc_3E5E2

loc_3E5E2:
		jmp	short loc_3E5E4

loc_3E5E4:
		mov	ah, al
		in	al, dx
		pop	dx
		jmp	short loc_3E5EA

loc_3E5EA:
		jmp	short loc_3E5EC

loc_3E5EC:
		xchg	ah, al
		mov	bx, ax
sub_3E5D8		endp
seg093		ends
