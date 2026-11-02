ovr249		segment	para public 'OVERLAY' use16
		assume cs:ovr249
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFB60		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+35h], ax
		mov	byte ptr [si+41h], 0
		xor	ax, ax
		mov	[si+52h], ax
		mov	[si+42h], ax
		mov	byte ptr [si+4], 0
		cmp	byte ptr [si+49h], 0
		jz	short loc_BFBA3
		cmp	dword ptr [si+44h], 0
		jz	short loc_BFBA3
		push	0
		mov	al, [si+48h]
		push	ax
		mov	ax, si
		add	ax, 44h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BFBA3

loc_BFBA3:
		mov	dword ptr [si+44h], 0
		mov	byte ptr [si+49h], 0
		mov	dword ptr [si+4Ah], 0
		pop	si
		pop	bp
		retf
sub_BFB60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFBBA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+35h], 0
		jz	short loc_BFBD7
		mov	bx, [si+35h]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_BFBD7

loc_BFBD7:
		mov	byte ptr [si+4], 1
		pop	si
		pop	bp
		retf
sub_BFBBA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFBDE		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
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
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	ax, [bx+5Dh]
		mov	[bp+var_2], ax
		push	seg stub192
		push	offset sub_479E5
		push	11h
		push	[bp+var_2]
		push	0Ah
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	loc_BFCD2

loc_BFC14:
		push	[bp+var_6]
		push	[bp+arg_2]
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_BFC39
		mov	bx, [bp+arg_2]
		mov	eax, [bx+61h]
		jmp	short loc_BFC40

loc_BFC39:
		mov	bx, [bp+arg_2]
		mov	eax, [bx+71h]

loc_BFC40:
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0
		jnz	short loc_BFC4E
		jmp	loc_BFCCF

loc_BFC4E:
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	di, dx
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		push	0
		push	0
		push	3
		push	large [bp+var_18]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2], dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[di], eax
		mov	byte ptr [di+4], 3
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_18]
		mov	[di+6], eax
		cmp	dword ptr [di], 0
		jz	short loc_BFCCD
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		push	[bp+arg_2]
		call	sub_43519
		add	sp, 8
		jmp	short loc_BFCCF

loc_BFCCD:
		jmp	short loc_BFCDD

loc_BFCCF:
		inc	[bp+var_6]

loc_BFCD2:
		mov	ax, [bp+var_6]
		cmp	ax, [bp+var_2]
		jge	short loc_BFCDD
		jmp	loc_BFC14

loc_BFCDD:
		mov	ax, [si+42h]
		inc	word ptr [si+42h]
		shl	ax, 3
		mov	dx, si
		add	dx, ax
		add	dx, 5
		mov	[bp+var_8], dx
		mov	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, [si+4Eh]
		mov	[bp+var_C], ax
		mov	ax, [si+50h]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_8]
		mov	ax, [bp+var_A]
		mov	[bx], ax
		push	[bp+var_C]
		call	CRT_Strdup
		add	sp, 2
		mov	bx, [bp+var_8]
		mov	[bx+2], ax
		mov	bx, [bp+var_8]
		mov	ax, [bp+var_E]
		mov	[bx+4], ax
		mov	bx, [bp+var_8]
		mov	ax, [bp+var_10]
		mov	[bx+6], ax
		pop	di
		pop	si
		leave
		retf
sub_BFBDE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFD37		proc far

var_FC		= word ptr -0FCh
var_9F		= word ptr -9Fh
var_84		= word ptr -84h
var_27		= word ptr -27h
var_23		= dword ptr -23h
var_1F		= dword ptr -1Fh
var_17		= word ptr -17h
var_13		= dword ptr -13h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0FCh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [si+4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_BFD52
		jmp	loc_BFE46

loc_BFD52:
		cmp	word ptr [si+42h], 6
		jl	short loc_BFD5B
		jmp	loc_BFE46

loc_BFD5B:
		push	ds
		push	di
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_BFD6C
		jmp	loc_BFE46

loc_BFD6C:
		mov	[si+4Eh], di
		mov	ax, [bp+arg_4]
		mov	[si+50h], ax
		push	1
		push	di
		lea	ax, [bp+var_84]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		mov	ax, [bp+var_27]
		cmp	ax, [bp+arg_4]
		jg	short loc_BFD90
		jmp	loc_BFE37

loc_BFD90:
		push	[bp+arg_4]
		lea	ax, [bp+var_84]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	eax, [bp+var_1F]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_17]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_BFDB9
		mov	eax, [bp+var_23]
		jmp	short loc_BFDBD

loc_BFDB9:
		mov	eax, [bp+var_13]

loc_BFDBD:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_8]
		jz	short loc_BFE37
		lea	ax, [bp+var_FC]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	sub_40FBE
		add	sp, 0Eh
		movsx	eax, [bp+var_9F]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+var_C]
		dec	ax
		push	ax
		push	[bp+arg_4]
		push	di
		push	si
		call	sub_2E7D3
		add	sp, 8
		or	ax, ax
		jnz	short loc_BFE28
		lea	ax, [bp+var_FC]
		push	ax
		push	si
		push	cs
		call	near ptr sub_BFBDE
		add	sp, 4

loc_BFE28:
		push	2
		lea	ax, [bp+var_FC]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_BFE37:
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_BFE46:
		pop	di
		pop	si
		leave
		retf
sub_BFD37		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFE4A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_4CA8A, 0
		jz	short loc_BFEA8
		cmp	word ptr [si+35h], 0
		jz	short loc_BFEA3
		mov	bx, [si+35h]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		xor	di, di
		jmp	short loc_BFE9E

loc_BFE71:
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		mov	bx, di
		shl	bx, 3
		push	word ptr [bx+si+5]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 3
		push	word ptr [bx+si+7]
		call	sub_330E8
		add	sp, 2
		inc	di

loc_BFE9E:
		cmp	[si+42h], di
		jg	short loc_BFE71

loc_BFEA3:
		mov	byte_4CA8A, 0

loc_BFEA8:
		pop	di
		pop	si
		pop	bp
		retf
sub_BFE4A		endp
ovr249		ends
