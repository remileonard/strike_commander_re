seg058		segment	para public 'CODE' use16
		assume cs:seg058
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh

loc_287B1:
		db 5Fh, 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_287B6		proc far

var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		enter	20h, 0
		push	si
		push	di
		cld
		push	es
		push	ss
		pop	es
		mov	esi, [bp+arg_0]
		lea	edi, dword ptr [bp+var_C]
		mov	ecx, 6
		rep movsw
		pop	es
		mov	[bp+var_10], 140h
		mov	ax, [bp+arg_A]
		mov	bx, [bp+arg_E]
		cmp	ax, bx
		jle	short loc_287FC
		xchg	bx, ax
		mov	[bp+arg_A], ax
		mov	[bp+arg_E], bx
		mov	cx, [bp+arg_8]
		xchg	[bp+arg_C], cx
		mov	[bp+arg_8], cx
		mov	cx, [bp+arg_10]
		xchg	[bp+arg_12], cx
		mov	[bp+arg_10], cx

loc_287FC:
		mov	cx, [bp+arg_E]
		sub	cx, [bp+arg_A]
		jo	short loc_2885F
		mov	[bp+var_14], cx
		mov	cx, [bp+arg_C]
		sub	cx, [bp+arg_8]
		jo	short loc_2885F
		mov	[bp+var_12], cx
		mov	cx, [bp+arg_12]
		sub	cx, [bp+arg_10]
		jo	short loc_2885F
		mov	[bp+var_16], cx
		mov	cx, [bp+arg_8]
		mov	dx, [bp+arg_C]
		cmp	cx, dx
		mov	[bp+var_1A], 0
		jz	short loc_2883F
		mov	[bp+var_1A], 1
		jle	short loc_2883F
		xchg	dx, cx
		neg	[bp+var_1A]

loc_2883F:
		mov	[bp+var_1C], dx
		sub	[bp+var_1C], cx
		mov	ax, [bp+arg_A]
		cmp	ax, [bp+var_2]
		jg	short loc_2885F
		mov	bx, [bp+arg_E]
		cmp	bx, [bp+var_6]
		jl	short loc_2885F
		cmp	cx, [bp+var_4]
		jg	short loc_2885F
		cmp	dx, [bp+var_8]
		jge	short loc_28862

loc_2885F:
		jmp	loc_28A1A

loc_28862:
		mov	cx, [bp+var_6]
		mov	dx, [bp+arg_A]
		mov	ax, cx
		sub	ax, dx
		jle	short loc_28892
		mov	[bp+arg_A], cx
		mov	cx, [bp+arg_E]
		sub	cx, dx
		push	ax
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_8]
		imul	dx
		idiv	cx
		add	[bp+arg_8], ax
		pop	ax
		mov	dx, [bp+arg_12]
		sub	dx, [bp+arg_10]
		imul	dx
		idiv	cx
		add	[bp+arg_10], ax

loc_28892:
		mov	cx, [bp+var_8]
		mov	dx, [bp+arg_8]
		mov	ax, cx
		sub	ax, dx
		jg	short loc_288A7
		mov	cx, [bp+var_4]
		mov	ax, cx
		sub	ax, dx
		jge	short loc_288D5

loc_288A7:
		mov	[bp+arg_8], cx
		mov	cx, [bp+arg_C]
		sub	cx, dx
		push	ax
		mov	dx, [bp+arg_E]
		sub	dx, [bp+arg_A]
		imul	dx
		idiv	cx
		add	[bp+arg_A], ax
		pop	ax
		mov	dx, [bp+arg_12]
		sub	dx, [bp+arg_10]
		imul	dx
		idiv	cx
		add	[bp+arg_10], ax
		mov	ax, [bp+arg_A]
		cmp	ax, [bp+var_2]
		jg	loc_28A1A

loc_288D5:
		mov	cx, [bp+var_2]
		mov	dx, [bp+arg_E]
		mov	ax, dx
		sub	ax, cx
		jle	short loc_28905
		mov	[bp+arg_E], cx
		mov	cx, dx
		sub	cx, [bp+arg_A]
		push	ax
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_8]
		imul	dx
		idiv	cx
		sub	[bp+arg_C], ax
		pop	ax
		mov	dx, [bp+arg_12]
		sub	dx, [bp+arg_10]
		imul	dx
		idiv	cx
		sub	[bp+arg_12], ax

loc_28905:
		mov	cx, [bp+var_8]
		mov	dx, [bp+arg_C]
		mov	ax, dx
		sub	ax, cx
		jl	short loc_2891A
		mov	cx, [bp+var_4]
		mov	ax, dx
		sub	ax, cx
		jle	short loc_28948

loc_2891A:
		mov	[bp+arg_C], cx
		mov	cx, dx
		sub	cx, [bp+arg_8]
		push	ax
		mov	dx, [bp+arg_E]
		sub	dx, [bp+arg_A]
		imul	dx
		idiv	cx
		sub	[bp+arg_E], ax
		pop	ax
		mov	dx, [bp+arg_12]
		sub	dx, [bp+arg_10]
		imul	dx
		idiv	cx
		sub	[bp+arg_12], ax
		mov	ax, [bp+arg_E]
		cmp	ax, [bp+var_6]
		jl	loc_28A1A

loc_28948:
		mov	ax, [bp+arg_E]
		sub	ax, [bp+arg_A]
		mov	[bp+var_14], ax
		mov	ax, [bp+arg_C]
		sub	ax, [bp+arg_8]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_1C], ax
		mov	ax, [bp+arg_12]
		sub	ax, [bp+arg_10]
		mov	[bp+var_16], ax
		xor	ebx, ebx
		mov	bx, [bp+arg_A]
		imul	bx, bx, 140h
		mov	edi, [bp+arg_4]
		add	bx, [bp+arg_8]
		add	edi, ebx
		mov	ax, [bp+var_1C]
		cmp	ax, [bp+var_14]
		jb	short loc_289CF
		movsx	ecx, [bp+var_1C]
		or	cx, cx
		jle	short loc_2899D
		mov	ax, [bp+var_16]
		shl	eax, 10h
		cdq
		idiv	ecx
		mov	[bp+var_20], eax

loc_2899D:
		mov	si, [bp+var_1C]
		mov	dx, [bp+var_14]
		mov	ax, [bp+arg_10]
		shl	eax, 10h
		mov	ax, 8000h
		jmp	short loc_289B6

loc_289AF:
		add	edi, [bp+var_1A]
		dec	cx
		jle	short loc_28A1A

loc_289B6:
		shld	ebx, eax, 10h
		mov	[edi], bl
		add	eax, [bp+var_20]
		sub	si, dx
		jg	short loc_289AF
		add	edi, [bp+var_10]
		add	si, [bp+var_1C]
		jmp	short loc_289AF

loc_289CF:
		movsx	ecx, [bp+var_14]
		or	cx, cx
		jle	short loc_289E8
		mov	ax, [bp+var_16]
		shl	eax, 10h
		cdq
		idiv	ecx
		mov	[bp+var_20], eax

loc_289E8:
		mov	si, [bp+var_14]
		mov	dx, [bp+var_1C]
		mov	ax, [bp+arg_10]
		shl	eax, 10h
		mov	ax, 8000h
		jmp	short loc_28A01
		add	edi, [bp+var_10]
		dec	cx
		jle	short loc_28A1A

loc_28A01:
		shld	ebx, eax, 10h
		mov	[edi], bl
		add	eax, [bp+var_20]
		sub	si, dx
sub_287B6		endp

; START OF FUNCTION CHUNK FOR sub_287B6
		db 7Fh
; END OF FUNCTION CHUNK FOR sub_287B6
seg058		ends
