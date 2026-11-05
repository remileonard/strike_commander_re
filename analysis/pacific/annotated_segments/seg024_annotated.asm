seg024		segment	para public 'CODE' use16
		assume cs:seg024
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 0EBh, 0

loc_DB43:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DB46		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_DB46		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DB4D		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+162h], 0
		jz	short loc_DB62
		jmp	loc_DE1E

loc_DB62:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 2
		jnz	short loc_DB70
		jmp	loc_DE1E

loc_DB70:
		mov	al, byte_776A0
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DBB5
		cmp	byte_776B9, 0
		jz	short loc_DBB5
		push	0Ch
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EB59
		add	sp, 6
		or	al, al
		jz	short loc_DBB5
		call	CRT_Rand
		test	ax, 3
		jnz	short loc_DBB5
		mov	byte_776A0, 1
		push	0
		push	0Ch
		push	word_7CADA
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah

loc_DBB5:
		mov	al, byte_776A0
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DC0D
		mov	al, byte_776B9
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DC0D
		cmp	byte_776BA, 0
		jz	short loc_DC0D
		push	0Bh
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EB59
		add	sp, 6
		or	al, al
		jz	short loc_DC0D
		call	CRT_Rand
		test	ax, 3
		jnz	short loc_DC0D
		push	0
		push	0Bh
		push	word_7CADA
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah
		call	CRT_Rand
		test	ax, 1
		jz	short loc_DC0D
		mov	byte_776A0, 1

loc_DC0D:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+166h], 0
		jz	short loc_DC35
		push	0
		push	13h
		push	word_7CADA
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+166h], 0

loc_DC35:
		cmp	byte_7CE06, 0
		jz	short loc_DC7B
		push	1Fh
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EB59
		add	sp, 6
		or	al, al
		jz	short loc_DC7B
		call	CRT_Rand
		test	ax, 3
		jnz	short loc_DC7B
		push	0
		push	1Fh
		push	word_7CADA
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah
		call	CRT_Rand
		test	ax, 1
		jz	short loc_DC7B
		mov	byte_7CE06, 0

loc_DC7B:
		mov	si, word_7CADA
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	eax, [si+4]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		mov	[bp+var_10], eax
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [si]
		sub	[bp+var_18], eax
		mov	eax, [si+4]
		sub	[bp+var_14], eax
		mov	eax, [si+8]
		sub	[bp+var_10], eax
		push	large [bp+var_10]
		push	large [bp+var_14]
		push	large [bp+var_18]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		mov	eax, dword_7C7DF
		shl	eax, 1
		mov	[bp+var_C], eax
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jle	short loc_DCF5
		mov	ax, 1
		jmp	short loc_DCF7

loc_DCF5:
		xor	ax, ax

loc_DCF7:
		or	al, al
		jnz	short loc_DCFE
		jmp	loc_DE1E

loc_DCFE:
		cmp	word_7CAE2, 0
		jz	short loc_DD0A
		mov	ax, 1
		jmp	short loc_DD0C

loc_DD0A:
		xor	ax, ax

loc_DD0C:
		or	al, al
		jz	short loc_DD2E
		call	CRT_Rand
		test	ax, 3
		jnz	short loc_DD2E
		push	0
		push	10h
		push	word_7CADA
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah

loc_DD2E:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1F7h]
		cmp	ax, word_7CADA
		jnz	short loc_DD66
		cmp	byte_776B5, 0
		jz	short loc_DD66
		push	0
		push	0Eh
		push	word_7CADA
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0B6h]
		add	al, 0FEh
		mov	es:[bx+0B6h], al

loc_DD66:
		cmp	byte_776BD, 0
		jz	short loc_DD8B
		call	CRT_Rand
		test	ax, 3
		jnz	short loc_DD8B
		push	0
		push	1Ch
		push	word_7CADA
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah

loc_DD8B:
		cmp	byte_776B7, 0
		jz	short loc_DDA0
		mov	ax, word_7CAE0
		cmp	ax, word_7CADA
		jnz	short loc_DDA0
		mov	ax, 1
		jmp	short loc_DDA2

loc_DDA0:
		xor	ax, ax

loc_DDA2:
		or	al, al
		jz	short loc_DDC4
		call	CRT_Rand
		test	ax, 3
		jnz	short loc_DDC4
		push	0
		push	0Fh
		push	word_7CADA
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah

loc_DDC4:
		cmp	byte_776B6, 0
		jz	short loc_DDD9
		mov	ax, word_7CAE0
		cmp	ax, word_7CADA
		jnz	short loc_DDD9
		mov	ax, 1
		jmp	short loc_DDDB

loc_DDD9:
		xor	ax, ax

loc_DDDB:
		or	al, al
		jz	short loc_DE1E
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0B6h]
		dec	al
		mov	es:[bx+0B6h], al
		push	0Eh
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_EB59
		add	sp, 6
		or	al, al
		jz	short loc_DE1E
		call	CRT_Rand
		test	ax, 3
		jz	short loc_DE1E
		push	0
		push	0Eh
		push	word_7CADA
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah

loc_DE1E:
		pop	si
		leave
		retf
sub_DB4D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DE21		proc far

var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= byte ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		cmp	word_7CADA, 0
		jnz	short loc_DE32
		jmp	loc_DFFA

loc_DE32:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+1FAh], 0
		jz	short loc_DE7A
		mov	bx, es:[bx+0D4h]
		push	large [bx+63h]
		call	sub_41547
		add	sp, 4
		or	ax, ax
		jz	short loc_DE58
		push	0
		push	7
		jmp	short loc_DE6A

loc_DE58:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		cmp	byte ptr [bx+51h], 1
		jnz	short loc_DE7A
		push	0
		push	6

loc_DE6A:
		push	word_7CADA
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah

loc_DE7A:
		cmp	byte_776B7, 0
		jz	short loc_DEA3
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0D4h]
		cmp	ax, word_7CAE0
		jnz	short loc_DEA3
		push	0
		push	0Dh
		push	word_7CADA
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah

loc_DEA3:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		cmp	byte ptr [bx+51h], 1
		jnz	short loc_DEBF
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_DB4D
		add	sp, 4
		jmp	loc_DFFA

loc_DEBF:
		mov	ax, 0C8h
		call	Math_RandomScale_56C2F
		cmp	ax, 1
		jz	short loc_DECF
		jmp	loc_DFFA

loc_DECF:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+6Dh], 21h
		jz	short loc_DEEA
		cmp	byte ptr es:[bx+6Dh], 22h
		jz	short loc_DEEA
		cmp	byte ptr es:[bx+6Dh], 23h
		jz	short loc_DEEA
		jmp	loc_DFC6

loc_DEEA:
		mov	si, word_7CADA
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_1A], eax
		mov	eax, [si+4]
		mov	[bp+var_16], eax
		mov	eax, [si+8]
		mov	[bp+var_12], eax
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [si]
		sub	[bp+var_1A], eax
		mov	eax, [si+4]
		sub	[bp+var_16], eax
		mov	eax, [si+8]
		sub	[bp+var_12], eax
		push	large [bp+var_12]
		push	large [bp+var_16]
		push	large [bp+var_1A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1F5h]
		cmp	ax, word_7CADA
		jz	short loc_DF5B
		jmp	loc_DFFA

loc_DF5B:
		mov	eax, dword_7C7DF
		mov	[bp+var_C], eax
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jle	short loc_DF72
		mov	ax, 1
		jmp	short loc_DF74

loc_DF72:
		xor	ax, ax

loc_DF74:
		or	al, al
		jnz	short loc_DF7B
		jmp	loc_DFFA

loc_DF7B:
		mov	[bp+var_E], 0
		mov	ax, 6
		call	Math_RandomScale_56C2F
		dec	ax
		mov	bx, ax
		cmp	bx, 5
		ja	short loc_DFBA
		shl	bx, 1
		jmp	cs:off_DFFD[bx]	; switch jump

loc_DF96:
		mov	[bp+var_E], 1
		jmp	short loc_DFBE

loc_DF9C:
		mov	[bp+var_E], 2
		jmp	short loc_DFBE

loc_DFA2:
		mov	[bp+var_E], 3
		jmp	short loc_DFBE

loc_DFA8:
		mov	[bp+var_E], 4
		jmp	short loc_DFBE

loc_DFAE:
		mov	[bp+var_E], 5
		jmp	short loc_DFBE

loc_DFB4:
		mov	[bp+var_E], 6
		jmp	short loc_DFBE

loc_DFBA:
		mov	[bp+var_E], 0

loc_DFBE:
		push	0
		mov	al, [bp+var_E]
		push	ax
		jmp	short loc_DFEA

loc_DFC6:
		mov	ax, 0C8h
		call	Math_RandomScale_56C2F
		cmp	ax, 1
		jnz	short loc_DFD9
		push	0
		push	3
		jmp	short loc_DFEA

loc_DFD9:
		mov	ax, 0C8h
		call	Math_RandomScale_56C2F
		cmp	ax, 1
		jnz	short loc_DFFA
		push	0
		push	6

loc_DFEA:
		push	word_7CADA
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah

loc_DFFA:
		pop	si
		leave
		retf
sub_DE21		endp

; START OF FUNCTION CHUNK FOR sub_DE21
off_DFFD	dw offset loc_DF96
		dw offset loc_DF9C
		dw offset loc_DFA2
		dw offset loc_DFA8
		dw offset loc_DFAE
		dw offset loc_DFB4
; END OF FUNCTION CHUNK FOR sub_DE21

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E009		proc far

var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= byte ptr -32h
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
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+131h], 0
		jnz	short loc_E01F
		jmp	loc_E2F2

loc_E01F:
		cmp	word ptr es:[bx+1F3h], 0
		jnz	short loc_E02A
		jmp	loc_E2F2

loc_E02A:
		push	word ptr es:[bx+1F3h]
		mov	bx, es:[bx+1F3h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_E041
		jmp	loc_E2FC

loc_E041:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+1F5h], 0
		jnz	short loc_E067
		mov	ax, es:[bx+1F3h]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F5h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6

loc_E067:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+14Ch]
		cmp	bx, 4
		jbe	short loc_E077
		jmp	loc_E2E7

loc_E077:
		shl	bx, 1
		jmp	cs:off_E300[bx]	; switch jump

loc_E07E:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	eax, [si+4]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		mov	[bp+var_10], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+1F5h]
		mov	bx, es:[bx+1F5h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_24], eax
		mov	eax, [si+4]
		mov	[bp+var_20], eax
		mov	eax, [si+8]
		mov	[bp+var_1C], eax
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+1F5h]
		add	si, 12h
		mov	di, es:[bx+0D4h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_30], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_2C], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_28], eax
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	word ptr [bp+var_8], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_4], ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	word ptr [bp+var_C+2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	word ptr [bp+var_8+2], ax
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E15F
		push	large es:[bx+0Dh]
		call	sub_103CB
		add	sp, 4

loc_E15F:
		cmp	[bp+var_4], 3Ch
		jge	short loc_E178
		cmp	word ptr [bp+var_8+2], 5Ah
		jge	short loc_E178
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+14Ch], 3
		jmp	loc_E2FC

loc_E178:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+14Ch], 1
		jmp	loc_E2FC

loc_E185:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+131h]
		mov	bx, es:[bx+131h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_18], eax
		mov	eax, [si+4]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		mov	[bp+var_10], eax
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	di, es:[bx+131h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_24], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_20], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_1C], eax
		mov	[bp+var_10], 0
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_14]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_18]
		neg	eax
		mov	[bp+var_2C], eax
		mov	[bp+var_28], 0
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_4], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5Ah
		jle	short loc_E254
		mov	eax, [bp+var_30]
		neg	eax
		mov	[bp+var_30], eax
		mov	eax, [bp+var_2C]
		neg	eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_28]
		neg	eax
		mov	[bp+var_28], eax

loc_E254:
		mov	[bp+var_3C], 0
		xor	ax, ax
		mov	[bp+var_38], ax
		mov	[bp+var_3A], ax
		mov	[bp+var_8], 200h
		mov	eax, [bp+var_8]
		mov	[bp+var_36], eax
		mov	[bp+var_32], 0
		lea	ax, word ptr [bp+var_30]
		mov	[bp+var_38], ax
		mov	[bp+var_C], 400h
		mov	eax, [bp+var_C]
		mov	[bp+var_36], eax
		lea	ax, [bp+var_3C]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+0C8h]
		les	bx, es:[bx+0C8h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	short loc_E2DB

loc_E2A8:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E2DB
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_E2FC
		jmp	short loc_E2DB

loc_E2C9:
		push	large [bp+arg_0]
		call	sub_B968
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E2FC

loc_E2DB:
		les	bx, word ptr [bp+arg_0]
		inc	word ptr es:[bx+14Ch]
		jmp	short loc_E2FC

loc_E2E5:
		jmp	short loc_E2F2

loc_E2E7:
		push	8020h
		call	sub_1DDFE
		pop	cx
		jmp	short loc_E2FC

loc_E2F2:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+14Ch], 0

loc_E2FC:
		pop	di
		pop	si
		leave
		retf
sub_E009		endp

; START OF FUNCTION CHUNK FOR sub_E009
off_E300	dw offset loc_E07E
		dw offset loc_E185
		dw offset loc_E2A8
		dw offset loc_E2C9
		dw offset loc_E2E5
; END OF FUNCTION CHUNK FOR sub_E009

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E30A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E328
		push	large es:[bx+0Dh]
		call	sub_103CB
		add	sp, 4

loc_E328:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+163h], 1
		mov	byte ptr es:[bx+135h], 3
		mov	ax, es:[bx+1F5h]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 1F3h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+14Ch], 0
		mov	eax, es:[bx+0E2h]
		sar	eax, 8
		mov	es:[bx+14Eh], eax
		leave
		retf
sub_E30A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E36E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+165h], 1
		mov	byte ptr es:[bx+135h], 0
		mov	byte ptr es:[bx+163h], 0
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 1F3h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		pop	bp
		retf
sub_E36E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E39C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+135h], 0
		mov	byte ptr es:[bx+163h], 0
		mov	byte ptr es:[bx+165h], 0
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 1F3h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		pop	bp
		retf
sub_E39C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E3CA		proc far

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+26h], 0
		jz	short loc_E3F0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ah
		push	word ptr [bp+arg_0+2]
		push	ax
		call	RadioQueue_RegisterMessage
		add	sp, 4
		jmp	short loc_E3FF

loc_E3F0:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+9Eh], 0
		mov	al, 0FFh

loc_E3FF:
		mov	[bp+var_2], al
		cmp	[bp+var_2], 0FFh
		jnz	short loc_E40B
		jmp	loc_E8CD

loc_E40B:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+9Eh]
		mov	di, es:[bx+0Dh]
		mov	[bp+var_4], 0
		or	di, di
		jnz	short loc_E422
		jmp	loc_E8BA

loc_E422:
		cmp	di, word_7CADA
		jz	short loc_E42B
		jmp	loc_E8BA

loc_E42B:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_E9FB
		add	sp, 4
		mov	[bp+var_5], al
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EDC7
		add	sp, 4
		mov	[bp+var_6], al
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+5Fh]
		mov	ax, es:[bx+0Eh]
		mov	[bp+var_8], ax
		les	bx, [di+5Fh]
		mov	si, es:[bx+0Eh]
		mov	al, [bp+var_2]
		cbw
		sub	ax, 64h
		mov	bx, ax
		cmp	bx, 9
		jbe	short loc_E472
		jmp	loc_E8B6

loc_E472:
		shl	bx, 1
		jmp	cs:off_E8D1[bx]	; switch jump

loc_E479:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EF13
		add	sp, 4
		or	al, al
		jnz	short loc_E48C
		jmp	loc_E821

loc_E48C:
		mov	[bp+var_4], 3
		jmp	loc_E8BA
		jmp	loc_E821

loc_E496:
		mov	[bp+var_4], 0FFh
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+162h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_E4AB
		jmp	loc_E8BA

loc_E4AB:
		push	1
		push	1
		push	di
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+162h], 1
		jmp	loc_E8BA

loc_E4C8:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+162h], 0
		jnz	short loc_E4D6
		jmp	loc_E7A6

loc_E4D6:
		mov	[bp+var_4], 1
		mov	byte ptr es:[bx+162h], 0
		jmp	loc_E8BA
		jmp	loc_E7A6

loc_E4E6:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 2
		jnz	short loc_E4F8
		mov	[bp+var_4], 8
		jmp	loc_E583

loc_E4F8:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 1
		jnz	short loc_E509
		mov	[bp+var_4], 0FFh
		jmp	short loc_E583

loc_E509:
		mov	al, byte_776A0
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E523
		mov	[bp+var_4], 1
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_E39C
		add	sp, 4
		jmp	short loc_E583

loc_E523:
		cmp	[bp+var_6], 4
		jz	short loc_E52F
		cmp	[bp+var_6], 1Dh
		jnz	short loc_E537

loc_E52F:
		mov	al, [bp+var_6]
		mov	[bp+var_4], al
		jmp	short loc_E583

loc_E537:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EE6F
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E561
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EE87
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E561
		mov	[bp+var_4], 5
		jmp	short loc_E583

loc_E561:
		cmp	[bp+var_5], 0
		jz	short loc_E583
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_E39C
		add	sp, 4
		cmp	byte_776BA, 0
		jz	short loc_E57F
		mov	[bp+var_4], 12h
		jmp	short loc_E583

loc_E57F:
		mov	[bp+var_4], 1

loc_E583:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EF13
		add	sp, 4
		or	al, al
		jnz	short loc_E596
		jmp	loc_E8BA

loc_E596:
		push	1
		push	1
		push	di
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah
		jmp	loc_E48C

loc_E5AA:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+161h], 0
		jz	short loc_E5B8
		jmp	loc_E7A6

loc_E5B8:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 2
		jnz	short loc_E5C6
		jmp	loc_E80E

loc_E5C6:
		mov	al, byte_776A0
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E5DE

loc_E5CF:
		mov	[bp+var_4], 1

loc_E5D3:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_E36E
		jmp	loc_E7FD

loc_E5DE:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EF13
		add	sp, 4
		or	al, al
		jz	short loc_E605
		mov	[bp+var_4], 1
		push	1
		push	3
		push	di
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah
		jmp	short loc_E5D3

loc_E605:
		cmp	[bp+var_8], 0
		jz	short loc_E5CF
		cmp	[bp+var_5], 0
		jz	short loc_E613
		jmp	short loc_E5CF

loc_E613:
		mov	[bp+var_4], 0
		cmp	byte_776BA, 0
		jz	short loc_E624
		push	1
		push	12h
		jmp	short loc_E658

loc_E624:
		push	1
		push	1
		jmp	short loc_E658
		jmp	short loc_E5CF

loc_E62C:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 2
		jnz	short loc_E63A
		jmp	loc_E80E

loc_E63A:
		cmp	[bp+var_6], 4
		jz	short loc_E652
		cmp	[bp+var_6], 1Dh
		jz	short loc_E652
		cmp	[bp+var_6], 5
		jnz	short loc_E668
		cmp	[bp+var_6], 1Eh
		jnz	short loc_E668

loc_E652:
		push	1
		mov	al, [bp+var_6]
		push	ax

loc_E658:
		push	di
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah
		jmp	loc_E8BA

loc_E668:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EF13
		add	sp, 4
		or	al, al
		jz	short loc_E684
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E684
		jmp	loc_E48C

loc_E684:
		cmp	[bp+var_8], 0
		jz	short loc_E696
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E696
		jmp	loc_E8B6

loc_E696:
		or	si, si
		jnz	short loc_E69D
		jmp	loc_E8BA

loc_E69D:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		les	bx, [bp+var_C]
		cmp	byte ptr es:[bx+17h], 2
		jnz	short loc_E705
		cmp	byte ptr [si+51h], 1
		jnz	short loc_E6BC
		jmp	loc_E8BA

loc_E6BC:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+163h], 1
		mov	[bp+var_E], si
		push	[bp+var_E]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F3h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		mov	[bp+var_10], si
		push	[bp+var_10]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F1h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+135h], 3
		mov	[bp+var_4], 12h
		jmp	loc_E8A5

loc_E705:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		push	dx
		push	ax
		les	bx, [bp+var_14]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jz	short loc_E726
		jmp	loc_E8BA

loc_E726:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+0D4h], si
		jnz	short loc_E733
		jmp	loc_E8BA

loc_E733:
		mov	al, [si+51h]
		cbw
		mov	bx, es:[bx+0D4h]
		push	ax
		mov	al, [bx+51h]
		cbw
		neg	ax
		pop	dx
		cmp	dx, ax
		jz	short loc_E74B
		jmp	loc_E8BA

loc_E74B:
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+163h], 1
		mov	byte ptr es:[bx+135h], 3
		mov	[bp+var_16], si
		push	[bp+var_16]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F3h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		mov	[bp+var_18], si
		push	[bp+var_18]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F5h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+14Ch], 0
		mov	[bp+var_4], 1
		jmp	loc_E8A5

loc_E79B:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 2
		jnz	short loc_E7AD

loc_E7A6:
		mov	[bp+var_4], 0FFh
		jmp	loc_E8BA

loc_E7AD:
		cmp	[bp+var_6], 4
		jz	short loc_E7F0
		cmp	[bp+var_6], 1Dh
		jz	short loc_E7F0
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EE6F
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E7DD
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EE87
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_E7F0

loc_E7DD:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EF13
		add	sp, 4
		or	al, al
		jnz	short loc_E7F0
		jmp	loc_E8BA

loc_E7F0:
		mov	[bp+var_4], 8
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_E8E5

loc_E7FD:
		add	sp, 4
		jmp	loc_E8BA

loc_E803:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 2
		jnz	short loc_E815

loc_E80E:
		mov	[bp+var_4], 8
		jmp	loc_E8BA

loc_E815:
		cmp	[bp+var_6], 4
		jz	short loc_E821
		cmp	[bp+var_6], 1Dh
		jnz	short loc_E82A

loc_E821:
		mov	al, [bp+var_6]
		mov	[bp+var_4], al
		jmp	loc_E8BA

loc_E82A:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EE6F
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E842
		mov	[bp+var_4], 5
		jmp	short loc_E8BA

loc_E842:
		cmp	[bp+var_8], 0
		jz	short loc_E853
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E853
		jmp	short loc_E8B6

loc_E853:
		cmp	word_7CAE2, 0
		jz	short loc_E8B0
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+135h], 3
		mov	ax, word_7CAE2
		mov	[bp+var_1A], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F3h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		mov	ax, word_7CAE2
		mov	[bp+var_1C], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F5h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+14Ch], 0
		mov	byte ptr es:[bx+163h], 1

loc_E8A5:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+165h], 0
		jmp	short loc_E8BA

loc_E8B0:
		mov	[bp+var_4], 0Eh
		jmp	short loc_E8BA

loc_E8B6:
		mov	[bp+var_4], 0

loc_E8BA:
		push	1
		mov	al, [bp+var_4]
		push	ax
		push	di
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah

loc_E8CD:
		pop	di
		pop	si
		leave
		retf
sub_E3CA		endp

; START OF FUNCTION CHUNK FOR sub_E3CA
off_E8D1	dw offset loc_E479
		dw offset loc_E8B6
		dw offset loc_E8B6
		dw offset loc_E4E6
		dw offset loc_E5AA
		dw offset loc_E62C
		dw offset loc_E79B
		dw offset loc_E803
		dw offset loc_E496
		dw offset loc_E4C8
; END OF FUNCTION CHUNK FOR sub_E3CA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E8E5		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+165h], 0
		mov	byte ptr es:[bx+163h], 1
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 1F3h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+135h], 2
		mov	[bp+var_1C], 0
		xor	ax, ax
		mov	[bp+var_18], ax
		mov	[bp+var_1A], ax
		mov	[bp+var_4], 200h
		mov	eax, [bp+var_4]
		mov	[bp+var_16], eax
		mov	[bp+var_12], 0
		push	word ptr es:[bx+0D4h]
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_Node_Accessor_546E4
		add	sp, 4
		mov	bx, ax
		mov	es, dx
		and	byte ptr es:[bx+39h], 0DFh
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E96D
		push	large es:[bx+0Dh]
		call	sub_103CB
		add	sp, 4

loc_E96D:
		push	word_79B8C
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_55DCA
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_28]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_24]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_20]
		mov	es:[bx+0Ah], eax
		add	dword ptr es:[bx+0Ah], 3E800h
		mov	[bp+var_8], 7D00h
		mov	[bp+var_C], 6400h
		mov	[bp+var_10], 0
		mov	eax, [bp+var_8]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+16h], eax
		lea	ax, [bp+var_1C]
		push	ax
		les	bx, [bp+arg_0]
		push	large es:[bx+0C0h]
		les	bx, es:[bx+0C0h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		mov	al, 1
		leave
		retf
sub_E8E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E9FB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+164h], 1
		mov	al, es:[bx+164h]
		pop	bp
		retf
sub_E9FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EA0E		proc far

var_6		= byte ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		cmp	[bp+arg_8], 0
		jnz	short loc_EA42
		les	bx, [bp+arg_0]
		mov	al, es:[bx+162h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_EA2B
		jmp	loc_EB22

loc_EA2B:
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_2]
		push	bx
		nop
		push	cs
		call	near ptr sub_EB59
		add	sp, 6
		or	al, al
		jnz	short loc_EA42
		jmp	loc_EB22

loc_EA42:
		mov	al, [bp+arg_6]
		mov	[bp+var_2], al
		cmp	[bp+var_2], 0Ah
		jz	short loc_EA54
		cmp	[bp+var_2], 9
		jnz	short loc_EAC3

loc_EA54:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+6Dh], 21h
		jz	short loc_EA6C
		cmp	byte ptr es:[bx+6Dh], 22h
		jz	short loc_EA6C
		cmp	byte ptr es:[bx+6Dh], 23h
		jnz	short loc_EAC3

loc_EA6C:
		call	CRT_Rand
		mov	dx, ax
		cmp	[bp+var_2], 9
		jnz	short loc_EAA2
		mov	[bp+var_2], 17h
		mov	bx, dx
		and	bx, 7
		cmp	bx, 7
		ja	short loc_EAC3
		shl	bx, 1
		jmp	cs:off_EB49[bx]	; switch jump

loc_EA8E:
		mov	[bp+var_2], 17h
		jmp	short loc_EAC3

loc_EA94:
		mov	[bp+var_2], 18h
		jmp	short loc_EAC3

loc_EA9A:
		mov	[bp+var_2], 19h
		jmp	short loc_EAC3

loc_EAA0:
		jmp	short loc_EA8E

loc_EAA2:
		mov	bx, dx
		and	bx, 7
		cmp	bx, 7
		ja	short loc_EAC3
		shl	bx, 1
		jmp	cs:off_EB39[bx]	; switch jump

loc_EAB3:
		mov	[bp+var_2], 1Ah
		jmp	short loc_EAC3

loc_EAB9:
		mov	[bp+var_2], 1Bh
		jmp	short loc_EAC3

loc_EABF:
		mov	[bp+var_2], 0Ah

loc_EAC3:
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	al, [bp+var_2]
		mov	[bp+var_6], al
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+26h], 0
		jz	short loc_EAF1
		push	ax
		push	[bp+var_4]
		mov	ax, [bp+arg_0]
		add	ax, 1Ah
		push	[bp+arg_2]
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_EAF1

loc_EAF1:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0E2h]
		sar	eax, 8
		mov	es:[bx+142h], eax
		mov	al, [bp+arg_6]
		mov	es:[bx+146h], al
		cmp	[bp+arg_6], 6
		jnz	short loc_EB22
		mov	eax, es:[bx+0E2h]
		sar	eax, 8
		mov	es:[bx+0F3h], eax

loc_EB22:
		cmp	[bp+arg_6], 9
		jz	short loc_EB2E
		cmp	[bp+arg_6], 0Ah
		jnz	short loc_EB37

loc_EB2E:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+162h], 1

loc_EB37:
		leave
		retf
sub_EA0E		endp

; START OF FUNCTION CHUNK FOR sub_EA0E
off_EB39	dw offset loc_EAB3
		dw offset loc_EAB3
		dw offset loc_EAB3
		dw offset loc_EAB9
		dw offset loc_EAB9
		dw offset loc_EAB9
		dw offset loc_EAB9
		dw offset loc_EABF
off_EB49	dw offset loc_EA8E
		dw offset loc_EA94
		dw offset loc_EA9A
		dw offset loc_EA9A
		dw offset loc_EA9A
		dw offset loc_EA9A
		dw offset loc_EAA0
		dw offset loc_EAA0
; END OF FUNCTION CHUNK FOR sub_EA0E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EB59		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	dx, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0E2h]
		sar	eax, 8
		sub	eax, es:[bx+142h]
		mov	[bp+var_4], eax
		mov	[bp+var_5], 0
		mov	cl, es:[bx+0B5h]
		cmp	es:[bx+146h], dl
		jnz	short loc_EB96
		cmp	dl, 0FFh
		jz	short loc_EB96
		cmp	cl, 3
		jle	short loc_EB96
		add	cl, 0FDh

loc_EB96:
		mov	al, cl
		cbw
		or	ax, ax
		jz	short loc_EBE2
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 2
		jz	short loc_EBE2
		cmp	cl, 0Eh
		jg	short loc_EBDE
		cmp	cl, 4
		jge	short loc_EBBB
		cmp	[bp+var_4], 50h
		jle	short loc_EBE2
		jmp	short loc_EBDE

loc_EBBB:
		cmp	cl, 8
		jge	short loc_EBC9
		cmp	[bp+var_4], 3Ch
		jle	short loc_EBE2
		jmp	short loc_EBDE

loc_EBC9:
		cmp	cl, 0Ch
		jge	short loc_EBD7
		cmp	[bp+var_4], 28h
		jle	short loc_EBE2
		jmp	short loc_EBDE

loc_EBD7:
		cmp	[bp+var_4], 14h
		jle	short loc_EBE2

loc_EBDE:
		mov	[bp+var_5], 1

loc_EBE2:
		les	bx, [bp+arg_0]
		cmp	es:[bx+146h], dl
		jz	short loc_EC3B
		cmp	dl, 0Ah
		jz	short loc_EC37
		cmp	dl, 9
		jz	short loc_EC37
		cmp	dl, 8
		jz	short loc_EC37
		cmp	dl, 4
		jz	short loc_EC37
		cmp	dl, 9
		jz	short loc_EC37
		cmp	dl, 14h
		jz	short loc_EC37
		cmp	dl, 15h
		jz	short loc_EC37
		cmp	dl, 16h
		jz	short loc_EC37
		cmp	dl, 17h
		jz	short loc_EC37
		cmp	dl, 18h
		jz	short loc_EC37
		cmp	dl, 19h
		jz	short loc_EC37
		cmp	dl, 1Ah
		jz	short loc_EC37
		cmp	dl, 1Bh
		jz	short loc_EC37
		cmp	dl, 0Ch
		jz	short loc_EC37
		cmp	dl, 0Bh
		jnz	short loc_EC3B

loc_EC37:
		mov	[bp+var_5], 1

loc_EC3B:
		mov	al, [bp+var_5]
		leave
		retf
sub_EB59		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EC40		proc far

var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	[bp+var_2], 2
		cmp	byte_7C810, 0FFh
		jz	short loc_EC55
		jmp	loc_EDC1

loc_EC55:
		mov	si, 64h
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		mov	ax, [bx+65h]
		mov	dx, [bx+63h]
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		push	ax
		push	dx
		call	sub_415CD
		add	sp, 4
		mov	ah, 0
		sub	si, ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EF65
		add	sp, 4
		mov	dx, ax
		add	si, dx
		or	dx, dx
		jz	short loc_ECB6
		cmp	word_79B8F, 0
		jz	short loc_ECA2
		mov	ax, word_79B91
		imul	ax, ax, 64h
		cwd
		idiv	word_79B8F
		sub	si, ax

loc_ECA2:
		cmp	word_79B93, 0
		jz	short loc_ECB6
		mov	ax, word_79B95
		imul	ax, ax, 32h
		cwd
		idiv	word_79B93
		add	si, ax

loc_ECB6:
		cmp	byte_776B9, 0
		jz	short loc_ECED
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+0E2h]
		sar	eax, 8
		sub	eax, es:[bx+0F3h]
		cmp	eax, 0Fh
		jge	short loc_ECE0
		mov	ax, si
		imul	ax, ax, 7
		mov	bx, 8
		jmp	short loc_ECE8

loc_ECE0:
		mov	ax, si
		imul	ax, ax, 9
		mov	bx, 0Ah

loc_ECE8:
		cwd
		idiv	bx
		mov	si, ax

loc_ECED:
		movsx	eax, si
		les	bx, word ptr [bp+arg_0]
		movsx	edx, byte ptr es:[bx+0B6h]
		add	edx, 0FFFFFFF8h
		shl	edx, 2
		add	edx, 64h
		imul	eax, edx
		mov	ebx, 64h
		cdq
		idiv	ebx
		mov	si, ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EE87
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_ED3C
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EE6F
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_ED3E

loc_ED3C:
		xor	si, si

loc_ED3E:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EFF3
		add	sp, 4
		movsx	eax, ax
		mov	[bp+var_A], eax
		cmp	[bp+var_A], 37h
		jge	short loc_ED5B
		sar	si, 1

loc_ED5B:
		cmp	[bp+var_A], 28h
		jge	short loc_ED96
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 2
		jz	short loc_ED94
		mov	al, es:[bx+168h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_ED94
		push	0
		push	4
		push	word_7CADA
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_EA0E
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+168h], 1

loc_ED94:
		xor	si, si

loc_ED96:
		cmp	si, 19h
		jge	short loc_EDA1
		mov	[bp+var_2], 5
		jmp	short loc_EDBB

loc_EDA1:
		cmp	si, 32h
		jge	short loc_EDAC
		mov	[bp+var_2], 4
		jmp	short loc_EDBB

loc_EDAC:
		cmp	si, 50h
		jge	short loc_EDB7
		mov	[bp+var_2], 3
		jmp	short loc_EDBB

loc_EDB7:
		mov	[bp+var_2], 2

loc_EDBB:
		mov	al, [bp+var_2]
		mov	byte_7C810, al

loc_EDC1:
		mov	al, byte_7C810
		pop	si
		leave
		retf
sub_EC40		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EDC7		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	[bp+var_2], 2
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EF13
		add	sp, 4
		or	al, al
		jz	short loc_EDE5
		mov	[bp+var_2], 6

loc_EDE5:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		mov	ax, [bx+65h]
		mov	dx, [bx+63h]
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		push	ax
		push	dx
		call	sub_41612
		add	sp, 4
		or	al, al
		jz	short loc_EE0B
		mov	[bp+var_2], 1Dh

loc_EE0B:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EE87
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_EE21
		mov	[bp+var_2], 1Eh

loc_EE21:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EE6F
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_EE37
		mov	[bp+var_2], 5

loc_EE37:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_EFF3
		add	sp, 4
		cmp	ax, 37h
		jge	short loc_EE4C
		mov	[bp+var_2], 4

loc_EE4C:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 2
		jnz	short loc_EE5B
		mov	[bp+var_2], 8

loc_EE5B:
		cmp	[bp+var_2], 4
		jnz	short loc_EE6A
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+168h], 1

loc_EE6A:
		mov	al, [bp+var_2]
		leave
		retf
sub_EDC7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EE6F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	40h
		les	bx, [bp+arg_0]
		push	large es:[bx+0D6h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		pop	bp
		retf
sub_EE6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EE87		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	[bp+var_1], 1
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 3
		jz	short loc_EF0E
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+123h], 0
		jz	short loc_EF0E
		push	word ptr es:[bx+123h]
		mov	bx, es:[bx+123h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		cmp	byte ptr es:[bx+17h], 2
		jnz	short loc_EF0E
		push	1Fh
		les	bx, [bp+arg_0]
		push	large es:[bx+0D6h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_EF0E
		push	20h
		les	bx, [bp+arg_0]
		push	large es:[bx+0D6h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_EF0E
		mov	[bp+var_1], 0

loc_EF0E:
		mov	al, [bp+var_1]
		leave
		retf
sub_EE87		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EF13		proc far

var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_EC40
		add	sp, 4
		cmp	al, 5
		jnz	short loc_EF48
		cmp	byte_776B9, 0
		jz	short loc_EF48
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_E9FB
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_EF48
		mov	[bp+var_1], 1

loc_EF48:
		mov	al, [bp+var_1]
		leave
		retf
sub_EF13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EF4D		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_79B93
		sub	ax, word_79B95
		pop	bp
		retf
sub_EF4D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EF59		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_79B8F
		sub	ax, word_79B91
		pop	bp
		retf
sub_EF59		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EF65		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	[bp+var_4], 0
		cmp	word_79B8F, 0
		jz	short loc_EFED
		mov	ax, word_79B8F
		cmp	ax, word_79B91
		jl	short loc_EFED
		mov	ax, word_79B93
		cmp	ax, word_79B95
		jl	short loc_EFED
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_EF4D
		add	sp, 4
		mov	si, ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_EF59
		add	sp, 4
		mov	dx, ax
		or	si, si
		jle	short loc_EFED
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		cmp	byte ptr [bx+51h], 0
		jz	short loc_EFED
		cmp	si, dx
		jle	short loc_EFD4
		movsx	eax, si
		imul	eax, eax, 0FFFFFF9Ch
		movsx	ebx, dx
		cdq
		idiv	ebx
		add	eax, 64h
		jmp	short loc_EFE9

loc_EFD4:
		movsx	eax, dx
		imul	eax, eax, 64h
		movsx	ebx, si
		cdq
		idiv	ebx
		add	eax, 0FFFFFF9Ch

loc_EFE9:
		mov	[bp+var_4], eax

loc_EFED:
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_EF65		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EFF3		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	eax, [bx+8Ah]
		sar	eax, 8
		imul	eax, eax, 64h
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	edx, [bx+86h]
		sar	edx, 8
		push	edx
		cdq
		pop	ebx
		idiv	ebx
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_EFF3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F02F		proc far

var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
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
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0D4h
		push	si
		les	bx, [bp+arg_0]
		mov	al, es:[bx+161h]
		mov	[bp+var_1], al
		push	word ptr es:[bx+131h]
		mov	bx, es:[bx+131h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_5C], eax
		mov	eax, [si+4]
		mov	[bp+var_58], eax
		mov	eax, [si+8]
		mov	[bp+var_54], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_68], eax
		mov	eax, [si+4]
		mov	[bp+var_64], eax
		mov	eax, [si+8]
		mov	[bp+var_60], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+131h]
		mov	si, [bx+52h]
		add	si, 2
		mov	eax, [si]
		mov	[bp+var_8C], eax
		mov	eax, [si+4]
		mov	[bp+var_88], eax
		mov	eax, [si+8]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_8C]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_88]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_84]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_84], eax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	si, es:[bx+131h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_80], eax
		mov	eax, [si+4]
		mov	[bp+var_7C], eax
		mov	eax, [si+8]
		mov	[bp+var_78], eax
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [si]
		sub	[bp+var_80], eax
		mov	eax, [si+4]
		sub	[bp+var_7C], eax
		mov	eax, [si+8]
		sub	[bp+var_78], eax
		push	large [bp+var_78]
		push	large [bp+var_7C]
		push	large [bp+var_80]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	60EDh
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_14], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 0A0h
		jle	short loc_F19E
		mov	ax, 1
		jmp	short loc_F1A0

loc_F19E:
		xor	ax, ax

loc_F1A0:
		mov	[bp+var_11], al
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0D4h]
		mov	[bp+var_1A], ax
		push	ax
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_Node_Accessor_546E4
		add	sp, 4
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_16]
		mov	dx, [bp+var_18]
		add	dx, 33h
		mov	[bp+var_1C], ax
		mov	[bp+var_1E], dx
		les	bx, [bp+var_1E]
		mov	ax, es:[bx]
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_98], eax
		mov	ax, es:[bx+2]
		mov	[bp+var_26], ax
		movsx	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_94], eax
		mov	ax, es:[bx+4]
		mov	[bp+var_2C], ax
		movsx	eax, [bp+var_2C]
		shl	eax, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_90], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+131h]
		mov	bx, es:[bx+131h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_98]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_98]
		add	[bp+var_80], eax
		mov	eax, [bp+var_94]
		add	[bp+var_7C], eax
		mov	eax, [bp+var_90]
		add	[bp+var_78], eax
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_F296
		lea	ax, word ptr [bp+var_68]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		call	sub_A41D
		add	sp, 4
		mov	[bp+var_32], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0Fh
		jge	short loc_F296
		mov	[bp+var_1], 1

loc_F296:
		cmp	[bp+var_1], 0
		jnz	short loc_F29F
		jmp	loc_FA78

loc_F29F:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+161h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_F2B9
		cmp	dword ptr es:[bx+156h], 0
		jz	short loc_F2B9
		jmp	loc_F3E4

loc_F2B9:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+156h], 0
		jnz	short loc_F2ED
		push	seg seg024
		push	offset sub_FBB4
		push	5
		push	large 40h
		push	large 0C0000h
		push	0
		call	sub_149D
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	es:[bx+158h], dx
		mov	es:[bx+156h], ax

loc_F2ED:
		xor	si, si
		jmp	loc_F3C8

loc_F2F2:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	ax, si
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_68]
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	ax, si
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_64]
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	ax, si
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_60]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	bx, ax
		mov	eax, [bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	dx, si
		add	dx, 20h
		imul	dx, dx, 0Ch
		add	bx, dx
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	dx, si
		add	dx, 20h
		imul	dx, dx, 0Ch
		add	bx, dx
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	dx, si
		add	dx, 20h
		imul	dx, dx, 0Ch
		add	bx, dx
		mov	es:[bx+8], eax
		inc	si

loc_F3C8:
		cmp	si, 20h
		jge	short loc_F3D0
		jmp	loc_F2F2

loc_F3D0:
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+15Eh], ax
		movsx	eax, ax
		mov	es:[bx+15Ah], eax

loc_F3E4:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_C]
		jge	short loc_F3F3
		mov	ax, 1
		jmp	short loc_F3F5

loc_F3F3:
		xor	ax, ax

loc_F3F5:
		or	al, al
		jz	short loc_F472
		mov	eax, [bp+var_C]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_8]
		sub	[bp+var_36], eax
		cmp	[bp+var_C], 2EE00h
		jle	short loc_F418
		mov	ax, 1
		jmp	short loc_F41A

loc_F418:
		xor	ax, ax

loc_F41A:
		or	al, al
		jz	short loc_F42E
		cmp	[bp+var_11], 0
		jz	short loc_F42E
		mov	[bp+var_3A], 3200h
		jmp	short loc_F436

loc_F42E:
		mov	[bp+var_3A], 1400h

loc_F436:
		mov	eax, [bp+var_3A]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_36]
		cmp	eax, [bp+var_3A]
		jle	short loc_F45A
		mov	ax, 1
		jmp	short loc_F45C

loc_F45A:
		xor	ax, ax

loc_F45C:
		or	al, al
		jz	short loc_F468
		mov	eax, [bp+var_3A]
		mov	[bp+var_36], eax

loc_F468:
		mov	eax, [bp+var_36]
		add	[bp+var_8], eax
		jmp	short loc_F47A

loc_F472:
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax

loc_F47A:
		lea	ax, word ptr [bp+var_C8]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+131h]
		push	large [bx+5Ah]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+131h]
		les	bx, [bx+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	word ptr [bp+var_36+2], dx
		mov	word ptr [bp+var_36], ax
		mov	[bp+var_3A], 0
		cmp	[bp+var_36], 0
		jz	short loc_F4F8
		les	bx, word ptr [bp+var_36]
		mov	ax, es:[bx+1Fh]
		mov	[bp+var_3C], ax
		movsx	eax, [bp+var_3C]
		shl	eax, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		or	eax, eax
		jge	short loc_F4E5
		neg	eax

loc_F4E5:
		mov	[bp+var_3A], eax
		mov	al, es:[bx+1Eh]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Eh], al

loc_F4F8:
		mov	eax, [bp+var_8]
		mov	[bp+var_44], eax
		cmp	[bp+var_11], 0
		jz	short loc_F518
		mov	[bp+var_48], 4Ch
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_48]
		jmp	short loc_F528

loc_F518:
		mov	[bp+var_4C], 19h
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_4C]

loc_F528:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		sub	[bp+var_8], eax
		jmp	loc_F790

loc_F53F:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+15Eh]
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_5C]
		pop	es
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		mov	es, [bp+arg_2]
		mov	ax, es:[si+15Eh]
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_58]
		pop	es
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		mov	es, [bp+arg_2]
		mov	ax, es:[si+15Eh]
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_54]
		pop	es
		mov	es:[bx+8], eax
		cmp	[bp+var_3A], 200h
		jle	short loc_F5AD
		mov	ax, 1
		jmp	short loc_F5AF

loc_F5AD:
		xor	ax, ax

loc_F5AF:
		or	al, al
		jnz	short loc_F5B6
		jmp	loc_F6D0

loc_F5B6:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+131h]
		mov	bx, es:[bx+131h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_D4], eax
		mov	eax, [si+4]
		mov	[bp+var_D0], eax
		mov	eax, [si+8]
		mov	[bp+var_CC], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+15Eh]
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		pop	es
		mov	eax, es:[bx]
		add	eax, [bp+var_D4]
		sar	eax, 1
		mov	[bp+var_50], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		mov	es, [bp+arg_2]
		mov	ax, es:[si+15Eh]
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_50]
		pop	es
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		mov	es, [bp+arg_2]
		mov	ax, es:[si+15Eh]
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		pop	es
		mov	eax, es:[bx+4]
		add	eax, [bp+var_D0]
		sar	eax, 1
		mov	[bp+var_50], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		mov	es, [bp+arg_2]
		mov	ax, es:[si+15Eh]
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_50]
		pop	es
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		mov	es, [bp+arg_2]
		mov	ax, es:[si+15Eh]
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		pop	es
		mov	eax, es:[bx+8]
		add	eax, [bp+var_CC]
		sar	eax, 1
		mov	[bp+var_50], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		mov	es, [bp+arg_2]
		mov	ax, es:[si+15Eh]
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_50]
		pop	es
		mov	es:[bx+8], eax
		jmp	loc_F778

loc_F6D0:
		mov	eax, [bp+var_68]
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_CC], eax
		push	1
		lea	ax, word ptr [bp+var_D4]
		push	ax
		call	Vec_NegateSwapPair
		add	sp, 4
		mov	[bp+var_CC], 0
		lea	ax, word ptr [bp+var_D4]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+15Eh]
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_D4]
		pop	es
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		mov	es, [bp+arg_2]
		mov	ax, es:[si+15Eh]
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, [bp+var_D0]
		pop	es
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		push	es
		mov	es, [bp+arg_2]
		mov	ax, es:[si+15Eh]
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		pop	es
		mov	dword ptr es:[bx+8], 0

loc_F778:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+15Eh]
		inc	ax
		and	ax, 1Fh
		mov	es:[bx+15Eh], ax
		sub	dword ptr es:[bx+15Ah], 20h

loc_F790:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+15Ah], 20h
		jl	short loc_F79F
		jmp	loc_F53F

loc_F79F:
		mov	eax, dword_7976E
		add	es:[bx+15Ah], eax
		les	bx, es:[bx+156h]
		mov	eax, es:[bx]
		mov	[bp+var_A4], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_A0], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_9C], eax
		mov	eax, es:[bx+180h]
		mov	[bp+var_C8], eax
		mov	eax, es:[bx+184h]
		mov	[bp+var_C4], eax
		mov	eax, es:[bx+188h]
		mov	[bp+var_C0], eax
		mov	cx, 1
		jmp	loc_F890

loc_F7F2:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	ax, cx
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx]
		add	[bp+var_A4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	ax, cx
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+4]
		add	[bp+var_A0], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	ax, cx
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+8]
		add	[bp+var_9C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	ax, cx
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx]
		add	[bp+var_C8], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	ax, cx
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+4]
		add	[bp+var_C4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+156h]
		mov	ax, cx
		add	ax, 20h
		imul	ax, ax, 0Ch
		add	bx, ax
		mov	eax, es:[bx+8]
		add	[bp+var_C0], eax
		inc	cx

loc_F890:
		cmp	cx, 20h
		jge	short loc_F898
		jmp	loc_F7F2

loc_F898:
		mov	eax, [bp+var_A4]
		sar	eax, 5
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A0]
		sar	eax, 5
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_9C]
		sar	eax, 5
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_C8]
		sar	eax, 5
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_C4]
		sar	eax, 5
		mov	[bp+var_C4], eax
		mov	eax, [bp+var_C0]
		sar	eax, 5
		mov	[bp+var_C0], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+131h]
		mov	bx, es:[bx+131h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_BC], eax
		mov	eax, [si+4]
		mov	[bp+var_B8], eax
		mov	eax, [si+8]
		mov	[bp+var_B4], eax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	eax, [bp+var_A4]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A0]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_9C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_A4]
		sub	[bp+var_80], eax
		mov	eax, [bp+var_A0]
		sub	[bp+var_7C], eax
		mov	eax, [bp+var_9C]
		sub	[bp+var_78], eax
		lea	ax, word ptr [bp+var_80]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_80]
		mov	edx, [bp+var_44]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_80], eax
		mov	eax, [bp+var_7C]
		mov	edx, [bp+var_44]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_44]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_80]
		add	[bp+var_A4], eax
		mov	eax, [bp+var_7C]
		add	[bp+var_A0], eax
		mov	eax, [bp+var_78]
		add	[bp+var_9C], eax
		mov	eax, [bp+var_A4]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A0]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_9C]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9C], eax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		lea	ax, word ptr [bp+var_A4]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+54h]
		add	sp, 4
		push	35BCh
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx+64h]
		add	sp, 4

loc_FA78:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_F02F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FA7E		proc far

var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+161h], 0
		jnz	short loc_FAA2
		mov	bx, es:[bx+0D4h]
		mov	al, [bx+5Eh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_FAA7

loc_FAA2:
		mov	ax, 1
		jmp	short loc_FAA9

loc_FAA7:
		xor	ax, ax

loc_FAA9:
		mov	[bp+var_2], al
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+131h], 0
		jnz	short loc_FABA
		jmp	loc_FB40

loc_FABA:
		mov	bx, es:[bx+131h]
		push	word ptr [bx+52h]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+131h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	si, ax
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_FAF7
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 131h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6

loc_FAF7:
		cmp	[bp+var_2], 0
		jz	short loc_FB40
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+165h], 0
		jz	short loc_FB40
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_FB40
		mov	bx, [si]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_FB40
		mov	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+1EFh], 0
		jnz	short loc_FB40
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_F02F
		add	sp, 4
		mov	[bp+var_1], al

loc_FB40:
		cmp	[bp+var_1], 0
		jz	short loc_FB5D
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jnz	short loc_FB5D
		push	[bp+arg_2]
		push	bx
		call	sub_D2AC
		add	sp, 4

loc_FB5D:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+161h], 0
		jz	short loc_FB95
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_FB95
		cmp	dword ptr es:[bx+156h], 0
		jz	short loc_FB88
		push	large es:[bx+156h]
		call	sub_3C0
		add	sp, 4

loc_FB88:
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+156h], 0

loc_FB95:
		les	bx, [bp+arg_0]
		mov	al, [bp+var_1]
		mov	es:[bx+161h], al
		cmp	[bp+var_2], 0
		jz	short loc_FBAE
		mov	bx, es:[bx+0D4h]
		mov	[bx+5Eh], al

loc_FBAE:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_FA7E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FBB4		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_FBD3
		push	large 0Ch
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_FBDF

loc_FBD3:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 8
sub_FBB4		endp

; START OF FUNCTION CHUNK FOR sub_FBB4

loc_FBDF:
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_FBB4
seg024		ends
