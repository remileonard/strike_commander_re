ovr243		segment	para public 'OVERLAY' use16
		assume cs:ovr243
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE0E0		proc far

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_E], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_10], dx
		mov	[bp+var_12], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_14], 0
		jmp	loc_BE26B

loc_BE14B:
		push	large 8
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_1C]
		mov	ah, 0
		mov	[bp+var_C], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ch]
		cmp	ax, [bp+var_C]
		jg	short loc_BE17D
		push	600Ah
		call	sub_13451
		add	sp, 2

loc_BE17D:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		mov	ax, [bp+var_C]
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_10]
		mov	dx, [bp+var_12]
		add	dx, es:[bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_8], eax
		mov	al, byte ptr [bp+var_1C+1]
		mov	ah, 0
		mov	[bp+var_A], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_1E], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Ch]
		cmp	ax, [bp+var_1E]
		jbe	short loc_BE1D8
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+80h]
		push	ax
		mov	ax, [bp+var_1E]
		mov	dx, 6
		imul	dx
		mov	dx, ax
		pop	ax
		add	ax, dx
		jmp	short loc_BE208

loc_BE1D8:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Ch]
		sub	[bp+var_1E], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Eh]
		cmp	ax, [bp+var_1E]
		jbe	short loc_BE206
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+82h]
		push	ax
		mov	ax, [bp+var_1E]
		mov	dx, 0Eh
		imul	dx
		mov	dx, ax
		pop	ax
		add	ax, dx
		jmp	short loc_BE208

loc_BE206:
		xor	ax, ax

loc_BE208:
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+26h], ax
		les	bx, word ptr [bp+var_8]
		cmp	word ptr es:[bx+26h], 0
		jnz	short loc_BE224
		push	600Bh
		call	sub_13451
		add	sp, 2

loc_BE224:
		lea	ax, [bp+var_1A]
		mov	[bp+var_20], ax
		mov	di, [bp+var_20]
		les	bx, word ptr [bp+var_8]
		mov	al, [di]
		mov	es:[bx+28h], al
		les	bx, word ptr [bp+var_8]
		mov	al, [di+1]
		mov	es:[bx+29h], al
		les	bx, word ptr [bp+var_8]
		mov	al, [di+2]
		mov	es:[bx+2Ah], al
		les	bx, word ptr [bp+var_8]
		mov	al, [di+3]
		mov	es:[bx+2Bh], al
		les	bx, word ptr [bp+var_8]
		mov	al, [di+4]
		mov	es:[bx+2Ch], al
		les	bx, word ptr [bp+var_8]
		mov	al, [di+5]
		mov	es:[bx+2Dh], al
		inc	[bp+var_14]

loc_BE26B:
		mov	ax, [bp+var_14]
		cmp	ax, [bp+var_E]
		jge	short loc_BE276
		jmp	loc_BE14B

loc_BE276:
		pop	di
		pop	si
		leave
		retf
sub_BE0E0		endp
ovr243		ends
