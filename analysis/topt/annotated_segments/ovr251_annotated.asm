ovr251		segment	para public 'OVERLAY' use16
		assume cs:ovr251
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0460		proc far

var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C0482
		push	2Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_C0482
		jmp	loc_C0584

loc_C0482:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_14A5A
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 40ACh
		mov	dword ptr [si+24h], 0
		mov	byte ptr [si+28h], 2
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		mov	ax, [bp+arg_E]
		mov	[si+20h], ax
		mov	ax, [bp+arg_C]
		mov	[si+1Eh], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_6], eax
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		mov	[bp+var_7], al
		mov	eax, [bp+var_6]
		mov	[si+24h], eax
		mov	al, [bp+var_7]
		mov	[si+28h], al
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		mov	bx, [bp+var_2]
		mov	eax, [bx+6]
		mov	[si+2Ah], eax
		mov	ax, [si+20h]
		mov	dx, 0Eh
		imul	dx
		push	ax
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[si+22h], ax
		mov	di, [si+22h]
		lea	ax, [bp+arg_10]
		mov	[bp+var_A], ax
		jmp	short loc_C057A

loc_C051D:
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di], ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+2], ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+4], ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+6], ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+8], ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+0Ah], ax
		add	[bp+var_A], 2
		mov	bx, [bp+var_A]
		mov	ax, [bx-2]
		mov	[di+0Ch], ax
		add	di, 0Eh

loc_C057A:
		mov	ax, [bp+arg_E]
		dec	[bp+arg_E]
		or	ax, ax
		jnz	short loc_C051D

loc_C0584:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_C0460		endp

; START OF FUNCTION CHUNK FOR sub_C0460
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_C0460

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C058E		proc far

var_16		= word ptr -16h
var_14		= word ptr -14h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_143DD
		add	sp, 2
		mov	ax, [si+20h]
		mov	[bp+var_2], ax
		jmp	loc_C06CB

loc_C05AB:
		mov	ax, [bp+var_2]
		mov	dx, 0Eh
		imul	dx
		mov	dx, [si+22h]
		add	dx, ax
		mov	di, dx
		mov	bx, [si+1Eh]
		mov	ax, [bx]
		cmp	ax, [bp+var_2]
		jnz	short loc_C05FB
		push	word ptr [di+0Ah]
		push	0
		mov	al, [si+28h]
		push	ax
		push	word ptr [si+26h]
		push	word ptr [si+24h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+6]
		add	ax, [di+2]
		push	ax
		mov	ax, [si+4]
		add	ax, [di]
		push	ax
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_C0630

loc_C05FB:
		push	word ptr [di+8]
		push	0
		mov	al, [si+28h]
		push	ax
		push	word ptr [si+26h]
		push	word ptr [si+24h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [si+6]
		add	ax, [di+2]
		push	ax
		mov	ax, [si+4]
		add	ax, [di]
		push	ax
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch

loc_C0630:
		cmp	word ptr [di+0Ch], 0
		jnz	short loc_C0639
		jmp	loc_C06CB

loc_C0639:
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [di]
		inc	ax
		mov	[bp+var_4], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [di+2]
		mov	[bp+var_6], ax
		mov	bx, [si+1Eh]
		mov	ax, [bx]
		cmp	ax, [bp+var_2]
		jnz	short loc_C0661
		inc	[bp+var_4]
		inc	[bp+var_6]

loc_C0661:
		mov	ax, word_4BD04
		add	ax, 2
		mov	[bp+var_8], ax
		mov	[bp+var_16], 0
		mov	[bp+var_14], 0
		push	[bp+var_8]
		lea	ax, [bp+var_16]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		push	si
		mov	ax, word_4BD04
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		push	word_4BD04
		push	word_4BCB2
		push	word ptr [di+0Ch]
		push	[bp+var_6]
		push	[bp+var_4]
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		lea	ax, [bp+var_16]
		push	ax
		mov	ax, word_4BD04
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		lea	ax, [bp+var_16]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2

loc_C06CB:
		mov	ax, [bp+var_2]
		dec	[bp+var_2]
		or	ax, ax
		jz	short loc_C06D8
		jmp	loc_C05AB

loc_C06D8:
		push	si
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_C058E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C06E5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [si+20h]
		jmp	short loc_C073E

loc_C06F2:
		mov	ax, cx
		mov	dx, 0Eh
		imul	dx
		mov	dx, [si+22h]
		add	dx, ax
		mov	di, dx
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jge	short loc_C0729
		mov	ax, [di]
		add	ax, [di+4]
		cmp	ax, [bp+arg_2]
		jle	short loc_C0729
		mov	ax, [di+2]
		cmp	ax, [bp+arg_4]
		jge	short loc_C0729
		mov	ax, [di+2]
		add	ax, [di+6]
		cmp	ax, [bp+arg_4]
		jle	short loc_C0729
		mov	ax, 1
		jmp	short loc_C072B

loc_C0729:
		xor	ax, ax

loc_C072B:
		or	al, al
		jz	short loc_C073E
		mov	ax, [di+0Ah]
		cmp	ax, [di+8]
		jz	short loc_C073E
		mov	bx, [si+1Eh]
		mov	[bx], cx
		jmp	short loc_C0745

loc_C073E:
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	short loc_C06F2

loc_C0745:
		pop	di
		pop	si
		pop	bp
		retf
sub_C06E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0749		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C07BF
		mov	word ptr [si+0Eh], 40ACh
		push	word ptr [si+22h]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+22h], 0
		cmp	byte ptr [si+29h], 0
		jz	short loc_C0793
		cmp	dword ptr [si+24h], 0
		jz	short loc_C0793
		push	0
		mov	al, [si+28h]
		push	ax
		mov	ax, si
		add	ax, 24h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_C0793

loc_C0793:
		mov	dword ptr [si+24h], 0
		mov	byte ptr [si+29h], 0
		mov	dword ptr [si+2Ah], 0
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_C07BF
		push	si
		call	sub_39C
		add	sp, 2

loc_C07BF:
		pop	di
		pop	si
		pop	bp
		retf
sub_C0749		endp
ovr251		ends
