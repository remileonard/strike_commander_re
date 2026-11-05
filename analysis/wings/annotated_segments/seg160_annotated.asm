seg160		segment	para public 'CODE' use16
		assume cs:seg160
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 4, 89h, 45h, 4, 8Bh, 0C7h, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52D1A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		xor	si, si
		jmp	short loc_52D6C

loc_52D22:
		mov	ax, si
		imul	ax, ax, 0Ch
		les	bx, [bp+arg_0]
		add	bx, ax
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	dx, si
		imul	dx, dx, 0Ch
		mov	bx, [bp+arg_0]
		add	bx, dx
		mov	es:[bx+4], eax
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, [bp+arg_0]
		add	bx, ax
		test	byte ptr es:[bx], 1
		jz	short loc_52D6B
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	dx, [bp+arg_0]
		add	dx, ax
		push	[bp+arg_2]
		push	dx
		call	sub_43F1F
		add	sp, 4
		jmp	short loc_52D6B

loc_52D6B:
		inc	si

loc_52D6C:
		cmp	si, 4
		jl	short loc_52D22
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+61h], 0FFh
		mov	al, 0
		mov	es:[bx+63h], al
		mov	es:[bx+62h], al
		pop	si
		pop	bp
		retf
sub_52D1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52D86		proc far

var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_8]
		jmp	loc_52E8A

loc_52D97:
		xor	cx, cx
		mov	[bp+var_2], 0FFFFh
		jmp	short loc_52DF2

loc_52DA0:
		mov	ax, cx
		imul	ax, ax, 0Ch
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	dx, cx
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		add	eax, es:[bx+8]
		mov	bx, [bp+arg_6]
		sub	eax, [bx]
		mov	[bp+var_6], eax
		mov	eax, [bx]
		mov	dx, cx
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		sub	eax, es:[bx+4]
		mov	[bp+var_A], eax
		cmp	[bp+var_A], 0
		jl	short loc_52DF1
		cmp	[bp+var_6], 0
		jle	short loc_52DF1
		mov	[bp+var_2], cx
		jmp	short loc_52DFE

loc_52DF1:
		inc	cx

loc_52DF2:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		cmp	ax, cx
		jg	short loc_52DA0

loc_52DFE:
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_52E07
		jmp	loc_52E93

loc_52E07:
		mov	eax, [si]
		cmp	eax, [bp+var_6]
		jge	short loc_52E14
		mov	[bp+var_6], eax

loc_52E14:
		push	large [bp+var_6]
		push	large [bp+var_A]
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		mov	dx, word ptr [bp+arg_0]
		add	dx, ax
		push	word ptr [bp+arg_0+2]
		push	dx
		push	large [di]
		call	sub_438A3
		add	sp, 10h
		les	bx, word ptr [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+61h], al
		mov	bx, [bp+arg_6]
		mov	eax, [bp+var_6]
		add	[bx], eax
		sub	[si], eax
		cmp	dword ptr [si], 0
		jz	short loc_52E8A
		mov	cx, di
		mov	bx, cx
		mov	ax, [bx]
		shr	ax, 4
		mov	dx, [bx+2]
		add	dx, ax
		mov	[bp+var_C], dx
		mov	ax, [bx]
		and	ax, 0Fh
		mov	[bx+2], dx
		mov	[bx], ax
		mov	eax, [bp+var_6]
		sar	eax, 4
		mov	dx, [di+2]
		add	dx, ax
		mov	ax, [di]
		mov	bx, word ptr [bp+var_6]
		and	bx, 0Fh
		add	ax, bx
		mov	[di+2], dx
		mov	[di], ax

loc_52E8A:
		cmp	dword ptr [si], 0
		jz	short loc_52E93
		jmp	loc_52D97

loc_52E93:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_53566
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_52D86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_52EA3		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	[bp+var_6], 0
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 0
		jz	short loc_52EEE
		cmp	byte ptr es:[bx+61h], 0
		jl	short loc_52ECD
		mov	eax, [bp+arg_0]
		cmp	eax, dword_5E6A0
		jz	short loc_52EEE

loc_52ECD:
		call	CRT_Rand
		les	bx, word ptr [bp+arg_0]
		push	ax
		mov	al, es:[bx+62h]
		cbw
		mov	bx, ax
		pop	ax
		cwd
		idiv	bx
		mov	[bp+var_2], dx
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+61h], 0FFh
		jmp	short loc_52F42

loc_52EEE:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 1
		jle	short loc_52F3D
		call	CRT_Rand
		les	bx, word ptr [bp+arg_0]
		push	ax
		mov	al, es:[bx+62h]
		cbw
		dec	ax
		mov	bx, ax
		pop	ax
		cwd
		idiv	bx
		mov	[bp+var_2], dx
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+61h]
		cbw
		cmp	ax, [bp+var_2]
		jg	short loc_52F20
		inc	[bp+var_2]

loc_52F20:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+61h]
		cbw
		push	ax
		mov	al, es:[bx+62h]
		cbw
		dec	ax
		pop	dx
		cmp	dx, ax
		jnz	short loc_52F42
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+61h], al
		jmp	short loc_52F42

loc_52F3D:
		xor	ax, ax
		jmp	loc_53051

loc_52F42:
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	dx, [bp+var_2]
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+4], eax
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		test	byte ptr es:[bx], 1
		jz	short loc_52F8F
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		mov	dx, word ptr [bp+arg_0]
		add	dx, ax
		push	word ptr [bp+arg_0+2]
		push	dx
		call	sub_43F1F
		add	sp, 4
		jmp	short loc_52F8F

loc_52F8F:
		les	bx, word ptr [bp+arg_0]
		dec	byte ptr es:[bx+62h]
		cmp	byte ptr es:[bx+62h], 0
		jnz	short loc_52FA0
		jmp	loc_5304E

loc_52FA0:
		mov	al, es:[bx+62h]
		cbw
		cmp	ax, [bp+var_2]
		jnz	short loc_52FAD
		jmp	loc_5304E

loc_52FAD:
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx]
		mov	dx, [bp+var_2]
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx], eax
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	dx, [bp+var_2]
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+4], eax
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+8]
		mov	dx, [bp+var_2]
		imul	dx, dx, 0Ch
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+8], eax
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_6]
		mov	es:[bx], eax
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	bx, word ptr [bp+arg_0]
		push	eax
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		add	bx, ax
		pop	eax
		mov	es:[bx+4], eax

loc_5304E:
		mov	ax, 1

loc_53051:
		leave
		retf
sub_52EA3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53053		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		cmp	dword_5E6A0, 0
		jnz	short loc_53064
		jmp	loc_530EC

loc_53064:
		mov	eax, dword_5E6A0
		mov	[bp+var_8], eax

loc_5306C:
		mov	eax, dword_5E6A0
		mov	[bp+var_4], eax
		les	bx, word ptr dword_5E6A0
		mov	eax, es:[bx+30h]
		mov	dword_5E6A0, eax
		cmp	[bp+var_4], 0
		jz	short loc_530D9
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_52D1A
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		xor	eax, eax
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax
		push	seg seg160
		push	offset sub_53A06
		push	5
		push	large 4
		push	0Ch
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_B05
		add	sp, 10h
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_530D9

loc_530D9:
		mov	eax, dword_5E6A0
		cmp	eax, [bp+var_8]
		jnz	short loc_5306C
		mov	dword_5E6A0, 0

loc_530EC:
		leave
		retf
sub_53053		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_530EE		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		xor	si, si
		mov	eax, dword_5E6A0
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		jmp	loc_53236

loc_5310A:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+63h]
		cbw
		or	ax, ax
		jz	short loc_53119
		jmp	loc_53203

loc_53119:
		push	word ptr [bp+var_4+2]
		push	bx
		push	cs
		call	near ptr sub_52EA3
		add	sp, 4
		or	ax, ax
		jnz	short loc_5312B
		jmp	loc_53203

loc_5312B:
		inc	si
		mov	eax, [bp+var_4]
		cmp	eax, [bp+arg_0]
		jnz	short loc_53139
		jmp	loc_53203

loc_53139:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+62h]
		cbw
		or	ax, ax
		jz	short loc_53148
		jmp	loc_53203

loc_53148:
		mov	ax, es:[bx+32h]
		mov	dx, es:[bx+30h]
		les	bx, es:[bx+34h]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+36h]
		mov	dx, es:[bx+34h]
		les	bx, es:[bx+30h]
		mov	es:[bx+36h], ax
		mov	es:[bx+34h], dx
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		cmp	eax, [bp+var_4]
		jnz	short loc_5318C
		mov	dword_5E6A0, 0
		jmp	short loc_531A3

loc_5318C:
		mov	eax, [bp+var_4]
		cmp	eax, dword_5E6A0
		jnz	short loc_531A3
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	dword_5E6A0, eax

loc_531A3:
		cmp	[bp+var_4], 0
		jz	short loc_531FB
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_52D1A
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		xor	eax, eax
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax
		push	seg seg160
		push	offset sub_53A06
		push	5
		push	large 4
		push	0Ch
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_B05
		add	sp, 10h
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_531FB

loc_531FB:
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax

loc_53203:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		cmp	[bp+var_4], 0
		jnz	short loc_5321C
		mov	eax, dword_5E6A0
		mov	[bp+var_4], eax
		jmp	short loc_53236

loc_5321C:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		cmp	eax, [bp+var_4]
		jz	short loc_53240

loc_53236:
		cmp	[bp+var_4], 0
		jz	short loc_53240
		jmp	loc_5310A

loc_53240:
		mov	ax, si
		pop	si
		leave
		retf
sub_530EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53245		proc far

var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	eax, dword_5E6A0
		mov	[bp+var_4], eax
		xor	si, si
		mov	al, byte_5E6AA
		cbw
		or	ax, ax
		jnz	short loc_5329F
		xor	dx, dx
		xor	ax, ax
		jmp	loc_533EA

loc_53265:
		inc	si
		push	28h
		mov	ax, word ptr [bp+var_4]
		add	ax, 38h
		push	word ptr [bp+var_4+2]
		push	ax
		push	large [bp+arg_0]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jz	short loc_532A6
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		cmp	eax, dword_5E6A0
		jnz	short loc_5329F
		mov	[bp+var_4], 0
		jmp	short loc_532A6

loc_5329F:
		cmp	[bp+var_4], 0
		jnz	short loc_53265

loc_532A6:
		cmp	[bp+var_4], 0
		jz	short loc_532B0
		jmp	loc_533E4

loc_532B0:
		cmp	word_5D978, 0
		jge	short loc_532BA
		jmp	loc_533E4

loc_532BA:
		jmp	short loc_532BD

loc_532BC:
		dec	si

loc_532BD:
		cmp	si, word_5E6A4
		jb	short loc_532D2
		push	large 0
		nop
		push	cs
		call	near ptr sub_533ED
		add	sp, 4
		or	ax, ax
		jnz	short loc_532BC

loc_532D2:
		cmp	si, word_5E6A4
		jb	short loc_532DB
		jmp	loc_533E4

loc_532DB:
		push	large 0
		nop
		push	cs
		call	near ptr sub_538FD
		add	sp, 4
		or	ax, ax
		jnz	short loc_532ED
		jmp	loc_533E4

loc_532ED:
		push	1
		push	0
		push	2
		push	large 64h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		or	ax, dx
		jz	short loc_5334E
		push	seg seg160
		push	offset sub_53A4D
		push	5
		push	large 4
		push	0Ch
		push	dx
		push	[bp+var_8]
		call	sub_3846
		add	sp, 10h
		les	bx, [bp+var_8]
		mov	al, 0
		mov	es:[bx+62h], al
		mov	es:[bx+63h], al
		mov	es:[bx+61h], al
		mov	es:[bx+38h], al
		mov	es:[bx+45h], al
		mov	dword ptr es:[bx+30h], 0
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]
		jmp	short loc_53354

loc_5334E:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]

loc_53354:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		push	dx
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_52D1A
		add	sp, 4
		push	28h
		push	large [bp+var_C]
		mov	ax, word ptr [bp+var_4]
		add	ax, 38h
		push	word ptr [bp+var_4+2]
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		cmp	dword_5E6A0, 0
		jz	short loc_533CF
		les	bx, word ptr [bp+var_4]
		mov	eax, dword_5E6A0
		mov	es:[bx+30h], eax
		les	bx, word ptr dword_5E6A0
		mov	eax, es:[bx+34h]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+34h], eax
		les	bx, word ptr dword_5E6A0
		les	bx, es:[bx+34h]
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr dword_5E6A0
		mov	eax, [bp+var_4]
		mov	es:[bx+34h], eax
		jmp	short loc_533E0

loc_533CF:
		les	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_4]
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax

loc_533E0:
		mov	dword_5E6A0, eax

loc_533E4:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_533EA:
		pop	si
		leave
		retf
sub_53245		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_533ED		proc far

var_68		= word ptr -68h
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		xor	si, si
		mov	eax, dword_5E6A0
		mov	[bp+var_4], eax
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		call	sub_42CA7
		add	sp, 4
		cmp	[bp+var_4], 0
		jnz	short loc_53415
		jmp	loc_53508

loc_53415:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+34h]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+63h]
		cbw
		or	ax, ax
		jnz	short loc_53434
		cmp	[bp+arg_0], 0
		jz	short loc_53441

loc_53434:
		mov	eax, [bp+arg_0]
		cmp	eax, [bp+var_4]
		jz	short loc_53441
		jmp	loc_534FA

loc_53441:
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+32h]
		mov	dx, es:[bx+30h]
		les	bx, es:[bx+34h]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+36h]
		mov	dx, es:[bx+34h]
		les	bx, es:[bx+30h]
		mov	es:[bx+36h], ax
		mov	es:[bx+34h], dx
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		cmp	eax, [bp+var_4]
		jnz	short loc_53488
		mov	dword_5E6A0, 0
		jmp	short loc_5349F

loc_53488:
		mov	eax, [bp+var_4]
		cmp	eax, dword_5E6A0
		jnz	short loc_5349F
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	dword_5E6A0, eax

loc_5349F:
		cmp	[bp+var_4], 0
		jz	short loc_534F7
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_52D1A
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		xor	eax, eax
		mov	es:[bx+30h], eax
		mov	es:[bx+34h], eax
		push	seg seg160
		push	offset sub_53A06
		push	5
		push	large 4
		push	0Ch
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_B05
		add	sp, 10h
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_534F7

loc_534F7:
		inc	si
		jmp	short loc_53508

loc_534FA:
		mov	eax, [bp+var_4]
		cmp	eax, dword_5E6A0
		jz	short loc_53508
		jmp	loc_53415

loc_53508:
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		call	sub_42CBE
		add	sp, 4
		mov	ax, si
		pop	si
		leave
		retf
sub_533ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5351A		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		xor	si, si
		mov	eax, dword_5E6A0
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_0]
		mov	word_5E6A4, ax
		cmp	[bp+var_4], 0
		jz	short loc_5355D

loc_53538:
		inc	si
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		cmp	eax, dword_5E6A0
		jnz	short loc_53538
		jmp	short loc_5355D

loc_5354E:
		push	large 0
		push	cs
		call	near ptr sub_533ED
		add	sp, 4
		or	ax, ax
		jz	short loc_53563
		dec	si

loc_5355D:
		cmp	si, word_5E6A4
		ja	short loc_5354E

loc_53563:
		pop	si
		leave
		retf
sub_5351A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53566		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		cmp	eax, dword_5E6A0
		jz	short loc_535E6
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+32h]
		mov	dx, es:[bx+30h]
		les	bx, es:[bx+34h]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+36h]
		mov	dx, es:[bx+34h]
		les	bx, es:[bx+30h]
		mov	es:[bx+36h], ax
		mov	es:[bx+34h], dx
		les	bx, word ptr [bp+arg_0]
		mov	eax, dword_5E6A0
		mov	es:[bx+30h], eax
		les	bx, word ptr dword_5E6A0
		mov	eax, es:[bx+34h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], eax
		les	bx, word ptr dword_5E6A0
		les	bx, es:[bx+34h]
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		mov	es:[bx+32h], ax
		mov	es:[bx+30h], dx
		les	bx, word ptr dword_5E6A0
		mov	eax, [bp+arg_0]
		mov	es:[bx+34h], eax
		mov	dword_5E6A0, eax

loc_535E6:
		pop	bp
		retf
sub_53566		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_535E8		proc far

var_98		= word ptr -98h
var_6E		= word ptr -6Eh
var_1D		= dword ptr -1Dh
var_15		= word ptr -15h
var_10		= byte ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 98h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		push	si
		call	CRT_Strlen
		pop	cx
		mov	bx, ax
		mov	dx, si
		cmp	bx, 28h
		jle	short loc_53616
		add	ax, 0FFD8h
		add	dx, ax

loc_53616:
		push	dx
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_98]
		push	ax
		call	CRT_Strupr_2F35
		pop	cx
		push	1
		push	si
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ReadDispatch_5274A
		add	sp, 6
		cmp	al, 1
		jnz	short loc_536BB
		push	ss
		lea	ax, [bp+var_98]
		push	ax
		push	cs
		call	near ptr sub_53245
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		cmp	[bp+var_E], 0
		jz	short loc_536B1
		mov	[bp+var_2], 1
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_6], eax
		mov	[bp+var_A], 0

loc_5367A:
		mov	eax, [bp+var_1D]
		add	eax, [bp+var_A]
		push	eax
		push	[bp+var_15]
		push	large [bp+var_E]
		nop
		push	cs
		call	near ptr sub_5374E
		add	sp, 0Ah
		or	ax, ax
		jz	short loc_536A9
		add	[bp+var_A], 0FFC0h
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_6]
		jl	short loc_5367A

loc_536A9:
		les	bx, word ptr [bp+var_E]
		mov	byte ptr es:[bx+63h], 1

loc_536B1:
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_527AA
		pop	cx

loc_536BB:
		mov	al, [bp+var_2]
		mov	[bp+var_10], al
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_Close_52616
		add	sp, 4
		mov	al, [bp+var_10]
		pop	si
		leave
		retf
sub_535E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_536D5		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_5E6A6, eax
		push	large 0
		nop
		push	cs
		call	near ptr sub_538FD
		add	sp, 4
		pop	bp
		retf
sub_536D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_536ED		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 0
		mov	eax, dword_5E6A0
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jz	short loc_53743

loc_5370A:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+62h]
		cbw
		mov	dx, ax
		jmp	short loc_53729

loc_53716:
		mov	ax, dx
		imul	ax, ax, 0Ch
		les	bx, word ptr [bp+var_8]
		add	bx, ax
		mov	eax, es:[bx+8]
		add	[bp+var_4], eax

loc_53729:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_53716
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx+30h]
		mov	[bp+var_8], eax
		cmp	eax, dword_5E6A0
		jnz	short loc_5370A

loc_53743:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_536ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5374E		proc far

var_80		= word ptr -80h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	di, di
		push	word ptr [si+4]
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_14], eax
		mov	bx, [si+4]
		mov	eax, [bx+51h]
		mov	[bp+var_18], eax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_538FD
		add	sp, 4
		or	ax, ax
		jnz	short loc_5378D

loc_53788:
		xor	ax, ax
		jmp	loc_538F9

loc_5378D:
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		call	sub_42CA7
		add	sp, 4
		mov	eax, [bp+arg_6]
		sub	eax, [bp+var_18]
		mov	ebx, 0FFC0h
		cdq
		idiv	ebx
		imul	eax, eax, 0FFC0h
		add	eax, [bp+var_18]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_14]
		sub	eax, [bp+var_4]
		add	eax, [bp+var_18]
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0FFC0h
		jle	short loc_537DE
		mov	[bp+var_8], 0FFC0h

loc_537DE:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 4
		jle	short loc_537F1
		push	1208h
		call	sub_9D47
		pop	cx

loc_537F1:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+62h], 4
		jnz	short loc_53810
		cmp	[bp+var_14], 4FEC0h
		jg	short loc_53788
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_52EA3
		add	sp, 4

loc_53810:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		mov	dx, word ptr [bp+arg_0+2]
		add	bx, ax
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		push	0
		push	large [bp+var_8]
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	sub_43D60
		add	sp, 0Ah
		mov	eax, [bp+var_1C]
		jmp	short loc_5386C

loc_5383F:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+62h]
		cbw
		imul	ax, ax, 0Ch
		mov	dx, word ptr [bp+arg_0+2]
		add	bx, ax
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		push	0
		push	large [bp+var_8]
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_43D60
		add	sp, 0Ah
		mov	eax, [bp+var_20]

loc_5386C:
		les	bx, [bp+var_10]
		mov	es:[bx], eax
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_53895
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_530EE
		add	sp, 4
		or	ax, ax
		jnz	short loc_5383F

loc_53895:
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jz	short loc_538EA
		push	[bp+var_E]
		push	bx
		call	PagedMemory_WriteByte_433DE
		add	sp, 4
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	dx
		push	ax
		push	si
		call	FileStream_Method_Read_52AFB
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		les	bx, [bp+var_10]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+4], eax
		les	bx, word ptr [bp+arg_0]
		inc	byte ptr es:[bx+62h]
		inc	di

loc_538EA:
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		call	sub_42CBE
		add	sp, 4
		mov	ax, di

loc_538F9:
		pop	di
		pop	si
		leave
		retf
sub_5374E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_538FD		proc far

var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	cs
		call	near ptr sub_536ED
		push	dx
		push	ax
		pop	eax
		cmp	eax, dword_5E6A6
		jnb	short loc_53918
		mov	ax, 1
		jmp	short loc_5391A

loc_53918:
		xor	ax, ax

loc_5391A:
		mov	si, ax
		or	si, si
		jnz	short loc_5396B
		cmp	[bp+arg_0], 0
		jz	short loc_53936
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+63h]
		mov	[bp+var_1], al
		mov	byte ptr es:[bx+63h], 1

loc_53936:
		mov	si, 1

loc_53939:
		push	large 0
		push	cs
		call	near ptr sub_533ED
		add	sp, 4
		or	ax, ax
		jnz	short loc_5394B
		xor	si, si
		jmp	short loc_5395A

loc_5394B:
		push	cs
		call	near ptr sub_536ED
		push	dx
		push	ax
		pop	eax
		cmp	eax, dword_5E6A6
		ja	short loc_53939

loc_5395A:
		cmp	[bp+arg_0], 0
		jz	short loc_5396B
		les	bx, word ptr [bp+arg_0]
		mov	al, [bp+var_1]
		mov	es:[bx+63h], al

loc_5396B:
		mov	ax, si
		pop	si
		leave
		retf
sub_538FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53970		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_539A5
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_539A1
		push	dx
		push	ax
		push	cs
		call	near ptr sub_533ED
		add	sp, 4
		or	ax, ax
		jz	short loc_539A1
		mov	ax, 1
		jmp	short loc_539A3

loc_539A1:
		xor	ax, ax

loc_539A3:
		leave
		retf
sub_53970		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_539A5		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	eax, dword_5E6A0
		mov	[bp+var_4], eax
		jmp	short loc_539EE

loc_539B5:
		push	28h
		mov	ax, word ptr [bp+var_4]
		add	ax, 38h
		push	word ptr [bp+var_4+2]
		push	ax
		push	large [bp+arg_0]
		call	sub_37DE
		add	sp, 0Ah
		or	ax, ax
		jz	short loc_539F5
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		cmp	eax, dword_5E6A0
		jnz	short loc_539EE
		mov	[bp+var_4], 0
		jmp	short loc_539F5

loc_539EE:
		cmp	[bp+var_4], 0
		jnz	short loc_539B5

loc_539F5:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_539A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_539FD		proc far
		push	bp
		mov	bp, sp
		push	cs
		call	near ptr sub_53053
		pop	bp
		retf
sub_539FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53A06		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_53A4A
		les	bx, word ptr [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	es:[bx+4], eax
		test	byte ptr es:[bx], 1
		jz	short loc_53A38
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_43F1F
		add	sp, 4
		jmp	short loc_53A38

loc_53A38:
		test	si, 1
		jz	short loc_53A4A
		push	large [bp+arg_0]
		call	sub_349
		add	sp, 4

loc_53A4A:
		pop	si
		pop	bp
		retf
sub_53A06		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_53A4D		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_53A6C
		push	large 0Ch
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_53A84

loc_53A6C:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx], 0
		xor	eax, eax
		mov	es:[bx+8], eax
sub_53A4D		endp

; START OF FUNCTION CHUNK FOR sub_53A4D
		db 66h
; END OF FUNCTION CHUNK FOR sub_53A4D
seg160		ends
