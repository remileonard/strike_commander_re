ovr348		segment	para public 'OVERLAY' use16
		assume cs:ovr348
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0ED0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+9], ax
		mov	byte ptr [si+15h], 0
		xor	ax, ax
		mov	[si+26h], ax
		mov	[si+16h], ax
		mov	byte ptr [si+4], 0
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_C0F13
		cmp	dword ptr [si+18h], 0
		jz	short loc_C0F13
		push	0
		mov	al, [si+1Ch]
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C0F13

loc_C0F13:
		mov	dword ptr [si+18h], 0
		mov	byte ptr [si+1Dh], 0
		mov	dword ptr [si+1Eh], 0
		cmp	dword ptr [si+5], 0
		jnz	short loc_C0F48
		push	1
		push	8
		push	2
		push	large 48h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+7], dx
		mov	[si+5], ax

loc_C0F48:
		mov	byte_79E64, 1
		pop	si
		pop	bp
		retf
sub_C0ED0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0F50		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+9], 0
		jz	short loc_C0F6B
		mov	bx, [si+9]
		push	word ptr [bx+4]
		call	sub_1DB8F
		pop	cx
		jmp	short loc_C0F6B

loc_C0F6B:
		mov	byte ptr [si+4], 1
		pop	si
		pop	bp
		retf
sub_C0F50		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0F72		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+5Dh]
		mov	[bp+var_2], ax
		push	1
		push	8
		push	2
		imul	ax, ax, 0Ah
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		mov	[bp+var_C], 0
		jmp	loc_C1093

loc_C0FAE:
		push	[bp+var_C]
		push	di
		call	sub_7844
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C0FCB
		mov	eax, [di+61h]
		jmp	short loc_C0FCF

loc_C0FCB:
		mov	eax, [di+71h]

loc_C0FCF:
		mov	[bp+var_1E], eax
		cmp	[bp+var_1E], 0
		jnz	short loc_C0FDD
		jmp	loc_C1071

loc_C0FDD:
		mov	ax, [bp+var_C]
		imul	ax, ax, 0Ah
		mov	dx, word ptr [bp+var_6+2]
		mov	bx, word ptr [bp+var_6]
		add	bx, ax
		mov	[bp+var_8], dx
		mov	[bp+var_A], bx
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_26+2], dx
		mov	word ptr [bp+var_26], ax
		les	bx, [bp+var_A]
		mov	eax, [bp+var_26]
		mov	es:[bx], eax
		mov	byte ptr es:[bx+4], 3
		mov	byte ptr es:[bx+5], 1
		mov	dword ptr es:[bx+6], 0
		mov	eax, [bp+var_22]
		mov	es:[bx+6], eax
		cmp	dword ptr es:[bx], 0
		jz	short loc_C1066
		push	0
		mov	al, es:[bx+4]
		push	ax
		push	large es:[bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C]
		push	di
		call	sub_75C8
		add	sp, 8
		jmp	short loc_C1090

loc_C1066:
		push	370Ah
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		jmp	short loc_C1090

loc_C1071:
		mov	ax, [bp+var_C]
		imul	ax, ax, 0Ah
		mov	dx, word ptr [bp+var_6+2]
		mov	bx, word ptr [bp+var_6]
		add	bx, ax
		mov	[bp+var_8], dx
		mov	[bp+var_A], bx
		mov	es, [bp+var_8]
		mov	dword ptr es:[bx], 0

loc_C1090:
		inc	[bp+var_C]

loc_C1093:
		mov	ax, [bp+var_C]
		cmp	ax, [bp+var_2]
		jge	short loc_C109E
		jmp	loc_C0FAE

loc_C109E:
		cmp	word ptr [si+16h], 5
		jle	short loc_C10AD
		push	371Eh
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_C10AD:
		mov	ax, [si+7]
		mov	dx, [si+5]
		mov	bx, [si+16h]
		inc	word ptr [si+16h]
		imul	bx, bx, 0Ch
		add	dx, bx
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		mov	eax, [bp+var_6]
		mov	[bp+var_14], eax
		mov	ax, [si+22h]
		mov	[bp+var_16], ax
		mov	ax, [si+24h]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_1A], ax
		les	bx, [bp+var_10]
		mov	eax, [bp+var_14]
		mov	es:[bx], eax
		push	ds
		push	[bp+var_16]
		call	sub_38FF
		add	sp, 4
		les	bx, [bp+var_10]
		mov	es:[bx+6], dx
		mov	es:[bx+4], ax
		mov	ax, [bp+var_18]
		mov	es:[bx+8], ax
		mov	ax, [bp+var_1A]
		mov	es:[bx+0Ah], ax
		pop	di
		pop	si
		leave
		retf
sub_C0F72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C1112		proc far

var_F8		= word ptr -0F8h
var_80		= word ptr -80h
var_1F		= dword ptr -1Fh
var_1B		= dword ptr -1Bh
var_13		= word ptr -13h
var_F		= dword ptr -0Fh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [si+4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_C112D
		jmp	loc_C11F0

loc_C112D:
		cmp	word ptr [si+16h], 6
		jl	short loc_C1136
		jmp	loc_C11F0

loc_C1136:
		push	ds
		push	di
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jnz	short loc_C1147
		jmp	loc_C11F0

loc_C1147:
		mov	[si+22h], di
		mov	ax, [bp+arg_4]
		mov	[si+24h], ax
		push	1
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_80]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	eax, [bp+var_1B]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_13]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C1187
		mov	eax, [bp+var_1F]
		jmp	short loc_C118B

loc_C1187:
		mov	eax, [bp+var_F]

loc_C118B:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_8]
		jz	short loc_C11E2
		lea	ax, [bp+var_F8]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		push	cs
		call	near ptr sub_C0F72
		add	sp, 4
		push	2
		lea	ax, [bp+var_F8]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_C11E2:
		push	2
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_C11F0:
		pop	di
		pop	si
		leave
		retf
sub_C1112		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C11F4		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		xor	si, si
		jmp	short loc_C123C

loc_C11FF:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	bx, si
		imul	bx, bx, 0Ah
		add	dx, bx
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_C123B
		push	0
		push	3
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_C123B:
		inc	si

loc_C123C:
		les	bx, [bp+arg_0]
		cmp	es:[bx+0Ah], si
		jg	short loc_C11FF
		cmp	dword ptr es:[bx+4], 0
		jz	short loc_C1275
		push	0
		push	2
		mov	eax, es:[bx+4]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+4], 0

loc_C1275:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx], 0
		jz	short loc_C12A5
		push	0
		push	2
		mov	eax, es:[bx]
		mov	[bp+var_10], eax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx], 0

loc_C12A5:
		pop	si
		leave
		retf
sub_C11F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C12A8		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_C1348
		pop	cx
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_C12DF
		cmp	dword ptr [si+18h], 0
		jz	short loc_C12DF
		push	0
		mov	al, [si+1Ch]
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C12DF

loc_C12DF:
		mov	dword ptr [si+18h], 0
		mov	byte ptr [si+1Dh], 0
		mov	dword ptr [si+1Eh], 0
		cmp	byte ptr [si+10h], 0
		jz	short loc_C1324
		mov	ax, [si+0Bh]
		or	ax, [si+0Dh]
		jz	short loc_C1324
		push	0
		mov	al, [si+0Fh]
		push	ax
		mov	ax, [si+0Dh]
		mov	dx, [si+0Bh]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C1324

loc_C1324:
		mov	word ptr [si+0Dh], 0
		mov	word ptr [si+0Bh], 0
		mov	byte ptr [si+10h], 0
		mov	dword ptr [si+11h], 0
		push	word ptr [si+9]
		push	si
		push	cs
		call	near ptr sub_C0ED0
		add	sp, 4
		pop	si
		leave
		retf
sub_C12A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C1348		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_79E64, 0
		jz	short loc_C139C
		cmp	word ptr [si+9], 0
		jz	short loc_C1392
		mov	bx, [si+9]
		push	word ptr [bx+4]
		call	sub_1DB8F
		pop	cx
		xor	di, di
		jmp	short loc_C138D

loc_C1370:
		mov	ax, [si+7]
		mov	dx, [si+5]
		mov	bx, di
		imul	bx, bx, 0Ch
		add	dx, bx
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	ax
		push	dx
		push	cs
		call	near ptr sub_C11F4
		add	sp, 4
		inc	di

loc_C138D:
		cmp	[si+16h], di
		jg	short loc_C1370

loc_C1392:
		mov	byte_79E64, 0
		mov	word ptr [si+16h], 0

loc_C139C:
		pop	di
		pop	si
		leave
		retf
sub_C1348		endp
ovr348		ends
