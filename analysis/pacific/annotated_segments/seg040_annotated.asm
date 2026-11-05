seg040		segment	para public 'CODE' use16
		assume cs:seg040
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0EFh, 88h, 0DCh, 0FEh, 0C0h, 0EFh, 0FBh

loc_1BA37:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BA39		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1BA39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BA41		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	al, dl
		mov	ah, 0
		mov	[si+6Ch], ax
		or	dl, dl
		jz	short loc_1BA5E
		cmp	dl, 1
		jnz	short loc_1BA6A

loc_1BA5E:
		push	dx
		push	si
		call	sub_1792C
		add	sp, 4
		jmp	short loc_1BAD6

loc_1BA6A:
		mov	eax, [si+54h]
		mov	[si+3Ch], eax
		mov	ax, [si+58h]
		mov	[bp+var_2], ax
		mov	ax, [si+5Ah]
		mov	[bp+var_4], ax
		mov	ax, [si+5Ch]
		mov	[bp+var_6], ax
		mov	ax, [si+5Eh]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+8], ax
		mov	ax, [bp+var_4]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_6]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_8]
		mov	[si+0Eh], ax
		mov	ax, [si+58h]
		mov	[bp+var_A], ax
		mov	ax, [si+5Ah]
		mov	[bp+var_C], ax
		mov	ax, [si+5Ch]
		mov	[bp+var_E], ax
		mov	ax, [si+5Eh]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[si+16h], ax
		mov	ax, [bp+var_C]
		mov	[si+18h], ax
		mov	ax, [bp+var_E]
		mov	[si+1Ah], ax
		mov	ax, [bp+var_10]
		mov	[si+1Ch], ax
		mov	byte ptr [si+20h], 1

loc_1BAD6:
		pop	si
		leave
		retf
sub_1BA41		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BAD9		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+6Ah]
		or	di, di
		jge	short loc_1BAF1
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_1BB0E

loc_1BAF1:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, di
		shl	bx, 8
		add	ax, bx

loc_1BB0E:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	large 40001h
		push	dx
		push	ax
		push	large 0FF00FFh
		push	word ptr [si+6Ch]
		push	0
		mov	al, [si+64h]
		push	ax
		push	large [si+60h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_6A762
		add	sp, 18h
sub_1BAD9		endp
seg040		ends
