seg022		segment	para public 'CODE' use16
		assume cs:seg022
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0

loc_B0C1:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0C4		proc far

var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= dword ptr -6Ch
var_68		= byte ptr -68h
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
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 72h
		push	si
		mov	[bp+var_1], 0
		push	large [bp+arg_0]
		call	sub_E3CA
		add	sp, 4
		push	large [bp+arg_0]
		call	sub_DE21
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		cmp	byte ptr [bx+51h], 0FFh
		jnz	short loc_B0FA
		mov	byte_776AB, 1

loc_B0FA:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+1F5h], 0
		jnz	short loc_B108
		jmp	loc_B18E

loc_B108:
		mov	bx, es:[bx+1F5h]
		mov	al, [bx+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_B11F
		mov	ax, 1
		jmp	short loc_B121

loc_B11F:
		xor	ax, ax

loc_B121:
		or	al, al
		jz	short loc_B18E
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+1F5h]
		mov	si, [bx+52h]
		or	si, si
		jz	short loc_B18E
		push	si
		mov	bx, [si]
		call	dword ptr [bx+48h]
		pop	cx
		mov	si, ax
		or	si, si
		jz	short loc_B18E
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_B18E
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F5h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F3h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 3
		jnz	short loc_B18E
		mov	byte ptr es:[bx+135h], 0
		mov	byte ptr es:[bx+163h], 0

loc_B18E:
		cmp	dword_7C837, 3E8h
		jl	short loc_B19C
		jmp	loc_B318

loc_B19C:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+169h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_B1AD
		jmp	loc_B318

loc_B1AD:
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_42], eax
		mov	eax, [si+4]
		mov	[bp+var_3E], eax
		mov	eax, [si+8]
		mov	[bp+var_3A], eax
		push	word ptr es:[bx+0D4h]
		push	ss
		lea	ax, word ptr [bp+var_4E]
		push	ax
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_4E]
		imul	eax, eax, 28h
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	eax, [bp+var_4A]
		imul	eax, eax, 28h
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	eax, [bp+var_46]
		imul	eax, eax, 28h
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_5A]
		add	[bp+var_42], eax
		mov	eax, [bp+var_56]
		add	[bp+var_3E], eax
		mov	eax, [bp+var_52]
		add	[bp+var_3A], eax
		push	0
		mov	[bp+var_1E], 0
		mov	eax, [bp+var_1E]
		mov	[bp+var_66], eax
		mov	[bp+var_22], 0
		mov	eax, [bp+var_22]
		mov	[bp+var_62], eax
		mov	[bp+var_26], 100h
		mov	eax, [bp+var_26]
		mov	[bp+var_5E], eax
		lea	ax, word ptr [bp+var_66]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_2A]
		cmp	eax, [bp+var_3A]
		jl	short loc_B29D
		mov	ax, 1
		jmp	short loc_B29F

loc_B29D:
		xor	ax, ax

loc_B29F:
		or	al, al
		jz	short loc_B318
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_B2BB
		push	large es:[bx+0Dh]
		call	sub_103CB
		add	sp, 4

loc_B2BB:
		mov	[bp+var_72], 0
		xor	ax, ax
		mov	[bp+var_6E], ax
		mov	[bp+var_70], ax
		mov	[bp+var_2E], 200h
		mov	eax, [bp+var_2E]
		mov	[bp+var_6C], eax
		mov	[bp+var_68], 0
		mov	[bp+var_32], 200h
		mov	eax, [bp+var_32]
		mov	[bp+var_6C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 1BDh
		mov	[bp+var_34], ax
		mov	[bp+var_36], dx
		lea	ax, [bp+var_72]
		push	ax
		les	bx, [bp+var_36]
		push	large es:[bx+0Ah]
		les	bx, es:[bx+0Ah]

loc_B30C:
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	loc_B4D1

loc_B318:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_B345
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Fh]
		cmp	ax, word_7C829
		jbe	short loc_B3BC
		cmp	word_7C82D, 0
		jle	short loc_B3BC

loc_B345:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+16Ah]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B3BC
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_B368
		push	large es:[bx+0Dh]
		call	sub_103CB
		add	sp, 4

loc_B368:
		mov	word ptr [bp+var_42], 0
		xor	ax, ax
		mov	word ptr [bp+var_3E], ax
		mov	word ptr [bp+var_42+2], ax
		mov	[bp+var_6], 200h
		mov	eax, [bp+var_6]
		mov	[bp+var_3C], eax
		mov	byte ptr [bp+var_3A+2], 0
		mov	[bp+var_A], 200h
		mov	eax, [bp+var_A]
		mov	[bp+var_3C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 1BDh
		mov	word ptr [bp+var_E+2], ax
		mov	word ptr [bp+var_E], dx
		lea	ax, word ptr [bp+var_42]
		push	ax
		les	bx, word ptr [bp+var_E]
		push	large es:[bx+0Fh]
		les	bx, es:[bx+0Fh]
		jmp	loc_B30C

loc_B3BC:
		les	bx, word ptr [bp+arg_0]
		mov	al, 0
		mov	es:[bx+169h], al
		mov	es:[bx+16Ah], al
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B41E
		cmp	word_7977C, 5
		jbe	short loc_B41E
		mov	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_B3F4
		cmp	byte ptr es:[bx+1EFh], 3
		jz	short loc_B403

loc_B3F4:
		push	large [bp+arg_0]
		call	sub_FE3D
		add	sp, 4
		mov	[bp+var_1], al

loc_B403:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_B88D
		add	sp, 4
		or	al, al
		jz	short loc_B41E
		push	large [bp+arg_0]
		call	sub_A58C
		jmp	short loc_B48F

loc_B41E:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B441
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+1EFh], 1
		ja	short loc_B441
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_FF8B
		add	sp, 4
		mov	[bp+var_1], al

loc_B441:
		cmp	[bp+var_1], 0
		jz	short loc_B44A
		jmp	loc_B4D1

loc_B44A:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_B46E
		cmp	byte ptr es:[bx+1EFh], 0
		jz	short loc_B46E
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		jmp	short loc_B48F

loc_B46E:
		xor	si, si
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_B4AF
		cmp	word_7977C, 5
		jbe	short loc_B4AF
		push	large [bp+arg_0]
		call	sub_C9E4

loc_B48F:
		add	sp, 4
		jmp	short loc_B4D1

loc_B494:
		push	large [bp+arg_0]
		mov	ax, si
		shl	ax, 3
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		call	dword ptr es:[bx+16Bh]
		add	sp, 4
		or	al, al
		jnz	short loc_B4D1
		inc	si

loc_B4AF:
		mov	ax, si
		shl	ax, 3
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+16Bh]
		or	ax, es:[bx+16Dh]
		or	ax, es:[bx+16Fh]
		or	ax, es:[bx+171h]
		or	ax, ax
		jnz	short loc_B494

loc_B4D1:
		pop	si
		leave
		retf
sub_B0C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B4D4		proc far

var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= byte ptr -38h
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_B4ED
		jmp	loc_B70C

loc_B4ED:
		mov	[bp+var_42], 0
		xor	ax, ax
		mov	[bp+var_3E], ax
		mov	[bp+var_40], ax
		mov	[bp+var_6], 200h
		mov	eax, [bp+var_6]
		mov	[bp+var_3C], eax
		mov	[bp+var_38], 0
		cmp	word ptr es:[bx+0FBh], 0
		jz	short loc_B533
		mov	si, es:[bx+0FBh]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_4E], eax
		mov	eax, [si+4]
		mov	[bp+var_4A], eax
		mov	eax, [si+8]
		jmp	short loc_B55C

loc_B533:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 0FDh
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		les	si, [bp+var_A]
		mov	eax, es:[si]
		mov	[bp+var_4E], eax
		mov	eax, es:[si+4]
		mov	[bp+var_4A], eax
		mov	eax, es:[si+8]

loc_B55C:
		mov	[bp+var_46], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 129h
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	bx, [bp+var_E]
		mov	eax, es:[bx]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_46], eax
		push	0
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_66], eax
		mov	[bp+var_1A], 0
		mov	eax, [bp+var_1A]
		mov	[bp+var_62], eax
		mov	[bp+var_1E], 100h
		mov	eax, [bp+var_1E]
		mov	[bp+var_5E], eax
		lea	ax, word ptr [bp+var_66]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0D4h]
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_22]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_22]
		add	[bp+var_46], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [bp+var_4E]
		sub	eax, [si]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		sub	eax, [si+4]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_46]
		sub	eax, [si+8]
		mov	[bp+var_52], eax
		push	eax
		push	large [bp+var_56]
		push	large [bp+var_5A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+125h]
		mov	[bp+var_2E], eax
		shl	eax, 8
		cmp	eax, [bp+var_2A]
		jge	short loc_B646
		mov	ax, 1
		jmp	short loc_B648

loc_B646:
		xor	ax, ax

loc_B648:
		or	al, al
		jnz	short loc_B64F
		jmp	loc_B70C

loc_B64F:
		mov	[bp+var_1], 1
		lea	ax, word ptr [bp+var_5A]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 12Dh
		mov	[bp+var_30], ax
		mov	[bp+var_32], dx
		les	bx, [bp+var_32]
		mov	eax, es:[bx]
		mov	[bp+var_36], eax
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
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_4E]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_4A]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_46]
		mov	es:[bx+0Ah], eax
		mov	eax, [bp+var_5A]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_56]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_52]
		mov	es:[bx+16h], eax
		lea	ax, [bp+var_42]
		push	ax
		les	bx, [bp+arg_0]
		push	large es:[bx+0C0h]
		les	bx, es:[bx+0C0h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6

loc_B70C:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_B4D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B712		proc far

var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+0E2h]
		sar	eax, 8
		sub	eax, es:[bx+152h]
		cmp	eax, 5
		jle	short loc_B792
		mov	eax, es:[bx+0E2h]
		sar	eax, 8
		mov	es:[bx+152h], eax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_EC40
		add	sp, 4
		mov	[bp+var_2], al
		cmp	[bp+var_2], 5
		jnz	short loc_B792
		mov	ax, 24h
		call	Math_RandomScale_56C2F
		cmp	ax, 1
		jnz	short loc_B792
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 2
		jz	short loc_B792
		push	0
		push	8
		push	word_7CADA
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_EA0E
		add	sp, 0Ah
		push	large [bp+arg_0]
		call	sub_E8E5
		add	sp, 4

loc_B792:
		mov	al, [bp+var_1]
		leave
		retf
sub_B712		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B797		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B3h]
		cbw
		add	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		call	CRT_Rand
		and	ax, 0Fh
		inc	ax
		cmp	ax, [bp+var_2]
		jg	short loc_B7BF
		mov	ax, 1
		jmp	short loc_B7C1

loc_B7BF:
		xor	ax, ax

loc_B7C1:
		leave
		retf
sub_B797		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7C3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0BAh]
		cbw
		add	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		call	CRT_Rand
		and	ax, 0Fh
		inc	ax
		cmp	ax, [bp+var_2]
		jg	short loc_B7EB
		mov	ax, 1
		jmp	short loc_B7ED

loc_B7EB:
		xor	ax, ax

loc_B7ED:
		leave
		retf
sub_B7C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7EF		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0BBh]
		cbw
		add	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		call	CRT_Rand
		and	ax, 0Fh
		inc	ax
		cmp	ax, [bp+var_2]
		jg	short loc_B817
		mov	ax, 1
		jmp	short loc_B819

loc_B817:
		xor	ax, ax

loc_B819:
		leave
		retf
sub_B7EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B81B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B4h]
		cbw
		add	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		call	CRT_Rand
		and	ax, 0Fh
		inc	ax
		cmp	ax, [bp+var_2]
		jg	short loc_B843
		mov	ax, 1
		jmp	short loc_B845

loc_B843:
		xor	ax, ax

loc_B845:
		leave
		retf
sub_B81B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B847		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_4]
		mov	ax, 6
		call	Math_RandomScale_56C2F
		push	ax
		mov	ax, 6
		call	Math_RandomScale_56C2F
		pop	dx
		add	dx, ax
		push	dx
		mov	ax, 6
		call	Math_RandomScale_56C2F
		pop	dx
		add	dx, ax
		inc	dx
		mov	cx, dx
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B9h]
		cbw
		cmp	ax, cx
		jle	short loc_B882
		mov	ax, 1
		jmp	short loc_B884

loc_B882:
		xor	ax, ax

loc_B884:
		pop	bp
		retf
sub_B847		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B886		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_B886		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B88D		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+1FAh], 0
		jz	short loc_B8A2
		jmp	loc_B963

loc_B8A2:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0E2h]
		sar	eax, 8
		mov	bx, 80h
		cwd
		idiv	bx
		or	dx, dx
		jz	short loc_B8BC
		jmp	loc_B963

loc_B8BC:
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		mov	ax, [bx+65h]
		mov	dx, [bx+63h]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	bx, [bp+arg_0]
		mov	al, es:[bx+0B6h]
		cbw
		shl	ax, 1
		mov	si, ax
		push	4
		push	word ptr [bp+var_4+2]
		push	dx
		call	sub_41595
		add	sp, 6
		mov	ah, 0
		mov	dx, si
		add	dx, 41h
		cmp	ax, dx
		jle	short loc_B8FB
		mov	ax, 1
		jmp	short loc_B8FD

loc_B8FB:
		xor	ax, ax

loc_B8FD:
		or	ax, ax
		jz	short loc_B913
		push	4

loc_B903:
		push	large [bp+var_4]
		call	sub_41595
		add	sp, 6
		mov	al, 1
		jmp	short loc_B965

loc_B913:
		push	3
		push	large [bp+var_4]
		call	sub_41595
		add	sp, 6
		mov	ah, 0
		mov	dx, si
		add	dx, 4Bh
		cmp	ax, dx
		jle	short loc_B931
		mov	ax, 1
		jmp	short loc_B933

loc_B931:
		xor	ax, ax

loc_B933:
		or	ax, ax
		jz	short loc_B93B
		push	3
		jmp	short loc_B903

loc_B93B:
		push	0
		push	large [bp+var_4]
		call	sub_41595
		add	sp, 6
		mov	ah, 0
		mov	dx, si
		add	dx, 50h
		cmp	ax, dx
		jle	short loc_B959
		mov	ax, 1
		jmp	short loc_B95B

loc_B959:
		xor	ax, ax

loc_B95B:
		or	ax, ax
		jz	short loc_B963
		push	0
		jmp	short loc_B903

loc_B963:
		mov	al, 0

loc_B965:
		pop	si
		leave
		retf
sub_B88D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B968		proc far

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_12		= byte ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_B992
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4

loc_B98D:
		mov	al, 1
		jmp	loc_BAC0

loc_B992:
		mov	di, 0FC18h
		mov	[bp+var_4], 0
		mov	[bp+var_1E], 0
		xor	ax, ax
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], ax
		mov	[bp+var_C], 200h
		mov	eax, [bp+var_C]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 0
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+1F3h], 0
		jz	short loc_B9D0
		mov	ax, es:[bx+1F3h]
		jmp	short loc_B9DE

loc_B9D0:
		push	1
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_BEB6
		add	sp, 6

loc_B9DE:
		mov	[bp+var_1E], ax
		mov	[bp+var_10], 200h
		mov	eax, [bp+var_10]
		mov	[bp+var_18], eax
		cmp	[bp+var_1E], 0
		jnz	short loc_B9FA
		jmp	loc_BABE

loc_B9FA:
		push	[bp+var_1E]
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+0C0h]
		call	sub_9D0A
		add	sp, 6
		xor	si, si
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 1BDh
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		jmp	short loc_BA81

loc_BA22:
		les	bx, [bp+var_8]
		cmp	dword ptr es:[bx], 0
		jz	short loc_BA7C
		lea	ax, [bp+var_1E]
		push	ax
		push	large es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	[bp+var_12], al
		cmp	[bp+var_12], 0
		jz	short loc_BA7C
		call	CRT_Rand
		test	ax, 1
		jz	short loc_BA58
		mov	cx, 1
		jmp	short loc_BA5B

loc_BA58:
		mov	cx, 0FFFFh

loc_BA5B:
		mov	al, [bp+var_12]
		mov	ah, 0
		les	bx, [bp+var_8]
		push	ax
		mov	al, es:[bx+4]
		cbw
		pop	dx
		add	dx, ax
		add	cx, dx
		cmp	cx, di
		jle	short loc_BA7C
		mov	di, cx
		mov	eax, es:[bx]
		mov	[bp+var_4], eax

loc_BA7C:
		inc	si
		add	[bp+var_8], 5

loc_BA81:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+1BBh], si
		jg	short loc_BA22
		cmp	[bp+var_4], 0
		jz	short loc_BABE
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+0Ch], 13h
		jnz	short loc_BAA7
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1F1h]
		mov	[bp+var_1E], ax

loc_BAA7:
		lea	ax, [bp+var_1E]
		push	ax
		push	large [bp+var_4]
		les	bx, word ptr [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	loc_B98D

loc_BABE:
		mov	al, 0

loc_BAC0:
		pop	di
		pop	si
		leave
		retf
sub_B968		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BAC4		proc far

var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		mov	di, ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		mov	al, [bx+51h]
		mov	[bp+var_2], al
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_BAF9
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_BAFB

loc_BAF9:
		mov	al, 1Ch

loc_BAFB:
		mov	[bp+var_4], al
		mov	ah, 0
		cmp	ax, 6
		jz	short loc_BB2B
		cmp	ax, 8
		jz	short loc_BB13
		cmp	ax, 0Dh
		jz	short loc_BB13
		jmp	short loc_BB34
		jmp	short loc_BB2B

loc_BB13:
		mov	[bp+var_6], di
		push	[bp+var_6]
		mov	ax, [bp+arg_0]
		add	ax, 1F7h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6

loc_BB2B:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+1FAh], 1

loc_BB34:
		or	di, di
		jz	short loc_BB6A
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_BB4B
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_BB4D

loc_BB4B:
		mov	al, 1Ch

loc_BB4D:
		mov	[bp+var_8], al
		mov	ah, 0
		cmp	ax, 6
		jz	short loc_BB6A
		cmp	ax, 8
		jz	short loc_BB6A
		cmp	ax, 0Dh
		jz	short loc_BB6A
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+166h], 1

loc_BB6A:
		cmp	word_7CADA, 0
		jz	short loc_BBAF
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+1FAh], 0
		jz	short loc_BBAF
		cmp	di, word_7CADA
		jnz	short loc_BBA0
		cmp	si, di
		jz	short loc_BBA0
		cmp	[bp+var_2], 0FFh
		jnz	short loc_BB93
		mov	byte_776A6, 1
		jmp	short loc_BBAF

loc_BB93:
		cmp	[bp+var_2], 1
		jnz	short loc_BBAF
		mov	byte_776A7, 1
		jmp	short loc_BBAF

loc_BBA0:
		cmp	si, di
		jnz	short loc_BBAF
		cmp	si, word_7CADA
		jnz	short loc_BBAF
		mov	byte_776AD, 1

loc_BBAF:
		pop	di
		pop	si
		leave
		retf
sub_BAC4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBB3		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+92h], 0FBh
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 1
		and	ax, 1
		and	ax, 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		and	ax, 1
		and	ax, 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		shl	al, 6
		or	es:[bx+1Ch], al
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+85h], 0FFh
		cmp	[bp+arg_4], 0
		jnz	short loc_BC24
		jmp	loc_BCB6

loc_BC24:
		mov	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+1F3h], 0
		jz	short loc_BCA8
		push	word ptr es:[bx+1F3h]
		mov	bx, es:[bx+1F3h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_BCB6
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+17h], 2
		jnz	short loc_BC86
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F5h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1F3h]
		mov	[bp+var_6], ax
		push	ax

loc_BC75:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F1h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		jmp	short loc_BCB3

loc_BC86:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1F3h]
		mov	[bp+var_8], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F5h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		push	0
		jmp	short loc_BC75

loc_BCA8:
		push	1
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_BEB6

loc_BCB3:
		add	sp, 6

loc_BCB6:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+161h], 0
		jz	short loc_BCD5
		cmp	byte ptr es:[bx+1EFh], 0
		jz	short loc_BCD5
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_FA7E
		add	sp, 4

loc_BCD5:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		mov	byte ptr [bx+5Eh], 0
		leave
		retf
sub_BBB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BCE3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	cl, 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BD10
		mov	eax, es:[bx+4]
		sar	eax, 8
		movzx	edx, byte ptr es:[bx+8]
		test	edx, eax
		jnz	short loc_BD10
		mov	al, 1
		mov	es:[bx], al
		mov	cl, al

loc_BD10:
		mov	al, cl
		pop	bp
		retf
sub_BCE3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD14		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	cl, 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BD48
		mov	eax, es:[bx+4]
		sar	eax, 8
		mov	dl, es:[bx+8]
		mov	dh, 0
		sar	dx, 1
		movsx	edx, dx
		test	edx, eax
		jnz	short loc_BD48
		mov	al, 1
		mov	es:[bx+2], al
		mov	cl, al

loc_BD48:
		mov	al, cl
		pop	bp
		retf
sub_BD14		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD4C		proc far

var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	dx, [bp+arg_4]
		cmp	byte_76C6C, 0
		jnz	short loc_BD62
		inc	byte_76C6C

loc_BD62:
		cmp	byte_76C6D, 0
		jnz	short loc_BD90
		inc	byte_76C6D
		mov	word_7C858, 0
		xor	ax, ax
		mov	word_7C85C, ax
		mov	word_7C85A, ax
		mov	[bp+var_4], 200h
		mov	eax, [bp+var_4]
		mov	dword_7C85E, eax
		mov	byte_7C862, 0

loc_BD90:
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	di, dx
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_7C84C, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_7C850, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7C854, eax
		mov	si, [bp+arg_6]
		mov	di, dx
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_18], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	611Ch
		push	ss
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	Vector_CrossProduct3D_56EF2
		add	sp, 8
		mov	eax, [bp+var_30]
		mov	dword_7C84C, eax
		mov	eax, [bp+var_2C]
		mov	dword_7C850, eax
		mov	eax, [bp+var_28]
		mov	dword_7C854, eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		cmp	dword ptr [bx+1Ah], 25800h
		jge	short loc_BE41
		mov	ax, 1
		jmp	short loc_BE43

loc_BE41:
		xor	ax, ax

loc_BE43:
		or	al, al
		jz	short loc_BE6A
		cmp	dword_7C854, 0
		jge	short loc_BE54
		mov	ax, 1
		jmp	short loc_BE56

loc_BE54:
		xor	ax, ax

loc_BE56:
		or	al, al
		jz	short loc_BE6A
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	dword_7C854, eax

loc_BE6A:
		mov	[bp+var_C], 200h
		mov	eax, [bp+var_C]
		mov	dword_7C85E, eax
		mov	word_7C85C, 611Ch
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_BE98
		push	large es:[bx+0Dh]
		call	sub_103CB
		add	sp, 4

loc_BE98:
		push	6128h
		les	bx, [bp+arg_0]
		push	large es:[bx+0C8h]
		les	bx, es:[bx+0C8h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_BD4C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEB6		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= byte ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	[bp+var_2], 0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		mov	al, [bx+51h]
		mov	[bp+var_4], al
		mov	[bp+var_8], 0FC18h
		mov	[bp+var_A], 0
		push	77h
		mov	bx, [bp+arg_0]
		push	large es:[bx+0D6h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	[bp+var_B], al
		jmp	loc_C1F9

loc_BEF4:
		mov	si, [bp+var_2]
		mov	ax, si
		or	ax, ax
		jnz	short loc_BF00
		jmp	loc_C1F9

loc_BF00:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_BF2C
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		les	bx, [bp+var_10]
		cmp	byte ptr es:[bx+17h], 2
		jnz	short loc_BF25
		mov	ax, 1
		jmp	short loc_BF27

loc_BF25:
		xor	ax, ax

loc_BF27:
		mov	[bp+var_3], al
		jmp	short loc_BF30

loc_BF2C:
		mov	[bp+var_3], 0

loc_BF30:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_BF43
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_BF45

loc_BF43:
		mov	al, 1Ch

loc_BF45:
		cmp	al, 6
		jz	short loc_BF55
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BF55
		jmp	loc_C1F9

loc_BF55:
		mov	al, [si+51h]
		mov	[bp+var_6], al
		cmp	[bp+var_3], 0
		jz	short loc_BF6D
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BF6D
		jmp	loc_C1F9

loc_BF6D:
		mov	al, [bp+var_4]
		cmp	al, [bp+var_6]
		jnz	short loc_BF78
		jmp	loc_C1F9

loc_BF78:
		cmp	[bp+var_6], 0
		jnz	short loc_BF81
		jmp	loc_C1F9

loc_BF81:
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BF93
		cmp	[bp+var_3], 0
		jz	short loc_BF93
		jmp	loc_C1F9

loc_BF93:
		xor	di, di
		push	si
		les	bx, [bp+arg_0]
		push	large es:[bx+0C0h]
		call	sub_9D0A
		add	sp, 6
		cmp	[bp+var_3], 0
		jnz	short loc_BFB0
		jmp	loc_C057

loc_BFB0:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 3
		jz	short loc_BFCE
		add	di, 14h

loc_BFCE:
		add	di, 5
		cmp	byte_7C7C2, 13h
		jnz	short loc_BFF8
		cmp	dword ptr [si+54h], 0
		jz	short loc_BFF8
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		mov	eax, es:[bx+51h]
		cmp	eax, dword_7C7D9
		jle	short loc_BFF8
		add	di, 14h

loc_BFF8:
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7F3
		jge	short loc_C006
		add	di, 5

loc_C006:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1F1h], si
		jnz	short loc_C013
		add	di, 0Ah

loc_C013:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1F3h], si
		jnz	short loc_C020
		add	di, 46h

loc_C020:
		les	bx, [bp+arg_0]
		cmp	es:[bx+123h], si
		jnz	short loc_C02D
		add	di, 28h

loc_C02D:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 18h
		jz	short loc_C043
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 17h
		jnz	short loc_C04C

loc_C043:
		cmp	byte ptr [si+116h], 0
		jz	short loc_C04C
		xor	di, di

loc_C04C:
		cmp	di, [bp+var_8]
		jg	short loc_C054
		jmp	loc_C1F9

loc_C054:
		jmp	loc_C1F3

loc_C057:
		mov	ax, [si+52h]
		mov	word ptr [bp+var_14+2], ax
		cmp	word ptr [bp+var_14+2], 0
		jz	short loc_C0A7
		push	ax
		mov	bx, word ptr [bp+var_14+2]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	dx, ax
		or	dx, dx
		jz	short loc_C0A7
		mov	bx, dx
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_C0A7
		les	bx, [bp+arg_0]
		cmp	es:[bx+1F5h], si
		jz	short loc_C090
		jmp	loc_C1F9

loc_C090:
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 1F5h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	loc_C1F9

loc_C0A7:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0B2h], 2
		jz	short loc_C0D0
		mov	al, es:[bx+160h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C0D0
		mov	ax, word_7C7D3
		mov	word ptr [bp+var_14], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 8Ch
		jle	short loc_C0D0
		jmp	loc_C1F9

loc_C0D0:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 3
		jnz	short loc_C0FC
		add	di, 19h
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7DF
		jge	short loc_C0FC
		add	di, 0Ah
		cmp	word_7C7D7, 1Eh
		jge	short loc_C0FC
		add	di, 32h

loc_C0FC:
		les	bx, [si+5Ah]
		cmp	byte ptr es:[bx+135h], 2
		jnz	short loc_C10A
		sub	di, 19h

loc_C10A:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 3
		jz	short loc_C175
		push	6093h
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_16], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5Ah
		jle	short loc_C155
		sub	di, 32h

loc_C155:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 0
		jz	short loc_C19E
		sub	di, 28h
		jmp	short loc_C19E

loc_C175:
		cmp	si, word_7CADA
		jnz	short loc_C19E
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 0Ah
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 0FFFBh
		mov	dx, ax
		or	dx, dx
		jle	short loc_C19E
		add	di, dx

loc_C19E:
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7E3
		jge	short loc_C1AC
		add	di, 2

loc_C1AC:
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7E7
		jge	short loc_C1BA
		add	di, 2

loc_C1BA:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1F7h], si
		jnz	short loc_C1C7
		add	di, 0Ah

loc_C1C7:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1F5h], si
		jnz	short loc_C1D4
		add	di, 0Fh

loc_C1D4:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1F3h], si
		jnz	short loc_C1E1
		add	di, 46h

loc_C1E1:
		les	bx, [bp+arg_0]
		cmp	es:[bx+123h], si
		jnz	short loc_C1EE
		add	di, 19h

loc_C1EE:
		cmp	di, [bp+var_8]
		jle	short loc_C1F9

loc_C1F3:
		mov	[bp+var_8], di
		mov	[bp+var_A], si

loc_C1F9:
		lea	ax, [bp+var_2]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_C20F
		jmp	loc_BEF4

loc_C20F:
		cmp	[bp+var_A], 0
		jnz	short loc_C221
		cmp	[bp+var_4], 0FFh
		jnz	short loc_C221
		mov	ax, word_7CADA
		mov	[bp+var_A], ax

loc_C221:
		cmp	[bp+var_A], 0
		jz	short loc_C293
		push	[bp+var_A]
		mov	bx, [bp+var_A]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		cmp	[bp+var_14], 0
		jz	short loc_C293
		les	bx, word ptr [bp+var_14]
		cmp	byte ptr es:[bx+17h], 2
		jnz	short loc_C266
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 1F5h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		mov	ax, [bp+var_A]
		mov	[bp+var_16], ax
		push	ax
		jmp	short loc_C281

loc_C266:
		mov	ax, [bp+var_A]
		mov	[bp+var_18], ax
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 1F5h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		push	0

loc_C281:
		mov	ax, [bp+arg_0]
		add	ax, 1F1h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6

loc_C293:
		mov	ax, [bp+var_A]
		pop	di
		pop	si
		leave
		retf
sub_BEB6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C29A		proc far
		push	bp
		mov	bp, sp
sub_C29A		endp

; START OF FUNCTION CHUNK FOR sub_C29A
		db 66h, 0C7h
		push	es
; END OF FUNCTION CHUNK FOR sub_C29A
seg022		ends
