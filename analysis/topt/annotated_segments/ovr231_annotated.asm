ovr231		segment	para public 'OVERLAY' use16
		assume cs:ovr231
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BC230		proc far

var_42		= dword ptr -42h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_19		= byte ptr -19h
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		push	di
		mov	[bp+var_19], 0
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_1C], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_1C]
		add	es:[bx+1Ch], ax
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		mov	[bp+var_2A], eax
		push	1
		push	0
		push	2
		push	large [bp+var_2A]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_2E+2], dx
		mov	word ptr [bp+var_2E], ax
		mov	eax, [bp+var_2E]
		mov	[bp+var_26], eax
		mov	[bp+var_22], 2
		mov	[bp+var_21], 1
		mov	[bp+var_20], 0
		mov	eax, [bp+var_2A]
		mov	[bp+var_20], eax
		push	0
		mov	al, [bp+var_22]
		push	ax
		push	word ptr [bp+var_26+2]
		push	word ptr [bp+var_26]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		push	0
		mov	al, [bp+var_22]
		push	ax
		push	word ptr [bp+var_26+2]
		push	word ptr [bp+var_26]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_30], dx
		mov	[bp+var_32], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_36], eax
		mov	eax, dword_4F25C
		mov	[bp+var_3A], eax
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
		mov	[bp+var_3C], dx
		mov	[bp+var_3E], ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+18h]
		push	0FFh
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
		push	dx
		push	ax
		call	sub_358D
		add	sp, 8
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
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ch]
		sub	ax, [bp+var_1C]
		mov	si, ax
		jmp	loc_BC8FA

loc_BC37F:
		les	bx, [bp+var_32]
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	dx, 12h
		imul	dx
		mov	dx, word ptr [bp+var_3A+2]
		mov	bx, word ptr [bp+var_3A]
		add	bx, ax
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		les	bx, [bp+var_32]
		mov	al, es:[bx+2]
		mov	ah, 0
		mov	dx, 12h
		imul	dx
		mov	dx, word ptr [bp+var_3A+2]
		mov	bx, word ptr [bp+var_3A]
		add	bx, ax
		mov	[bp+var_12], dx
		mov	[bp+var_14], bx
		les	bx, [bp+var_32]
		mov	al, es:[bx+3]
		mov	ah, 0
		mov	dx, 12h
		imul	dx
		mov	dx, word ptr [bp+var_3A+2]
		mov	bx, word ptr [bp+var_3A]
		add	bx, ax
		mov	[bp+var_16], dx
		mov	[bp+var_18], bx
		les	bx, [bp+var_32]
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_36+2]
		mov	bx, word ptr [bp+var_36]
		add	bx, ax
		mov	[bp+var_2], dx
		mov	[bp+var_4], bx
		les	bx, [bp+var_32]
		mov	al, es:[bx+2]
		mov	ah, 0
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_36+2]
		mov	bx, word ptr [bp+var_36]
		add	bx, ax
		mov	[bp+var_6], dx
		mov	[bp+var_8], bx
		les	bx, [bp+var_32]
		mov	al, es:[bx+3]
		mov	ah, 0
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_36+2]
		mov	bx, word ptr [bp+var_36]
		add	bx, ax
		mov	[bp+var_A], dx
		mov	[bp+var_C], bx
		mov	ax, word_4C118
		xor	dx, dx
		sub	ax, [bp+var_3E]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, [bp+var_32]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 9
		jbe	short loc_BC45C
		jmp	loc_BC4DC

loc_BC45C:
		shl	bx, 1
		jmp	cs:off_BC942[bx]	; switch jump

loc_BC463:
		push	[bp+var_30]
		push	[bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_1FEF3
		add	sp, 14h
		push	12h
		push	word_4F234
		push	word_4F232
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_1FC7B
		add	sp, 14h
		add	word_4C118, 12h
		add	word_4C11C, 27h
		jmp	loc_BC8F5

loc_BC4DC:
		push	[bp+var_30]
		push	[bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_200E3
		add	sp, 14h
		push	12h
		push	word_4F23C
		push	word_4F23A
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_1FC7B
		add	sp, 14h
		add	word_4C118, 12h
		add	word_4C11C, 27h
		jmp	loc_BC8F5

loc_BC555:
		push	[bp+var_30]
		push	[bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_20272
		add	sp, 14h
		push	12h
		push	word_4F238
		push	word_4F236
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_1FC7B
		add	sp, 14h
		add	word_4C118, 12h
		add	word_4C11C, 2Ah
		jmp	loc_BC8F5

loc_BC5CE:
		push	[bp+var_30]
		push	[bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_205CF
		add	sp, 14h
		push	19h
		push	word_4F240
		push	word_4F23E
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_20612
		add	sp, 14h
		add	word_4C118, 19h
		add	word_4C11C, 29h
		jmp	loc_BC8F5

loc_BC647:
		mov	al, [bp+var_19]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BC694
		les	bx, [bp+var_32]
		mov	al, es:[bx+4]
		cbw
		push	ax
		push	68AEh
		call	sub_23992
		add	sp, 4
		mov	di, ax
		cmp	di, 0FFFFh
		jz	short loc_BC688
		push	0
		push	large 0
		push	0C8h
		push	di
		push	68AEh
		call	sub_243D1
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+7Bh], al
		jmp	short loc_BC690

loc_BC688:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+7Bh], 0

loc_BC690:
		mov	[bp+var_19], 1

loc_BC694:
		push	[bp+var_30]
		push	[bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_20937
		add	sp, 14h
		push	12h
		push	word_4F244
		push	word_4F242
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_20976
		add	sp, 14h
		add	word_4C118, 12h
		add	word_4C11C, 28h
		jmp	loc_BC8F5

loc_BC70D:
		mov	eax, dword ptr word_4C11C
		mov	[bp+var_42], eax
		push	[bp+var_30]
		push	[bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word ptr [bp+var_42+2]
		push	word ptr [bp+var_42]
		call	sub_1FB70
		add	sp, 14h
		push	12h
		push	word_4F248
		push	word_4F246
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_1FC7B
		add	sp, 14h
		add	word_4C118, 12h
		add	word_4C11C, 2Eh
		jmp	loc_BC8F5

loc_BC78C:
		push	[bp+var_30]
		push	[bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_210B0
		add	sp, 14h
		push	19h
		push	word_4F24C
		push	word_4F24A
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_210F3
		add	sp, 14h
		add	word_4C118, 19h
		add	word_4C11C, 31h
		jmp	loc_BC8F5

loc_BC805:
		push	[bp+var_30]
		push	[bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_21528
		add	sp, 14h
		push	14h
		push	word_4F250
		push	word_4F24E
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_21567
		add	sp, 14h
		add	word_4C118, 14h
		add	word_4C11C, 30h
		jmp	short loc_BC8F5

loc_BC87D:
		push	[bp+var_30]
		push	[bp+var_32]
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_1FB70
		add	sp, 14h
		push	19h
		push	word_4F254
		push	word_4F252
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_E]
		push	[bp+var_10]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_1FC7B
		add	sp, 14h
		add	word_4C118, 19h
		add	word_4C11C, 2Eh
		jmp	short loc_BC8F5

loc_BC8F5:
		inc	si
		add	[bp+var_32], 8

loc_BC8FA:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jle	short loc_BC906
		jmp	loc_BC37F

loc_BC906:
		cmp	[bp+var_21], 0
		jz	short loc_BC92A
		cmp	[bp+var_26], 0
		jz	short loc_BC92A
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BC92A

loc_BC92A:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		pop	di
		pop	si
		leave
		retf
sub_BC230		endp

; START OF FUNCTION CHUNK FOR sub_BC230
off_BC942	dw offset loc_BC463
		dw offset loc_BC4DC
		dw offset loc_BC555
		dw offset loc_BC647
		dw offset loc_BC5CE
		dw offset loc_BC647
		dw offset loc_BC70D
		dw offset loc_BC78C
		dw offset loc_BC805
		dw offset loc_BC87D
; END OF FUNCTION CHUNK FOR sub_BC230
ovr231		ends
