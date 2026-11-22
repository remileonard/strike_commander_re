seg070		segment	para public 'CODE' use16
		assume cs:seg070
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A850		proc far
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf
sub_2A850		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_DestructWithLabel (sub_2C954 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,71L —
; destructeur d'un widget (type 0x15B8) : libère le libellé texte associé (+8 via sub_5C7B6)
; si présent, réinitialise les champs, appelle le destructeur de base (sub_29036) :
; destructeur de widget avec libellé (bouton/élément de menu).
; ==============================================================================================
Widget_DestructWithLabel		proc far

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
		jnz	short loc_2A86B
		jmp	loc_2A8EC

loc_2A86B:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 11B4h
		cmp	byte ptr es:[bx+0Dh], 0
		jz	short loc_2A8A3
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_2A8A3
		push	0
		mov	al, es:[bx+0Ch]
		push	ax
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_2A8A3

loc_2A8A3:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_23D7C
		add	sp, 6
		test	si, 1
		jz	short loc_2A8EC
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_2A8EC:
		pop	si
		leave
		retf
Widget_DestructWithLabel		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A8EF		proc far
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf
sub_2A8EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A8F6		proc far

var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= word ptr -68h
var_50		= word ptr -50h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3F		= word ptr -3Fh
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
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 74h
		push	si
		mov	si, [bp+arg_4]
		lea	ax, [bp+var_68]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		push	si
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	sub_5720C
		add	sp, 6
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		mov	[bp+var_10], 0
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	si
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	sub_5711C
		add	sp, 6
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	Matrix_BuildFullOrientation_5937B
		add	sp, 8
		mov	eax, dword_7CA3C
		imul	eax, eax, 0FFFFFF9Ch
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	eax, dword_7CA40
		imul	eax, eax, 0FFFFFF9Ch
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	eax, dword_7CA44
		imul	eax, eax, 0FFFFFF9Ch
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_6C], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		lea	ax, [bp+var_68]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_38]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_3C]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_38]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_30], eax
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	Weapon_ComputeVectorLength_57F78
		pop	cx
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, [bp+var_40]
		push	ax
		call	Math_AcosDeg_5676B
		add	sp, 6
		mov	cx, [bp+var_3F]
		mov	[bp+var_44], 0
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_44]
		jge	short loc_2AA2A
		mov	ax, 1
		jmp	short loc_2AA2C

loc_2AA2A:
		xor	ax, ax

loc_2AA2C:
		or	al, al
		jz	short loc_2AA32
		neg	cx

loc_2AA32:
		mov	ax, 0B4h
		sub	ax, cx
		mov	cx, ax
		cmp	cx, 168h
		jl	short loc_2AA47
		mov	bx, 168h
		cwd
		idiv	bx
		mov	cx, dx

loc_2AA47:
		or	cx, cx
		jge	short loc_2AA4F
		add	cx, 168h

loc_2AA4F:
		cmp	cx, 0B4h
		jl	short loc_2AA59
		sub	cx, 168h

loc_2AA59:
		mov	ax, cx
		pop	si
		leave
		retf
sub_2A8F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2AA5E		proc far

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
var_122		= word ptr -122h
var_120		= word ptr -120h
var_11E		= dword ptr -11Eh
var_11A		= dword ptr -11Ah
var_116		= dword ptr -116h
var_112		= dword ptr -112h
var_10E		= dword ptr -10Eh
var_10A		= word ptr -10Ah
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= word ptr -0ECh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= word ptr -0CAh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= word ptr -0ACh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= word ptr -8Eh
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= word ptr -7Ch
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= word ptr -62h
var_60		= dword ptr -60h
var_5C		= word ptr -5Ch
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
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 15Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		cmp	dword ptr es:[bx+9], 0
		jnz	short loc_2AA7D
		jmp	loc_2B156

loc_2AA7D:
		mov	eax, es:[bx+4]
		mov	[bp+var_8], eax
		mov	si, es:[bx+2]
		add	si, 12h
		mov	eax, [si]
		sub	eax, dword_7CA18
		mov	[bp+var_142], eax
		mov	eax, [si+4]
		sub	eax, dword_7CA1C
		mov	[bp+var_13E], eax
		mov	eax, [si+8]
		sub	eax, dword_7CA20
		mov	[bp+var_13A], eax
		mov	eax, [bp+var_142]
		mov	[bp+var_14E], eax
		mov	eax, [bp+var_13E]
		mov	[bp+var_14A], eax
		mov	eax, [bp+var_13A]
		mov	[bp+var_146], eax
		mov	eax, [bp+var_14E]
		mov	[bp+var_136], eax
		mov	eax, [bp+var_14A]
		mov	[bp+var_132], eax
		mov	eax, [bp+var_146]
		mov	[bp+var_12E], eax
		push	eax
		push	large [bp+var_132]
		push	large [bp+var_136]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_136]
		mov	[bp+var_15A], eax
		mov	eax, [bp+var_132]
		mov	[bp+var_156], eax
		mov	eax, [bp+var_12E]
		mov	[bp+var_152], eax
		push	62F4h
		lea	ax, word ptr [bp+var_15A]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_156]
		cmp	eax, dword_77B0E
		jge	short loc_2AB55
		mov	ax, 1
		jmp	short loc_2AB57

loc_2AB55:
		xor	ax, ax

loc_2AB57:
		or	al, al
		jz	short loc_2AB5E
		jmp	loc_2B156

loc_2AB5E:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Dh]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, di
		add	si, 68h
		mov	eax, [bp+var_14]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	si, di
		add	si, 70h
		mov	eax, [bp+var_4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_22]
		add	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_152]
		cmp	eax, [bp+var_1A]
		jle	short loc_2ABD5
		mov	ax, 1
		jmp	short loc_2ABD7

loc_2ABD5:
		xor	ax, ax

loc_2ABD7:
		or	al, al
		jz	short loc_2ABDE
		jmp	loc_2B156

loc_2ABDE:
		mov	eax, [bp+var_152]
		neg	eax
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		cmp	eax, [bp+var_1A]
		jle	short loc_2ABF9
		mov	ax, 1
		jmp	short loc_2ABFB

loc_2ABF9:
		xor	ax, ax

loc_2ABFB:
		or	al, al
		jz	short loc_2AC02
		jmp	loc_2B156

loc_2AC02:
		mov	si, di
		add	si, 6Ch
		mov	eax, [bp+var_14]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	si, di
		add	si, 74h
		mov	eax, [bp+var_4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_42]
		add	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_15A]
		cmp	eax, [bp+var_3A]
		jle	short loc_2AC62
		mov	ax, 1
		jmp	short loc_2AC64

loc_2AC62:
		xor	ax, ax

loc_2AC64:
		or	al, al
		jz	short loc_2AC6B
		jmp	loc_2B156

loc_2AC6B:
		mov	eax, [bp+var_15A]
		neg	eax
		mov	[bp+var_52], eax
		mov	[bp+var_56], eax
		cmp	eax, [bp+var_3A]
		jle	short loc_2AC86
		mov	ax, 1
		jmp	short loc_2AC88

loc_2AC86:
		xor	ax, ax

loc_2AC88:
		or	al, al
		jz	short loc_2AC8F
		jmp	loc_2B156

loc_2AC8F:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Dh]
		mov	[bp+var_5C], ax
		movsx	eax, [bp+var_5C]
		shl	eax, 8
		mov	[bp+var_60], eax
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx+6]
		mov	[bp+var_62], ax
		movsx	eax, [bp+var_62]
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_66], edx
		mov	eax, [bp+var_66]
		mov	[bp+var_6A], eax
		push	eax
		push	large dword_7CA10
		push	large [bp+var_60]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_6E], eax
		mov	[bp+var_5A], eax
		shl	eax, 8
		mov	[bp+var_72], eax
		mov	[bp+var_76], eax
		mov	si, word ptr [bp+var_76+1]
		cmp	si, 4
		jge	short loc_2AD01
		mov	ax, 4
		jmp	short loc_2AD03

loc_2AD01:
		mov	ax, si

loc_2AD03:
		mov	si, ax
		cmp	si, 2000h
		jge	short loc_2AD0D
		jmp	short loc_2AD10

loc_2AD0D:
		mov	ax, 2000h

loc_2AD10:
		mov	si, ax
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx+14h]
		mov	[bp+var_7C], ax
		movsx	eax, [bp+var_7C]
		mov	edx, [bp+var_5A]
		imul	edx, eax
		mov	[bp+var_80], edx
		mov	eax, [bp+var_80]
		mov	[bp+var_84], eax
		sar	eax, 1
		mov	[bp+var_88], eax
		mov	[bp+var_7A], eax
		mov	ax, es:[bx+12h]
		mov	[bp+var_8E], ax
		movsx	eax, [bp+var_8E]
		mov	edx, [bp+var_5A]
		imul	edx, eax
		mov	[bp+var_92], edx
		mov	eax, [bp+var_92]
		mov	[bp+var_96], eax
		sar	eax, 1
		mov	[bp+var_9A], eax
		mov	[bp+var_8C], eax
		cmp	[bp+var_8C], 100h
		jle	short loc_2AD84
		mov	ax, 1
		jmp	short loc_2AD86

loc_2AD84:
		xor	ax, ax

loc_2AD86:
		or	al, al
		jnz	short loc_2ADA2
		cmp	[bp+var_7A], 100h
		jle	short loc_2AD99
		mov	ax, 1
		jmp	short loc_2AD9B

loc_2AD99:
		xor	ax, ax

loc_2AD9B:
		or	al, al
		jnz	short loc_2ADA2
		jmp	loc_2AF87

loc_2ADA2:
		mov	eax, [bp+var_15A]
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_156]
		mov	[bp+var_EA], eax
		mov	ax, word_7CA0C
		mov	[bp+var_EC], ax
		push	large [bp+var_EA]
		push	large dword_7CA10
		push	large [bp+var_E6]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_F0], eax
		mov	[bp+var_F4], eax
		movsx	eax, [bp+var_EC]
		shl	eax, 8
		mov	edx, [bp+var_F4]
		add	edx, eax
		mov	[bp+var_F8], edx
		mov	eax, [bp+var_F8]
		mov	[bp+var_FC], eax
		sar	eax, 8
		mov	[bp+var_100], eax
		cmp	[bp+var_100], 7D00h
		jle	short loc_2AE22
		mov	[bp+var_100], 7D00h
		jmp	short loc_2AE38

loc_2AE22:
		cmp	[bp+var_100], 0FFFF8300h
		jge	short loc_2AE38
		mov	[bp+var_100], 0FFFF8300h
		jmp	short loc_2AE38

loc_2AE38:
		mov	ax, word ptr [bp+var_100]
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+9]
		mov	es:[bx+6], ax
		mov	eax, [bp+var_152]
		mov	[bp+var_104], eax
		mov	eax, [bp+var_156]
		mov	[bp+var_108], eax
		mov	ax, word_7CA0E
		mov	[bp+var_10A], ax
		push	large [bp+var_108]
		push	large dword_7CA14
		push	large [bp+var_104]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10E], eax
		mov	[bp+var_112], eax
		movsx	eax, [bp+var_10A]
		shl	eax, 8
		sub	eax, [bp+var_112]
		mov	[bp+var_116], eax
		mov	[bp+var_11A], eax
		sar	eax, 8
		mov	[bp+var_11E], eax
		cmp	[bp+var_11E], 7D00h
		jle	short loc_2AEBF
		mov	[bp+var_11E], 7D00h
		jmp	short loc_2AED5

loc_2AEBF:
		cmp	[bp+var_11E], 0FFFF8300h
		jge	short loc_2AED5
		mov	[bp+var_11E], 0FFFF8300h
		jmp	short loc_2AED5

loc_2AED5:
		mov	ax, word ptr [bp+var_11E]
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+9]
		mov	es:[bx+8], ax
		mov	eax, [bp+var_4]
		mov	dword_7CB28, eax
		mov	[bp+var_120], si
		mov	ax, [bp+var_120]
		mov	es:[bx+18h], ax
		mov	word ptr es:[bx+1Ch], 0
		lea	ax, word ptr [bp+var_136]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2A8F6
		add	sp, 6
		mov	[bp+var_122], ax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+9]
		mov	es:[bx+1Ah], ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+9]
		les	bx, es:[bx+9]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	word ptr [bp+var_126+2], dx
		mov	word ptr [bp+var_126], ax
		cmp	[bp+var_126], 0
		jnz	short loc_2AF45
		jmp	loc_2B14E

loc_2AF45:
		mov	eax, [bp+var_126]
		mov	[bp+var_12A], eax
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_2AF66
		mov	ax, 1
		jmp	short loc_2AF68

loc_2AF66:
		xor	ax, ax

loc_2AF68:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2AF81
		push	large [bp+var_12A]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	loc_2B14E

loc_2AF81:
		jmp	loc_2B14E
		jmp	loc_2B14E

loc_2AF87:
		mov	eax, dword_7CC84
		mov	[bp+var_9E], eax
		shl	eax, 8
		cmp	eax, [bp+var_156]
		jl	short loc_2AFA0
		mov	ax, 1
		jmp	short loc_2AFA2

loc_2AFA0:
		xor	ax, ax

loc_2AFA2:
		or	al, al
		jnz	short loc_2AFA9
		jmp	loc_2B156

loc_2AFA9:
		mov	eax, [bp+var_4]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_A2]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+11h], eax
		mov	word ptr es:[bx+15h], 1Ah
		mov	eax, [bp+var_15A]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_AA], eax
		mov	ax, word_7CA0C
		mov	[bp+var_AC], ax
		push	large [bp+var_AA]
		push	large dword_7CA10
		push	large [bp+var_A6]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_B0], eax
		mov	[bp+var_B4], eax
		movsx	eax, [bp+var_AC]
		shl	eax, 8
		mov	edx, [bp+var_B4]
		add	edx, eax
		mov	[bp+var_B8], edx
		mov	eax, [bp+var_B8]
		mov	[bp+var_BC], eax
		sar	eax, 8
		mov	[bp+var_C0], eax
		cmp	[bp+var_C0], 7D00h
		jle	short loc_2B044
		mov	[bp+var_C0], 7D00h
		jmp	short loc_2B05A

loc_2B044:
		cmp	[bp+var_C0], 0FFFF8300h
		jge	short loc_2B05A
		mov	[bp+var_C0], 0FFFF8300h
		jmp	short loc_2B05A

loc_2B05A:
		mov	ax, word ptr [bp+var_C0]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+17h], ax
		mov	eax, [bp+var_152]
		mov	[bp+var_C4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_C8], eax
		mov	ax, word_7CA0E
		mov	[bp+var_CA], ax
		push	large [bp+var_C8]
		push	large dword_7CA14
		push	large [bp+var_C4]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_CE], eax
		mov	[bp+var_D2], eax
		movsx	eax, [bp+var_CA]
		shl	eax, 8
		sub	eax, [bp+var_D2]
		mov	[bp+var_D6], eax
		mov	[bp+var_DA], eax
		sar	eax, 8
		mov	[bp+var_DE], eax
		cmp	[bp+var_DE], 7D00h
		jle	short loc_2B0DC
		mov	[bp+var_DE], 7D00h
		jmp	short loc_2B0F2

loc_2B0DC:
		cmp	[bp+var_DE], 0FFFF8300h
		jge	short loc_2B0F2
		mov	[bp+var_DE], 0FFFF8300h
		jmp	short loc_2B0F2

loc_2B0F2:
		mov	ax, word ptr [bp+var_DE]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+19h], ax
		les	bx, es:[bx+4]
		mov	al, es:[bx+16h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Bh], al
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0Fh
		mov	word ptr [bp+var_E2+2], ax
		mov	word ptr [bp+var_E2], dx
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_2B134
		mov	ax, 1
		jmp	short loc_2B136

loc_2B134:
		xor	ax, ax

loc_2B136:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2B14E
		push	large [bp+var_E2]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	short loc_2B14E

loc_2B14E:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+8], 1

loc_2B156:
		pop	di
		pop	si
		leave
		retf
sub_2AA5E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B15A		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_2B15A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B161		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_A], ax
		push	1
		push	0
		push	2
		push	large 1Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		or	ax, dx
		jz	short loc_2B1D4
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 1100h
		push	dx
		push	bx
		call	Descriptor_Reset
		add	sp, 4
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 1382h
		mov	word ptr es:[bx+0Fh], 338h
		mov	word ptr es:[bx+0Fh], 1236h
		push	[bp+var_A]
		push	large [bp+var_8]
		push	[bp+var_C]
		push	bx
		nop
		push	cs
		call	near ptr sub_2B212
		add	sp, 0Ah
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		jmp	short loc_2B1DA

loc_2B1D4:
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]

loc_2B1DA:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
sub_2B161		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Descriptor_ConstructDefaultScale (sub_2D2A7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,14L — initialise une petite structure avec des
; valeurs par défaut 1:1 (+4/+6) : constructeur avec échelle par défaut 1:1.
; ==============================================================================================
Descriptor_ConstructDefaultScale		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		mov	ax, 1
		mov	es:[bx+4], ax
		mov	es:[bx+6], ax
		pop	bp
		retf
Descriptor_ConstructDefaultScale		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Descriptor_ResetSingleChild (sub_2D2C0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,18L — remet à zéro un pointeur (+9) et un
; compteur à 1 (+0xD) : reset d'un descripteur enfant unique.
; ==============================================================================================
Descriptor_ResetSingleChild		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+9], 0
		mov	word ptr es:[bx+0Dh], 1
		pop	bp
		retf
Descriptor_ResetSingleChild		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B212		proc far

var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	large [bp+arg_0]
		push	cs
		call	near ptr Descriptor_ResetSingleChild
		add	sp, 4
		push	[bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		call	Descriptor_Construct_23EB1
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+4]
		mov	ax, es:[bx+4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Dh], ax
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		add	dx, 8
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	1
		push	0
		push	2
		push	large 1Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		or	ax, dx
		jnz	short loc_2B27A
		jmp	loc_2B32C

loc_2B27A:
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 107Ch
		push	dx
		push	bx
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 132Ah
		mov	dword ptr es:[bx+0Ah], 0
		mov	byte ptr es:[bx+0Eh], 2
		mov	byte ptr es:[bx+0Fh], 0
		mov	dword ptr es:[bx+10h], 0
		mov	word ptr es:[bx+4], 0
		mov	word ptr es:[bx], 1352h
		mov	word ptr es:[bx+4], 0
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	al, es:[bx+4]
		mov	[bp+var_D], al
		les	bx, [bp+var_8]
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ah], eax
		mov	al, [bp+var_D]
		mov	es:[bx+0Eh], al
		mov	byte ptr es:[bx+0Fh], 0
		mov	dword ptr es:[bx+10h], 0
		les	bx, [bp+var_4]
		mov	eax, es:[bx+6]
		les	bx, [bp+var_8]
		mov	es:[bx+10h], eax
		les	bx, [bp+var_4]
		mov	al, es:[bx+4]
		push	ax
		push	large es:[bx]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, [bp+var_8]
		mov	es:[bx+14h], eax
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]
		jmp	short loc_2B332

loc_2B32C:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]

loc_2B332:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Bh], dx
		mov	es:[bx+9], ax
		cmp	dword ptr es:[bx+9], 0
		jnz	short loc_2B34E
		push	6004h
		call	sub_1DDFE
		pop	cx

loc_2B34E:
		leave
		retf
sub_2B212		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_DestructComposite (sub_2D3D4 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,65L —
; destructeur (type 0x189E) : notifie l'enfant référencé (+9, vtable[4]) avant de le libérer
; (sub_29115) : destructeur de widget composite avec notification de l'enfant.
; ==============================================================================================
Widget_DestructComposite		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_2B3C2
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1382h
		cmp	dword ptr es:[bx+9], 0
		jz	short loc_2B387
		push	3
		push	large es:[bx+9]
		les	bx, es:[bx+9]
		mov	bx, es:[bx]
		call	dword ptr [bx+2Ch]
		add	sp, 6
		jmp	short loc_2B387

loc_2B387:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+9], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_23E5B
		add	sp, 6
		test	si, 1
		jz	short loc_2B3C2
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_2B3C2:
		pop	si
		leave
		retf
Widget_DestructComposite		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B3C5		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_A], ax
		push	1
		push	0
		push	2
		push	large 1Eh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		or	ax, dx
		jz	short loc_2B43F
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 1100h
		push	dx
		push	bx
		call	Descriptor_Reset
		add	sp, 4
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 1382h
		mov	word ptr es:[bx+0Fh], 338h
		mov	word ptr es:[bx+0Fh], 1236h
		push	[bp+var_A]
		push	large [bp+var_8]
		push	[bp+var_C]
		push	bx
		push	cs
		call	near ptr sub_2B212
		add	sp, 0Ah
		les	bx, [bp+var_E]
		mov	word ptr es:[bx], 12FEh
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		jmp	short loc_2B445

loc_2B43F:
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]

loc_2B445:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
sub_2B3C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B44D		proc far
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
sub_2B44D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B454		proc far
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
sub_2B454		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B45B		proc far

var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= word ptr -0A0h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= word ptr -82h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= word ptr -64h
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
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0C0h
		push	si
		push	di
		mov	di, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+9], 0
		jnz	short loc_2B475
		jmp	loc_2B819

loc_2B475:
		mov	eax, es:[bx+4]
		mov	[bp+var_8], eax
		mov	si, es:[bx+2]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_B4], eax
		mov	eax, [si+4]
		mov	[bp+var_B0], eax
		mov	eax, [si+8]
		mov	[bp+var_AC], eax
		push	eax
		push	large [bp+var_B0]
		push	large [bp+var_B4]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_C0], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_B8], eax
		mov	ax, di
		add	ax, 20h
		push	ax
		lea	ax, word ptr [bp+var_C0]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		cmp	[bp+var_BC], 0
		jg	short loc_2B501
		mov	ax, 1
		jmp	short loc_2B503

loc_2B501:
		xor	ax, ax

loc_2B503:
		or	al, al
		jz	short loc_2B50A
		jmp	loc_2B819

loc_2B50A:
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx+4]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_1A], edx
		mov	eax, [bp+var_1A]
		mov	[bp+var_14], eax
		mov	si, di
		add	si, 68h
		mov	eax, [bp+var_14]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	si, di
		add	si, 70h
		mov	eax, [bp+var_4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_26]
		add	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_B8]
		cmp	eax, [bp+var_1E]
		jle	short loc_2B58D
		mov	ax, 1
		jmp	short loc_2B58F

loc_2B58D:
		xor	ax, ax

loc_2B58F:
		or	al, al
		jz	short loc_2B596
		jmp	loc_2B819

loc_2B596:
		mov	eax, [bp+var_B8]
		neg	eax
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		cmp	eax, [bp+var_1E]
		jle	short loc_2B5B1
		mov	ax, 1
		jmp	short loc_2B5B3

loc_2B5B1:
		xor	ax, ax

loc_2B5B3:
		or	al, al
		jz	short loc_2B5BA
		jmp	loc_2B819

loc_2B5BA:
		mov	si, di
		add	si, 6Ch
		mov	eax, [bp+var_14]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_46], eax
		mov	si, di
		add	si, 74h
		mov	eax, [bp+var_4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_46]
		add	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_C0]
		cmp	eax, [bp+var_3E]
		jle	short loc_2B61A
		mov	ax, 1
		jmp	short loc_2B61C

loc_2B61A:
		xor	ax, ax

loc_2B61C:
		or	al, al
		jz	short loc_2B623
		jmp	loc_2B819

loc_2B623:
		mov	eax, [bp+var_C0]
		neg	eax
		mov	[bp+var_56], eax
		mov	[bp+var_5A], eax
		cmp	eax, [bp+var_3E]
		jle	short loc_2B63E
		mov	ax, 1
		jmp	short loc_2B640

loc_2B63E:
		xor	ax, ax

loc_2B640:
		or	al, al
		jz	short loc_2B647
		jmp	loc_2B819

loc_2B647:
		mov	eax, [bp+var_C0]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_62], eax
		mov	ax, word_7CA0C
		mov	[bp+var_64], ax
		push	large [bp+var_62]
		push	large dword_7CA10
		push	large [bp+var_5E]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax
		movsx	eax, [bp+var_64]
		shl	eax, 8
		mov	edx, [bp+var_6C]
		add	edx, eax
		mov	[bp+var_70], edx
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		sar	eax, 8
		mov	[bp+var_78], eax
		cmp	[bp+var_78], 7D00h
		jle	short loc_2B6B8
		mov	[bp+var_78], 7D00h
		jmp	short loc_2B6CC

loc_2B6B8:
		cmp	[bp+var_78], 0FFFF8300h
		jge	short loc_2B6CC
		mov	[bp+var_78], 0FFFF8300h
		jmp	short loc_2B6CC

loc_2B6CC:
		mov	ax, word ptr [bp+var_78]
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+9]
		mov	es:[bx+6], ax
		mov	eax, [bp+var_B8]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_80], eax
		mov	ax, word_7CA0E
		mov	[bp+var_82], ax
		push	large [bp+var_80]
		push	large dword_7CA14
		push	large [bp+var_7C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_86], eax
		mov	[bp+var_8A], eax
		movsx	eax, [bp+var_82]
		shl	eax, 8
		sub	eax, [bp+var_8A]
		mov	[bp+var_8E], eax
		mov	[bp+var_92], eax
		sar	eax, 8
		mov	[bp+var_96], eax
		cmp	[bp+var_96], 7D00h
		jle	short loc_2B74E
		mov	[bp+var_96], 7D00h
		jmp	short loc_2B764

loc_2B74E:
		cmp	[bp+var_96], 0FFFF8300h
		jge	short loc_2B764
		mov	[bp+var_96], 0FFFF8300h
		jmp	short loc_2B764

loc_2B764:
		mov	ax, word ptr [bp+var_96]
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+9]
		mov	es:[bx+8], ax
		mov	eax, dword_7CC84
		mov	[bp+var_9A], eax
		shl	eax, 8
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_9E]
		mov	dword_7CB28, eax
		mov	word ptr es:[bx+18h], 0FFh
		mov	word ptr es:[bx+1Ch], 0
		lea	ax, word ptr [bp+var_B4]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2A8F6
		add	sp, 6
		mov	[bp+var_A0], ax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+9]
		mov	es:[bx+1Ah], ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+9]
		les	bx, es:[bx+9]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	word ptr [bp+var_A4+2], dx
		mov	word ptr [bp+var_A4], ax
		cmp	[bp+var_A4], 0
		jz	short loc_2B819
		mov	eax, [bp+var_A4]
		mov	[bp+var_A8], eax
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_2B7FF
		mov	ax, 1
		jmp	short loc_2B801

loc_2B7FF:
		xor	ax, ax

loc_2B801:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2B819
		push	large [bp+var_A8]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	short loc_2B819

loc_2B819:
		pop	di
		pop	si
		leave
		retf
sub_2B45B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B81D		proc far

arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_4]
		mov	es:[bx+1Dh], al
		pop	bp
		retf
sub_2B81D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B82C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+1Dh]
		pop	bp
		retf
sub_2B82C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B838		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_2B87A
		push	0
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Widget_DestructComposite
		add	sp, 6
		test	si, 1
		jz	short loc_2B87A
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_2B87A

loc_2B87A:
		pop	si
		leave
		retf
sub_2B838		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B87D		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2B87D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B882		proc far
		push	bp
		mov	bp, sp
		mov	eax, dword_7CB28
		sar	eax, 8
		shld	edx, eax, 10h
		pop	bp
		retf
sub_2B882		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B894		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_2B894		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B89B		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_2B89B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8A2		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_2B8A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8A9		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2B8A9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8AE		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2B8AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8B3		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_2B8B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8BA		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2B8BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8BF		proc far
		push	bp
		mov	bp, sp
		mov	eax, dword_7CB28
		sar	eax, 8
		shld	edx, eax, 10h
		pop	bp
		retf
sub_2B8BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8D1		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_2B8D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8D8		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_2B8D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8DF		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_2B8DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8E6		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2B8E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8EB		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_2B8EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8F2		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2B8F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B8F7		proc far

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
		jz	short loc_2B978
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+0Fh], 0
		jz	short loc_2B93B
		cmp	dword ptr es:[bx+0Ah], 0
		jz	short loc_2B93B
		push	0
		mov	al, es:[bx+0Eh]
		push	ax
		mov	eax, es:[bx+0Ah]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_2B93B

loc_2B93B:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+0Ah], 0
		mov	byte ptr es:[bx+0Fh], 0
		mov	dword ptr es:[bx+10h], 0
		test	si, 1
		jz	short loc_2B978
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
sub_2B8F7		endp

; START OF FUNCTION CHUNK FOR sub_2B8F7
		db 9Ah, 72h
; END OF FUNCTION CHUNK FOR sub_2B8F7
seg070		ends
