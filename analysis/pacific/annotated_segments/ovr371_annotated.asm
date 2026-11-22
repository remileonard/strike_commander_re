ovr371		segment	para public 'OVERLAY' use16
		assume cs:ovr371
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D01F0		proc far

var_1E		= dword ptr -1Eh
var_19		= byte ptr -19h
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_4]
		push	[bp+arg_2]
		push	di
		call	sub_7844
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_D021B
		mov	eax, [di+61h]
		jmp	short loc_D021F

loc_D021B:
		mov	eax, [di+71h]

loc_D021F:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_D0232
		push	0FFEEh
		call	sub_1DDFE
		pop	cx

loc_D0232:
		cmp	[bp+arg_6], 3
		jz	short loc_D023B
		jmp	loc_D02C2

loc_D023B:
		cmp	[bp+var_4], 0FFFBh
		jge	short loc_D0284
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_8]
		jmp	loc_D0307

loc_D0284:
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_14]
		mov	[si], eax
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_10]
		jmp	short loc_D0307

loc_D02C2:
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	al, [bp+arg_6]
		mov	[bp+var_19], al
		push	1
		push	0
		push	ax
		push	large [bp+var_18]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1E+2], dx
		mov	word ptr [bp+var_1E], ax
		mov	eax, [bp+var_1E]
		mov	[si], eax
		mov	al, [bp+var_19]
		mov	[si+4], al
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_18]

loc_D0307:
		mov	[si+6], eax
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_2]
		push	di
		call	sub_75C8
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
sub_D01F0		endp
ovr371		ends
