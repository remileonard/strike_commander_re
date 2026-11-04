seg077		segment	para public 'CODE' use16
		assume cs:seg077
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E690		proc far

var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		push	[bp+arg_4]
		push	di
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_2E6BF
		mov	eax, [di+61h]
		jmp	short loc_2E6C3

loc_2E6BF:
		mov	eax, [di+71h]

loc_2E6C3:
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jnz	short loc_2E6D1
		jmp	loc_2E7C8

loc_2E6D1:
		cmp	byte ptr [si+3Ch], 0
		jz	short loc_2E6F7
		cmp	dword ptr [si+37h], 0
		jz	short loc_2E6F7
		push	0
		mov	al, [si+3Bh]
		push	ax
		mov	ax, si
		add	ax, 37h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E6F7

loc_2E6F7:
		mov	dword ptr [si+37h], 0
		mov	byte ptr [si+3Ch], 0
		mov	dword ptr [si+3Dh], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		push	0
		push	8
		push	2
		push	large [bp+var_A]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[si+37h], eax
		mov	byte ptr [si+3Bh], 2
		mov	byte ptr [si+3Ch], 1
		mov	dword ptr [si+3Dh], 0
		mov	eax, [bp+var_A]
		mov	[si+3Dh], eax
		cmp	dword ptr [si+37h], 0
		jnz	short loc_2E798
		mov	eax, [bp+var_6]
		mov	[bp+var_12], eax
		push	0
		push	0
		push	3
		push	large [bp+var_12]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[si+37h], eax
		mov	byte ptr [si+3Bh], 3
		mov	byte ptr [si+3Ch], 1
		mov	dword ptr [si+3Dh], 0
		mov	eax, [bp+var_12]
		mov	[si+3Dh], eax

loc_2E798:
		cmp	dword ptr [si+37h], 0
		jz	short loc_2E7C8
		mov	[bp+var_1], 1
		push	0
		mov	al, [si+3Bh]
		push	ax
		push	word ptr [si+39h]
		push	word ptr [si+37h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	di
		call	IndexedRecordReader_ReadEntryInto_43519
		add	sp, 8

loc_2E7C8:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_2E690		endp

; START OF FUNCTION CHUNK FOR sub_2E690
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2E690

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E7D3		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_2E82F

loc_2E7EA:
		mov	ax, [bp+var_4]
		shl	ax, 3
		mov	dx, si
		add	dx, ax
		add	dx, 5
		mov	di, dx
		push	[bp+arg_2]
		push	word ptr [di+2]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_2E82C
		mov	ax, [di+4]
		cmp	ax, [bp+arg_4]
		jnz	short loc_2E82C
		mov	ax, [di+6]
		cmp	ax, [bp+arg_6]
		jle	short loc_2E82C
		mov	ax, [bp+arg_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [di]
		add	dx, ax
		mov	[bp+var_2], dx
		jmp	short loc_2E837

loc_2E82C:
		inc	[bp+var_4]

loc_2E82F:
		mov	ax, [si+42h]
		cmp	ax, [bp+var_4]
		jg	short loc_2E7EA

loc_2E837:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_2E7D3		endp

; START OF FUNCTION CHUNK FOR sub_2E7D3
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2E7D3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E842		proc far

var_11A		= word ptr -11Ah
var_A2		= word ptr -0A2h
var_45		= word ptr -45h
var_41		= dword ptr -41h
var_3D		= dword ptr -3Dh
var_35		= word ptr -35h
var_31		= dword ptr -31h
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_7		= byte ptr -7
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 11Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	word ptr [si+35h], 0
		jnz	short loc_2E85B
		jmp	loc_2ECFA

loc_2E85B:
		push	1
		push	si
		nop
		push	cs
		call	near ptr sub_2ED05
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_2E877
		mov	al, [si+41h]
		cmp	al, [bp+arg_8]
		jb	short loc_2E877
		jmp	loc_2ECFA

loc_2E877:
		cmp	byte ptr [si+49h], 0
		jz	short loc_2E89D
		cmp	dword ptr [si+44h], 0
		jz	short loc_2E89D
		push	0
		mov	al, [si+48h]
		push	ax
		mov	ax, si
		add	ax, 44h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E89D

loc_2E89D:
		mov	dword ptr [si+44h], 0
		mov	byte ptr [si+49h], 0
		mov	dword ptr [si+4Ah], 0
		cmp	[bp+arg_C], 0
		jz	short loc_2E8EB
		mov	di, [bp+arg_C]
		mov	eax, [di]
		mov	[bp+var_6], eax
		mov	al, [di+4]
		mov	[bp+var_7], al
		mov	eax, [bp+var_6]
		mov	[si+44h], eax
		mov	al, [bp+var_7]
		mov	[si+48h], al
		mov	byte ptr [si+49h], 0
		mov	dword ptr [si+4Ah], 0
		mov	eax, [di+6]
		mov	[si+4Ah], eax
		jmp	short loc_2E941

loc_2E8EB:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_2E7D3
		add	sp, 8
		mov	word ptr [bp+var_C+2], ax
		or	ax, ax
		jz	short loc_2E941
		mov	ax, word ptr [bp+var_C+2]
		mov	word ptr [bp+var_C], ax
		mov	bx, word ptr [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_10], eax
		mov	bx, word ptr [bp+var_C]
		mov	al, [bx+4]
		mov	byte ptr [bp+var_12+1], al
		mov	eax, [bp+var_10]
		mov	[si+44h], eax
		mov	al, byte ptr [bp+var_12+1]
		mov	[si+48h], al
		mov	byte ptr [si+49h], 0
		mov	dword ptr [si+4Ah], 0
		mov	bx, word ptr [bp+var_C]
		mov	eax, [bx+6]
		mov	[si+4Ah], eax

loc_2E941:
		cmp	dword ptr [si+44h], 0
		jnz	short loc_2E94B
		jmp	loc_2EB39

loc_2E94B:
		mov	[bp+var_12], 0
		mov	byte ptr [bp+var_10+2], 2
		mov	byte ptr [bp+var_10+3], 0
		mov	[bp+var_C], 0
		mov	eax, [si+4Ah]
		mov	[bp+var_16], eax
		push	0
		push	8
		push	2
		push	large [bp+var_16]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[bp+var_12], eax
		mov	byte ptr [bp+var_10+2], 2
		mov	byte ptr [bp+var_10+3], 1
		mov	[bp+var_C], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_C], eax
		cmp	[bp+var_12], 0
		jnz	short loc_2E9B0
		jmp	loc_2EB01

loc_2E9B0:
		cmp	dword ptr [si+44h], 0
		jnz	short loc_2E9BA
		jmp	loc_2EAC9

loc_2E9BA:
		cmp	[bp+var_12], 0
		jz	short loc_2E9CE
		mov	eax, [si+4Ah]
		cmp	eax, [bp+var_C]
		jg	short loc_2E9CE
		jmp	loc_2EA55

loc_2E9CE:
		cmp	byte ptr [bp+var_10+3], 0
		jz	short loc_2E9F2
		cmp	[bp+var_12], 0
		jz	short loc_2E9F2
		push	0
		mov	al, byte ptr [bp+var_10+2]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E9F2

loc_2E9F2:
		mov	[bp+var_12], 0
		mov	byte ptr [bp+var_10+3], 0
		mov	[bp+var_C], 0
		mov	eax, [si+4Ah]
		mov	[bp+var_1E], eax
		mov	al, [si+48h]
		mov	[bp+var_1F], al
		push	1
		push	0
		mov	al, [bp+var_1F]
		push	ax
		push	large [bp+var_1E]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_24+2], dx
		mov	word ptr [bp+var_24], ax
		mov	eax, [bp+var_24]
		mov	[bp+var_12], eax
		mov	al, [bp+var_1F]
		mov	byte ptr [bp+var_10+2], al
		mov	byte ptr [bp+var_10+3], 1
		mov	[bp+var_C], 0
		mov	eax, [bp+var_1E]
		mov	[bp+var_C], eax
		jmp	short loc_2EA55

loc_2EA55:
		cmp	byte ptr [bp+var_10+2], 3
		jnz	short loc_2EA82
		cmp	byte ptr [si+48h], 3
		jnz	short loc_2EA82
		push	0
		push	3
		push	large [si+4Ah]
		push	word ptr [si+46h]
		push	word ptr [si+44h]
		push	word ptr [bp+var_10]
		push	word ptr [bp+var_12]
		push	6C14h
		call	Memory_TypedAllocDispatch_3296E
		add	sp, 12h
		jmp	short loc_2EAC7

loc_2EA82:
		push	0
		push	2
		push	large [si+4Ah]
		push	0
		mov	al, [si+48h]
		push	ax
		push	word ptr [si+46h]
		push	word ptr [si+44h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		mov	al, byte ptr [bp+var_10+2]
		push	ax
		push	word ptr [bp+var_10]
		push	word ptr [bp+var_12]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	6C14h
		call	Memory_TypedAllocDispatch_3296E
		add	sp, 12h

loc_2EAC7:
		jmp	short loc_2EAC9

loc_2EAC9:
		mov	eax, [bp+var_12]
		mov	[bp+var_28], eax
		mov	al, byte ptr [bp+var_10+2]
		mov	[bp+var_29], al
		mov	eax, [bp+var_28]
		mov	[si+44h], eax
		mov	al, [bp+var_29]
		mov	[si+48h], al
		mov	byte ptr [si+49h], 0
		mov	dword ptr [si+4Ah], 0
		mov	eax, [bp+var_C]
		mov	[si+4Ah], eax
		mov	byte ptr [bp+var_10+3], 0
		mov	byte ptr [si+49h], 1

loc_2EB01:
		cmp	byte ptr [bp+var_10+3], 0
		jz	short loc_2EB25
		cmp	[bp+var_12], 0
		jz	short loc_2EB25
		push	0
		mov	al, byte ptr [bp+var_10+2]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2EB25

loc_2EB25:
		mov	[bp+var_12], 0
		mov	byte ptr [bp+var_10+3], 0
		mov	[bp+var_C], 0

loc_2EB39:
		cmp	dword ptr [si+44h], 0
		jz	short loc_2EB43
		jmp	loc_2EC62

loc_2EB43:
		push	ds
		push	[bp+arg_2]
		call	sub_993C
		add	sp, 4
		or	al, al
		jnz	short loc_2EB56
		jmp	loc_2EC62

loc_2EB56:
		lea	ax, [bp+var_A2]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_A2]
		push	ax
		mov	bx, [bp+var_A2]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	ax, [bp+var_45]
		cmp	ax, [bp+arg_4]
		jg	short loc_2EB82
		jmp	loc_2EC53

loc_2EB82:
		push	[bp+arg_4]
		lea	ax, [bp+var_A2]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	eax, [bp+var_3D]
		mov	[bp+var_C], eax
		mov	ax, [bp+var_35]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_2EBAB
		mov	eax, [bp+var_41]
		jmp	short loc_2EBAF

loc_2EBAB:
		mov	eax, [bp+var_31]

loc_2EBAF:
		mov	edx, [bp+var_C]
		add	edx, eax
		mov	[bp+var_10], edx
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_10]
		jnz	short loc_2EBC7
		jmp	loc_2EC53

loc_2EBC7:
		lea	ax, [bp+var_11A]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		push	0
		push	large [bp+var_10]
		push	large [bp+var_C]
		lea	ax, [bp+var_A2]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_40FBE
		add	sp, 0Eh
		push	[bp+arg_6]
		lea	ax, [bp+var_11A]
		push	ax
		push	si
		push	cs
		call	near ptr sub_2E690
		add	sp, 6
		or	al, al
		jz	short loc_2EC44
		mov	ax, si
		add	ax, 37h
		mov	word ptr [bp+var_12], ax
		mov	bx, word ptr [bp+var_12]
		mov	eax, [bx]
		mov	[bp+var_16], eax
		mov	bx, word ptr [bp+var_12]
		mov	al, [bx+4]
		mov	byte ptr [bp+var_1A+3], al
		mov	eax, [bp+var_16]
		mov	[si+44h], eax
		mov	al, byte ptr [bp+var_1A+3]
		mov	[si+48h], al
		mov	byte ptr [si+49h], 0
		mov	dword ptr [si+4Ah], 0
		mov	bx, word ptr [bp+var_12]
		mov	eax, [bx+6]
		mov	[si+4Ah], eax

loc_2EC44:
		push	2
		lea	ax, [bp+var_11A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_2EC53:
		push	2
		lea	ax, [bp+var_A2]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_2EC62:
		cmp	dword ptr [si+44h], 0
		jnz	short loc_2EC6C
		jmp	loc_2ECFA

loc_2EC6C:
		mov	ax, si
		add	ax, 44h
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	sub_5D11
		add	sp, 4
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	sub_5D59
		add	sp, 2
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	word ptr [si+52h], 0
		cmp	[bp+var_C], 0
		jz	short loc_2ECEC
		mov	bx, [si+35h]
		mov	al, [bx+79h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_2ECB5
		cmp	word ptr [bp+var_C+2], 0A000h
		jnb	short loc_2ECEC

loc_2ECB5:
		mov	bx, [si+35h]
		mov	ax, [bx+4]
		mov	word ptr [bp+var_1A+2], ax
		push	0FFFFh
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	word ptr [bp+var_1A+2]
		call	sub_5053
		add	sp, 8
		mov	al, [bp+arg_A]
		mov	ah, 0
		push	ax
		push	word ptr [bp+var_1A+2]
		call	sub_5065
		add	sp, 4
		mov	[bp+var_1], 1
		mov	al, [bp+arg_8]
		mov	[si+41h], al

loc_2ECEC:
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_2ECFA:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_2E842		endp

; START OF FUNCTION CHUNK FOR sub_2E842
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2E842

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2ED05		proc far

var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	word ptr [si+35h], 0
		jz	short loc_2ED42
		mov	bx, [si+35h]
		push	word ptr [bx+4]
		call	sub_505F
		add	sp, 2
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 2
		jnz	short loc_2ED3D
		mov	al, [si+41h]
		cmp	al, [bp+arg_2]
		jb	short loc_2ED3D
		mov	ax, 1
		jmp	short loc_2ED3F

loc_2ED3D:
		xor	ax, ax

loc_2ED3F:
		mov	[bp+var_1], al

loc_2ED42:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_2ED05		endp

; START OF FUNCTION CHUNK FOR sub_2ED05
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2ED05

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2ED4B		proc far

var_10		= word ptr -10h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+35h], 0
		jnz	short loc_2ED5F
		jmp	loc_2EE50

loc_2ED5F:
		mov	bx, [si+35h]
		push	word ptr [bx+4]
		call	sub_505F
		add	sp, 2
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 2
		jnz	short loc_2ED79
		jmp	loc_2EE50

loc_2ED79:
		cmp	word ptr [si+52h], 0
		jz	short loc_2EDD8
		mov	bx, [si+35h]
		mov	di, [bx+4]
		mov	ax, si
		add	ax, 44h
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	sub_5D11
		add	sp, 4
		lea	ax, [bp+var_10]
		push	ax
		call	sub_5D59
		add	sp, 2
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		push	0FFFFh
		push	[bp+var_4]
		push	[bp+var_6]
		push	di
		call	sub_5053
		add	sp, 8
		push	0
		push	di
		call	sub_5065
		add	sp, 4
		dec	word ptr [si+52h]
		push	2
		lea	ax, [bp+var_10]
		push	ax
		call	sub_5C1C
		add	sp, 4
		jmp	short loc_2EE50

loc_2EDD8:
		cmp	byte ptr [si+49h], 0
		jz	short loc_2EDFE
		cmp	dword ptr [si+44h], 0
		jz	short loc_2EDFE
		push	0
		mov	al, [si+48h]
		push	ax
		mov	ax, si
		add	ax, 44h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2EDFE

loc_2EDFE:
		mov	dword ptr [si+44h], 0
		mov	byte ptr [si+49h], 0
		mov	dword ptr [si+4Ah], 0
		cmp	byte ptr [si+3Ch], 0
		jz	short loc_2EE38
		cmp	dword ptr [si+37h], 0
		jz	short loc_2EE38
		push	0
		mov	al, [si+3Bh]
		push	ax
		mov	ax, si
		add	ax, 37h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2EE38

loc_2EE38:
		mov	dword ptr [si+37h], 0
		mov	byte ptr [si+3Ch], 0
		mov	dword ptr [si+3Dh], 0
		mov	byte ptr [si+41h], 0
sub_2ED4B		endp
seg077		ends
