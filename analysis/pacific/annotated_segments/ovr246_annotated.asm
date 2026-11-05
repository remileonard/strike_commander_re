ovr246		segment	para public 'OVERLAY' use16
		assume cs:ovr246
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8C120		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 12h
		pop	bp
		retf
sub_8C120		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8C12A		proc far

var_C4		= dword ptr -0C4h
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
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
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
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_46		= dword ptr -46h
var_44		= dword ptr -44h
var_42		= dword ptr -42h
var_40		= dword ptr -40h
var_3E		= dword ptr -3Eh
var_3C		= dword ptr -3Ch
var_3A		= dword ptr -3Ah
var_38		= dword ptr -38h
var_36		= dword ptr -36h
var_34		= dword ptr -34h
var_32		= dword ptr -32h
var_30		= dword ptr -30h
var_2E		= dword ptr -2Eh
var_2C		= dword ptr -2Ch
var_2A		= dword ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1B		= byte ptr -1Bh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= byte ptr -6
var_5		= byte ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0BAh
		push	si
		push	di
		mov	[bp+var_5], 0
		mov	[bp+var_6], 1
		push	0
		call	Music_SetPendingTune_5ED30
		pop	cx
		mov	[bp+var_7], 0
		mov	byte_79787, 1
		mov	di, [bp+arg_0]
		push	0
		push	[bp+arg_0]
		call	sub_553B6
		add	sp, 4
		push	80h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_8C17B
		push	ax
		call	sub_731D5
		pop	cx
		mov	word ptr [si+50h], 72Ah
		mov	ax, si
		jmp	short loc_8C17D

loc_8C17B:
		mov	ax, si

loc_8C17D:
		mov	si, ax
		mov	ax, [si+5Ch]
		add	ax, 2
		mov	[bp+var_C], ax
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	sub_6735D
		add	sp, 4
		mov	ax, [bp+arg_0]
		add	ax, 12h
		mov	[bp+var_E], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		push	si
		call	sub_731E4
		pop	cx
		mov	[bp+var_10], 0
		mov	[bp+var_12], 0
		mov	bx, [bp+arg_0]
		mov	eax, [bx+0Eh]
		mov	[bp+var_16], eax
		mov	byte_7769A, 1
		cmp	[bp+var_7], 0
		jnz	short loc_8C1E2
		jmp	loc_8C381

loc_8C1E2:
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_20+2], ax
		mov	bx, word ptr [bp+var_20+2]
		mov	eax, [bx]
		mov	[bp+var_5A], eax
		mov	eax, [bx+4]
		mov	[bp+var_56], eax
		mov	eax, [bx+8]
		mov	[bp+var_52], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	word ptr [bp+var_20], ax
		mov	bx, word ptr [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_66], eax
		mov	eax, [bx+4]
		mov	[bp+var_62], eax
		mov	eax, [bx+8]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_66]
		imul	eax, eax, 2
		mov	[bp+var_66], eax
		mov	eax, [bp+var_62]
		imul	eax, eax, 2
		mov	[bp+var_62], eax
		mov	[bp+var_24], 0FFFFFE00h
		mov	eax, [bp+var_24]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_66]
		imul	eax, eax, 19h
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_62]
		imul	eax, eax, 19h
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	eax, [bp+var_5E]
		imul	eax, eax, 19h
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_7E]
		sub	[bp+var_72], eax
		mov	eax, [bp+var_7A]
		sub	[bp+var_6E], eax
		mov	eax, [bp+var_76]
		sub	[bp+var_6A], eax
		mov	eax, [bp+var_72]
		mov	[si+14h], eax
		mov	eax, [bp+var_6E]
		mov	[si+18h], eax
		mov	eax, [bp+var_6A]
		mov	[si+1Ch], eax
		lea	ax, word ptr [bp+var_66]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		push	0
		push	di
		call	sub_7418F
		add	sp, 4
		mov	[bp+var_40], 0
		mov	[bp+var_40], 0
		mov	[bp+var_44], 500h
		jmp	short loc_8C35B

loc_8C31A:
		call	sub_50F18
		mov	eax, [bp+var_44]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		add	[si+1Ch], eax
		add	[bp+var_44], 400h
		push	62B0h
		call	sub_1E055
		pop	cx
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_8C379

loc_8C35B:
		mov	eax, dword_7976E
		sub	[bp+var_40], eax
		mov	eax, [bp+var_40]
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jz	short loc_8C379
		call	sub_5093D
		or	al, al
		jnz	short loc_8C31A

loc_8C379:
		mov	[bp+var_5], 1
		mov	[bp+var_6], 0

loc_8C381:
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jz	short loc_8C38D
		jmp	loc_8C74D

loc_8C38D:
		cmp	byte_79B9B, 0
		jz	short loc_8C397
		jmp	loc_8C74D

loc_8C397:
		mov	ax, word ptr [bp+var_16]
		add	ax, 6Fh
		push	word ptr [bp+var_16+2]
		push	ax
		push	di
		call	sub_750CF
		add	sp, 6
		mov	[bp+var_18], ax
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	[bp+var_12], 0
		jnz	short loc_8C3C3
		jmp	loc_8C74D

loc_8C3C3:
		mov	[bp+var_24], 499h
		mov	eax, [bp+var_24]
		mov	[bp+var_20], eax
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_28+2], ax
		mov	bx, word ptr [bp+var_28+2]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		mov	[bp+var_2A], 0
		mov	[bp+var_2E], 0FFFFEC00h
		mov	[bp+var_32], 2300h
		mov	eax, [bp+var_2A]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_52], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_5A]
		add	[si+14h], eax
		mov	eax, [bp+var_56]
		add	[si+18h], eax
		mov	eax, [bp+var_52]
		add	[si+1Ch], eax
		mov	bx, [bp+var_12]
		mov	eax, [bx+20h]
		shl	eax, 3
		mov	[bp+var_3A], eax
		mov	[bp+var_36], eax
		mov	[bp+var_3E], 4Ch
		mov	[bp+var_42], 0FFFFFE80h
		mov	[bp+var_46], 100h
		mov	eax, [bp+var_3E]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_5A]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_56]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_56], eax
		mov	eax, [bp+var_52]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	byte ptr [bp+var_48+1], 0
		jmp	loc_8C72F

loc_8C503:
		mov	di, [bp+var_12]
		cmp	[bp+var_10], 0
		jnz	short loc_8C53C
		cmp	[bp+var_12], 0
		jz	short loc_8C518
		cmp	byte ptr [bp+var_48+1], 0
		jz	short loc_8C51F

loc_8C518:
		mov	[bp+var_6], 0
		jmp	loc_8C74D

loc_8C51F:
		cmp	byte ptr [di+60h], 0
		jz	short loc_8C53C
		mov	ax, [di+5Eh]
		mov	word ptr [bp+var_4C+2], ax
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	SetReference16
		add	sp, 4
		mov	byte ptr [bp+var_48+1], 1

loc_8C53C:
		cmp	[bp+var_10], 0
		jz	short loc_8C561
		mov	di, [bp+var_10]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_72], eax
		mov	eax, [di+4]
		mov	[bp+var_6E], eax
		mov	eax, [di+8]
		mov	[bp+var_6A], eax
		jmp	short loc_8C57E

loc_8C561:
		mov	di, [bp+var_12]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_72], eax
		mov	eax, [di+4]
		mov	[bp+var_6E], eax
		mov	eax, [di+8]
		mov	[bp+var_6A], eax

loc_8C57E:
		mov	eax, [bp+var_5A]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_76], eax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_6A]
		mov	[bp+var_C4], eax
		push	si
		call	sub_2CB53
		add	sp, 8
		mov	eax, [bp+var_72]
		add	[bp+var_7E], eax
		mov	eax, [bp+var_6E]
		add	[bp+var_7A], eax
		mov	eax, [bp+var_6A]
		add	[bp+var_76], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_7E]
		sub	eax, [di]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_7A]
		sub	eax, [di+4]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_76]
		sub	eax, [di+8]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_82], eax
		mov	[bp+var_4E], 800h
		mov	eax, [bp+var_8A]
		mov	edx, eax
		mov	ecx, [bp+var_4E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_86]
		mov	edx, eax
		mov	ecx, [bp+var_4E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_86], eax
		mov	eax, [bp+var_82]
		mov	edx, eax
		mov	ecx, [bp+var_4E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		add	[si+14h], eax
		mov	eax, [bp+var_86]
		add	[si+18h], eax
		mov	eax, [bp+var_82]
		add	[si+1Ch], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_72]
		sub	eax, [di]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_6E]
		sub	eax, [di+4]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_6A]
		sub	eax, [di+8]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_9A], eax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		call	sub_50F18
		push	62B0h
		call	sub_1E055
		pop	cx
		mov	eax, dword_7976E
		sub	[bp+var_20], eax
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_8C74D
		cmp	byte_77537, 0
		jnz	short loc_8C74D
		cmp	byte_79B9B, 0
		jnz	short loc_8C74D

loc_8C72F:
		cmp	[bp+var_20], 0
		jl	short loc_8C73B
		mov	ax, 1
		jmp	short loc_8C73D

loc_8C73B:
		xor	ax, ax

loc_8C73D:
		or	al, al
		jz	short loc_8C74D
		call	sub_5093D
		or	al, al
		jz	short loc_8C74D
		jmp	loc_8C503

loc_8C74D:
		push	si
		push	67B7h
		call	sub_737B4
		add	sp, 4
		push	9
		push	67B7h
		call	sub_737AA
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_8C76F
		jmp	loc_8C805

loc_8C76F:
		cmp	[bp+var_10], 0
		jnz	short loc_8C778
		jmp	loc_8C805

loc_8C778:
		mov	ax, [bp+var_10]
		mov	[bp+var_1A], ax
		push	ax
		mov	ax, di
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4
		push	di
		push	67B7h
		call	sub_737D2
		add	sp, 4
		mov	ax, si
		add	ax, 14h
		push	ax
		push	[bp+var_10]
		push	di
		call	sub_73442
		add	sp, 6
		mov	[bp+var_24], 2D00h
		mov	eax, [bp+var_24]
		mov	[bp+var_20], eax
		jmp	short loc_8C7ED

loc_8C7BD:
		call	sub_5093D
		mov	ah, 0
		or	ax, ax
		jz	short loc_8C805
		call	sub_50F18
		mov	eax, dword_7976E
		sub	[bp+var_20], eax
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_8C805
		cmp	byte_77537, 0
		jnz	short loc_8C805
		cmp	byte_79B9B, 0
		jnz	short loc_8C805

loc_8C7ED:
		cmp	[bp+var_20], 0
		jl	short loc_8C7F9
		mov	ax, 1
		jmp	short loc_8C7FB

loc_8C7F9:
		xor	ax, ax

loc_8C7FB:
		or	al, al
		jz	short loc_8C805
		cmp	[bp+var_10], 0
		jnz	short loc_8C7BD

loc_8C805:
		mov	al, [bp+var_6]
		mov	[bp+var_1B], al
		lea	ax, [bp+var_12]
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		lea	ax, [bp+var_10]
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		lea	ax, [bp+var_A]
		push	ax
		call	sub_67383
		pop	cx
		mov	al, [bp+var_1B]
		pop	di
		pop	si
		leave
		retf
sub_8C12A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8C830		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_8C85B
		push	0
		push	si
		call	sub_73E05
		add	sp, 4
		test	di, 1
		jz	short loc_8C859
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_8C85B

loc_8C859:
		jmp	short loc_8C85B

loc_8C85B:
		pop	di
		pop	si
		pop	bp
		retf
sub_8C830		endp
ovr246		ends
