ovr285		segment	para public 'OVERLAY' use16
		assume cs:ovr285
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A7320		proc far

var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= word ptr -5Ah
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		push	word_79788
		call	Terrain_TestAdjacentVisibility
		add	sp, 4
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_A7346
		jmp	loc_A76EA

loc_A7346:
		mov	al, byte_7CAFD
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A7352
		jmp	loc_A76EA

loc_A7352:
		mov	al, [bp+arg_8]
		mov	ah, 0
		mov	[bp+var_4E], ax
		mov	cx, 6
		mov	bx, offset word_A76ED

loc_A7360:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4E]
		jz	short loc_A7370
		add	bx, 2
		loop	short loc_A7360
		jmp	loc_A76EA

loc_A7370:
		jmp	word ptr cs:[bx+0Ch] ; switch jump

loc_A7374:
		mov	[bp+var_4], 11h
		mov	[bp+var_8], 1DCh
		mov	eax, [bp+var_8]
		mov	edx, [bp+arg_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	[bp+var_5E], 0
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	ax, word_77BF2
		mov	dx, word_7CC9C
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		mov	al, byte_77B8B
		mov	ah, 0
		imul	ax, ax, 5Ah
		mov	dx, [bp+var_E]
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	[bp+var_12], dx
		mov	[bp+var_14], bx
		mov	eax, [si]
		add	eax, [bp+arg_4]
		mov	[bp+var_66], eax
		mov	eax, [si+4]
		add	eax, [bp+var_8]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	es, [bp+var_12]
		mov	es:[bx+11h], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	es:[bx+15h], eax
		push	1
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_20]
		mov	[bp+var_C], eax
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	eax, [bp+var_C]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		les	bx, [bp+var_14]
		mov	es:[bx+19h], eax
		mov	eax, es:[bx+11h]
		mov	es:[bx], eax
		mov	eax, es:[bx+15h]
		mov	es:[bx+4], eax
		mov	eax, es:[bx+19h]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+1Dh], 0FFh
		add	[bp+var_14], 1Eh
		mov	eax, [si]
		add	eax, [bp+arg_4]
		mov	[bp+var_66], eax
		mov	eax, [si+4]
		sub	eax, [bp+arg_4]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		les	bx, [bp+var_14]
		mov	es:[bx+11h], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	es:[bx+15h], eax
		push	1
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_30]
		mov	[bp+var_C], eax
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	eax, [bp+var_C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		les	bx, [bp+var_14]
		mov	es:[bx+19h], eax
		mov	eax, es:[bx+11h]
		mov	es:[bx], eax
		mov	eax, es:[bx+15h]
		mov	es:[bx+4], eax
		mov	eax, es:[bx+19h]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+1Dh], 0FFh
		add	[bp+var_14], 1Eh
		mov	eax, [si]
		sub	eax, [bp+var_8]
		mov	[bp+var_66], eax
		mov	eax, [si+4]
		sub	eax, [bp+arg_4]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		les	bx, [bp+var_14]
		mov	es:[bx+11h], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	es:[bx+15h], eax
		push	1
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_40]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_40]
		mov	[bp+var_C], eax
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	eax, [bp+var_C]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		les	bx, [bp+var_14]
		mov	es:[bx+19h], eax
		mov	eax, es:[bx+11h]
		mov	es:[bx], eax
		mov	eax, es:[bx+15h]
		mov	es:[bx+4], eax
		mov	eax, es:[bx+19h]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+1Dh], 0FFh
		mov	al, byte_77B8B
		mov	ah, 0
		mov	bx, ax
		mov	byte ptr [bx+6578h], 5
		mov	ax, word_77BF2
		mov	dx, word_7CC9A
		mov	[bp+var_46], ax
		mov	[bp+var_48], dx
		mov	al, byte_77B8B
		mov	ah, 0
		imul	ax, ax, 26h
		mov	dx, [bp+var_46]
		mov	bx, [bp+var_48]
		add	bx, ax
		mov	[bp+var_4A], dx
		mov	[bp+var_4C], bx
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		les	bx, [bp+var_4C]
		mov	word ptr es:[bx+18h], 2
		mov	word ptr es:[bx+1Ah], 1
		mov	word ptr es:[bx+1Ch], 3Fh
		mov	word ptr es:[bx+1Eh], 1
		mov	word ptr es:[bx+20h], 3Fh
		mov	word ptr es:[bx+22h], 3Eh
		mov	bx, [bp+var_4]
		cmp	bx, word_7CC8E
		jnb	short loc_A768A
		mov	ax, bx
		imul	ax, ax, 0Eh
		mov	edx, dword_7CC94
		push	ax
		mov	ax, word_7CC92
		pop	bx
		add	ax, bx
		jmp	short loc_A76AB

loc_A768A:
		sub	bx, word_7CC8E
		cmp	bx, word_7CC90
		jnb	short loc_A76A7
		mov	ax, bx
		imul	ax, ax, 18h
		mov	edx, dword_7CC98
		push	ax
		mov	ax, word_7CC96
		pop	bx
		add	ax, bx
		jmp	short loc_A76AB

loc_A76A7:
		xor	dx, dx
		xor	ax, ax

loc_A76AB:
		les	bx, [bp+var_4C]
		mov	es:[bx+16h], dx
		mov	es:[bx+14h], ax
		les	bx, es:[bx+14h]
		mov	eax, es:[bx]
		les	bx, [bp+var_4C]
		mov	es:[bx+14h], eax
		mov	byte ptr es:[bx+24h], 0
		mov	byte ptr es:[bx+25h], 2
		mov	al, byte_77B8B
		inc	al
		mov	byte_77B8B, al
		cmp	al, 13h
		jbe	short loc_A76E1
		mov	byte_77B8B, 0

loc_A76E1:
		mov	dword_77BF0, 0

loc_A76EA:
		pop	si
		leave
		retf
sub_A7320		endp

; START OF FUNCTION CHUNK FOR sub_A7320
word_A76ED	dw 1
		dw 2
		dw 4
		dw 8
		dw 10h
		dw 20h
off_A76F9	dw offset loc_A7374
		dw offset loc_A7374
		dw offset loc_A7374
		dw offset loc_A7374
		dw offset loc_A7374
		dw offset loc_A7374
; END OF FUNCTION CHUNK FOR sub_A7320
ovr285		ends
