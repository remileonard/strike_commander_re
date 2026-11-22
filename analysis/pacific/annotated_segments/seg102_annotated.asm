seg102		segment	para public 'CODE' use16
		assume cs:seg102
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 74h, 7, 56h, 9Ah, 0B2h, 3, 0, 0, 59h

loc_402F9:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_402FD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+5Ch], 0
		pop	bp
		retf
sub_402FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4030E		proc far
		push	bp
		mov	bp, sp
		mov	al, 13h
		pop	bp
		retf
sub_4030E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40315		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_4039B
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1D8Ch
		cmp	dword ptr es:[bx+5Ch], 0
		jz	short loc_40354
		mov	eax, es:[bx+5Ch]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_40354

loc_40354:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+72h], 0
		jz	short loc_4036C
		push	large es:[bx+72h]
		call	sub_3C0
		add	sp, 4

loc_4036C:
		push	0
		push	large [bp+arg_0]
		call	sub_741D9
		add	sp, 6
		test	si, 1
		jz	short loc_4039B
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_4039B:
		pop	si
		leave
		retf
sub_40315		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4039E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 13h
		pop	bp
		retf
sub_4039E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_403A8		proc far

var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= word ptr -82h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= word ptr -74h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3C		= dword ptr -3Ch
var_3A		= dword ptr -3Ah
var_38		= dword ptr -38h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0C6h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	[bp+var_2], ax
		cmp	word ptr [si+26h], 0
		jz	short loc_403C9
		mov	ax, 1
		jmp	short loc_403CB

loc_403C9:
		xor	ax, ax

loc_403CB:
		mov	[bp+var_11], al
		mov	[bp+var_12], 0
		cmp	[bp+var_11], 0
		jnz	short loc_403DB
		jmp	loc_40486

loc_403DB:
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		push	dx
		push	ax
		les	bx, [bp+var_16]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 18h
		jnz	short loc_4040D
		mov	bx, [si+24h]
		cmp	byte ptr [bx+116h], 0
		jz	short loc_40486
		mov	al, 0
		jmp	loc_40C57

loc_4040D:
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_18], dx
		mov	[bp+var_1A], ax
		push	dx
		push	ax
		les	bx, [bp+var_1A]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jnz	short loc_4043F
		mov	bx, [si+24h]
		cmp	byte ptr [bx+116h], 0
		jz	short loc_40486
		mov	al, 0
		jmp	loc_40C57

loc_4043F:
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_1C], dx
		mov	[bp+var_1E], ax
		push	dx
		push	ax
		les	bx, [bp+var_1E]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jnz	short loc_40486
		mov	bx, [si+24h]
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_40486
		mov	al, 0
		jmp	loc_40C57

loc_40486:
		les	bx, [si+0Eh]
		mov	ax, es:[bx+6Eh]
		mov	dx, es:[bx+6Ch]
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		cmp	[bp+var_11], 0
		jz	short loc_404D3
		mov	ax, [si+24h]
		cmp	ax, word_7CADA
		jnz	short loc_404D3
		cmp	byte_7769B, 0
		jz	short loc_404D3
		push	si
		nop
		push	cs
		call	near ptr sub_4103C
		pop	cx
		mov	eax, dword_7976E
		sub	[si+58h], eax
		push	si
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_404CE
		mov	al, 0
		jmp	loc_40C57

loc_404CE:
		mov	al, 1
		jmp	loc_40C57

loc_404D3:
		mov	[bp+var_1F], 0
		cmp	word ptr [si+52h], 0
		jz	short loc_4051C
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_4051C
		mov	bx, [si+52h]
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_4051C
		push	0
		mov	ax, si
		add	ax, 52h
		push	ax
		call	SetReference16
		add	sp, 4

loc_4051C:
		cmp	[bp+var_11], 0
		jz	short loc_40538
		mov	bx, [si+24h]
		mov	al, [bx+51h]
		mov	[bp+var_10], al
		cmp	[bp+var_10], 0FFh
		jnz	short loc_4053E
		mov	byte_776AC, 1
		jmp	short loc_4053E

loc_40538:
		mov	al, [si+51h]
		mov	[bp+var_10], al

loc_4053E:
		cmp	word ptr [si+52h], 0
		jz	short loc_40547
		jmp	loc_4065E

loc_40547:
		cmp	dword ptr [si+58h], 0
		jle	short loc_40551
		jmp	loc_4065E

loc_40551:
		mov	[bp+var_20], 0
		xor	di, di
		push	6
		push	1
		push	0B4h
		les	bx, [si+0Eh]
		push	large es:[bx+4Dh]
		push	si
		push	67ADh
		call	sub_1EE4B
		add	sp, 0Eh
		mov	word ptr [bp+var_24+2], ax
		push	ax
		mov	ax, si
		add	ax, 52h
		push	ax
		call	SetReference16
		add	sp, 4
		jmp	loc_4060E

loc_40587:
		or	di, di
		jnz	short loc_4058E
		mov	di, [si+52h]

loc_4058E:
		cmp	word ptr [si+52h], 0
		jz	short loc_405D5
		mov	bx, [si+52h]
		mov	al, [bx+51h]
		cmp	al, [bp+var_10]
		jz	short loc_405D5
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_405D1
		mov	bx, [si+52h]
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_405D5
		mov	[bp+var_20], 1
		jmp	short loc_405D5

loc_405D1:
		mov	[bp+var_20], 1

loc_405D5:
		mov	al, [bp+var_20]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4060E
		push	1
		push	1
		push	0B4h
		les	bx, [si+0Eh]
		push	large es:[bx+4Dh]
		push	word ptr [si+52h]
		push	si
		push	67ADh
		call	sub_1EA93
		add	sp, 10h
		mov	word ptr [bp+var_24], ax
		push	ax
		mov	ax, si
		add	ax, 52h
		push	ax
		call	SetReference16
		add	sp, 4

loc_4060E:
		cmp	[si+52h], di
		jz	short loc_4061F
		mov	al, [bp+var_20]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4061F
		jmp	loc_40587

loc_4061F:
		mov	al, [bp+var_20]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40672
		push	0
		mov	ax, si
		add	ax, 52h
		push	ax
		call	SetReference16
		add	sp, 4
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		shl	ax, 8
		movsx	eax, ax
		mov	[si+58h], eax
		jmp	short loc_40672

loc_4065E:
		mov	eax, dword_7976E
		sub	[si+58h], eax
		cmp	word ptr byte_7CB11, 0
		jnz	short loc_40672
		sub	dword ptr [si+58h], 0Ah

loc_40672:
		cmp	dword ptr [si+58h], 0
		jle	short loc_4067C
		jmp	loc_40C44

loc_4067C:
		mov	dword ptr [si+58h], 0
		cmp	word ptr [si+52h], 0
		jnz	short loc_4068D
		jmp	loc_40AA2

loc_4068D:
		mov	di, [si+52h]
		add	di, 12h
		mov	ax, [bp+var_2]
		mov	[bp+var_26], ax
		mov	eax, [di]
		mov	bx, [bp+var_26]
		sub	eax, [bx]
		mov	[bp+var_A2], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_9E], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_9A], eax
		push	eax
		push	large [bp+var_9E]
		push	large [bp+var_A2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_2A], eax
		mov	[bp+var_2E], eax
		mov	[bp+var_24], eax
		les	bx, [si+0Eh]
		mov	eax, es:[bx+51h]
		mov	[bp+var_32], eax
		shl	eax, 8
		cmp	eax, [bp+var_24]
		jle	short loc_40700
		mov	ax, 1
		jmp	short loc_40702

loc_40700:
		xor	ax, ax

loc_40702:
		or	al, al
		jnz	short loc_40709
		jmp	loc_40A8E

loc_40709:
		call	CRT_Rand
		movsx	eax, ax
		shl	eax, 7
		mov	ebx, 8000h
		cdq
		idiv	ebx
		movsx	eax, ax
		mov	[bp+var_A], eax
		sub	[bp+var_A], 3Fh
		cmp	[bp+var_10], 0FFh
		jnz	short loc_40760
		cmp	word ptr byte_7CB11, 0
		jz	short loc_40760
		cmp	word ptr byte_7CB11, 2
		jnz	short loc_40754
		mov	[bp+var_12], 1
		mov	eax, [bp+var_A]
		imul	eax, eax, 3
		mov	[bp+var_A], eax
		jmp	short loc_40760

loc_40754:
		mov	eax, [bp+var_A]
		imul	eax, eax, 2
		mov	[bp+var_A], eax

loc_40760:
		push	large [bp+var_9A]
		push	large [bp+var_9E]
		push	large [bp+var_A2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_3A], eax
		mov	[bp+var_36], eax
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_E]
		add	dx, 85h
		mov	word ptr [bp+var_42+2], ax
		mov	word ptr [bp+var_42], dx
		les	bx, word ptr [bp+var_42]
		mov	eax, es:[bx]
		mov	[bp+var_46], eax
		lea	ax, word ptr [bp+var_46]
		mov	word ptr [bp+var_4A+2], ss
		mov	word ptr [bp+var_4A], ax
		les	bx, word ptr [bp+var_4A]
		mov	eax, es:[bx]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_36]
		mov	edx, eax
		mov	ecx, [bp+var_3E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6], eax
		mov	eax, [bp+var_A]
		add	[bp+var_6], eax
		mov	al, [bp+var_12]
		mov	ah, 0
		or	ax, ax
		jz	short loc_407E0
		jmp	loc_408BD

loc_407E0:
		push	word ptr [si+52h]
		push	ss
		lea	ax, word ptr [bp+var_BA]
		push	ax
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		lea	di, word ptr [bp+var_BA]
		cmp	word ptr [si+24h], 0
		jz	short loc_4082C
		push	word ptr [si+24h]
		push	ss
		lea	ax, word ptr [bp+var_C6]
		push	ax
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_C6]
		sub	[di], eax
		mov	eax, [bp+var_C2]
		sub	[di+4], eax
		mov	eax, [bp+var_BE]
		sub	[di+8], eax

loc_4082C:
		mov	eax, [di]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_96], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_92], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8E], eax
		mov	dx, word ptr [bp+var_6+1]
		inc	dx
		mov	ax, word ptr [bp+var_6+1]
		imul	dx
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_82], ax
		movsx	eax, [bp+var_82]
		mov	edx, dword_7942B
		imul	edx, eax
		mov	[bp+var_86], edx
		mov	eax, [bp+var_86]
		mov	[bp+var_8A], eax
		sub	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		add	[bp+var_A2], eax
		mov	eax, [bp+var_92]
		add	[bp+var_9E], eax
		mov	eax, [bp+var_8E]
		add	[bp+var_9A], eax

loc_408BD:
		cmp	[bp+var_11], 0
		jz	short loc_408E1
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_82], ax
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4

loc_408E1:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	di, ax
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_A2]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_4E], eax
		lea	ax, word ptr [bp+var_52]
		push	ax
		call	Weapon_ComputeVectorLength_57F78
		pop	cx
		mov	eax, [bp+var_9E]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_56], eax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		call	Weapon_ComputeVectorLength_57F78
		pop	cx
		lea	ax, word ptr [bp+var_56]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_5E]
		push	ax
		call	Math_AsinDeg_567D3
		add	sp, 6
		mov	eax, [bp+var_5E]
		mov	[bp+var_AE], eax
		mov	[bp+var_62], 0
		mov	eax, [bp+var_62]
		mov	[bp+var_AA], eax
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_66]
		push	ax
		call	Math_AsinDeg_567D3
		add	sp, 6
		xor	eax, eax
		sub	eax, [bp+var_66]
		mov	[bp+var_6A], eax
		mov	[bp+var_6E], eax
		mov	[bp+var_A6], eax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+55h]
		imul	ax, ax, 0Ah
		mov	[bp+var_74], ax
		movsx	eax, [bp+var_74]
		mov	edx, dword_7976E
		imul	edx, eax
		mov	[bp+var_78], edx
		mov	eax, [bp+var_78]
		mov	[bp+var_72], eax
		push	large [bp+var_A6]
		push	large [bp+var_AA]
		push	large [bp+var_AE]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_7C], eax
		mov	[bp+var_80], eax
		cmp	eax, [bp+var_72]
		jle	short loc_409D5
		mov	ax, 1
		jmp	short loc_409D7

loc_409D5:
		xor	ax, ax

loc_409D7:
		or	al, al
		jz	short loc_40A58
		lea	ax, word ptr [bp+var_AE]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_AE]
		mov	edx, [bp+var_72]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AA]
		mov	edx, [bp+var_72]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_A6]
		mov	edx, [bp+var_72]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A6], eax
		mov	[bp+var_1F], 0
		sub	sp, 0Ch
		mov	eax, [bp+var_AE]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_CE], eax
		push	si
		nop
		push	cs
		call	near ptr sub_40C5B
		add	sp, 0Eh
		jmp	short loc_40A85

loc_40A58:
		sub	sp, 0Ch
		mov	eax, [bp+var_AE]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_CE], eax
		push	si
		nop
		push	cs
		call	near ptr sub_40C5B
		add	sp, 0Eh
		mov	[bp+var_1F], al

loc_40A85:
		push	di
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		jmp	short loc_40AA2

loc_40A8E:
		mov	[bp+var_1F], 0
		push	0
		mov	ax, si
		add	ax, 52h
		push	ax
		call	SetReference16
		add	sp, 4

loc_40AA2:
		cmp	[bp+var_1F], 0
		jnz	short loc_40AAB
		jmp	loc_40C44

loc_40AAB:
		mov	di, word_7CEF9
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	word ptr [bp+var_24+2], ax
		mov	ax, [si+24h]
		cmp	ax, word ptr [bp+var_24+2]
		jz	short loc_40AC5
		jmp	loc_40BDD

loc_40AC5:
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_E]
		add	dx, 73h
		mov	word ptr [bp+var_32], ax
		mov	word ptr [bp+var_36+2], dx
		les	bx, word ptr [bp+var_36+2]
		mov	eax, es:[bx]
		mov	[bp+var_38], eax
		mov	[bp+var_3C], 0
		cmp	eax, [bp+var_3C]
		jnz	short loc_40AF2
		mov	ax, 1
		jmp	short loc_40AF4

loc_40AF2:
		xor	ax, ax

loc_40AF4:
		mov	ah, 0
		mov	word ptr [bp+var_32+2], ax
		mov	di, [si+24h]
		add	di, 12h
		mov	ax, si
		add	ax, 12h
		mov	word ptr [bp+var_3E], ax
		mov	eax, [di]
		mov	bx, word ptr [bp+var_3E]
		add	eax, [bx]
		mov	[bp+var_AE], eax
		mov	eax, [di+4]
		add	eax, [bx+4]
		mov	[bp+var_AA], eax
		mov	eax, [di+8]
		add	eax, [bx+8]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_B2], eax
		mov	di, word_7CEF9
		add	di, 14h
		mov	eax, [bp+var_BA]
		sub	eax, [di]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_B6]
		sub	eax, [di+4]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_B2]
		sub	eax, [di+8]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_C6]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_C2]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_BE]
		mov	[bp+var_9A], eax
		push	eax
		push	large [bp+var_9E]
		push	large [bp+var_A2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_46], eax
		mov	[bp+var_4A], eax
		sar	eax, 8
		mov	[bp+var_42], eax
		push	word ptr [si+24h]
		push	eax
		cmp	word ptr [bp+var_32+2], 0
		jz	short loc_40BD2
		mov	al, 18h
		jmp	short loc_40BD4

loc_40BD2:
		mov	al, 0

loc_40BD4:
		push	ax
		call	sub_5EBFB
		add	sp, 8

loc_40BDD:
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_E]
		add	dx, 73h
		mov	word ptr [bp+var_24], ax
		mov	[bp+var_26], dx
		les	bx, [bp+var_26]
		mov	eax, es:[bx]
		mov	[bp+var_2A], eax
		mov	[bp+var_2E], 0
		cmp	eax, [bp+var_2E]
		jnz	short loc_40C0A
		mov	ax, 1
		jmp	short loc_40C0C

loc_40C0A:
		xor	ax, ax

loc_40C0C:
		or	al, al
		jz	short loc_40C2B
		sub	sp, 4
		mov	eax, [bp+var_6]
		mov	[bp+var_CE], eax
		push	si
		push	word_79799
		call	sub_4F791
		add	sp, 8
		jmp	short loc_40C44

loc_40C2B:
		sub	sp, 4
		mov	[bp+var_CE], 0
		push	si
		push	word_79799
		call	sub_4F791
		add	sp, 8

loc_40C44:
		push	si
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_40C55
		mov	al, 0
		jmp	short loc_40C57

loc_40C55:
		mov	al, 1

loc_40C57:
		pop	di
		pop	si
		leave
		retf
sub_403A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40C5B		proc far

var_5E		= word ptr -5Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 5Eh
		push	si
		push	di
		mov	[bp+var_1], 1
		lea	ax, [bp+var_5E]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	bx, [bp+arg_0]
		mov	eax, [bp+arg_2]
		add	[bx+64h], eax
		mov	eax, [bp+arg_6]
		add	[bx+68h], eax
		mov	eax, [bp+arg_A]
		add	[bx+6Ch], eax
		cmp	word ptr [bx+5Ch], 0B4h
		jl	short loc_40C96
		jmp	loc_40D29

loc_40C96:
		cmp	word ptr [bx+5Eh], 0FF4Ch
		jg	short loc_40CA0
		jmp	loc_40D29

loc_40CA0:
		mov	ax, [bx+5Ch]
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		cmp	eax, [bx+64h]
		jge	short loc_40CBA
		mov	ax, 1
		jmp	short loc_40CBC

loc_40CBA:
		xor	ax, ax

loc_40CBC:
		or	al, al
		jz	short loc_40CE4
		mov	bx, [bp+arg_0]
		mov	ax, [bx+5Ch]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bx+64h], eax
		mov	[bp+var_1], 0
		jmp	short loc_40D29

loc_40CE4:
		mov	bx, [bp+arg_0]
		mov	ax, [bx+5Eh]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		cmp	eax, [bx+64h]
		jle	short loc_40D01
		mov	ax, 1
		jmp	short loc_40D03

loc_40D01:
		xor	ax, ax

loc_40D03:
		or	al, al
		jz	short loc_40D29
		mov	bx, [bp+arg_0]
		mov	ax, [bx+5Eh]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bx+64h], eax
		mov	[bp+var_1], 0

loc_40D29:
		mov	bx, [bp+arg_0]
		cmp	word ptr [bx+60h], 0B4h
		jl	short loc_40D36
		jmp	loc_40DC9

loc_40D36:
		cmp	word ptr [bx+62h], 0FF4Ch
		jg	short loc_40D40
		jmp	loc_40DC9

loc_40D40:
		mov	ax, [bx+60h]
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		cmp	eax, [bx+6Ch]
		jge	short loc_40D5A
		mov	ax, 1
		jmp	short loc_40D5C

loc_40D5A:
		xor	ax, ax

loc_40D5C:
		or	al, al
		jz	short loc_40D84
		mov	bx, [bp+arg_0]
		mov	ax, [bx+60h]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bx+6Ch], eax
		mov	[bp+var_1], 0
		jmp	short loc_40DC9

loc_40D84:
		mov	bx, [bp+arg_0]
		mov	ax, [bx+62h]
		mov	[bp+var_1C], ax
		movsx	eax, [bp+var_1C]
		shl	eax, 8
		cmp	eax, [bx+6Ch]
		jle	short loc_40DA1
		mov	ax, 1
		jmp	short loc_40DA3

loc_40DA1:
		xor	ax, ax

loc_40DA3:
		or	al, al
		jz	short loc_40DC9
		mov	bx, [bp+arg_0]
		mov	ax, [bx+62h]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		shl	eax, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bx+6Ch], eax
		mov	[bp+var_1], 0

loc_40DC9:
		lea	ax, [bp+var_5E]
		mov	[bp+var_24], ax
		mov	[bp+var_26], 24h
		mov	bx, [bp+arg_0]
		mov	eax, [bx+70h]
		mov	[bp+var_2A], eax
		push	di
		push	si
		push	es
		push	ds
		mov	cx, [bp+var_26]
		shr	cx, 2
		mov	di, [bp+var_24]
		push	ds
		lds	si, word ptr [bp+var_2A]
		pop	es
		rep movsd
		pop	ds
		pop	es
		pop	si
		pop	di
		lea	ax, [bp+var_5E]
		push	ax
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	ax, [bp+arg_0]
		add	ax, 6Ch
		push	ax
		mov	[bp+var_2E], 0
		lea	ax, word ptr [bp+var_2E]
		push	ax
		mov	[bp+var_32], 0
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+2Ch]
		add	sp, 8
		mov	[bp+var_36], 0
		lea	ax, word ptr [bp+var_36]
		push	ax
		mov	[bp+var_3A], 0
		lea	ax, word ptr [bp+var_3A]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 64h
		push	ax
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+2Ch]
		add	sp, 8
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_40C5B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40E6B		proc far

var_5C		= word ptr -5Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		push	di
		lea	ax, [bp+var_5C]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	bx, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bx+64h], eax
		mov	eax, [bp+arg_6]
		mov	[bx+68h], eax
		mov	eax, [bp+arg_A]
		mov	[bx+6Ch], eax
		mov	ax, [bx+5Ch]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		cmp	eax, [bx+64h]
		jge	short loc_40EB2
		mov	ax, 1
		jmp	short loc_40EB4

loc_40EB2:
		xor	ax, ax

loc_40EB4:
		or	al, al
		jz	short loc_40ED8
		mov	bx, [bp+arg_0]
		mov	ax, [bx+5Ch]
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bx+64h], eax
		jmp	short loc_40F19

loc_40ED8:
		mov	bx, [bp+arg_0]
		mov	ax, [bx+5Eh]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		cmp	eax, [bx+64h]
		jle	short loc_40EF5
		mov	ax, 1
		jmp	short loc_40EF7

loc_40EF5:
		xor	ax, ax

loc_40EF7:
		or	al, al
		jz	short loc_40F19
		mov	bx, [bp+arg_0]
		mov	ax, [bx+5Eh]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bx+64h], eax

loc_40F19:
		mov	bx, [bp+arg_0]
		mov	ax, [bx+60h]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		cmp	eax, [bx+6Ch]
		jge	short loc_40F36
		mov	ax, 1
		jmp	short loc_40F38

loc_40F36:
		xor	ax, ax

loc_40F38:
		or	al, al
		jz	short loc_40F5C
		mov	bx, [bp+arg_0]
		mov	ax, [bx+60h]
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bx+6Ch], eax
		jmp	short loc_40F9D

loc_40F5C:
		mov	bx, [bp+arg_0]
		mov	ax, [bx+62h]
		mov	[bp+var_1A], ax
		movsx	eax, [bp+var_1A]
		shl	eax, 8
		cmp	eax, [bx+6Ch]
		jle	short loc_40F79
		mov	ax, 1
		jmp	short loc_40F7B

loc_40F79:
		xor	ax, ax

loc_40F7B:
		or	al, al
		jz	short loc_40F9D
		mov	bx, [bp+arg_0]
		mov	ax, [bx+62h]
		mov	[bp+var_1C], ax
		movsx	eax, [bp+var_1C]
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bx+6Ch], eax

loc_40F9D:
		lea	ax, [bp+var_5C]
		mov	[bp+var_22], ax
		mov	[bp+var_24], 24h
		mov	bx, [bp+arg_0]
		mov	eax, [bx+70h]
		mov	[bp+var_28], eax
		push	di
		push	si
		push	es
		push	ds
		mov	cx, [bp+var_24]
		shr	cx, 2
		mov	di, [bp+var_22]
		push	ds
		lds	si, word ptr [bp+var_28]
		pop	es
		rep movsd
		pop	ds
		pop	es
		pop	si
		pop	di
		lea	ax, [bp+var_5C]
		push	ax
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	ax, [bp+arg_0]
		add	ax, 6Ch
		push	ax
		mov	[bp+var_2C], 0
		lea	ax, word ptr [bp+var_2C]
		push	ax
		mov	[bp+var_30], 0
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+2Ch]
		add	sp, 8
		mov	[bp+var_34], 0
		lea	ax, word ptr [bp+var_34]
		push	ax
		mov	[bp+var_38], 0
		lea	ax, word ptr [bp+var_38]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 64h
		push	ax
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx]
		call	dword ptr [bx+2Ch]
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
sub_40E6B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4103C		proc far

var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= byte ptr -58h
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= word ptr -8
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_8], 0
		mov	[bp+var_9], 0
		mov	[bp+var_60], 0
		cmp	word_7CB03, 2
		jz	short loc_4106B
		cmp	word_7CB03, 4
		jz	short loc_4106B
		cmp	word_7CB03, 3
		jnz	short loc_41072

loc_4106B:
		mov	byte_7CDB4, 0
		jmp	short loc_41085

loc_41072:
		cmp	word_7CB03, 0
		jnz	short loc_41080
		mov	byte_7CDB4, 2
		jmp	short loc_41085

loc_41080:
		mov	byte_7CDB4, 1

loc_41085:
		cmp	byte_7CDB4, 0
		jz	short loc_41096
		cmp	byte_7CDB4, 2
		jz	short loc_41096
		jmp	loc_412BA

loc_41096:
		push	0
		call	sub_52A1
		pop	cx
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_64], eax
		mov	ebx, 4
		cdq
		idiv	ebx
		mov	[bp+var_64], eax
		push	0
		call	sub_5292
		pop	cx
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_16], eax
		neg	eax
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	[bp+var_5C], eax
		mov	ebx, 4
		cdq
		idiv	ebx
		mov	[bp+var_5C], eax
		cmp	byte_7D33A, 1
		jnz	short loc_41106
		mov	al, 1
		jmp	short loc_41108

loc_41106:
		mov	al, 0

loc_41108:
		or	al, al
		jnz	short loc_4111D
		cmp	byte_7D346, 1
		jnz	short loc_41117
		mov	al, 1
		jmp	short loc_41119

loc_41117:
		mov	al, 0

loc_41119:
		or	al, al
		jz	short loc_41122

loc_4111D:
		mov	dx, 0Ah
		jmp	short loc_4114C

loc_41122:
		cmp	byte_7D348, 1
		jnz	short loc_4112D
		mov	al, 1
		jmp	short loc_4112F

loc_4112D:
		mov	al, 0

loc_4112F:
		or	al, al
		jnz	short loc_41144
		cmp	byte_7D369, 1
		jnz	short loc_4113E
		mov	al, 1
		jmp	short loc_41140

loc_4113E:
		mov	al, 0

loc_41140:
		or	al, al
		jz	short loc_41149

loc_41144:
		mov	dx, 1
		jmp	short loc_4114C

loc_41149:
		mov	dx, 3

loc_4114C:
		cmp	byte_7D35D, 1
		jnz	short loc_41157
		mov	al, 1
		jmp	short loc_41159

loc_41157:
		mov	al, 0

loc_41159:
		or	al, al
		jz	short loc_4116D
		mov	[bp+var_20], dx
		movsx	eax, [bp+var_20]
		shl	eax, 8
		sub	[bp+var_5C], eax

loc_4116D:
		cmp	byte_7D35B, 1
		jnz	short loc_41178
		mov	al, 1
		jmp	short loc_4117A

loc_41178:
		mov	al, 0

loc_4117A:
		or	al, al
		jz	short loc_4118E
		mov	[bp+var_22], dx
		movsx	eax, [bp+var_22]
		shl	eax, 8
		add	[bp+var_5C], eax

loc_4118E:
		cmp	byte_7D358, 1
		jnz	short loc_41199
		mov	al, 1
		jmp	short loc_4119B

loc_41199:
		mov	al, 0

loc_4119B:
		or	al, al
		jz	short loc_411AF
		mov	[bp+var_24], dx
		movsx	eax, [bp+var_24]
		shl	eax, 8
		sub	[bp+var_64], eax

loc_411AF:
		cmp	byte_7D360, 1
		jnz	short loc_411BA
		mov	al, 1
		jmp	short loc_411BC

loc_411BA:
		mov	al, 0

loc_411BC:
		or	al, al
		jz	short loc_411D0
		mov	[bp+var_26], dx
		movsx	eax, [bp+var_26]
		shl	eax, 8
		add	[bp+var_64], eax

loc_411D0:
		cmp	byte_7D357, 1
		jnz	short loc_411DB
		mov	al, 1
		jmp	short loc_411DD

loc_411DB:
		mov	al, 0

loc_411DD:
		or	al, al
		jz	short loc_41201
		mov	[bp+var_28], dx
		movsx	eax, [bp+var_28]
		shl	eax, 8
		add	[bp+var_5C], eax
		mov	[bp+var_2A], dx
		movsx	eax, [bp+var_2A]
		shl	eax, 8
		sub	[bp+var_64], eax

loc_41201:
		cmp	byte_7D359, 1
		jnz	short loc_4120C
		mov	al, 1
		jmp	short loc_4120E

loc_4120C:
		mov	al, 0

loc_4120E:
		or	al, al
		jz	short loc_41232
		mov	[bp+var_2C], dx
		movsx	eax, [bp+var_2C]
		shl	eax, 8
		sub	[bp+var_5C], eax
		mov	[bp+var_2E], dx
		movsx	eax, [bp+var_2E]
		shl	eax, 8
		sub	[bp+var_64], eax

loc_41232:
		cmp	byte_7D35F, 1
		jnz	short loc_4123D
		mov	al, 1
		jmp	short loc_4123F

loc_4123D:
		mov	al, 0

loc_4123F:
		or	al, al
		jz	short loc_41263
		mov	[bp+var_30], dx
		movsx	eax, [bp+var_30]
		shl	eax, 8
		add	[bp+var_5C], eax
		mov	[bp+var_32], dx
		movsx	eax, [bp+var_32]
		shl	eax, 8
		add	[bp+var_64], eax

loc_41263:
		cmp	byte_7D361, 1
		jnz	short loc_4126E
		mov	al, 1
		jmp	short loc_41270

loc_4126E:
		mov	al, 0

loc_41270:
		or	al, al
		jz	short loc_41294
		mov	[bp+var_34], dx
		movsx	eax, [bp+var_34]
		shl	eax, 8
		sub	[bp+var_5C], eax
		mov	[bp+var_36], dx
		movsx	eax, [bp+var_36]
		shl	eax, 8
		add	[bp+var_64], eax

loc_41294:
		sub	sp, 0Ch
		mov	eax, [bp+var_64]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_6A], eax
		push	si
		push	cs
		call	near ptr sub_40C5B
		add	sp, 0Eh
		jmp	loc_413DB

loc_412BA:
		cmp	byte_7CDB4, 1
		jz	short loc_412C4
		jmp	loc_413DB

loc_412C4:
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_412F8
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_412F6
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_412F8

loc_412F6:
		jmp	short loc_412F8

loc_412F8:
		call	sub_6F5D8
		mov	[bp+var_3C], ax
		movsx	eax, [bp+var_3C]
		shl	eax, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_64], eax
		imul	eax, eax, 168h
		mov	[bp+var_64], eax
		mov	ebx, 190h
		cdq
		idiv	ebx
		mov	[bp+var_64], eax
		sub	[bp+var_64], 0B400h
		mov	eax, [bp+var_64]
		neg	eax
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	[bp+var_64], eax
		call	sub_6F5C0
		mov	[bp+var_4A], ax
		movsx	eax, [bp+var_4A]
		shl	eax, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_5C], eax
		imul	eax, eax, 168h
		mov	[bp+var_5C], eax
		mov	ebx, 280h
		cdq
		idiv	ebx
		mov	[bp+var_5C], eax
		sub	[bp+var_5C], 0B400h
		mov	eax, [bp+var_5C]
		neg	eax
		mov	[bp+var_52], eax
		mov	[bp+var_56], eax
		mov	[bp+var_5C], eax
		mov	al, [bp+var_2]
		mov	[bp+var_58], al
		test	[bp+var_58], 1
		jz	short loc_413B3
		mov	[bp+var_9], 1
		mov	byte_78D72, 1
		jmp	short loc_413B8

loc_413B3:
		mov	byte_78D72, 0

loc_413B8:
		sub	sp, 0Ch
		mov	eax, [bp+var_64]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_6A], eax
		push	si
		push	cs
		call	near ptr sub_40E6B
		add	sp, 0Eh

loc_413DB:
		push	1
		push	0
		call	sub_5235
		add	sp, 4
		or	al, al
		jnz	short loc_41402
		cmp	byte_7D349, 1
		jnz	short loc_413F6
		mov	al, 1
		jmp	short loc_413F8

loc_413F6:
		mov	al, 0

loc_413F8:
		or	al, al
		jnz	short loc_41402
		cmp	[bp+var_9], 0
		jz	short loc_4143B

loc_41402:
		push	word_7CADA
		push	large 100h
		push	0
		call	sub_5EBFB
		add	sp, 8
		sub	sp, 4
		mov	[bp+var_6A], 0
		push	si
		push	word_79799
		call	sub_4F791
		add	sp, 8
		cmp	byte_7CB0D, 0
		jz	short loc_41449
		inc	dword ptr [si+54h]
		jmp	short loc_41449

loc_4143B:
		push	word_7CADA
		push	0
		call	sub_5ECE8
		add	sp, 4

loc_41449:
		pop	si
		leave
		retf
sub_4103C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4144C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_414AF
		mov	word ptr [si], 25B2h
		push	0
		mov	ax, si
		add	ax, 52h
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	dword ptr [si+70h], 0
		jz	short loc_4148B
		push	0
		push	2
		mov	ax, si
		add	ax, 70h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_4148B:
		mov	ax, si
		add	ax, 52h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_3B2B9
		add	sp, 4
		test	di, 1
		jz	short loc_414AF
		push	si
		call	sub_3B2
		pop	cx

loc_414AF:
		pop	di
		pop	si
		pop	bp
		retf
sub_4144C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_414B3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	ax, [bp+arg_2]
		cmp	ax, 0BEh
		jnz	short loc_414CF
		mov	dword ptr [si+54h], 0
		mov	dx, 1
sub_414B3		endp

; START OF FUNCTION CHUNK FOR sub_414B3

loc_414CF:
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_414B3
seg102		ends
