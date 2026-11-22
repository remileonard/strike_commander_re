seg123		segment	para public 'CODE' use16
		assume cs:seg123
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 18h

loc_50931:
		db 0C4h, 5Eh, 6, 26h, 39h, 77h, 2, 77h, 0E7h

loc_5093A:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE EN PARTIE 2026-11-05. Aiguillage sur le code de touche byte_7CAC3 − 15 (table
; off_50E83, 19 cas), touche ALT exigée (byte_7CAC5 & 0C0h, ou byte_7D348 / byte_7D369) : code
; 19 (R) → bascule byte_7CAFF (eau texturée) ; code 21 (Y) → bascule byte_7CAFE (ciel
; texturé). Autres cas (codes 15, 25, 32, 33) non lus.
; ==============================================================================================
Input_AltKeyDetailToggles_5093D		proc far

var_74		= dword ptr -74h
var_70		= word ptr -70h
var_5C		= word ptr -5Ch
var_34		= word ptr -34h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_15		= byte ptr -15h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 70h
		mov	[bp+var_1], 0
		push	633Eh
		call	sub_227FE
		pop	cx
		or	al, al
		jnz	short loc_50957
		jmp	loc_50E7E

loc_50957:
		mov	al, byte_7CAC3
		mov	ah, 0
		sub	ax, 0Fh
		mov	bx, ax
		cmp	bx, 12h
		jbe	short loc_50969
		jmp	loc_50CB4

loc_50969:
		shl	bx, 1
		jmp	cs:off_50E83[bx]	; switch jump

loc_50970:
		cmp	byte_7CAC2, 1
		jnz	short loc_50987
		test	byte_7CAC5, 0C0h
		jz	short loc_50983
		mov	ax, 1
		jmp	short loc_50985

loc_50983:
		xor	ax, ax

loc_50985:
		jmp	short loc_5099C

loc_50987:
		cmp	byte_7D348, 1
		jz	short loc_50995
		cmp	byte_7D369, 1
		jnz	short loc_5099A

loc_50995:
		mov	ax, 1
		jmp	short loc_5099C

loc_5099A:
		xor	ax, ax

loc_5099C:
		or	al, al
		jnz	short loc_509A3
		jmp	loc_50CB4

loc_509A3:
		xor	byte_7CAFF, 1
		jmp	loc_50CB4

loc_509AB:
		cmp	byte_7CAC2, 1
		jnz	short loc_509C2
		test	byte_7CAC5, 0C0h
		jz	short loc_509BE
		mov	ax, 1
		jmp	short loc_509C0

loc_509BE:
		xor	ax, ax

loc_509C0:
		jmp	short loc_509D7

loc_509C2:
		cmp	byte_7D348, 1
		jz	short loc_509D0
		cmp	byte_7D369, 1
		jnz	short loc_509D5

loc_509D0:
		mov	ax, 1
		jmp	short loc_509D7

loc_509D5:
		xor	ax, ax

loc_509D7:
		or	al, al
		jnz	short loc_509DE
		jmp	loc_50CB4

loc_509DE:
		xor	byte_7CAFE, 1
		jmp	loc_50CB4

loc_509E6:
		cmp	byte_7CAC2, 1
		jnz	short loc_509FD
		test	byte_7CAC5, 0Ch
		jz	short loc_509F9
		mov	ax, 1
		jmp	short loc_509FB

loc_509F9:
		xor	ax, ax

loc_509FB:
		jmp	short loc_50A12

loc_509FD:
		cmp	byte_7D33A, 1
		jz	short loc_50A0B
		cmp	byte_7D346, 1
		jnz	short loc_50A10

loc_50A0B:
		mov	ax, 1
		jmp	short loc_50A12

loc_50A10:
		xor	ax, ax

loc_50A12:
		or	al, al
		jnz	short loc_50A19
		jmp	loc_50CB4

loc_50A19:
		xor	word_797AB, 1
		jmp	loc_50CB4

loc_50A21:
		cmp	byte_7CAC2, 1
		jnz	short loc_50A38
		test	byte_7CAC5, 0Ch
		jz	short loc_50A34
		mov	ax, 1
		jmp	short loc_50A36

loc_50A34:
		xor	ax, ax

loc_50A36:
		jmp	short loc_50A4D

loc_50A38:
		cmp	byte_7D33A, 1
		jz	short loc_50A46
		cmp	byte_7D346, 1
		jnz	short loc_50A4B

loc_50A46:
		mov	ax, 1
		jmp	short loc_50A4D

loc_50A4B:
		xor	ax, ax

loc_50A4D:
		or	al, al
		jnz	short loc_50A54
		jmp	loc_50CB4

loc_50A54:
		mov	al, byte_7978A
		xor	al, 1
		mov	byte_7978A, al
		jmp	loc_50CB4

loc_50A5F:
		mov	byte_79783, 1
		cmp	byte_7CAC2, 1
		jnz	short loc_50A7B
		test	byte_7CAC5, 0Ch
		jz	short loc_50A77
		mov	ax, 1
		jmp	short loc_50A79

loc_50A77:
		xor	ax, ax

loc_50A79:
		jmp	short loc_50A90

loc_50A7B:
		cmp	byte_7D33A, 1
		jz	short loc_50A89
		cmp	byte_7D346, 1
		jnz	short loc_50A8E

loc_50A89:
		mov	ax, 1
		jmp	short loc_50A90

loc_50A8E:
		xor	ax, ax

loc_50A90:
		or	al, al
		jnz	short loc_50A97
		jmp	loc_50B2C

loc_50A97:
		mov	byte_79782, 0
		mov	byte_79783, 0
		cmp	word_79784, 1
		jnz	short loc_50AB0
		mov	word_79784, 2
		jmp	short loc_50ACC

loc_50AB0:
		cmp	word_79784, 2
		jnz	short loc_50ABF
		mov	word_79784, 4
		jmp	short loc_50ACC

loc_50ABF:
		cmp	word_79784, 4
		jnz	short loc_50ACC
		mov	word_79784, 1

loc_50ACC:
		mov	ax, word_79784
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	dword_7977E, eax
		push	seg seg008
		push	offset loc_54F0
		lea	ax, [bp+var_5C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79784
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		sub	sp, 4
		mov	[bp+var_74], 200h
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	loc_50CB4

loc_50B2C:
		cmp	byte_7CAC2, 1
		jnz	short loc_50B43
		test	byte_7CAC5, 0Ch
		jz	short loc_50B3F
		mov	ax, 1
		jmp	short loc_50B41

loc_50B3F:
		xor	ax, ax

loc_50B41:
		jmp	short loc_50B58

loc_50B43:
		cmp	byte_7D33A, 1
		jz	short loc_50B51
		cmp	byte_7D346, 1
		jnz	short loc_50B56

loc_50B51:
		mov	ax, 1
		jmp	short loc_50B58

loc_50B56:
		xor	ax, ax

loc_50B58:
		mov	ah, 0
		or	ax, ax
		jz	short loc_50B61
		jmp	loc_50CB4

loc_50B61:
		mov	eax, dword_7CED1
		sar	eax, 1Fh
		and	ax, 1
		or	ax, ax
		jnz	short loc_50B73
		jmp	loc_50CB4

loc_50B73:
		mov	dword_7CECD, 400h
		jmp	loc_50CB4

loc_50B7F:
		cmp	byte_7CAC2, 1
		jnz	short loc_50B96
		test	byte_7CAC5, 0C0h
		jz	short loc_50B92
		mov	ax, 1
		jmp	short loc_50B94

loc_50B92:
		xor	ax, ax

loc_50B94:
		jmp	short loc_50BAB

loc_50B96:
		cmp	byte_7D348, 1
		jz	short loc_50BA4
		cmp	byte_7D369, 1
		jnz	short loc_50BA9

loc_50BA4:
		mov	ax, 1
		jmp	short loc_50BAB

loc_50BA9:
		xor	ax, ax

loc_50BAB:
		or	al, al
		jnz	short loc_50BB2
		jmp	loc_50CB4

loc_50BB2:
		mov	byte_7975D, 0
		mov	[bp+var_15], 0
		xor	eax, eax
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	[bp+var_1A], 0
		mov	eax, dword_7B29D
		mov	[bp+var_1E], eax
		cmp	byte_7C9F0, 2
		jnz	short loc_50BEC
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_50BEC

loc_50BEC:
		push	seg seg008
		push	offset loc_5505
		lea	ax, [bp+var_70]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	0
		push	1
		push	ss
		lea	ax, [bp+var_70]
		push	ax
		push	word_7CF9A
		push	word_7AF7E
		push	ds
		push	offset unk_7CEFE
		call	sub_15D3D
		add	sp, 10h
		jmp	short loc_50C5E

loc_50C1D:
		mov	eax, [bp+var_1E]
		add	eax, [bp+var_1A]
		cmp	eax, dword_7B29D
		ja	short loc_50C31
		mov	ax, 1
		jmp	short loc_50C33

loc_50C31:
		xor	ax, ax

loc_50C33:
		mov	ah, 0
		or	ax, ax
		jz	short loc_50C5E
		mov	[bp+var_1A], 6
		mov	eax, dword_7B29D
		mov	[bp+var_1E], eax
		push	633Eh
		call	sub_227FE
		pop	cx
		mov	al, byte_7CAC3
		mov	ah, 0
		or	ax, ax
		jz	short loc_50C5E
		inc	[bp+var_15]

loc_50C5E:
		mov	al, [bp+var_15]
		mov	ah, 0
		or	ax, ax
		jz	short loc_50C1D
		push	633Eh
		call	sub_227FE
		pop	cx
		cmp	byte_7C9F0, 2
		jnz	short loc_50CB4
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_20], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_20], 0
		jnz	short loc_50CB2
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_50CB4

loc_50CB2:
		jmp	short loc_50CB4

loc_50CB4:
		cmp	byte_7D31F, 1
		jnz	short loc_50CBF
		mov	al, 1
		jmp	short loc_50CC1

loc_50CBF:
		mov	al, 0

loc_50CC1:
		or	al, al
		jz	short loc_50D28
		cmp	byte_7CAC2, 1
		jnz	short loc_50CDC
		test	byte_7CAC5, 0Ch
		jz	short loc_50CD8
		mov	ax, 1
		jmp	short loc_50CDA

loc_50CD8:
		xor	ax, ax

loc_50CDA:
		jmp	short loc_50CF1

loc_50CDC:
		cmp	byte_7D33A, 1
		jz	short loc_50CEA
		cmp	byte_7D346, 1
		jnz	short loc_50CEF

loc_50CEA:
		mov	ax, 1
		jmp	short loc_50CF1

loc_50CEF:
		xor	ax, ax

loc_50CF1:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_50D28
		mov	eax, dword_7CED1
		sar	eax, 1Fh
		and	ax, 1
		or	ax, ax
		jz	short loc_50D28
		mov	[bp+var_C], 600h
		mov	eax, [bp+var_C]
		mov	dword_7977E, eax
		mov	byte_79782, 1
		push	6
		push	6798h
		call	Timer_SetRelativeFrames_506B2
		add	sp, 4

loc_50D28:
		cmp	byte_7D31F, 1
		jnz	short loc_50D33
		mov	al, 1
		jmp	short loc_50D35

loc_50D33:
		mov	al, 0

loc_50D35:
		or	al, al
		jz	short loc_50D86
		cmp	byte_7CAC2, 1
		jnz	short loc_50D50
		test	byte_7CAC5, 0Ch
		jz	short loc_50D4C
		mov	ax, 1
		jmp	short loc_50D4E

loc_50D4C:
		xor	ax, ax

loc_50D4E:
		jmp	short loc_50D65

loc_50D50:
		cmp	byte_7D33A, 1
		jz	short loc_50D5E
		cmp	byte_7D346, 1
		jnz	short loc_50D63

loc_50D5E:
		mov	ax, 1
		jmp	short loc_50D65

loc_50D63:
		xor	ax, ax

loc_50D65:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_50D86
		mov	eax, dword_7CED1
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jz	short loc_50D86
		mov	dword_7CECD, 400h
		mov	byte_79783, 1

loc_50D86:
		cmp	byte_79783, 0
		jz	short loc_50DC7
		cmp	byte_79782, 0
		jz	short loc_50DC7
		push	seg seg008
		push	offset loc_5511
		lea	ax, [bp+var_70]
		push	ax
		call	sub_54BE
		add	sp, 6
		sub	sp, 4
		mov	[bp+var_74], 0E1000h
		push	ss
		lea	ax, [bp+var_70]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		mov	byte_79783, 0

loc_50DC7:
		cmp	word_7977C, 1
		jbe	short loc_50E35
		cmp	word_7CADA, 0
		jz	short loc_50E35
		cmp	byte_776BB, 0
		jnz	short loc_50E05
		mov	bx, word_7CADA
		push	word ptr [bx+52h]
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Physics_ApplyGroundHeightConstraint
		add	sp, 6
		cmp	[bp+var_10], 400h
		jle	short loc_50DFF
		mov	ax, 1
		jmp	short loc_50E01

loc_50DFF:
		xor	ax, ax

loc_50E01:
		or	al, al
		jz	short loc_50E35

loc_50E05:
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	dword_7977E, eax
		mov	byte_79782, 0
		mov	word_79784, 1
		mov	byte_7CF9E, 0
		xor	eax, eax
		mov	dword_7CF9F, eax
		mov	dword_7CFA3, eax
		mov	byte_7CFAB, 1

loc_50E35:
		push	67ADh
		call	sub_1E4A6
		pop	cx
		cmp	word_7977C, 4
		cmp	word_7977C, 0
		jbe	short loc_50E4F
		nop
		push	cs
		call	near ptr sub_50EEF

loc_50E4F:
		push	67ADh
		call	WorldObjects_IntegrateAllMotion_1E56B
		pop	cx
		inc	word_7977C
		push	ds
		push	offset unk_7CEFE
		call	Text_TypewriterTimer
		add	sp, 4
		push	67B7h
		call	sub_1F37D
		pop	cx
		or	al, al
		jz	short loc_50E79
		mov	[bp+var_1], 1

loc_50E79:
		call	Player_UpdateFrameState_2362F

loc_50E7E:
		mov	al, [bp+var_1]
		leave
		retf
Input_AltKeyDetailToggles_5093D		endp

; START OF FUNCTION CHUNK FOR Input_AltKeyDetailToggles_5093D
off_50E83	dw offset loc_50A5F
		dw offset loc_50CB4
		dw offset loc_50CB4
		dw offset loc_50CB4
		dw offset loc_50970
		dw offset loc_50CB4
		dw offset loc_509AB
		dw offset loc_50CB4
		dw offset loc_50CB4
		dw offset loc_50CB4
		dw offset loc_50B7F
		dw offset loc_50CB4
		dw offset loc_50CB4
		dw offset loc_50CB4
		dw offset loc_50CB4
		dw offset loc_50CB4
		dw offset loc_50CB4
		dw offset loc_50A21
		dw offset loc_509E6
; END OF FUNCTION CHUNK FOR Input_AltKeyDetailToggles_5093D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50EA9		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		push	633Eh
		call	sub_227FE
		pop	cx
		or	al, al
		jz	short loc_50EEA
		push	67ADh
		call	WorldObjects_IntegrateAllMotion_1E56B
		pop	cx
		inc	word_7977C
		push	ds
		push	offset unk_7CEFE
		call	Text_TypewriterTimer
		add	sp, 4
		push	67B7h
		call	sub_1F695
		pop	cx
		or	al, al
		jz	short loc_50EEA
		mov	[bp+var_1], 1

loc_50EEA:
		mov	al, [bp+var_1]
		leave
		retf
sub_50EA9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50EEF		proc far
		push	bp
		mov	bp, sp
		push	687Ch
		call	Collision_ResetLinkPool
		pop	cx
		push	687Ch
		call	sub_42598
		pop	cx
		push	687Ch
		call	sub_42509
		pop	cx
		push	687Ch
		call	sub_4289D
		pop	cx
		pop	bp
		retf
sub_50EEF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50F18		proc far

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
var_44		= word ptr -44h
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
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		push	si
		push	67B7h
		call	sub_1F2F1
		pop	cx
		cmp	byte_7975D, 0
		jnz	short loc_50F32
		jmp	loc_511BB

loc_50F32:
		call	PIT_ReadHighPrecision
		mov	bx, ax
		cmp	bx, 1
		jge	short loc_50F43
		mov	ax, 1
		jmp	short loc_50F45

loc_50F43:
		mov	ax, bx

loc_50F45:
		mov	word_79772, ax
		mov	[bp+var_8], 177000h
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_16], eax
		mov	[bp+var_4], eax
		mov	[bp+var_1A], 1E00h
		cmp	eax, [bp+var_1A]
		jle	short loc_50F99
		mov	ax, 1
		jmp	short loc_50F9B

loc_50F99:
		xor	ax, ax

loc_50F9B:
		or	al, al
		jnz	short loc_50F32
		mov	eax, dword_7CED1
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jz	short loc_50FE8
		mov	[bp+var_1E], 100h
		mov	eax, [bp+var_1E]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	dword_7976E, eax
		sub	dword_7CED1, eax
		mov	eax, dword_7CED1
		sar	eax, 1Fh
		inc	ax

loc_50FE8:
		cmp	dword_7977E, 100h
		jnz	short loc_50FF8
		mov	ax, 1
		jmp	short loc_50FFA

loc_50FF8:
		xor	ax, ax

loc_50FFA:
		or	al, al
		jz	short loc_51044
		mov	al, byte_79782
		mov	ah, 0
		or	ax, ax
		jnz	short loc_51044
		mov	[bp+var_2A], 400h
		mov	eax, [bp+var_4]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2A]
		cmp	eax, [bp+var_2E]
		jle	short loc_51026
		mov	ax, 1
		jmp	short loc_51028

loc_51026:
		xor	ax, ax

loc_51028:
		or	al, al
		jz	short loc_51031
		lea	ax, word ptr [bp+var_2A]
		jmp	short loc_51034

loc_51031:
		lea	ax, word ptr [bp+var_2E]

loc_51034:
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_32], eax
		mov	dword_7976A, eax
		jmp	loc_5117A

loc_51044:
		cmp	byte_79782, 0
		jz	short loc_51068
		push	6798h
		call	Timer_Tick_506DD
		pop	cx
		or	al, al
		jz	short loc_51068
		mov	si, 6798h
		mov	eax, [si]
		mov	[bp+var_36], eax
		mov	dword_7977E, eax
		jmp	short loc_51089

loc_51068:
		cmp	byte_79782, 0
		jz	short loc_51089
		mov	byte_79782, 0
		mov	byte_7CF9E, 0
		xor	eax, eax
		mov	dword_7CF9F, eax
		mov	dword_7CFA3, eax
		mov	byte_7CFAB, 1

loc_51089:
		mov	[bp+var_3A], 100h
		mov	eax, [bp+var_3A]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	dword_7976E, eax
		sub	dword_7CECD, eax
		mov	eax, dword_7CECD
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jnz	short loc_510D2
		mov	dword_7CED1, 100h

loc_510D2:
		cmp	word_79784, 0
		jz	short loc_510FD
		mov	al, byte_79782
		mov	ah, 0
		or	ax, ax
		jnz	short loc_510FD
		mov	ax, word_79784
		mov	[bp+var_44], ax
		movsx	eax, [bp+var_44]
		shl	eax, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	dword_7977E, eax

loc_510FD:
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, dword_7977E
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_50], eax
		mov	dword_7976A, eax
		mov	[bp+var_54], 300h
		cmp	eax, [bp+var_54]
		jge	short loc_51137
		mov	ax, 1
		jmp	short loc_51139

loc_51137:
		xor	ax, ax

loc_51139:
		or	al, al
		jz	short loc_5114D
		mov	[bp+var_58], 300h
		mov	eax, [bp+var_58]
		mov	dword_7976A, eax

loc_5114D:
		mov	[bp+var_5C], 1E00h
		mov	eax, dword_7976A
		cmp	eax, [bp+var_5C]
		jle	short loc_51164
		mov	ax, 1
		jmp	short loc_51166

loc_51164:
		xor	ax, ax

loc_51166:
		or	al, al
		jz	short loc_5117A
		mov	[bp+var_60], 1E00h
		mov	eax, [bp+var_60]
		mov	dword_7976A, eax

loc_5117A:
		mov	[bp+var_64], 100h
		mov	eax, [bp+var_64]
		mov	edx, eax
		mov	ecx, dword_7976A
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_6C], eax
		mov	dword_7976E, eax
		mov	eax, dword_7976A
		mov	dword_79778, eax
		mov	eax, dword_7976E
		mov	dword_79774, eax
		jmp	short loc_511C0

loc_511BB:
		mov	byte_7975D, 1

loc_511C0:
		mov	dword_7752F, 0
		pop	si
		leave
		retf
sub_50F18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_3F737 (sub_3F737 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_67F13 (sub_67F13 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; CachedObject_DestructHelper_5DE34 (seg141, tag 5DFEh). Référencée par sub_8F47A (même
; appelant que Stopwatch_RegisterTickModule_67611, seg207).
; ==============================================================================================
TextScrollDisplayB_TickHelper_511CC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	67B7h
		call	sub_1F336
		add	sp, 4
		pop	bp
		retf
TextScrollDisplayB_TickHelper_511CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_511DF		proc far

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
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= word ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 7Ah
		push	si
		push	di
		mov	dx, word_7CADA
		or	dx, dx
		jnz	short loc_511F2
		jmp	loc_51455

loc_511F2:
		cmp	byte_7978C, 0
		jnz	short loc_511FC
		jmp	loc_51455

loc_511FC:
		cmp	dword_7CFD5, 0
		jz	short loc_51209
		mov	ax, 1
		jmp	short loc_5120B

loc_51209:
		xor	ax, ax

loc_5120B:
		or	ax, ax
		jnz	short loc_51212
		jmp	loc_51455

loc_51212:
		mov	bx, dx
		les	bx, [bx+5Fh]
		mov	di, es:[bx+0Eh]
		or	di, di
		jnz	short loc_51222
		jmp	loc_51455

loc_51222:
		mov	si, di
		add	si, 12h
		mov	eax, [si]
		sub	eax, dword_7CA18
		mov	[bp+var_6E], eax
		mov	eax, [si+4]
		sub	eax, dword_7CA1C
		mov	[bp+var_6A], eax
		mov	eax, [si+8]
		sub	eax, dword_7CA20
		mov	[bp+var_66], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_5A], eax
		mov	ax, word_7977C
		mov	bx, 6
		xor	dx, dx
		div	bx
		mov	[bp+var_2], dx
		mov	ax, [bp+var_2]
		mov	word_7CFCF, ax
		push	62F4h
		lea	ax, word ptr [bp+var_62]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_5E]
		cmp	eax, dword_7CA04
		jle	short loc_512AF
		mov	ax, 1
		jmp	short loc_512B1

loc_512AF:
		xor	ax, ax

loc_512B1:
		or	al, al
		jnz	short loc_512B8
		jmp	loc_51455

loc_512B8:
		mov	[bp+var_6], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		mov	si, di
		add	si, 20h
		mov	eax, [bp+var_5E]
		sub	eax, [si]
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_12]
		jle	short loc_512EB
		mov	ax, 1
		jmp	short loc_512ED

loc_512EB:
		xor	ax, ax

loc_512ED:
		or	al, al
		jz	short loc_512F6
		lea	ax, word ptr [bp+var_A]
		jmp	short loc_512F9

loc_512F6:
		lea	ax, word ptr [bp+var_12]

loc_512F9:
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_16], eax
		mov	dword_7CB28, eax
		mov	eax, [bp+var_62]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_1E], eax
		mov	ax, word_7CA0C
		mov	[bp+var_20], ax
		push	large [bp+var_1E]
		push	large dword_7CA10
		push	large [bp+var_1A]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	edx, [bp+var_28]
		add	edx, eax
		mov	[bp+var_2C], edx
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		sar	eax, 8
		mov	[bp+var_34], eax
		cmp	[bp+var_34], 7D00h
		jle	short loc_51375
		mov	[bp+var_34], 7D00h
		jmp	short loc_51389

loc_51375:
		cmp	[bp+var_34], 0FFFF8300h
		jge	short loc_51389
		mov	[bp+var_34], 0FFFF8300h
		jmp	short loc_51389

loc_51389:
		mov	ax, word ptr [bp+var_34]
		dec	ax
		mov	word_7CFD1, ax
		mov	eax, [bp+var_5A]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_3C], eax
		mov	ax, word_7CA0E
		mov	[bp+var_3E], ax
		push	large [bp+var_3C]
		push	large dword_7CA14
		push	large [bp+var_38]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax
		movsx	eax, [bp+var_3E]
		shl	eax, 8
		sub	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	[bp+var_4E], eax
		sar	eax, 8
		mov	[bp+var_52], eax
		cmp	[bp+var_52], 7D00h
		jle	short loc_513F8
		mov	[bp+var_52], 7D00h
		jmp	short loc_5140C

loc_513F8:
		cmp	[bp+var_52], 0FFFF8300h
		jge	short loc_5140C
		mov	[bp+var_52], 0FFFF8300h
		jmp	short loc_5140C

loc_5140C:
		mov	ax, word ptr [bp+var_52]
		dec	ax
		mov	word_7CFD3, ax
		push	ds
		push	offset word_7CFCB
		call	sub_2BCFF
		add	sp, 4
		mov	word ptr [bp+var_56+2], dx
		mov	word ptr [bp+var_56], ax
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_5143C
		mov	ax, 1
		jmp	short loc_5143E

loc_5143C:
		xor	ax, ax

loc_5143E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_51455
		push	large [bp+var_56]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	short loc_51455

loc_51455:
		mov	byte_7978C, 1
		pop	di
		pop	si
		leave
		retf
sub_511DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5145E		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	large 0FFFFFFFFh
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		push	di
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		push	di
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		mov	al, [bp+arg_2]
		mov	[bp+var_B], al
		push	1
		push	0
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	al, [bp+var_B]
		mov	[si+4], al
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_A]
		mov	[si+6], eax
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		cmp	[bp+var_14], 0
		jz	short loc_5152A
		cmp	[bp+var_2], 5A4Ch
		jnz	short loc_51516
		push	dx
		push	ax
		push	large [di+4Dh]
		push	di
		call	sub_7553
		add	sp, 0Ah
		jmp	short loc_5152A

loc_51516:
		push	large 0FFFFFFFFh
		push	large [bp+var_6]
		push	large [bp+var_14]
		push	di
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh

loc_5152A:
		mov	dx, word ptr [bp+var_14+2]
		mov	ax, word ptr [bp+var_14]
		pop	di
		pop	si
		leave
		retf
sub_5145E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51534		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_6]
		push	large 0FFFFFFFFh
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		mov	al, [bp+arg_4]
		mov	[bp+var_B], al
		push	1
		push	0
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_10]
		mov	es:[bx], eax
		mov	al, [bp+var_B]
		mov	es:[bx+4], al
		mov	byte ptr es:[bx+5], 1
		mov	dword ptr es:[bx+6], 0
		mov	eax, [bp+var_A]
		mov	es:[bx+6], eax
		push	0
		mov	al, es:[bx+4]
		push	ax
		push	large es:[bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		cmp	[bp+var_14], 0
		jz	short loc_51606
		cmp	[bp+var_2], 5A4Ch
		jnz	short loc_515F2
		push	dx
		push	ax
		push	large [si+4Dh]
		push	si
		call	sub_7553
		add	sp, 0Ah
		jmp	short loc_51606

loc_515F2:
		push	large 0FFFFFFFFh
		push	large [bp+var_6]
		push	large [bp+var_14]
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh

loc_51606:
		mov	dx, word ptr [bp+var_14+2]
		mov	ax, word ptr [bp+var_14]
		pop	si
		leave
		retf
sub_51534		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_SetWidgetValue_50654 (sub_50654 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe fine transmettant 2 arguments + id widget 59CDh à sub_23241 (probable setter
; générique de valeur de widget).
; ==============================================================================================
UIScreen_SetWidgetValue_5160F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	67B7h
		call	sub_1F73E
		add	sp, 6
		pop	bp
		retf
UIScreen_SetWidgetValue_5160F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51625		proc far

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
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0A4h
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_7975E, eax
		mov	[bp+var_8], 100h
		mov	eax, [bp+var_8]
		mov	dword_79762, eax
		mov	[bp+var_C], 347h
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	dword_79766, eax
		mov	[bp+var_18], 0F00h
		mov	eax, [bp+var_18]
		mov	dword_7976A, eax
		mov	[bp+var_1C], 0F00h
		mov	[bp+var_20], 100h
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, [bp+var_1C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		shl	eax, 8
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		sar	eax, 8
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	dword_7976E, eax
		mov	[bp+var_3C], 100h
		mov	[bp+var_40], 0F00h
		mov	[bp+var_44], 100h
		mov	eax, [bp+var_44]
		mov	edx, eax
		mov	ecx, [bp+var_40]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		shl	eax, 8
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		sar	eax, 8
		mov	[bp+var_58], eax
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	dword_79774, eax
		mov	[bp+var_64], 100h
		mov	[bp+var_68], 0F00h
		mov	[bp+var_6C], 100h
		mov	eax, [bp+var_6C]
		mov	edx, eax
		mov	ecx, [bp+var_68]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		shl	eax, 8
		mov	[bp+var_78], eax
		mov	[bp+var_7C], eax
		sar	eax, 8
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	eax, [bp+var_64]
		mov	edx, [bp+var_84]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_8C], eax
		mov	[bp+var_90], 100h
		mov	eax, [bp+var_90]
		mov	edx, eax
		mov	ecx, [bp+var_8C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	dword_79778, eax
		mov	[bp+var_98], 100h
		mov	eax, [bp+var_98]
		mov	dword_7977E, eax
		mov	[bp+var_9C], 0
		mov	eax, [bp+var_9C]
		mov	dword_7CEC8, eax
		mov	dword_7CECD, 0
		mov	dword_7CED1, 0
		mov	word_7CED5, 0
		push	67ADh
		call	sub_1E1BB
		pop	cx
		push	67B7h
		call	sub_73773
		pop	cx
		push	ds
		push	offset unk_7CEFE
		call	sub_73305
		add	sp, 4
		push	687Ch
		call	Collision_InstallExceptionHandler
		pop	cx
		push	687Ch
		call	Collision_ResetLinkPool
		pop	cx
		mov	word_7CFB2, 909h
		xor	ax, ax
		mov	word_7CFB6, ax
		mov	word_7CFB4, ax
		mov	word_7CFB2, 1222h
		push	6882h
		call	LightSet_Init_29665
		pop	cx
		mov	word_7CFCB, 107Ch
		push	ds
		push	offset word_7CFCB
		call	sub_23ED5
		add	sp, 4
		mov	word_7CFCB, 132Ah
		mov	dword_7CFD5, 0
		mov	byte_7CFD9, 2
		mov	byte_7CFDA, 0
		mov	dword_7CFDB, 0
		mov	word_7CFCF, 0
		push	68B3h
		call	String_ConstructEmpty
		pop	cx
		mov	[bp+var_A0], 347h
		mov	eax, [bp+var_A0]
		mov	dword_7979B, eax
		mov	dword_7979F, 73C00h
		mov	[bp+var_A4], 1F1h
		mov	eax, [bp+var_A4]
		mov	dword_797A3, eax
		mov	dword_797A7, 15700h
		leave
		retf
sub_51625		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_518F0		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	byte_7CFDA, 0
		jz	short loc_51924
		cmp	dword_7CFD5, 0
		jz	short loc_51924
		push	0
		mov	al, byte_7CFD9
		push	ax
		mov	eax, dword_7CFD5
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_51924

loc_51924:
		mov	dword_7CFD5, 0
		mov	byte_7CFDA, 0
		mov	dword_7CFDB, 0
		push	2
		push	6882h
		call	Collection_Destruct
		add	sp, 4
		push	687Ch
		call	sub_41F06
		pop	cx
		push	ds
		push	offset unk_7CEFE
		call	sub_7330A
		add	sp, 4
		cmp	byte_7CF09, 0
		jz	short loc_5198B
		cmp	dword_7CF04, 0
		jz	short loc_5198B
		push	0
		mov	al, byte_7CF08
		push	ax
		mov	eax, dword_7CF04
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5198B

loc_5198B:
		mov	dword_7CF04, 0
		mov	byte_7CF09, 0
		mov	dword_7CF0A, 0
		push	2
		push	67B7h
		call	sub_73782
		add	sp, 4
sub_518F0		endp

; START OF FUNCTION CHUNK FOR sub_518F0
		db 6Ah
; END OF FUNCTION CHUNK FOR sub_518F0
seg123		ends
