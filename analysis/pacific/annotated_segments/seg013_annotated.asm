seg013		segment	para public 'CODE' use16
		assume cs:seg013
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C0h

loc_7D61:
		db 8Eh, 5Eh, 0FEh, 8Bh, 0E5h, 5Dh, 5Fh, 5Eh, 0CAh, 8, 0

loc_7D6C:
		push	65h
		insw
		insw
		outsw
		jbe	short loc_7DE0
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+di], dl
		add	[bx+si], al
		add	al, ah
		add	[bx+si], al
		and	ax, 0D600h
		pop	es
		sub	ax, [bx+si]
		salc
		pop	es
		add	[bx+si], al
		adc	ax, 8A7Ch
		adc	dx, si
		pop	es
		stosb
		adc	dx, si
		pop	es
		sbb	[si], dx
		salc
		pop	es
		add	[bx+si], al
		inc	ax
		add	[bx+si], al
		adc	[bx+si], al
		add	[bx+si], ah
		inc	ax
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx], al
		salc
		pop	es
		add	[bx+si], al

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7E02		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, ds
		mov	[bp+var_2], ax
		mov	ax, es
		mov	[bp+var_4], ax
		mov	ax, cs
		mov	ds, ax
		push	cs
		call	near ptr sub_7F34
		cmp	ax, 0
		jz	short loc_7E22
		jmp	loc_7ECA

loc_7E22:
		push	cs
		call	near ptr sub_83CF
		cmp	ax, 19h
		jnb	short loc_7E31
		mov	ax, 0Eh
		jmp	loc_7ECA

loc_7E31:
		push	cs
		call	near ptr sub_81CF
		or	ax, ax
		jg	short loc_7EAE
		jl	short loc_7E75
		push	cs
		call	near ptr sub_83B2
		or	ax, ax
		jnz	short loc_7EAE
		push	[bp+arg_4]
		push	cs
		call	near ptr sub_8191
		add	sp, 2
		cmp	ax, 0
		jz	short loc_7E68
		cmp	ax, 0Ch
		jz	short loc_7EAE
		mov	ah, 88h
		int	15h
		mov	word_76769, ax
		cmp	ax, 0B54h
		jnb	short loc_7E75
		mov	ax, 2
		jmp	short loc_7EAE

loc_7E68:
		mov	ax, word_76769
		cmp	ax, 0B54h
		jnb	short loc_7E75
		mov	ax, 2
		jmp	short loc_7EAE

loc_7E75:
		push	cs
		call	near ptr sub_7EEA
		or	ax, ax
		jnz	short loc_7E8C
		mov	ah, 0DFh
		push	cs
		call	near ptr sub_7F12
		cmp	al, 0
		jz	short loc_7E8C
		mov	ax, 5
		jmp	short loc_7EAE

loc_7E8C:
		push	cs
		call	near ptr sub_7ED8
		push	large [bp+arg_8]
		push	[bp+arg_6]
		mov	eax, [bp+arg_0]
		push	eax
		push	cs
		call	near ptr sub_7F76
		add	sp, 0Ah
		cmp	ax, 0
		jnz	short loc_7EAE
		mov	ax, 0
		jmp	short loc_7ECA

loc_7EAE:
		push	ax
		push	cs
		call	near ptr sub_8E35
		mov	ax, cs
		mov	ds, ax
		mov	dx, word_76771
		or	dx, dx
		jz	short loc_7EC9
		mov	ah, 45h
		int	67h
		mov	word_76771, 0

loc_7EC9:
		pop	ax

loc_7ECA:
		mov	bx, [bp+var_2]
		mov	ds, bx
		mov	bx, [bp+var_4]
		mov	es, bx
		mov	sp, bp
		pop	bp
		retf
sub_7E02		endp

; ----------------------------------------------------------------------

sub_7ED8		proc far
		push	ds
		mov	ax, 803h
		int	2Fh
		mov	cs:98h, di
		mov	cs:9Ah, ds
		pop	ds
		retf
sub_7ED8		endp

; ----------------------------------------------------------------------

sub_7EEA		proc far
		cmp	dword_7676B, 0
		jnz	short loc_7F0B
		mov	ax, 4300h
		int	2Fh
		cmp	al, 80h
		mov	ax, 0
		jnz	short loc_7F11
		mov	ax, 4310h
		int	2Fh
		mov	word ptr dword_7676B, bx
		mov	word_7676D, es

loc_7F0B:
		mov	ah, 3
		call	dword ptr dword_7676B

loc_7F11:
		retf
sub_7EEA		endp

; ----------------------------------------------------------------------

sub_7F12		proc far
		cli
		call	near ptr sub_7F29
		jnz	short loc_7F28
		mov	al, 0D1h
		out	64h, al
		call	near ptr sub_7F29
		jnz	short loc_7F28
		mov	al, ah
		out	60h, al
		call	near ptr sub_7F29

loc_7F28:
		retf
sub_7F12		endp

; ----------------------------------------------------------------------

sub_7F29		proc far
		push	cx
		sub	cx, cx

loc_7F2C:
		in	al, 64h
		and	al, 2
		loopne	short loc_7F2C
		pop	cx
		retf
sub_7F29		endp

; ----------------------------------------------------------------------

sub_7F34		proc far
		mov	dx, sp
		push	sp
		pop	cx
		cmp	dx, cx
		jz	short loc_7F41
		mov	ax, 3
		jmp	short loc_7F75

loc_7F41:
		mov	ax, 3506h
		int	21h
		mov	word_76761, bx
		mov	word_76763, es
		push	ds
		push	cs
		pop	ds
		mov	dx, 201h
		mov	ax, 2506h
		int	21h
		pop	ds
		inc	eax
		mov	ax, 0
		jmp	short loc_7F68
		pop	ax
		pop	ax
		pop	ax
		sti
		mov	ax, 4

loc_7F68:
		push	ax
		push	ds
		lds	dx, word_76761
		mov	ax, 2506h
		int	21h
		pop	ds
		pop	ax

loc_7F75:
		retf
sub_7F34		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7F76		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch

		enter	8, 0
		mov	ax, ss
		mov	bx, sp
		shr	bx, 4
		add	ax, bx
		add	ax, 100h
		mov	dx, ax
		mov	bx, cs
		mov	es, bx
		mov	bx, 170Fh
		push	ax
		push	bx
		push	dx
		push	cs
		call	near ptr sub_840F
		or	ax, ax
		pop	dx
		pop	bx
		pop	ax
		jz	short loc_7FA1
		add	bx, 753h

loc_7FA1:
		cmp	ax, 9600h
		ja	short loc_7FB2
		push	seg dseg
		pop	fs
		cmp	fs:11Ch, bx
		jbe	short loc_7FB8

loc_7FB2:
		mov	ax, 6
		jmp	loc_818F

loc_7FB8:
		cmp	dx, 2000h
		jnb	short loc_7FC1
		mov	dx, 2000h

loc_7FC1:
		mov	ax, dx
		mov	cs:365h, ax
		mov	bx, cs
		mov	es, bx
		mov	bx, 35h
		mov	es:[bx], dx
		mov	es:[bx+2], ax
		mov	ax, 3D00h
		push	ds
		lds	dx, [bp+arg_0]
		int	21h
		pop	ds
		jnb	short loc_7FE7
		mov	ax, 1
		jmp	loc_818F

loc_7FE7:
		mov	bx, ax
		mov	ax, 4200h
		xor	cx, cx
		mov	dx, 0Eh
		int	21h
		mov	ah, 3Fh
		mov	cx, 0Ah
		push	ds
		mov	di, 35h
		mov	ds, es:[di]
		xor	dx, dx
		int	21h
		mov	ah, 3Eh
		int	21h
		mov	ax, word ptr byte_76730
		add	ax, cs:365h
		mov	[bp+var_2], ax
		mov	ax, word_76732
		mov	[bp+var_4], ax
		mov	ax, word_76736
		mov	cs:363h, ax
		mov	ax, word_76738
		add	cs:365h, ax
		pop	ds
		mov	bx, 35h
		mov	ax, 4B03h
		push	ds
		lds	dx, [bp+arg_0]
		int	21h
		pop	ds
		jnb	short loc_803D
		mov	ax, 1
		jmp	loc_818F

loc_803D:
		mov	bx, 35h
		mov	ax, es:[bx]
		mov	bx, es:[bx+2]
		cmp	ax, bx
		jz	short loc_805C
		push	ds
		push	es
		mov	ds, ax
		mov	es, bx
		xor	si, si
		xor	di, di
		mov	cx, 8000h
		rep movsb
		pop	es
		pop	ds

loc_805C:
		push	bp
		mov	ax, cs
		mov	ds, ax
		mov	eax, dword_76773
		mov	bx, word_76769
		push	bx
		push	eax
		xor	ax, ax
		mov	al, cs:0A1h
		push	ax
		mov	al, cs:0A0h
		push	ax
		push	438h
		push	cs
		push	4Ch
		push	word_7676F
		push	large [bp+arg_6]
		push	[bp+arg_4]
		push	word ptr cs:48h
		push	cs
		push	367h
		mov	ax, seg dseg
		mov	fs, ax
		mov	ax, fs:11Ch
		mov	fs, ax
		mov	eax, fs:80h
		mov	[bp+var_8], eax
		mov	fs:80h, sp
		mov	fs:82h, ss
		mov	di, 35h
		mov	ax, es:[di]
		sub	ax, 10h
		mov	ds, ax
		mov	es, ax
		lss	sp, [bp+var_4]
		call	far ptr 0:12h
		add	sp, 1Ah
		pop	bp
		sti
		or	ax, ax
		jz	short loc_80D6
		mov	ax, 0Ah
		jmp	loc_818F

loc_80D6:
		mov	ax, seg dseg
		mov	fs, ax
		mov	ax, fs:11Ch
		mov	ds, ax
		mov	eax, [bp+var_8]
		mov	dword_767B0, eax
		mov	ax, cs
		mov	ds, ax
		cmp	word_7676F, 0
		jz	loc_8188
		xor	eax, eax
		mov	ax, cs
		shl	eax, 4
		lea	ebx, dword_76755
		add	ebx, eax
		mov	dword_77ABE, ebx
		lea	ebx, dword_7675B
		add	ebx, eax
		mov	dword_77AC2, ebx
		xor	eax, eax
		mov	ax, cs
		shl	eax, 4
		lea	ebx, dword_77ABA
		add	eax, ebx
		mov	bx, cs
		mov	es, bx
		mov	es:13A0h, eax
		push	ds
		push	offset unk_7E345
		pop	ds
		mov	word_7677A, es
		mov	word_76782, fs
		mov	word_76786, gs
		mov	word_76776, ss
		pop	ds
		push	7C15h
		pop	es
		mov	es:4Eh, ds
		pushf
		pop	word ptr es:3Eh
		mov	word ptr es:40h, 2
		mov	word ptr es:36h, 422h
		mov	es:3Ah, cs
		mov	es:42h, esp
		cli
		push	es
		pop	ss
		mov	sp, 36h
		sti
		pushal
		mov	esi, eax
		mov	ax, 0DE0Ch
		int	67h
		sti
		mov	ax, 0
		jmp	short loc_818F

loc_8188:
		push	cs
		call	near ptr sub_8D63
		mov	ax, 0

loc_818F:
		leave
		retf
sub_7F76		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8191		proc far

arg_0		= word ptr  6

		enter	2, 0
		mov	ax, 4300h
		int	2Fh
		cmp	al, 80h
		jnz	short loc_81C2
		mov	ax, 4310h
		int	2Fh
		mov	word ptr dword_7676B, bx
		mov	word_7676D, es
		mov	ah, 8
		call	dword ptr dword_7676B
		cmp	ax, [bp+arg_0]
		jle	short loc_81B9
		mov	ax, [bp+arg_0]

loc_81B9:
		mov	word_76769, ax
		push	cs
		call	near ptr sub_8DCE
		leave
		retf

loc_81C2:
		mov	ax, 2
		leave
		retf
sub_8191		endp

; START OF FUNCTION CHUNK FOR sub_8191
		inc	bp
		dec	bp
		dec	bp
		pop	ax
		pop	ax
		pop	ax
		pop	ax
		db 30h
; END OF FUNCTION CHUNK FOR sub_8191

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_81CF		proc far

var_2		= word ptr -2

		enter	2, 0
		push	es
		push	ds
		mov	ax, 3567h
		int	21h
		mov	di, 0Ah
		mov	dx, cs
		mov	ds, dx
		mov	si, 467h
		mov	cx, 8
		cld
		repe cmpsb
		jnz	loc_838D
		mov	ax, 0DE00h
		int	67h
		or	ah, ah
		jnz	loc_839D
		mov	ax, 0DE0Ah
		int	67h
		cmp	bx, 8
		jnz	loc_83AB
		cmp	cx, 70h
		jnz	loc_83AB
		mov	ax, cs
		mov	ds, ax
		mov	word_7676F, 1
		mov	bx, 6
		mov	ah, 42h
		int	67h
		cmp	bx, 0B5h
		jb	loc_83A4
		mov	bx, 6
		mov	ah, 43h
		int	67h
		or	ah, ah
		jnz	loc_83A4
		mov	word_76771, dx
		mov	word_76769, 50h
		mov	ah, 47h
		int	67h
		mov	ax, 4400h
		xor	bx, bx
		mov	dx, word_76771
		int	67h
		mov	ah, 41h
		int	67h
		mov	cs:48h, bx
		mov	es, bx
		shr	bx, 8
		mov	cx, bx
		mov	ax, 0DE06h
		int	67h
		mov	dword_77ABA, edx
		or	dl, 7
		mov	es:1000h, edx
		add	cx, 3
		mov	ax, 0DE06h
		int	67h
		mov	cs:78h, edx
		or	dl, 7
		mov	es:0, edx
		mov	es:100Ch, edx
		mov	dword ptr cs:74h, 403000h
		mov	di, 3000h
		mov	ax, 0DE06h
		sub	cx, 2
		int	67h
		or	dl, 7
		mov	es:4, edx
		mov	es:1004h, edx
		mov	ax, 0DE06h
		inc	cx
		int	67h
		mov	cs:70h, edx
		or	dl, 7
		mov	es:8, edx
		mov	es:1008h, edx
		mov	ax, 0DE01h
		mov	bx, cs
		mov	ds, bx
		mov	si, 80h
		int	67h
		mov	ax, cs
		mov	ds, ax
		mov	ax, cs:48h
		mov	es, ax
		mov	cs:7Ch, ebx
		mov	dword_76773, 404000h
		mov	di, 1010h
		mov	[bp+var_2], 4
		mov	ah, 41h
		int	67h
		shr	bx, 8
		add	bx, 4
		mov	si, bx

loc_8303:
		mov	ax, 4401h
		mov	bx, [bp+var_2]
		shr	bx, 2
		mov	dx, word_76771
		int	67h
		mov	cx, si

loc_8314:
		mov	ax, 0DE06h
		int	67h
		or	dl, 7
		mov	es:[di], edx
		add	di, 4
		inc	cx
		inc	[bp+var_2]
		cmp	[bp+var_2], 18h
		jnb	short loc_8336
		test	[bp+var_2], 3
		jz	short loc_8303
		jmp	short loc_8314

loc_8336:
		mov	si, 3000h
		mov	ax, es
		mov	ds, ax
		mov	di, 2000h
		mov	cx, 400h
		rep movsd
		mov	di, 22C0h
		mov	cx, 8
		mov	eax, 0B8007h
		rep stosd
		mov	di, 2300h
		mov	cx, 40h
		mov	eax, 0B8007h
		rep stosd
		mov	di, 2400h
		mov	cx, 10h
		mov	eax, 0A0007h

loc_8370:
		stosd
		add	eax, 1000h
		loop	short loc_8370
		mov	ah, 48h
		mov	dx, cs
		mov	ds, dx
		mov	dx, word_76771
		int	67h
		mov	ax, 0FFFFh
		pop	ds
		pop	es
		leave
		retf

loc_838D:
		smsw	ax
		test	al, 1
		mov	ax, 0Bh
		jnz	short loc_8399
		xor	ax, ax

loc_8399:
		pop	ds
		pop	es
		leave
		retf

loc_839D:
		mov	ax, 9
		pop	ds
		pop	es
		leave
		retf

loc_83A4:
		mov	ax, 7
		pop	ds
		pop	es
		leave
		retf

loc_83AB:
		mov	ax, 8
		pop	ds
		pop	es
		leave
		retf
sub_81CF		endp

; ----------------------------------------------------------------------

sub_83B2		proc far
		push	es
		push	ds
		mov	ax, 7A00h
		int	2Fh
		cmp	al, 0FFh
		jz	short loc_83C9
		xor	ah, ah
		int	2Ah
		or	ah, ah
		jnz	short loc_83C9
		xor	ax, ax
		jmp	short loc_83CC

loc_83C9:
		mov	ax, 0Dh

loc_83CC:
		pop	ds
		pop	es
		retf
sub_83B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_83CF		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		enter	4, 0
		mov	ax, 3001h
		int	21h
		xor	cx, cx
		cmp	al, 2
		jb	short loc_840B
		mov	ah, 52h
		int	21h
		add	bx, 4
		mov	[bp+var_2], es
		mov	[bp+var_4], bx
		jmp	short loc_83F4

loc_83ED:
		les	bx, [bp+var_4]
		add	cx, es:[bx+4]

loc_83F4:
		les	bx, [bp+var_4]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		cmp	[bp+var_4], 0FFFFh
		jnz	short loc_83ED

loc_840B:
		mov	ax, cx
		leave
		retf
sub_83CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_840F		proc far

var_4		= byte ptr -4
var_2		= byte ptr -2
saved_0		= byte ptr  0
arg_1A		= word ptr  20h
arg_3D		= byte ptr  43h
arg_49		= byte ptr  4Fh
arg_5B		= byte ptr  61h
arg_5E		= dword ptr  64h
arg_62		= byte ptr  68h
arg_63		= dword ptr  69h
arg_69		= byte ptr  6Fh
arg_6D		= word ptr  73h
arg_6E		= word ptr  74h
arg_73		= byte ptr  79h

		enter	4, 0
		mov	ax, 4300h
		int	2Fh
		cmp	al, 80h
		jnz	short loc_843D
		mov	ax, 4310h
		int	2Fh
		mov	word ptr dword_7676B, bx
		mov	word_7676D, es
		mov	ah, 10h
		mov	dx, 0FFFFh
		call	dword ptr dword_7676B
		cmp	dx, 753h
		jb	short loc_843D
		mov	ax, 1
		jmp	short loc_848B

loc_843D:
		mov	ax, 5800h
		int	21h
		mov	[bp+var_2], al
		mov	ax, 5802h
		int	21h
		jb	short loc_8489
		mov	[bp+var_4], al
		mov	ax, 5803h
		mov	bx, 1
		int	21h
		jb	short loc_8489
		mov	ax, 5801h
		mov	bx, 41h
		int	21h
		mov	ah, 48h
		mov	bx, 0FFFFh
		int	21h
		push	bx
		mov	ax, 5801h
		mov	bl, [bp+var_2]
		mov	bh, 0
		int	21h
		mov	ax, 5803h
		mov	bl, [bp+var_4]
		mov	bh, 0
		int	21h
		pop	bx
		cmp	bx, 753h
		jb	short loc_8489
		mov	ax, 1
		jmp	short loc_848B

loc_8489:
		xor	ax, ax

loc_848B:
		leave
		retf
sub_840F		endp

; START OF FUNCTION CHUNK FOR sub_840F
		dec	bp
		pop	es
		add	[bx+si], al
		mov	cl, 7
		rol	word ptr [bx], 1
		cmp	cx, [bx+si]
		mov	[bx+si], cx
		fmul	dword ptr [bx+si]
		add	cl, [bx+di]
		insb
		or	si, dx
		or	[bx], cx
		or	dh, [bp+di+saved_0]
		or	ah, [bx+di+0Ah]
		sbb	[bp+di+saved_0], cl
		or	[bp+di+saved_0], 0C3h
		or	ax, [di+4Dh]
		push	bx
		and	[si+72h], ah
		imul	si, word ptr [bp+arg_5E+1], 2072h
		popaw
		insb
		jb	short loc_8521
		popaw
		jns	loc_84E0
		imul	bp, [bp+arg_6D], 6174h
		insb
		insb
		or	cl, cs:[di]
		push	dx
		insw
		outsw
		jbe	short loc_8537
		and	[di+78h], al
		jo	short loc_8538
		outsb
		and	fs:[di+65h], ch
		insw
		outsw

loc_84E0:
		jb	short loc_855B
		and	[si+72h], ah
		imul	si, word ptr [bp+arg_5E+1], 2072h
		jb	loc_855C
		insw
		and	[si+68h], dh
		and	gs:[bp+di+4Fh], al
		dec	si
		inc	si
		dec	cx
		inc	di
		push	bx
		pop	cx
		push	bx
		and	byte ptr [bp+arg_63], ah
		insb
		and	gs:[bx+di+6Eh], ah
		and	fs:[bp+si+65h], dh
		bound	bp, [bx+6Fh]
		jz	short loc_853C
		or	cl, [di]
		and	al, 43h
		popaw
		outsb
		daa
		jz	short loc_8537
		imul	ebp, [bp+arg_5E], 4D454A20h
		dec	bp
		and	[bx+76h], ch
		jb	loc_8592
		popaw
		jns	short loc_8549
		imul	ebp, [si+65h], 240D0A2Eh
		dec	cx
		outsb
		jnb	short loc_85AA
		imul	esp, [bp+di+arg_63], 20746E65h
		pop	ax
		dec	bp
		push	bx
		and	[di+65h], ch
		insw
		outsw
		jb	short loc_85C1
		and	[bx+di+76h], ah
		popaw
		imul	bp, [si+61h], 6C62h
		or	cl, cs:[di]
		inc	bx
		outsw
		outsb
		jnb	short loc_85CF
		insb

loc_855B:
		jz	short loc_857D
		jz	short loc_85C7
		and	gs:[bx+di+6Eh], ch
		jnb	short loc_85D9
		popaw
		insb
		insb
		popaw
		jz	short loc_85D4
		outsw
		outsb
		and	[di+61h], ch
		outsb
		jnz	short loc_85D4
		insb
		and	[bp+arg_69], ah
		jb	short loc_8599
		push	6C65h
		jo	short loc_859E
		jb	short loc_85E5
		arpl	[bx+6Eh], bp
		imul	esp, [bx+75h], 676E6972h
		and	[bx+di+6Fh], bh
		jnz	short loc_8602
		and	[bp+di+arg_73], dh
		jnb	short loc_8609
		insw
		or	cl, cs:[di]
		and	al, 38h
		xor	[bx+si], bh

loc_859E:
		and	ss:[bx+si+72h], dh
		outsw
		arpl	[di+73h], sp
		jnb	short loc_8617
		jb	short loc_85CA

loc_85AA:
		jz	loc_8613
		arpl	[si+65h], si
		or	cl, cs:[di]
		push	ax
		insb
		popaw
		jnb	short loc_8620
		and	[bx+di+6Eh], ch
		jnb	short loc_8634
		popaw

loc_85C1:
		insb
		insb
		and	[bx+di+74h], ah
		and	[si+65h], ch
		popaw

loc_85CA:
		jnb	short loc_8640
		and	[bx+di+20h], ah

loc_85CF:
		cmp	[bx+si], dh
		xor	di, [bx+si]
		and	ss:[bp+di+68h], ah
		imul	si, [bx+si+20h], 6F74h
		and	[bp+di+arg_69], ah
		outsb
		jz	short loc_864B
		outsb
		jnz	short loc_864A

loc_85E5:
		or	cl, cs:[di]
		and	al, 38h
		xor	[bp+si+saved_0], dh
		cmp	byte_7D750, dh
		jb	short loc_8661
		arpl	[di+73h], sp
		jnb	short loc_8666
		jb	short loc_8619
		jz	loc_8662
		arpl	[si+65h], si
		or	cl, cs:[di]
		push	ax
		insb
		popaw
		jnb	short loc_866F
		and	[bx+di+6Eh], ch
		jnb	short loc_8683
		popaw
		insb
		insb
		and	[bx+di+74h], ah
		and	[si+65h], ch
		popaw

loc_8619:
		jnb	short loc_868F
		and	[bx+di+20h], ah
		cmp	[bx+si], dh

loc_8620:
		xor	di, [bx+si]
		and	ss:[bp+di+68h], ah
		imul	si, [bx+si+20h], 6F74h
		and	[bp+di+arg_69], ah
		outsb
		jz	short loc_869A
		outsb
		jnz	short loc_8699

loc_8634:
		or	cl, cs:[di]
		and	al, 55h
		outsb
		popaw
		bound	bp, [si+65h]
		and	[si+6Fh], dh
		and	[di+6Eh], ah
		popaw
		bound	bp, [si+65h]
		and	[si+68h], dh

loc_864B:
		and	gs:[bp+si], dh
		xor	[bp+di+arg_6E], si
		and	[bx+di+64h], ah
		jb	loc_86BC
		jnb	short loc_86CC
		and	[si+69h], ch
		outsb
		or	cl, cs:[di]

loc_8661:
		and	al, 49h
		outsb
		jnb	short loc_86DB

loc_8666:
		imul	esp, [bp+di+arg_63], 20746E65h

loc_866F:
		inc	sp
		dec	di
		push	bx
		and	[di+65h], ch
		insw
		outsw
		jb	short loc_86F2
		and	[bx+di+76h], ah
		popaw
		imul	bp, [si+61h], 6C62h
		or	cl, cs:[di]
		inc	bx
		outsw
		outsb
		jnb	short loc_8700
		insb
		jz	short loc_86AE
		jz	short loc_86F8
		and	gs:[bx+di+6Eh], ch
		jnb	short loc_870A
		popaw
		insb
		insb

loc_8699:
		popaw

loc_869A:
		jz	short loc_8705
		outsw
		outsb
		and	[di+61h], ch
		outsb
		jnz	short loc_8705
		insb
		and	[bp+arg_69], ah
		jb	short loc_86CA
		push	6C65h
		jo	short loc_86CF
		jb	short loc_8716
		arpl	[bx+6Eh], bp
		imul	esp, [bx+75h], 676E6972h

loc_86BC:
		and	[bx+di+6Fh], bh
		jnz	short loc_8733
		and	[bp+di+arg_73], dh
		jnb	short loc_873A
		insw
		or	cl, cs:[di]
		and	al, 49h
		outsb
		jnb	short loc_8745
		imul	esp, [bp+di+arg_63], 20746E65h
		inc	bp
		dec	bp

loc_86DB:
		push	bx
		and	[di+65h], ch
		insw
		outsw
		jb	short loc_875C
		and	[bx+di+76h], ah
		popaw
		imul	bp, [si+61h], 6C62h
		or	cl, cs:[di]
		inc	bx
		outsw

loc_86F2:
		outsb
		jnb	short loc_876A
		insb
		jz	short loc_8718

loc_86F8:
		jz	short loc_8762
		and	gs:[bx+di+6Eh], ch
		jnb	short loc_8774

loc_8700:
		popaw
		insb
		insb
		popaw
		jz	short loc_876F
		outsw
		outsb
		and	[di+61h], ch
		outsb
		jnz	short loc_876F
		insb
		and	[bp+arg_69], ah
		jb	short loc_8734
		push	6C65h
		jo	short loc_8739
		jb	short loc_8780
		arpl	[bx+6Eh], bp
		imul	esp, [bx+75h], 676E6972h
		and	[bx+di+6Fh], bh
		jnz	short loc_879D
		and	[bp+di+arg_73], dh
		jnb	short loc_87A4
		insw
		or	cl, cs:[di]
		and	al, 56h

loc_8737:
		inc	bx
		push	ax

loc_8739:
		dec	cx

loc_873A:
		and	byte ptr [bp+di+arg_5E+1], dh
		jb	short loc_87B5
		jb	loc_8762
		push	7361h

loc_8745:
		and	byte ptr [bp+si+arg_5E+1], dh
		jo	short loc_87BC
		outsw
		jb	loc_87AF
		insw
		insw
		and	fs:[si+68h], dh
		and	gs:[bx+di+6Eh], ch
		jz	short loc_87C0
		jb	short loc_87CF
		jnz	short loc_87CF
		jz	short loc_8781
		arpl	[bx+6Eh], bp
		jz	short loc_87D8
		outsw
		insb
		insb
		jb	loc_879A
		or	cl, [di]
		and	al, 45h
		dec	bp
		push	bx
		and	[si+72h], ah
		imul	si, word ptr [bp+arg_5E+1], 2072h
		imul	si, [bp+di+arg_1A], 6F6Eh
		jz	short loc_87A1

loc_8781:
		push	si
		inc	bx
		push	ax
		dec	cx
		and	[bp+di+arg_69], ah
		insw
		jo	short loc_87F7
		imul	sp, [bx+di+6Eh], 2E74h
		or	cl, [di]
		and	al, 4Ah
		inc	bp
		dec	bp
		dec	bp
		and	byte ptr [bp+arg_5E+1], dh

loc_879A:
		jb	short loc_880F
		imul	bp, [bx+6Eh], 6920h

loc_87A1:
		jnb	short loc_87C3
		outsb

loc_87A4:
		outsw
		jz	short loc_87C7

loc_87A7:
		arpl	[bx+6Dh], bp
		jo	short loc_880D
		jz	short loc_8817
		bound	bp, [si+65h]
		and	[bx+69h], dh
		jz	short loc_881E
		and	[si+6Fh], ch
		popaw
		jb	loc_87EC
		or	cl, [di]

loc_87C0:
		and	al, 50h
		jb	short loc_8833
		jz	short loc_882B
		arpl	[si+65h], si
		and	fs:[di+6Fh], ch
		and	gs:[si+72h], ah
		imul	si, word ptr [bp+arg_5E+1], 2072h
		imul	si, [bp+di+arg_1A], 6F6Eh
		jz	short loc_87FE
		jb	short loc_8845
		jnb	short loc_8852
		outsw
		outsb
		imul	bp, fs:[bp+67h], 7420h
		outsw
		and	[di+4Dh], al
		push	bx
		and	byte ptr [bp+arg_6E+1], ah
		outsb
		arpl	[si+69h], si
		outsw

loc_87F7:
		outsb
		and	[bp+di+arg_5B], ah
		insb
		insb
		jnb	short loc_882D
		or	cl, [di]
		dec	bp
		popaw
		imul	sp, [di+20h], 73h
		jnz	short loc_887B
		and	gs:[bx+di+6Fh], bh

loc_880D:
		jnz	short loc_8881

loc_880F:
		and	[di+4Dh], al
		push	bx
		and	[si+72h], ah
		imul	si, word ptr [bp+arg_5E+1], 2072h
		imul	si, [bp+di+arg_1A], 6F6Eh
		jz	short loc_8842
		arpl	[bx+6Eh], bp
		imul	esp, [bx+75h], 20646572h

loc_882D:
		ja	short loc_8898
		jz	short loc_8899
		and	[si+68h], dh
		and	gs:[bp+4Fh], cl
		inc	bp
		dec	bp

loc_883A:
		push	bx

loc_883B:
		and	[bx+70h], ch
		jz	short loc_88A9
		outsw
		outsb

loc_8842:
		or	cl, cs:[di]

loc_8845:
		dec	cx
		and	[bx+di+74h], ch
		and	[bx+di+73h], ch
		sub	al, 20h
		jb	short loc_88B6
		jo	short loc_88BF
		popaw
		arpl	[di+20h], sp
		jz	short loc_88C1
		and	gs:[bx+70h], ch
		jz	short loc_88C8
		outsw
		outsb
		and	[bp+si+saved_0], ah
		dec	si
		dec	di
		inc	bp
		dec	bp
		push	bx
		and	ah, [bx+si]
		ja	short loc_88D5
		jz	short loc_88D6
		and	[bp+si+saved_0], ah
		push	dx
		inc	cx
		dec	bp
		and	ch, byte_7743A
		and	al, 58h
		dec	bp
		push	bx

loc_887B:
		and	[si+6Fh], ch

loc_887E:
		popaw
		and	fs:[bx+di+64h], ah
		jb	loc_88EB
		jnb	short loc_88FB
		and	[bx+6Fh], dh
		jnz	short loc_88F9
		and	fs:[di+78h], ah
		arpl	[di+65h], sp
		and	fs:[bp+si], dh
		xor	al, 20h

loc_8899:
		bound	bp, [bx+di+74h]
		jnb	short loc_88CC
		or	cl, [di]
		push	dx
		jnz	loc_8908
		and	gs:[bx+si+4Dh], bl

loc_88A9:
		push	bx
		and	[di+65h], ch
		insw
		outsw
		jb	short loc_892A
		and	[di+73h], dh
		popaw
		and	gs:[edi+72h], ch
		and	[bx+di+6Eh], ch
		jnb	short loc_8933

loc_88BF:
		popaw
		insb

loc_88C1:
		insb
		and	[bx+di+6Eh], ah
		and	[di+78h], al

loc_88C8:
		jo	short loc_892B
		outsb
		and	fs:[di+65h], cl
		insw
		outsw
		jb	short loc_894E

loc_88D5:
		and	[si+72h], ah
		imul	si, word ptr [bp+arg_5E+1], 2E72h
		or	cl, [di]
		and	al, 4Eh
		jz	loc_895B
		outsw
		jb	short loc_8952
		and	[si+72h], ah
		imul	si, word ptr [bp+arg_5E+1], 2072h
		jz	loc_8958
		arpl	[si+65h], si
		and	cs:[bp+di+61h], al

loc_88FB:
		outsb
		outsb
		outsw
		jz	short loc_8920
		jnb	short loc_8979
		imul	si, [si+63h], 2068h
		jz	short loc_8978
		and	[bx+si+72h], dh
		outsw
		jz	short loc_8974

loc_890F:
		arpl	[si+65h], si
		and	fs:[di+6Fh], ch
		and	gs:[bp+di+61h], dh
		insb
		jns	short loc_894E

loc_8920:
		or	cl, [di]
		and	al, 4Eh
		outsw
		jz	short loc_8947
		outsb
		outsw

loc_892A:
		jnz	short loc_8993
		push	4620h
		dec	cx
		dec	sp
		inc	bp
		push	bx

loc_8933:
		and	[bx+di+76h], ah
		popaw
		imul	bp, [si+61h], 6C62h
		or	cl, cs:[di]

loc_8940:
		dec	bp
		popaw

loc_8942:
		imul	sp, [di+20h], 73h
		jnz	short loc_89BA
		and	gs:[si+68h], dh
		popaw
		jz	short loc_896F
		jz	short loc_89B9
		and	gs:[bp+6Fh], ah
		insb
		insb
		outsw

loc_8958:
		ja	short loc_89C3
		outsb

loc_895B:
		and	[ecx+ebp+6Eh], ch
		and	gs:[bx+di+70h], ah
		jo	short loc_89CB
		popaw
		jb	short sub_89DC
		and	[bx+di+6Eh], ch
		and	[bx+di+6Fh], bh

loc_896F:
		jnz	short loc_89E3
		and	[bp+di+arg_49], al

loc_8974:
		dec	si
		inc	si
		dec	cx

loc_8977:
		inc	di

loc_8978:
		push	bx
		pop	cx
		push	bx

loc_897C:
		and	byte ptr [bp+arg_63], ah
		insb
		cmp	cl, gs:[bp+si]
		or	ax, 4946h
		dec	sp
		inc	bp
		push	bx
		cmp	ax, 3532h
		or	cl, [di]
		and	al, 10h
		daa
		push	di
		inc	cx

loc_8993:
		push	dx
		dec	si
		dec	cx
		dec	si
		inc	di
		cmp	ah, [bx+si]
		dec	dx
		inc	bp
		dec	bp
		dec	bp
		and	byte ptr [bp+arg_5E+1], dh
		jb	short loc_8A16
		imul	bp, [bx+6Eh], 2020h
		cmp	word_7A069, bp
		and	[si+6Fh], ah
		jnb	loc_89D2
		outsb
		outsw
		jz	short loc_89D6
		insw
		popaw
		jz	short loc_8A1D

loc_89BA:
		push	7620h
		jb	loc_8A33
		imul	bp, [bx+6Eh], 6F20h
		and	[si+6Fh], ch
		popaw
		jb	loc_89FC
		or	cl, [di]
		and	al, 0

loc_89D2:
		add	[bx+si], al
		add	[bx+si], al

loc_89D6:
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
; END OF FUNCTION CHUNK FOR sub_840F

; ----------------------------------------------------------------------

sub_89DC		proc near
		sti
		mov	ax, 1209h
		mov	bx, 736Dh

loc_89E3:
		int	15h
		mov	ax, seg seg014
		mov	ds, ax
		cmp	byte_7674F, 0
		jz	short loc_89FF
		mov	byte_7674F, 0
		lds	dx, word_7674B
		mov	ax, 2567h
		int	21h

loc_89FF:
		mov	ax, seg seg014
		mov	ds, ax
		cmp	dword_76747, 0
		jz	short loc_8A15
		lds	dx, word ptr dword_76747
		mov	ax, 2540h
		int	21h

loc_8A15:
		mov	ax, seg seg014
		mov	ds, ax
		cmp	dword_76743, 0
		jz	short loc_8A2B
		lds	dx, word ptr dword_76743
		mov	ax, 2519h
		int	21h

loc_8A2B:
		mov	ax, cs
		mov	ds, ax
		push	cs
		call	near ptr sub_8E54

loc_8A33:
		push	cs
		call	near ptr sub_8E35
		mov	ax, 1209h
		mov	bx, 554Eh
		int	15h
		jmp	sub_8A45
sub_89DC		endp

; START OF FUNCTION CHUNK FOR sub_89DC
		nop
; END OF FUNCTION CHUNK FOR sub_89DC

; ----------------------------------------------------------------------

sub_8A45		proc far
		xor	ax, ax
		retf
sub_8A45		endp

; START OF FUNCTION CHUNK FOR sub_8A45
		pushf
		cmp	ax, 1209h
		jz	short loc_8A54
		popf
		jmp	dword ptr cs:0C78h

loc_8A54:
		popf
		cmp	bx, 534Dh
		jnz	short loc_8A62
		push	cs
		call	loc_8AB7
		xor	bx, bx
		iret

loc_8A62:
		cmp	bx, 736Dh
		jnz	short loc_8A6B
		xor	bx, bx
		iret

loc_8A6B:
		cmp	bx, 434Ch
		jnz	short loc_8A74
		xor	ax, ax
		iret

loc_8A74:
		cmp	bx, 4753h
		jnz	short loc_8A7D
		xor	ax, ax
		iret

loc_8A7D:
		cmp	bx, 4143h
		jz	short loc_8A9B
		cmp	bx, 5645h
		jz	short loc_8A9B
		cmp	bx, 4746h
		jz	short loc_8A9B
		cmp	bx, 4646h
		jz	short loc_8A9B
		cmp	bx, 5346h
		jnz	short loc_8AB2

loc_8A9B:
		push	eax
		push	cs
		call	loc_8AB7
		pop	eax
		int	15h
		push	ax
		push	bx
		mov	ax, 1209h
		mov	bx, 736Dh
		int	15h
		pop	bx
		pop	ax
		iret

loc_8AB2:
		jmp	dword ptr cs:0C78h
		push	ds
		push	offset unk_7E345
		pop	ds
		mov	word_7677A, es
		mov	word_76782, fs
		mov	word_76786, gs
		mov	word_76776, ss
		pop	ds
		push	7C15h
		pop	es
		mov	es:4Eh, ds
		pushf
		pop	word ptr es:3Eh
		mov	word ptr es:40h, 2
		mov	word ptr es:36h, 0DA8h
		mov	es:3Ah, cs
		mov	es:42h, esp
		cli
		push	es
		pop	ss
		mov	sp, 36h
		pushal
		mov	esi, cs:13A0h
		mov	ax, 0DE0Ch
		int	67h
		retf
; END OF FUNCTION CHUNK FOR sub_8A45

; ----------------------------------------------------------------------

sub_8B09		proc far
		mov	ax, 1209h
		mov	bx, 736Dh
		int	15h
		cmp	dword ptr cs:0C78h, 0
		jz	short loc_8B24
		mov	ax, 2515h
		lds	dx, cs:0C78h
		int	21h

loc_8B24:
		mov	ax, cs
		mov	ds, ax
		mov	dx, word_76771
		or	dx, dx
		jz	short loc_8B3A
		mov	ah, 45h
		int	67h
		mov	word_76771, 0

loc_8B3A:
		xor	ax, ax
		retf
sub_8B09		endp

; ----------------------------------------------------------------------

sub_8B3D		proc far
		push	ds
		push	es
		mov	ax, 3515h
		int	21h
		mov	cs:0C78h, bx
		mov	cs:0C7Ah, es
		mov	ax, 2515h
		push	cs
		pop	ds
		mov	dx, 0CE8h
		int	21h
		pop	es
		pop	ds
		retf
sub_8B3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8B5B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, cs
		mov	ds, ax
		mov	bx, 72Fh
		mov	di, [bp+arg_0]
		shl	di, 1
		mov	dx, [bx+di]
		mov	ah, 9
		int	21h
		pop	bp
		retf
sub_8B5B		endp

; ----------------------------------------------------------------------

sub_8B72		proc far
		push	ds
		mov	ax, cs
		mov	ds, ax
		cmp	word_7676F, 0
		jnz	short loc_8BF3
		mov	bx, seg dseg
		mov	fs, bx
		mov	bx, fs:11Ch
		cmp	byte ptr cs:0A0h, 0
		jnz	short loc_8BD1
		mov	ax, 0B000h
		mov	ds, ax
		mov	word_76731, 0
		mov	word_76733, 7FEh
		mov	ax, cs
		mov	es, ax
		mov	ax, es:0F63h
		or	ax, ax
		jnz	short loc_8BB4
		mov	byte_76730, 5Ah
		jmp	short loc_8BF3

loc_8BB4:
		mov	byte_76730, 4Dh
		mov	ax, 0B7FFh
		mov	ds, ax
		mov	byte_76730, 4Dh
		mov	word_76731, bx
		mov	ax, es:0F63h
		sub	ax, 0B800h
		mov	word_76733, ax

loc_8BD1:
		mov	ax, cs
		mov	es, ax
		mov	ax, es:0F63h
		or	ax, ax
		jz	short loc_8BF3
		mov	ds, ax
		mov	byte_76730, 5Ah
		mov	word_76731, 0
		mov	bx, 0EFFEh
		sub	bx, ax
		mov	word_76733, bx

loc_8BF3:
		pop	ds
		retf
sub_8B72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8BF5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		push	ds
		mov	di, [bp+arg_0]
		mov	bx, [bp+arg_2]
		shr	bx, 8
		test	bl, 0F0h
		jz	short loc_8C12
		mov	cx, bx
		shr	cl, 4
		add	cl, 30h
		mov	[di], cl

loc_8C12:
		add	bl, 30h
		mov	[di+1], bl
		mov	cx, ax
		shr	cl, 4
		add	cl, 30h
		mov	[di+3], cl
		and	al, 0Fh
		add	al, 30h
		mov	[di+4], al
		pop	ds
		leave
		retf
sub_8BF5		endp

; ----------------------------------------------------------------------

sub_8C2D		proc far
		push	ds
		push	si
		push	di
		mov	ax, cs
		mov	ds, ax
		mov	ax, 0E000h
		mov	es, ax
		cmp	byte ptr es:0, 55h
		jnz	short loc_8C4E
		mov	word_77693, 0
		mov	word ptr cs:48h, 0D000h

loc_8C4E:
		mov	ax, seg seg014
		push	ax
		mov	ax, 60h
		push	ax
		push	word_77693
		push	word_7735F
		mov	ax, cs
		push	ax
		mov	ax, 0Ch
		push	ax
		push	cs
		call	near ptr sub_7E02
		add	sp, 0Ch
		cmp	ax, 0
		jz	short loc_8CA0
		cmp	ax, 3
		jz	short loc_8C92
		cmp	ax, 4
		jz	short loc_8C92
		cmp	ax, 6
		jz	short loc_8C92
		cmp	ax, 0Eh
		jz	short loc_8C92
		mov	bx, cs
		mov	ds, bx
		mov	byte_773A7, 1
		mov	bx, cs
		mov	es, bx

loc_8C92:
		push	ax
		push	ax
		push	cs
		call	near ptr sub_8B5B
		add	sp, 2
		pop	ax
		mov	ah, 4Ch
		int	21h

loc_8CA0:
		push	ds
		mov	ax, cs
		mov	ds, ax
		cmp	word_7676F, 0
		pop	ds
		jz	short loc_8CB3
		push	cs
		call	near ptr sub_8B3D
		jmp	short loc_8CBC

loc_8CB3:
		call	sub_932E
		push	cs
		call	near ptr sub_8B72

loc_8CBC:
		xor	eax, eax
		pop	di
		pop	si
		pop	ds
		retf
sub_8C2D		endp

; START OF FUNCTION CHUNK FOR sub_8C2D
		add	[bx+si], al
; END OF FUNCTION CHUNK FOR sub_8C2D

; ----------------------------------------------------------------------

sub_8CC5		proc far
		push	ds
		push	cs
		pop	ds
		cmp	word_7676F, 0
		jnz	short loc_8CD5
		push	cs
		call	sub_89DC
		jmp	short loc_8CD9

loc_8CD5:
		push	cs
		call	near ptr sub_8B09

loc_8CD9:
		pop	ds
		retf
sub_8CC5		endp

; START OF FUNCTION CHUNK FOR sub_8CC5
		test	al, 61h
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		inc	cx
		insb
		insb
		outsw
		arpl	[di+78h], ax
		jz	short loc_8D2C
		inc	bp
		jb	short loc_8D67
		outsw
		jb	short loc_8D32
		and	[bp+di+6Fh], al
		outsb
		jz	short loc_8D70
		outsw
		insb
		and	[bx+si+6Fh], dl
		imul	bp, [bp+74h], 7265h
		and	[bp+6Fh], ch
		jz	short loc_8D2D
		imul	bp, [bp+69h], 6974h
		popaw
		insb
		imul	di, [bp+si+65h], 2E64h
		or	cl, [di]
		and	al, 4Ah
		insw
		insw
		cmp	ah, [bx+si]
		dec	ax
		dec	cx
		dec	bp
		inc	bp
		dec	bp
		and	[bp+si+65h], dh
		jo	short loc_8D9B

loc_8D2C:
		jb	short loc_8DA2
		jnb	short loc_8D50
		jz	short loc_8D9A

loc_8D32:
		popaw
		jz	short loc_8D55
		jz	short loc_8D9F
		jb	loc_8D9F
		and	[bx+di+73h], ch
		outsb
		daa
		jz	short loc_8D61
		jz	short loc_8DAB
		popaw
		jz	short loc_8D66
		insw
		jnz	short loc_8DAC
		push	6D20h
		insw
		outsw
		jb	short loc_8DCA
		and	[bx+di+76h], ah
		popaw

loc_8D55:
		imul	bp, [si+61h], 6C62h
		or	cl, cs:[di]
		and	al, 0
		add	[bx+si], al
		db 0
; END OF FUNCTION CHUNK FOR sub_8CC5

; ----------------------------------------------------------------------

sub_8D63		proc far
		mov	ax, cs
		mov	ds, ax

loc_8D67:
		mov	ax, 4300h
		int	2Fh
		cmp	al, 80h
		jz	short loc_8D71

loc_8D70:
		retf

loc_8D71:
		mov	ax, 4310h
		int	2Fh
		mov	word ptr dword_7676B, bx
		mov	word_7676D, es
		cmp	byte ptr es:[bx], 0EBh
		jz	short loc_8D90
		mov	eax, es:[bx+1]
		mov	cs:0FFFh, eax
		jmp	short loc_8DA4

loc_8D90:
		xor	ax, ax
		mov	al, es:[bx+1]
		add	ax, 2
		add	ax, bx

loc_8D9B:
		mov	cs:0FFFh, ax

loc_8D9F:
		mov	cs:1001h, es

loc_8DA4:
		mov	eax, es:[bx]
		mov	dword_776B3, eax

loc_8DAC:
		mov	al, es:[bx+4]
		mov	byte_776B7, al
		mov	word ptr dword_776AF, bx
		mov	word ptr byte_776B1, es
		mov	byte ptr es:[bx], 0EAh
		mov	word ptr es:[bx+1], 111Eh
		mov	es:[bx+3], cs
		mov	ax, ds
		mov	es, ax
		retf
sub_8D63		endp

; ----------------------------------------------------------------------

sub_8DCE		proc far
		cmp	dword_7676B, 0
		jnz	short loc_8DE2
		mov	ah, 9
		mov	dx, 0F89h
		int	21h
		mov	ax, 4C01h
		int	21h

loc_8DE2:
		mov	ah, 9
		mov	dx, word_76769
		call	dword ptr dword_7676B
		cmp	ax, 1
		jz	short loc_8DFD
		mov	ah, 9
		mov	dx, 0FBCh
		int	21h
		mov	ax, 4C01h
		int	21h

loc_8DFD:
		mov	word_773A1, dx
		mov	ah, 0Ch
		call	dword ptr dword_7676B
		shl	edx, 10h
		and	ebx, 0FFFFh
		add	edx, ebx
		add	edx, 0FFFh
		and	dx, 0F000h
		mov	dword_76773, edx
		mov	ax, 0
		cmp	edx, 0FE0000h
		jbe	short loc_8E34
		mov	ax, 0Ch

loc_8E34:
		retf
sub_8DCE		endp

; ----------------------------------------------------------------------

sub_8E35		proc far
		push	es
		mov	ah, 0Dh
		mov	dx, word_773A1
		test	dx, 0FFFFh
		jz	short loc_8E52
		call	dword ptr dword_7676B
		mov	ah, 0Ah
		call	dword ptr dword_7676B
		mov	word_773A1, 0

loc_8E52:
		pop	es
		retf
sub_8E35		endp

; ----------------------------------------------------------------------

sub_8E54		proc far
		cmp	dword_776AF, 0
		jnz	short loc_8E5D
		retf

loc_8E5D:
		lfs	di, word ptr dword_776AF
		mov	eax, dword_776B3
		mov	fs:[di], eax
		mov	al, byte_776B7
		mov	fs:[di+4], al
		retf
sub_8E54		endp

; START OF FUNCTION CHUNK FOR sub_8E54
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		jmp	short loc_8E83
		nop
		nop
		nop

loc_8E83:
		cmp	ah, 0Bh
		jz	short loc_8EA9
		cmp	ah, 2
		jle	short loc_8EA4
		cmp	ah, 10h
		jz	sub_8FD7
		cmp	ah, 11h
		jz	loc_907D
		cmp	ah, 8
		jge	short loc_8EA4
		mov	ax, 1
		retf

loc_8EA4:
		jmp	dword ptr cs:0FFFh

loc_8EA9:
		push	ecx
		push	edx
		push	esi
		push	edi
		mov	bx, si
		mov	si, 4
		sub	sp, 4
		push	si
		push	cs
		call	near ptr sub_8F43
		add	sp, 2
		pop	eax
		cmp	eax, 0
		jz	short loc_8F12
		push	eax
		mov	si, 0Ah
		sub	sp, 4
		push	si
		push	cs
		call	near ptr sub_8F43
		add	sp, 2
		pop	edi
		pop	esi
		mov	eax, edi
		cmp	eax, 0
		jz	short loc_8F12
		mov	ecx, [bx]
		mov	cs:111Ah, ecx
		mov	cs:1112h, esi
		mov	cs:1116h, edi
		mov	ax, 1209h
		mov	bx, 5350h
		xor	cx, cx
		lea	edx, dword_778EB
		push	es
		push	0
		pop	es
		int	15h
		pop	es
		mov	ax, 1

loc_8F12:
		pop	edi
		pop	esi
		pop	edx
		pop	ecx
		retf
		push	es
		pop	ds
		mov	ecx, cs:111Ah
		mov	esi, cs:1112h
		mov	edi, cs:1116h
		mov	dl, cl
		and	dl, 3
		shr	ecx, 2
		cld
		rep movsd
		mov	cl, dl
		rep movsb
		retf
; END OF FUNCTION CHUNK FOR sub_8E54

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8F43		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		enter	0, 0
		mov	di, [bp+arg_0]
		mov	si, [bx+di]
		cmp	si, 0
		jz	short loc_8FA5
		push	bx
		mov	ah, 0Eh
		mov	dx, si
		call	dword ptr cs:0FFFh
		cmp	ax, 1
		jz	short loc_8F65
		add	sp, 2
		jmp	short loc_8FCD

loc_8F65:
		pop	bx
		mov	eax, [bx+di+2]
		add	eax, [bx]
		shr	eax, 0Ah
		cmp	ax, dx
		jle	short loc_8F7A
		mov	bx, 0A7h
		jmp	short loc_8FCD

loc_8F7A:
		push	bx
		mov	ah, 0Ch
		mov	dx, si
		call	dword ptr cs:0FFFh
		xor	ecx, ecx
		mov	cx, dx
		shl	ecx, 10h
		mov	cx, bx
		pop	bx
		add	ecx, [bx+di+2]
		mov	[bp+arg_2], ecx
		push	bx
		mov	ah, 0Dh
		mov	dx, si
		call	dword ptr cs:0FFFh
		pop	bx
		leave
		retf

loc_8FA5:
		movzx	ecx, word ptr [bx+di+4]
		movzx	eax, word ptr [bx+di+2]
		shl	ecx, 4
		add	ecx, eax
		mov	eax, ecx
		add	eax, [bx]
		cmp	eax, 10FFF0h
		jg	short loc_8FCA
		mov	[bp+arg_2], ecx
		leave
		retf

loc_8FCA:
		mov	bx, 0A7h

loc_8FCD:
		mov	[bp+arg_2], 0
		leave
		retf
sub_8F43		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8FD7		proc far

var_2		= word ptr -2

		enter	2, 0
		push	ds
		mov	[bp+var_2], 0
		or	dx, dx
		jnz	short loc_8FEC
		xor	ax, ax
		mov	bl, 0B1h
		jmp	loc_907A

loc_8FEC:
		mov	ax, 1209h
		mov	bx, 554Dh
		int	15h
		or	ax, ax
		jnz	short loc_8FFD
		mov	bx, 0B1h
		jmp	short loc_907A

loc_8FFD:
		mov	ds, ax
		cmp	word_76731, 0
		jnz	short loc_9062
		mov	ax, word_76733
		cmp	ax, [bp+var_2]
		jb	short loc_9011
		mov	[bp+var_2], ax

loc_9011:
		cmp	ax, dx
		jb	short loc_9062
		dec	ax
		sub	ax, dx
		jbe	short loc_9055
		mov	word_76733, dx
		mov	bx, ds
		inc	bx
		mov	word_76731, bx
		add	bx, dx
		push	bx
		mov	bl, byte_76730
		mov	byte_76730, 4Dh
		pop	ds
		mov	byte_76730, bl
		mov	word_76731, 0
		mov	word_76733, ax
		mov	bx, ds
		sub	bx, dx
		dec	bx
		mov	ds, bx
		inc	bx

loc_9047:
		mov	dword ptr word_76738, 424D55h
		mov	ax, 1
		jmp	short loc_907A

loc_9055:
		mov	bx, ds
		inc	bx
		mov	word_76731, bx
		mov	dx, word_76733
		jmp	short loc_9047

loc_9062:
		cmp	byte_76730, 4Dh
		jnz	short loc_9072
		mov	ax, ds
		add	ax, word_76733
		inc	ax
		jmp	short loc_8FFD

loc_9072:
		mov	bx, 0B0h
		xor	ax, ax
		mov	dx, [bp+var_2]

loc_907A:
		pop	ds
		leave
		retf
sub_8FD7		endp

; START OF FUNCTION CHUNK FOR sub_8FD7

loc_907D:
		push	ds
		push	dx
		dec	dx
		mov	ds, dx
		cmp	dword ptr word_76738, 424D55h
		jnz	short loc_909C
		mov	word_76731, 0
		push	cs
		call	near ptr sub_90A4
		mov	ax, 1
		jmp	short loc_90A1

loc_909C:
		xor	ax, ax
		mov	bx, 0B2h

loc_90A1:
		pop	dx
		pop	ds
		retf
; END OF FUNCTION CHUNK FOR sub_8FD7

; ----------------------------------------------------------------------

sub_90A4		proc far
		push	bx
		push	ds
		push	es
		mov	ax, 1209h
		mov	bx, 554Dh
		int	15h
		or	ax, ax
		jz	short loc_90E6

loc_90B3:
		mov	ds, ax
		cmp	byte_76730, 4Dh
		jnz	short loc_90E6
		add	ax, word_76733
		inc	ax
		cmp	word_76731, 0
		jnz	short loc_90B3
		mov	es, ax
		cmp	word ptr es:1, 0
		jnz	short loc_90B3
		mov	al, es:0
		mov	byte_76730, al
		mov	ax, es:3
		inc	ax
		add	word_76733, ax
		mov	ax, ds
		jmp	short loc_90B3

loc_90E6:
		pop	es
		pop	ds
		pop	bx
		retf
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	ss:[di], dl
		jl	short loc_9109

loc_9109:
		add	byte_76DBF, ch
		test	al, 13h
		pop	eax
		retf

loc_9112:
		push	ds
		push	offset unk_7E345
		pop	ds
		mov	word_7677A, es
		mov	word_76782, fs
		mov	word_76786, gs
		mov	word_76776, ss
		pop	ds
		push	7C15h
		pop	es
		mov	es:4Eh, ds
		push	ax
		pushf
		pop	ax
		or	ax, cs:13A8h
		mov	es:3Eh, ax
		pop	ax
		mov	word ptr es:40h, 2
		cli
		pop	word ptr es:36h
		pop	word ptr es:3Ah
		mov	es:42h, esp
		lss	sp, cs:13A4h
		pushal
		cmp	word ptr cs:3Fh, 0
		jz	short loc_9171
		mov	esi, cs:13A0h
		mov	ax, 0DE0Ch
		int	67h

loc_9171:
		mov	ax, 1209h
		mov	bx, 4549h
		int	15h
		popf
		pop	eax
		cmp	ah, 44h
		jz	short loc_918D
		cmp	ah, 50h
		jz	short loc_918D
		add	sp, 4
		int	67h
		jmp	short loc_9112

loc_918D:
		pushal
		mov	bp, sp
		push	ds
		push	es
		mov	ebx, [bp+20h]
		shr	ebx, 0Ch
		sub	ebx, 400h
		mov	ax, cs
		mov	ds, ax
		mov	dx, word_76771
		push	bx
		mov	ax, 4400h
		shr	bx, 2
		int	67h
		mov	ax, 4401h
		inc	bx
		int	67h
		pop	bx
		and	bx, 3
		mov	ax, 1000h
		mul	bx
		mov	di, ax
		mov	ah, 41h
		int	67h
		mov	es, bx
		mov	cx, bx
		shr	cx, 8
		add	cx, 8
		mov	si, cx
		mov	dx, [bp+14h]
		mov	ah, 4Ch
		int	67h
		or	ah, ah
		jz	short loc_91FF
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
		int	15h
		popf
		mov	ax, 1209h
		mov	bx, 4146h
		mov	edx, [bp+20h]
		int	15h
		pop	es
		pop	ds
		popal
		add	sp, 4
		mov	ah, 83h
		retf

loc_91FF:
		cmp	bx, 200h
		jb	short loc_9208
		mov	bx, 1FFh

loc_9208:
		push	bx
		sub	sp, 2
		mov	word ptr [bp-8], 0
		push	dx

loc_9212:
		mov	ax, 4402h
		mov	bx, [bp-8]
		shr	bx, 2
		mov	dx, [bp-0Ah]
		int	67h
		mov	cx, si

loc_9222:
		mov	ax, 0DE06h
		int	67h
		or	dl, 7
		mov	es:[di], edx
		add	di, 4
		inc	cx
		inc	word ptr [bp-8]
		mov	ax, [bp-6]
		shl	ax, 2
		cmp	[bp-8], ax
		jnb	short loc_9249
		test	word ptr [bp-8], 3
		jz	short loc_9212
		jmp	short loc_9222

loc_9249:
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
		int	15h
		popf
		mov	ax, 1209h
		mov	bx, 4348h
		mov	cx, [bp-6]
		mov	dx, [bp-0Ah]
		mov	edi, [bp+20h]
		int	15h
		add	sp, 6
		pop	es
		pop	ds
		popal
		add	sp, 4
		int	67h
		retf
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
		add	[bx+si], al
sub_90A4		endp
seg013		ends
