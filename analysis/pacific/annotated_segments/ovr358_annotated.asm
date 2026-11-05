ovr358		segment	para public 'OVERLAY' use16
		assume cs:ovr358
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6E00		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	seg seg008
		push	offset loc_6266
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 0A009Ah
		lea	ax, [bp+var_50]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 8
		push	seg seg008
		push	offset loc_6277
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	si, di
		jmp	short loc_C6E7E

loc_C6E57:
		push	si
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	si
		mov	ax, si
		sub	ax, di
		imul	ax, ax, 0Ah
		add	ax, 14h
		push	ax
		push	14h
		lea	ax, [bp+var_50]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 0Ch
		inc	si

loc_C6E7E:
		mov	ax, di
		add	ax, 0Ah
		cmp	ax, si
		ja	short loc_C6E57
		pop	di
		pop	si
		leave
		retf
sub_C6E00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6E8B		proc far

var_A6		= word ptr -0A6h
var_56		= word ptr -56h
var_6		= word ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0A6h
		push	si
		push	di
		xor	si, si
		mov	di, 1
		mov	[bp+var_1], 0
		call	sub_75750
		push	seg seg008
		push	offset loc_62B3
		lea	ax, [bp+var_A6]
		push	ax
		call	sub_54BE
		add	sp, 6
		jmp	loc_C6F72

loc_C6EB8:
		cmp	di, si
		jz	short loc_C6F1F
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_C6E00
		pop	cx
		mov	ax, [bp+arg_2]
		cmp	ax, 1
		jz	short loc_C6EDB
		cmp	ax, 2
		jz	short loc_C6ED3
		jmp	short loc_C6F1B

loc_C6ED3:
		push	seg seg008
		push	offset loc_6288
		jmp	short loc_C6EE1

loc_C6EDB:
		push	seg seg008
		push	offset loc_629E

loc_C6EE1:
		lea	ax, [bp+var_56]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 960068h
		lea	ax, [bp+var_56]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 8
		push	si
		push	large 9600BEh
		lea	ax, [bp+var_A6]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 0Ah

loc_C6F1B:
		mov	di, si
		jmp	short loc_C6F1F

loc_C6F1F:
		push	0FFh
		lea	ax, [bp+var_6]
		push	ax
		call	sub_6EF5A
		add	sp, 4
		cmp	byte ptr [bp+var_6], 1
		jnz	short loc_C6F1F
		mov	al, byte ptr [bp+var_6+1]
		mov	ah, 0
		sub	ax, 2
		mov	bx, ax
		cmp	bx, 1Ah
		ja	short loc_C6F72
		shl	bx, 1
		jmp	cs:off_C6F84[bx]	; switch jump

loc_C6F4A:
		mov	al, byte ptr [bp+var_6+1]
		mov	ah, 0
		imul	si, si, 0Ah
		add	si, ax
		dec	si
		jmp	short loc_C6F72

loc_C6F57:
		mov	dx, 0Ah
		mov	ax, si
		imul	dx
		mov	si, ax
		jmp	short loc_C6F72

loc_C6F62:
		mov	[bp+var_1], 1
		jmp	short loc_C6F72

loc_C6F68:
		mov	bx, 0Ah
		mov	ax, si
		cwd
		idiv	bx
		mov	si, ax

loc_C6F72:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C6F7E
		jmp	loc_C6EB8

loc_C6F7E:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_C6E8B		endp

; START OF FUNCTION CHUNK FOR sub_C6E8B
off_C6F84	dw offset loc_C6F4A
		dw offset loc_C6F4A
		dw offset loc_C6F4A
		dw offset loc_C6F4A
		dw offset loc_C6F4A
		dw offset loc_C6F4A
		dw offset loc_C6F4A
		dw offset loc_C6F4A
		dw offset loc_C6F4A
		dw offset loc_C6F57
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F68
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F72
		dw offset loc_C6F62
; END OF FUNCTION CHUNK FOR sub_C6E8B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6FBA		proc far

var_72		= word ptr -72h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 72h
		push	si
		push	di
		mov	[bp+var_2], 0
		xor	si, si
		mov	[bp+var_3], 0
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		mov	[bp+var_16], 0
		mov	[bp+var_14], 0
		mov	[bp+var_12], 13Fh
		mov	[bp+var_10], 0C7h
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[bp+var_E], eax
		mov	[bp+var_A], 3
		mov	[bp+var_9], 1
		mov	[bp+var_8], 0
		mov	[bp+var_8], 0FA00h
		lea	ax, [bp+var_16]
		push	ax
		push	0
		mov	al, [bp+var_A]
		push	ax
		push	large [bp+var_E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6AEF8
		add	sp, 8
		push	0
		push	cs
		call	near ptr sub_C6E00
		pop	cx
		call	sub_75750

loc_C7069:
		push	0FFh
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_6EF5A
		add	sp, 4
		mov	al, byte ptr [bp+var_1E+1]
		mov	ah, 0
		mov	[bp+var_20], ax
		mov	cx, 7
		mov	bx, offset word_C71E6

loc_C7086:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_20]
		jz	short loc_C7096
		add	bx, 2
		loop	short loc_C7086
		jmp	loc_C7181

loc_C7096:
		jmp	word ptr cs:[bx+0Eh] ; switch jump

loc_C709A:
		inc	si
		cmp	si, 20FFh
		jle	short loc_C70A4

loc_C70A1:
		mov	si, 20FFh

loc_C70A4:
		push	si

loc_C70A5:
		push	cs
		call	near ptr sub_C6E00
		pop	cx
		jmp	loc_C7181

loc_C70AD:
		add	si, 1Eh
		cmp	si, 20FFh
		jle	short loc_C70A4
		jmp	short loc_C70A1
		jmp	short loc_C70A4

loc_C70BA:
		dec	si
		or	si, si
		jge	short loc_C70A4
		jmp	short loc_C70CA
		jmp	short loc_C70A4

loc_C70C3:
		sub	si, 1Eh
		or	si, si
		jge	short loc_C70A4

loc_C70CA:
		xor	si, si
		jmp	short loc_C70A4
		jmp	short loc_C70A4

loc_C70D0:
		push	2
		push	si
		push	cs
		call	near ptr sub_C6E8B
		add	sp, 4
		mov	di, ax
		cmp	di, 20FFh
		jg	short loc_C70E6
		or	di, di
		jge	short loc_C70FA

loc_C70E6:
		push	seg seg008
		push	offset loc_62BA
		lea	ax, [bp+var_72]
		push	ax
		call	sub_54BE
		add	sp, 6
		jmp	short loc_C7158

loc_C70FA:
		push	di
		push	cs
		call	near ptr sub_C6E00
		pop	cx
		mov	si, di
		cmp	di, 100h
		jg	short loc_C7121
		push	1
		push	si
		push	cs
		call	near ptr sub_C6E8B
		add	sp, 4
		mov	[bp+var_22], ax
		push	ax
		push	di
		call	GameVar_Set_564BB
		add	sp, 4
		jmp	short loc_C7128

loc_C7121:
		push	di
		call	sub_56570
		pop	cx

loc_C7128:
		push	di
		jmp	loc_C70A5

loc_C712C:
		push	2
		push	si
		push	cs
		call	near ptr sub_C6E8B
		add	sp, 4
		mov	[bp+var_22], ax
		push	seg seg008
		push	offset loc_62BA
		lea	ax, [bp+var_72]
		push	ax
		call	sub_54BE
		add	sp, 6
		cmp	[bp+var_22], 20FFh
		jg	short loc_C7158
		cmp	[bp+var_22], 0
		jge	short loc_C7170

loc_C7158:
		push	large 0A000A4h
		lea	ax, [bp+var_72]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 8
		jmp	short loc_C7181

loc_C7170:
		push	[bp+var_22]
		push	cs
		call	near ptr sub_C6E00
		pop	cx
		mov	si, [bp+var_22]
		jmp	short loc_C7181

loc_C717D:
		mov	[bp+var_3], 1

loc_C7181:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C718D
		jmp	loc_C7069

loc_C718D:
		call	sub_75750
		mov	ax, 0C00h
		int	21h
		lea	ax, [bp+var_16]
		push	ax
		push	0
		mov	al, [bp+var_A]
		push	ax
		push	large [bp+var_E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6ACDA
		add	sp, 8
		cmp	[bp+var_9], 0
		jz	short loc_C71E2
		cmp	[bp+var_E], 0
		jz	short loc_C71E2
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C71E2

loc_C71E2:
		pop	di
		pop	si
		leave
		retf
sub_C6FBA		endp

; START OF FUNCTION CHUNK FOR sub_C6FBA
word_C71E6	dw 1
		dw 2Eh
		dw 31h
		dw 48h
		dw 49h
		dw 50h
		dw 51h
off_C71F4	dw offset loc_C717D
		dw offset loc_C70D0
		dw offset loc_C712C
		dw offset loc_C70BA
		dw offset loc_C70C3
		dw offset loc_C709A
		dw offset loc_C70AD
; END OF FUNCTION CHUNK FOR sub_C6FBA
ovr358		ends
