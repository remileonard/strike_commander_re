seg188		segment	para public 'CODE' use16
		assume cs:seg188
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0A6h, 0FEh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6A762		proc far

var_2DA		= word ptr -2DAh
var_2D8		= word ptr -2D8h
var_2D6		= word ptr -2D6h
var_2D4		= word ptr -2D4h
var_2D2		= dword ptr -2D2h
var_2CE		= word ptr -2CEh
var_2CC		= word ptr -2CCh
var_2CA		= word ptr -2CAh
var_2C8		= word ptr -2C8h
var_2C6		= word ptr -2C6h
var_2C4		= word ptr -2C4h
var_2C2		= word ptr -2C2h
var_2C0		= word ptr -2C0h
var_2BE		= dword ptr -2BEh
var_2BA		= dword ptr -2BAh
var_2B2		= word ptr -2B2h
var_2B0		= dword ptr -2B0h
var_2AC		= word ptr -2ACh
var_2AA		= word ptr -2AAh
var_2A8		= word ptr -2A8h
var_2A6		= word ptr -2A6h
var_2A4		= dword ptr -2A4h
var_2A0		= dword ptr -2A0h
var_29C		= dword ptr -29Ch
var_298		= dword ptr -298h
var_294		= word ptr -294h
var_154		= word ptr -154h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_14		= word ptr  1Ah
arg_16		= word ptr  1Ch

		enter	2DAh, 0
		push	si
		push	di
		push	ds
		movsx	esi, [bp+arg_C]
		movsx	edi, [bp+arg_E]
		or	esi, esi
		jz	short loc_6A77D
		or	edi, edi
		jnz	short loc_6A780

loc_6A77D:
		jmp	loc_6AB87

loc_6A780:
		mov	eax, 8000h
		jns	short loc_6A78A
		dec	eax

loc_6A78A:
		mov	[bp+var_2D2], eax
		mov	eax, 1000000h
		cdq
		idiv	esi
		mov	[bp+var_298], eax
		or	eax, eax
		jns	short loc_6A7A7
		neg	eax

loc_6A7A7:
		mov	[bp+var_2A0], eax
		shr	eax, 10h
		cmp	ax, 1
		jle	short loc_6A7C5
		test	[bp+arg_C], 0FFFFh
		jnz	short loc_6A7C5
		mov	dx, [bp+arg_2]
		add	dx, ax
		dec	dx
		mov	[bp+arg_2], dx

loc_6A7C5:
		mov	eax, 1000000h
		cdq
		idiv	edi
		mov	[bp+var_29C], eax
		or	eax, eax
		jns	short loc_6A7DD
		neg	eax

loc_6A7DD:
		mov	[bp+var_2A4], eax
		xor	ax, ax
		shl	si, 1
		seta	al
		sbb	ax, 0
		mov	[bp+var_2CC], ax
		xor	ax, ax
		shl	di, 1
		seta	al
		sbb	ax, 0
		mov	[bp+var_2CE], ax
		movsx	eax, [bp+arg_E]
		shl	eax, 8
		mov	[bp+var_2B0], eax
		mov	ax, [bp+arg_14]
		add	ax, [bp+arg_16]
		mov	[bp+var_2], ax
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_14]
		mov	cx, 6
		rep movsw
		mov	bx, [bp+var_12]
		mov	ax, [bx+2]
		sub	ax, [bx]
		imul	[bp+var_2CE]
		mov	[bp+var_2A6], ax
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 2
		cmp	bx, [si+4]
		jb	short loc_6A845
		jmp	loc_6AB87

loc_6A845:
		mov	ax, ds
		movzx	eax, ax
		shl	eax, 4
		add	ax, si
		add	eax, [bx+si]
		mov	si, ax
		and	si, 0Fh
		shr	eax, 4
		mov	ds, ax
		mov	bx, [bp+arg_C]
		mov	cx, [bp+arg_2]
		mov	ax, [si+2]
		mov	dx, [si]
		or	bx, bx
		jns	short loc_6A871
		xchg	dx, ax
		neg	bx

loc_6A871:
		mov	[bp+var_2D4], ax
		mov	[bp+var_2D6], dx
		mov	ax, [bp+var_2D4]
		imul	bx
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, cx
		cmp	ax, [bp+var_C]
		jg	short loc_6A909
		mov	ax, [si]
		inc	ax
		imul	bx
		mov	al, ah
		mov	ah, dl
		dec	ax
		add	ax, cx
		cmp	ax, [bp+var_10]
		jl	short loc_6A909
		mov	bx, [bp+arg_E]
		mov	cx, [bp+arg_4]
		mov	ax, [si+4]
		mov	dx, [si+6]
		or	bx, bx
		jns	short loc_6A8B0
		xchg	dx, ax
		neg	bx

loc_6A8B0:
		mov	[bp+var_2D8], ax
		mov	[bp+var_2DA], dx
		movsx	eax, word ptr [si+4]
		neg	eax
		mov	[bp+var_2C2], ax
		dec	[bp+var_2C2]
		shl	eax, 10h
		sub	eax, [bp+var_2A4]
		add	eax, [bp+var_2D2]
		mov	[bp+var_2BE], eax
		mov	ax, [bp+var_2D8]
		imul	bx
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, cx
		mov	[bp+var_2D8], ax
		cmp	ax, [bp+var_A]
		jg	short loc_6A909
		mov	ax, [bp+var_2DA]
		inc	ax
		imul	bx
		mov	al, ah
		mov	ah, dl
		dec	ax
		add	ax, cx
		mov	[bp+var_2DA], ax
		cmp	ax, [bp+var_E]
		jge	short loc_6A90C

loc_6A909:
		jmp	loc_6AB87

loc_6A90C:
		mov	ax, [bp+var_2D8]
		test	[bp+var_2CE], 0FFFFh
		jns	short loc_6A91C
		mov	ax, [bp+var_2DA]

loc_6A91C:
		shl	eax, 10h
		add	eax, [bp+var_2D2]
		sub	eax, [bp+var_2B0]
		mov	[bp+var_2BA], eax
		xor	ecx, ecx
		lea	si, [si+8]

loc_6A935:
		lodsw
		or	ax, ax
		jz	loc_6AB87
		mov	cx, ax
		lodsw
		mov	bx, ax
		lodsw
		cmp	ax, [bp+var_2C2]
		jz	short loc_6A998
		cmp	ax, word ptr [bp+var_2BE+2]
		jl	short loc_6A977
		mov	edi, [bp+var_2B0]
		mov	dx, ax
		sub	dx, [bp+var_2C2]

loc_6A959:
		add	[bp+var_2BA], edi
		dec	dx
		jnz	short loc_6A959
		mov	edi, [bp+var_2A4]

loc_6A966:
		add	[bp+var_2BE], edi
		cmp	ax, word ptr [bp+var_2BE+2]
		jge	short loc_6A966
		mov	[bp+var_2C2], ax
		jmp	short loc_6A998

loc_6A977:
		shr	cx, 1
		jb	short loc_6A97F
		add	si, cx
		jmp	short loc_6A996

loc_6A97F:
		mov	bx, cx

loc_6A981:
		lodsb
		shr	al, 1
		cbw
		jb	short loc_6A98F
		add	si, ax
		sub	bx, ax
		jnz	short loc_6A981
		jmp	short loc_6A996

loc_6A98F:
		sub	bx, ax
		lodsb
		or	bx, bx
		jnz	short loc_6A981

loc_6A996:
		jmp	short loc_6A935

loc_6A998:
		mov	ax, bx
		imul	[bp+arg_C]
		mov	al, ah
		mov	ah, dl
		add	ax, [bp+arg_2]
		mov	[bp+var_2B2], ax
		push	ss
		pop	es
		lea	di, [bp+var_154]
		shr	cx, 1
		mov	[bp+var_2AC], cx
		jb	short loc_6A9C5
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh
		rep movsb
		jmp	short loc_6A9FE

loc_6A9C5:
		mov	bx, cx

loc_6A9C7:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_6A9E2
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh
		rep movsb
		sub	bx, ax
		jnz	short loc_6A9C7
		jmp	short loc_6A9FE

loc_6A9E2:
		sub	bx, cx
		lodsb
		mov	ah, al
		push	ax
		shl	eax, 10h
		pop	ax
		ror	ecx, 2
		rep stosd
		shr	ecx, 1Eh
		rep stosb
		or	bx, bx
		jnz	short loc_6A9C7

loc_6A9FE:
		push	ds
		push	si
		push	large [bp+var_2BA]
		push	large [bp+var_2BE]
		push	ss
		pop	ds
		mov	ax, 1
		cmp	word ptr [bp+var_2A4+2], 0
		jnz	short loc_6AA2C
		mov	eax, [bp+var_2BA]
		add	eax, [bp+var_2B0]
		shr	eax, 10h
		sub	ax, word ptr [bp+var_2BA+2]
		jns	short loc_6AA2C
		neg	ax

loc_6AA2C:
		mov	[bp+var_2C0], ax
		mov	ax, [bp+arg_C]
		or	ax, ax
		jns	short loc_6AA3A
		std
		neg	ax

loc_6AA3A:
		mul	[bp+var_2AC]
		add	ax, 80h
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	[bp+var_2C4], ax
		or	ax, ax
		jz	loc_6AB77
		mov	es, [bp+var_14]
		mov	[bp+var_2C6], 0

loc_6AA5B:
		mov	ax, word ptr [bp+var_2BA+2]
		cmp	ax, [bp+var_E]
		jl	loc_6AB67
		cmp	ax, [bp+var_A]
		jg	loc_6AB67
		cmp	[bp+var_2C6], 0
		jz	short loc_6AAB1

loc_6AA74:
		mov	si, [bp+var_2AA]
		mov	di, [bp+var_2A8]
		mov	ah, byte ptr [bp+arg_14]
		mov	cx, [bp+var_2CA]

loc_6AA83:
		lodsb
		cmp	al, ah
		jnb	short loc_6AA96

loc_6AA88:
		stosb
		loop	short loc_6AA83
		mov	di, [bp+var_2A6]
		add	[bp+var_2A8], di
		jmp	loc_6AB67

loc_6AA96:
		cmp	al, byte ptr [bp+var_2]
		jnb	short loc_6AA88
		mov	dl, al
		sub	dl, ah
		shl	dx, 8
		mov	al, es:[di]
		lds	bx, [bp+arg_10]
		add	bx, dx
		xlatb
		mov	dx, ss
		mov	ds, dx
		jmp	short loc_6AA88

loc_6AAB1:
		mov	bx, word ptr [bp+var_2BA+2]
		shl	bx, 1
		add	bx, [bp+var_12]
		mov	di, [bx]
		mov	[bp+var_2A8], di
		mov	bx, [bp+var_2B2]
		mov	edx, [bp+var_2A0]
		lea	si, [bp+var_154]
		shl	esi, 10h
		mov	cx, [bp+var_2C4]
		test	[bp+arg_C], 0FFFFh
		jns	short loc_6AB0C
		mov	ax, bx
		sub	ax, [bp+var_C]
		jle	short loc_6AAF4
		sub	bx, ax
		sub	cx, ax
		cwde
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_2A0]

loc_6AAF4:
		mov	[bp+var_2C8], bx
		add	[bp+var_2A8], bx
		mov	ax, bx
		sub	ax, cx
		inc	ax
		neg	ax
		add	ax, [bp+var_10]
		jle	short loc_6AB0A
		sub	cx, ax

loc_6AB0A:
		jmp	short loc_6AB38

loc_6AB0C:
		mov	ax, [bp+var_10]
		sub	ax, bx
		jle	short loc_6AB24
		add	bx, ax
		sub	cx, ax
		cwde
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_2A0]

loc_6AB24:
		mov	[bp+var_2C8], bx
		add	[bp+var_2A8], bx
		mov	ax, bx
		add	ax, cx
		dec	ax
		sub	ax, [bp+var_C]
		jle	short loc_6AB38
		sub	cx, ax

loc_6AB38:
		or	cx, cx
		jle	short loc_6AB77
		lea	di, [bp+var_294]
		add	di, bx
		mov	[bp+var_2AA], di
		mov	[bp+var_2CA], cx

loc_6AB4A:
		ror	esi, 10h
		mov	al, [si]
		mov	[di], al
		rol	esi, 10h
		add	di, [bp+var_2CC]
		add	esi, edx
		dec	cx
		jnz	short loc_6AB4A
		inc	[bp+var_2C6]
		jmp	loc_6AA74

loc_6AB67:
		mov	ax, [bp+var_2CE]
		add	word ptr [bp+var_2BA+2], ax
		dec	[bp+var_2C0]
		jnz	loc_6AA5B

loc_6AB77:
		cld
		pop	[bp+var_2BE]
sub_6A762		endp

; START OF FUNCTION CHUNK FOR sub_6A762
		db 66h, 8Fh, 86h
; END OF FUNCTION CHUNK FOR sub_6A762
seg188		ends
