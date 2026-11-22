seg110		segment	para public 'CODE' use16
		assume cs:seg110
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44981		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 19h
		pop	bp
		retf
sub_44981		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4498B		proc far

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
		jnz	short loc_449BD
		push	1
		push	0
		push	2
		push	large 73h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_449BD
		jmp	loc_44A81

loc_449BD:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 16A8h
		xor	eax, eax
		mov	es:[bx+3Ah], eax
		mov	es:[bx+36h], eax
		mov	es:[bx+3Eh], al
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_741CA
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1F1Ch
		mov	word ptr es:[bx+49h], 0
		mov	word ptr es:[bx], 1EC4h
		mov	byte ptr es:[bx+4Bh], 0
		mov	word ptr es:[bx], 1EDCh
		mov	word ptr es:[bx], 1DC4h
		mov	word ptr es:[bx], 2A02h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6Eh
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_745A5
		add	sp, 6
		push	0
		push	large 50525452h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_44A70
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Ch], ax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Eh], eax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0
		jmp	short loc_44A79

loc_44A70:
		push	0C020h
		call	sub_1DDFE
		pop	cx

loc_44A79:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+4Bh], 1

loc_44A81:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_4498B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44A8A		proc far

var_54		= dword ptr -54h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
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
		sub	sp, 4Eh
		push	si
		mov	si, [bp+arg_4]
		push	8
		push	ds
		push	offset aTERRAIN
		mov	bx, [bp+arg_6]
		push	large [bx+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_44AB2
		mov	ax, 1
		jmp	short loc_44AB4

loc_44AB2:
		xor	ax, ax

loc_44AB4:
		or	al, al
		jnz	short loc_44ABB
		jmp	loc_44C22

loc_44ABB:
		push	0
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_36], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_32], eax
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+var_2E], eax
		lea	ax, word ptr [bp+var_36]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		call	sub_3677E
		add	sp, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44B0E
		mov	al, 1
		jmp	loc_44C24

loc_44B0E:
		push	0
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_42], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_3E], eax
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	[bp+var_3A], eax
		lea	ax, word ptr [bp+var_42]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		call	sub_3677E
		add	sp, 8
		or	al, al
		jnz	short loc_44B5D
		jmp	loc_44BEA

loc_44B5D:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+1Fh], 0FFFFh
		jnz	short loc_44B6A
		jmp	loc_44BEA

loc_44B6A:
		mov	eax, [si+12h]
		mov	bx, word_7CEF9
		sub	eax, [bx+14h]
		mov	[bp+var_4E], eax
		mov	eax, [si+16h]
		sub	eax, [bx+18h]
		mov	[bp+var_4A], eax
		mov	eax, [si+1Ah]
		sub	eax, [bx+1Ch]
		mov	[bp+var_46], eax
		push	eax
		push	large [bp+var_4A]
		push	large [bp+var_4E]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		sar	eax, 8
		mov	[bp+var_22], eax
		push	0
		push	eax
		push	10h
		call	sub_5EB62
		add	sp, 8
		sub	sp, 4
		mov	[bp+var_54], 0
		mov	ax, si
		add	ax, 12h
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Fh]
		push	word_79797
		call	sub_4D5AB
		add	sp, 0Ah

loc_44BEA:
		mov	byte ptr [si+64h], 1
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6Ch]
		mov	[bp+var_1A], ax
		movsx	eax, [bp+var_1A]
		shl	eax, 8
		mov	[bp+var_1E], eax
		lea	ax, word ptr [bp+var_1E]
		push	ax
		mov	ax, si
		add	ax, 5Fh
		push	ax
		call	Timer_SetAbsolute_50699
		add	sp, 4
		push	si
		call	SmokeTrail_EnableIfModelHasSmok_3BD75
		pop	cx
		mov	al, 0
		jmp	short loc_44C24

loc_44C22:
		mov	al, 1

loc_44C24:
		pop	si
		leave
		retf
sub_44A8A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44C27		proc far

var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	large [bp+arg_0]
		push	0
		nop
		push	cs
		call	near ptr sub_44C71
		add	sp, 6
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_2], ax
		mov	[si+52h], ax
		mov	ax, si
		pop	si
		leave
		retf
sub_44C27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44C6A		proc far
		push	bp
		mov	bp, sp
		mov	al, 1Ah
		pop	bp
		retf
sub_44C6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44C71		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_44C8D
		push	65h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_44CE3

loc_44C8D:
		push	si
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si+52h], 0
		mov	word ptr [si], 2058h
		push	si
		call	sub_3C494
		pop	cx
		mov	word ptr [si], 23F6h
		mov	word ptr [si+5Ah], 0
		mov	word ptr [si+5Ch], 0
		mov	byte ptr [si+5Eh], 1
		or	byte ptr [si+2], 20h
		mov	word ptr [si], 248Ah
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+5Fh], eax
		mov	word ptr [si], 296Eh
		push	large [bp+arg_2]
		push	si
		call	sub_745B4
		add	sp, 6
		mov	byte ptr [si+64h], 0

loc_44CE3:
		mov	ax, si
		pop	si
		leave
		retf
sub_44C71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44CE8		proc far

var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+64h], 0
		jnz	short loc_44CFB
		jmp	loc_44DE4

loc_44CFB:
		push	si
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_20], eax
		push	0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_34], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_30], eax
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_10]
		mov	[bp+var_2C], eax
		lea	ax, word ptr [bp+var_34]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		call	sub_3677E
		add	sp, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44D6C
		mov	al, 0
		jmp	loc_44E3C

loc_44D6C:
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	[si+1Ah], eax
		mov	ax, si
		add	ax, 5Fh
		push	ax
		call	Timer_Tick_506DD
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44D93
		mov	al, 0
		jmp	loc_44E3C

loc_44D93:
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 6Eh
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		lea	ax, [bp+var_28]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 4
		push	si
		call	sub_3C21D
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44DDB
		mov	al, 0
		jmp	short loc_44E3C

loc_44DDB:
		push	si
		call	sub_3FEC1
		pop	cx
		jmp	short loc_44E3A

loc_44DE4:
		cmp	byte ptr [si+5Eh], 0
		jz	short loc_44DF0
		mov	byte ptr [si+5Eh], 0
		jmp	short loc_44E3A

loc_44DF0:
		mov	ax, si
		add	ax, 5Fh
		push	ax
		call	Timer_Tick_506DD
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44E08
		or	byte ptr [si+2], 2
		jmp	short loc_44E0C

loc_44E08:
		and	byte ptr [si+2], 0FDh

loc_44E0C:
		cmp	dword ptr [si+1Ah], 0
		jg	short loc_44E18
		mov	ax, 1
		jmp	short loc_44E1A

loc_44E18:
		xor	ax, ax

loc_44E1A:
		or	al, al
		jz	short loc_44E29
		mov	byte ptr [si+64h], 1
		push	si
		call	SmokeTrail_EnableIfModelHasSmok_3BD75
		pop	cx

loc_44E29:
		push	si
		call	sub_3C21D
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44E3A
		mov	al, 0
		jmp	short loc_44E3C

loc_44E3A:
		mov	al, 1

loc_44E3C:
		pop	si
		leave
		retf
sub_44CE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44E3F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1Ah
		pop	bp
		retf
sub_44E3F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44E49		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_44E74
		push	0
		push	si
		call	sub_3FE92
		add	sp, 4
		test	di, 1
		jz	short loc_44E72
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_44E74

loc_44E72:
		jmp	short loc_44E74

loc_44E74:
		pop	di
		pop	si
		pop	bp
		retf
sub_44E49		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44E78		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_44EBC
		push	0
		push	large [bp+arg_0]
		call	sub_3FC93
		add	sp, 6
		test	si, 1
		jz	short loc_44EBA
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
sub_44E78		endp
seg110		ends
