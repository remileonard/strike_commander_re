ovr240		segment	para public 'OVERLAY' use16
		assume cs:ovr240
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89A30		proc far

var_B8		= dword ptr -0B8h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
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
var_54		= word ptr -54h
var_52		= dword ptr -52h
var_4E		= word ptr -4Eh
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
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
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_C]
		mov	[bp+var_2], 64h
		or	cx, cx
		jz	short loc_89A4B
		shl	[bp+var_2], 1

loc_89A4B:
		mov	di, [bp+arg_6]
		mov	eax, [di]
		mov	[bp+var_74], eax
		mov	eax, [di+4]
		mov	[bp+var_70], eax
		mov	eax, [di+8]
		mov	[bp+var_6C], eax
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_74]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_70]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_6C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6C], eax
		mov	[bp+var_A], 0FFCEh
		or	cx, cx
		jz	short loc_89AC0
		shl	[bp+var_A], 1

loc_89AC0:
		mov	di, [bp+arg_6]
		add	di, 0Ch
		mov	eax, [di]
		mov	[bp+var_80], eax
		mov	eax, [di+4]
		mov	[bp+var_7C], eax
		mov	eax, [di+8]
		mov	[bp+var_78], eax
		mov	ax, [bp+var_A]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_80]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_80], eax
		mov	eax, [bp+var_7C]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		push	0
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_8C], eax
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_88], eax
		mov	[bp+var_20], 100h
		mov	eax, [bp+var_20]
		mov	[bp+var_84], eax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		push	[bp+arg_4]
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_24]
		mov	[bp+var_14], eax
		mov	di, 1
		jmp	loc_89D1B

loc_89B88:
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si]
		mov	[bp+var_42], ax
		push	ax
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_Node_Accessor_546E4
		add	sp, 4
		mov	[bp+var_3E], dx
		mov	[bp+var_40], ax
		mov	ax, [bp+var_3E]
		mov	dx, [bp+var_40]
		add	dx, 33h
		mov	[bp+var_44], ax
		mov	[bp+var_46], dx
		les	bx, [bp+var_46]
		mov	ax, es:[bx]
		mov	[bp+var_48], ax
		movsx	eax, [bp+var_48]
		shl	eax, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_A4], eax
		mov	ax, es:[bx+2]
		mov	[bp+var_4E], ax
		movsx	eax, [bp+var_4E]
		shl	eax, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_A0], eax
		mov	ax, es:[bx+4]
		mov	[bp+var_54], ax
		movsx	eax, [bp+var_54]
		shl	eax, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_9C], eax
		mov	cx, [bp+arg_4]
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_B0], eax
		mov	eax, [bx+4]
		mov	[bp+var_AC], eax
		mov	eax, [bx+8]
		mov	[bp+var_A8], eax
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_A4]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_A4]
		add	[bp+var_B0], eax
		mov	eax, [bp+var_A0]
		add	[bp+var_AC], eax
		mov	eax, [bp+var_9C]
		add	[bp+var_A8], eax
		sub	sp, 4
		mov	eax, [bp+arg_8]
		mov	[bp+var_B8], eax
		mov	ax, [bp+arg_6]
		add	ax, 0Ch
		push	ax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si]
		call	Pilot_LowLevelControlCommand
		add	sp, 0Ah
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si]
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 0
		jnz	short loc_89CC4
		mov	eax, [bp+var_14]
		add	eax, 0DAC00h
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si]
		mov	[bx+1Ah], eax
		jmp	short loc_89CFC

loc_89CC4:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si]
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 1
		jnz	short loc_89CFC
		mov	eax, [bp+var_14]
		add	eax, 12C00h
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si]
		mov	[bx+1Ah], eax

loc_89CFC:
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si]
		les	bx, [bx+5Ah]
		mov	byte ptr es:[bx+166h], 0
		mov	bx, di
		shl	bx, 1
		mov	bx, [bx+si]
		mov	bx, [bx+5Ah]
		mov	byte ptr es:[bx+165h], 1
		inc	di

loc_89D1B:
		cmp	di, [bp+arg_2]
		jge	short loc_89D23
		jmp	loc_89B88

loc_89D23:
		mov	ax, word_79B8C
		add	ax, 79h
		push	ax
		call	Lexer_Advance
		pop	cx
		mov	bx, word_79B8C
		mov	al, [bx+7Fh]
		mov	ah, 0
		mov	di, ax
		mov	ax, word_79B8C
		add	ax, 79h
		push	ax
		call	Lexer_Rewind
		pop	cx
		cmp	di, 0C1h
		jz	short loc_89D54
		cmp	di, 0A2h
		jnz	short loc_89D6E

loc_89D54:
		mov	eax, [bp+var_14]
		add	eax, 1F400h
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	bx, [si]
		mov	[bx+1Ah], eax
		jmp	short loc_89DC8

loc_89D6E:
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 0
		jnz	short loc_89D9C
		mov	eax, [bp+var_14]
		add	eax, 0DAC00h
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	bx, [si]
		mov	[bx+1Ah], eax
		jmp	short loc_89DC8

loc_89D9C:
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 1
		jnz	short loc_89DC8
		mov	eax, [bp+var_14]
		add	eax, 12C00h
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	bx, [si]
		mov	[bx+1Ah], eax

loc_89DC8:
		mov	byte_7CE06, 0
		pop	di
		pop	si
		leave
		retf
sub_89A30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89DD1		proc far

var_C4		= dword ptr -0C4h
var_C2		= dword ptr -0C2h
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
var_72		= word ptr -72h
var_5A		= dword ptr -5Ah
var_58		= dword ptr -58h
var_56		= dword ptr -56h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_3F		= byte ptr -3Fh
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0BAh
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	[bp+var_4], 1F400h
		mov	[bp+var_8], 1F400h
		mov	bx, word_79B8C
		mov	al, [bx+80h]
		mov	ah, 0
		mov	[bp+var_A], ax
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		push	bx
		call	sub_752CB
		add	sp, 6
		mov	[bp+var_C], ax
		mov	si, [bp+var_72]
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_7E], eax
		mov	eax, [di+4]
		mov	[bp+var_7A], eax
		mov	eax, [di+8]
		mov	[bp+var_76], eax
		mov	bx, word_79B8C
		mov	di, [bx+61h]
		lea	ax, word ptr [bp+var_8A]
		push	ax
		mov	ax, word_79B8C
		add	ax, 79h
		push	ax
		call	Lexer_ResolveConstantAlt
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_89E4E
		jmp	loc_8A446

loc_89E4E:
		lea	ax, word ptr [bp+var_8A]
		push	ax
		mov	ax, word_79B8C
		add	ax, 3Ah
		push	ax
		call	Scene_FindMatchingByAreaContainment_54B1B
		add	sp, 4
		mov	[bp+var_E], ax
		mov	al, [bp+arg_2]
		push	ax
		push	word_79B8C
		call	sub_55F03
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_89E7E
		jmp	loc_8A446

loc_89E7E:
		mov	word_79784, 1
		mov	[bp+var_12], 100h
		mov	eax, [bp+var_12]
		mov	dword_7977E, eax
		mov	byte_79782, 0
		mov	word_77356, 0
		mov	dword_7735E, 0
		mov	[bp+var_14], 1
		jmp	short loc_89EDE

loc_89EAF:
		mov	bx, [bp+var_14]
		shl	bx, 1
		lea	ax, [bp+var_72]
		add	bx, ax
		mov	bx, [bx]
		push	word ptr [bx+52h]
		mov	bx, [bp+var_14]
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	[bp+var_16], ax
		mov	bx, [bp+var_16]
		mov	byte ptr [bx+85h], 0FFh
		inc	[bp+var_14]

loc_89EDE:
		mov	ax, [bp+var_14]
		cmp	ax, [bp+var_C]
		jl	short loc_89EAF
		cmp	di, [bp+var_E]
		jnz	short loc_89EEE
		jmp	loc_89F7E

loc_89EEE:
		mov	word ptr [bp+var_54+2], 0
		mov	word ptr [bp+var_54], 0
		jmp	short loc_89F68

loc_89EFA:
		mov	ax, word ptr [bp+var_54]
		mov	word ptr [bp+var_56], ax
		push	ax
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_Node_Accessor_546E4
		add	sp, 4
		mov	word ptr [bp+var_58], dx
		mov	word ptr [bp+var_5A], ax
		cmp	[bp+var_5A], 0
		jz	short loc_89F3F
		push	dx
		push	ax
		call	sub_75285
		add	sp, 4
		or	al, al
		jz	short loc_89F62
		push	large [bp+var_5A]
		call	PartEntry_Deactivate_536C9
		add	sp, 4
		mov	ax, word ptr [bp+var_54+2]
		mov	word ptr [bp+var_54], ax
		jmp	short loc_89F62

loc_89F3F:
		mov	bx, word ptr [bp+var_56]
		test	byte ptr [bx+2], 1
		jnz	short loc_89F4E
		test	byte ptr [bx+2], 20h
		jz	short loc_89F62

loc_89F4E:
		push	word ptr [bp+var_56]
		push	67ADh
		call	sub_1E610
		add	sp, 4
		mov	ax, word ptr [bp+var_54+2]
		mov	word ptr [bp+var_54], ax

loc_89F62:
		mov	ax, word ptr [bp+var_54]
		mov	word ptr [bp+var_54+2], ax

loc_89F68:
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_89F7E
		jmp	loc_89EFA

loc_89F7E:
		mov	word_79793, 0
		mov	word_79795, 0
		mov	word_79791, 0
		mov	word_7978D, 0
		mov	[bp+var_1A], 5000h
		push	0
		mov	[bp+var_22], 0
		mov	eax, [bp+var_22]
		mov	[bp+var_96], eax
		mov	[bp+var_26], 0
		mov	eax, [bp+var_26]
		mov	[bp+var_92], eax
		mov	[bp+var_2A], 100h
		mov	eax, [bp+var_2A]
		mov	[bp+var_8E], eax
		lea	ax, word ptr [bp+var_96]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_1E]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_76]
		sub	eax, [bp+var_1E]
		mov	[bp+var_2E], eax
		cmp	[bp+var_2E], 3E800h
		jge	short loc_8A011
		mov	eax, [bp+var_1E]
		add	eax, 3E800h
		mov	[bp+var_76], eax

loc_8A011:
		mov	eax, [bp+var_8A]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_7E]
		sub	[bp+var_A2], eax
		mov	eax, [bp+var_7A]
		sub	[bp+var_9E], eax
		mov	eax, [bp+var_76]
		sub	[bp+var_9A], eax
		mov	[bp+var_32], 0
		mov	eax, [bp+var_32]
		mov	[bp+var_9A], eax
		push	3
		push	large 100h
		lea	ax, word ptr [bp+var_A2]
		push	ax
		call	sub_57677
		add	sp, 8
		lea	ax, word ptr [bp+var_A2]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	dx, ax
		mov	bx, dx
		mov	eax, [bp+var_A2]
		mov	[bx], eax
		mov	eax, [bp+var_9E]
		mov	[bx+4], eax
		mov	eax, [bp+var_9A]
		mov	[bx+8], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		mov	dx, ax
		mov	[bp+var_36], 0
		mov	eax, [bp+var_36]
		mov	[bp+var_AE], eax
		mov	[bp+var_3A], 0
		mov	eax, [bp+var_3A]
		mov	[bp+var_AA], eax
		mov	[bp+var_3E], 100h
		mov	eax, [bp+var_3E]
		mov	[bp+var_A6], eax
		mov	bx, dx
		mov	eax, [bp+var_AE]
		mov	[bx], eax
		mov	eax, [bp+var_AA]
		mov	[bx+4], eax
		mov	eax, [bp+var_A6]
		mov	[bx+8], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_ApplyToVectorZ_594AE
		pop	cx
		sub	sp, 4
		mov	eax, [bp+var_1A]
		mov	[bp+var_C2], eax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	si
		call	Pilot_LowLevelControlCommand
		add	sp, 0Ah
		push	0
		sub	sp, 4
		mov	eax, [bp+var_1A]
		mov	[bp+var_C4], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	[bp+var_C]
		lea	ax, [bp+var_72]
		push	ax
		push	cs
		call	near ptr sub_89A30
		add	sp, 0Eh
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_8A15E
		jmp	loc_8A1E4

loc_8A15E:
		mov	byte_76E24, 1
		push	ds
		push	offset aAUTOPILT
		push	67B7h
		call	sub_737C8
		add	sp, 6
		or	al, al
		jz	short loc_8A1D6
		mov	ax, word_7CEF9
		mov	word ptr [bp+var_54+2], ax
		jmp	short loc_8A1C8

loc_8A17E:
		mov	ax, word ptr [bp+var_54+2]
		cmp	ax, word_7CEF9
		jz	short loc_8A193
		push	word_7CEF9
		call	Camera_DetachParent
		pop	cx
		jmp	short loc_8A1D1

loc_8A193:
		mov	word_79784, 1
		mov	[bp+var_56], 100h
		mov	eax, [bp+var_56]
		mov	dword_7977E, eax
		mov	byte_79782, 0
		mov	byte_7CF9E, 0
		xor	eax, eax
		mov	dword_7CF9F, eax
		mov	dword_7CFA3, eax
		mov	byte_7CFAB, 1
		call	sub_50F18

loc_8A1C8:
		call	Input_AltKeyDetailToggles_5093D
		or	al, al
		jnz	short loc_8A17E

loc_8A1D1:
		mov	byte_76E26, 1

loc_8A1D6:
		push	633Eh
		call	sub_227FE
		pop	cx
		mov	byte_76E24, 0

loc_8A1E4:
		cmp	[bp+var_E], 0
		jnz	short loc_8A1ED
		jmp	loc_8A446

loc_8A1ED:
		mov	[bp+var_3F], 0
		mov	[bp+var_42], di
		mov	[bp+var_44], 0FFFFh
		mov	[bp+var_45], 0
		jmp	loc_8A348

loc_8A200:
		mov	eax, [bp+var_8A]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_7E]
		sub	[bp+var_BA], eax
		mov	eax, [bp+var_7A]
		sub	[bp+var_B6], eax
		mov	eax, [bp+var_76]
		sub	[bp+var_B2], eax
		or	di, di
		jnz	short loc_8A240
		jmp	loc_8A2E9

loc_8A240:
		cmp	di, [bp+var_E]
		jz	short loc_8A248
		jmp	loc_8A2CB

loc_8A248:
		mov	[bp+var_45], 1
		cmp	[bp+arg_2], 0
		jnz	short loc_8A258
		cmp	word ptr [di+14h], 0
		jnz	short loc_8A276

loc_8A258:
		mov	eax, [bp+var_8A]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_76], eax
		jmp	loc_8A354

loc_8A276:
		push	large [bp+var_B2]
		push	large [bp+var_B6]
		push	large [bp+var_BA]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_58], eax
		mov	[bp+var_54], eax
		cmp	eax, [bp+var_8]
		jge	short loc_8A2A3
		mov	[bp+var_8], eax

loc_8A2A3:
		mov	eax, [bp+var_54]
		cmp	eax, [bp+var_4]
		jge	short loc_8A2B1
		mov	[bp+var_3F], 1

loc_8A2B1:
		push	0FFh
		push	di
		call	sub_753AA
		add	sp, 4
		or	ax, ax
		jle	short loc_8A2E9
		mov	[bp+var_45], 0
		mov	[bp+var_3F], 1
		jmp	short loc_8A2E9

loc_8A2CB:
		cmp	di, [bp+var_42]
		jz	short loc_8A2E9
		push	0FFh
		push	di
		call	sub_753AA
		add	sp, 4
		mov	word ptr [bp+var_54+2], ax
		cmp	word ptr [bp+var_54+2], 0
		jle	short loc_8A2E9
		mov	[bp+var_3F], 1

loc_8A2E9:
		mov	al, [bp+var_3F]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A348
		push	3
		push	large 100h
		lea	ax, word ptr [bp+var_BA]
		push	ax
		call	sub_57677
		add	sp, 8
		lea	ax, word ptr [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		mov	eax, [bp+var_BA]
		add	[bp+var_7E], eax
		mov	eax, [bp+var_B6]
		add	[bp+var_7A], eax
		mov	eax, [bp+var_B2]
		add	[bp+var_76], eax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		mov	ax, word_79B8C
		add	ax, 3Ah
		push	ax
		call	Scene_FindMatchingByAreaContainment_54B1B
		add	sp, 4
		mov	di, ax

loc_8A348:
		mov	al, [bp+var_3F]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A354
		jmp	loc_8A200

loc_8A354:
		or	di, di
		jz	short loc_8A382
		cmp	byte ptr [di+18h], 0
		jz	short loc_8A382
		mov	dx, di
		add	dx, 1Bh
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_7E], eax
		mov	eax, [bx+4]
		mov	[bp+var_7A], eax
		mov	eax, [bx+8]
		mov	[bp+var_76], eax
		mov	ax, [di+19h]
		mov	[bp+var_44], ax

loc_8A382:
		cmp	[bp+var_44], 0FFFFh
		jz	short loc_8A3C4
		xor	eax, eax
		mov	[bp+var_9A], eax
		mov	[bp+var_A2], eax
		mov	[bp+var_9E], 100h
		mov	ax, [bp+var_44]
		neg	ax
		mov	[bp+var_48], ax
		movsx	eax, [bp+var_48]
		shl	eax, 8
		mov	[bp+var_4C], eax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		call	Vector_RotateHeading2D_57513
		add	sp, 4

loc_8A3C4:
		mov	[bp+var_50], 5000h
		mov	eax, [bp+var_50]
		mov	[bp+var_1A], eax
		sub	sp, 4
		mov	[bp+var_C2], eax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	si
		call	Pilot_LowLevelControlCommand
		add	sp, 0Ah
		push	1
		sub	sp, 4
		mov	eax, [bp+var_1A]
		mov	[bp+var_C4], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		push	[bp+var_C]
		lea	ax, [bp+var_72]
		push	ax
		push	cs
		call	near ptr sub_89A30
		add	sp, 0Eh
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A429
		push	word_79788
		call	StreamReader_DestructWrapper_36857
		pop	cx

loc_8A429:
		push	word_77696
		call	sub_735D2
		pop	cx
		cmp	[bp+var_45], 0
		jz	short loc_8A446
		mov	ax, word_79B8C
		add	ax, 79h
		push	ax
		call	Parser_ConsumeRemaining
		pop	cx

loc_8A446:
		pop	di
		pop	si
		leave
		retf
sub_89DD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8A44A		proc far

var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	dx, [bp+arg_0]
		mov	bx, word_79B8C
		mov	al, [bx+7Fh]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	[bp+var_4], ax
		mov	cx, 5
		mov	bx, offset word_8A4A3

loc_8A468:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4]
		jz	short loc_8A477
		add	bx, 2
		loop	short loc_8A468
		jmp	short loc_8A4A1

loc_8A477:
		jmp	word ptr cs:[bx+0Ah] ; switch jump
		jmp	short loc_8A4A1

loc_8A47D:
		mov	[bp+var_5], 1
		mov	al, [bp+var_5]
		push	ax
		push	dx
		push	cs
		call	near ptr sub_89DD1
		add	sp, 4
		jmp	short loc_8A4A1

loc_8A48F:
		mov	al, 0
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A4A1
		push	0
		push	dx
		push	cs
		call	near ptr sub_89DD1
		add	sp, 4

loc_8A4A1:
		leave
		retf
sub_8A44A		endp

; START OF FUNCTION CHUNK FOR sub_8A44A
word_8A4A3	dw 0A2h
		dw 0A4h
		dw 0A5h
		dw 0A6h
		dw 0C1h
off_8A4AD	dw offset loc_8A47D
		dw offset loc_8A48F
		dw offset loc_8A48F
		dw offset loc_8A48F
		dw offset loc_8A47D
; END OF FUNCTION CHUNK FOR sub_8A44A
ovr240		ends
