seg034		segment	para public 'CODE' use16
		assume cs:seg034
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17BE3		proc far

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
var_102		= word ptr -102h
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
var_D8		= word ptr -0D8h
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= word ptr -0CEh
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= word ptr -0B0h
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= word ptr -0A6h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= word ptr -88h
var_86		= dword ptr -86h
var_82		= word ptr -82h
var_80		= dword ptr -80h
var_7C		= word ptr -7Ch
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_74		= dword ptr -74h
var_72		= dword ptr -72h
var_70		= dword ptr -70h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_56		= dword ptr -56h
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
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si]
		mov	ax, [bx+1Eh]
		mov	[bp+var_2], ax
		push	ax
		mov	bx, [bp+var_2]
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	di, ax
		cmp	word ptr [di+24h], 0
		jnz	short loc_17C53
		mov	[si+2], di
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_11E]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_11E]
		mov	[si+44h], eax
		mov	eax, [bp+var_11A]
		mov	[si+48h], eax
		mov	eax, [bp+var_116]
		mov	[si+4Ch], eax
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[si+4], eax
		mov	eax, [bx+4]
		mov	[si+8], eax
		jmp	short loc_17C9D

loc_17C53:
		mov	ax, [di+24h]
		mov	[si+2], ax
		push	di
		push	ss
		lea	ax, word ptr [bp+var_12A]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_12A]
		mov	[si+44h], eax
		mov	eax, [bp+var_126]
		mov	[si+48h], eax
		mov	eax, [bp+var_122]
		mov	[si+4Ch], eax
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[si+4], eax
		mov	eax, [bx+4]
		mov	[si+8], eax

loc_17C9D:
		mov	eax, [bx+8]
		mov	[si+0Ch], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		push	di
		push	ss
		lea	ax, word ptr [bp+var_136]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_136]
		mov	[si+44h], eax
		mov	eax, [bp+var_132]
		mov	[si+48h], eax
		mov	eax, [bp+var_12E]
		mov	[si+4Ch], eax
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[si+4], eax
		mov	eax, [bx+4]
		mov	[si+8], eax
		mov	eax, [bx+8]
		mov	[si+0Ch], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	di, si
		add	di, 44h
		mov	eax, [di]
		mov	[bp+var_142], eax
		mov	eax, [di+4]
		mov	[bp+var_13E], eax
		mov	eax, [di+8]
		mov	[bp+var_13A], eax
		mov	ax, si
		add	ax, 10h
		push	ax
		lea	ax, word ptr [bp+var_142]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		push	3
		push	large 100h
		lea	ax, word ptr [bp+var_142]
		push	ax
		call	sub_57677
		add	sp, 8
		mov	eax, [bp+var_13E]
		cmp	eax, dword_77B0E
		jl	short loc_17D75
		mov	ax, 1
		jmp	short loc_17D77

loc_17D75:
		xor	ax, ax

loc_17D77:
		or	al, al
		jnz	short loc_17D7E
		jmp	loc_17E2B

loc_17D7E:
		mov	di, [bp+var_2]
		add	di, 0Ch
		push	large [bp+var_13E]
		push	large [di]
		push	large [bp+var_142]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		sar	eax, 8
		mov	[bp+var_50], eax
		mov	bx, [bp+var_2]
		mov	ax, [bx+8]
		mov	word ptr [bp+var_5C+2], ax
		movsx	eax, word ptr [bp+var_5C+2]
		shl	eax, 8
		mov	edx, [bp+var_50]
		add	edx, eax
		mov	[bp+var_5E], edx
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		mov	ax, word ptr [bp+var_62+1]
		mov	[si+50h], ax
		mov	di, [bp+var_2]
		add	di, 10h
		push	large [bp+var_13E]
		push	large [di]
		push	large [bp+var_13A]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_66], eax
		mov	[bp+var_6A], eax
		sar	eax, 8
		mov	[bp+var_50], eax
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ah]
		mov	word ptr [bp+var_6E+2], ax
		movsx	eax, word ptr [bp+var_6E+2]
		shl	eax, 8
		sub	eax, [bp+var_50]
		mov	[bp+var_70], eax
		mov	[bp+var_74], eax
		mov	ax, word ptr [bp+var_74+1]
		jmp	loc_17ED5

loc_17E2B:
		mov	di, [bp+var_2]
		add	di, 0Ch
		push	large dword_77B0E
		push	large [di]
		push	large [bp+var_142]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		sar	eax, 8
		mov	[bp+var_50], eax
		mov	bx, [bp+var_2]
		mov	ax, [bx+8]
		mov	word ptr [bp+var_5C+2], ax
		movsx	eax, word ptr [bp+var_5C+2]
		shl	eax, 8
		mov	edx, [bp+var_50]
		add	edx, eax
		mov	[bp+var_5E], edx
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		mov	ax, word ptr [bp+var_62+1]
		mov	[si+50h], ax
		mov	di, [bp+var_2]
		add	di, 10h
		push	large dword_77B0E
		push	large [di]
		push	large [bp+var_13A]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_66], eax
		mov	[bp+var_6A], eax
		sar	eax, 8
		mov	[bp+var_50], eax
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Ah]
		mov	word ptr [bp+var_6E+2], ax
		movsx	eax, word ptr [bp+var_6E+2]
		shl	eax, 8
		sub	eax, [bp+var_50]
		mov	[bp+var_70], eax
		mov	[bp+var_74], eax
		mov	ax, word ptr [bp+var_74+1]

loc_17ED5:
		mov	[si+52h], ax
		mov	bx, [si+2]
		mov	eax, [bx+1Ah]
		mov	[si+3Ch], eax
		push	[bp+var_2]
		call	Camera_TransformPoint
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	edx, [si+3Ch]
		sub	edx, eax
		mov	[bp+var_10], edx
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	[si+40h], eax
		mov	bx, [si+2]
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+95h]
		mov	[si+38h], eax
		mov	bx, [si+2]
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+99h]
		mov	[si+34h], eax
		mov	bx, [si+2]
		mov	ax, [bx+61h]
		mov	dx, [bx+5Fh]
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	al, es:[bx+0Dh]
		mov	[si+60h], al
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, bx, 13h
		add	dx, bx
		mov	[si+93h], ax
		mov	[si+91h], dx
		mov	bx, [bp+var_18]
		mov	ax, es:[bx+0Eh]
		mov	[bp+var_1A], ax
		push	ax
		mov	ax, si
		add	ax, 5Ch
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	word ptr [si+5Ch], 0
		jnz	short loc_17F96
		jmp	loc_184EC

loc_17F96:
		mov	di, [si+5Ch]
		add	di, 12h
		mov	ax, [bp+var_2]
		add	ax, 14h
		mov	[bp+var_1C], ax
		mov	eax, [di]
		mov	bx, [bp+var_1C]
		sub	eax, [bx]
		mov	[bp+var_14E], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_14A], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_146], eax
		mov	eax, [bp+var_14E]
		mov	[bp+var_15A], eax
		mov	eax, [bp+var_14A]
		mov	[bp+var_156], eax
		mov	eax, [bp+var_146]
		mov	[bp+var_152], eax
		mov	eax, [bp+var_15A]
		mov	[si+61h], eax
		mov	eax, [bp+var_156]
		mov	[si+65h], eax
		mov	eax, [bp+var_152]
		mov	[si+69h], eax
		mov	di, si
		add	di, 61h
		mov	eax, [di]
		mov	[si+6Dh], eax
		mov	eax, [di+4]
		mov	[si+71h], eax
		mov	eax, [di+8]
		mov	[si+75h], eax
		mov	ax, [bp+var_2]
		add	ax, 20h
		push	ax
		mov	ax, si
		add	ax, 6Dh
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, dword_77B0E
		mov	[bp+var_50], eax
		mov	di, si
		add	di, 6Dh
		mov	eax, [di]
		mov	[si+79h], eax
		mov	eax, [di+4]
		mov	[si+7Dh], eax
		mov	eax, [di+8]
		mov	[si+81h], eax
		push	3
		push	large 100h
		mov	ax, si
		add	ax, 79h
		push	ax
		call	sub_57677
		add	sp, 8
		mov	eax, [si+7Dh]
		cmp	eax, [bp+var_50]
		jl	short loc_18081
		mov	ax, 1
		jmp	short loc_18083

loc_18081:
		xor	ax, ax

loc_18083:
		or	al, al
		jnz	short loc_1808A
		jmp	loc_181F9

loc_1808A:
		mov	di, [bp+var_2]
		mov	ax, si
		add	ax, 79h
		mov	word ptr [bp+var_54+2], ax
		mov	bx, word ptr [bp+var_54+2]
		mov	eax, [bx]
		mov	[bp+var_56], eax
		mov	ax, si
		add	ax, 7Dh
		mov	word ptr [bp+var_58], ax
		mov	bx, word ptr [bp+var_58]
		mov	eax, [bx]
		mov	[bp+var_5C], eax
		mov	ax, [di+8]
		mov	word ptr [bp+var_5E], ax
		add	di, 0Ch
		push	large [bp+var_5C]
		push	large [di]
		push	large [bp+var_56]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_62], eax
		mov	[bp+var_66], eax
		sar	eax, 8
		mov	[bp+var_6A], eax
		shl	eax, 8
		mov	[bp+var_6E], eax
		movsx	eax, word ptr [bp+var_5E]
		shl	eax, 8
		mov	edx, [bp+var_6E]
		add	edx, eax
		mov	[bp+var_72], edx
		mov	eax, [bp+var_72]
		mov	[bp+var_76], eax
		sar	eax, 8
		mov	[bp+var_7A], eax
		cmp	[bp+var_7A], 7D00h
		jle	short loc_18121
		mov	[bp+var_7A], 7D00h
		jmp	short loc_18135

loc_18121:
		cmp	[bp+var_7A], 0FFFF8300h
		jge	short loc_18135
		mov	[bp+var_7A], 0FFFF8300h
		jmp	short loc_18135

loc_18135:
		mov	ax, word ptr [bp+var_7A]
		mov	[si+85h], ax
		mov	di, [bp+var_2]
		mov	ax, si
		add	ax, 81h
		mov	[bp+var_7C], ax
		mov	bx, [bp+var_7C]
		mov	eax, [bx]
		mov	[bp+var_80], eax
		mov	ax, si
		add	ax, 7Dh
		mov	[bp+var_82], ax
		mov	bx, [bp+var_82]
		mov	eax, [bx]
		mov	[bp+var_86], eax
		mov	ax, [di+0Ah]
		mov	[bp+var_88], ax
		add	di, 10h
		push	large [bp+var_86]
		push	large [di]
		push	large [bp+var_80]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax
		sar	eax, 8
		mov	[bp+var_94], eax
		shl	eax, 8
		mov	[bp+var_98], eax
		movsx	eax, [bp+var_88]
		shl	eax, 8
		sub	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	[bp+var_A0], eax
		sar	eax, 8
		mov	[bp+var_A4], eax
		cmp	[bp+var_A4], 7D00h
		jle	short loc_181DC
		mov	[bp+var_A4], 7D00h
		jmp	short loc_181F2

loc_181DC:
		cmp	[bp+var_A4], 0FFFF8300h
		jge	short loc_181F2
		mov	[bp+var_A4], 0FFFF8300h
		jmp	short loc_181F2

loc_181F2:
		mov	ax, word ptr [bp+var_A4]
		jmp	loc_18369

loc_181F9:
		mov	di, [bp+var_2]
		mov	ax, si
		add	ax, 79h
		mov	[bp+var_A6], ax
		mov	bx, [bp+var_A6]
		mov	eax, [bx]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_AE], eax
		mov	ax, [di+8]
		mov	[bp+var_B0], ax
		add	di, 0Ch
		push	large [bp+var_AE]
		push	large [di]
		push	large [bp+var_AA]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_B4], eax
		mov	[bp+var_B8], eax
		sar	eax, 8
		mov	[bp+var_BC], eax
		shl	eax, 8
		mov	[bp+var_C0], eax
		movsx	eax, [bp+var_B0]
		shl	eax, 8
		mov	edx, [bp+var_C0]
		add	edx, eax
		mov	[bp+var_C4], edx
		mov	eax, [bp+var_C4]
		mov	[bp+var_C8], eax
		sar	eax, 8
		mov	[bp+var_CC], eax
		cmp	[bp+var_CC], 7D00h
		jle	short loc_18299
		mov	[bp+var_CC], 7D00h
		jmp	short loc_182AF

loc_18299:
		cmp	[bp+var_CC], 0FFFF8300h
		jge	short loc_182AF
		mov	[bp+var_CC], 0FFFF8300h
		jmp	short loc_182AF

loc_182AF:
		mov	ax, word ptr [bp+var_CC]
		mov	[si+85h], ax
		mov	di, [bp+var_2]
		mov	ax, si
		add	ax, 81h
		mov	[bp+var_CE], ax
		mov	bx, [bp+var_CE]
		mov	eax, [bx]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_D6], eax
		mov	ax, [di+0Ah]
		mov	[bp+var_D8], ax
		add	di, 10h
		push	large [bp+var_D6]
		push	large [di]
		push	large [bp+var_D2]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_DC], eax
		mov	[bp+var_E0], eax
		sar	eax, 8
		mov	[bp+var_E4], eax
		shl	eax, 8
		mov	[bp+var_E8], eax
		movsx	eax, [bp+var_D8]
		shl	eax, 8
		sub	eax, [bp+var_E8]
		mov	[bp+var_EC], eax
		mov	[bp+var_F0], eax
		sar	eax, 8
		mov	[bp+var_F4], eax
		cmp	[bp+var_F4], 7D00h
		jle	short loc_1834F
		mov	[bp+var_F4], 7D00h
		jmp	short loc_18365

loc_1834F:
		cmp	[bp+var_F4], 0FFFF8300h
		jge	short loc_18365
		mov	[bp+var_F4], 0FFFF8300h
		jmp	short loc_18365

loc_18365:
		mov	ax, word ptr [bp+var_F4]

loc_18369:
		mov	[si+87h], ax
		mov	di, si
		add	di, 61h
		mov	eax, [di]
		mov	[bp+var_166], eax
		mov	eax, [di+4]
		mov	[bp+var_162], eax
		mov	eax, [di+8]
		mov	[bp+var_15E], eax
		lea	ax, word ptr [bp+var_166]
		push	ax
		call	Vector_Normalize3D_57796
		pop	cx
		push	word ptr [si+5Ch]
		push	ss
		lea	ax, word ptr [bp+var_172]
		push	ax
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		lea	ax, word ptr [bp+var_166]
		push	ax
		lea	ax, word ptr [bp+var_172]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_17E]
		push	ax
		call	Targeting_ComputeGeometryHelperB_56FBA
		add	sp, 8
		mov	eax, [bp+var_17E]
		mov	[bp+var_172], eax
		mov	eax, [bp+var_17A]
		mov	[bp+var_16E], eax
		mov	eax, [bp+var_176]
		mov	[bp+var_16A], eax
		lea	ax, word ptr [bp+var_166]
		push	ax
		mov	ax, si
		add	ax, 44h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18A]
		push	ax
		call	Targeting_ComputeGeometryHelperB_56FBA
		add	sp, 8
		mov	eax, [bp+var_18A]
		sub	[bp+var_172], eax
		mov	eax, [bp+var_186]
		sub	[bp+var_16E], eax
		mov	eax, [bp+var_182]
		sub	[bp+var_16A], eax
		push	large [bp+var_16A]
		push	large [bp+var_16E]
		push	large [bp+var_172]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_F8], eax
		mov	[bp+var_FC], eax
		mov	ax, word ptr [bp+var_FC+1]
		mov	[si+89h], ax
		lea	ax, word ptr [bp+var_166]
		push	ax
		lea	ax, word ptr [bp+var_172]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_100]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		cmp	[bp+var_100], 0
		jle	short loc_1846A
		mov	ax, 1
		jmp	short loc_1846C

loc_1846A:
		xor	ax, ax

loc_1846C:
		or	al, al
		jz	short loc_1847A
		mov	ax, [si+89h]
		neg	ax
		mov	[si+89h], ax

loc_1847A:
		mov	ax, [si+89h]
		mov	[bp+var_102], ax
		movsx	eax, [bp+var_102]
		mov	edx, dword_797A3
		imul	edx, eax
		mov	[bp+var_106], edx
		mov	eax, [bp+var_106]
		mov	[bp+var_10A], eax
		mov	ax, word ptr [bp+var_10A+1]
		mov	[si+89h], ax
		push	large [si+69h]
		push	large [si+65h]
		push	large [si+61h]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10E], eax
		mov	[bp+var_112], eax
		mov	[si+8Bh], eax
		mov	eax, [si+8Bh]
		mov	edx, eax
		mov	ecx, dword_7979F
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+8Bh], eax

loc_184EC:
		push	large [si+91h]
		mov	bx, [si+2]
		push	large [bx+5Fh]
		call	sub_3F17A
		add	sp, 8
		mov	[si+8Fh], ax
		mov	ax, si
		add	ax, 44h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[si+54h], eax
		mov	di, si
		add	di, 3Ch
		mov	eax, [di]
		mov	[bp+var_24], eax
		mov	eax, dword_797A7
		add	eax, 0FFFED800h
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		mov	eax, [bp+var_24]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	ebx, 2AF8h
		cdq
		idiv	ebx
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	eax, dword_797A7
		sub	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	[bp+var_28], eax
		mov	eax, [si+54h]
		mov	edx, eax
		mov	ecx, [bp+var_28]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	[si+58h], eax
		pop	di
		pop	si
		leave
		retf
sub_17BE3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_185A6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+2]
sub_185A6		endp
seg034		ends
