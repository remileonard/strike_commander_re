seg120		segment	para public 'CODE' use16
		assume cs:seg120
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 67h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_503A3		proc far

var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
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
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 72h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 0Fh
		jnz	short loc_503C2
		mov	al, 0
		jmp	loc_5057B

loc_503C2:
		les	bx, word ptr [bp+arg_2]
		cmp	es:[bx+19h], si
		jnz	short loc_503D0
		mov	al, 0
		jmp	loc_5057B

loc_503D0:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_8], dx
		mov	[bp+var_A], ax
		les	bx, [bp+var_A]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	bx, [bp+var_E]
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		push	large [bp+arg_2]
		call	sub_50324
		add	sp, 4
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_36], eax
		mov	eax, [di+4]
		mov	[bp+var_32], eax
		mov	eax, [di+8]
		mov	[bp+var_2E], eax
		push	eax
		push	large [bp+var_32]
		push	large [bp+var_36]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		sar	eax, 8
		mov	[bp+var_1A], eax
		shl	eax, 8
		add	[bp+var_6], eax
		mov	di, si
		add	di, 12h
		mov	ax, word ptr [bp+arg_2+2]
		mov	dx, word ptr [bp+arg_2]
		add	dx, 5
		mov	[bp+var_1C], ax
		mov	[bp+var_1E], dx
		les	dx, [bp+var_1E]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_4E], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_4A], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_46], eax
		push	large [bp+arg_2]
		call	sub_50324
		add	sp, 4
		mov	dx, ax
		mov	bx, dx
		mov	eax, [bp+var_4E]
		sub	eax, [bx]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		sub	eax, [bx+4]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_46]
		sub	eax, [bx+8]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_5E], eax
		mov	eax, [di]
		sub	eax, [bp+var_66]
		mov	[bp+var_72], eax
		mov	eax, [di+4]
		sub	eax, [bp+var_62]
		mov	[bp+var_6E], eax
		mov	eax, [di+8]
		sub	eax, [bp+var_5E]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_3A], eax
		push	eax
		push	large [bp+var_3E]
		push	large [bp+var_42]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_22], eax
		sar	eax, 8
		mov	[bp+var_2A], eax
		shl	eax, 8
		cmp	eax, [bp+var_6]
		jge	short loc_5053C
		mov	ax, 1
		jmp	short loc_5053E

loc_5053C:
		xor	ax, ax

loc_5053E:
		or	al, al
		jz	short loc_50579
		push	large [bp+arg_2]
		sub	sp, 0Ch
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_86], eax
		mov	eax, [di+4]
		mov	[bp+var_82], eax
		mov	eax, [di+8]
		mov	[bp+var_7E], eax
		push	si
		nop
		push	cs
		call	sub_5057F
		add	sp, 12h
		mov	[bp+var_2], al
		or	al, al
		jz	short loc_50579
		jmp	short loc_5057B

loc_50579:
		mov	al, 0

loc_5057B:
		pop	di
		pop	si
		leave
		retf
sub_503A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5057F		proc near

var_34		= word ptr -34h
var_32		= dword ptr -32h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_2		= word ptr  6
arg_10		= dword ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		mov	si, [bp+arg_2]
		mov	[bp+var_34], 16D5h
		mov	[bp+var_32], 0
		mov	[bp+var_34], 16E9h
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		les	bx, [bp+var_E]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_505BF
		mov	al, 23h
		jmp	loc_50696

loc_505BF:
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		cmp	word ptr es:[bx+14h], 0
		jnz	short loc_505D6
		mov	al, 23h
		jmp	loc_50696

loc_505D6:
		mov	[bp+var_F], 0FFh
		mov	eax, [bp+var_4]
		mov	[bp+var_14], eax
		mov	[bp+var_18], 0
		jmp	loc_5068A
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+6]
		mov	ah, 0
		mov	dx, seg seg227
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+120h]
		mov	[bp+var_A], al
		mov	al, [bp+var_F]
		cmp	al, [bp+var_A]
		jnz	short loc_50663
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_1A], ax
		mov	ax, si
		add	ax, 12h
		mov	[bp+var_1C], ax
		push	large [bp+arg_10]
		push	ax
		push	[bp+var_1A]
		push	large [bp+var_4]
		call	sub_38028
		add	sp, 0Ch
		or	al, al
		jz	short loc_50663
		cmp	[bp+var_F], 0FFh
		jz	short loc_50646
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+6]
		jmp	short loc_50696

loc_50646:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+6]
		mov	[bp+var_F], al
		mov	eax, es:[bx+2]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		jmp	short loc_5068A

loc_50663:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_5068A
		mov	eax, [bp+var_18]
		mov	[bp+var_4], eax
		mov	[bp+var_18], 0
		mov	[bp+var_F], 0FFh

loc_5068A:
		cmp	[bp+var_4], 0
sub_5057F		endp

; START OF FUNCTION CHUNK FOR sub_5057F
		db 74h
; END OF FUNCTION CHUNK FOR sub_5057F
seg120		ends
