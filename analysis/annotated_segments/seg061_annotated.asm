seg061		segment	byte public 'CODE' use16
		assume cs:seg061
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_2C94D:				; DATA XREF: seg216:02AEo seg339:15C0o
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,71L — destructeur d'un widget (type 0x15B8) : libère le libellé texte associé (+8 via
; sub_5C7B6) si présent, réinitialise les champs, appelle le destructeur de base (sub_29036) :
; destructeur de widget avec libellé (bouton/élément de menu).
; ==============================================================================================
Widget_DestructWithLabel	proc far		; CODE XREF: seg062:loc_2D97DP
					; MissionText_ReleaseWidgetLabel_94B9E+17P
					; DATA XREF: ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_2C968
		jmp	loc_2C9E9
; ���������������������������������������������������������������������������

loc_2C968:				; CODE XREF: Widget_DestructWithLabel+Fj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 15B8h
		cmp	byte ptr es:[bx+0Dh], 0
		jz	short loc_2C9A0
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_2C9A0
		push	0

loc_2C981:
		mov	al, es:[bx+0Ch]
		push	ax
		mov	eax, es:[bx+8]

loc_2C98B:
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_2C9A0:				; CODE XREF: Widget_DestructWithLabel+21j
					; Widget_DestructWithLabel+29j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Object_DestructGeneric_29036
		add	sp, 6
		test	si, 1
		jz	short loc_2C9E9
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_2C9E9:				; CODE XREF: Widget_DestructWithLabel+11j
					; Widget_DestructWithLabel+78j
		pop	si
		leave
		retf
Widget_DestructWithLabel	endp

; ���������������������������������������������������������������������������

loc_2C9EC:				; DATA XREF: seg339:18C2o
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,175L — projette un point 3D de référence (globals dword_7222E/72232/72236, échelle
; ×-100) via sub_575B2/sub_552E1 pour ancrer un widget à l'écran : positionnement d'un widget
; UI ancré à une position 3D projetée (marqueur radar/waypoint).
; ==============================================================================================
Widget_AnchorTo3DPosition	proc far		; CODE XREF: seg061:06D0p seg061:0EE9p

var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= word ptr -68h
var_50		= word ptr -50h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 74h
		push	si
		mov	si, [bp+arg_4]
		lea	ax, [bp+var_68]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		push	si
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	AI_ComputeApproachAngles_553CF
		add	sp, 6
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		mov	[bp+var_10], 0
		lea	ax, [bp+var_10]

loc_2CA33:
		push	ax
		push	si
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	Math_ElevationAngle_552E1
		add	sp, 6
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	Matrix_BuildFullOrientation_575B2
		add	sp, 8
		mov	eax, dword_7222E
		imul	eax, -64h
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	eax, dword_72232
		imul	eax, -64h
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	eax, dword_72236
		imul	eax, -64h
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_74], eax

loc_2CA8A:
		mov	eax, [bp+var_24]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_6C], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		lea	ax, [bp+var_68]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	ss
		lea	ax, [bp+var_38]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp+var_38]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_30], eax
		lea	ax, [bp+var_34]
		push	ax
		call	Weapon_ComputeVectorLength_561AF
		pop	cx
		lea	ax, [bp+var_30]
		push	ax
		push	ss
		lea	ax, [bp+var_40]
		push	ax
		call	Math_AcosDeg_5493E
		add	sp, 6
		mov	cx, [bp+var_40+1]
		mov	[bp+var_44], 0
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_44]
		jge	short loc_2CB27
		mov	ax, 1

loc_2CB25:
		jmp	short loc_2CB29
; ���������������������������������������������������������������������������

loc_2CB27:				; CODE XREF: Widget_AnchorTo3DPosition+12Dj
		xor	ax, ax

loc_2CB29:				; CODE XREF: Widget_AnchorTo3DPosition:loc_2CB25j
		or	al, al
		jz	short loc_2CB2F
		neg	cx

loc_2CB2F:				; CODE XREF: Widget_AnchorTo3DPosition+138j
		mov	ax, 0B4h ; '�'
		sub	ax, cx
		mov	cx, ax
		cmp	cx, 168h
		jl	short loc_2CB44
		mov	bx, 168h
		cwd
		idiv	bx
		mov	cx, dx

loc_2CB44:				; CODE XREF: Widget_AnchorTo3DPosition+147j
		or	cx, cx
		jge	short loc_2CB4C
		add	cx, 168h

loc_2CB4C:				; CODE XREF: Widget_AnchorTo3DPosition+153j
		cmp	cx, 0B4h ; '�'
		jl	short loc_2CB56
		sub	cx, 168h

loc_2CB56:				; CODE XREF: Widget_AnchorTo3DPosition+15Dj
		mov	ax, cx
		pop	si
		leave
		retf
Widget_AnchorTo3DPosition	endp

; ���������������������������������������������������������������������������

loc_2CB5B:				; DATA XREF: seg339:189Eo seg339:18CAo
		push	bp
		mov	bp, sp
		sub	sp, 15Ah
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]
		mov	byte ptr es:[bx+8], 0
		cmp	dword ptr es:[bx+9], 0
		jnz	short loc_2CB7A
		jmp	loc_2D21B
; ���������������������������������������������������������������������������

loc_2CB7A:				; CODE XREF: seg061:0235j
		mov	eax, es:[bx+2]
		mov	[bp-8],	eax

loc_2CB83:
		mov	si, es:[bx+6]

loc_2CB87:
		add	si, 12h

loc_2CB8A:
		mov	eax, [si]
		sub	eax, dword_7220A

loc_2CB92:
		mov	[bp-142h], eax

loc_2CB97:
		mov	eax, [si+4]
		sub	eax, dword_7220E
		mov	[bp-13Eh], eax
		mov	eax, [si+8]
		sub	eax, dword_72212
		mov	[bp-13Ah], eax
		mov	eax, [bp-142h]
		mov	[bp-14Eh], eax
		mov	eax, [bp-13Eh]
		mov	[bp-14Ah], eax
		mov	eax, [bp-13Ah]
		mov	[bp-146h], eax
		mov	eax, [bp-14Eh]
		mov	[bp-136h], eax
		mov	eax, [bp-14Ah]
		mov	[bp-132h], eax
		mov	eax, [bp-146h]
		mov	[bp-12Eh], eax
		push	eax
		push	large dword ptr	[bp-132h]
		push	large dword ptr	[bp-136h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Ch], eax
		mov	[bp-10h], eax
		mov	[bp-4],	eax
		mov	eax, [bp-136h]
		mov	[bp-15Ah], eax
		mov	eax, [bp-132h]

loc_2CC22:
		mov	[bp-156h], eax
		mov	eax, [bp-12Eh]
		mov	[bp-152h], eax
		push	5166h
		lea	ax, [bp-15Ah]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		mov	eax, [bp-156h]
		cmp	eax, dword_6E9A6
		jge	short loc_2CC52
		mov	ax, 1
		jmp	short loc_2CC54
; ���������������������������������������������������������������������������

loc_2CC52:				; CODE XREF: seg061:030Bj
		xor	ax, ax

loc_2CC54:				; CODE XREF: seg061:0310j
		or	al, al
		jz	short loc_2CC5B
		jmp	loc_2D21B
; ���������������������������������������������������������������������������

loc_2CC5B:				; CODE XREF: seg061:0316j
		les	bx, [bp+6]
		mov	ax, es:[bx+0Dh]
		mov	[bp-16h], ax
		movsx	eax, word ptr [bp-16h]
		shl	eax, 8
		mov	[bp-14h], eax
		mov	si, di
		add	si, 68h	; 'h'
		mov	eax, [bp-14h]
		mov	edx, [si]
		imul	edx

loc_2CC81:
		shrd	eax, edx, 8

loc_2CC86:
		mov	[bp-1Eh], eax
		mov	eax, [bp-1Eh]
		mov	[bp-22h], eax
		mov	si, di
		add	si, 70h	; 'p'
		mov	eax, [bp-4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-26h], eax
		mov	eax, [bp-26h]
		mov	[bp-2Ah], eax
		mov	eax, [bp-22h]
		add	eax, [bp-2Ah]
		mov	[bp-2Eh], eax
		mov	[bp-1Ah], eax
		mov	eax, [bp-152h]
		cmp	eax, [bp-1Ah]
		jle	short loc_2CCD2
		mov	ax, 1
		jmp	short loc_2CCD4
; ���������������������������������������������������������������������������

loc_2CCD2:				; CODE XREF: seg061:038Bj
		xor	ax, ax

loc_2CCD4:				; CODE XREF: seg061:0390j
		or	al, al
		jz	short loc_2CCDB
		jmp	loc_2D21B
; ���������������������������������������������������������������������������

loc_2CCDB:				; CODE XREF: seg061:0396j
		mov	eax, [bp-152h]
		neg	eax
		mov	[bp-32h], eax
		mov	[bp-36h], eax
		cmp	eax, [bp-1Ah]
		jle	short loc_2CCF6
		mov	ax, 1
		jmp	short loc_2CCF8
; ���������������������������������������������������������������������������

loc_2CCF6:				; CODE XREF: seg061:03AFj
		xor	ax, ax

loc_2CCF8:				; CODE XREF: seg061:03B4j
		or	al, al
		jz	short loc_2CCFF
		jmp	loc_2D21B
; ���������������������������������������������������������������������������

loc_2CCFF:				; CODE XREF: seg061:03BAj
		mov	si, di
		add	si, 6Ch	; 'l'
		mov	eax, [bp-14h]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-3Eh], eax
		mov	eax, [bp-3Eh]
		mov	[bp-42h], eax
		mov	si, di
		add	si, 74h	; 't'
		mov	eax, [bp-4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-46h], eax
		mov	eax, [bp-46h]
		mov	[bp-4Ah], eax
		mov	eax, [bp-42h]
		add	eax, [bp-4Ah]
		mov	[bp-4Eh], eax
		mov	[bp-3Ah], eax
		mov	eax, [bp-15Ah]
		cmp	eax, [bp-3Ah]
		jle	short loc_2CD5F
		mov	ax, 1
		jmp	short loc_2CD61
; ���������������������������������������������������������������������������

loc_2CD5F:				; CODE XREF: seg061:0418j
		xor	ax, ax

loc_2CD61:				; CODE XREF: seg061:041Dj
		or	al, al
		jz	short loc_2CD68
		jmp	loc_2D21B
; ���������������������������������������������������������������������������

loc_2CD68:				; CODE XREF: seg061:0423j
		mov	eax, [bp-15Ah]
		neg	eax
		mov	[bp-52h], eax
		mov	[bp-56h], eax
		cmp	eax, [bp-3Ah]
		jle	short loc_2CD83
		mov	ax, 1

loc_2CD81:
		jmp	short loc_2CD85
; ���������������������������������������������������������������������������

loc_2CD83:				; CODE XREF: seg061:043Cj
		xor	ax, ax

loc_2CD85:				; CODE XREF: seg061:loc_2CD81j
		or	al, al
		jz	short loc_2CD8C
		jmp	loc_2D21B
; ���������������������������������������������������������������������������

loc_2CD8C:				; CODE XREF: seg061:0447j
		les	bx, [bp+6]
		mov	ax, es:[bx+0Dh]
		mov	[bp-5Ch], ax
		movsx	eax, word ptr [bp-5Ch]
		shl	eax, 8
		mov	[bp-60h], eax
		les	bx, [bp-8]
		mov	ax, es:[bx+6]
		mov	[bp-62h], ax
		movsx	eax, word ptr [bp-62h]
		mov	edx, [bp-4]
		imul	edx, eax
		mov	[bp-66h], edx
		mov	eax, [bp-66h]
		mov	[bp-6Ah], eax
		push	eax
		push	large [dword_72202]
		push	large dword ptr	[bp-60h]

loc_2CDD1:
		call	Math_FixedMulDiv_5804C

loc_2CDD6:
		push	dx
		push	ax
		pop	eax

loc_2CDDA:
		add	sp, 0Ch

loc_2CDDD:
		mov	[bp-6Eh], eax

loc_2CDE1:
		mov	[bp-5Ah], eax

loc_2CDE5:
		shl	eax, 8
		mov	[bp-72h], eax
		mov	[bp-76h], eax
		mov	si, [bp-75h]
		cmp	si, 4
		jge	short loc_2CDFE
		mov	ax, 4
		jmp	short loc_2CE00
; ���������������������������������������������������������������������������

loc_2CDFE:				; CODE XREF: seg061:04B7j
		mov	ax, si

loc_2CE00:				; CODE XREF: seg061:04BCj
		mov	si, ax
		cmp	si, 2000h
		jge	short loc_2CE0A
		jmp	short loc_2CE0D
; ���������������������������������������������������������������������������

loc_2CE0A:				; CODE XREF: seg061:04C6j
		mov	ax, 2000h

loc_2CE0D:				; CODE XREF: seg061:04C8j
		mov	si, ax
		les	bx, [bp-8]
		mov	ax, es:[bx+14h]
		mov	[bp-7Ch], ax
		movsx	eax, word ptr [bp-7Ch]
		mov	edx, [bp-5Ah]
		imul	edx, eax
		mov	[bp-80h], edx
		mov	eax, [bp-80h]
		mov	[bp-84h], eax
		sar	eax, 1
		mov	[bp-88h], eax
		mov	[bp-7Ah], eax
		mov	ax, es:[bx+12h]
		mov	[bp-8Eh], ax
		movsx	eax, word ptr [bp-8Eh]
		mov	edx, [bp-5Ah]
		imul	edx, eax
		mov	[bp-92h], edx
		mov	eax, [bp-92h]
		mov	[bp-96h], eax
		sar	eax, 1
		mov	[bp-9Ah], eax
		mov	[bp-8Ch], eax
		cmp	dword ptr [bp-8Ch], 100h
		jle	short loc_2CE81
		mov	ax, 1
		jmp	short loc_2CE83
; ���������������������������������������������������������������������������

loc_2CE81:				; CODE XREF: seg061:053Aj
		xor	ax, ax

loc_2CE83:				; CODE XREF: seg061:053Fj
		or	al, al
		jnz	short loc_2CE9F
		cmp	dword ptr [bp-7Ah], 100h
		jle	short loc_2CE96
		mov	ax, 1

loc_2CE94:
		jmp	short loc_2CE98
; ���������������������������������������������������������������������������

loc_2CE96:				; CODE XREF: seg061:054Fj
		xor	ax, ax

loc_2CE98:				; CODE XREF: seg061:loc_2CE94j
		or	al, al
		jnz	short loc_2CE9F
		jmp	loc_2D063
; ���������������������������������������������������������������������������

loc_2CE9F:				; CODE XREF: seg061:0545j seg061:055Aj
		mov	eax, [bp-15Ah]
		mov	[bp-0E6h], eax
		mov	eax, [bp-156h]
		mov	[bp-0EAh], eax
		mov	ax, word_721FE
		mov	[bp-0ECh], ax
		push	large dword ptr	[bp-0EAh]
		push	large [dword_72202]
		push	large dword ptr	[bp-0E6h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch

loc_2CED5:
		mov	[bp-0F0h], eax
		mov	[bp-0F4h], eax

loc_2CEDF:
		movsx	eax, word ptr [bp-0ECh]
		shl	eax, 8
		mov	edx, [bp-0F4h]
		add	edx, eax
		mov	[bp-0F8h], edx
		mov	eax, [bp-0F8h]
		mov	[bp-0FCh], eax
		sar	eax, 8
		mov	[bp-100h], eax
		cmp	dword ptr [bp-100h], 7D00h
		jle	short loc_2CF1F
		mov	dword ptr [bp-100h], 7D00h
		jmp	short loc_2CF35
; ���������������������������������������������������������������������������

loc_2CF1F:				; CODE XREF: seg061:05D2j
		cmp	dword ptr [bp-100h], 0FFFF8300h
		jge	short loc_2CF35
		mov	dword ptr [bp-100h], 0FFFF8300h
		jmp	short $+2

loc_2CF35:				; CODE XREF: seg061:05DDj seg061:05E8j
		mov	ax, [bp-100h]
		les	bx, [bp+6]
		les	bx, es:[bx+9]
		mov	es:[bx+8], ax
		mov	eax, [bp-152h]
		mov	[bp-104h], eax
		mov	eax, [bp-156h]
		mov	[bp-108h], eax
		mov	ax, word_72200
		mov	[bp-10Ah], ax
		push	large dword ptr	[bp-108h]
		push	large [dword_72206]
		push	large dword ptr	[bp-104h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-10Eh], eax

loc_2CF7F:
		mov	[bp-112h], eax

loc_2CF84:
		movsx	eax, word ptr [bp-10Ah]

loc_2CF8A:
		shl	eax, 8
		sub	eax, [bp-112h]
		mov	[bp-116h], eax
		mov	[bp-11Ah], eax
		sar	eax, 8
		mov	[bp-11Eh], eax
		cmp	dword ptr [bp-11Eh], 7D00h
		jle	short loc_2CFBC
		mov	dword ptr [bp-11Eh], 7D00h
		jmp	short loc_2CFD2
; ���������������������������������������������������������������������������

loc_2CFBC:				; CODE XREF: seg061:066Fj
		cmp	dword ptr [bp-11Eh], 0FFFF8300h
		jge	short loc_2CFD2
		mov	dword ptr [bp-11Eh], 0FFFF8300h
		jmp	short $+2

loc_2CFD2:				; CODE XREF: seg061:067Aj seg061:0685j
		mov	ax, [bp-11Eh]
		les	bx, [bp+6]

loc_2CFD9:
		les	bx, es:[bx+9]
		mov	es:[bx+0Ah], ax
		mov	eax, [bp-4]
		mov	[bp-122h], eax
		mov	eax, [bp-122h]

loc_2CFEF:
		mov	es:[bx+2], eax

loc_2CFF4:
		mov	[bp-124h], si
		mov	ax, [bp-124h]

loc_2CFFC:
		mov	es:[bx+16h], ax

loc_2D000:
		mov	word ptr es:[bx+1Ah], 0

loc_2D006:
		lea	ax, [bp-136h]
		push	ax
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr Widget_AnchorTo3DPosition
		add	sp, 6
		mov	[bp-126h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+9]
		mov	es:[bx+18h], ax
		les	bx, [bp+6]
		mov	eax, es:[bx+9]
		mov	[bp-12Ah], eax
		mov	ax, word_724AC
		cmp	ax, word_724AA
		jl	short loc_2D03E
		jmp	loc_2D213
; ���������������������������������������������������������������������������

loc_2D03E:				; CODE XREF: seg061:06F9j
		mov	ax, word_724AC
		inc	word_724AC
		shl	ax, 2
		les	bx, dword_724AE
		add	bx, ax
		mov	ax, [bp-128h]
		mov	dx, [bp-12Ah]

loc_2D056:				; CODE XREF: seg061:08D0j
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	loc_2D213
; ���������������������������������������������������������������������������
		jmp	loc_2D213
; ���������������������������������������������������������������������������

loc_2D063:				; CODE XREF: seg061:055Cj
		mov	eax, dword_72540
		mov	[bp-9Eh], eax
		shl	eax, 8
		cmp	eax, [bp-156h]
		jl	short loc_2D07C
		mov	ax, 1
		jmp	short loc_2D07E
; ���������������������������������������������������������������������������

loc_2D07C:				; CODE XREF: seg061:0735j
		xor	ax, ax

loc_2D07E:				; CODE XREF: seg061:073Aj
		or	al, al
		jnz	short loc_2D085
		jmp	loc_2D21B
; ���������������������������������������������������������������������������

loc_2D085:				; CODE XREF: seg061:0740j
		mov	eax, [bp-4]
		mov	[bp-0A2h], eax
		mov	eax, [bp-0A2h]
		les	bx, [bp+6]
		mov	es:[bx+11h], eax
		mov	eax, [bp-15Ah]
		mov	[bp-0A6h], eax
		mov	eax, [bp-4]
		mov	[bp-0AAh], eax
		mov	ax, word_721FE
		mov	[bp-0ACh], ax
		push	large dword ptr	[bp-0AAh]
		push	large [dword_72202]
		push	large dword ptr	[bp-0A6h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0B0h], eax
		mov	[bp-0B4h], eax

loc_2D0DA:
		movsx	eax, word ptr [bp-0ACh]
		shl	eax, 8
		mov	edx, [bp-0B4h]
		add	edx, eax
		mov	[bp-0B8h], edx
		mov	eax, [bp-0B8h]

loc_2D0F6:
		mov	[bp-0BCh], eax
		sar	eax, 8

loc_2D0FF:
		mov	[bp-0C0h], eax
		cmp	dword ptr [bp-0C0h], 7D00h
		jle	short loc_2D11A
		mov	dword ptr [bp-0C0h], 7D00h
		jmp	short loc_2D130
; ���������������������������������������������������������������������������

loc_2D11A:				; CODE XREF: seg061:07CDj
		cmp	dword ptr [bp-0C0h], 0FFFF8300h
		jge	short loc_2D130
		mov	dword ptr [bp-0C0h], 0FFFF8300h
		jmp	short $+2

loc_2D130:				; CODE XREF: seg061:07D8j seg061:07E3j
		mov	ax, [bp-0C0h]
		les	bx, [bp+6]
		mov	es:[bx+16h], ax
		mov	eax, [bp-152h]
		mov	[bp-0C4h], eax
		mov	eax, [bp-4]
		mov	[bp-0C8h], eax
		mov	ax, word_72200
		mov	[bp-0CAh], ax
		push	large dword ptr	[bp-0C8h]
		push	large [dword_72206]
		push	large dword ptr	[bp-0C4h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch

loc_2D170:
		mov	[bp-0CEh], eax

loc_2D175:
		mov	[bp-0D2h], eax

loc_2D17A:
		movsx	eax, word ptr [bp-0CAh]

loc_2D180:
		shl	eax, 8

loc_2D184:
		sub	eax, [bp-0D2h]
		mov	[bp-0D6h], eax
		mov	[bp-0DAh], eax
		sar	eax, 8
		mov	[bp-0DEh], eax
		cmp	dword ptr [bp-0DEh], 7D00h
		jle	short loc_2D1B2
		mov	dword ptr [bp-0DEh], 7D00h
		jmp	short loc_2D1C8
; ���������������������������������������������������������������������������

loc_2D1B2:				; CODE XREF: seg061:0865j
		cmp	dword ptr [bp-0DEh], 0FFFF8300h
		jge	short loc_2D1C8
		mov	dword ptr [bp-0DEh], 0FFFF8300h
		jmp	short $+2

loc_2D1C8:				; CODE XREF: seg061:0870j seg061:087Bj
		mov	ax, [bp-0DEh]
		les	bx, [bp+6]
		mov	es:[bx+18h], ax

loc_2D1D3:
		les	bx, es:[bx+2]

loc_2D1D7:
		mov	al, es:[bx+16h]
		les	bx, [bp+6]
		mov	es:[bx+15h], al

loc_2D1E2:
		mov	ax, [bp+8]

loc_2D1E5:
		mov	dx, [bp+6]
		add	dx, 0Fh
		mov	[bp-0E0h], ax
		mov	[bp-0E2h], dx

loc_2D1F3:
		mov	ax, word_724AC
		cmp	ax, word_724AA
		jge	short loc_2D213

loc_2D1FC:
		mov	ax, word_724AC
		inc	word_724AC
		shl	ax, 2
		les	bx, dword_724AE
		add	bx, ax
		mov	ax, [bp-0E0h]
		jmp	loc_2D056
; ���������������������������������������������������������������������������

loc_2D213:				; CODE XREF: seg061:06FBj seg061:071Dj ...
		les	bx, [bp+6]
		mov	byte ptr es:[bx+8], 1

loc_2D21B:				; CODE XREF: seg061:0237j seg061:0318j ...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2D21F:				; DATA XREF: seg339:187Eo seg339:18B6o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2D226:				; DATA XREF: seg339:15BCo
		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+6]
		mov	[bp-8],	eax
		mov	ax, [bp+0Ah]
		mov	[bp-0Ah], ax
		push	1
		push	0
		push	2
		push	large 1Ah
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp-0Ch], dx

loc_2D251:
		mov	[bp-0Eh], ax
		or	ax, dx

loc_2D256:
		jz	short loc_2D299
		les	bx, [bp-0Eh]

loc_2D25B:
		mov	word ptr es:[bx], 155Ch

loc_2D260:
		push	dx
		push	bx

loc_2D262:
		call	Descriptor_Reset

loc_2D267:
		add	sp, 4
		les	bx, [bp-0Eh]
		mov	word ptr es:[bx], 189Eh

loc_2D272:
		mov	word ptr es:[bx+0Fh], 11E8h
		mov	word ptr es:[bx+0Fh], 1836h

loc_2D27E:
		push	word ptr [bp-0Ah]

loc_2D281:
		push	large dword ptr	[bp-8]

loc_2D285:
		push	word ptr [bp-0Ch]
		push	bx
		nop
		push	cs
		call	near ptr Widget_ConstructComposite
		add	sp, 0Ah
		mov	dx, [bp-0Ch]
		mov	ax, [bp-0Eh]
		jmp	short loc_2D29F
; ���������������������������������������������������������������������������

loc_2D299:				; CODE XREF: seg061:loc_2D256j
		mov	dx, [bp-0Ch]
		mov	ax, [bp-0Eh]

loc_2D29F:				; CODE XREF: seg061:0957j
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — initialise une petite structure avec des valeurs par défaut 1:1 (+4/+6) :
; constructeur avec échelle par défaut 1:1.
; ==============================================================================================
Descriptor_ConstructDefaultScale	proc far		; CODE XREF: MissionText_LoadSubtitleRecordB_94710:loc_9495EP

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		mov	ax, 1
		mov	es:[bx+4], ax
		mov	es:[bx+6], ax
		pop	bp
		retf
Descriptor_ConstructDefaultScale	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,18L — remet à zéro un pointeur (+9) et un compteur à 1 (+0xD) : reset d'un descripteur
; enfant unique.
; ==============================================================================================
Descriptor_ResetSingleChild	proc far		; CODE XREF: Widget_ConstructComposite+Bp seg062:00C5P ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_2D2C3:
		les	bx, [bp+arg_0]

loc_2D2C6:
		mov	dword ptr es:[bx+9], 0

loc_2D2CF:
		mov	word ptr es:[bx+0Dh], 1
		pop	bp
		retf
Descriptor_ResetSingleChild	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,118L — constructeur composite : appelle sub_2D2C0 (reset), sub_2916B (descripteur),
; construit un sous-objet (type 0x1892/0x1896 via sub_5C6F3) : constructeur de widget
; composite avec sous-élément enfant (menu/liste imbriquée).
; ==============================================================================================
Widget_ConstructComposite	proc far		; CODE XREF: seg061:094Bp seg061:0B6Dp ...

var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
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
		call	Descriptor_Construct

loc_2D2F8:
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	ax, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Dh], ax
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		add	dx, 8
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		push	1
		push	0

loc_2D322:
		push	2

loc_2D324:
		push	large 1Ch
		push	5C44h

loc_2D32A:
		call	Memory_TypedFreeWrapper_5C6F3

loc_2D32F:
		add	sp, 0Ch

loc_2D332:
		mov	word ptr [bp+var_8+2], dx

loc_2D335:
		mov	word ptr [bp+var_8], ax
		or	ax, dx
		jnz	short loc_2D33F
		jmp	loc_2D3C1
; ���������������������������������������������������������������������������

loc_2D33F:				; CODE XREF: Widget_ConstructComposite+63j
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 11E8h
		mov	word ptr es:[bx], 1892h
		mov	dword ptr es:[bx+0Ch], 0

loc_2D355:
		mov	byte ptr es:[bx+10h], 2
		mov	byte ptr es:[bx+11h], 0

loc_2D35F:
		mov	dword ptr es:[bx+12h], 0
		mov	word ptr es:[bx+6], 0
		mov	word ptr es:[bx], 1896h

loc_2D373:
		mov	word ptr es:[bx+6], 0
		les	bx, [bp+var_4]

loc_2D37C:
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	al, es:[bx+4]
		mov	[bp+var_D], al
		les	bx, [bp+var_8]

loc_2D38E:
		mov	eax, [bp+var_C]

loc_2D392:
		mov	es:[bx+0Ch], eax

loc_2D397:
		mov	al, [bp+var_D]
		mov	es:[bx+10h], al
		mov	byte ptr es:[bx+11h], 0
		mov	dword ptr es:[bx+12h], 0
		les	bx, [bp+var_4]
		mov	eax, es:[bx+6]
		les	bx, [bp+var_8]
		mov	es:[bx+12h], eax
		mov	ax, word ptr [bp+var_8]
		jmp	short loc_2D3C7
; ���������������������������������������������������������������������������

loc_2D3C1:				; CODE XREF: Widget_ConstructComposite+65j
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]

loc_2D3C7:				; CODE XREF: Widget_ConstructComposite+E8j
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], dx

loc_2D3CE:
		mov	es:[bx+9], ax
		leave
		retf
Widget_ConstructComposite	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,65L — destructeur (type 0x189E) : notifie l'enfant référencé (+9, vtable[4]) avant de le
; libérer (sub_29115) : destructeur de widget composite avec notification de l'enfant.
; ==============================================================================================
Widget_DestructComposite	proc far		; CODE XREF: seg061:loc_2D892p
					; seg062:0146P
					; DATA XREF: ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_2D446
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 189Eh
		cmp	dword ptr es:[bx+9], 0

loc_2D3F3:
		jz	short loc_2D40B
		push	3

loc_2D3F7:
		push	large dword ptr	es:[bx+9]
		les	bx, es:[bx+9]

loc_2D400:
		mov	bx, es:[bx]
		call	dword ptr [bx+4]

loc_2D406:
		add	sp, 6
		jmp	short $+2

loc_2D40B:				; CODE XREF: Widget_DestructComposite:loc_2D3F3j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+9], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Object_DestructGeneric_29115
		add	sp, 6

loc_2D425:
		test	si, 1
		jz	short loc_2D446
		mov	eax, [bp+arg_0]

loc_2D42F:
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_2D446:				; CODE XREF: Widget_DestructComposite+Fj
					; Widget_DestructComposite+55j
		pop	si
		leave
		retf
Widget_DestructComposite	endp

; ���������������������������������������������������������������������������

loc_2D449:				; DATA XREF: seg339:15B0o
		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+6]

loc_2D453:
		mov	[bp-8],	eax
		mov	ax, [bp+0Ah]

loc_2D45A:
		mov	[bp-0Ah], ax
		push	1
		push	0
		push	2
		push	large 1Ah
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp-0Ch], dx
		mov	[bp-0Eh], ax
		or	ax, dx

loc_2D479:
		jz	short loc_2D4C3
		les	bx, [bp-0Eh]
		mov	word ptr es:[bx], 155Ch
		push	dx
		push	bx

loc_2D485:
		call	Descriptor_Reset

loc_2D48A:
		add	sp, 4
		les	bx, [bp-0Eh]

loc_2D490:
		mov	word ptr es:[bx], 189Eh
		mov	word ptr es:[bx+0Fh], 11E8h
		mov	word ptr es:[bx+0Fh], 1836h
		push	word ptr [bp-0Ah]
		push	large dword ptr	[bp-8]
		push	word ptr [bp-0Ch]
		push	bx
		push	cs
		call	near ptr Widget_ConstructComposite
		add	sp, 0Ah
		les	bx, [bp-0Eh]
		mov	word ptr es:[bx], 1866h
		mov	dx, [bp-0Ch]
		mov	ax, [bp-0Eh]
		jmp	short loc_2D4C9
; ���������������������������������������������������������������������������

loc_2D4C3:				; CODE XREF: seg061:loc_2D479j
		mov	dx, [bp-0Ch]
		mov	ax, [bp-0Eh]

loc_2D4C9:				; CODE XREF: seg061:0B81j
		mov	[bp-2],	dx

loc_2D4CC:
		mov	[bp-4],	ax
		leave
		retf
; ���������������������������������������������������������������������������

loc_2D4D1:				; DATA XREF: seg339:188Ao
		push	bp

loc_2D4D2:
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2D4D8:				; DATA XREF: seg339:15B4o
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2D4DF:				; DATA XREF: seg339:1866o
		push	bp
		mov	bp, sp

loc_2D4E2:
		sub	sp, 0BCh
		push	si
		push	di
		mov	di, [bp+0Ah]
		les	bx, [bp+6]

loc_2D4EE:
		cmp	dword ptr es:[bx+9], 0
		jnz	short loc_2D4F9

loc_2D4F6:
		jmp	loc_2D875
; ���������������������������������������������������������������������������

loc_2D4F9:				; CODE XREF: seg061:0BB4j
		mov	eax, es:[bx+2]
		mov	[bp-8],	eax
		mov	si, es:[bx+6]
		add	si, 12h
		mov	eax, [si]
		mov	[bp-0B0h], eax
		mov	eax, [si+4]
		mov	[bp-0ACh], eax
		mov	eax, [si+8]
		mov	[bp-0A8h], eax

loc_2D523:
		push	eax
		push	large dword ptr	[bp-0ACh]

loc_2D52A:
		push	large dword ptr	[bp-0B0h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Ch], eax
		mov	[bp-10h], eax
		mov	[bp-4],	eax
		mov	eax, [bp-0B0h]
		mov	[bp-0BCh], eax
		mov	eax, [bp-0ACh]

loc_2D556:
		mov	[bp-0B8h], eax
		mov	eax, [bp-0A8h]
		mov	[bp-0B4h], eax
		mov	ax, di
		add	ax, 20h	; ' '
		push	ax
		lea	ax, [bp-0BCh]
		push	ax

loc_2D570:
		call	Matrix_WorldToLocal_58768
		add	sp, 4

loc_2D578:
		cmp	dword ptr [bp-0B8h], 0
		jg	short loc_2D585

loc_2D580:
		mov	ax, 1

loc_2D583:
		jmp	short loc_2D587
; ���������������������������������������������������������������������������

loc_2D585:				; CODE XREF: seg061:0C3Ej
		xor	ax, ax

loc_2D587:				; CODE XREF: seg061:loc_2D583j
		or	al, al
		jz	short loc_2D58E

loc_2D58B:
		jmp	loc_2D875
; ���������������������������������������������������������������������������

loc_2D58E:				; CODE XREF: seg061:0C49j
		les	bx, [bp-8]

loc_2D591:
		mov	ax, es:[bx+4]
		mov	[bp-16h], ax
		movsx	eax, word ptr [bp-16h]
		mov	edx, [bp-4]
		imul	edx, eax
		mov	[bp-1Ah], edx
		mov	eax, [bp-1Ah]
		mov	[bp-14h], eax
		mov	si, di
		add	si, 68h	; 'h'
		mov	eax, [bp-14h]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-22h], eax

loc_2D5C9:
		mov	eax, [bp-22h]
		mov	[bp-26h], eax
		mov	si, di

loc_2D5D3:
		add	si, 70h	; 'p'

loc_2D5D6:
		mov	eax, [bp-4]
		mov	edx, [si]

loc_2D5DD:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-2Ah], eax
		mov	eax, [bp-2Ah]
		mov	[bp-2Eh], eax

loc_2D5F1:
		mov	eax, [bp-26h]
		add	eax, [bp-2Eh]
		mov	[bp-32h], eax
		mov	[bp-1Eh], eax
		mov	eax, [bp-0B4h]
		cmp	eax, [bp-1Eh]
		jle	short loc_2D611
		mov	ax, 1
		jmp	short loc_2D613
; ���������������������������������������������������������������������������

loc_2D611:				; CODE XREF: seg061:0CCAj
		xor	ax, ax

loc_2D613:				; CODE XREF: seg061:0CCFj
		or	al, al
		jz	short loc_2D61A
		jmp	loc_2D875
; ���������������������������������������������������������������������������

loc_2D61A:				; CODE XREF: seg061:0CD5j
		mov	eax, [bp-0B4h]
		neg	eax
		mov	[bp-36h], eax
		mov	[bp-3Ah], eax

loc_2D62A:
		cmp	eax, [bp-1Eh]
		jle	short loc_2D635
		mov	ax, 1
		jmp	short loc_2D637
; ���������������������������������������������������������������������������

loc_2D635:				; CODE XREF: seg061:0CEEj
		xor	ax, ax

loc_2D637:				; CODE XREF: seg061:0CF3j
		or	al, al
		jz	short loc_2D63E
		jmp	loc_2D875
; ���������������������������������������������������������������������������

loc_2D63E:				; CODE XREF: seg061:0CF9j
		mov	si, di
		add	si, 6Ch	; 'l'
		mov	eax, [bp-14h]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8

loc_2D652:
		mov	[bp-42h], eax

loc_2D656:
		mov	eax, [bp-42h]

loc_2D65A:
		mov	[bp-46h], eax
		mov	si, di

loc_2D660:
		add	si, 74h	; 't'

loc_2D663:
		mov	eax, [bp-4]

loc_2D667:
		mov	edx, [si]
		imul	edx

loc_2D66D:
		shrd	eax, edx, 8
		mov	[bp-4Ah], eax

loc_2D676:
		mov	eax, [bp-4Ah]
		mov	[bp-4Eh], eax
		mov	eax, [bp-46h]
		add	eax, [bp-4Eh]
		mov	[bp-52h], eax
		mov	[bp-3Eh], eax
		mov	eax, [bp-0BCh]

loc_2D693:
		cmp	eax, [bp-3Eh]
		jle	short loc_2D69E
		mov	ax, 1
		jmp	short loc_2D6A0
; ���������������������������������������������������������������������������

loc_2D69E:				; CODE XREF: seg061:0D57j
		xor	ax, ax

loc_2D6A0:				; CODE XREF: seg061:0D5Cj
		or	al, al
		jz	short loc_2D6A7
		jmp	loc_2D875
; ���������������������������������������������������������������������������

loc_2D6A7:				; CODE XREF: seg061:0D62j
		mov	eax, [bp-0BCh]
		neg	eax
		mov	[bp-56h], eax
		mov	[bp-5Ah], eax
		cmp	eax, [bp-3Eh]
		jle	short loc_2D6C2
		mov	ax, 1
		jmp	short loc_2D6C4
; ���������������������������������������������������������������������������

loc_2D6C2:				; CODE XREF: seg061:0D7Bj
		xor	ax, ax

loc_2D6C4:				; CODE XREF: seg061:0D80j
		or	al, al
		jz	short loc_2D6CB

loc_2D6C8:
		jmp	loc_2D875
; ���������������������������������������������������������������������������

loc_2D6CB:				; CODE XREF: seg061:0D86j
		mov	eax, [bp-0BCh]

loc_2D6D0:
		mov	[bp-5Eh], eax

loc_2D6D4:
		mov	eax, [bp-0B8h]
		mov	[bp-62h], eax
		mov	ax, word_721FE
		mov	[bp-64h], ax
		push	large dword ptr	[bp-62h]
		push	large [dword_72202]
		push	large dword ptr	[bp-5Eh]

loc_2D6F0:
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-68h], eax
		mov	[bp-6Ch], eax

loc_2D704:
		movsx	eax, word ptr [bp-64h]
		shl	eax, 8
		mov	edx, [bp-6Ch]
		add	edx, eax
		mov	[bp-70h], edx
		mov	eax, [bp-70h]
		mov	[bp-74h], eax
		sar	eax, 8

loc_2D724:
		mov	[bp-78h], eax

loc_2D728:
		cmp	dword ptr [bp-78h], 7D00h
		jle	short loc_2D73C

loc_2D732:
		mov	dword ptr [bp-78h], 7D00h
		jmp	short loc_2D750
; ���������������������������������������������������������������������������

loc_2D73C:				; CODE XREF: seg061:0DF0j
		cmp	dword ptr [bp-78h], 0FFFF8300h
		jge	short loc_2D750
		mov	dword ptr [bp-78h], 0FFFF8300h
		jmp	short $+2

loc_2D750:				; CODE XREF: seg061:0DFAj seg061:0E04j
		mov	ax, [bp-78h]
		les	bx, [bp+6]

loc_2D756:
		les	bx, es:[bx+9]
		mov	es:[bx+8], ax
		mov	eax, [bp-0B4h]
		mov	[bp-7Ch], eax
		mov	eax, [bp-0B8h]
		mov	[bp-80h], eax

loc_2D770:
		mov	ax, word_72200
		mov	[bp-82h], ax
		push	large dword ptr	[bp-80h]
		push	large [dword_72206]
		push	large dword ptr	[bp-7Ch]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-86h], eax
		mov	[bp-8Ah], eax
		movsx	eax, word ptr [bp-82h]
		shl	eax, 8
		sub	eax, [bp-8Ah]
		mov	[bp-8Eh], eax
		mov	[bp-92h], eax
		sar	eax, 8
		mov	[bp-96h], eax

loc_2D7BC:
		cmp	dword ptr [bp-96h], 7D00h
		jle	short loc_2D7D2

loc_2D7C7:
		mov	dword ptr [bp-96h], 7D00h
		jmp	short loc_2D7E8
; ���������������������������������������������������������������������������

loc_2D7D2:				; CODE XREF: seg061:0E85j
		cmp	dword ptr [bp-96h], 0FFFF8300h
		jge	short loc_2D7E8
		mov	dword ptr [bp-96h], 0FFFF8300h
		jmp	short $+2

loc_2D7E8:				; CODE XREF: seg061:0E90j seg061:0E9Bj
		mov	ax, [bp-96h]
		les	bx, [bp+6]
		les	bx, es:[bx+9]

loc_2D7F3:
		mov	es:[bx+0Ah], ax

loc_2D7F7:
		mov	eax, dword_72540

loc_2D7FB:
		mov	[bp-9Ah], eax
		shl	eax, 8
		mov	[bp-9Eh], eax
		mov	eax, [bp-9Eh]
		mov	es:[bx+2], eax
		mov	word ptr es:[bx+16h], 0FFh
		mov	word ptr es:[bx+1Ah], 0

loc_2D81F:
		lea	ax, [bp-0B0h]
		push	ax

loc_2D824:
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr Widget_AnchorTo3DPosition
		add	sp, 6
		mov	[bp-0A0h], ax
		les	bx, [bp+6]
		les	bx, es:[bx+9]
		mov	es:[bx+18h], ax
		les	bx, [bp+6]
		mov	eax, es:[bx+9]
		mov	[bp-0A4h], eax
		mov	ax, word_724AC

loc_2D84E:
		cmp	ax, word_724AA
		jge	short loc_2D875
		mov	ax, word_724AC
		inc	word_724AC
		shl	ax, 2
		les	bx, dword_724AE
		add	bx, ax
		mov	ax, [bp-0A2h]
		mov	dx, [bp-0A4h]
		mov	es:[bx+2], ax
		mov	es:[bx], dx

loc_2D873:
		jmp	short $+2

loc_2D875:				; CODE XREF: seg061:loc_2D4F6j
					; seg061:loc_2D58Bj ...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2D879:				; DATA XREF: seg339:188Eo
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_2D880:
		mov	si, [bp+0Ah]

loc_2D883:
		cmp	dword ptr [bp+6], 0

loc_2D888:
		jz	short loc_2D8BB
		push	0

loc_2D88C:
		push	large dword ptr	[bp+6]
		nop
		push	cs

loc_2D892:
		call	near ptr Widget_DestructComposite
		add	sp, 6
		test	si, 1
		jz	short loc_2D8BB
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_2D8BB:				; CODE XREF: seg061:loc_2D888j
					; seg061:0F5Cj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2D8BE:				; DATA XREF: seg339:189Ao
		push	bp
		mov	bp, sp

loc_2D8C1:
		sub	sp, 8
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_2D93F

loc_2D8CF:
		les	bx, [bp+6]

loc_2D8D2:
		cmp	byte ptr es:[bx+11h], 0
		jz	short loc_2D902
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_2D902
		push	0
		mov	al, es:[bx+10h]
		push	ax
		mov	eax, es:[bx+0Ch]
		mov	[bp-4],	eax
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_2D902:				; CODE XREF: seg061:0F97j seg061:0F9Fj
		les	bx, [bp+6]
		mov	dword ptr es:[bx+0Ch], 0
		mov	byte ptr es:[bx+11h], 0
		mov	dword ptr es:[bx+12h], 0
		test	si, 1

loc_2D920:
		jz	short loc_2D93F
		mov	eax, [bp+6]
		mov	[bp-8],	eax
		push	0
		push	2
		lea	ax, [bp-8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_2D93F:				; CODE XREF: seg061:0F8Dj
					; seg061:loc_2D920j
		pop	si

locret_2D940:
		leave
		retf
seg061		ends
