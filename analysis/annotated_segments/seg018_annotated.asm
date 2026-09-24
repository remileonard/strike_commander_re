seg018		segment	byte public 'CODE' use16
		assume cs:seg018
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,896L — projette une position 3D dans l'espace de vue (sub_58768, sub_5804C=produit
; scalaire), calcule des coordonnées 2D avec clipping (dword_6E9A6) : candidat très fort pour
; la routine de projection 3D→écran du radar/HUD — trop volumineuse pour une passe rapide, à
; disséquer en détail plus tard.
; ==============================================================================================
Radar_Project3DToScreen	proc far		; CODE XREF: seg015:06A1P seg015:0ABBP
					; DATA XREF: ...

var_184		= dword	ptr -184h
var_180		= dword	ptr -180h
var_17C		= dword	ptr -17Ch
var_178		= dword	ptr -178h
var_174		= dword	ptr -174h
var_170		= dword	ptr -170h
var_16C		= dword	ptr -16Ch
var_168		= dword	ptr -168h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_15C		= dword	ptr -15Ch
var_158		= dword	ptr -158h
var_154		= dword	ptr -154h
var_150		= dword	ptr -150h
var_14C		= dword	ptr -14Ch
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= dword	ptr -140h
var_13C		= dword	ptr -13Ch
var_138		= dword	ptr -138h
var_134		= dword	ptr -134h
var_130		= dword	ptr -130h
var_12C		= dword	ptr -12Ch
var_128		= dword	ptr -128h
var_124		= dword	ptr -124h
var_120		= dword	ptr -120h
var_11C		= dword	ptr -11Ch
var_118		= dword	ptr -118h
var_114		= word ptr -114h
var_112		= dword	ptr -112h
var_10E		= dword	ptr -10Eh
var_10A		= dword	ptr -10Ah
var_106		= dword	ptr -106h
var_102		= dword	ptr -102h
var_FE		= dword	ptr -0FEh
var_FA		= dword	ptr -0FAh
var_F6		= dword	ptr -0F6h
var_F2		= word ptr -0F2h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= word ptr -0E8h
var_E6		= dword	ptr -0E6h
var_E2		= dword	ptr -0E2h
var_DE		= dword	ptr -0DEh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= word ptr -0D2h
var_D0		= word ptr -0D0h
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= word ptr -0C6h
var_C4		= word ptr -0C4h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= word ptr -0AEh
var_AC		= dword	ptr -0ACh
var_A8		= word ptr -0A8h
var_A6		= dword	ptr -0A6h
var_A2		= word ptr -0A2h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_88		= dword	ptr -88h
var_84		= word ptr -84h
var_82		= dword	ptr -82h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 184h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si]
		mov	di, [bx+1Eh]
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	[si+2],	ax
		push	word ptr [si+2]
		push	ss
		lea	ax, [bp+var_130]
		push	ax
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_130]
		mov	[si+44h], eax
		mov	eax, [bp+var_12C]
		mov	[si+48h], eax
		mov	eax, [bp+var_128]
		mov	[si+4Ch], eax
		mov	ax, [si+2]
		add	ax, 12h
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[si+4],	eax
		mov	eax, [bx+4]
		mov	[si+8],	eax
		mov	eax, [bx+8]
		mov	[si+0Ch], eax
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	ax, si
		add	ax, 44h	; 'D'
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[bp+var_13C], eax
		mov	eax, [bx+4]

loc_16A28:
		mov	[bp+var_138], eax
		mov	eax, [bx+8]

loc_16A31:
		mov	[bp+var_134], eax
		mov	ax, si
		add	ax, 10h
		push	ax
		lea	ax, [bp+var_13C]
		push	ax
		call	Math_ApplyRotationHelperA_58768

loc_16A46:
		add	sp, 4
		lea	ax, [bp+var_13C]
		push	ax

loc_16A4E:
		call	UI_ApplyVectorLength_55B04
		pop	cx
		mov	eax, [bp+var_138]
		cmp	eax, dword_6E9A6
		jl	short loc_16A65
		mov	ax, 1
		jmp	short loc_16A67
; ���������������������������������������������������������������������������

loc_16A65:				; CODE XREF: Radar_Project3DToScreen+D6j
		xor	ax, ax

loc_16A67:				; CODE XREF: Radar_Project3DToScreen+DBj
		or	al, al
		jz	short loc_16AD4
		mov	ax, di
		add	ax, 0Ch
		mov	[bp+var_6], ax
		push	large [bp+var_138]
		mov	bx, [bp+var_6]
		push	large dword ptr	[bx]
		push	large [bp+var_13C]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	ax, [di+8]
		add	ax, word ptr [bp+var_E+1]
		mov	[si+50h], ax
		mov	ax, di
		add	ax, 10h
		mov	[bp+var_10], ax
		push	large [bp+var_138]
		mov	bx, [bp+var_10]
		push	large dword ptr	[bx]
		push	large [bp+var_134]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	ax, [di+0Ah]
		sub	ax, word ptr [bp+var_18+1]
		jmp	short loc_16B3B
; ���������������������������������������������������������������������������

loc_16AD4:				; CODE XREF: Radar_Project3DToScreen+E1j
		mov	ax, di
		add	ax, 0Ch
		mov	[bp+var_1A], ax
		push	large [dword_6E9A6]
		mov	bx, [bp+var_1A]
		push	large dword ptr	[bx]
		push	large [bp+var_13C]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	ax, [di+8]
		add	ax, word ptr [bp+var_22+1]
		mov	[si+50h], ax
		mov	ax, di
		add	ax, 10h
		mov	[bp+var_24], ax
		push	large [dword_6E9A6]
		mov	bx, [bp+var_24]
		push	large dword ptr	[bx]
		push	large [bp+var_134]

loc_16B21:
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch

loc_16B2D:
		mov	[bp+var_28], eax

loc_16B31:
		mov	[bp+var_2C], eax
		mov	ax, [di+0Ah]
		sub	ax, word ptr [bp+var_2C+1]

loc_16B3B:				; CODE XREF: Radar_Project3DToScreen+14Aj
		mov	[si+52h], ax
		mov	bx, [si+2]

loc_16B41:
		mov	eax, [bx+1Ah]
		mov	[si+3Ch], eax
		push	di

loc_16B4A:
		call	Camera_TransformPoint
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_30], eax
		shl	eax, 8
		mov	edx, [si+3Ch]
		sub	edx, eax
		mov	[bp+var_34], edx
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	[si+40h], eax
		mov	bx, [si+2]
		push	word ptr [bx+51h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+78h]
		mov	[si+38h], eax
		mov	bx, [si+2]
		push	word ptr [bx+51h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+7Ch]
		mov	[si+34h], eax
		mov	bx, [si+2]
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		mov	word ptr [bp+var_3C+2],	ax
		mov	word ptr [bp+var_3C], dx
		les	bx, [bp+var_3C]
		mov	al, es:[bx+0Ch]
		mov	[si+60h], al
		mov	al, es:[bx+0Bh]
		mov	[si+96h], al
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, 12h
		add	dx, bx
		mov	[si+93h], ax
		mov	[si+91h], dx
		cmp	dword ptr [si+91h], 0
		jz	short loc_16C00
		les	bx, [si+91h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_16BFA
		les	bx, es:[bx]
		mov	al, es:[bx+4Dh]
		jmp	short loc_16BFC
; ���������������������������������������������������������������������������

loc_16BFA:				; CODE XREF: Radar_Project3DToScreen+267j
		mov	al, 8

loc_16BFC:				; CODE XREF: Radar_Project3DToScreen+270j
		mov	[si+95h], al

loc_16C00:				; CODE XREF: Radar_Project3DToScreen+25Cj
		les	bx, [bp+var_3C]
		mov	ax, es:[bx+0Dh]
		mov	[bp+var_3E], ax
		push	ax
		mov	ax, si
		add	ax, 5Ch	; '\'
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	word ptr [si+5Ch], 0
		jnz	short loc_16C22
		jmp	loc_17175
; ���������������������������������������������������������������������������

loc_16C22:				; CODE XREF: Radar_Project3DToScreen+295j
		mov	ax, [si+5Ch]
		add	ax, 12h
		mov	[bp+var_40], ax
		mov	ax, di
		add	ax, 14h
		mov	[bp+var_42], ax

loc_16C33:
		mov	bx, [bp+var_40]
		mov	eax, [bx]
		mov	bx, [bp+var_42]
		sub	eax, [bx]
		mov	[bp+var_148], eax
		mov	bx, [bp+var_40]

loc_16C47:
		mov	eax, [bx+4]
		mov	bx, [bp+var_42]
		sub	eax, [bx+4]
		mov	[bp+var_144], eax
		mov	bx, [bp+var_40]
		mov	eax, [bx+8]
		mov	bx, [bp+var_42]
		sub	eax, [bx+8]
		mov	[bp+var_140], eax
		mov	eax, [bp+var_148]
		mov	[bp+var_154], eax
		mov	eax, [bp+var_144]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_140]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_154]
		mov	[si+61h], eax
		mov	eax, [bp+var_150]
		mov	[si+65h], eax
		mov	eax, [bp+var_14C]
		mov	[si+69h], eax
		mov	ax, si
		add	ax, 61h	; 'a'
		mov	[bp+var_44], ax
		mov	bx, [bp+var_44]
		mov	eax, [bx]
		mov	[si+6Dh], eax
		mov	eax, [bx+4]
		mov	[si+71h], eax
		mov	eax, [bx+8]
		mov	[si+75h], eax
		mov	ax, di
		add	ax, 20h	; ' '
		push	ax
		mov	ax, si
		add	ax, 6Dh	; 'm'
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		mov	eax, dword_6E9A6
		mov	[bp+var_78], eax
		mov	ax, si
		add	ax, 6Dh	; 'm'
		mov	[bp+var_7A], ax
		mov	bx, [bp+var_7A]
		mov	eax, [bx]
		mov	[si+79h], eax
		mov	eax, [bx+4]
		mov	[si+7Dh], eax
		mov	eax, [bx+8]
		mov	[si+81h], eax
		mov	ax, si
		add	ax, 79h	; 'y'
		push	ax
		call	UI_ApplyVectorLength_55B04
		pop	cx
		mov	eax, [si+7Dh]
		cmp	eax, [bp+var_78]
		jl	short loc_16D1F
		mov	ax, 1
		jmp	short loc_16D21
; ���������������������������������������������������������������������������

loc_16D1F:				; CODE XREF: Radar_Project3DToScreen+390j
		xor	ax, ax

loc_16D21:				; CODE XREF: Radar_Project3DToScreen+395j
		or	al, al
		jnz	short loc_16D28
		jmp	loc_16E98
; ���������������������������������������������������������������������������

loc_16D28:				; CODE XREF: Radar_Project3DToScreen+39Bj
		mov	[bp+var_7C], di
		mov	ax, si
		add	ax, 79h	; 'y'
		mov	[bp+var_7E], ax
		mov	bx, [bp+var_7E]
		mov	eax, [bx]
		mov	[bp+var_82], eax
		mov	ax, si
		add	ax, 7Dh	; '}'

loc_16D43:
		mov	[bp+var_84], ax

loc_16D47:
		mov	bx, [bp+var_84]
		mov	eax, [bx]

loc_16D4E:
		mov	[bp+var_88], eax
		mov	bx, [bp+var_7C]

loc_16D56:
		mov	ax, [bx+8]
		mov	[bp+var_8A], ax
		mov	ax, [bp+var_7C]
		add	ax, 0Ch
		mov	[bp+var_8C], ax
		push	large [bp+var_88]
		mov	bx, [bp+var_8C]
		push	large dword ptr	[bx]
		push	large [bp+var_82]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_90], eax
		mov	[bp+var_94], eax
		movsx	eax, [bp+var_8A]
		shl	eax, 8
		mov	edx, [bp+var_94]
		add	edx, eax
		mov	[bp+var_98], edx
		mov	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		sar	eax, 8
		mov	[bp+var_A0], eax
		cmp	[bp+var_A0], 7D00h
		jle	short loc_16DCE
		mov	[bp+var_A0], 7D00h
		jmp	short loc_16DE4
; ���������������������������������������������������������������������������

loc_16DCE:				; CODE XREF: Radar_Project3DToScreen+439j
		cmp	[bp+var_A0], 0FFFF8300h
		jge	short loc_16DE4
		mov	[bp+var_A0], 0FFFF8300h
		jmp	short $+2

loc_16DE4:				; CODE XREF: Radar_Project3DToScreen+444j
					; Radar_Project3DToScreen+44Fj
		mov	ax, word ptr [bp+var_A0]
		mov	[si+85h], ax
		mov	ax, si
		add	ax, 81h	; '�'
		mov	[bp+var_A2], ax
		mov	bx, [bp+var_A2]
		mov	eax, [bx]
		mov	[bp+var_A6], eax
		mov	ax, si
		add	ax, 7Dh	; '}'
		mov	[bp+var_A8], ax
		mov	bx, [bp+var_A8]
		mov	eax, [bx]
		mov	[bp+var_AC], eax
		mov	ax, [di+0Ah]
		mov	[bp+var_AE], ax
		add	di, 10h

loc_16E20:
		push	large [bp+var_AC]

loc_16E25:
		push	large dword ptr	[di]

loc_16E28:
		push	large [bp+var_A6]

loc_16E2D:
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax

loc_16E34:
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_B2], eax

loc_16E3E:
		mov	[bp+var_B6], eax

loc_16E43:
		movsx	eax, [bp+var_AE]
		shl	eax, 8
		sub	eax, [bp+var_B6]
		mov	[bp+var_BA], eax
		mov	[bp+var_BE], eax
		sar	eax, 8
		mov	[bp+var_C2], eax
		cmp	[bp+var_C2], 7D00h
		jle	short loc_16E7B
		mov	[bp+var_C2], 7D00h
		jmp	short loc_16E91
; ���������������������������������������������������������������������������

loc_16E7B:				; CODE XREF: Radar_Project3DToScreen+4E6j
		cmp	[bp+var_C2], 0FFFF8300h
		jge	short loc_16E91
		mov	[bp+var_C2], 0FFFF8300h
		jmp	short $+2

loc_16E91:				; CODE XREF: Radar_Project3DToScreen+4F1j
					; Radar_Project3DToScreen+4FCj
		mov	ax, word ptr [bp+var_C2]
		jmp	loc_16FF2
; ���������������������������������������������������������������������������

loc_16E98:				; CODE XREF: Radar_Project3DToScreen+39Dj
		mov	[bp+var_C4], di
		mov	ax, si
		add	ax, 79h	; 'y'
		mov	[bp+var_C6], ax
		mov	bx, [bp+var_C6]
		mov	eax, [bx]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_CE], eax
		mov	bx, [bp+var_C4]
		mov	ax, [bx+8]
		mov	[bp+var_D0], ax
		mov	ax, [bp+var_C4]
		add	ax, 0Ch
		mov	[bp+var_D2], ax
		push	large [bp+var_CE]
		mov	bx, [bp+var_D2]
		push	large dword ptr	[bx]
		push	large [bp+var_CA]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_D6], eax
		mov	[bp+var_DA], eax
		movsx	eax, [bp+var_D0]
		shl	eax, 8
		mov	edx, [bp+var_DA]
		add	edx, eax
		mov	[bp+var_DE], edx
		mov	eax, [bp+var_DE]
		mov	[bp+var_E2], eax
		sar	eax, 8
		mov	[bp+var_E6], eax

loc_16F21:
		cmp	[bp+var_E6], 7D00h
		jle	short loc_16F37
		mov	[bp+var_E6], 7D00h
		jmp	short loc_16F4D
; ���������������������������������������������������������������������������

loc_16F37:				; CODE XREF: Radar_Project3DToScreen+5A2j
		cmp	[bp+var_E6], 0FFFF8300h

loc_16F40:
		jge	short loc_16F4D
		mov	[bp+var_E6], 0FFFF8300h
		jmp	short $+2

loc_16F4D:				; CODE XREF: Radar_Project3DToScreen+5ADj
					; Radar_Project3DToScreen:loc_16F40j
		mov	ax, word ptr [bp+var_E6]
		mov	[si+85h], ax
		mov	ax, si
		add	ax, 81h	; '�'
		mov	[bp+var_E8], ax
		mov	bx, [bp+var_E8]
		mov	eax, [bx]
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_F0], eax
		mov	ax, [di+0Ah]
		mov	[bp+var_F2], ax
		add	di, 10h
		push	large [bp+var_F0]
		push	large dword ptr	[di]
		push	large [bp+var_EC]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_F6], eax
		mov	[bp+var_FA], eax
		movsx	eax, [bp+var_F2]
		shl	eax, 8
		sub	eax, [bp+var_FA]
		mov	[bp+var_FE], eax
		mov	[bp+var_102], eax
		sar	eax, 8
		mov	[bp+var_106], eax
		cmp	[bp+var_106], 7D00h
		jle	short loc_16FD8
		mov	[bp+var_106], 7D00h
		jmp	short loc_16FEE
; ���������������������������������������������������������������������������

loc_16FD8:				; CODE XREF: Radar_Project3DToScreen+643j
		cmp	[bp+var_106], 0FFFF8300h
		jge	short loc_16FEE
		mov	[bp+var_106], 0FFFF8300h
		jmp	short $+2

loc_16FEE:				; CODE XREF: Radar_Project3DToScreen+64Ej
					; Radar_Project3DToScreen+659j
		mov	ax, word ptr [bp+var_106]

loc_16FF2:				; CODE XREF: Radar_Project3DToScreen+50Dj
		mov	[si+87h], ax
		mov	di, si
		add	di, 61h	; 'a'
		mov	eax, [di]
		mov	[bp+var_160], eax
		mov	eax, [di+4]
		mov	[bp+var_15C], eax
		mov	eax, [di+8]
		mov	[bp+var_158], eax
		lea	ax, [bp+var_160]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx

loc_17020:
		push	word ptr [si+5Ch]
		push	ss
		lea	ax, [bp+var_16C]
		push	ax
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]

loc_17031:
		add	sp, 6

loc_17034:
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		push	ss
		lea	ax, [bp+var_178]

loc_17043:
		push	ax
		call	Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		mov	eax, [bp+var_178]

loc_17051:
		mov	[bp+var_16C], eax
		mov	eax, [bp+var_174]
		mov	[bp+var_168], eax
		mov	eax, [bp+var_170]
		mov	[bp+var_164], eax
		lea	ax, [bp+var_160]
		push	ax
		mov	ax, si
		add	ax, 44h	; 'D'
		push	ax
		push	ss
		lea	ax, [bp+var_184]
		push	ax
		call	Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		mov	eax, [bp+var_184]
		sub	[bp+var_16C], eax
		mov	eax, [bp+var_180]
		sub	[bp+var_168], eax
		mov	eax, [bp+var_17C]
		sub	[bp+var_164], eax
		push	large [bp+var_164]
		push	large [bp+var_168]
		push	large [bp+var_16C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10A], eax
		mov	[bp+var_10E], eax
		mov	ax, word ptr [bp+var_10E+1]
		mov	[si+89h], ax
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		push	ss
		lea	ax, [bp+var_112]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		cmp	[bp+var_112], 0
		jle	short loc_170F3
		mov	ax, 1
		jmp	short loc_170F5
; ���������������������������������������������������������������������������

loc_170F3:				; CODE XREF: Radar_Project3DToScreen+764j
		xor	ax, ax

loc_170F5:				; CODE XREF: Radar_Project3DToScreen+769j
		or	al, al
		jz	short loc_17103
		mov	ax, [si+89h]
		neg	ax
		mov	[si+89h], ax

loc_17103:				; CODE XREF: Radar_Project3DToScreen+76Fj
		mov	ax, [si+89h]
		mov	[bp+var_114], ax
		movsx	eax, [bp+var_114]
		mov	edx, dword_7048D
		imul	edx, eax
		mov	[bp+var_118], edx
		mov	eax, [bp+var_118]

loc_17124:
		mov	[bp+var_11C], eax
		mov	ax, word ptr [bp+var_11C+1]

loc_1712D:
		mov	[si+89h], ax

loc_17131:
		push	large dword ptr	[si+69h]

loc_17135:
		push	large dword ptr	[si+65h]

loc_17139:
		push	large dword ptr	[si+61h]

loc_1713D:
		call	Math_VectorLength3D_Raw_5828E

loc_17142:
		push	dx

loc_17143:
		push	ax

loc_17144:
		pop	eax

loc_17146:
		add	sp, 0Ch

loc_17149:
		mov	[bp+var_120], eax
		mov	[bp+var_124], eax
		mov	[si+8Bh], eax
		mov	eax, [si+8Bh]
		mov	edx, eax
		mov	ecx, dword_70489
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+8Bh], eax

loc_17175:				; CODE XREF: Radar_Project3DToScreen+297j
		push	large dword ptr	[si+91h]
		mov	bx, [si+2]
		push	large dword ptr	[bx+5Ah]
		call	WeaponStation_FindByTypeMask
		add	sp, 8
		mov	[si+8Fh], ax
		mov	ax, si
		add	ax, 44h	; 'D'
		push	ax
		push	ss
		lea	ax, [bp+var_48]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		mov	eax, [bp+var_48]
		mov	[si+54h], eax
		mov	di, si
		add	di, 3Ch	; '<'
		mov	eax, [di]
		mov	[bp+var_4C], eax
		mov	eax, dword_70491
		add	eax, 0FFFED800h
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		mov	eax, [bp+var_4C]
		mov	edx, [bp+var_58]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		mov	ebx, 2AF8h
		cdq
		idiv	ebx
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		mov	eax, dword_70491
		sub	eax, [bp+var_68]
		mov	[bp+var_6C], eax
		mov	[bp+var_50], eax
		mov	eax, [si+54h]
		mov	edx, eax
		mov	ecx, [bp+var_50]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		mov	[si+58h], eax
		pop	di
		pop	si
		leave
		retf
Radar_Project3DToScreen	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]

loc_17236:
		mov	bx, [si+2]
		mov	dx, [bx+5Ch]
		mov	ax, [bx+5Ah]

loc_1723F:
		pop	si

loc_17240:
		pop	bp
		retf
seg018		ends
