seg044		segment	para public 'CODE' use16
		assume cs:seg044
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 4, 9Ah, 6Ah, 7, 0, 0, 59h, 8Bh, 0D0h, 0Bh, 0C0h

loc_1C1EB:
		db 8Bh, 0C2h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C1EF		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		cmp	byte_77488, 0
		jz	short loc_1C1FE
		xor	ax, ax
		jmp	short loc_1C25B

loc_1C1FE:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 1000h
		jbe	short loc_1C211
		push	0D63h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_1C211:
		les	bx, [bp+arg_0]
		mov	si, es:[bx]
		movzx	eax, si
		mov	edx, dword_77470
		add	edx, eax
		cmp	edx, dword_7746C
		jle	short loc_1C237
		mov	si, word ptr dword_7746C
		sub	si, word ptr dword_77470
		mov	byte_77488, 1

loc_1C237:
		push	si
		mov	ax, word ptr dword_77464
		add	ax, word ptr dword_77470
		push	word_77466
		push	ax
		push	large [bp+arg_4]
		call	sub_37C3
		add	sp, 0Ah
		movzx	eax, si
		add	dword_77470, eax
		mov	ax, si

loc_1C25B:
		pop	si
		pop	bp
		retf	8
sub_1C1EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C260		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	byte_77488, 0
		jz	short loc_1C276
		cmp	dword_7C7BA, 0
		jz	short loc_1C276
		xor	ax, ax
		jmp	short loc_1C2E5

loc_1C276:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 1000h
		jbe	short loc_1C289
		push	0D111h
		call	sub_1DDFE
		pop	cx

loc_1C289:
		les	bx, [bp+arg_0]
		mov	cx, es:[bx]
		cmp	dword_7C7BA, 0
		jz	short loc_1C2B8
		movzx	eax, word ptr es:[bx]
		mov	edx, dword_7747C
		add	edx, eax
		cmp	edx, dword_7C7BA
		jle	short loc_1C2B8
		mov	cx, word ptr dword_7C7BA
		sub	cx, word ptr dword_7747C
		mov	byte_77488, 1

loc_1C2B8:
		push	large dword_77470
		movzx	eax, cx
		push	eax
		push	large [bp+arg_4]
		push	word_77484
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	cx, ax
		movzx	eax, cx
		add	dword_77470, eax
		add	dword_7747C, eax
		mov	ax, cx

loc_1C2E5:
		pop	bp
		retf	8
sub_1C260		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C2E9		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 1000h
		jbe	short loc_1C300
		push	0D113h
		call	sub_1DDFE
		pop	cx

loc_1C300:
		les	bx, [bp+arg_0]
		mov	si, es:[bx]
		push	large 0FFFFFFFFh
		movzx	eax, si
		push	eax
		push	large [bp+arg_4]
		push	word_77486
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		movzx	eax, si
		shld	edx, eax, 10h
		xor	bx, bx
		add	word ptr dword_77468, ax
		adc	bx, dx
		mov	cx, 0Ch
		shl	bx, cl
		add	word_7746A, bx
		movzx	eax, si
		add	dword_77478, eax
		mov	ax, si
		pop	si
		pop	bp
		retf	8
sub_1C2E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C349		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 1000h
		jbe	short loc_1C363
		push	0D113h
		call	sub_1DDFE
		pop	cx

loc_1C363:
		les	bx, [bp+arg_0]
		mov	si, es:[bx]
		cmp	byte_7748E, 0
		jz	short loc_1C38D
		movzx	eax, word ptr es:[bx]
		mov	edx, dword_77478
		add	edx, eax
		cmp	edx, dword_7748A
		jle	short loc_1C38D
		push	0D114h
		call	sub_1DDFE
		pop	cx

loc_1C38D:
		push	si
		push	large [bp+arg_4]
		push	large dword_77468
		call	sub_37C3
		add	sp, 0Ah
		movzx	eax, si
		shld	edx, eax, 10h
		xor	bx, bx
		add	word ptr dword_77468, ax
		adc	bx, dx
		mov	cx, 0Ch
		shl	bx, cl
		add	word_7746A, bx
		movzx	eax, word_7746A
		mov	[bp+var_4], eax
		shl	eax, 4
		mov	[bp+var_4], eax
		movzx	eax, word ptr dword_77468
		add	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shr	eax, 4
		mov	dx, word ptr [bp+var_4]
		and	dx, 0Fh
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	eax, [bp+var_8]
		mov	dword_77468, eax
		movzx	eax, si
		add	dword_77478, eax
		mov	ax, si
		pop	si
		leave
		retf	8
sub_1C349		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C401		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	word_77484, si
		mov	eax, [bp+arg_0]
		mov	dword_77468, eax
		mov	eax, [bp+arg_6]
		mov	dword_77470, eax
		mov	dword_77474, 0
		mov	dword_77478, 0
		mov	byte_77488, 0
		mov	dword_7747C, 0
		mov	byte_77489, 0
		mov	[bp+var_4], 0
		cmp	[bp+arg_A], 0FFFAh
		jge	short loc_1C496
		push	0
		push	0
		push	2
		push	large [bp+arg_A]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_1C496
		mov	byte_77489, 1
		mov	eax, [bp+var_4]
		mov	dword_77464, eax
		mov	dword_77470, 0
		mov	eax, [bp+arg_A]
		mov	dword_7746C, eax

loc_1C496:
		cmp	byte_77489, 0
		jz	short loc_1C4EF
		push	large 0FFFFFFFFh
		push	large [bp+arg_A]
		push	large [bp+var_4]
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	seg seg044
		push	offset sub_1C1EF
		push	seg seg044
		push	offset sub_1C349
		push	large dword_7748F
		call	sub_70EEB
		movzx	eax, ax
		cmp	eax, 0
		jz	short loc_1C4DA
		push	0D115h
		call	sub_1DDFE
		pop	cx

loc_1C4DA:
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_1C518

loc_1C4EF:
		push	seg seg044
		push	offset sub_1C260
		push	seg seg044
		push	offset sub_1C349
		push	large dword_7748F
		call	sub_70EEB
		movzx	eax, ax
		cmp	eax, 0
		jz	short loc_1C518
		push	0D116h
		call	sub_1DDFE
		pop	cx

loc_1C518:
		mov	dword_7C7BA, 0
		mov	byte_7748E, 0
		mov	eax, dword_77478
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_1C401		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C532		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_A]
		mov	dword_7748A, eax
		mov	byte_7748E, 1
		push	eax
		push	large [bp+arg_2]
		push	[bp+arg_0]
		push	large [bp+arg_6]
		push	cs
		call	near ptr sub_1C401
		add	sp, 0Eh
		pop	bp
		retf
sub_1C532		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C558		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		push	[bp+arg_0]
		push	large [bp+arg_6]
		nop
		push	cs
		call	near ptr sub_1C574
		add	sp, 0Eh
		pop	bp
		retf
sub_1C558		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C574		proc far

var_1C		= dword ptr -1Ch
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	byte_77489, 0
		mov	[bp+var_4], 0
		cmp	[bp+arg_A], 0FFFAh
		jge	short loc_1C5E7
		push	0
		push	0
		push	2
		push	large [bp+arg_A]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_1C5E7
		mov	byte_77489, 1
		mov	eax, [bp+var_4]
		mov	dword_77464, eax
		mov	dword_77470, 0
		mov	eax, [bp+arg_A]
		mov	dword_7746C, eax
		push	large 0FFFFFFFFh
		push	eax
		push	dx
		push	word ptr [bp+var_4]
		push	[bp+arg_4]
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh

loc_1C5E7:
		mov	ax, word_77491
		mov	dx, word ptr dword_7748F
		add	dx, 7D00h
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	[bp+var_C], 0
		mov	[bp+var_10], 0
		mov	[bp+var_14], 0
		mov	[bp+var_16], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax
		mov	[bp+var_1C], eax
		jmp	loc_1C78E

loc_1C624:
		mov	al, byte_77489
		mov	ah, 0
		or	ax, ax
		jz	short loc_1C630
		jmp	loc_1C705

loc_1C630:
		mov	eax, dword_7748F
		mov	[bp+var_1C], eax
		push	large 0FFFFFFFFh
		push	large 0Ah
		push	large [bp+var_1C]
		push	[bp+arg_4]
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		les	bx, word ptr [bp+var_1C]
		mov	si, es:[bx]
		mov	di, es:[bx+2]
		mov	al, es:[bx+7]
		mov	[bp+var_17], al
		movzx	eax, si
		add	[bp+var_14], eax
		mov	eax, [bp+var_14]
		cmp	eax, [bp+arg_A]
		jl	short loc_1C675
		mov	[bp+var_16], 1

loc_1C675:
		push	large 0FFFFFFFFh
		mov	ax, si
		sub	ax, 0Ah
		movzx	eax, ax
		push	eax
		mov	ax, word ptr [bp+var_1C]
		add	ax, 0Ah
		push	word ptr [bp+var_1C+2]
		push	ax
		push	[bp+arg_4]
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 17700000h
		push	large [bp+var_8]
		call	sub_380B
		add	sp, 8
		push	large [bp+var_1C]
		push	large [bp+var_8]
		call	sub_7CF8
		movsx	eax, ax
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0
		jz	short loc_1C6CF
		push	0D117h
		call	sub_1DDFE
		pop	cx

loc_1C6CF:
		push	di
		mov	al, [bp+var_17]
		cbw
		mov	dx, word ptr [bp+var_8]
		add	dx, ax
		push	word ptr [bp+var_8+2]
		push	dx
		mov	ax, [bp+arg_0]
		add	ax, word ptr [bp+var_10]
		push	[bp+arg_2]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		cmp	[bp+var_C], 0
		jnz	short loc_1C6F9
		jmp	loc_1C786

loc_1C6F9:
		push	0D118h
		call	sub_1DDFE
		pop	cx
		jmp	loc_1C786

loc_1C705:
		les	bx, word ptr [bp+var_1C]
		mov	si, es:[bx]
		mov	al, es:[bx+7]
		mov	[bp+var_17], al
		mov	di, es:[bx+2]
		movzx	eax, si
		add	[bp+var_14], eax
		mov	eax, [bp+var_14]
		cmp	eax, [bp+arg_A]
		jl	short loc_1C72D
		mov	[bp+var_16], 1

loc_1C72D:
		cmp	di, 1000h
		jbe	short loc_1C73C
		push	0D119h
		call	sub_1DDFE
		pop	cx

loc_1C73C:
		push	large 17700000h
		push	large [bp+var_8]
		call	sub_380B
		add	sp, 8
		push	large [bp+var_1C]
		push	large [bp+var_8]
		call	sub_7CF8
		movsx	eax, ax
		mov	[bp+var_C], eax
		push	di
		mov	al, [bp+var_17]
		cbw
		mov	dx, word ptr [bp+var_8]
		add	dx, ax
		push	word ptr [bp+var_8+2]
		push	dx
		mov	ax, [bp+arg_0]
		add	ax, word ptr [bp+var_10]
		push	[bp+arg_2]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		add	word ptr [bp+var_1C], si

loc_1C786:
		movzx	eax, di
		add	[bp+var_10], eax

loc_1C78E:
		cmp	[bp+var_16], 0
		jnz	short loc_1C797
		jmp	loc_1C624

loc_1C797:
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, [bp+var_10]
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_1C574		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C7B7		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		cmp	byte_77488, 0
		jz	short loc_1C7C8
		xor	ax, ax
		jmp	loc_1C897

loc_1C7C8:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 1000h
		jbe	short loc_1C7DB
		push	0D119h
		call	sub_1DDFE
		pop	cx

loc_1C7DB:
		les	bx, [bp+arg_0]
		mov	si, es:[bx]
		movzx	eax, si
		mov	edx, dword_77470
		add	edx, eax
		cmp	edx, dword_7C9B0
		jle	short loc_1C84E
		mov	di, word ptr dword_7C9B0
		sub	di, word ptr dword_77470
		push	di
		mov	ax, word_7745C
		add	ax, word ptr dword_77470
		push	word_7745E
		push	ax
		push	large word_7745C
		call	sub_37C3
		add	sp, 0Ah
		push	large 0FFFFFFFFh
		movzx	eax, di
		mov	edx, dword_7C9B0
		sub	edx, eax
		push	edx
		mov	ax, word_7745C
		add	ax, di
		push	word_7745E
		push	ax
		push	word_77484
		call	StreamReader_ReadTyped_6C4F3
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	dword_7C9B0, eax
		mov	dword_77470, 0

loc_1C84E:
		movzx	eax, si
		mov	edx, dword_7747C
		add	edx, eax
		cmp	edx, dword_7746C
		jle	short loc_1C86E
		mov	si, word ptr dword_7746C
		sub	si, word ptr dword_7747C
		mov	byte_77488, 1

loc_1C86E:
		push	si
		mov	ax, word_7745C
		add	ax, word ptr dword_77470
		push	word_7745E
		push	ax
		push	large [bp+arg_4]
		call	sub_37C3
		add	sp, 0Ah
		movzx	eax, si
		add	dword_77470, eax
		add	dword_7747C, eax
		mov	ax, si

loc_1C897:
		pop	di
		pop	si
		pop	bp
		retf	8
sub_1C7B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C89D		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 1000h
		jbe	short loc_1C8B4
		push	0D121h
		call	sub_1DDFE
		pop	cx

loc_1C8B4:
		les	bx, [bp+arg_0]
		mov	si, es:[bx]
		movzx	eax, si
		mov	edx, dword_77474
		add	edx, eax
		cmp	edx, dword_7C9B4
		jle	short loc_1C8EF
		push	large 0FFFFFFFFh
		push	large dword_77474
		push	large word_77460
		push	word_77486
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		mov	dword_77474, 0

loc_1C8EF:
		push	si
		push	large [bp+arg_4]
		mov	ax, word_77460
		add	ax, word ptr dword_77474
		push	word_77462
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		movzx	eax, si
		add	dword_77478, eax
		add	dword_77474, eax
		mov	ax, si
		pop	si
		pop	bp
		retf	8
sub_1C89D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C91D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word_77484, si
		mov	ax, [bp+arg_2]
		mov	word_77486, ax
		mov	dword_77470, 0
		mov	dword_77474, 0
		mov	dword_77478, 0
		mov	byte_77488, 0
		mov	dword_7747C, 0
		mov	dword_77480, 0
		mov	dword_7C9B4, 0F000h
		mov	dword_7C9B0, 0F800h
		push	si
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7C7BA, eax
		mov	dword_7746C, eax
		push	1
		push	0
		push	2
		push	large dword_7C9B4
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_77462, dx
		mov	word_77460, ax
		push	1
		push	0
		push	2
		push	large dword_7C9B0
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_7745E, dx
		mov	word_7745C, ax
		push	large 0FFFFFFFFh
		push	large dword_7C9B0
		push	dx
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	dword_7C9B0, eax
		push	seg seg044
		push	offset sub_1C7B7
		push	seg seg044
		push	offset sub_1C89D
		push	large dword_7748F
		call	sub_70EEB
		movzx	eax, ax
		cmp	eax, 0
		jz	short loc_1CA03
		push	0D122h
		call	sub_1DDFE
		pop	cx

loc_1CA03:
		mov	dword_7C7BA, 0
		push	large 0FFFFFFFFh
		push	large dword_77474
		push	large word_77460
		push	word_77486
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		push	0
		push	2
		push	0D2Ch
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		push	0D30h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, dword_77478
sub_1C91D		endp

; START OF FUNCTION CHUNK FOR sub_1C91D
		db 66h, 0Fh
		movsb
; END OF FUNCTION CHUNK FOR sub_1C91D
seg044		ends
