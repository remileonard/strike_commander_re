seg142		segment	para public 'CODE' use16
		assume cs:seg142
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38DC0		proc far

var_2D8		= word ptr -2D8h
var_2D6		= word ptr -2D6h
var_2D4		= word ptr -2D4h
var_2D2		= word ptr -2D2h
var_2D0		= dword ptr -2D0h
var_2CC		= word ptr -2CCh
var_2CA		= word ptr -2CAh
var_2C8		= word ptr -2C8h
var_2C6		= word ptr -2C6h
var_2C4		= word ptr -2C4h
var_2C2		= word ptr -2C2h
var_2C0		= word ptr -2C0h
var_2BE		= word ptr -2BEh
var_2BC		= dword ptr -2BCh
var_2B8		= dword ptr -2B8h
var_2B0		= word ptr -2B0h
var_2AE		= dword ptr -2AEh
var_2AA		= word ptr -2AAh
var_2A8		= word ptr -2A8h
var_2A6		= word ptr -2A6h
var_2A4		= word ptr -2A4h
var_2A2		= dword ptr -2A2h
var_29E		= dword ptr -29Eh
var_29A		= dword ptr -29Ah
var_296		= dword ptr -296h
var_292		= word ptr -292h
var_152		= word ptr -152h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		enter	2D8h, 0
		push	si
		push	di
		push	ds
		movsx	esi, [bp+arg_C]
		movsx	edi, [bp+arg_E]
		or	esi, esi
		jz	short loc_38DDB
		or	edi, edi
		jnz	short loc_38DDE

loc_38DDB:
		jmp	loc_391B8

loc_38DDE:
		mov	eax, 8000h
		jns	short loc_38DE8
		dec	eax

loc_38DE8:
		mov	[bp+var_2D0], eax
		mov	eax, 1000000h
		cdq
		idiv	esi
		mov	[bp+var_296], eax
		or	eax, eax
		jns	short loc_38E05
		neg	eax

loc_38E05:
		mov	[bp+var_29E], eax
		shr	eax, 10h
		cmp	ax, 1
		jle	short loc_38E23
		test	[bp+arg_C], 0FFFFh
		jnz	short loc_38E23
		mov	dx, [bp+arg_2]
		add	dx, ax
		dec	dx
		mov	[bp+arg_2], dx

loc_38E23:
		mov	eax, 1000000h
		cdq
		idiv	edi
		mov	[bp+var_29A], eax
		or	eax, eax
		jns	short loc_38E3B
		neg	eax

loc_38E3B:
		mov	[bp+var_2A2], eax
		xor	ax, ax
		shl	si, 1
		seta	al
		sbb	ax, 0
		mov	[bp+var_2CA], ax
		xor	ax, ax
		shl	di, 1
		seta	al
		sbb	ax, 0
		mov	[bp+var_2CC], ax
		movsx	eax, [bp+arg_E]
		shl	eax, 8
		mov	[bp+var_2AE], eax
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_12]
		mov	cx, 6
		rep movsw
		mov	bx, [bp+var_10]
		mov	ax, [bx+2]
		sub	ax, [bx]
		imul	[bp+var_2CC]
		mov	[bp+var_2A4], ax
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 2
		cmp	bx, [si+4]
		jb	short loc_38E9A
		jmp	loc_391B8

loc_38E9A:
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
		jns	short loc_38EC6
		xchg	dx, ax
		neg	bx

loc_38EC6:
		mov	[bp+var_2D2], ax
		mov	[bp+var_2D4], dx
		mov	ax, [bp+var_2D2]
		imul	bx
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, cx
		cmp	ax, [bp+var_A]
		jg	short loc_38F5E
		mov	ax, [si]
		inc	ax
		imul	bx
		mov	al, ah
		mov	ah, dl
		dec	ax
		add	ax, cx
		cmp	ax, [bp+var_E]
		jl	short loc_38F5E
		mov	bx, [bp+arg_E]
		mov	cx, [bp+arg_4]
		mov	ax, [si+4]
		mov	dx, [si+6]
		or	bx, bx
		jns	short loc_38F05
		xchg	dx, ax
		neg	bx

loc_38F05:
		mov	[bp+var_2D6], ax
		mov	[bp+var_2D8], dx
		movsx	eax, word ptr [si+4]
		neg	eax
		mov	[bp+var_2C0], ax
		dec	[bp+var_2C0]
		shl	eax, 10h
		sub	eax, [bp+var_2A2]
		add	eax, [bp+var_2D0]
		mov	[bp+var_2BC], eax
		mov	ax, [bp+var_2D6]
		imul	bx
		mov	al, ah
		mov	ah, dl
		neg	ax
		add	ax, cx
		mov	[bp+var_2D6], ax
		cmp	ax, [bp+var_8]
		jg	short loc_38F5E
		mov	ax, [bp+var_2D8]
		inc	ax
		imul	bx
		mov	al, ah
		mov	ah, dl
		dec	ax
		add	ax, cx
		mov	[bp+var_2D8], ax
		cmp	ax, [bp+var_C]
		jge	short loc_38F61

loc_38F5E:
		jmp	loc_391B8

loc_38F61:
		mov	ax, [bp+var_2D6]
		test	[bp+var_2CC], 0FFFFh
		jns	short loc_38F71
		mov	ax, [bp+var_2D8]

loc_38F71:
		shl	eax, 10h
		add	eax, [bp+var_2D0]
		sub	eax, [bp+var_2AE]
		mov	[bp+var_2B8], eax
		xor	ecx, ecx
		lea	si, [si+8]

loc_38F8A:
		lodsw
		or	ax, ax
		jz	loc_391B8
		mov	cx, ax
		lodsw
		mov	bx, ax
		lodsw
		cmp	ax, [bp+var_2C0]
		jz	short loc_38FED
		cmp	ax, word ptr [bp+var_2BC+2]
		jl	short loc_38FCC
		mov	edi, [bp+var_2AE]
		mov	dx, ax
		sub	dx, [bp+var_2C0]

loc_38FAE:
		add	[bp+var_2B8], edi
		dec	dx
		jnz	short loc_38FAE
		mov	edi, [bp+var_2A2]

loc_38FBB:
		add	[bp+var_2BC], edi
		cmp	ax, word ptr [bp+var_2BC+2]
		jg	short loc_38FBB
		mov	[bp+var_2C0], ax
		jmp	short loc_38FED

loc_38FCC:
		shr	cx, 1
		jb	short loc_38FD4
		add	si, cx
		jmp	short loc_38FEB

loc_38FD4:
		mov	bx, cx

loc_38FD6:
		lodsb
		shr	al, 1
		cbw
		jb	short loc_38FE4
		add	si, ax
		sub	bx, ax
		jnz	short loc_38FD6
		jmp	short loc_38FEB

loc_38FE4:
		sub	bx, ax
		lodsb
		or	bx, bx
		jnz	short loc_38FD6

loc_38FEB:
		jmp	short loc_38F8A

loc_38FED:
		mov	ax, bx
		imul	[bp+arg_C]
		mov	al, ah
		mov	ah, dl
		add	ax, [bp+arg_2]
		mov	[bp+var_2B0], ax
		push	ss
		pop	es
		lea	di, [bp+var_152]
		shr	cx, 1
		mov	[bp+var_2AA], cx
		jb	short loc_3901A
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh
		rep movsb
		jmp	short loc_39053

loc_3901A:
		mov	bx, cx

loc_3901C:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_39037
		ror	ecx, 2
		rep movsd
		shr	ecx, 1Eh
		rep movsb
		sub	bx, ax
		jnz	short loc_3901C
		jmp	short loc_39053

loc_39037:
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
		jnz	short loc_3901C

loc_39053:
		push	ds
		push	si
		push	large [bp+var_2B8]
		push	large [bp+var_2BC]
		push	ss
		pop	ds
		mov	ax, 1
		cmp	word ptr [bp+var_2A2+2], 0
		jnz	short loc_39081
		mov	eax, [bp+var_2B8]
		add	eax, [bp+var_2AE]
		shr	eax, 10h
		sub	ax, word ptr [bp+var_2B8+2]
		jns	short loc_39081
		neg	ax

loc_39081:
		mov	[bp+var_2BE], ax
		mov	ax, [bp+arg_C]
		or	ax, ax
		jns	short loc_3908F
		std
		neg	ax

loc_3908F:
		mul	[bp+var_2AA]
		add	ax, 80h
		adc	dx, 0
		mov	al, ah
		mov	ah, dl
		mov	[bp+var_2C2], ax
		or	ax, ax
		jz	loc_391A8
		mov	es, [bp+var_12]
		mov	[bp+var_2C4], 0

loc_390B0:
		mov	ax, word ptr [bp+var_2B8+2]
		cmp	ax, [bp+var_C]
		jl	loc_39198
		cmp	ax, [bp+var_8]
		jg	loc_39198
		cmp	[bp+var_2C4], 0
		jz	short loc_390E2

loc_390C9:
		mov	si, [bp+var_2A8]
		mov	di, [bp+var_2A6]
		mov	cx, [bp+var_2C8]
		rep movsb
		mov	di, [bp+var_2A4]
		add	[bp+var_2A6], di
		jmp	loc_39198

loc_390E2:
		mov	bx, word ptr [bp+var_2B8+2]
		shl	bx, 1
		add	bx, [bp+var_10]
		mov	di, [bx]
		mov	[bp+var_2A6], di
		mov	bx, [bp+var_2B0]
		mov	edx, [bp+var_29E]
		lea	si, [bp+var_152]
		shl	esi, 10h
		mov	cx, [bp+var_2C2]
		test	[bp+arg_C], 0FFFFh
		jns	short loc_3913D
		mov	ax, bx
		sub	ax, [bp+var_A]
		jle	short loc_39125
		sub	bx, ax
		sub	cx, ax
		cwde
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_29E]

loc_39125:
		mov	[bp+var_2C6], bx
		add	[bp+var_2A6], bx
		mov	ax, bx
		sub	ax, cx
		inc	ax
		neg	ax
		add	ax, [bp+var_E]
		jle	short loc_3913B
		sub	cx, ax

loc_3913B:
		jmp	short loc_39169

loc_3913D:
		mov	ax, [bp+var_E]
		sub	ax, bx
		jle	short loc_39155
		add	bx, ax
		sub	cx, ax
		cwde
		mul	edx
		add	esi, eax
		mov	edx, [bp+var_29E]

loc_39155:
		mov	[bp+var_2C6], bx
		add	[bp+var_2A6], bx
		mov	ax, bx
		add	ax, cx
		dec	ax
		sub	ax, [bp+var_A]
		jle	short loc_39169
		sub	cx, ax

loc_39169:
		or	cx, cx
		jle	short loc_391A8
		lea	di, [bp+var_292]
		add	di, bx
		mov	[bp+var_2A8], di
		mov	[bp+var_2C8], cx

loc_3917B:
		ror	esi, 10h
		mov	al, [si]
		mov	[di], al
		rol	esi, 10h
		add	di, [bp+var_2CA]
		add	esi, edx
		dec	cx
		jnz	short loc_3917B
		inc	[bp+var_2C4]
		jmp	loc_390C9

loc_39198:
		mov	ax, [bp+var_2CC]
		add	word ptr [bp+var_2B8+2], ax
		dec	[bp+var_2BE]
		jnz	loc_390B0

loc_391A8:
		cld
		pop	[bp+var_2BC]
sub_38DC0		endp

; START OF FUNCTION CHUNK FOR sub_38DC0
		db 66h, 8Fh
; END OF FUNCTION CHUNK FOR sub_38DC0
seg142		ends
