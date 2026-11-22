ovr208		segment	para public 'OVERLAY' use16
		assume cs:ovr208
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_74EA0		proc far

var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_D], 0
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+26h]
		mov	es:[bx+2Ch], ax
		add	es:[bx+26h], di
		mov	eax, [si+72h]
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[bp+var_18], eax
		mov	byte ptr [bp+var_16+2], 2
		mov	byte ptr [bp+var_16+3], 1
		mov	[bp+var_12], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_12], eax
		cmp	byte ptr [bp+var_16+2], 3
		jnz	short loc_74F2D
		push	0
		mov	al, byte ptr [bp+var_16+2]
		push	ax
		push	large [bp+var_18]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_74F34

loc_74F2D:
		mov	edx, [bp+var_16]
		mov	ax, word ptr [bp+var_18]

loc_74F34:
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		cmp	byte ptr [bp+var_16+2], 3
		jnz	short loc_74F5C
		push	0
		mov	al, byte ptr [bp+var_16+2]
		push	ax
		push	large [bp+var_18]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_74F63

loc_74F5C:
		mov	edx, [bp+var_16]
		mov	ax, word ptr [bp+var_18]

loc_74F63:
		mov	[bp+var_22], dx
		mov	[bp+var_24], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_30], eax
		push	0
		mov	al, es:[bx+20h]
		push	ax
		push	large es:[bx+1Ch]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_32], dx
		mov	[bp+var_34], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+26h]
		sub	si, di
		jmp	loc_752EA

loc_74FB8:
		les	bx, [bp+var_24]
		mov	al, es:[bx+1]
		mov	ah, 0
		imul	ax, ax, 2Ah
		mov	dx, word ptr [bp+var_30+2]
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		mov	bx, [bp+var_24]
		mov	al, es:[bx+2]
		mov	ah, 0
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	bx, [bp+var_24]
		mov	al, es:[bx+3]
		mov	ah, 0
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		mov	ax, word_5C350
		xor	dx, dx
		sub	ax, [bp+var_34]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, [bp+var_24]
		mov	al, es:[bx+4]
		mov	byte ptr [bp+var_2C+1], al
		mov	al, es:[bx]
		mov	byte ptr [bp+var_2C], al
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	[bp+var_2A], ax
		mov	al, es:[bx+2]
		mov	ah, 0
		mov	[bp+var_28], ax
		mov	al, es:[bx+3]
		mov	ah, 0
		mov	[bp+var_26], ax
		mov	al, es:[bx]
		mov	byte ptr [bp+var_2C], al
		cbw
		mov	bx, ax
		cmp	bx, 0Ah
		ja	short loc_75099
		shl	bx, 1
		jmp	cs:off_7531E[bx]	; switch jump

loc_7505F:
		push	4
		push	large dword_60058
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	FaceType0_Setup_30CCD
		add	sp, 14h
		add	word_5C350, 1Eh
		jmp	loc_752E5

loc_75099:
		push	4
		push	large dword_60060
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	FaceType1_Setup_30EA6
		add	sp, 14h
		add	word_5C350, 1Eh
		jmp	loc_752E5

loc_750D3:
		push	4
		push	large dword_6005C
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_31071
		add	sp, 14h
		add	word_5C350, 20h
		jmp	loc_752E5

loc_7510D:
		push	4
		push	large dword_60064
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_3146D
		add	sp, 14h
		add	word_5C350, 24h
		jmp	loc_752E5

loc_75147:
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_75196
		les	bx, [bp+var_24]
		mov	al, es:[bx+4]
		cbw
		push	ax
		push	63DEh
		call	Table_LookupByRange_3513A
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_75189
		push	0
		push	large 0
		push	0C8h
		push	ax
		push	63DEh
		call	Palette_ShadeIndexWithFog_35C7C
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+89h], al
		jmp	short loc_75192

loc_75189:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+89h], 0

loc_75192:
		mov	[bp+var_D], 1

loc_75196:
		push	4
		push	large dword_60068
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_31774
		add	sp, 14h
		add	word_5C350, 1Eh
		jmp	loc_752E5

loc_751D0:
		push	4
		push	large dword_6006C
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_30973
		add	sp, 14h
		add	word_5C350, 2Ch
		jmp	loc_752E5

loc_7520A:
		push	4
		push	large dword_60070
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_31DEE
		add	sp, 14h
		add	word_5C350, 34h
		jmp	loc_752E5

loc_75244:
		push	4
		push	large dword_60074
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_321CB
		jmp	short loc_752DD

loc_75275:
		push	4
		push	large dword_60078
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_30973
		add	sp, 14h
		add	word_5C350, 34h
		jmp	short loc_752E5

loc_752AE:
		push	4
		push	large dword_6007C
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_329A0

loc_752DD:
		add	sp, 14h
		add	word_5C350, 2Eh

loc_752E5:
		inc	si
		add	[bp+var_24], 8

loc_752EA:
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], si
		jle	short loc_752F6
		jmp	loc_74FB8

loc_752F6:
		cmp	byte ptr [bp+var_16+3], 0
		jz	short loc_7531A
		cmp	[bp+var_18], 0
		jz	short loc_7531A
		push	0
		mov	al, byte ptr [bp+var_16+2]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7531A

loc_7531A:
		pop	di
		pop	si
		leave
		retf
sub_74EA0		endp

; START OF FUNCTION CHUNK FOR sub_74EA0
off_7531E	dw offset loc_7505F
		dw offset loc_75099
		dw offset loc_750D3
		dw offset loc_75147
		dw offset loc_7510D
		dw offset loc_75147
		dw offset loc_751D0
		dw offset loc_7520A
		dw offset loc_75244
		dw offset loc_75275
		dw offset loc_752AE
; END OF FUNCTION CHUNK FOR sub_74EA0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_75334		proc far

var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_D], 0
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+26h]
		mov	es:[bx+2Ch], ax
		add	es:[bx+26h], di
		mov	eax, [si+72h]
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[bp+var_18], eax
		mov	byte ptr [bp+var_16+2], 2
		mov	byte ptr [bp+var_16+3], 1
		mov	[bp+var_12], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_12], eax
		cmp	byte ptr [bp+var_16+2], 3
		jnz	short loc_753C1
		push	0
		mov	al, byte ptr [bp+var_16+2]
		push	ax
		push	large [bp+var_18]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_753C8

loc_753C1:
		mov	edx, [bp+var_16]
		mov	ax, word ptr [bp+var_18]

loc_753C8:
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		cmp	byte ptr [bp+var_16+2], 3
		jnz	short loc_753F0
		push	0
		mov	al, byte ptr [bp+var_16+2]
		push	ax
		push	large [bp+var_18]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_753F7

loc_753F0:
		mov	edx, [bp+var_16]
		mov	ax, word ptr [bp+var_18]

loc_753F7:
		mov	word ptr [bp+var_24+2], dx
		mov	word ptr [bp+var_24], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_28], eax
		push	0
		mov	al, es:[bx+20h]
		push	ax
		push	large es:[bx+1Ch]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_2A], dx
		mov	[bp+var_2C], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+26h]
		sub	si, di
		jmp	loc_75743

loc_7544C:
		les	bx, word ptr [bp+var_24]
		mov	ax, es:[bx+2]
		imul	ax, ax, 2Ah
		mov	dx, word ptr [bp+var_28+2]
		mov	bx, word ptr [bp+var_28]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		mov	bx, word ptr [bp+var_24]
		mov	ax, es:[bx+4]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_28]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	bx, word ptr [bp+var_24]
		mov	ax, es:[bx+6]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_28]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		mov	ax, word_5C350
		xor	dx, dx
		sub	ax, [bp+var_2C]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, word ptr [bp+var_24]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 0Ah
		ja	short loc_754FB
		shl	bx, 1
		jmp	cs:off_75777[bx]	; switch jump

loc_754C2:
		push	4
		push	large dword_60058
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	FaceType0_Setup_30CCD
		add	sp, 14h
		add	word_5C350, 1Eh
		jmp	loc_7573E

loc_754FB:
		push	4
		push	large dword_60060
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	FaceType1_Setup_30EA6
		add	sp, 14h
		add	word_5C350, 1Eh
		jmp	loc_7573E

loc_75534:
		push	4
		push	large dword_6005C
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_31071
		add	sp, 14h
		add	word_5C350, 20h
		jmp	loc_7573E

loc_7556D:
		push	4
		push	large dword_60064
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_3146D
		add	sp, 14h
		add	word_5C350, 24h
		jmp	loc_7573E

loc_755A6:
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_755F5
		les	bx, word ptr [bp+var_24]
		mov	al, es:[bx+1]
		cbw
		push	ax
		push	63DEh
		call	Table_LookupByRange_3513A
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_755E8
		push	0
		push	large 0
		push	0C8h
		push	ax
		push	63DEh
		call	Palette_ShadeIndexWithFog_35C7C
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+89h], al
		jmp	short loc_755F1

loc_755E8:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+89h], 0

loc_755F1:
		mov	[bp+var_D], 1

loc_755F5:
		push	4
		push	large dword_60068
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_31774
		add	sp, 14h
		add	word_5C350, 1Eh
		jmp	loc_7573E

loc_7562E:
		push	4
		push	large dword_6006C
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_30973
		add	sp, 14h
		add	word_5C350, 2Ch
		jmp	loc_7573E

loc_75667:
		push	4
		push	large dword_60070
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_31DEE
		add	sp, 14h
		add	word_5C350, 34h
		jmp	loc_7573E

loc_756A0:
		push	4
		push	large dword_60074
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_321CB
		jmp	short loc_75736

loc_756D0:
		push	4
		push	large dword_60078
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_30973
		add	sp, 14h
		add	word_5C350, 34h
		jmp	short loc_7573E

loc_75708:
		push	4
		push	large dword_6007C
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_329A0

loc_75736:
		add	sp, 14h
		add	word_5C350, 2Eh

loc_7573E:
		inc	si
		add	word ptr [bp+var_24], 8

loc_75743:
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], si
		jle	short loc_7574F
		jmp	loc_7544C

loc_7574F:
		cmp	byte ptr [bp+var_16+3], 0
		jz	short loc_75773
		cmp	[bp+var_18], 0
		jz	short loc_75773
		push	0
		mov	al, byte ptr [bp+var_16+2]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_75773

loc_75773:
		pop	di
		pop	si
		leave
		retf
sub_75334		endp

; START OF FUNCTION CHUNK FOR sub_75334
off_75777	dw offset loc_754C2
		dw offset loc_754FB
		dw offset loc_75534
		dw offset loc_755A6
		dw offset loc_7556D
		dw offset loc_755A6
		dw offset loc_7562E
		dw offset loc_75667
		dw offset loc_756A0
		dw offset loc_756D0
		dw offset loc_75708
; END OF FUNCTION CHUNK FOR sub_75334

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7578D		proc far

var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_11], 0
		mov	eax, [si+72h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	di, ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+26h]
		mov	es:[bx+2Eh], ax
		add	es:[bx+26h], di
		mov	eax, [si+72h]
		mov	[bp+var_20], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_24+2], dx
		mov	word ptr [bp+var_24], ax
		mov	eax, [bp+var_24]
		mov	[bp+var_1C], eax
		mov	byte ptr [bp+var_1A+2], 2
		mov	byte ptr [bp+var_1A+3], 1
		mov	[bp+var_16], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_16], eax
		cmp	byte ptr [bp+var_1A+2], 3
		jnz	short loc_7581A
		push	0
		mov	al, byte ptr [bp+var_1A+2]
		push	ax
		push	large [bp+var_1C]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_75821

loc_7581A:
		mov	edx, [bp+var_1A]
		mov	ax, word ptr [bp+var_1C]

loc_75821:
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		cmp	byte ptr [bp+var_1A+2], 3
		jnz	short loc_75849
		push	0
		mov	al, byte ptr [bp+var_1A+2]
		push	ax
		push	large [bp+var_1C]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_75850

loc_75849:
		mov	edx, [bp+var_1A]
		mov	ax, word ptr [bp+var_1C]

loc_75850:
		mov	word ptr [bp+var_28+2], dx
		mov	word ptr [bp+var_28], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_2C], eax
		push	0
		mov	al, es:[bx+20h]
		push	ax
		push	large es:[bx+1Ch]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_2E], dx
		mov	[bp+var_30], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+26h]
		sub	si, di
		jmp	loc_75BC1

loc_7588B:
		les	bx, word ptr [bp+var_28]
		mov	ax, es:[bx+2]
		imul	ax, ax, 2Ah
		mov	dx, word ptr [bp+var_2C+2]
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		mov	bx, word ptr [bp+var_28]
		mov	ax, es:[bx+4]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	bx, word ptr [bp+var_28]
		mov	ax, es:[bx+6]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		mov	bx, word ptr [bp+var_28]
		mov	ax, es:[bx+8]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], bx
		mov	ax, word_5C350
		xor	dx, dx
		sub	ax, [bp+var_30]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, word ptr [bp+var_28]
		mov	al, es:[bx]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 0Ah
		ja	short loc_75954
		shl	bx, 1
		jmp	cs:off_75BF5[bx]	; switch jump

loc_75917:
		push	4
		push	large dword_6002C
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2BC7D
		add	sp, 18h
		add	word_5C350, 22h
		jmp	loc_75BBC

loc_75954:
		push	4
		push	large dword_60034
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2BE65
		add	sp, 18h
		add	word_5C350, 22h
		jmp	loc_75BBC

loc_75991:
		push	4
		push	large dword_60030
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2C034
		add	sp, 18h
		add	word_5C350, 24h
		jmp	loc_75BBC

loc_759CE:
		push	4
		push	large dword_60038
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2C435
		add	sp, 18h
		add	word_5C350, 28h
		jmp	loc_75BBC

loc_75A0B:
		mov	al, [bp+var_11]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_75A5B
		les	bx, word ptr [bp+var_28]
		mov	al, es:[bx+1]
		mov	ah, 0
		push	ax
		push	63DEh
		call	Table_LookupByRange_3513A
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_75A4E
		push	0
		push	large 0
		push	0C8h
		push	ax
		push	63DEh
		call	Palette_ShadeIndexWithFog_35C7C
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+89h], al
		jmp	short loc_75A57

loc_75A4E:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+89h], 0

loc_75A57:
		mov	[bp+var_11], 1

loc_75A5B:
		push	4
		push	large dword_6003C
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2C740
		add	sp, 18h
		add	word_5C350, 22h
		jmp	loc_75BBC

loc_75A98:
		push	4
		push	large dword_60040
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2B881
		add	sp, 18h
		add	word_5C350, 34h
		jmp	loc_75BBC

loc_75AD5:
		push	4
		push	large dword_60044
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2CE2A
		add	sp, 18h
		add	word_5C350, 3Ch
		jmp	loc_75BBC

loc_75B12:
		push	4
		push	large dword_60048
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2D20B
		jmp	short loc_75BB4

loc_75B46:
		push	4
		push	large dword_6004C
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2B881
		add	sp, 18h
		add	word_5C350, 3Ch
		jmp	short loc_75BBC

loc_75B82:
		push	4
		push	large dword_60050
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2D896

loc_75BB4:
		add	sp, 18h
		add	word_5C350, 36h

loc_75BBC:
		inc	si
		add	word ptr [bp+var_28], 0Ah

loc_75BC1:
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], si
		jle	short loc_75BCD
		jmp	loc_7588B

loc_75BCD:
		cmp	byte ptr [bp+var_1A+3], 0
		jz	short loc_75BF1
		cmp	[bp+var_1C], 0
		jz	short loc_75BF1
		push	0
		mov	al, byte ptr [bp+var_1A+2]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_75BF1

loc_75BF1:
		pop	di
		pop	si
		leave
		retf
sub_7578D		endp

; START OF FUNCTION CHUNK FOR sub_7578D
off_75BF5	dw offset loc_75917
		dw offset loc_75954
		dw offset loc_75991
		dw offset loc_75A0B
		dw offset loc_759CE
		dw offset loc_75A0B
		dw offset loc_75A98
		dw offset loc_75AD5
		dw offset loc_75B12
		dw offset loc_75B46
		dw offset loc_75B82
; END OF FUNCTION CHUNK FOR sub_7578D
ovr208		ends
