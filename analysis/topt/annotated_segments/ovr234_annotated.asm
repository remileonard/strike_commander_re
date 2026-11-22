ovr234		segment	para public 'OVERLAY' use16
		assume cs:ovr234
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BCF90		proc far

var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= byte ptr -44h
var_43		= byte ptr -43h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0
		xor	eax, eax
		mov	[bp+var_1E], eax
		mov	[bp+var_1A], eax
		mov	[bp+var_16], eax
		mov	[bp+var_12], eax
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		push	0
		push	large 54524556h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BCFF0
		mov	eax, [si+72h]
		mov	ebx, 0Ch
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax

loc_BCFF0:
		push	0
		push	large 53495254h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD008
		jmp	loc_BD188

loc_BD008:
		push	0
		push	large 49525456h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD020
		jmp	loc_BD17F

loc_BD020:
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		mov	eax, [si+72h]
		mov	[bp+var_4C], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_50+2], dx
		mov	word ptr [bp+var_50], ax
		mov	eax, [bp+var_50]
		mov	[bp+var_48], eax
		mov	[bp+var_44], 2
		mov	[bp+var_43], 1
		mov	[bp+var_42], 0
		mov	eax, [bp+var_4C]
		mov	[bp+var_42], eax
		push	0
		mov	al, [bp+var_44]
		push	ax
		push	word ptr [bp+var_48+2]
		push	word ptr [bp+var_48]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		push	0
		mov	al, [bp+var_44]
		push	ax
		push	word ptr [bp+var_48+2]
		push	word ptr [bp+var_48]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_52], dx
		mov	[bp+var_54], ax
		xor	di, di
		jmp	loc_BD13F

loc_BD0B9:
		les	bx, [bp+var_54]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 9
		ja	short loc_BD0DA
		shl	bx, 1
		jmp	cs:off_BD5CA[bx]	; switch jump

loc_BD0CE:
		add	[bp+var_E], 27h
		add	[bp+var_A], 12h
		jmp	short loc_BD13A

loc_BD0DA:
		add	[bp+var_E], 27h
		add	[bp+var_A], 12h
		jmp	short loc_BD13A

loc_BD0E6:
		add	[bp+var_E], 2Ah
		add	[bp+var_A], 12h
		jmp	short loc_BD13A

loc_BD0F2:
		add	[bp+var_E], 29h
		add	[bp+var_A], 19h
		jmp	short loc_BD13A

loc_BD0FE:
		add	[bp+var_E], 28h
		add	[bp+var_A], 12h
		jmp	short loc_BD13A

loc_BD10A:
		add	[bp+var_E], 2Eh
		add	[bp+var_A], 12h
		jmp	short loc_BD13A

loc_BD116:
		add	[bp+var_E], 31h
		add	[bp+var_A], 19h
		jmp	short loc_BD13A

loc_BD122:
		add	[bp+var_E], 30h
		add	[bp+var_A], 14h
		jmp	short loc_BD13A

loc_BD12E:
		add	[bp+var_E], 2Eh
		add	[bp+var_A], 19h
		jmp	short loc_BD13A

loc_BD13A:
		inc	di
		add	[bp+var_54], 8

loc_BD13F:
		cmp	di, [bp+var_2]
		jge	short loc_BD147
		jmp	loc_BD0B9

loc_BD147:
		cmp	[bp+var_43], 0
		jz	short loc_BD16B
		cmp	[bp+var_48], 0
		jz	short loc_BD16B
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BD16B

loc_BD16B:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0

loc_BD17F:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_BD188:
		push	0
		push	large 534E494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD1A0
		jmp	loc_BD2D7

loc_BD1A0:
		push	0
		push	large 4E494C56h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD1B8
		jmp	loc_BD2CE

loc_BD1B8:
		mov	eax, [si+72h]
		mov	ebx, 7
		cdq
		idiv	ebx
		mov	[bp+var_4], ax
		mov	eax, [si+72h]
		mov	[bp+var_4C], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_50+2], dx
		mov	word ptr [bp+var_50], ax
		mov	eax, [bp+var_50]
		mov	[bp+var_48], eax
		mov	[bp+var_44], 2
		mov	[bp+var_43], 1
		mov	[bp+var_42], 0
		mov	eax, [bp+var_4C]
		mov	[bp+var_42], eax
		push	0
		mov	al, [bp+var_44]
		push	ax
		push	word ptr [bp+var_48+2]
		push	word ptr [bp+var_48]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		push	0
		mov	al, [bp+var_44]
		push	ax
		push	word ptr [bp+var_48+2]
		push	word ptr [bp+var_48]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_52], dx
		mov	[bp+var_54], ax
		xor	di, di
		jmp	short loc_BD291

loc_BD250:
		les	bx, [bp+var_54]
		mov	al, es:[bx]
		cbw
		cmp	ax, 1
		jz	short loc_BD268
		cmp	ax, 2
		jz	short loc_BD274
		cmp	ax, 3
		jz	short loc_BD280
		jmp	short loc_BD268

loc_BD268:
		add	[bp+var_12], 0Ch
		add	[bp+var_16], 0Fh
		jmp	short loc_BD28C

loc_BD274:
		add	[bp+var_12], 0Fh
		add	[bp+var_16], 12h
		jmp	short loc_BD28C

loc_BD280:
		add	[bp+var_12], 0Dh
		add	[bp+var_16], 10h
		jmp	short loc_BD28C

loc_BD28C:
		inc	di
		add	[bp+var_54], 7

loc_BD291:
		cmp	di, [bp+var_4]
		jl	short loc_BD250
		cmp	[bp+var_43], 0
		jz	short loc_BD2BA
		cmp	[bp+var_48], 0
		jz	short loc_BD2BA
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BD2BA

loc_BD2BA:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0

loc_BD2CE:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_BD2D7:
		push	0
		push	large 53525053h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD2EF
		jmp	loc_BD425

loc_BD2EF:
		push	0
		push	large 52505356h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD307
		jmp	loc_BD41C

loc_BD307:
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_6], ax
		mov	eax, [si+72h]
		mov	[bp+var_4C], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_50+2], dx
		mov	word ptr [bp+var_50], ax
		mov	eax, [bp+var_50]
		mov	[bp+var_48], eax
		mov	[bp+var_44], 2
		mov	[bp+var_43], 1
		mov	[bp+var_42], 0
		mov	eax, [bp+var_4C]
		mov	[bp+var_42], eax
		push	0
		mov	al, [bp+var_44]
		push	ax
		push	word ptr [bp+var_48+2]
		push	word ptr [bp+var_48]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		push	0
		mov	al, [bp+var_44]
		push	ax
		push	word ptr [bp+var_48+2]
		push	word ptr [bp+var_48]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_52], dx
		mov	[bp+var_54], ax
		xor	di, di
		jmp	short loc_BD3DF

loc_BD39F:
		les	bx, [bp+var_54]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 3
		ja	short loc_BD3C0
		shl	bx, 1
		jmp	cs:off_BD5C2[bx]	; switch jump

loc_BD3B4:
		add	[bp+var_1A], 0Bh
		add	[bp+var_1E], 0Dh
		jmp	short loc_BD3DA

loc_BD3C0:
		add	[bp+var_1A], 0Bh
		add	[bp+var_1E], 0Dh
		jmp	short loc_BD3DA

loc_BD3CC:
		add	[bp+var_1A], 0Eh
		add	[bp+var_1E], 10h
		jmp	short loc_BD3DA

loc_BD3D8:
		jmp	short loc_BD3DA

loc_BD3DA:
		inc	di
		add	[bp+var_54], 8

loc_BD3DF:
		cmp	di, [bp+var_6]
		jl	short loc_BD39F
		cmp	[bp+var_43], 0
		jz	short loc_BD408
		cmp	[bp+var_48], 0
		jz	short loc_BD408
		push	0
		mov	al, [bp+var_44]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BD408

loc_BD408:
		mov	[bp+var_48], 0
		mov	[bp+var_43], 0
		mov	[bp+var_42], 0

loc_BD41C:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_BD425:
		mov	[bp+var_1F], 2
		call	sub_32170
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	[bp+var_24], eax
		push	0
		push	2
		push	6C14h
		call	Memory_TypedAllocDispatchC_329EC
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[bp+var_28], eax
		cmp	[bp+var_28], 30D40h
		jge	short loc_BD479
		cmp	[bp+var_24], 6DDD0h
		jg	short loc_BD475
		cmp	[bp+var_28], 17318h
		jge	short loc_BD479

loc_BD475:
		mov	[bp+var_1F], 3

loc_BD479:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_12]
		add	eax, [bp+var_1A]
		mov	[bp+var_2C], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	dx, 18h
		imul	dx
		movzx	eax, ax
		mov	edx, [bp+var_2C]
		add	edx, eax
		mov	[bp+var_30], edx
		mov	al, [bp+var_1F]
		mov	[bp+var_31], al
		push	3F18h
		push	1
		push	0
		mov	al, [bp+var_31]
		push	ax
		push	large [bp+var_30]
		push	6C14h
		call	Memory_TypedFreeWrapperB_328F2
		add	sp, 0Eh
		mov	word ptr [bp+var_36+2], dx
		mov	word ptr [bp+var_36], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_36]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		mov	al, [bp+var_31]
		mov	es:[bx+0Ch], al
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Dh], 1
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Eh], 0
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_30]
		mov	es:[bx+0Eh], eax
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
		add	ax, word ptr [bp+var_2C]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], dx
		mov	es:[bx+4], ax
		mov	eax, [bp+var_A]
		add	eax, [bp+var_16]
		add	eax, [bp+var_1E]
		mov	[bp+var_3A], eax
		push	3F18h
		push	1
		push	0
		push	2
		push	large [bp+var_3A]
		push	6C14h
		call	Memory_TypedFreeWrapperB_328F2
		add	sp, 0Eh
		mov	word ptr [bp+var_3E+2], dx
		mov	word ptr [bp+var_3E], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_3E]
		mov	es:[bx+12h], eax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+16h], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+17h], 1
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+18h], 0
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_3A]
		mov	es:[bx+18h], eax
		push	1
		push	0
		push	2
		mov	ax, [bp+var_2]
		add	ax, [bp+var_4]
		add	ax, [bp+var_6]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], dx
		mov	es:[bx+1Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_BCF90		endp

; START OF FUNCTION CHUNK FOR sub_BCF90
off_BD5C2	dw offset loc_BD3B4
		dw offset loc_BD3C0
		dw offset loc_BD3CC
		dw offset loc_BD3D8
off_BD5CA	dw offset loc_BD0CE
		dw offset loc_BD0DA
		dw offset loc_BD0E6
		dw offset loc_BD0FE
		dw offset loc_BD0F2
		dw offset loc_BD0FE
		dw offset loc_BD10A
		dw offset loc_BD116
		dw offset loc_BD122
		dw offset loc_BD12E
; END OF FUNCTION CHUNK FOR sub_BCF90
ovr234		ends
