seg109		segment	para public 'CODE' use16
		assume cs:seg109
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43CF1		proc far
		push	bp
		mov	bp, sp
		mov	al, 19h
		pop	bp
		retf
sub_43CF1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43CF8		proc far

var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
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
var_6C		= dword ptr -6Ch
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= word ptr -54h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_33		= word ptr -33h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0DAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_7D152, 0
		jz	short loc_43D10

loc_43D0B:
		mov	al, 0
		jmp	loc_441A8

loc_43D10:
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_86], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_82], eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	[bp+var_7E], eax
		lea	ax, word ptr [bp+var_86]
		mov	[bp+var_8], ax
		cmp	word ptr [si+52h], 0
		jnz	short loc_43D52
		jmp	loc_44197

loc_43D52:
		mov	di, [si+52h]
		add	di, 12h
		mov	ax, [si+52h]
		add	ax, 12h
		mov	[bp+var_16], ax
		mov	bx, [bp+var_16]
		mov	eax, dword_7CFBF
		sub	eax, [bx]
		mov	[bp+var_92], eax
		mov	eax, dword_7CFC3
		sub	eax, [bx+4]
		mov	[bp+var_8E], eax
		mov	eax, dword_7CFC7
		sub	eax, [bx+8]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_72], eax
		mov	ax, di
		add	ax, 8
		mov	[bp+var_18], ax
		mov	bx, [bp+var_18]
		mov	eax, dword_7CFC7
		sub	eax, [bx]
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		push	large [bp+var_72]
		push	large [bp+var_76]
		push	large [bp+var_7A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, [bp+var_28]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		call	Math_AsinDeg_567D3
		add	sp, 6
		mov	ax, [bp+var_33]
		mov	[bp+var_2], ax
		mov	[bp+var_3A], ax
		movsx	eax, [bp+var_3A]
		shl	eax, 8
		mov	[bp+var_3E], eax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_38]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		cmp	[bp+var_38], 0
		jz	short loc_43E63
		mov	ax, 1
		jmp	short loc_43E65

loc_43E63:
		xor	ax, ax

loc_43E65:
		or	al, al
		jz	short loc_43E91
		mov	eax, [di+8]
		mov	edx, eax
		mov	ecx, [bp+var_38]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_46], eax
		mov	[bp+var_6], eax
		jmp	short loc_43E98

loc_43E91:
		mov	byte ptr [si+54h], 1
		jmp	loc_441A1

loc_43E98:
		push	1
		push	[bp+var_8]
		push	di
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_4A]
		mov	[bp+var_A2], eax
		mov	bx, [si+52h]
		mov	al, [bx+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_43ECD
		mov	ax, 1
		jmp	short loc_43ECF

loc_43ECD:
		xor	ax, ax

loc_43ECF:
		or	al, al
		jz	short loc_43F28
		mov	bx, [si+52h]
		mov	bx, [bx+52h]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_43F28
		mov	ax, [si+52h]
		add	ax, 12h
		mov	word ptr [bp+var_6C+2], ax
		mov	bx, word ptr [bp+var_6C+2]
		mov	eax, [bx]
		mov	[bp+var_DA], eax
		mov	eax, [bx+4]
		mov	[bp+var_D6], eax
		mov	eax, [bx+8]
		mov	[bp+var_D2], eax
		push	word ptr [si+52h]
		push	ss
		lea	ax, word ptr [bp+var_6E]
		push	ax
		call	Aircraft_GroundClearance_3DF89
		add	sp, 6
		mov	eax, [bp+var_6E]
		sub	[bp+var_D2], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_A2], eax

loc_43F28:
		cmp	dword ptr [di+8], 0
		jz	short loc_43F34
		mov	ax, 1
		jmp	short loc_43F36

loc_43F34:
		xor	ax, ax

loc_43F36:
		or	al, al
		jnz	short loc_43F3D
		jmp	loc_43E91

loc_43F3D:
		mov	eax, [di+8]
		sub	eax, [bp+var_A2]
		mov	[bp+var_4E], eax
		mov	[bp+var_52], eax
		mov	ax, di
		add	ax, 8
		mov	[bp+var_54], ax
		mov	eax, [bp+var_52]
		mov	edx, eax
		mov	bx, [bp+var_54]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_6]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 7D000h
		jle	short loc_43F9D
		mov	ax, 1
		jmp	short loc_43F9F

loc_43F9D:
		xor	ax, ax

loc_43F9F:
		or	al, al
		jz	short loc_43FA6
		jmp	loc_43E91

loc_43FA6:
		mov	byte ptr [si+54h], 0
		jmp	short loc_43FAF
		jmp	loc_43E91

loc_43FAF:
		lea	ax, word ptr [bp+var_7A]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_7A]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_76]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_76], eax
		mov	eax, [bp+var_72]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_72], eax
		mov	eax, [di]
		sub	eax, [bp+var_7A]
		mov	[bp+var_B6], eax
		mov	eax, [di+4]
		sub	eax, [bp+var_76]
		mov	[bp+var_B2], eax
		mov	eax, [di+8]
		sub	eax, [bp+var_72]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_C2]
		mov	[si+12h], eax
		mov	eax, [bp+var_BE]
		mov	[si+16h], eax
		mov	eax, [bp+var_BA]
		mov	[si+1Ah], eax
		push	word ptr [si+52h]
		push	ss
		lea	ax, word ptr [bp+var_CE]
		push	ax
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_CE]
		add	[si+12h], eax
		mov	eax, [bp+var_CA]
		add	[si+16h], eax
		mov	eax, [bp+var_C6]
		add	[si+1Ah], eax
		push	1
		push	[bp+var_8]
		mov	ax, [si+52h]
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_60]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_60]
		mov	[si+1Ah], eax
		mov	bx, [si+52h]
		mov	al, [bx+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_440BD
		mov	ax, 1
		jmp	short loc_440BF

loc_440BD:
		xor	ax, ax

loc_440BF:
		or	al, al
		jz	short loc_44111
		mov	bx, [si+52h]
		mov	bx, [bx+52h]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_44111
		mov	di, [si+52h]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_DA], eax
		mov	eax, [di+4]
		mov	[bp+var_D6], eax
		mov	eax, [di+8]
		mov	[bp+var_D2], eax
		push	word ptr [si+52h]
		push	ss
		lea	ax, word ptr [bp+var_6C]
		push	ax
		call	Aircraft_GroundClearance_3DF89
		add	sp, 6
		mov	eax, [bp+var_6C]
		sub	[bp+var_D2], eax
		mov	eax, [bp+var_D2]
		mov	[si+1Ah], eax

loc_44111:
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_62], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	di, ax
		mov	ax, [bp+var_62]
		mov	[bp+var_64], ax
		mov	bx, [bp+var_64]
		mov	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+4]
		mov	[di+4], eax
		mov	eax, [bx+8]
		mov	[di+8], eax
		mov	ax, [bp+var_62]
		add	ax, 0Ch
		mov	[bp+var_66], ax
		mov	bx, [bp+var_66]
		mov	eax, [bx]
		mov	[di+0Ch], eax
		mov	eax, [bx+4]
		mov	[di+10h], eax
		mov	eax, [bx+8]
		mov	[di+14h], eax
		mov	ax, [bp+var_62]
		add	ax, 18h
		mov	[bp+var_68], ax
		mov	bx, [bp+var_68]
		mov	eax, [bx]
		mov	[di+18h], eax
		mov	eax, [bx+4]
		mov	[di+1Ch], eax
		mov	eax, [bx+8]
		mov	[di+20h], eax
		push	di
		nop
		push	cs
		call	near ptr sub_441AC
		pop	cx
		jmp	short loc_441A1

loc_44197:
		push	si
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx
		jmp	loc_43D0B

loc_441A1:
		push	si
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx

loc_441A8:
		pop	di
		pop	si
		leave
		retf
sub_43CF8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_441AC		proc far

var_22C		= dword ptr -22Ch
var_228		= dword ptr -228h
var_224		= dword ptr -224h
var_220		= dword ptr -220h
var_21C		= dword ptr -21Ch
var_218		= dword ptr -218h
var_214		= dword ptr -214h
var_210		= dword ptr -210h
var_20C		= dword ptr -20Ch
var_208		= dword ptr -208h
var_204		= dword ptr -204h
var_200		= dword ptr -200h
var_1FC		= dword ptr -1FCh
var_1F8		= dword ptr -1F8h
var_1F4		= dword ptr -1F4h
var_1F0		= dword ptr -1F0h
var_1EC		= dword ptr -1ECh
var_1E8		= dword ptr -1E8h
var_1E4		= dword ptr -1E4h
var_1E0		= dword ptr -1E0h
var_1DC		= dword ptr -1DCh
var_1D8		= dword ptr -1D8h
var_1D4		= dword ptr -1D4h
var_1D0		= dword ptr -1D0h
var_1CC		= dword ptr -1CCh
var_1C8		= dword ptr -1C8h
var_1C4		= dword ptr -1C4h
var_1C0		= dword ptr -1C0h
var_1BC		= dword ptr -1BCh
var_1B8		= dword ptr -1B8h
var_1B4		= dword ptr -1B4h
var_1B0		= dword ptr -1B0h
var_1AC		= dword ptr -1ACh
var_1A8		= dword ptr -1A8h
var_1A4		= dword ptr -1A4h
var_1A0		= dword ptr -1A0h
var_19C		= dword ptr -19Ch
var_198		= dword ptr -198h
var_194		= dword ptr -194h
var_190		= dword ptr -190h
var_18C		= dword ptr -18Ch
var_188		= dword ptr -188h
var_184		= dword ptr -184h
var_180		= dword ptr -180h
var_17C		= dword ptr -17Ch
var_178		= dword ptr -178h
var_174		= dword ptr -174h
var_170		= dword ptr -170h
var_16C		= dword ptr -16Ch
var_168		= dword ptr -168h
var_164		= dword ptr -164h
var_160		= dword ptr -160h
var_15C		= dword ptr -15Ch
var_158		= dword ptr -158h
var_154		= dword ptr -154h
var_150		= dword ptr -150h
var_14C		= dword ptr -14Ch
var_148		= dword ptr -148h
var_144		= dword ptr -144h
var_140		= dword ptr -140h
var_13C		= dword ptr -13Ch
var_138		= dword ptr -138h
var_134		= dword ptr -134h
var_130		= dword ptr -130h
var_12C		= dword ptr -12Ch
var_128		= dword ptr -128h
var_124		= dword ptr -124h
var_120		= dword ptr -120h
var_11C		= dword ptr -11Ch
var_118		= dword ptr -118h
var_114		= dword ptr -114h
var_110		= dword ptr -110h
var_10C		= dword ptr -10Ch
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
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
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 22Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_208], 0
		mov	[bp+var_204], 0
		mov	[bp+var_4], 0FFFFFF00h
		mov	eax, [bp+var_4]
		mov	[bp+var_200], eax
		lea	ax, word ptr [bp+var_208]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		push	si
		lea	ax, word ptr [bp+var_208]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_208]
		mov	edx, [bp+var_208]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	[bp+var_214], eax
		mov	eax, [bp+var_208]
		mov	edx, [bp+var_204]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	[bp+var_210], eax
		mov	eax, [bp+var_208]
		mov	edx, [bp+var_200]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	[bp+var_20C], eax
		mov	eax, [bp+var_204]
		mov	edx, [bp+var_208]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	[bp+var_220], eax
		mov	eax, [bp+var_204]
		mov	edx, [bp+var_204]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	[bp+var_21C], eax
		mov	eax, [bp+var_204]
		mov	edx, [bp+var_200]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	[bp+var_218], eax
		mov	eax, [bp+var_200]
		mov	edx, [bp+var_208]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	[bp+var_22C], eax
		mov	eax, [bp+var_200]
		mov	edx, [bp+var_204]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	[bp+var_228], eax
		mov	eax, [bp+var_200]
		mov	edx, [bp+var_200]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	[bp+var_224], eax
		mov	eax, 100h
		sub	eax, [bp+var_214]
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	[bp+var_214], eax
		mov	eax, [bp+var_210]
		neg	eax
		mov	[bp+var_58], eax
		mov	[bp+var_5C], eax
		mov	[bp+var_210], eax
		mov	eax, [bp+var_20C]
		neg	eax
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		mov	[bp+var_20C], eax
		mov	eax, [bp+var_220]
		neg	eax
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax
		mov	[bp+var_220], eax
		mov	eax, 100h
		sub	eax, [bp+var_21C]
		mov	[bp+var_70], eax
		mov	[bp+var_74], eax
		mov	[bp+var_21C], eax
		mov	eax, [bp+var_218]
		neg	eax
		mov	[bp+var_78], eax
		mov	[bp+var_7C], eax
		mov	[bp+var_218], eax
		mov	eax, [bp+var_22C]
		neg	eax
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	[bp+var_22C], eax
		mov	eax, [bp+var_228]
		neg	eax
		mov	[bp+var_88], eax
		mov	[bp+var_8C], eax
		mov	[bp+var_228], eax
		mov	eax, 100h
		sub	eax, [bp+var_224]
		mov	[bp+var_90], eax
		mov	[bp+var_94], eax
		mov	[bp+var_224], eax
		mov	di, si
		mov	eax, [bp+var_214]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	di, si
		add	di, 0Ch
		mov	eax, [bp+var_210]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_9C]
		add	eax, [bp+var_A4]
		mov	[bp+var_A8], eax
		mov	[bp+var_AC], eax
		mov	di, si
		add	di, 18h
		mov	eax, [bp+var_20C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_AC]
		add	eax, [bp+var_B4]
		mov	[bp+var_B8], eax
		mov	[bp+var_BC], eax
		mov	[si], eax
		mov	di, si
		add	di, 4
		mov	eax, [bp+var_214]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C0], eax
		mov	eax, [bp+var_C0]
		mov	[bp+var_C4], eax
		mov	di, si
		add	di, 10h
		mov	eax, [bp+var_210]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_C8]
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_C4]
		add	eax, [bp+var_CC]
		mov	[bp+var_D0], eax
		mov	[bp+var_D4], eax
		mov	di, si
		add	di, 1Ch
		mov	eax, [bp+var_20C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_D4]
		add	eax, [bp+var_DC]
		mov	[bp+var_E0], eax
		mov	[bp+var_E4], eax
		mov	[si+4], eax
		mov	di, si
		add	di, 8
		mov	eax, [bp+var_214]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_E8]
		mov	[bp+var_EC], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_210]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_F0]
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_EC]
		add	eax, [bp+var_F4]
		mov	[bp+var_F8], eax
		mov	[bp+var_FC], eax
		mov	di, si
		add	di, 20h
		mov	eax, [bp+var_20C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_100], eax
		mov	eax, [bp+var_100]
		mov	[bp+var_104], eax
		mov	eax, [bp+var_FC]
		add	eax, [bp+var_104]
		mov	[bp+var_108], eax
		mov	[bp+var_10C], eax
		mov	[si+8], eax
		mov	di, si
		mov	eax, [bp+var_220]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_110], eax
		mov	eax, [bp+var_110]
		mov	[bp+var_114], eax
		mov	di, si
		add	di, 0Ch
		mov	eax, [bp+var_21C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_118], eax
		mov	eax, [bp+var_118]
		mov	[bp+var_11C], eax
		mov	eax, [bp+var_114]
		add	eax, [bp+var_11C]
		mov	[bp+var_120], eax
		mov	[bp+var_124], eax
		mov	di, si
		add	di, 18h
		mov	eax, [bp+var_218]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_128], eax
		mov	eax, [bp+var_128]
		mov	[bp+var_12C], eax
		mov	eax, [bp+var_124]
		add	eax, [bp+var_12C]
		mov	[bp+var_130], eax
		mov	[bp+var_134], eax
		mov	[si+0Ch], eax
		mov	di, si
		add	di, 4
		mov	eax, [bp+var_220]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_138], eax
		mov	eax, [bp+var_138]
		mov	[bp+var_13C], eax
		mov	di, si
		add	di, 10h
		mov	eax, [bp+var_21C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_140], eax
		mov	eax, [bp+var_140]
		mov	[bp+var_144], eax
		mov	eax, [bp+var_13C]
		add	eax, [bp+var_144]
		mov	[bp+var_148], eax
		mov	[bp+var_14C], eax
		mov	di, si
		add	di, 1Ch
		mov	eax, [bp+var_218]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_150], eax
		mov	eax, [bp+var_150]
		mov	[bp+var_154], eax
		mov	eax, [bp+var_14C]
		add	eax, [bp+var_154]
		mov	[bp+var_158], eax
		mov	[bp+var_15C], eax
		mov	[si+10h], eax
		mov	di, si
		add	di, 8
		mov	eax, [bp+var_220]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_160], eax
		mov	eax, [bp+var_160]
		mov	[bp+var_164], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_21C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_168], eax
		mov	eax, [bp+var_168]
		mov	[bp+var_16C], eax
		mov	eax, [bp+var_164]
		add	eax, [bp+var_16C]
		mov	[bp+var_170], eax
		mov	[bp+var_174], eax
		mov	di, si
		add	di, 20h
		mov	eax, [bp+var_218]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_178], eax
		mov	eax, [bp+var_178]
		mov	[bp+var_17C], eax
		mov	eax, [bp+var_174]
		add	eax, [bp+var_17C]
		mov	[bp+var_180], eax
		mov	[bp+var_184], eax
		mov	[si+14h], eax
		mov	di, si
		mov	eax, [bp+var_22C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_188], eax
		mov	eax, [bp+var_188]
		mov	[bp+var_18C], eax
		mov	di, si
		add	di, 0Ch
		mov	eax, [bp+var_228]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_190], eax
		mov	eax, [bp+var_190]
		mov	[bp+var_194], eax
		mov	eax, [bp+var_18C]
		add	eax, [bp+var_194]
		mov	[bp+var_198], eax
		mov	[bp+var_19C], eax
		mov	di, si
		add	di, 18h
		mov	eax, [bp+var_224]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1A0], eax
		mov	eax, [bp+var_1A0]
		mov	[bp+var_1A4], eax
		mov	eax, [bp+var_19C]
		add	eax, [bp+var_1A4]
		mov	[bp+var_1A8], eax
		mov	[bp+var_1AC], eax
		mov	[si+18h], eax
		mov	di, si
		add	di, 4
		mov	eax, [bp+var_22C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1B0], eax
		mov	eax, [bp+var_1B0]
		mov	[bp+var_1B4], eax
		mov	di, si
		add	di, 10h
		mov	eax, [bp+var_228]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1B8], eax
		mov	eax, [bp+var_1B8]
		mov	[bp+var_1BC], eax
		mov	eax, [bp+var_1B4]
		add	eax, [bp+var_1BC]
		mov	[bp+var_1C0], eax
		mov	[bp+var_1C4], eax
		mov	di, si
		add	di, 1Ch
		mov	eax, [bp+var_224]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C8], eax
		mov	eax, [bp+var_1C8]
		mov	[bp+var_1CC], eax
		mov	eax, [bp+var_1C4]
		add	eax, [bp+var_1CC]
		mov	[bp+var_1D0], eax
		mov	[bp+var_1D4], eax
		mov	[si+1Ch], eax
		mov	di, si
		add	di, 8
		mov	eax, [bp+var_22C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1D8], eax
		mov	eax, [bp+var_1D8]
		mov	[bp+var_1DC], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_228]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E0], eax
		mov	eax, [bp+var_1E0]
		mov	[bp+var_1E4], eax
		mov	eax, [bp+var_1DC]
		add	eax, [bp+var_1E4]
		mov	[bp+var_1E8], eax
		mov	[bp+var_1EC], eax
		mov	di, si
		add	di, 20h
		mov	eax, [bp+var_224]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1F0], eax
		mov	eax, [bp+var_1F0]
		mov	[bp+var_1F4], eax
		mov	eax, [bp+var_1EC]
		add	eax, [bp+var_1F4]
		mov	[bp+var_1F8], eax
		mov	[bp+var_1FC], eax
		mov	[si+20h], eax
		pop	di
		pop	si
		leave
		retf
sub_441AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4494C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_4497E
		mov	al, [si+54h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4497E
		mov	al, byte_7D152
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4497E
		push	[bp+arg_2]
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6

loc_4497E:
		pop	si
		pop	bp
sub_4494C		endp
seg109		ends
