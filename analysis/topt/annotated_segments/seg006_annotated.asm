seg006		segment	para public 'CODE' use16
		assume cs:seg006
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh, 8Bh, 0DCh, 36h, 83h, 47h, 4, 0FCh, 90h, 90h, 0E9h, 0B4h, 0FFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_545D		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	byte ptr [si+0B2h], 0
		jz	short loc_547D
		push	1600h
		call	sub_13451
		add	sp, 2

loc_547D:
		push	1
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 5453494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jz	short loc_5513
		push	0
		push	large 455A4953h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_54C4
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+0B5h], ax
		jmp	short loc_54CF

loc_54C4:
		push	1601h
		call	sub_13451
		add	sp, 2

loc_54CF:
		push	0
		push	large 5453494Ch
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_5513
		mov	byte ptr [si+0B2h], 1
		movzx	eax, word ptr [si+0B5h]
		push	eax
		push	ds
		mov	ax, si
		add	ax, 0B8h
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		push	ds
		mov	ax, si
		add	ax, 0B8h
		push	ax
		call	sub_993C
		add	sp, 4
		mov	[bp+var_1], al

loc_5513:
		mov	al, [si+0B2h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_5524
		cmp	word ptr [si+0B5h], 50h
		jbe	short loc_552F

loc_5524:
		push	1601h
		call	sub_13451
		add	sp, 2

loc_552F:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_545D		endp

; START OF FUNCTION CHUNK FOR sub_545D
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_545D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5538		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [di+0B2h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5555
		push	1602h
		call	sub_13451
		add	sp, 2

loc_5555:
		nop
		push	cs
		call	near ptr sub_57C3
		mov	al, 0
		mov	[di+0B3h], al
		mov	[di+0B4h], al
		jmp	short loc_55B2

loc_5566:
		test	word ptr [di+72h], 1
		jz	short loc_5581
		mov	eax, [di+76h]
		dec	eax
		cmp	[di+65h], eax
		jnz	short loc_557F
		inc	dword ptr [di+65h]
		jmp	short loc_557F

loc_557F:
		jmp	short loc_5581

loc_5581:
		mov	eax, [di+65h]
		cmp	eax, [di+76h]
		jl	short loc_5590
		mov	ax, 1
		jmp	short loc_5592

loc_5590:
		xor	ax, ax

loc_5592:
		or	ax, ax
		jz	short loc_559A
		pop	di
		pop	si
		pop	bp
		retf

loc_559A:
		movzx	eax, word ptr [di+0B5h]
		push	eax
		push	ds
		mov	ax, di
		add	ax, 0B8h
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah

loc_55B2:
		push	[bp+arg_2]
		mov	ax, di
		add	ax, 0B8h
		push	ax
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_5566
		jmp	short loc_5618

loc_55C9:
		test	word ptr [di+72h], 1
		jz	short loc_55E4
		mov	eax, [di+76h]
		dec	eax
		cmp	[di+65h], eax
		jnz	short loc_55E2
		inc	dword ptr [di+65h]
		jmp	short loc_55E2

loc_55E2:
		jmp	short loc_55E4

loc_55E4:
		mov	eax, [di+65h]
		cmp	eax, [di+76h]
		jl	short loc_55F3
		mov	ax, 1
		jmp	short loc_55F5

loc_55F3:
		xor	ax, ax

loc_55F5:
		or	ax, ax
		jz	short loc_55FD
		pop	di
		pop	si
		pop	bp
		retf

loc_55FD:
		movzx	eax, word ptr [di+0B5h]
		push	eax
		push	ds
		mov	ax, di
		add	ax, 0B8h
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		dec	[bp+arg_4]

loc_5618:
		cmp	[bp+arg_4], 0
		ja	short loc_55C9
		cmp	byte_49F22, 0
		jz	short loc_563D
		push	1
		mov	ax, di
		add	ax, 0B8h
		push	ax
		push	6052h
		call	StreamReader_ReadDispatch_411DE
		add	sp, 6
		mov	byte ptr [di+0B4h], 1

loc_563D:
		pop	di
		pop	si
		pop	bp
		retf
sub_5538		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5641		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+0B2h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_565D
		push	1602h
		call	sub_13451
		add	sp, 2

loc_565D:
		cmp	byte ptr [si+0B4h], 0
		jz	short loc_5687
		nop
		push	cs
		call	near ptr sub_57C3
		mov	byte ptr [si+0B3h], 0
		mov	al, [bp+arg_2]
		mov	[si+0B7h], al
		mov	word_48B8E, si
		push	seg seg006
		push	offset sub_568A
		call	sub_9EDB
		add	sp, 4

loc_5687:
		pop	si
		pop	bp
		retf
sub_5641		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_568A		proc far

var_E		= dword ptr -0Eh
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	6052h
		call	StreamReader_GetCapacity_4154E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_4], eax
		mov	bx, word_48B8E
		cmp	byte ptr [bx+0ADh], 0
		jz	short loc_56DE
		mov	bx, word_48B8E
		cmp	dword ptr [bx+0A8h], 0
		jz	short loc_56DE
		push	0
		mov	bx, word_48B8E
		mov	al, [bx+0ACh]
		push	ax
		mov	ax, word_48B8E
		add	ax, 0A8h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_56DE

loc_56DE:
		mov	bx, word_48B8E
		mov	dword ptr [bx+0A8h], 0
		mov	bx, word_48B8E
		mov	byte ptr [bx+0ADh], 0
		mov	bx, word_48B8E
		mov	dword ptr [bx+0AEh], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	bx, word_48B8E
		mov	al, [bx+0B7h]
		mov	[bp+var_9], al
		push	1
		push	0
		mov	al, [bp+var_9]
		push	ax
		push	large [bp+var_8]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	bx, word_48B8E
		mov	eax, [bp+var_E]
		mov	[bx+0A8h], eax
		mov	bx, word_48B8E
		mov	al, [bp+var_9]
		mov	[bx+0ACh], al
		mov	bx, word_48B8E
		mov	byte ptr [bx+0ADh], 1
		mov	bx, word_48B8E
		mov	dword ptr [bx+0AEh], 0
		mov	bx, word_48B8E
		mov	eax, [bp+var_8]
		mov	[bx+0AEh], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_4]
		push	0
		mov	bx, word_48B8E
		mov	al, [bx+0ACh]
		push	ax
		mov	bx, word_48B8E
		push	word ptr [bx+0AAh]
		push	word ptr [bx+0A8h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	6052h
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		push	6052h
		call	sub_4123E
		add	sp, 2
		mov	bx, word_48B8E
		mov	byte ptr [bx+0B3h], 1
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_568A		endp

; START OF FUNCTION CHUNK FOR sub_568A
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_568A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57C3		proc far
		push	bp
		mov	bp, sp
		call	sub_A07C
		pop	bp
		retf
sub_57C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57CD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 0B8h
		push	ax
		push	[bp+arg_2]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_5804
		cmp	byte ptr [si+0B3h], 0
		jz	short loc_5804
		cmp	dword ptr [si+0A8h], 0
		jz	short loc_5804
		cmp	byte ptr [si+0ADh], 0
		jz	short loc_5804
		mov	al, 1
		pop	si
		pop	bp
		retf

loc_5804:
		mov	al, 0
		pop	si
		pop	bp
		retf
sub_57CD		endp

; START OF FUNCTION CHUNK FOR sub_57CD
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_57CD

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_580C		proc far
		push	bp
		mov	bp, sp
		push	6052h
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		pop	bp
		retf
sub_580C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_581C		proc far
		push	bp
		mov	bp, sp
sub_581C		endp

; START OF FUNCTION CHUNK FOR sub_581C
		db 6Ah
; END OF FUNCTION CHUNK FOR sub_581C
seg006		ends
