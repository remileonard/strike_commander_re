seg094		segment	para public 'CODE' use16
		assume cs:seg094
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0A1h, 4Eh, 39h, 48h, 2Bh, 0C3h, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E5F8		proc far
		enter	0, 0
		push	di
		mov	dx, 0

loc_3E600:
		les	di, word_5D6B0
		xor	ax, ax
		mov	ah, dl
		add	di, ax
		mov	cx, 100h
		xor	bx, bx
		mov	si, dx
		shl	si, 4

loc_3E614:
		mov	ax, si
		push	dx
		imul	bx
		pop	dx
		mov	es:[di], ah
		inc	bx
		mov	ax, bx
		cbw
		mov	bx, ax
		inc	di
		loop	short loc_3E614
		inc	dx
		cmp	dx, 10h
		jnz	short loc_3E600
		pop	di
		leave
		retf
sub_3E5F8		endp

; ----------------------------------------------------------------------

sub_3E62F		proc far
		push	si
		mov	cx, 4
		mov	al, 0
		xor	si, si

loc_3E637:
		mov	bx, [si+3A30h]
		mov	[bx], al
		inc	si
		inc	si
		loop	short loc_3E637
		pop	si
		retf
sub_3E62F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E643		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		enter	0, 0
		push	si
		push	di
		push	cs
		call	near ptr sub_3E5F8
		push	cs
		call	near ptr sub_3E62F
		mov	bx, [bp+arg_6]
		mov	si, [bp+arg_8]
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		call	sub_3DEF7
		pop	di
		pop	si
		leave
		retf
sub_3E643		endp

; ----------------------------------------------------------------------

sub_3E669		proc far
		push	cs
		call	near ptr sub_3E62F
		call	sub_3DF57
		retf
sub_3E669		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E673		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	si, [bp+arg_0]
		cmp	si, 3
		jg	short loc_3E6B8
		nop
		nop
		cmp	si, 0
		jl	short loc_3E6B8
		nop
		nop
		mov	ax, [bp+arg_2]
		shl	si, 1
		mov	si, [si+3A30h]
		lea	bx, [si+22h]
		mov	[bx], ax
		lea	si, [si+24h]
		mov	ax, [bp+arg_2]
		cmp	ax, 0FFh
		jle	short loc_3E6AB
		nop
		nop
		mov	ax, 0FFh

loc_3E6AB:
		shl	ax, 4
		xor	al, al
		mov	bx, word_5D6B0
		add	ax, bx
		mov	[si], ax

loc_3E6B8:
		pop	di
		pop	si
		leave
		retf
sub_3E673		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E6BC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		push	si
		mov	si, [bp+arg_0]
		cmp	si, 3
		jg	short loc_3E6F2
		nop
		nop
		cmp	si, 0
		jl	short loc_3E6F2
		nop
		nop
		shl	si, 1
		mov	si, [si+3A30h]
		mov	cx, 2B11h
		xor	dx, dx
		mov	ax, [bp+arg_2]
		div	cx
		mov	[si+1Ch], ax
		mov	[si+14h], ax
		xor	ax, ax
		div	cx
		mov	[si+1Eh], ax
		mov	[si+16h], ax

loc_3E6F2:
		pop	si
		leave
		retf
sub_3E6BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E6F5		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		enter	0, 0
		push	si
		mov	si, [bp+arg_0]
		cmp	si, 3
		jg	short loc_3E773
		nop
		nop
		cmp	si, 0
		jl	short loc_3E773
		nop
		nop
		shl	si, 1
		mov	si, [si+3A30h]
		cli
		mov	eax, [bp+arg_2]
		mov	[si+4], eax
		xor	ax, ax
		mov	[si+8], ax
		mov	[si+0Ah], ax
		mov	[si+0Ch], ax
		add	ax, [bp+arg_6]
		mov	[si+0Eh], ax
		mov	word ptr [si+2], 0
		mov	cx, 2B11h
		xor	dx, dx
		mov	ax, [bp+arg_8]
		div	cx
		mov	[si+1Ch], ax
		mov	[si+14h], ax
		xor	ax, ax
		div	cx
		mov	[si+1Eh], ax
		mov	[si+16h], ax
		push	[bp+arg_A]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_3E673
		add	sp, 4
		mov	ax, [si+8]
		mov	[si+10h], ax
		mov	ax, [si+0Eh]
		mov	[si+12h], ax
		mov	ax, [si+8]
		mov	[si+18h], ax
		xor	ax, ax
		mov	[si+1Ah], ax
		mov	al, 1
		mov	[si], al
		sti

loc_3E773:
		pop	si
		leave
		retf
sub_3E6F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E776		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	si
		mov	si, [bp+arg_0]
		cmp	si, 3
		jg	short loc_3E795
		nop
		nop
		cmp	si, 0
		jl	short loc_3E795
		nop
		nop
		shl	si, 1
		mov	si, [si+3A30h]
		mov	byte ptr [si], 0

loc_3E795:
		pop	si
		leave
		retf
sub_3E776		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E798		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	si
		mov	si, [bp+arg_0]
		cmp	si, 3
		jg	short loc_3E7B7
		nop
		nop
		cmp	si, 0
		jl	short loc_3E7B7
		nop
		nop
		shl	si, 1
		mov	si, [si+3A30h]
		mov	byte ptr [si], 1

loc_3E7B7:
		pop	si
		leave
		retf
sub_3E798		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E7BA		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		enter	0, 0
		push	si
		mov	si, [bp+arg_0]
		cmp	si, 3
		jg	loc_3E84A
		cmp	si, 0
		jl	short loc_3E84A
		nop
		nop
		shl	si, 1
		mov	si, [si+3A30h]
		cli
		mov	eax, [bp+arg_2]
		mov	[si+4], eax
		xor	ax, ax
		mov	[si+8], ax
		mov	bx, [bp+arg_8]
		mov	[si+0Ah], bx
		add	bx, [bp+arg_A]
		mov	[si+0Ch], bx
		add	ax, [bp+arg_6]
		mov	[si+0Eh], ax
		mov	ax, [bp+arg_A]
		mov	[si+2], ax
		mov	cx, 2B11h
		xor	dx, dx
		mov	ax, [bp+arg_C]
		div	cx
		mov	[si+1Ch], ax
		mov	[si+14h], ax
		xor	ax, ax
		div	cx
		mov	[si+1Eh], ax
		mov	[si+16h], ax
		push	[bp+arg_E]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_3E673
		add	sp, 4
		mov	ax, [si+0Ah]
		mov	[si+10h], ax
		mov	ax, [si+0Ch]
		cmp	word ptr [si+2], 0
		jnz	short loc_3E837
		nop
		nop
		mov	ax, [si+0Eh]

loc_3E837:
		mov	[si+12h], ax
		mov	ax, [si+8]
		mov	[si+18h], ax
		xor	ax, ax
		mov	[si+1Ah], ax
		mov	al, 1
		mov	[si], al
		sti

loc_3E84A:
		pop	si
		leave
		retf
sub_3E7BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E84D		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	si
		mov	si, [bp+arg_0]
		cmp	si, 3
		jg	short loc_3E875
		nop
		nop
		cmp	si, 0
		jl	short loc_3E875
		nop
		nop
		shl	si, 1
		mov	si, [si+3A30h]
		cli
		mov	ax, [si+0Eh]
		mov	[si+12h], ax
		mov	al, 2
		mov	[si], al
		sti

loc_3E875:
		pop	si
		leave
		retf
sub_3E84D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E878		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		enter	0, 0
		push	si
		mov	si, [bp+arg_0]
		cmp	si, 3
		jg	short loc_3E8B9
		nop
		nop
		cmp	si, 0
		jl	short loc_3E8B9
		nop
		nop
		shl	si, 1
		mov	si, [si+3A30h]
		mov	eax, [bp+arg_2]
		mov	[si+4], eax
		xor	ax, ax
		mov	[si+8], ax
		mov	bx, [bp+arg_6]
		mov	[si+0Eh], bx
		mov	bx, [bp+arg_8]
		mov	[si+0Ah], bx
		add	bx, [bp+arg_A]
		mov	[si+0Ch], bx
		mov	ax, [bp+arg_A]
		mov	[si+2], ax

loc_3E8B9:
		pop	si
		leave
		retf
sub_3E878		endp

; ----------------------------------------------------------------------

sub_3E8BC		proc far
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:4, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:6, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:8, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:10h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:12h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:14h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:16h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:18h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:20h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:22h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:24h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:26h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:28h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:30h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:32h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:34h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:36h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:38h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:40h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:42h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:44h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:46h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:48h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:4Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:4Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:4Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:50h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:52h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:54h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:56h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:58h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:5Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:5Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:5Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:60h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:62h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:64h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:66h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:68h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:6Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:6Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:6Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:70h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:72h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:74h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:76h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:78h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:7Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:7Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:7Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:80h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:82h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:84h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:86h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:88h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:8Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:8Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:8Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:90h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:92h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:94h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:96h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:98h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:9Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:9Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:9Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0A0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0A2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0A4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0A6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0A8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0AAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0ACh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0AEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0B0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0B2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0B4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0B6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0B8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0BAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0BCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0BEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0C0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0C2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0C4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0C6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0C8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0CAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0CCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0CEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0D0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0D2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0D4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0D6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0D8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0DAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0DCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0DEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0E0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0E2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0E4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0E6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0E8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0EAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0ECh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0EEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0F0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0F2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0F4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0F6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0F8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0FAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0FCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:0FEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:100h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:102h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:104h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:106h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:108h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:10Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:10Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:10Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:110h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:112h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:114h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:116h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:118h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:11Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:11Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:11Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:120h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:122h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:124h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:126h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:128h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:12Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:12Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:12Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:130h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:132h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:134h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:136h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:138h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:13Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:13Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:13Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:140h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:142h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:144h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:146h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:148h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:14Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:14Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:14Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:150h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:152h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:154h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:156h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:158h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:15Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:15Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:15Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:160h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:162h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:164h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:166h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:168h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:16Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:16Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:16Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:170h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:172h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:174h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:176h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:178h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:17Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:17Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:17Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:180h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:182h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:184h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:186h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:188h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:18Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:18Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:18Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:190h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:192h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:194h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:196h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:198h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:19Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:19Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:19Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1A0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1A2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1A4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1A6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1A8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1AAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1ACh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1AEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1B0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1B2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1B4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1B6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1B8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1BAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1BCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1BEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1C0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1C2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1C4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1C6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1C8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1CAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1CCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1CEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1D0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1D2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1D4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1D6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1D8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1DAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1DCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1DEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1E0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1E2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1E4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1E6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1E8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1EAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1ECh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1EEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1F0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1F2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1F4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1F6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1F8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1FAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1FCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:1FEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:200h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:202h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:204h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:206h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:208h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:20Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:20Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:20Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:210h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:212h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:214h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:216h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:218h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:21Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:21Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:21Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:220h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:222h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:224h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:226h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:228h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:22Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:22Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:22Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:230h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:232h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:234h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:236h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:238h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:23Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:23Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:23Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:240h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:242h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:244h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:246h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:248h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:24Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:24Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:24Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:250h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:252h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:254h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:256h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:258h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:25Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:25Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:25Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:260h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:262h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:264h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:266h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:268h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:26Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:26Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:26Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:270h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:272h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:274h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:276h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:278h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:27Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:27Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:27Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:280h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:282h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:284h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:286h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:288h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:28Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:28Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:28Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:290h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:292h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:294h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:296h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:298h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:29Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:29Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:29Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2A0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2A2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2A4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2A6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2A8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2AAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2ACh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2AEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2B0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2B2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2B4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2B6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2B8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2BAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2BCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2BEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2C0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2C2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2C4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2C6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2C8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2CAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2CCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2CEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2D0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2D2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2D4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2D6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2D8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2DAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2DCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2DEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2E0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2E2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2E4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2E6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2E8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2EAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2ECh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2EEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2F0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2F2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2F4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2F6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2F8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2FAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2FCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:2FEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:300h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:302h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:304h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:306h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:308h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:30Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:30Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:30Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:310h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:312h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:314h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:316h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:318h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:31Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:31Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:31Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:320h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:322h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:324h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:326h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:328h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:32Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:32Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:32Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:330h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:332h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:334h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:336h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:338h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:33Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:33Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:33Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:340h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:342h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:344h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:346h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:348h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:34Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:34Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:34Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:350h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:352h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:354h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:356h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:358h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:35Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:35Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:35Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:360h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:362h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:364h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:366h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:368h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:36Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:36Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:36Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:370h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:372h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:374h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:376h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:378h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:37Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:37Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:37Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:380h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:382h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:384h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:386h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:388h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:38Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:38Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:38Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:390h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:392h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:394h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:396h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:398h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:39Ah, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:39Ch, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:39Eh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3A0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3A2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3A4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3A6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3A8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3AAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3ACh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3AEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3B0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3B2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3B4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3B6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3B8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3BAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3BCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3BEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3C0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3C2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3C4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3C6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3C8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3CAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3CCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3CEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3D0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3D2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3D4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3D6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3D8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3DAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3DCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3DEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3E0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3E2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3E4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3E6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3E8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3EAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3ECh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3EEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3F0h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3F2h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3F4h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3F6h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3F8h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3FAh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3FCh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:3FEh, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:400h, ax
		add	cx, dx
		adc	si, di
		mov	al, es:[si]
		xlatb
		cbw
		add	gs:402h, ax
		add	cx, dx
		adc	si, di
		retf
sub_3E8BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_406BD		proc far
		enter	2, 0
		push	es
		push	ds
		push	si
		push	di
		push	fs
		push	gs
		mov	ax, 4700h
		mov	dx, word_5D978
		int	67h
		mov	ax, word_5D6B2
		mov	fs, ax
		mov	ax, word_5D6B6
		mov	gs, ax
		cld
		mov	ax, ds
		mov	es, ax
		mov	al, byte_5D6B8
		add	al, byte_5D6DE
		add	al, byte_5D704
		add	al, byte_5D72A
		jnz	short loc_40731
		nop
		nop
		mov	ax, word_5D252
		or	ax, ax
		jz	short loc_40700
		nop
		nop
		jmp	loc_40CE0

loc_40700:
		mov	ax, word_5D760
		or	ax, ax
		js	short loc_40729
		nop
		nop
		dec	ax
		mov	word_5D760, ax
		mov	cx, 200h
		xor	ax, ax
		push	es
		les	di, word_5D6B4
		rep stosw
		pop	es
		mov	cx, 200h
		mov	si, word_5D6B4
		call	sub_3DF7A
		jmp	loc_40CE0

loc_40729:
		call	sub_3DF6D
		jmp	loc_40CE0

loc_40731:
		mov	ax, 14h
		mov	word_5D760, ax
		mov	ax, word_5D252
		or	ax, ax
		jz	short loc_40747
		nop
		nop
		push	es
		call	sub_3DF74
		pop	es

loc_40747:
		mov	cx, 200h
		xor	ax, ax
		push	es
		les	di, word_5D6B4
		rep stosw
		pop	es
		cmp	byte_5D6B8, 0
		jnz	short loc_40760
		nop
		nop
		jmp	loc_408B4

loc_40760:
		xor	bx, bx
		mov	dx, word_5D6D4
		mov	ax, word_5D6D6
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		add	ax, 0FFFFh
		adc	dx, 0
		adc	bx, 0
		add	ax, word_5D6D2
		adc	dx, word_5D6D0
		cmp	dx, word_5D6CA
		jnb	short loc_40806
		nop
		nop
		mov	eax, dword_5D6BC
		mov	edx, eax
		shr	edx, 18h
		push	dx
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		call	sub_431E7
		add	sp, 6
		add	ax, word_5D6D0
		mov	si, ax
		mov	word_5D758, ax
		mov	es, dx
		mov	cx, word_5D6D2
		mov	di, word_5D6D4
		mov	dx, word_5D6D6
		mov	bx, word_5D6DC
		push	cs
		call	near ptr sub_3E8BC

loc_407F7:
		mov	word_5D6D2, cx
		sub	si, word_5D758
		add	word_5D6D0, si
		jmp	loc_408B4

loc_40806:
		xor	ax, ax
		mov	word_5D75E, ax

loc_4080B:
		mov	eax, dword_5D6BC
		mov	edx, eax
		shr	edx, 18h
		push	dx
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	bx, ax
		add	bx, word_5D6CA
		mov	word_5D75C, bx
		add	ax, word_5D6D0
		mov	si, ax
		mov	word_5D758, ax
		mov	es, dx
		mov	cx, word_5D6D2
		mov	di, word_5D6D4
		mov	dx, word_5D6D6

loc_4084C:
		mov	al, es:[si]
		mov	bx, word_5D6DC
		xlatb
		mov	bx, word_5D75E
		cbw
		shl	bx, 1
		add	gs:[bx+4], ax
		inc	word_5D75E
		add	cx, dx
		adc	si, di
		cmp	si, word_5D75C
		jnb	short loc_4087B
		nop
		nop
		cmp	word_5D75E, 200h
		jnz	short loc_4084C
		jmp	loc_407F7

loc_4087B:
		mov	al, byte_5D6B8
		cmp	al, 1
		jnz	short loc_408A3
		nop
		nop
		mov	ax, word_5D6BA
		or	ax, ax
		jz	short loc_408A3
		nop
		nop
		mov	ax, word_5D6C8
		mov	word_5D6D2, cx
		mov	word_5D6D0, ax
		cmp	word_5D75E, 200h
		jnz	loc_4080B
		jmp	short loc_408B4

loc_408A3:
		mov	al, 0
		mov	byte_5D6B8, al
		mov	ax, 0
		push	ax
		call	sub_41EEB
		add	sp, 2

loc_408B4:
		cmp	byte_5D6DE, 0
		jnz	short loc_408C0
		nop
		nop
		jmp	loc_40A14

loc_408C0:
		xor	bx, bx
		mov	dx, word_5D6FA
		mov	ax, word_5D6FC
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		add	ax, 0FFFFh
		adc	dx, 0
		adc	bx, 0
		add	ax, word_5D6F8
		adc	dx, word_5D6F6
		cmp	dx, word_5D6F0
		jnb	short loc_40966
		nop
		nop
		mov	eax, dword_5D6E2
		mov	edx, eax
		shr	edx, 18h
		push	dx
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		call	sub_431E7
		add	sp, 6
		add	ax, word_5D6F6
		mov	si, ax
		mov	word_5D758, ax
		mov	es, dx
		mov	cx, word_5D6F8
		mov	di, word_5D6FA
		mov	dx, word_5D6FC
		mov	bx, word_5D702
		push	cs
		call	near ptr sub_3E8BC

loc_40957:
		mov	word_5D6F8, cx
		sub	si, word_5D758
		add	word_5D6F6, si
		jmp	loc_40A14

loc_40966:
		xor	ax, ax
		mov	word_5D75E, ax

loc_4096B:
		mov	eax, dword_5D6E2
		mov	edx, eax
		shr	edx, 18h
		push	dx
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	bx, ax
		add	bx, word_5D6F0
		mov	word_5D75C, bx
		add	ax, word_5D6F6
		mov	si, ax
		mov	word_5D758, ax
		mov	es, dx
		mov	cx, word_5D6F8
		mov	di, word_5D6FA
		mov	dx, word_5D6FC

loc_409AC:
		mov	al, es:[si]
		mov	bx, word_5D702
		xlatb
		mov	bx, word_5D75E
		cbw
		shl	bx, 1
		add	gs:[bx+4], ax
		inc	word_5D75E
		add	cx, dx
		adc	si, di
		cmp	si, word_5D75C
		jnb	short loc_409DB
		nop
		nop
		cmp	word_5D75E, 200h
		jnz	short loc_409AC
		jmp	loc_40957

loc_409DB:
		mov	al, byte_5D6DE
		cmp	al, 1
		jnz	short loc_40A03
		nop
		nop
		mov	ax, word_5D6E0
		or	ax, ax
		jz	short loc_40A03
		nop
		nop
		mov	ax, word_5D6EE
		mov	word_5D6F8, cx
		mov	word_5D6F6, ax
		cmp	word_5D75E, 200h
		jnz	loc_4096B
		jmp	short loc_40A14

loc_40A03:
		mov	al, 0
		mov	byte_5D6DE, al
		mov	ax, 1
		push	ax
		call	sub_41EEB
		add	sp, 2

loc_40A14:
		cmp	byte_5D704, 0
		jnz	short loc_40A20
		nop
		nop
		jmp	loc_40B74

loc_40A20:
		xor	bx, bx
		mov	dx, word_5D720
		mov	ax, word_5D722
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		add	ax, 0FFFFh
		adc	dx, 0
		adc	bx, 0
		add	ax, word_5D71E
		adc	dx, word_5D71C
		cmp	dx, word_5D716
		jnb	short loc_40AC6
		nop
		nop
		mov	eax, dword_5D708
		mov	edx, eax
		shr	edx, 18h
		push	dx
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		call	sub_431E7
		add	sp, 6
		add	ax, word_5D71C
		mov	si, ax
		mov	word_5D758, ax
		mov	es, dx
		mov	cx, word_5D71E
		mov	di, word_5D720
		mov	dx, word_5D722
		mov	bx, word_5D728
		push	cs
		call	near ptr sub_3E8BC

loc_40AB7:
		mov	word_5D71E, cx
		sub	si, word_5D758
		add	word_5D71C, si
		jmp	loc_40B74

loc_40AC6:
		xor	ax, ax
		mov	word_5D75E, ax

loc_40ACB:
		mov	eax, dword_5D708
		mov	edx, eax
		shr	edx, 18h
		push	dx
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	bx, ax
		add	bx, word_5D716
		mov	word_5D75C, bx
		add	ax, word_5D71C
		mov	si, ax
		mov	word_5D758, ax
		mov	es, dx
		mov	cx, word_5D71E
		mov	di, word_5D720
		mov	dx, word_5D722

loc_40B0C:
		mov	al, es:[si]
		mov	bx, word_5D728
		xlatb
		mov	bx, word_5D75E
		cbw
		shl	bx, 1
		add	gs:[bx+4], ax
		inc	word_5D75E
		add	cx, dx
		adc	si, di
		cmp	si, word_5D75C
		jnb	short loc_40B3B
		nop
		nop
		cmp	word_5D75E, 200h
		jnz	short loc_40B0C
		jmp	loc_40AB7

loc_40B3B:
		mov	al, byte_5D704
		cmp	al, 1
		jnz	short loc_40B63
		nop
		nop
		mov	ax, word_5D706
		or	ax, ax
		jz	short loc_40B63
		nop
		nop
		mov	ax, word_5D714
		mov	word_5D71E, cx
		mov	word_5D71C, ax
		cmp	word_5D75E, 200h
		jnz	loc_40ACB
		jmp	short loc_40B74

loc_40B63:
		mov	al, 0
		mov	byte_5D704, al
		mov	ax, 2
		push	ax
		call	sub_41EEB
		add	sp, 2

loc_40B74:
		cmp	byte_5D72A, 0
		jnz	short loc_40B80
		nop
		nop
		jmp	loc_40CD4

loc_40B80:
		xor	bx, bx
		mov	dx, word_5D746
		mov	ax, word_5D748
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		shl	ax, 1
		rcl	dx, 1
		rcl	bx, 1
		add	ax, 0FFFFh
		adc	dx, 0
		adc	bx, 0
		add	ax, word_5D744
		adc	dx, word_5D742
		cmp	dx, word_5D73C
		jnb	short loc_40C26
		nop
		nop
		mov	eax, dword_5D72E
		mov	edx, eax
		shr	edx, 18h
		push	dx
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		call	sub_431E7
		add	sp, 6
		add	ax, word_5D742
		mov	si, ax
		mov	word_5D758, ax
		mov	es, dx
		mov	cx, word_5D744
		mov	di, word_5D746
		mov	dx, word_5D748
		mov	bx, word_5D74E
		push	cs
		call	near ptr sub_3E8BC

loc_40C17:
		mov	word_5D744, cx
		sub	si, word_5D758
		add	word_5D742, si
		jmp	loc_40CD4

loc_40C26:
		xor	ax, ax
		mov	word_5D75E, ax

loc_40C2B:
		mov	eax, dword_5D72E
		mov	edx, eax
		shr	edx, 18h
		push	dx
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		call	sub_431E7
		add	sp, 6
		mov	bx, ax
		add	bx, word_5D73C
		mov	word_5D75C, bx
		add	ax, word_5D742
		mov	si, ax
		mov	word_5D758, ax
		mov	es, dx
		mov	cx, word_5D744
		mov	di, word_5D746
		mov	dx, word_5D748

loc_40C6C:
		mov	al, es:[si]
		mov	bx, word_5D74E
		xlatb
		mov	bx, word_5D75E
		cbw
		shl	bx, 1
		add	gs:[bx+4], ax
		inc	word_5D75E
		add	cx, dx
		adc	si, di
		cmp	si, word_5D75C
		jnb	short loc_40C9B
		nop
		nop
		cmp	word_5D75E, 200h
		jnz	short loc_40C6C
		jmp	loc_40C17

loc_40C9B:
		mov	al, byte_5D72A
		cmp	al, 1
		jnz	short loc_40CC3
		nop
		nop
		mov	ax, word_5D72C
		or	ax, ax
		jz	short loc_40CC3
		nop
		nop
		mov	ax, word_5D73A
		mov	word_5D744, cx
		mov	word_5D742, ax
		cmp	word_5D75E, 200h
		jnz	loc_40C2B
		jmp	short loc_40CD4

loc_40CC3:
		mov	al, 0
		mov	byte_5D72A, al
		mov	ax, 3
		push	ax
		call	sub_41EEB
		add	sp, 2

loc_40CD4:
		mov	cx, 200h
		mov	si, word_5D6B4
		call	sub_3DF7A

loc_40CE0:
		mov	ax, 4800h
		mov	dx, word_5D978
		int	67h
		pop	gs
		pop	fs
		pop	di
		pop	si
		pop	ds
sub_406BD		endp
seg094		ends
