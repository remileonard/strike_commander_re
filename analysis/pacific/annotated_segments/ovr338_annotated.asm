ovr338		segment	para public 'OVERLAY' use16
		assume cs:ovr338
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B97C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B97D9
		push	28h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B981A

loc_B97D9:
		mov	word ptr [si], 0DAEh
		mov	dword ptr [si+6], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+2], 0
		mov	byte ptr [si+3], 0
		mov	word ptr [si], 2F5Ch
		mov	dword ptr [si+0Eh], 0
		mov	byte ptr [si+12h], 2
		mov	byte ptr [si+13h], 0
		mov	dword ptr [si+14h], 0
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_B981F
		add	sp, 4

loc_B981A:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_B97C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B981F		proc far

var_10E		= word ptr -10Eh
var_BE		= word ptr -0BEh
var_61		= dword ptr -61h
var_5D		= dword ptr -5Dh
var_59		= dword ptr -59h
var_4C		= word ptr -4Ch
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= byte ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10Eh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_BE]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_BE], 508h
		mov	[bp+var_5D], 100h
		mov	[bp+var_61], 0
		mov	[bp+var_BE], 520h
		mov	[bp+var_42], 0
		xor	ax, ax
		mov	[bp+var_44], ax
		movsx	eax, ax
		mov	[bp+var_59], eax
		push	seg seg225
		push	0
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aOBJECTS
		lea	ax, [bp+var_10E]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	large 52435254h
		lea	ax, [bp+var_10E]
		push	ax
		lea	ax, [bp+var_BE]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jnz	short loc_B989D
		jmp	loc_B99B0

loc_B989D:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_BE]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_B98B9
		jmp	loc_B99B0

loc_B98B9:
		lea	ax, [bp+var_BE]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+0Ah], ax
		mov	ax, [si+0Ah]
		add	ax, 4
		imul	ax, ax, 1Bh
		movzx	eax, ax
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+0Eh], eax
		mov	byte ptr [si+12h], 2
		mov	byte ptr [si+13h], 1
		mov	dword ptr [si+14h], 0
		mov	eax, [bp+var_8]
		mov	[si+14h], eax
		push	0
		mov	al, [si+12h]
		push	ax
		push	large [si+0Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[si+1Ah], dx
		mov	[si+18h], ax
		push	0
		mov	al, [si+12h]
		push	ax
		push	large [si+0Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_B994E
		push	0B00Ah
		call	sub_1DDFE
		pop	cx

loc_B994E:
		xor	eax, eax
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		mov	[bp+var_E], al
		jmp	short loc_B9982

loc_B995E:
		lea	ax, [bp+var_BE]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	sub_294DB
		add	sp, 6
		push	0
		push	ss
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	65D0h
		call	sub_742E8
		add	sp, 8

loc_B9982:
		test	[bp+var_4C], 1
		jz	short loc_B999B
		mov	eax, [bp+var_48]
		dec	eax
		cmp	eax, [bp+var_59]
		jnz	short loc_B999B
		inc	[bp+var_59]
		jmp	short loc_B999B

loc_B999B:
		mov	eax, [bp+var_59]
		cmp	eax, [bp+var_48]
		jl	short loc_B99AA
		mov	ax, 1
		jmp	short loc_B99AC

loc_B99AA:
		xor	ax, ax

loc_B99AC:
		or	ax, ax
		jz	short loc_B995E

loc_B99B0:
		mov	ax, [si+1Ah]
		mov	dx, [si+18h]
		mov	bx, [si+0Ah]
		imul	bx, bx, 1Bh
		add	dx, bx
		mov	[si+22h], ax
		mov	[si+20h], dx
		mov	eax, [si+18h]
		mov	[bp+var_4], eax
		jmp	short loc_B99DF

loc_B99CE:
		les	bx, word ptr [bp+var_4]
		and	byte ptr es:[bx+4], 0FCh
		and	byte ptr es:[bx+4], 0FBh
		add	word ptr [bp+var_4], 1Bh

loc_B99DF:
		mov	ax, [si+20h]
		cmp	ax, word ptr [bp+var_4]
		ja	short loc_B99CE
		mov	eax, [si+18h]
		mov	[si+1Ch], eax
		mov	dword ptr [si+24h], 0
		mov	word ptr [si+0Ch], 0
		mov	[si+8], ds
		mov	word ptr [si+6], 2F56h
		mov	[bp+var_BE], 520h
		lea	ax, [bp+var_BE]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_BE]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_B981F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9A27		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_B9A39
		jmp	loc_B9AEF

loc_B9A39:
		mov	word ptr [si], 2F5Ch
		push	0
		mov	al, [si+12h]
		push	ax
		push	large [si+0Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_B9A9D
		cmp	byte ptr [si+13h], 0
		jz	short loc_B9A7C
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_B9A7C
		push	0
		mov	al, [si+12h]
		push	ax
		mov	ax, si
		add	ax, 0Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_B9A7C

loc_B9A7C:
		mov	dword ptr [si+0Eh], 0
		mov	byte ptr [si+13h], 0
		mov	dword ptr [si+14h], 0
		mov	word ptr [si+0Ah], 0
		mov	dword ptr [si+1Ch], 0

loc_B9A9D:
		cmp	byte ptr [si+13h], 0
		jz	short loc_B9AC3
		cmp	dword ptr [si+0Eh], 0
		jz	short loc_B9AC3
		push	0
		mov	al, [si+12h]
		push	ax
		mov	ax, si
		add	ax, 0Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_B9AC3

loc_B9AC3:
		mov	dword ptr [si+0Eh], 0
		mov	byte ptr [si+13h], 0
		mov	dword ptr [si+14h], 0
		push	0
		push	si
		call	sub_1E120
		add	sp, 4
		test	di, 1
		jz	short loc_B9AEF
		push	si
		call	sub_3B2
		pop	cx

loc_B9AEF:
		pop	di
		pop	si
		pop	bp
		retf
sub_B9A27		endp
ovr338		ends
