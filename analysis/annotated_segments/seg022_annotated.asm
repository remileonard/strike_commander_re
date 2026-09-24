seg022		segment	byte public 'CODE' use16
		assume cs:seg022
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_193BE:				; DATA XREF: seg339:0B23o
		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	word ptr [bp-6], 0
		mov	word ptr [bp-4], 0
		mov	word ptr [bp-2], 0
		push	large dword ptr	[bp+6]
		nop
		push	cs
		call	near ptr Audio3D_ComputePan
		add	sp, 4
		push	word ptr [bp-6]
		lea	ax, [bp-4]
		push	ax
		push	large dword ptr	[bp+6]
		call	UI_NotifyChildrenMove
		add	sp, 8
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,323L — calcule un cap normalisé (mod 360, 0x168) entre l'auditeur et une source sonore,
; vérifie l'enveloppe audio (sub_1CE1D) : moteur audio 3D — calcul de direction pour le son
; positionnel (pan stéréo).
; ==============================================================================================
Audio3D_ComputePan	proc far		; CODE XREF: seg022:0029p

var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= word ptr -70h
var_64		= word ptr -64h
var_4C		= dword	ptr -4Ch
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
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
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		lea	ax, [bp+var_70]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	ax, [bx]
		add	ax, 10h
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		lea	ax, [bp+var_64]
		push	ax

loc_19422:
		push	ss

loc_19423:
		lea	ax, [bp+var_4]
		push	ax
		call	Math_HeadingAngle_553CF

loc_1942C:
		add	sp, 6

loc_1942F:
		mov	eax, [bp+var_4]

loc_19433:
		sar	eax, 8

loc_19437:
		les	bx, [bp+arg_0]

loc_1943A:
		mov	es:[bx+0Eh], eax

loc_1943F:
		cmp	dword ptr es:[bx+0Eh], 0

loc_19445:
		jge	short loc_19450

loc_19447:
		add	dword ptr es:[bx+0Eh], 168h

loc_19450:				; CODE XREF: Audio3D_ComputePan:loc_19445j
		lea	ax, [bp+var_7C]
		push	ax
		mov	ax, word_706A0
		add	ax, 68h	; 'h'
		push	ax
		call	Lexer_ResolveConstantAlt
		add	sp, 4
		or	al, al
		jnz	short loc_1946A
		jmp	loc_19668
; ���������������������������������������������������������������������������

loc_1946A:				; CODE XREF: Audio3D_ComputePan+71j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	si, [bx]
		add	si, 4
		mov	eax, [si]
		sub	[bp+var_7C], eax
		mov	eax, [si+4]
		sub	[bp+var_78], eax
		mov	eax, [si+8]
		sub	[bp+var_74], eax
		lea	ax, [bp+var_7C]
		push	ax

loc_19491:
		push	ss

loc_19492:
		lea	ax, [bp+var_8]
		push	ax

loc_19496:
		call	Math_HeadingAngle_553CF
		add	sp, 6
		cmp	[bp+var_8], 0
		jge	short loc_194AA
		mov	ax, 1
		jmp	short loc_194AC
; ���������������������������������������������������������������������������

loc_194AA:				; CODE XREF: Audio3D_ComputePan+AFj
		xor	ax, ax

loc_194AC:				; CODE XREF: Audio3D_ComputePan+B4j
		or	al, al
		jz	short loc_194B8

loc_194B0:
		add	[bp+var_8], 16800h

loc_194B8:				; CODE XREF: Audio3D_ComputePan+BAj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16h]

loc_194BF:
		mov	ax, es:[bx+1Eh]

loc_194C3:
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	ax, es:[bx+20h]
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_12], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+14h]
		mov	dx, es:[bx+12h]
		add	dx, 38h	; '8'
		mov	word ptr [bp+var_1C+2],	ax
		mov	word ptr [bp+var_1C], dx
		les	bx, [bp+var_1C]
		mov	eax, es:[bx]
		mov	[bp+var_18], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Eh]
		mov	[bp+var_20], eax
		shl	eax, 8
		mov	edx, [bp+var_8]
		sub	edx, eax
		mov	[bp+var_24], edx
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		cmp	[bp+var_28], 0B400h

loc_19531:
		jle	short loc_19538

loc_19533:
		mov	ax, 1

loc_19536:
		jmp	short loc_1953A
; ���������������������������������������������������������������������������

loc_19538:				; CODE XREF: Audio3D_ComputePan:loc_19531j
		xor	ax, ax

loc_1953A:				; CODE XREF: Audio3D_ComputePan:loc_19536j
		or	al, al
		jz	short loc_19548
		sub	[bp+var_8], 16800h
		jmp	short loc_19588
; ���������������������������������������������������������������������������

loc_19548:				; CODE XREF: Audio3D_ComputePan+148j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Eh]
		mov	[bp+var_2C], eax
		shl	eax, 8
		mov	edx, [bp+var_8]
		sub	edx, eax
		mov	[bp+var_30], edx
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		cmp	[bp+var_34], 0FFFF4C00h
		jge	short loc_1957A
		mov	ax, 1
		jmp	short loc_1957C
; ���������������������������������������������������������������������������

loc_1957A:				; CODE XREF: Audio3D_ComputePan+17Fj
		xor	ax, ax

loc_1957C:				; CODE XREF: Audio3D_ComputePan+184j
		or	al, al
		jz	short loc_19588
		add	[bp+var_8], 16800h

loc_19588:				; CODE XREF: Audio3D_ComputePan+152j
					; Audio3D_ComputePan+18Aj
		mov	eax, [bp+var_8]
		mov	[bp+var_38], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Eh]
		mov	[bp+var_3C], eax

loc_1959C:
		shl	eax, 8

loc_195A0:
		sub	[bp+var_38], eax
		mov	eax, [bp+var_38]

loc_195A8:
		mov	edx, [bp+var_18]
		imul	edx

loc_195AF:
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		add	[bp+var_C], eax
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+0Eh]
		mov	[bp+var_3E], ax
		movsx	eax, [bp+var_3E]
		shl	eax, 8
		cmp	eax, [bp+var_C]
		jge	short loc_195DF
		mov	ax, 1
		jmp	short loc_195E1
; ���������������������������������������������������������������������������

loc_195DF:				; CODE XREF: Audio3D_ComputePan+1E4j
		xor	ax, ax

loc_195E1:				; CODE XREF: Audio3D_ComputePan+1E9j
		or	al, al
		jz	short loc_19606
		les	bx, [bp+arg_0]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+0Eh]
		mov	[bp+var_40], ax
		movsx	eax, [bp+var_40]
		shl	eax, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		jmp	short loc_1964D
; ���������������������������������������������������������������������������

loc_19606:				; CODE XREF: Audio3D_ComputePan+1EFj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_46], ax
		movsx	eax, [bp+var_46]
		shl	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_19628
		mov	ax, 1
		jmp	short loc_1962A
; ���������������������������������������������������������������������������

loc_19628:				; CODE XREF: Audio3D_ComputePan+22Dj
		xor	ax, ax

loc_1962A:				; CODE XREF: Audio3D_ComputePan+232j
		or	al, al
		jz	short loc_19651
		les	bx, [bp+arg_0]

loc_19631:
		les	bx, es:[bx+12h]
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_48], ax
		movsx	eax, [bp+var_48]
		shl	eax, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]

loc_1964D:				; CODE XREF: Audio3D_ComputePan+210j
		mov	[bp+var_C], eax

loc_19651:				; CODE XREF: Audio3D_ComputePan+238j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	ax, word ptr [bp+var_C+1]
		mov	es:[bx+2], ax
		mov	ax, word ptr [bp+var_12+1]
		mov	es:[bx+4], ax
		jmp	short loc_1967B
; ���������������������������������������������������������������������������

loc_19668:				; CODE XREF: Audio3D_ComputePan+73j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ah]
		mov	word ptr es:[bx+2], 12Ch
		mov	word ptr es:[bx+4], 64h	; 'd'

loc_1967B:				; CODE XREF: Audio3D_ComputePan+272j
		pop	si
		leave
		retf
Audio3D_ComputePan	endp

; ���������������������������������������������������������������������������

loc_1967E:				; DATA XREF: seg339:0B13o
		push	bp
		mov	bp, sp
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx]
		add	ax, 50h	; 'P'
		push	ax
		push	large dword ptr	[bp+6]
		call	UI_NotifyChildrenMove

loc_19699:
		add	sp, 8

loc_1969C:
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1969E:				; DATA XREF: seg339:0B03o
		push	bp
		mov	bp, sp

loc_196A1:
		sub	sp, 4
		mov	word ptr [bp-4], 0
		mov	word ptr [bp-2], 0

loc_196AE:
		mov	word ptr [bp-4], 0
		mov	word ptr [bp-2], 0
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		nop
		push	cs

loc_196C1:
		call	near ptr Audio3D_StereoPan

loc_196C4:
		add	sp, 6
		push	0
		lea	ax, [bp-4]
		push	ax
		push	large dword ptr	[bp+6]
		call	UI_NotifyChildrenMove
		add	sp, 8
		leave
		retf
; ���������������������������������������������������������������������������

loc_196DB:				; DATA XREF: seg339:0B07o
		push	bp
		mov	bp, sp
		cmp	byte_72362, 0
		jz	short loc_196F1
		push	large dword ptr	[bp+6]
		call	UI_NotifyRefresh
		add	sp, 4

loc_196F1:				; CODE XREF: seg022:0333j
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,107L — calcule les déltas de position pondérés (dword_70485) entre source sonore et
; auditeur, produit sensible à l'orientation de l'auditeur (+0x16-0x20) : calcul du
; panoramique stéréo (pan) d'une source sonore 3D.
; ==============================================================================================
Audio3D_StereoPan	proc far		; CODE XREF: seg022:loc_196C1p

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28h
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	eax, [bx+3Ch]
		mov	edx, dword_70485
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax

loc_1971F:
		sar	eax, 8

loc_19723:
		mov	bx, word ptr [bp+arg_0]

loc_19726:
		mov	es:[bx+0Eh], eax
		mov	bx, es:[bx+2]

loc_1972F:
		mov	bx, [bx]

loc_19731:
		mov	eax, [bx+40h]
		mov	edx, dword_70485
		imul	edx
		shrd	eax, edx, 8

loc_19742:
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, es:[bx+1Eh]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	ax, es:[bx+20h]
		mov	[bp+var_1C], ax
		movsx	eax, [bp+var_1C]
		shl	eax, 8
		mov	[bp+var_1A], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+14h]
		mov	dx, es:[bx+12h]
		add	dx, 38h	; '8'
		mov	word ptr [bp+var_24+2],	ax
		mov	word ptr [bp+var_24], dx

loc_19791:
		les	bx, [bp+var_24]
		mov	eax, es:[bx]
		mov	[bp+var_20], eax

loc_1979C:
		mov	eax, [bp+var_C]

loc_197A0:
		mov	[bp+var_28], eax

loc_197A4:
		mov	eax, [bp+var_28]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8

loc_197B4:
		mov	[bp+var_28], eax

loc_197B8:
		mov	eax, [bp+var_28]

loc_197BC:
		add	[bp+var_1A], eax
		les	bx, [bp+arg_0]

loc_197C3:
		les	bx, es:[bx+1Ah]
		mov	ax, word ptr [bp+var_14+1]
		mov	es:[bx+2], ax
		mov	ax, word ptr [bp+var_1A+1]
		mov	es:[bx+4], ax
		leave
		retf
Audio3D_StereoPan	endp

; ���������������������������������������������������������������������������

loc_197D7:				; DATA XREF: seg339:0AE3o
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	word ptr [bp-4], 0
		mov	word ptr [bp-2], 0
		push	large dword ptr	[bp+6]
		nop
		push	cs
		call	near ptr Audio3D_DopplerShift
		add	sp, 4
		push	0
		lea	ax, [bp-4]
		push	ax
		push	large dword ptr	[bp+6]
		call	UI_NotifyChildrenMove
		add	sp, 8
		leave
		retf
; ���������������������������������������������������������������������������

loc_19807:				; DATA XREF: seg339:0AE7o
		push	bp
		mov	bp, sp
		cmp	byte_72362, 0
		jz	short loc_1981D
		push	large dword ptr	[bp+6]
		call	UI_NotifyRefresh
		add	sp, 4

loc_1981D:				; CODE XREF: seg022:045Fj
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,91L — projette la vitesse relative sur l'axe source-auditeur (sub_46DA3), divise par une
; constante 'vitesse du son' (0x14A), applique un facteur d'échelle (dword_7048D) : calcul du
; décalage Doppler (pitch shift) pour l'audio 3D.
; ==============================================================================================
Audio3D_DopplerShift	proc far		; CODE XREF: seg022:043Dp

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp

loc_19820:
		mov	bp, sp
		sub	sp, 20h
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	eax, [bx+54h]

loc_19832:
		mov	[bp+var_4], eax

loc_19836:
		cmp	byte_72366, 0
		jnz	short loc_19840

loc_1983D:
		jmp	loc_198CD
; ���������������������������������������������������������������������������

loc_19840:				; CODE XREF: Audio3D_DopplerShift+1Cj
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	bx, [bx+2]
		push	word ptr [bx+51h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	bx, [bx+2]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		push	word ptr [bx+10h]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	Atmosphere_AirDensityAtAltitude_46DA3
		add	sp, 6
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	[bp+var_10], 14Ah
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]

loc_198A3:
		push	ax
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp+var_14]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax

loc_198CD:				; CODE XREF: Audio3D_DopplerShift:loc_1983Dj
		mov	eax, [bp+var_4]
		mov	edx, dword_7048D
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		sar	eax, 8
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], eax
		leave
		retf
Audio3D_DopplerShift	endp

; ���������������������������������������������������������������������������

loc_198F4:				; DATA XREF: seg339:off_6DB83o
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+6]
		les	bx, es:[bx+8]
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	bx, [bx+2]
		push	word ptr [bx+51h]
		push	ss
		lea	ax, [bp-8]
		push	ax

loc_1991D:
		call	Physics_ApplyGroundHeightConstraint
		add	sp, 6
		cmp	dword ptr [bp-8], 400h
		jle	short loc_19934
		mov	ax, 1

loc_19932:
		jmp	short loc_19936
; ���������������������������������������������������������������������������

loc_19934:				; CODE XREF: seg022:057Dj
		xor	ax, ax

loc_19936:				; CODE XREF: seg022:loc_19932j
		or	al, al
		jz	short loc_19951
		cmp	word_70466, 2
		jbe	short loc_19951
		push	0
		push	large dword ptr	[bp-4]
		call	Bitset_SetBit
		add	sp, 6
		jmp	short loc_1995A
; ���������������������������������������������������������������������������

loc_19951:				; CODE XREF: seg022:0588j seg022:058Fj
		les	bx, [bp-4]
		mov	word ptr es:[bx+2Ah], 0

loc_1995A:				; CODE XREF: seg022:059Fj
		mov	word ptr [bp-0Ch], 0
		mov	word ptr [bp-0Ah], 0
		push	0
		lea	ax, [bp-0Ch]
		push	ax
		push	large dword ptr	[bp+6]
		call	UI_NotifyChildrenMove
		add	sp, 8
		leave
		retf
; ���������������������������������������������������������������������������

loc_19978:				; DATA XREF: seg339:0AC3o
		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+6]
		les	bx, es:[bx+8]
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	bx, [bx+2]
		push	word ptr [bx+51h]
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	bx, [bx+2]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_199D0
		push	0

loc_199C2:
		push	large dword ptr	[bp-4]
		call	Bitset_SetBit
		add	sp, 6
		jmp	short loc_199D9
; ���������������������������������������������������������������������������

loc_199D0:				; CODE XREF: seg022:060Ej
		les	bx, [bp-4]
		mov	word ptr es:[bx+2Ah], 0

loc_199D9:				; CODE XREF: seg022:061Ej
		mov	word ptr [bp-8], 0
		mov	word ptr [bp-6], 0
		push	0
		lea	ax, [bp-8]
		push	ax
		push	large dword ptr	[bp+6]
		call	UI_NotifyChildrenMove
		add	sp, 8
		leave
		retf
; ���������������������������������������������������������������������������

loc_199F7:				; DATA XREF: seg339:0AB3o
		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		les	bx, [bp+6]
		les	bx, es:[bx+8]
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	bx, [bx+2]
		push	word ptr [bx+51h]
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]

loc_19A23:
		mov	bx, [bx]

loc_19A25:
		mov	bx, [bx+2]

loc_19A28:
		mov	bx, [bx+51h]
		mov	bx, [bx]

loc_19A2D:
		call	dword ptr [bx+48h]
		pop	cx
		mov	si, ax

loc_19A33:
		mov	eax, [si+69h]
		sar	eax, 3
		mov	[bp-8],	eax
		mov	[bp-0Ch], eax
		mov	eax, [si+6Dh]
		cmp	eax, [bp-0Ch]
		jge	short loc_19A52
		mov	ax, 1
		jmp	short loc_19A54
; ���������������������������������������������������������������������������

loc_19A52:				; CODE XREF: seg022:069Bj
		xor	ax, ax

loc_19A54:				; CODE XREF: seg022:06A0j
		or	al, al
		jz	short loc_19A77
		mov	al, [si+75h]
		shr	ax, 6
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_19A77
		push	0
		push	large dword ptr	[bp-4]
		call	Bitset_SetBit
		add	sp, 6
		jmp	short loc_19A80
; ���������������������������������������������������������������������������

loc_19A77:				; CODE XREF: seg022:06A6j seg022:06B5j
		les	bx, [bp-4]
		mov	word ptr es:[bx+2Ah], 0

loc_19A80:				; CODE XREF: seg022:06C5j
		mov	word ptr [bp-10h], 0
		mov	word ptr [bp-0Eh], 0
		push	0
		lea	ax, [bp-10h]
		push	ax

loc_19A90:
		push	large dword ptr	[bp+6]

loc_19A94:
		call	UI_NotifyChildrenMove

loc_19A99:
		add	sp, 8
		pop	si
		leave
		retf
seg022		ends
