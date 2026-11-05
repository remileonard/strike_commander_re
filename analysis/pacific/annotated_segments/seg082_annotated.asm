seg082		segment	para public 'CODE' use16
		assume cs:seg082
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_324D1		proc far

var_D2		= word ptr -0D2h
var_5A		= word ptr -5Ah
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0D2h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		cmp	eax, 249F0h
		jnb	short loc_324F4
		jmp	loc_325DE

loc_324F4:
		mov	[bp+var_4], si
		mov	dx, si
		cmp	dx, word_7CCEA
		jnb	short loc_32512
		mov	ax, dx
		imul	ax, ax, 0Eh
		mov	edx, dword_7CCF0
		push	ax
		mov	ax, word_7CCEE
		pop	bx
		add	ax, bx
		jmp	short loc_32533

loc_32512:
		sub	dx, word_7CCEA
		cmp	dx, word_7CCEC
		jnb	short loc_3252F
		mov	ax, dx
		imul	ax, ax, 18h
		mov	edx, dword_7CCF4
		push	ax
		mov	ax, word_7CCF2
		pop	bx
		add	ax, bx
		jmp	short loc_32533

loc_3252F:
		xor	dx, dx
		xor	ax, ax

loc_32533:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_32543
		jmp	loc_325DE

loc_32543:
		les	bx, word ptr [bp+var_8]
		cmp	byte ptr es:[bx+0Ch], 0FFh
		jnz	short loc_32552
		mov	ax, 1
		jmp	short loc_32554

loc_32552:
		xor	ax, ax

loc_32554:
		or	al, al
		jnz	short loc_3255B
		jmp	loc_325DE

loc_3255B:
		push	ds
		push	offset aPAK
		push	ds
		push	offset aTXMPACK
		push	ds
		push	offset aTXM
		lea	ax, [bp+var_5A]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_D2]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	1
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		mov	bx, [bp+var_D2]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	[bp+var_4]
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_7844
		add	sp, 4
		or	al, al
		jz	short loc_325C4
		mov	byte ptr [bp+var_A], 0
		lea	ax, [bp+var_D2]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		push	large [bp+var_8]
		call	sub_75179
		add	sp, 8
		mov	[bp+var_1], 1

loc_325C4:
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	2
		lea	ax, [bp+var_D2]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_325DE:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_324D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_325E4		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_4], 0
		cmp	[bp+arg_0], 0
		jz	short loc_32630
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+0Ch], 0FFh
		jnz	short loc_32608
		mov	ax, 1
		jmp	short loc_3260A

loc_32608:
		xor	ax, ax

loc_3260A:
		or	al, al
		jz	short loc_3261E
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+4]
		push	cs
		call	near ptr sub_324D1
		pop	cx
		or	al, al
		jz	short loc_32630

loc_3261E:
		push	large [bp+arg_0]
		call	sub_75188
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_32630:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_325E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32638		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		xor	si, si
		mov	[bp+var_4], 0
		cmp	[bp+arg_0], 0
		jz	short loc_32690
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+0Ch], 0FFh
		jnz	short loc_3265F
		mov	ax, 1
		jmp	short loc_32661

loc_3265F:
		xor	ax, ax

loc_32661:
		or	al, al
		jz	short loc_32685
		mov	si, 1
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+4]
		push	cs
		call	near ptr sub_324D1
		pop	cx
		or	al, al
		jnz	short loc_32685
		stc
		les	bx, word ptr [bp+arg_0]
		mov	dx, es:[bx+2]
		mov	ax, es:[bx]
		jmp	short loc_3269E

loc_32685:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax

loc_32690:
		or	si, si
		jz	short loc_32697
		stc
		jmp	short loc_32698

loc_32697:
		clc

loc_32698:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_3269E:
		pop	si
		leave
		retf
sub_32638		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_326A1		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	cl, [bp+arg_0]
		mov	al, cl
		mov	ah, 0
		mov	dx, seg seg226
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx]
		inc	al
		mov	dl, cl
		mov	dh, 0
		mov	bx, seg seg226
		mov	es, bx
		mov	bx, dx
		mov	es:[bx], al
		pop	bp
		retf
sub_326A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_326CB		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	cl, [bp+arg_0]
		mov	al, cl
		mov	ah, 0
		mov	dx, seg seg226
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx]
		add	al, 0FFh
		mov	dl, cl
		mov	dh, 0
		mov	bx, seg seg226
		mov	es, bx
		mov	bx, dx
		mov	es:[bx], al
		mov	al, cl
		mov	ah, 0
		mov	dx, seg seg226
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx], 1
		jnb	short loc_32714
		mov	al, cl
		mov	ah, 0
		mov	bx, ax
		mov	es, dx
		mov	byte ptr es:[bx], 0

loc_32714:
		pop	bp
		retf
sub_326CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32716		proc far

var_6		= word ptr -6
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		cmp	byte_77BFD, 0
		jnz	short loc_32727
		jmp	loc_327C9

loc_32727:
		xor	si, si
		jmp	loc_327C0

loc_3272C:
		mov	ax, seg seg226
		mov	es, ax
		cmp	byte ptr es:[si], 0
		jz	short loc_3273C
		jmp	loc_327BF

loc_3273C:
		mov	dx, si
		cmp	dx, word_7CCEA
		jnb	short loc_32757
		mov	ax, dx
		imul	ax, ax, 0Eh
		mov	edx, dword_7CCF0
		push	ax
		mov	ax, word_7CCEE
		pop	bx
		add	ax, bx
		jmp	short loc_32778

loc_32757:
		sub	dx, word_7CCEA
		cmp	dx, word_7CCEC
		jnb	short loc_32774
		mov	ax, dx
		imul	ax, ax, 18h
		mov	edx, dword_7CCF4
		push	ax
		mov	ax, word_7CCF2
		pop	bx
		add	ax, bx
		jmp	short loc_32778

loc_32774:
		xor	dx, dx
		xor	ax, ax

loc_32778:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_327BF
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+0Ch], 0FFh
		jnz	short loc_32794
		mov	ax, 1
		jmp	short loc_32796

loc_32794:
		xor	ax, ax

loc_32796:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_327BF
		push	large [bp+var_4]
		call	sub_7516F
		add	sp, 4
		mov	[bp+var_6], si
		mov	ax, [bp+var_6]
		cwd
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+6], dx
		mov	es:[bx+4], ax
		mov	byte ptr es:[bx+0Ch], 0FFh

loc_327BF:
		inc	si

loc_327C0:
		cmp	si, 0FFh
		jge	short loc_327C9
		jmp	loc_3272C

loc_327C9:
		pop	si
		leave
		retf
sub_32716		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_327CC		proc far

var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= word ptr -0C0h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= byte ptr -44h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_31		= byte ptr -31h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0D8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_327F7

loc_327DC:
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+3Bh]
		add	bx, ax
		mov	word ptr [bx], 0
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+3Dh]
		add	bx, ax
		mov	word ptr [bx], 0
		inc	di

loc_327F7:
		cmp	[si+11h], di
		jg	short loc_327DC
		mov	eax, [si+9]
		mov	[bp+var_4], eax
		mov	di, [bp+arg_2]
		add	di, 2Ch
		mov	eax, [di]
		mov	[bp+var_CC], eax
		mov	eax, [di+4]
		mov	[bp+var_C8], eax
		mov	eax, [di+8]
		mov	[bp+var_C4], eax
		mov	di, [bp+arg_2]
		add	di, 14h
		mov	eax, [di]
		mov	[bp+var_D8], eax
		mov	eax, [di+4]
		mov	[bp+var_D4], eax
		mov	eax, [di+8]
		mov	[bp+var_D0], eax
		mov	di, [bp+arg_2]
		add	di, 60h
		mov	eax, [di]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_CC]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	sub_5711C
		add	sp, 6
		mov	di, si
		add	di, 3Fh
		mov	ax, [di]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_14], eax
		mov	ax, [di+2]
		mov	[bp+var_1C], ax
		movsx	eax, [bp+var_1C]
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_24], eax
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_14]
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_2C], eax
		mov	al, [si+11h]
		mov	[bp+var_31], al
		mov	eax, [bp+var_C]
		add	eax, [bp+var_8]
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		cmp	[bp+var_3A], 5A00h
		jg	short loc_3290A
		mov	ax, 1
		jmp	short loc_3290C

loc_3290A:
		xor	ax, ax

loc_3290C:
		or	al, al
		jnz	short loc_32913
		jmp	loc_32C0C

loc_32913:
		mov	eax, [bp+var_C]
		sub	eax, [bp+var_8]
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		cmp	[bp+var_42], 0FFFFA600h
		jl	short loc_32932
		mov	ax, 1
		jmp	short loc_32934

loc_32932:
		xor	ax, ax

loc_32934:
		or	al, al
		jnz	short loc_3293B
		jmp	loc_32C0C

loc_3293B:
		cmp	[bp+var_CC], 0
		jg	short loc_32948
		mov	ax, 1
		jmp	short loc_3294A

loc_32948:
		xor	ax, ax

loc_3294A:
		or	al, al
		jz	short loc_32954
		mov	[bp+var_44], 0
		jmp	short loc_32958

loc_32954:
		mov	[bp+var_44], 1

loc_32958:
		mov	eax, [bp+var_C8]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_CC]
		neg	eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	[bp+var_48], eax
		cmp	[bp+var_48], 0
		jnz	short loc_32981
		mov	ax, 1
		jmp	short loc_32983

loc_32981:
		xor	ax, ax

loc_32983:
		or	al, al
		jz	short loc_329D8
		mov	bl, 0
		cmp	[bp+var_C8], 0
		jge	short loc_32996
		mov	ax, 1
		jmp	short loc_32998

loc_32996:
		xor	ax, ax

loc_32998:
		or	al, al
		jz	short loc_329A5
		mov	al, [bp+var_31]
		mov	ah, 0
		sar	ax, 1
		mov	bl, al

loc_329A5:
		mov	al, [bp+var_31]
		mov	ah, 0
		sar	ax, 1
		mov	dl, bl
		add	dl, al
		mov	byte ptr [bp+var_58+3], dl
		mov	al, bl
		mov	ah, 0
		mov	di, ax
		jmp	short loc_329CC

loc_329BB:
		mov	al, [bp+var_31]
		mov	ah, 0
		mov	dx, di
		shl	dx, 1
		mov	bx, [si+3Dh]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_329CC:
		mov	al, byte ptr [bp+var_58+3]
		mov	ah, 0
		cmp	ax, di
		jge	short loc_329BB
		jmp	loc_32C2A

loc_329D8:
		mov	eax, [bp+var_14]
		mov	[bp+var_58], eax
		mov	al, [bp+var_31]
		mov	ah, 0
		dec	ax
		movsx	eax, ax
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_60], edx
		mov	eax, [bp+var_60]
		shl	eax, 8
		mov	edx, [bp+var_58]
		add	edx, eax
		mov	[bp+var_64], edx
		mov	eax, [bp+var_64]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_D8]
		sub	eax, [bp+var_58]
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_70]
		cdq
		idiv	[bp+var_74]
		mov	[bp+var_78], eax
		mov	[bp+var_68], eax
		mov	eax, [bp+var_10]
		sub	eax, [bp+var_D4]
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	edx, [bp+var_4C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_8C]
		mov	edx, eax
		mov	ecx, [bp+var_48]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_94]
		cdq
		idiv	[bp+var_98]
		mov	[bp+var_9C], eax
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_68]
		add	eax, [bp+var_A0]
		mov	[bp+var_A4], eax
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_4C]
		neg	eax
		mov	[bp+var_AC], eax
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_B0]
		mov	edx, eax
		mov	ecx, [bp+var_48]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_B8], eax
		xor	di, di
		jmp	loc_32BFE

loc_32B0A:
		cmp	[bp+var_44], 0
		jnz	short loc_32B6C
		mov	al, [bp+var_31]
		mov	ah, 0
		mov	[bp+var_BA], ax
		movsx	eax, [bp+var_BA]
		shl	eax, 8
		cmp	eax, [bp+var_B8]
		jge	short loc_32B2F
		mov	ax, 1
		jmp	short loc_32B31

loc_32B2F:
		xor	ax, ax

loc_32B31:
		or	al, al
		jz	short loc_32B3D

loc_32B35:
		mov	al, [bp+var_31]
		mov	ah, 0
		jmp	loc_32BE8

loc_32B3D:
		cmp	[bp+var_B8], 0
		jl	short loc_32B4A
		mov	ax, 1
		jmp	short loc_32B4C

loc_32B4A:
		xor	ax, ax

loc_32B4C:
		or	al, al
		jnz	short loc_32B53
		jmp	loc_32BF3

loc_32B53:
		mov	ax, word ptr [bp+var_B8+1]
		mov	[bp+var_BE], ax
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+3Dh]
		add	bx, ax
		mov	ax, [bp+var_BE]
		inc	ax
		jmp	loc_32BF1

loc_32B6C:
		cmp	[bp+var_B8], 0
		jge	short loc_32B79
		mov	ax, 1
		jmp	short loc_32B7B

loc_32B79:
		xor	ax, ax

loc_32B7B:
		or	al, al
		jnz	short loc_32B35
		mov	al, [bp+var_31]
		mov	ah, 0
		mov	[bp+var_BC], ax
		movsx	eax, [bp+var_BC]
		shl	eax, 8
		cmp	eax, [bp+var_B8]
		jl	short loc_32B9E
		mov	ax, 1
		jmp	short loc_32BA0

loc_32B9E:
		xor	ax, ax

loc_32BA0:
		or	al, al
		jz	short loc_32BF3
		mov	ax, word ptr [bp+var_B8+1]
		mov	[bp+var_BE], ax
		mov	[bp+var_C0], ax
		movsx	eax, [bp+var_C0]
		shl	eax, 8
		cmp	eax, [bp+var_B8]
		jge	short loc_32BC6
		mov	ax, 1
		jmp	short loc_32BC8

loc_32BC6:
		xor	ax, ax

loc_32BC8:
		or	al, al
		jz	short loc_32BD0
		inc	[bp+var_BE]

loc_32BD0:
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+3Bh]
		add	bx, ax
		mov	ax, [bp+var_BE]
		mov	[bx], ax
		mov	al, [bp+var_31]
		mov	ah, 0
		sub	ax, [bp+var_BE]

loc_32BE8:
		mov	dx, di
		shl	dx, 1
		mov	bx, [si+3Dh]
		add	bx, dx

loc_32BF1:
		mov	[bx], ax

loc_32BF3:
		mov	eax, [bp+var_A8]
		add	[bp+var_B8], eax
		inc	di

loc_32BFE:
		mov	al, [bp+var_31]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_32C0A
		jmp	loc_32B0A

loc_32C0A:
		jmp	short loc_32C2A

loc_32C0C:
		xor	di, di
		jmp	short loc_32C21

loc_32C10:
		mov	al, [bp+var_31]
		mov	ah, 0
		mov	dx, di
		shl	dx, 1
		mov	bx, [si+3Dh]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_32C21:
		mov	al, [bp+var_31]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_32C10

loc_32C2A:
		pop	di
		pop	si
		leave
		retf
sub_327CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32C2E		proc far

var_9C		= word ptr -9Ch
var_6C		= word ptr -6Ch
var_53		= byte ptr -53h
var_52		= word ptr -52h
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 9Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		sar	eax, 8
		cdq
		idiv	dword ptr [si+9]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax
		cmp	dword ptr [di], 0
		jge	short loc_32C69
		mov	ax, 1
		jmp	short loc_32C6B

loc_32C69:
		xor	ax, ax

loc_32C6B:
		or	al, al
		jz	short loc_32C77
		sub	[bp+var_8], 100h

loc_32C77:
		mov	eax, [si+9]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_8]
		imul	eax, [bp+var_14]
		mov	[bp+var_8], eax
		mov	eax, [di+4]
		sar	eax, 8
		cdq
		idiv	dword ptr [si+9]
		mov	[bp+var_18], eax
		shl	eax, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		cmp	dword ptr [di+4], 0
		jle	short loc_32CBA
		mov	ax, 1
		jmp	short loc_32CBC

loc_32CBA:
		xor	ax, ax

loc_32CBC:
		or	al, al
		jz	short loc_32CC8
		add	[bp+var_4], 100h

loc_32CC8:
		mov	eax, [si+9]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_4]
		imul	eax, [bp+var_20]
		mov	[bp+var_4], eax
		push	0
		mov	al, [si+1Dh]
		push	ax
		push	large [si+19h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	ax, [si+2Fh]
		mov	dx, word_77BF2
		mov	[bp+var_22], dx
		mov	[bp+var_24], ax
		mov	cx, [si+9]
		movsx	ebx, cx
		mov	eax, [bp+var_8]
		cdq
		idiv	ebx
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	eax, [bp+var_4]
		cdq
		idiv	ebx
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_2C+1]
		mov	[bp+var_42], ax
		mov	ax, word ptr [bp+var_28+1]
		mov	[bp+var_44], ax
		mov	ax, [bp+var_42]
		mov	word ptr [bp+var_48], ax
		mov	ax, [bp+var_44]
		mov	word ptr [bp+var_48+2], ax
		mov	eax, [bp+var_48]
		mov	[bp+var_40], eax
		push	seg seg017
		push	offset sub_9532
		push	large 10002h
		push	0Ch
		lea	ax, [bp+var_6C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_9532
		push	large 10003h
		push	0Ch
		lea	ax, [bp+var_9C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	ax, [si+41h]
		sub	ax, word ptr [bp+var_40+2]
		mov	dx, [si+11h]
		dec	dx
		imul	dx
		mov	dx, word ptr [bp+var_40]
		sub	dx, [si+3Fh]
		add	dx, ax
		shl	dx, 1
		mov	[bp+var_52], dx
		mov	ax, [si+2Fh]
		mov	dx, word_77BF2
		mov	bx, [bp+var_52]
		imul	bx, bx, 16h
		add	ax, bx
		mov	[bp+var_22], dx
		mov	[bp+var_24], ax
		les	bx, [bp+var_24]
		mov	bx, es:[bx+2]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		mov	al, es:[bx+3]
		mov	[bp+var_53], al
		mov	dword_77BF0, 0
		pop	di
		pop	si
		leave
		retf
sub_32C2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32DE5		proc far

var_1C6		= dword ptr -1C6h
var_1C2		= dword ptr -1C2h
var_1BE		= dword ptr -1BEh
var_1BA		= dword ptr -1BAh
var_1B6		= dword ptr -1B6h
var_1B2		= dword ptr -1B2h
var_1AE		= dword ptr -1AEh
var_1AA		= dword ptr -1AAh
var_1A6		= dword ptr -1A6h
var_1A2		= dword ptr -1A2h
var_19E		= dword ptr -19Eh
var_19A		= dword ptr -19Ah
var_196		= dword ptr -196h
var_192		= dword ptr -192h
var_18E		= dword ptr -18Eh
var_18A		= dword ptr -18Ah
var_186		= dword ptr -186h
var_182		= dword ptr -182h
var_17E		= dword ptr -17Eh
var_17A		= dword ptr -17Ah
var_176		= dword ptr -176h
var_172		= dword ptr -172h
var_16E		= dword ptr -16Eh
var_16A		= dword ptr -16Ah
var_166		= dword ptr -166h
var_162		= dword ptr -162h
var_15E		= dword ptr -15Eh
var_15A		= dword ptr -15Ah
var_156		= dword ptr -156h
var_152		= dword ptr -152h
var_14E		= dword ptr -14Eh
var_14A		= dword ptr -14Ah
var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_136		= dword ptr -136h
var_132		= dword ptr -132h
var_12E		= dword ptr -12Eh
var_12A		= dword ptr -12Ah
var_126		= dword ptr -126h
var_122		= dword ptr -122h
var_11E		= dword ptr -11Eh
var_11A		= dword ptr -11Ah
var_116		= dword ptr -116h
var_112		= dword ptr -112h
var_10E		= dword ptr -10Eh
var_10A		= dword ptr -10Ah
var_106		= dword ptr -106h
var_102		= dword ptr -102h
var_FE		= dword ptr -0FEh
var_FA		= dword ptr -0FAh
var_F6		= dword ptr -0F6h
var_F2		= dword ptr -0F2h
var_EE		= dword ptr -0EEh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E2		= word ptr -0E2h
var_E0		= dword ptr -0E0h
var_DC		= word ptr -0DCh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= word ptr -0B6h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= word ptr -0A0h
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
var_6A		= word ptr -6Ah
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 1C6h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_12]
		mov	eax, [bp+arg_6]
		sar	eax, 8
		cdq
		idiv	dword ptr [si+9]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax
		cmp	[bp+arg_6], 0
		jge	short loc_32E22
		mov	ax, 1
		jmp	short loc_32E24

loc_32E22:
		xor	ax, ax

loc_32E24:
		or	al, al
		jz	short loc_32E30
		sub	[bp+var_8], 100h

loc_32E30:
		mov	eax, [si+9]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_8]
		imul	eax, [bp+var_14]
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_A]
		sar	eax, 8
		cdq
		idiv	dword ptr [si+9]
		mov	[bp+var_18], eax
		shl	eax, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		cmp	[bp+arg_A], 0
		jle	short loc_32E73
		mov	ax, 1
		jmp	short loc_32E75

loc_32E73:
		xor	ax, ax

loc_32E75:
		or	al, al
		jz	short loc_32E81
		add	[bp+var_4], 100h

loc_32E81:
		mov	eax, [si+9]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_4]
		imul	eax, [bp+var_20]
		mov	[bp+var_4], eax
		push	0
		mov	al, [si+1Dh]
		push	ax
		push	large [si+19h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	ax, [si+2Fh]
		mov	dx, word_77BF2
		mov	[bp+var_22], dx
		mov	[bp+var_24], ax
		mov	ax, [si+9]
		mov	[bp+var_2E], ax
		movsx	ebx, [bp+var_2E]
		mov	eax, [bp+var_8]
		cdq
		idiv	ebx
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		mov	eax, [bp+var_4]
		cdq
		idiv	ebx
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_2C+1]
		mov	[bp+var_44], ax
		mov	ax, word ptr [bp+var_28+1]
		mov	[bp+var_46], ax
		mov	ax, [bp+var_44]
		mov	word ptr [bp+var_4A], ax
		mov	ax, [bp+var_46]
		mov	word ptr [bp+var_4A+2], ax
		mov	eax, [bp+var_4A]
		mov	[bp+var_42], eax
		push	seg seg017
		push	offset sub_9532
		push	large 10002h
		push	0Ch
		lea	ax, word ptr [bp+var_12A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_9532
		push	large 10003h
		push	0Ch
		lea	ax, word ptr [bp+var_15A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	ax, [si+11h]
		dec	ax
		mov	[bp+var_54], ax
		mov	ax, [si+3Fh]
		sub	word ptr [bp+var_42], ax
		cmp	word ptr [bp+var_42], 0
		jge	short loc_32F69
		xor	ax, ax
		jmp	short loc_32F6C

loc_32F69:
		mov	ax, word ptr [bp+var_42]

loc_32F6C:
		mov	dx, [bp+var_54]
		dec	dx
		cmp	ax, dx
		jle	short loc_32F7A
		mov	ax, [bp+var_54]
		dec	ax
		jmp	short loc_32F87

loc_32F7A:
		cmp	word ptr [bp+var_42], 0
		jge	short loc_32F84
		xor	ax, ax
		jmp	short loc_32F87

loc_32F84:
		mov	ax, word ptr [bp+var_42]

loc_32F87:
		mov	word ptr [bp+var_42], ax
		mov	ax, [si+41h]
		sub	ax, word ptr [bp+var_42+2]
		mov	word ptr [bp+var_42+2], ax
		cmp	word ptr [bp+var_42+2], 0
		jge	short loc_32F9D
		xor	ax, ax
		jmp	short loc_32FA0

loc_32F9D:
		mov	ax, word ptr [bp+var_42+2]

loc_32FA0:
		mov	dx, [bp+var_54]
		dec	dx
		cmp	ax, dx
		jle	short loc_32FAE
		mov	ax, [bp+var_54]
		dec	ax
		jmp	short loc_32FBB

loc_32FAE:
		cmp	word ptr [bp+var_42+2], 0
		jge	short loc_32FB8
		xor	ax, ax
		jmp	short loc_32FBB

loc_32FB8:
		mov	ax, word ptr [bp+var_42+2]

loc_32FBB:
		mov	word ptr [bp+var_42+2], ax
		mov	dx, [si+11h]
		dec	dx
		imul	dx
		mov	dx, word ptr [bp+var_42]
		add	dx, ax
		shl	dx, 1
		mov	[bp+var_56], dx
		mov	ax, [si+2Fh]
		mov	dx, word_77BF2
		mov	bx, [bp+var_56]
		imul	bx, bx, 16h
		add	ax, bx
		mov	[bp+var_22], dx
		mov	[bp+var_24], ax
		les	bx, [bp+var_24]
		mov	ax, es:[bx+2]
		xor	dx, dx
		sub	ax, [si+25h]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 15h
		cdq
		idiv	ebx
		mov	[bp+var_58], ax
		cwd
		idiv	word ptr [si+11h]
		mov	ax, [si+3Fh]
		add	ax, dx
		movsx	eax, ax
		mov	edx, [si+9]
		imul	edx, eax
		mov	[bp+var_5C], edx
		mov	eax, [bp+var_5C]
		shl	eax, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_136], eax
		mov	ax, [bp+var_58]
		cwd
		idiv	word ptr [si+11h]
		mov	dx, [si+41h]
		sub	dx, ax
		movsx	eax, dx
		mov	edx, [si+9]
		imul	edx, eax
		mov	[bp+var_64], edx
		mov	eax, [bp+var_64]
		shl	eax, 8
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_132], eax
		mov	bx, [bp+var_24]
		mov	bx, es:[bx+2]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		mov	ax, es:[bx]
		mov	[bp+var_6A], ax
		movsx	eax, [bp+var_6A]
		shl	eax, 8
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_12E], eax
		mov	eax, [bp+arg_6]
		sub	eax, [bp+var_8]
		mov	[bp+var_72], eax
		mov	[bp+var_76], eax
		mov	eax, [bp+var_76]
		or	eax, eax
		jge	short loc_330AA
		neg	eax

loc_330AA:
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_7E], eax
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4]
		sub	eax, [bp+arg_A]
		mov	[bp+var_82], eax
		mov	[bp+var_86], eax
		mov	eax, [bp+var_86]
		or	eax, eax
		jge	short loc_330D9
		neg	eax

loc_330D9:
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_8E], eax
		mov	[bp+var_52], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_136]
		jnz	short loc_330FC
		mov	ax, 1
		jmp	short loc_330FE

loc_330FC:
		xor	ax, ax

loc_330FE:
		or	al, al
		jnz	short loc_33105
		jmp	loc_334A8

loc_33105:
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_132]
		jnz	short loc_33115
		mov	ax, 1
		jmp	short loc_33117

loc_33115:
		xor	ax, ax

loc_33117:
		or	al, al
		jnz	short loc_3311E
		jmp	loc_334A8

loc_3311E:
		mov	eax, [bp+var_4E]
		cmp	eax, [bp+var_52]
		jle	short loc_3312D
		mov	ax, 1
		jmp	short loc_3312F

loc_3312D:
		xor	ax, ax

loc_3312F:
		or	al, al
		jnz	short loc_33136
		jmp	loc_332F0

loc_33136:
		add	[bp+var_24], 16h
		mov	eax, [bp+var_136]
		mov	[bp+var_15A], eax
		mov	eax, [bp+var_132]
		mov	[bp+var_156], eax
		mov	eax, [bp+var_12E]
		mov	[bp+var_152], eax
		mov	eax, [si+9]
		mov	[bp+var_92], eax
		shl	eax, 8
		mov	[bp+var_96], eax
		mov	eax, [bp+var_15A]
		add	eax, [bp+var_96]
		mov	[bp+var_9A], eax
		mov	[bp+var_9E], eax
		mov	[bp+var_14E], eax
		mov	eax, [bp+var_156]
		mov	[bp+var_14A], eax
		les	bx, [bp+var_24]
		mov	bx, es:[bx+4]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		mov	ax, es:[bx]
		mov	[bp+var_A0], ax
		movsx	eax, [bp+var_A0]
		shl	eax, 8
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_146], eax
		mov	eax, [bp+var_14E]
		mov	[bp+var_142], eax
		mov	eax, [si+9]
		mov	[bp+var_A8], eax
		shl	eax, 8
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_156]
		sub	eax, [bp+var_AC]
		mov	[bp+var_B0], eax
		mov	[bp+var_B4], eax
		mov	[bp+var_13E], eax
		les	bx, [bp+var_24]
		mov	bx, es:[bx+6]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		mov	ax, es:[bx]
		mov	[bp+var_B6], ax
		movsx	eax, [bp+var_B6]
		shl	eax, 8
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_13A], eax
		mov	eax, [bp+var_14E]
		sub	eax, [bp+var_15A]
		mov	[bp+var_166], eax
		mov	eax, [bp+var_14A]
		sub	eax, [bp+var_156]
		mov	[bp+var_162], eax
		mov	eax, [bp+var_146]
		sub	eax, [bp+var_152]
		mov	[bp+var_15E], eax
		mov	eax, [bp+var_166]
		mov	[bp+var_172], eax
		mov	eax, [bp+var_162]
		mov	[bp+var_16E], eax
		mov	eax, [bp+var_15E]
		mov	[bp+var_16A], eax
		mov	eax, [bp+var_172]
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_16E]
		mov	[bp+var_126], eax
		mov	eax, [bp+var_16A]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_142]
		sub	eax, [bp+var_15A]
		mov	[bp+var_17E], eax
		mov	eax, [bp+var_13E]
		sub	eax, [bp+var_156]
		mov	[bp+var_17A], eax
		mov	eax, [bp+var_13A]
		sub	eax, [bp+var_152]
		mov	[bp+var_176], eax
		mov	eax, [bp+var_17E]
		mov	[bp+var_18A], eax
		mov	eax, [bp+var_17A]
		mov	[bp+var_186], eax
		mov	eax, [bp+var_176]
		mov	[bp+var_182], eax
		mov	eax, [bp+var_18A]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_186]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_182]
		jmp	loc_334A3

loc_332F0:
		mov	eax, [bp+var_136]
		mov	[bp+var_15A], eax
		mov	eax, [bp+var_132]
		mov	[bp+var_156], eax
		mov	eax, [bp+var_12E]
		mov	[bp+var_152], eax
		mov	eax, [si+9]
		mov	[bp+var_BE], eax
		shl	eax, 8
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_15A]
		add	eax, [bp+var_C2]
		mov	[bp+var_C6], eax
		mov	[bp+var_CA], eax
		mov	[bp+var_14E], eax
		mov	eax, [si+9]
		mov	[bp+var_CE], eax
		shl	eax, 8
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_156]
		sub	eax, [bp+var_D2]
		mov	[bp+var_D6], eax
		mov	[bp+var_DA], eax
		mov	[bp+var_14A], eax
		les	bx, [bp+var_24]
		mov	bx, es:[bx+4]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		mov	ax, es:[bx]
		mov	[bp+var_DC], ax
		movsx	eax, [bp+var_DC]
		shl	eax, 8
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_146], eax
		mov	eax, [bp+var_15A]
		mov	[bp+var_142], eax
		mov	eax, [bp+var_14A]
		mov	[bp+var_13E], eax
		les	bx, [bp+var_24]
		mov	bx, es:[bx+6]
		mov	es, word_77BF2
		les	bx, es:[bx+11h]
		mov	ax, es:[bx]
		mov	[bp+var_E2], ax
		movsx	eax, [bp+var_E2]
		shl	eax, 8
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_E6]
		mov	[bp+var_13A], eax
		mov	eax, [bp+var_142]
		sub	eax, [bp+var_15A]
		mov	[bp+var_196], eax
		mov	eax, [bp+var_13E]
		sub	eax, [bp+var_156]
		mov	[bp+var_192], eax
		mov	eax, [bp+var_13A]
		sub	eax, [bp+var_152]
		mov	[bp+var_18E], eax
		mov	eax, [bp+var_196]
		mov	[bp+var_1A2], eax
		mov	eax, [bp+var_192]
		mov	[bp+var_19E], eax
		mov	eax, [bp+var_18E]
		mov	[bp+var_19A], eax
		mov	eax, [bp+var_1A2]
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_19E]
		mov	[bp+var_126], eax
		mov	eax, [bp+var_19A]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_14E]
		sub	eax, [bp+var_15A]
		mov	[bp+var_1AE], eax
		mov	eax, [bp+var_14A]
		sub	eax, [bp+var_156]
		mov	[bp+var_1AA], eax
		mov	eax, [bp+var_146]
		sub	eax, [bp+var_152]
		mov	[bp+var_1A6], eax
		mov	eax, [bp+var_1AE]
		mov	[bp+var_1BA], eax
		mov	eax, [bp+var_1AA]
		mov	[bp+var_1B6], eax
		mov	eax, [bp+var_1A6]
		mov	[bp+var_1B2], eax
		mov	eax, [bp+var_1BA]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_1B6]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_1B2]

loc_334A3:
		mov	[bp+var_116], eax

loc_334A8:
		lea	ax, word ptr [bp+var_12A]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		lea	ax, word ptr [bp+var_11E]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		lea	ax, word ptr [bp+var_11E]
		push	ax
		lea	ax, word ptr [bp+var_12A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C6]
		push	ax
		call	Vector_CrossProduct3D_56EF2
		add	sp, 8
		cmp	[bp+var_1BE], 0
		jge	short loc_334E3
		mov	ax, 1
		jmp	short loc_334E5

loc_334E3:
		xor	ax, ax

loc_334E5:
		or	al, al
		jz	short loc_334F4
		lea	ax, word ptr [bp+var_1C6]
		push	ax
		call	Utility_Helper_57812
		pop	cx

loc_334F4:
		mov	eax, [bp+var_1C6]
		mov	[di], eax
		mov	eax, [bp+var_1C2]
		mov	[di+4], eax
		mov	eax, [bp+var_1BE]
		mov	[di+8], eax
		mov	[bp+var_EA], 0
		cmp	[bp+var_1BE], 0
		jle	short loc_33524
		mov	ax, 1
		jmp	short loc_33526

loc_33524:
		xor	ax, ax

loc_33526:
		or	al, al
		jnz	short loc_3352D
		jmp	loc_335E6

loc_3352D:
		mov	eax, [bp+var_1C6]
		mov	edx, eax
		mov	ecx, [bp+var_1BE]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_F2], eax
		mov	eax, [bp+var_F2]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_1C2]
		mov	edx, eax
		mov	ecx, [bp+var_1BE]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_FA], eax
		mov	eax, [bp+var_FA]
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_4E]
		mov	edx, [bp+var_EE]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FE], eax
		mov	eax, [bp+var_FE]
		mov	[bp+var_102], eax
		mov	[bp+var_EA], eax
		mov	eax, [bp+var_52]
		imul	eax, eax, 0FFFFFFFFh
		mov	[bp+var_106], eax
		mov	[bp+var_10A], eax
		mov	eax, [bp+var_10A]
		mov	edx, [bp+var_F6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10E], eax
		mov	eax, [bp+var_10E]
		mov	[bp+var_112], eax
		add	[bp+var_EA], eax
		mov	eax, [bp+var_EA]
		imul	eax, eax, 0FFFFFFFFh
		mov	[bp+var_EA], eax

loc_335E6:
		mov	eax, [bp+var_152]
		add	[bp+var_EA], eax
		mov	dword_77BF0, 0
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_EA]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_32DE5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3360E		proc far
		push	bp
		mov	bp, sp
		push	seg seg043
		push	offset sub_1C1D5
		push	large 10004h
		push	4
sub_3360E		endp

; START OF FUNCTION CHUNK FOR sub_3360E
		db 68h
; END OF FUNCTION CHUNK FOR sub_3360E
seg082		ends
