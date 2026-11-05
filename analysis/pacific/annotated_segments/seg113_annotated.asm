seg113		segment	para public 'CODE' use16
		assume cs:seg113
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Physics_IntegrateSecondaryPosition (sub_4696C de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,59L — intègre un vecteur (delta-temps
; dword_70458) dans une position secondaire (+4/8/0xC) : intégrateur d'Euler pour un second
; point de référence (probable rotation/orientation).
; ==============================================================================================
Physics_IntegrateSecondaryPosition		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		mov	[bp+var_8], eax
		mov	eax, [di+8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		add	[si+4], eax
		mov	eax, [bp+var_8]
		add	[si+8], eax
		mov	eax, [bp+var_4]
		add	[si+0Ch], eax
		pop	di
		pop	si
		leave
		retf
Physics_IntegrateSecondaryPosition		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46922		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_79400
		mov	ah, 0
		or	ax, ax
		jz	short loc_46939
		jmp	loc_469C3

loc_46939:
		push	word ptr [si]
		call	sub_463B3
		pop	cx
		mov	bx, ax
		mov	si, bx
		add	si, 4
		mov	di, bx
		add	di, 8
		mov	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [di]
		mov	[bp+var_4], eax
		cmp	[bp+var_8], 0
		jnz	short loc_46974
		cmp	[bp+var_4], 0
		jnz	short loc_46974
		mov	dword_793FC, 0
		jmp	short loc_469BE

loc_46974:
		mov	eax, dword_79CA6
		neg	eax
		mov	dword_793FC, eax
		mov	eax, dword_793FC
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_793FC, eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Math_VectorLength3D_Scaled_Variant_57CA1
		add	sp, 6
		mov	eax, dword_793FC
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_793FC, eax

loc_469BE:
		mov	byte_79400, 1

loc_469C3:
		mov	ax, 2CCCh
		pop	di
		pop	si
		leave
		retf
sub_46922		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_469CA		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_79405
		mov	ah, 0
		or	ax, ax
		jz	short loc_469E1
		jmp	loc_46A68

loc_469E1:
		push	word ptr [si]
		call	sub_463B3
		pop	cx
		mov	bx, ax
		mov	si, bx
		mov	di, bx
		add	di, 4
		mov	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [di]
		mov	[bp+var_4], eax
		cmp	[bp+var_8], 0
		jnz	short loc_46A19
		cmp	[bp+var_4], 0
		jnz	short loc_46A19
		mov	dword_79401, 0
		jmp	short loc_46A63

loc_46A19:
		mov	eax, dword_79CA6
		neg	eax
		mov	dword_79401, eax
		mov	eax, dword_79401
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_79401, eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Math_VectorLength3D_Scaled_Variant_57CA1
		add	sp, 6
		mov	eax, dword_79401
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_79401, eax

loc_46A63:
		mov	byte_79405, 1

loc_46A68:
		mov	ax, 2CD1h
		pop	di
		pop	si
		leave
		retf
sub_469CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46A6F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_46A6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46A77		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_4]
		mov	si, [bp+arg_0]
		mov	di, dx
		add	di, 4
		or	si, si
		jz	short loc_46A8F
		mov	ax, si
		jmp	short loc_46A99

loc_46A8F:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_46A99:
		or	ax, ax
		jz	short loc_46AB7
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_46AB9

loc_46AB7:
		mov	ax, si

loc_46AB9:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
sub_46A77		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46AC3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[si+4], eax
		mov	eax, [di+4]
		mov	[si+8], eax
		mov	eax, [di+8]
		mov	[si+0Ch], eax
		pop	di
		pop	si
		pop	bp
		retf
sub_46AC3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46AE9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 4
		pop	bp
		retf
sub_46AE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46AF6		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	bx, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	si, bx
		add	si, 4
		mov	eax, [si]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [si+4]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_46B6E
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_46B79

loc_46B6E:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_46B79:
		or	ax, ax
		jz	short loc_46B99
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_C]
		mov	[bx], eax
		mov	eax, [bp+var_14]
		mov	[bx+4], eax
		mov	eax, [bp+var_1C]
		mov	[bx+8], eax
		jmp	short loc_46B99

loc_46B99:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_46AF6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46BA2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[si+4], eax
		mov	eax, [di+4]
		mov	[si+8], eax
		mov	eax, [di+8]
		mov	[si+0Ch], eax
		mov	eax, [si+4]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
		mov	ax, si
		add	ax, 8
		mov	eax, [si+0Ch]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 0Ch
		pop	di
		pop	si
		pop	bp
		retf
sub_46BA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46C16		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_7940F
		mov	ah, 0
		or	ax, ax
		jnz	short loc_46C87
		mov	ax, [si]
		add	ax, 2
		push	ax
		mov	ax, [si]
		add	ax, 2
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_4]
		mov	dword_7940B, eax
		push	si
		nop
		push	cs
		call	near ptr sub_46E08
		pop	cx
		mov	si, ax
		mov	eax, dword_7940B
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_7940B, eax
		mov	eax, dword_7940B
		sar	eax, 1
		mov	dword_7940B, eax
		cmp	dword_7940B, 0
		jge	short loc_46C82
		mov	dword_7940B, 0

loc_46C82:
		mov	byte_7940F, 1

loc_46C87:
		mov	ax, 2CDBh
		pop	si
		leave
		retf
sub_46C16		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46C8D		proc far

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
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		mov	si, [bp+arg_4]
		push	0
		mov	al, byte_7CE18
		push	ax
		push	large dword_7CE14
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		mov	eax, [bx+1Ah]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0
		jge	short loc_46CCF
		mov	[bp+var_C], 0

loc_46CCF:
		cmp	[bp+var_C], 77EC00h
		jle	short loc_46CE1
		mov	[bp+var_C], 77EC00h

loc_46CE1:
		mov	eax, [bp+var_C]
		sar	eax, 8
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		mov	[bp+var_10], eax
		mov	ax, word ptr [bp+var_10]
		shl	ax, 2
		mov	dx, [bp+var_6]
		mov	bx, [bp+var_8]
		add	bx, ax
		mov	[bp+var_22], dx
		mov	[bp+var_24], bx
		mov	es, [bp+var_22]
		mov	eax, es:[bx]
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		shl	eax, 8
		mov	[bp+var_30], eax
		sar	eax, 0Ah
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	[bp+var_1C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_28], eax
		mov	[bp+var_3C], eax
		shl	eax, 8
		mov	[bp+var_40], eax
		sar	eax, 0Ah
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	[bp+var_20], eax
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_54], eax
		shl	eax, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_4C], eax
		add	eax, 10000h
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	[bp+var_50], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_4C]
		sub	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_1C]
		sub	[bp+var_64], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_64]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_4C]
		sub	[bp+var_64], eax
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_64]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		mov	eax, [bp+var_1C]
		add	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_46C8D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46E08		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_7940A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_46E50
		mov	bx, [si]
		mov	ax, word_7977C
		add	ax, [bx+22h]
		test	ax, 7
		jnz	short loc_46E43
		push	si
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_46C8D
		add	sp, 6
		mov	eax, [bp+var_4]
		mov	dword_79406, eax
		mov	[si+14h], eax
		jmp	short loc_46E4B

loc_46E43:
		mov	eax, [si+14h]
		mov	dword_79406, eax

loc_46E4B:
		mov	byte_7940A, 1

loc_46E50:
		mov	ax, 2CD6h
		pop	si
		leave
		retf
sub_46E08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46E56		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_79410
		mov	ah, 0
		or	ax, ax
		jz	short loc_46E6D
		jmp	loc_46F45

loc_46E6D:
		push	word ptr [si]
		call	sub_463B3
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[si+4], eax
		mov	eax, [di+4]
		mov	[si+8], eax
		mov	eax, [di+8]
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 4
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [si+10h]
		neg	eax
		mov	[bp+var_4], eax
		push	si
		push	cs
		call	near ptr sub_46C16
		pop	cx
		mov	di, ax
		mov	eax, [si+4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
		mov	ax, si
		add	ax, 8
		mov	eax, [si+0Ch]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 0Ch
		mov	eax, [si+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
		mov	ax, si
		add	ax, 8
		mov	eax, [si+0Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 0Ch
		mov	byte_79410, 1

loc_46F45:
		mov	ax, si
		add	ax, 4
		pop	di
		pop	si
		leave
		retf
sub_46E56		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46F4E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_46F4E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46F56		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_7942A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_46F91
		xor	eax, eax
		mov	dword_79422, eax
		mov	dword_7941E, eax
		mov	eax, dword_7942B
		mov	dword_79426, eax
		push	2CEEh
		mov	bx, [si]
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+70h]
		add	sp, 4
		mov	byte_7942A, 1

loc_46F91:
		mov	ax, 2CEEh
		pop	si
		pop	bp
		retf
sub_46F56		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46F97		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_7941D
		mov	ah, 0
		or	ax, ax
		jnz	short loc_47025
		push	si
		push	cs
		call	near ptr sub_46F56
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	dword_79411, eax
		mov	eax, [di+4]
		mov	dword_79415, eax
		mov	eax, [di+8]
		mov	dword_79419, eax
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, dword_79411
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_79411, eax
		mov	eax, dword_79415
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_79415, eax
		mov	eax, dword_79419
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_79419, eax
		mov	byte_7941D, 1

loc_47025:
		mov	ax, 2CE1h
		pop	di
		pop	si
		leave
		retf
sub_46F97		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4702C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_4702C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47034		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_47093
		pop	cx
		push	si
		push	cs
		call	near ptr sub_46F97
		pop	cx
		mov	di, ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr sub_46E56
		pop	cx
		mov	dx, ax
		mov	eax, [di]
		mov	bx, dx
		add	eax, [bx]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		add	eax, [bx+4]
		mov	[bp+var_8], eax
		mov	eax, [di+8]
		add	eax, [bx+8]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	word ptr [si]
		call	sub_46338
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_47034		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47093		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_793EE, 0
		mov	byte_7941D, 0
		mov	byte_7942A, 0
		mov	byte_7940A, 0
		mov	byte_7940F, 0
		mov	byte_79410, 0
		pop	bp
		retf
sub_47093		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_Method_Dispatch18_A12CD (sub_A12CD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_470B9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+0Ch]
		pop	cx
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch18_470B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_470CB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_470CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_470D3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_47514
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_47526
		pop	cx
		push	ax
		push	word ptr [si+2]
		call	sub_46338
		add	sp, 4
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_470D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_Method_Dispatch18_A12CD (sub_A12CD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_470F9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+4]
		call	dword ptr [bx+0Ch]
		pop	cx
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch18_470F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Équivalent d'Aero_ThrottleThrustCurve_4730F de STRIKE, remplacé par un
; modèle d'HÉLICE. Appel : (&résultat, &jdyn[22h] = sous-objet THRS, cran) ; résultat rangé
; par l'appelant en jdyn[28h]. Recalcul seulement si le cran change ou une image sur 8
; ((word_7977C + [avion+22h]) & 7), sinon rend [THRS+16h]. P = THRS+0Eh (puissance). V = norme
; de la vitesse de l'objet du monde (méthode +50h, sub_5A065). Si V < 0,65625 × Vref (Vref =
; mot jdyn[9Dh], champ 23 de JDYN) : P × 1,047 / 1,074 / 1,098 selon word_7CB07 (0/1/2) si
; l'objet est celui de word_7CADA, sinon P × 0,898 / 0,949 / 1,0 selon byte_7CB11 si l'octet
; +51h de l'objet vaut 255 ; si V > Vref : P ÷ 2. Altitude h ([[objet]+1Ah]) au-dessus de hc =
; jdyn[0A3h] (champ 26, mètres entiers) : P −= P × (h − hc) ÷ (octet THRS+14h × 100 − hc).
; Poussée = 550 × P × 4,4453 × 0,8477 ÷ (max(V, THRS+1Eh ÷ 2) × 3,2773) × cran ÷ 10, bornée ≥
; 0, rangée en THRS+16h (constantes 22600h, 472h, 0D9h, 347h, 0A00h). THRS+0Ah (poussée max),
; +12h et +1Ah ne sont pas utilisés ici.
; ==============================================================================================
Aero_PropellerThrust_4710B		proc far

var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= word ptr -7Eh
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
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
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
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	bx, [si+2]
		mov	ax, word_7977C
		add	ax, [bx+22h]
		test	ax, 7
		jz	short loc_47130
		mov	al, [si+15h]
		cmp	al, [bp+arg_6]
		jnz	short loc_47130
		jmp	loc_474FE

loc_47130:
		mov	al, [bp+arg_6]
		mov	[si+15h], al
		mov	[bp+var_8], 22600h
		mov	[bp+var_C], 472h
		mov	[bp+var_10], 347h
		mov	[bp+var_18], 0D9h
		mov	bx, [si+2]
		push	word ptr [bx+1Eh]
		push	ss
		lea	ax, word ptr [bp+var_96]
		push	ax
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_8E]
		push	large [bp+var_92]
		push	large [bp+var_96]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	[bp+var_1C], eax
		mov	eax, [si+1Eh]
		mov	ebx, 2
		cdq
		idiv	ebx
		cmp	eax, [bp+var_1C]
		jge	short loc_471AB
		mov	eax, [bp+var_1C]
		jmp	short loc_471BA

loc_471AB:
		mov	eax, [si+1Eh]
		mov	ebx, 2
		cdq
		idiv	ebx

loc_471BA:
		mov	[bp+var_4], eax
		mov	bx, [si+2]
		mov	di, [bx+1Eh]
		add	di, 1Ah
		mov	eax, [di]
		mov	[bp+var_24], eax
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+0A3h]
		mov	[bp+var_2C], eax
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	di, si
		add	di, 0Eh
		mov	eax, [di]
		mov	[bp+var_30], eax
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	ax, [bx+9Dh]
		mov	[bp+var_36], ax
		movsx	eax, [bp+var_36]
		shl	eax, 8
		mov	[bp+var_34], eax
		mov	[bp+var_3E], 0A8h
		mov	eax, [bp+var_34]
		mov	edx, [bp+var_3E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_3A]
		jl	short loc_47247
		jmp	loc_47309

loc_47247:
		mov	bx, [si+2]
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		jnz	short loc_472AA
		mov	ax, word_7CB07
		or	ax, ax
		jz	short loc_47267
		cmp	ax, 1
		jz	short loc_47286
		cmp	ax, 2
		jz	short loc_47298
		jmp	loc_4731E

loc_47267:
		mov	[bp+var_46], 10Ch
		mov	eax, [bp+var_30]
		mov	edx, [bp+var_46]

loc_47277:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		jmp	loc_4731E

loc_47286:
		mov	[bp+var_4A], 113h
		mov	eax, [bp+var_30]
		mov	edx, [bp+var_4A]
		jmp	short loc_47277

loc_47298:
		mov	[bp+var_4E], 119h
		mov	eax, [bp+var_30]
		mov	edx, [bp+var_4E]
		jmp	short loc_47277

loc_472AA:
		mov	bx, [si+2]
		mov	bx, [bx+1Eh]
		cmp	byte ptr [bx+51h], 0FFh
		jnz	short loc_4731E
		mov	ax, word ptr byte_7CB11
		mov	[bp+var_7E], ax
		or	ax, ax
		jz	short loc_472CC
		cmp	ax, 1
		jz	short loc_472DC
		cmp	ax, 2
		jz	short loc_472EC
		jmp	short loc_472FE

loc_472CC:
		mov	[bp+var_82], 0E6h
		mov	eax, [bp+var_82]
		jmp	short loc_472FA

loc_472DC:
		mov	[bp+var_86], 0F3h
		mov	eax, [bp+var_86]
		jmp	short loc_472FA

loc_472EC:
		mov	[bp+var_8A], 100h
		mov	eax, [bp+var_8A]

loc_472FA:
		mov	[bp+var_7C], eax

loc_472FE:
		mov	eax, [bp+var_30]
		mov	edx, [bp+var_7C]
		jmp	loc_47277

loc_47309:
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_34]
		jle	short loc_4731E
		mov	eax, [bp+var_30]
		sar	eax, 1
		mov	[bp+var_30], eax

loc_4731E:
		mov	eax, [bp+var_24]
		cmp	eax, [bp+var_28]
		jle	short loc_47390
		mov	al, [si+14h]
		mov	ah, 0
		mov	[bp+var_7E], ax
		movsx	eax, [bp+var_7E]
		shl	eax, 8
		mov	[bp+var_7C], eax
		imul	eax, eax, 64h
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_28]
		sub	[bp+var_7C], eax
		sub	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	edx, eax
		mov	ecx, [bp+var_7C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_82], eax
		mov	eax, [bp+var_30]
		mov	edx, [bp+var_82]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_86], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_8A], eax
		sub	[bp+var_30], eax

loc_47390:
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		sar	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_14], eax
		movzx	eax, byte ptr [si+12h]
		mov	[bp+var_56], eax
		mov	al, [si+14h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		mov	[bp+var_5A], eax
		imul	eax, eax, 64h
		mov	[bp+var_5A], eax
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	eax, [bx+0A3h]
		mov	[bp+var_5E], eax
		mov	al, [bp+arg_6]
		cbw
		mov	[bp+var_64], ax
		movsx	eax, [bp+var_64]
		shl	eax, 8
		mov	[bp+var_62], eax
		cmp	[bp+var_24], 0
		jge	short loc_4746E
		mov	[bp+var_24], 0

loc_4746E:
		cmp	[bp+var_62], 0
		jnz	short loc_4747A
		mov	ax, 1
		jmp	short loc_4747C

loc_4747A:
		xor	ax, ax

loc_4747C:
		or	al, al
		jz	short loc_47490
		mov	[bp+var_68], 0
		mov	eax, [bp+var_68]
		mov	[bp+var_62], eax

loc_47490:
		mov	[bp+var_6C], 500h
		mov	[bp+var_70], 0A00h
		mov	eax, [bp+var_62]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	edx, eax
		mov	ecx, [bp+var_70]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_74], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_78], eax
		mov	[bp+var_62], eax
		mov	eax, [bp+var_62]
		mov	edx, [bp+var_74]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_62], eax
		cmp	[bp+var_62], 0
		jge	short loc_474F1
		mov	[bp+var_62], 0

loc_474F1:
		mov	eax, [bp+var_62]
		mov	[si+16h], eax
		mov	bx, [bp+arg_0]
		jmp	short loc_47507

loc_474FE:
		add	si, 16h
		mov	eax, [si]
		mov	bx, [bp+arg_0]

loc_47507:
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Aero_PropellerThrust_4710B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47514		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_793EE, 0
		mov	byte_7943B, 0
		pop	bp
		retf
sub_47514		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47526		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_7943B
		mov	ah, 0
		or	ax, ax
		jnz	short loc_47566
		xor	eax, eax
		mov	dword_79437, eax
		mov	dword_7942F, eax
		cmp	byte_78EB9, 3
		jz	short loc_47551
		mov	eax, [si+6]
		jmp	short loc_4755D

loc_47551:
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]

loc_4755D:
		mov	dword_79433, eax
		mov	byte_7943B, 1

loc_47566:
		mov	ax, 2CFFh
		pop	si
		leave
		retf
sub_47526		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4756C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_4756C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47574		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_47574		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4757C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_475C3
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_475EE
		pop	cx
		push	ax
		push	word ptr [si]
		call	sub_46338
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr sub_47600
		pop	cx
		push	ax
		push	si
		push	cs
		call	near ptr Physics_IntegrateSecondaryPosition
		add	sp, 4
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_4757C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_Method_Dispatch18_A12CD (sub_A12CD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_475B1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+20h]
		pop	cx
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch18_475B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_475C3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_793EE, 0
		mov	byte_79405, 0
		mov	byte_79400, 0
		mov	byte_7940A, 0
		mov	byte_7940F, 0
		mov	byte_79410, 0
		mov	byte_79448, 0
		pop	bp
		retf
sub_475C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_475EE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+10h]
		push	cs
		call	near ptr sub_46E56
		pop	cx
		pop	si
		pop	bp
		retf
sub_475EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47600		proc far

var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
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
		sub	sp, 0A8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_79448
		mov	ah, 0
		or	ax, ax
		jz	short loc_47618
		jmp	loc_47B36

loc_47618:
		push	word ptr [si+10h]
		push	cs
		call	near ptr sub_46C16
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	di, si
		add	di, 12h
		mov	eax, [bp+var_4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	ebx, 64h
		mov	eax, [bp+var_4]
		cdq
		idiv	ebx
		mov	[bp+var_4], eax
		push	si
		push	cs
		call	near ptr sub_46922
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_8], eax
		push	si
		push	cs
		call	near ptr sub_469CA
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_C], eax
		push	word ptr [si]
		call	sub_463B3
		pop	cx
		mov	di, ax
		xor	cx, cx
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		mov	al, [bx+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_47695
		mov	ax, 1
		jmp	short loc_47697

loc_47695:
		xor	ax, ax

loc_47697:
		or	al, al
		jz	short loc_476A9
		mov	al, [si+92h]
		shr	ax, 6
		and	ax, 1
		mov	ah, 0
		mov	cx, ax

loc_476A9:
		cmp	dword ptr [di+4], 0
		jl	short loc_476B4
		or	cx, cx
		jz	short loc_476E6

loc_476B4:
		cmp	[bp+var_8], 0
		jle	short loc_476C5
		mov	[bp+var_8], 5A00h
		jmp	short loc_476CD

loc_476C5:
		mov	[bp+var_8], 0FFFFA600h

loc_476CD:
		cmp	[bp+var_C], 0
		jle	short loc_476DE
		mov	[bp+var_C], 5A00h
		jmp	short loc_476E6

loc_476DE:
		mov	[bp+var_C], 0FFFFA600h

loc_476E6:
		mov	di, si
		add	di, 16h
		mov	eax, [di]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		sub	[bp+var_10], eax
		mov	eax, [bp+var_10]
		or	eax, eax
		jge	short loc_47706
		neg	eax

loc_47706:
		mov	[bp+var_14], eax
		mov	di, si
		add	di, 1Ah
		mov	eax, [di]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_C]
		sub	[bp+var_18], eax
		mov	eax, [bp+var_18]
		or	eax, eax
		jge	short loc_4772A
		neg	eax

loc_4772A:
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_20], eax
		cmp	[bp+var_10], 0
		jge	short loc_4778E
		mov	eax, [bp+var_10]
		neg	eax
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	Math_Sqrt_56A1E
		add	sp, 6
		mov	eax, [bp+var_34]
		neg	eax
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	[bp+var_20], eax
		jmp	short loc_477C3

loc_4778E:
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_48]
		push	ax
		call	Math_Sqrt_56A1E
		add	sp, 6
		mov	eax, [bp+var_48]
		mov	[bp+var_20], eax

loc_477C3:
		mov	eax, [bp+var_20]
		shl	eax, 1
		mov	[bp+var_20], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_4C], eax
		cmp	[bp+var_18], 0
		jge	short loc_47823
		mov	eax, [bp+var_18]
		neg	eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	eax, [bp+var_4C]
		mov	edx, [bp+var_54]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_60]
		push	ax
		call	Math_Sqrt_56A1E
		add	sp, 6
		mov	eax, [bp+var_60]
		mov	[bp+var_4C], eax
		jmp	short loc_47863

loc_47823:
		mov	eax, [bp+var_4C]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_68], eax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_6C]
		push	ax
		call	Math_Sqrt_56A1E
		add	sp, 6
		mov	eax, [bp+var_6C]
		neg	eax
		mov	[bp+var_70], eax
		mov	[bp+var_74], eax
		mov	[bp+var_4C], eax

loc_47863:
		mov	eax, [bp+var_4C]
		shl	eax, 1
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		cmp	[bp+var_78], 0
		jle	short loc_478C3
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_78]
		jle	short loc_478D5
		mov	eax, [bp+var_78]
		mov	[bp+var_20], eax
		jmp	short loc_478D5

loc_478C3:
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_78]
		jge	short loc_478D5
		mov	eax, [bp+var_78]
		mov	[bp+var_20], eax

loc_478D5:
		cmp	[bp+var_7C], 0
		jle	short loc_478F6
		mov	eax, [bp+var_7C]
		neg	eax
		cmp	eax, [bp+var_4C]
		jle	short loc_4790E
		mov	eax, [bp+var_7C]
		neg	eax
		mov	[bp+var_4C], eax
		jmp	short loc_4790E

loc_478F6:
		mov	eax, [bp+var_7C]
		neg	eax
		cmp	eax, [bp+var_4C]
		jge	short loc_4790E
		mov	eax, [bp+var_7C]
		neg	eax
		mov	[bp+var_4C], eax

loc_4790E:
		mov	[bp+var_80], 38h
		mov	eax, [bp+var_80]
		shl	eax, 8
		mov	[bp+var_84], eax
		mov	[bp+var_88], eax
		sar	eax, 8
		cmp	eax, [bp+var_14]
		jle	short loc_4793A
		mov	[bp+var_20], 0

loc_4793A:
		mov	[bp+var_8C], 38h
		mov	eax, [bp+var_8C]
		shl	eax, 8
		mov	[bp+var_90], eax
		mov	[bp+var_94], eax
		sar	eax, 8
		cmp	eax, [bp+var_1C]
		jle	short loc_47968
		mov	[bp+var_4C], 0

loc_47968:
		mov	eax, [bp+var_20]
		mov	[bp+var_98], eax
		mov	di, si
		add	di, 4
		mov	eax, [di]
		sub	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_9C], eax
		mov	di, si
		add	di, 0Ch
		mov	eax, [di]
		sub	[bp+var_9C], eax
		mov	eax, [bp+var_9C]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_A0], eax
		imul	eax, eax, 3
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A4]
		cmp	eax, [bp+var_A0]
		jle	short loc_47A00
		mov	eax, [bp+var_A0]
		mov	[bp+var_A4], eax
		jmp	short loc_47A1C

loc_47A00:
		mov	eax, [bp+var_A0]
		neg	eax
		cmp	eax, [bp+var_A4]
		jle	short loc_47A1C
		mov	eax, [bp+var_A0]
		neg	eax
		mov	[bp+var_A4], eax

loc_47A1C:
		mov	eax, [bp+var_A8]
		cmp	eax, [bp+var_A0]
		jle	short loc_47A34
		mov	eax, [bp+var_A0]
		mov	[bp+var_A8], eax
		jmp	short loc_47A50

loc_47A34:
		mov	eax, [bp+var_A0]
		neg	eax
		cmp	eax, [bp+var_A8]
		jle	short loc_47A50
		mov	eax, [bp+var_A0]
		neg	eax
		mov	[bp+var_A8], eax

loc_47A50:
		cmp	[bp+var_20], 0
		jle	short loc_47A5C
		mov	ax, 1
		jmp	short loc_47A5E

loc_47A5C:
		xor	ax, ax

loc_47A5E:
		or	al, al
		jz	short loc_47A77
		mov	eax, [si+4]
		cmp	eax, [bp+var_20]
		jle	short loc_47A71
		mov	ax, 1
		jmp	short loc_47A73

loc_47A71:
		xor	ax, ax

loc_47A73:
		or	al, al
		jnz	short loc_47A9E

loc_47A77:
		cmp	[bp+var_20], 0
		jge	short loc_47A83
		mov	ax, 1
		jmp	short loc_47A85

loc_47A83:
		xor	ax, ax

loc_47A85:
		or	al, al
		jz	short loc_47AA8
		mov	eax, [si+4]
		cmp	eax, [bp+var_20]
		jge	short loc_47A98
		mov	ax, 1
		jmp	short loc_47A9A

loc_47A98:
		xor	ax, ax

loc_47A9A:
		or	al, al
		jz	short loc_47AA8

loc_47A9E:
		mov	eax, [bp+var_98]
		mov	[bp+var_A4], eax

loc_47AA8:
		cmp	[bp+var_4C], 0
		jle	short loc_47AB4
		mov	ax, 1
		jmp	short loc_47AB6

loc_47AB4:
		xor	ax, ax

loc_47AB6:
		or	al, al
		jz	short loc_47ACF
		mov	eax, [si+0Ch]
		cmp	eax, [bp+var_4C]
		jle	short loc_47AC9
		mov	ax, 1
		jmp	short loc_47ACB

loc_47AC9:
		xor	ax, ax

loc_47ACB:
		or	al, al
		jnz	short loc_47AF6

loc_47ACF:
		cmp	[bp+var_4C], 0
		jge	short loc_47ADB
		mov	ax, 1
		jmp	short loc_47ADD

loc_47ADB:
		xor	ax, ax

loc_47ADD:
		or	al, al
		jz	short loc_47B00
		mov	eax, [si+0Ch]
		cmp	eax, [bp+var_4C]
		jge	short loc_47AF0
		mov	ax, 1
		jmp	short loc_47AF2

loc_47AF0:
		xor	ax, ax

loc_47AF2:
		or	al, al
		jz	short loc_47B00

loc_47AF6:
		mov	eax, [bp+var_9C]
		mov	[bp+var_A8], eax

loc_47B00:
		sub	sp, 4
		mov	eax, [bp+var_A8]
		mov	[bp+var_B0], eax
		sub	sp, 4
		mov	[bp+var_B4], 0
		sub	sp, 4
		mov	eax, [bp+var_A4]
		mov	[bp+var_B8], eax
		push	2D0Ch
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		mov	byte_79448, 1

loc_47B36:
		mov	ax, 2D0Ch
		pop	di
		pop	si
		leave
		retf
sub_47600		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47B3D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_47B3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47B45		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_47B45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47B4D		proc far

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
		sub	sp, 34h
		mov	dword_793FC, 0
		mov	dword_79401, 0
		mov	dword_79406, 0
		mov	dword_7940B, 0
		mov	dword_7CE14, 0
		mov	byte_7CE18, 2
		mov	byte_7CE19, 0
		mov	dword_7CE1A, 0
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	dword_79411, eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	dword_79415, eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	dword_79419, eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	dword_7941E, eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	dword_79422, eax
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	dword_79426, eax
		mov	[bp+var_1C], 0FFFFF634h
		mov	eax, [bp+var_1C]
		mov	dword_7942B, eax
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	dword_7942F, eax
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	dword_79433, eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	dword_79437, eax
		mov	[bp+var_2C], 0
		mov	eax, [bp+var_2C]
		mov	dword_7943C, eax
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]
		mov	dword_79440, eax
		mov	[bp+var_34], 0
		mov	eax, [bp+var_34]
		mov	dword_79444, eax
		leave
		retf
sub_47B4D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47C65		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7CE19, 0
		jz	short loc_47C8D
		cmp	dword_7CE14, 0
		jz	short loc_47C8D
		push	0
		mov	al, byte_7CE18
		push	ax
		push	66E4h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_47C8D

loc_47C8D:
		mov	dword_7CE14, 0
		mov	byte_7CE19, 0
sub_47C65		endp

; START OF FUNCTION CHUNK FOR sub_47C65
		db 66h, 0C7h, 6, 0EAh, 66h
; END OF FUNCTION CHUNK FOR sub_47C65
seg113		ends
