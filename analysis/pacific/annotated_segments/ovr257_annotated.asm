ovr257		segment	para public 'OVERLAY' use16
		assume cs:ovr257
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_97C10		proc far

var_192		= dword ptr -192h
var_18A		= dword ptr -18Ah
var_186		= dword ptr -186h
var_182		= dword ptr -182h
var_17E		= word ptr -17Eh
var_157		= word ptr -157h
var_148		= word ptr -148h
var_12E		= byte ptr -12Eh
var_10A		= word ptr -10Ah
var_E3		= word ptr -0E3h
var_D4		= word ptr -0D4h
var_BA		= byte ptr -0BAh
var_96		= word ptr -96h
var_76		= dword ptr -76h
var_72		= byte ptr -72h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= byte ptr -60h
var_5E		= byte ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= dword ptr -5Ah
var_56		= byte ptr -56h
var_54		= word ptr -54h
var_52		= dword ptr -52h
var_4E		= byte ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= dword ptr -4Ah
var_46		= byte ptr -46h
var_44		= word ptr -44h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= byte ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, word_7CADA
		mov	[bp+var_2], ax
		mov	[bp+var_A], 0
		mov	[bp+var_C], 0
		mov	bx, [bp+var_2]
		mov	di, [bx+52h]
		mov	[bp+var_F], 0
		mov	al, [di+20h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_10], al
		mov	[bp+var_14], 0FFFFh
		cmp	byte_77699, 0
		jz	short loc_97C55
		jmp	loc_98926

loc_97C55:
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		mov	[bp+var_16], 0FFh
		cmp	[bp+var_D4], 0
		jnz	short loc_97C93
		mov	[bp+var_BA], 0
		jmp	short loc_97C93

loc_97C93:
		cmp	[bp+var_148], 0
		jnz	short loc_97CA1
		mov	[bp+var_12E], 0
		jmp	short loc_97CA1

loc_97CA1:
		mov	word_79218, 0C0h
		mov	word_7921A, 0C0h
		mov	word_7921C, 9
		mov	word_7921E, 0Bh
		mov	word_79220, 0Eh
		mov	word_79222, 1Ch
		mov	bx, [bp+var_2]
		les	bx, [bx+63h]
		cmp	byte ptr es:[bx+48h], 0
		jz	short loc_97CD7
		mov	ax, 1
		jmp	short loc_97CD9

loc_97CD7:
		xor	ax, ax

loc_97CD9:
		or	al, al
		jz	short loc_97D1A
		sub	sp, 4
		mov	[bp+var_192], 200h
		push	ds
		push	offset aNoResponse
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74CA8
		add	sp, 4
		jmp	loc_98926

loc_97D1A:
		push	large 2Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_97D74
		push	large 0B0082h
		push	large 28005Ah
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 0C9Ah
		mov	dword ptr [di+24h], 0
		push	ds
		push	offset aSelectFrequency
		push	di
		call	sub_74B18
		add	sp, 6
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+20h], 0
		mov	ax, word_7921A
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	word ptr [di+22h], 0FFFFh
		mov	ax, di
		jmp	short loc_97D76

loc_97D74:
		mov	ax, di

loc_97D76:
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	word ptr [si], 0
		mov	[bp+var_18], 0
		jmp	loc_97FB0

loc_97D90:
		mov	di, [bp+var_C]
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_97DA6
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_97DA8

loc_97DA6:
		mov	al, 1Ch

loc_97DA8:
		mov	[bp+var_E], al
		mov	[bp+var_6], 0
		test	byte ptr [di+2], 10h
		jnz	short loc_97DBC
		jmp	loc_97E55

loc_97DBC:
		mov	al, [di+51h]
		mov	bx, word_7CADA
		cmp	al, [bx+51h]
		jz	short loc_97DCB
		jmp	loc_97E55

loc_97DCB:
		cmp	[bp+var_E], 6
		jnz	short loc_97E1E
		cmp	di, word_7CADA
		jnz	short loc_97DE1
		mov	[bp+var_6], 0
		jmp	short loc_97E55

loc_97DE1:
		mov	[bp+var_1C], 0
		cmp	dword ptr [di+5Ah], 0
		jz	short loc_97E01
		mov	ax, [di+5Ch]
		mov	dx, [di+5Ah]
		add	dx, 1Ah
		mov	word ptr [bp+var_1C+2], ax
		mov	word ptr [bp+var_1C], dx
		jmp	short loc_97E01

loc_97E01:
		mov	ax, word ptr [bp+var_1C+2]
		mov	dx, word ptr [bp+var_1C]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		cmp	[bp+var_A], 0
		jnz	short loc_97E55
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		jmp	short loc_97E55

loc_97E1E:
		cmp	[bp+var_E], 15h
		jnz	short loc_97E31
		mov	ax, di
		add	ax, 52h
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], ax
		jmp	short loc_97E55

loc_97E31:
		cmp	[bp+var_E], 17h
		jnz	short loc_97E44
		mov	ax, di
		add	ax, 6Eh
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], ax
		jmp	short loc_97E55

loc_97E44:
		cmp	[bp+var_E], 18h
		jnz	short loc_97E55
		mov	ax, di
		add	ax, 6Eh
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], ax

loc_97E55:
		cmp	[bp+var_6], 0
		jnz	short loc_97E5F
		jmp	loc_97FAB

loc_97E5F:
		les	bx, word ptr [bp+var_6]
		cmp	word ptr es:[bx+88h], 0
		jnz	short loc_97E6D
		jmp	loc_97FAB

loc_97E6D:
		cmp	[bp+var_E], 6
		jnz	short loc_97EA5
		inc	[bp+var_18]
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		push	large es:[bx+3Fh]
		mov	ax, word ptr [bp+var_6]
		add	ax, 74h
		push	word ptr [bp+var_6+2]
		push	ax
		mov	ax, [si]
		inc	ax
		push	ax
		push	0CEEh
		lea	ax, [bp+var_96]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Eh
		jmp	short loc_97EC3

loc_97EA5:
		mov	ax, word ptr [bp+var_6]
		add	ax, 74h
		push	word ptr [bp+var_6+2]
		push	ax
		mov	ax, [si]
		inc	ax
		push	ax
		push	0CFAh
		lea	ax, [bp+var_96]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah

loc_97EC3:
		push	0
		mov	ax, [si]
		imul	ax, ax, 0Bh
		add	ax, 33h
		mov	[bp+var_1E], ax
		mov	ax, [si]
		mov	[bp+var_20], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_97F48
		lea	ax, [bp+var_96]
		mov	word ptr [bp+var_24+2], ds
		mov	word ptr [bp+var_24], ax
		push	large 0B0082h
		push	[bp+var_1E]
		push	5Ah
		push	di
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 0C9Ah
		mov	dword ptr [di+24h], 0
		push	large [bp+var_24]
		push	di
		call	sub_74B18
		add	sp, 6
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+20h], 0
		mov	ax, word_7921A
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	word ptr [di+22h], 0FFFFh
		mov	word ptr [di+0Eh], 0C66h
		lea	ax, [bp+var_14]
		mov	[di+2Ch], ax
		mov	ax, [bp+var_20]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_97F4A

loc_97F48:
		mov	ax, di

loc_97F4A:
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	[bp+var_E3]
		mov	ax, [si]
		add	ax, 2
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74C76
		add	sp, 6
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		add	dx, 74h
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		mov	eax, [bp+var_6]
		mov	[bp+var_2C], eax
		mov	bx, [si]
		shl	bx, 2
		mov	ax, [bp+var_26]
		mov	[bx+si+4], ax
		mov	[bx+si+2], dx
		mov	bx, [si]
		mov	byte ptr [bx+si+2Ah], 0FFh
		shl	bx, 2
		mov	ax, word ptr [bp+var_2C+2]
		mov	dx, word ptr [bp+var_2C]
		mov	[bx+si+36h], ax
		mov	[bx+si+34h], dx
		inc	word ptr [si]

loc_97FAB:
		cmp	word ptr [si], 7
		jg	short loc_97FC6

loc_97FB0:
		lea	ax, [bp+var_C]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_97FC6
		jmp	loc_97D90

loc_97FC6:
		cmp	[bp+var_18], 1
		jg	short loc_97FCF
		jmp	loc_98071

loc_97FCF:
		push	0
		mov	ax, [si]
		imul	ax, ax, 0Bh
		add	ax, 33h
		mov	[bp+var_2E], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9804C
		mov	word ptr [bp+var_32+2], ds
		mov	word ptr [bp+var_32], 0D02h
		push	large 0B0082h
		push	[bp+var_2E]
		push	5Ah
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 0C9Ah
		mov	dword ptr [di+24h], 0
		push	large [bp+var_32]
		push	di
		call	sub_74B18
		add	sp, 6
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+20h], 0
		mov	ax, word_7921A
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	word ptr [di+22h], 0FFFFh
		mov	word ptr [di+0Eh], 0C66h
		lea	ax, [bp+var_14]
		mov	[di+2Ch], ax
		mov	word ptr [di+2Eh], 29Ch
		mov	ax, di
		jmp	short loc_9804E

loc_9804C:
		mov	ax, di

loc_9804E:
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	[bp+var_E3]
		push	1Fh
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74C76
		add	sp, 6
		inc	word ptr [si]

loc_98071:
		push	0
		mov	ax, [si]
		imul	ax, ax, 0Bh
		add	ax, 33h
		mov	[bp+var_34], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_980EE
		mov	word ptr [bp+var_38+2], ds
		mov	word ptr [bp+var_38], 0D15h
		push	large 0B0082h
		push	[bp+var_34]
		push	5Ah
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 0C9Ah
		mov	dword ptr [di+24h], 0
		push	large [bp+var_38]
		push	di
		call	sub_74B18
		add	sp, 6
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+20h], 0
		mov	ax, word_7921A
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	word ptr [di+22h], 0FFFFh
		mov	word ptr [di+0Eh], 0C66h
		lea	ax, [bp+var_14]
		mov	[di+2Ch], ax
		mov	word ptr [di+2Eh], 29Ah
		mov	ax, di
		jmp	short loc_980F0

loc_980EE:
		mov	ax, di

loc_980F0:
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	[bp+var_E3]
		push	1
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74C76
		add	sp, 6
		inc	word ptr [si]
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74AD7
		pop	cx
		nop
		push	cs
		call	near ptr sub_98956
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74ADC
		pop	cx
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74CC6
		pop	cx
		jmp	short loc_9814A

loc_9813B:
		push	0
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74CE4
		add	sp, 4

loc_9814A:
		cmp	[bp+var_14], 0FFFFh
		jz	short loc_9813B
		mov	bx, [bp+var_14]
		shl	bx, 2
		mov	ax, [bx+si+36h]
		mov	dx, [bx+si+34h]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74CEE
		pop	cx
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74AD7
		pop	cx
		nop
		push	cs
		call	near ptr sub_989AE
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74ADC
		pop	cx
		cmp	[bp+var_14], 29Ah
		jnz	short loc_98192
		jmp	loc_988D8

loc_98192:
		cmp	[bp+var_14], 29Ch
		jnz	short loc_981AC
		cmp	[bp+var_A], 0
		jz	short loc_981AC
		mov	[bp+var_F], 1
		mov	eax, [bp+var_A]
		mov	[bp+var_6], eax

loc_981AC:
		mov	word ptr [si], 0
		mov	[bp+var_12], 0
		jmp	loc_9859E

loc_981B8:
		push	[bp+var_12]
		push	large [bp+var_6]
		call	Radio_GetOptionLetterByIndex_1B70B
		add	sp, 6
		mov	[bp+var_60], al
		cbw
		sub	ax, 64h
		mov	bx, ax
		cmp	bx, 0Ah
		jbe	short loc_981D8
		jmp	loc_9846C

loc_981D8:
		shl	bx, 1
		jmp	cs:off_98940[bx]	; switch jump

loc_981DF:
		mov	al, [bp+var_10]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	dl, al
		jmp	loc_9846E

loc_981EE:
		mov	di, word_7CADA
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_18A], eax
		mov	eax, [di+4]
		mov	[bp+var_186], eax
		mov	eax, [di+8]
		mov	[bp+var_182], eax
		les	bx, word ptr [bp+var_6]
		mov	di, es:[bx+0Dh]
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_18A], eax
		mov	eax, [di+4]
		sub	[bp+var_186], eax
		mov	eax, [di+8]
		sub	[bp+var_182], eax
		push	large [bp+var_182]
		push	large [bp+var_186]
		push	large [bp+var_18A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_68], eax
		mov	[bp+var_64], eax
		cmp	[bp+var_10], 0
		jz	short loc_9827A
		mov	[bp+var_6C], 138800h
		cmp	eax, [bp+var_6C]
		jge	short loc_9826F
		mov	ax, 1
		jmp	short loc_98271

loc_9826F:
		xor	ax, ax

loc_98271:
		or	al, al
		jz	short loc_9827A
		mov	ax, 1
		jmp	short loc_9827C

loc_9827A:
		xor	ax, ax

loc_9827C:
		mov	dl, al
		jmp	loc_9846E

loc_98281:
		mov	di, word_7CADA
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_18A], eax
		mov	eax, [di+4]
		mov	[bp+var_186], eax
		mov	eax, [di+8]
		mov	[bp+var_182], eax
		les	bx, word ptr [bp+var_6]
		mov	di, es:[bx+0Dh]
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_18A], eax
		mov	eax, [di+4]
		sub	[bp+var_186], eax
		mov	eax, [di+8]
		sub	[bp+var_182], eax
		push	large [bp+var_182]
		push	large [bp+var_186]
		push	large [bp+var_18A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_68], eax
		mov	[bp+var_64], eax
		cmp	[bp+var_10], 0
		jz	short loc_9830D
		mov	[bp+var_6C], 138800h
		cmp	eax, [bp+var_6C]
		jge	short loc_98302
		mov	ax, 1
		jmp	short loc_98304

loc_98302:
		xor	ax, ax

loc_98304:
		or	al, al
		jz	short loc_9830D
		mov	ax, 1
		jmp	short loc_9830F

loc_9830D:
		xor	ax, ax

loc_9830F:
		mov	dl, al
		jmp	loc_9846E

loc_98314:
		cmp	[bp+var_F], 0
		jz	short loc_9831F
		mov	dl, 1
		jmp	loc_9846E

loc_9831F:
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_98346
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx+0Dh]
		les	bx, [bx+5Ah]
		mov	dl, es:[bx+165h]
		jmp	loc_9846E

loc_98346:
		mov	dl, 0
		jmp	loc_9846E

loc_9834B:
		cmp	[bp+var_F], 0
		jz	short loc_98356
		mov	dl, 1
		jmp	loc_9846E

loc_98356:
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_98386
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx+0Dh]
		les	bx, [bx+5Ah]
		mov	al, es:[bx+165h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	dl, al
		jmp	loc_9846E

loc_98386:
		mov	dl, 0
		jmp	loc_9846E

loc_9838B:
		cmp	word_7CAE2, 0
		jz	short loc_98397
		mov	dl, 1
		jmp	loc_9846E

loc_98397:
		mov	dl, 0
		jmp	loc_9846E

loc_9839C:
		mov	bx, word_7CADA
		les	bx, [bx+5Fh]
		cmp	word ptr es:[bx+0Eh], 0
		jz	short loc_983AF
		mov	ax, 1
		jmp	short loc_983B1

loc_983AF:
		xor	ax, ax

loc_983B1:
		mov	dl, al
		jmp	loc_9846E

loc_983B6:
		cmp	[bp+var_F], 0
		jz	short loc_983C1
		mov	dl, 1
		jmp	loc_9846E

loc_983C1:
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_983F3
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx+0Dh]
		les	bx, [bx+5Ah]
		cmp	byte ptr es:[bx+135h], 2
		jz	short loc_983ED
		mov	ax, 1
		jmp	short loc_983EF

loc_983ED:
		xor	ax, ax

loc_983EF:
		mov	dl, al
		jmp	short loc_9846E

loc_983F3:
		mov	dl, 0
		jmp	short loc_9846E

loc_983F7:
		cmp	[bp+var_F], 0
		jz	short loc_98401
		mov	dl, 1
		jmp	short loc_9846E

loc_98401:
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_98430
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx+0Dh]
		les	bx, [bx+5Ah]
		mov	al, es:[bx+162h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	dl, al
		jmp	short loc_9846E

loc_98430:
		mov	dl, 0
		jmp	short loc_9846E

loc_98434:
		cmp	[bp+var_F], 0
		jz	short loc_9843E
		mov	dl, 1
		jmp	short loc_9846E

loc_9843E:
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+0Dh]
		mov	bx, es:[bx+0Dh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_98464
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx+0Dh]
		les	bx, [bx+5Ah]
		mov	dl, es:[bx+162h]
		jmp	short loc_9846E

loc_98464:
		mov	dl, 0
		jmp	short loc_9846E

loc_98468:
		mov	dl, 1
		jmp	short loc_9846E

loc_9846C:
		mov	dl, 0

loc_9846E:
		cmp	[bp+var_60], 0FFh
		jnz	short loc_98477
		jmp	loc_9859B

loc_98477:
		or	dl, dl
		jnz	short loc_9847E
		jmp	loc_9859B

loc_9847E:
		mov	al, [bp+var_60]
		cbw
		push	ax
		call	sub_1B728
		pop	cx
		mov	word ptr [bp+var_64+2], dx
		mov	word ptr [bp+var_64], ax
		cmp	[bp+var_64], 0
		jnz	short loc_98499
		jmp	loc_9859B

loc_98499:
		push	dx
		push	ax
		mov	ax, [si]
		inc	ax
		push	ax
		push	0D1Ch
		lea	ax, [bp+var_96]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		push	0
		mov	ax, [si]
		imul	ax, ax, 0Bh
		add	ax, 33h
		mov	word ptr [bp+var_68+2], ax
		mov	ax, [si]
		mov	word ptr [bp+var_68], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_98534
		lea	ax, [bp+var_96]
		mov	word ptr [bp+var_6C+2], ds
		mov	word ptr [bp+var_6C], ax
		push	large 0B0082h
		push	word ptr [bp+var_68+2]
		push	5Ah
		push	di
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 0C9Ah
		mov	dword ptr [di+24h], 0
		push	large [bp+var_6C]
		push	di
		call	sub_74B18
		add	sp, 6
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+20h], 0
		mov	ax, word_7921A
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	word ptr [di+22h], 0FFFFh
		mov	word ptr [di+0Eh], 0C66h
		lea	ax, [bp+var_14]
		mov	[di+2Ch], ax
		mov	ax, word ptr [bp+var_68]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_98536

loc_98534:
		mov	ax, di

loc_98536:
		push	ax
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	[bp+var_157]
		mov	ax, [si]
		add	ax, 2
		push	ax
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74C76
		add	sp, 6
		mov	eax, [bp+var_64]
		mov	[bp+var_70], eax
		mov	al, [bp+var_60]
		mov	[bp+var_72], al
		mov	eax, [bp+var_6]
		mov	[bp+var_76], eax
		mov	bx, [si]
		shl	bx, 2
		mov	ax, word ptr [bp+var_70+2]
		mov	dx, word ptr [bp+var_70]
		mov	[bx+si+4], ax
		mov	[bx+si+2], dx
		mov	bx, [si]
		mov	al, [bp+var_72]
		mov	[bx+si+2Ah], al
		shl	bx, 2
		mov	ax, word ptr [bp+var_76+2]
		mov	dx, word ptr [bp+var_76]
		mov	[bx+si+36h], ax
		mov	[bx+si+34h], dx
		inc	word ptr [si]

loc_9859B:
		inc	[bp+var_12]

loc_9859E:
		les	bx, word ptr [bp+var_6]
		mov	ax, es:[bx+88h]
		cmp	ax, [bp+var_12]
		jle	short loc_985AE
		jmp	loc_981B8

loc_985AE:
		push	0
		mov	ax, [si]
		imul	ax, ax, 0Bh
		add	ax, 33h
		mov	[bp+var_3A], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9862B
		mov	word ptr [bp+var_3E+2], ds
		mov	word ptr [bp+var_3E], 0D24h
		push	large 0B0082h
		push	[bp+var_3A]
		push	5Ah
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 0C9Ah
		mov	dword ptr [di+24h], 0
		push	large [bp+var_3E]
		push	di
		call	sub_74B18
		add	sp, 6
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+20h], 0
		mov	ax, word_7921A
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	word ptr [di+22h], 0FFFFh
		mov	word ptr [di+0Eh], 0C66h
		lea	ax, [bp+var_14]
		mov	[di+2Ch], ax
		mov	word ptr [di+2Eh], 29Ah
		mov	ax, di
		jmp	short loc_9862D

loc_9862B:
		mov	ax, di

loc_9862D:
		push	ax
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	[bp+var_157]
		push	1
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74C76
		add	sp, 6
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74AD7
		pop	cx
		nop
		push	cs
		call	near ptr sub_98956
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74ADC
		pop	cx
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74CC6
		pop	cx
		mov	[bp+var_14], 0FFFFh
		jmp	short loc_9868A

loc_9867B:
		push	0
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74CE4
		add	sp, 4

loc_9868A:
		cmp	[bp+var_14], 0FFFFh
		jz	short loc_9867B
		mov	bx, [bp+var_14]
		mov	al, [bx+si+2Ah]
		cbw
		sub	ax, 64h
		mov	bx, ax
		cmp	bx, 0Ah
		ja	short loc_986E8
		shl	bx, 1
		jmp	cs:off_9892A[bx]	; switch jump

loc_986A8:
		mov	[bp+var_16], 21h
		jmp	short loc_986E8

loc_986AE:
		mov	[bp+var_16], 1Dh
		jmp	short loc_986E8

loc_986B4:
		mov	[bp+var_16], 1Eh
		jmp	short loc_986E8

loc_986BA:
		mov	[bp+var_16], 14h
		jmp	short loc_986E8

loc_986C0:
		mov	[bp+var_16], 15h
		jmp	short loc_986E8

loc_986C6:
		mov	[bp+var_16], 18h
		jmp	short loc_986E8

loc_986CC:
		mov	[bp+var_16], 16h
		jmp	short loc_986E8

loc_986D2:
		mov	[bp+var_16], 17h
		jmp	short loc_986E8

loc_986D8:
		mov	[bp+var_16], 19h
		jmp	short loc_986E8

loc_986DE:
		mov	[bp+var_16], 1Ah
		jmp	short loc_986E8

loc_986E4:
		mov	[bp+var_16], 1Ch

loc_986E8:
		cmp	[bp+var_14], 29Ah
		jnz	short loc_986F2
		jmp	loc_988D8

loc_986F2:
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74CEE
		pop	cx
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74AD7
		pop	cx
		nop
		push	cs
		call	near ptr sub_989AE
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74ADC
		pop	cx
		call	Keyboard_DrainBufferBIOS_701E1
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		cmp	[bp+var_F], 0
		jnz	short loc_9872B
		jmp	loc_9881B

loc_9872B:
		mov	[bp+var_42], 0
		mov	bx, [bp+var_2]
		cmp	dword ptr [bx+5Ah], 0
		jz	short loc_9874E
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		add	dx, 1Ah
		mov	word ptr [bp+var_42+2], ax
		mov	word ptr [bp+var_42], dx
		jmp	short loc_9874E

loc_9874E:
		mov	ax, word_7CADA
		mov	[bp+var_44], ax
		mov	al, [bp+var_16]
		mov	[bp+var_46], al
		les	bx, word ptr [bp+var_42]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_98776
		push	ax
		push	[bp+var_44]
		push	word ptr [bp+var_42+2]
		push	bx
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_98776

loc_98776:
		mov	[bp+var_C], 0
		jmp	loc_98802

loc_9877E:
		mov	di, [bp+var_C]
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_98794
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_98796

loc_98794:
		mov	al, 1Ch

loc_98796:
		mov	[bp+var_E], al
		test	byte ptr [di+2], 10h
		jz	short loc_98802
		mov	al, [di+51h]
		mov	bx, word_7CADA
		cmp	al, [bx+51h]
		jnz	short loc_98802
		cmp	[bp+var_E], 6
		jnz	short loc_98802
		cmp	di, word_7CADA
		jz	short loc_98802
		mov	[bp+var_4A], 0
		mov	bx, [bp+var_2]
		cmp	dword ptr [bx+5Ah], 0
		jz	short loc_987DA
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		add	dx, 1Ah
		mov	word ptr [bp+var_4A+2], ax
		mov	word ptr [bp+var_4A], dx
		jmp	short loc_987DA

loc_987DA:
		mov	[bp+var_4C], di
		mov	bx, [bp+var_14]
		mov	al, [bx+si+2Ah]
		mov	[bp+var_4E], al
		les	bx, word ptr [bp+var_4A]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_98802
		push	ax
		push	[bp+var_4C]
		push	word ptr [bp+var_4A+2]
		push	bx
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_98802

loc_98802:
		lea	ax, [bp+var_C]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_98818
		jmp	loc_9877E

loc_98818:
		jmp	loc_988B8

loc_9881B:
		mov	[bp+var_52], 0
		mov	bx, [bp+var_2]
		cmp	dword ptr [bx+5Ah], 0
		jz	short loc_9883E
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		add	dx, 1Ah
		mov	word ptr [bp+var_52+2], ax
		mov	word ptr [bp+var_52], dx
		jmp	short loc_9883E

loc_9883E:
		mov	ax, word_7CADA
		mov	[bp+var_54], ax
		mov	al, [bp+var_16]
		mov	[bp+var_56], al
		les	bx, word ptr [bp+var_52]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_98866
		push	ax
		push	[bp+var_54]
		push	word ptr [bp+var_52+2]
		push	bx
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_98866

loc_98866:
		mov	[bp+var_5A], 0
		mov	bx, [bp+var_2]
		cmp	dword ptr [bx+5Ah], 0
		jz	short loc_98889
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		add	dx, 1Ah
		mov	word ptr [bp+var_5A+2], ax
		mov	word ptr [bp+var_5A], dx
		jmp	short loc_98889

loc_98889:
		les	bx, word ptr [bp+var_6]
		mov	ax, es:[bx+0Dh]
		mov	[bp+var_5C], ax
		mov	bx, [bp+var_14]
		mov	al, [bx+si+2Ah]
		mov	[bp+var_5E], al
		les	bx, word ptr [bp+var_5A]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_988B8
		push	ax
		push	[bp+var_5C]
		push	word ptr [bp+var_5A+2]
		push	bx
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_988B8

loc_988B8:
		push	2
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74CA8
		add	sp, 4
		jmp	short loc_98926

loc_988D8:
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74CEE
		pop	cx
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74AD7
		pop	cx
		nop
		push	cs
		call	near ptr sub_989AE
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74ADC
		pop	cx
		call	Keyboard_DrainBufferBIOS_701E1
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	2
		lea	ax, [bp+var_17E]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_10A]
		push	ax
		call	sub_74CA8
		add	sp, 4

loc_98926:
		pop	di
		pop	si
		leave
		retf
sub_97C10		endp

; START OF FUNCTION CHUNK FOR sub_97C10
off_9892A	dw offset loc_986E4
		dw offset loc_986AE
		dw offset loc_986B4
		dw offset loc_986BA
		dw offset loc_986C0
		dw offset loc_986CC
		dw offset loc_986D2
		dw offset loc_986C6
		dw offset loc_986D8
		dw offset loc_986DE
		dw offset loc_986A8
off_98940	dw offset loc_98468
		dw offset loc_981DF
		dw offset loc_981EE
		dw offset loc_98314
		dw offset loc_9834B
		dw offset loc_9839C
		dw offset loc_983B6
		dw offset loc_9838B
		dw offset loc_983F7
		dw offset loc_98434
		dw offset loc_98281
; END OF FUNCTION CHUNK FOR sub_97C10

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_98956		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7C9F0, 2
		jnz	short loc_98965
		mov	ax, 1
		jmp	short loc_98967

loc_98965:
		xor	ax, ax

loc_98967:
		or	ax, ax
		jz	short loc_98994
		cmp	byte_7C9F0, 2
		jnz	short loc_98981
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_98981

loc_98981:
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		jmp	short loc_989A3

loc_98994:
		push	6324h
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4

loc_989A3:
		push	67B7h
		call	sub_737D7
		pop	cx
		pop	bp
		retf
sub_98956		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_989AE		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	byte_7C9F0, 2
		jnz	short loc_989C0
		mov	ax, 1
		jmp	short loc_989C2

loc_989C0:
		xor	ax, ax

loc_989C2:
		or	ax, ax
		jz	short loc_989E7
		push	large 10002h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		push	large 2
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		jmp	short loc_989F6

loc_989E7:
		push	word_7AF7E
		push	6324h
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4

loc_989F6:
		cmp	byte_7C9F0, 2
		jnz	short loc_98A02
		mov	ax, 1
		jmp	short loc_98A04

loc_98A02:
		xor	ax, ax

loc_98A04:
		or	ax, ax
		jz	short loc_98A4C
		cmp	byte_7C9F0, 2
		jnz	short loc_98A4C
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_2], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_2], 0
		jnz	short loc_98A4A
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_98A4C

loc_98A4A:
		jmp	short loc_98A4C

loc_98A4C:
		push	67B7h
		call	sub_737D7
		pop	cx
		leave
		retf
sub_989AE		endp
ovr257		ends
