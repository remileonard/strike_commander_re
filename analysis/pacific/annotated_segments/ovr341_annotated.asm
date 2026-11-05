ovr341		segment	para public 'OVERLAY' use16
		assume cs:ovr341
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA150		proc far
		push	bp
		mov	bp, sp
		mov	al, 16h
		pop	bp
		retf
sub_BA150		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA157		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_BA19F
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1D14h
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_3C42E
		add	sp, 6
		test	si, 1
		jz	short loc_BA19F
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_BA19F:
		pop	si
		leave
		retf
sub_BA157		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA1A2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 16h
		pop	bp
		retf
sub_BA1A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA1AC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_BA1E3
		mov	word ptr [si], 2F7Ch
		mov	ax, si
		add	ax, 5Eh
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_3C510
		add	sp, 4
		test	di, 1
		jz	short loc_BA1E3
		push	si
		call	sub_3B2
		pop	cx

loc_BA1E3:
		pop	di
		pop	si
		pop	bp
		retf
sub_BA1AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA1E7		proc far

var_42		= word ptr -42h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_3C21D
		pop	cx
		or	al, al
		jnz	short loc_BA200
		jmp	loc_BA38B

loc_BA200:
		mov	al, [si+60h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_BA20C
		jmp	loc_BA38B

loc_BA20C:
		mov	eax, [si+0Eh]
		mov	[bp+var_4], eax
		mov	eax, dword_7976E
		sub	[si+5Ah], eax
		mov	eax, [si+5Ah]
		sar	eax, 1Fh
		inc	ax
		push	0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_36], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_32], eax
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_10]
		mov	[bp+var_2E], eax
		lea	ax, word ptr [bp+var_36]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+66h]
		mov	[bp+var_18], eax
		shl	eax, 8
		cmp	eax, [bp+var_14]
		jle	short loc_BA28D
		mov	ax, 1
		jmp	short loc_BA28F

loc_BA28D:
		xor	ax, ax

loc_BA28F:
		or	al, al
		jnz	short loc_BA296
		jmp	loc_BA391

loc_BA296:
		mov	eax, [si+5Ah]
		sar	eax, 1Fh
		and	ax, 1
		or	ax, ax
		jnz	short loc_BA2A8
		jmp	loc_BA391

loc_BA2A8:
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 5Dh
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		push	1
		push	1
		push	ax
		push	dx
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_BA2D1
		jmp	loc_BA391

loc_BA2D1:
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	[si+39h], eax
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	[si+3Dh], eax
		mov	[bp+var_28], 0FFFFFF00h
		mov	eax, [bp+var_28]
		mov	[si+41h], eax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	ax, si
		add	ax, 2Dh
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	dx, si
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[di+12h], eax
		mov	eax, [bx+4]
		mov	[di+16h], eax
		mov	eax, [bx+8]
		mov	[di+1Ah], eax
		push	si
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		lea	ax, [bp+var_42]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+54h]
		add	sp, 4
		push	di
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		mov	[bp+var_2A], di
		push	[bp+var_2A]
		mov	ax, si
		add	ax, 5Eh
		push	ax
		call	SetReference16
		add	sp, 4
		mov	byte ptr [si+60h], 1
		or	byte ptr [di+2], 1
		or	byte ptr [di+2], 8
		or	byte ptr [di+2], 40h
		and	byte ptr [si+2], 0BFh
		jmp	short loc_BA391

loc_BA38B:
		mov	al, 0
		jmp	short loc_BA393
		jmp	short loc_BA38B

loc_BA391:
		mov	al, 1

loc_BA393:
		pop	di
		pop	si
		leave
		retf
sub_BA1E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA397		proc far

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
		call	near ptr sub_BA41A
		pop	cx
		push	si
		call	sub_46F97
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		mov	[bp+var_8], eax
		mov	eax, [di+8]
		mov	[bp+var_4], eax
		push	word ptr [si+14h]
		call	sub_46E56
		pop	cx
		mov	di, ax
		mov	eax, [di]
		add	[bp+var_C], eax
		mov	eax, [di+4]
		add	[bp+var_8], eax
		mov	eax, [di+8]
		add	[bp+var_4], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	word ptr [si]
		call	sub_46338
		add	sp, 4
		mov	ax, si
		add	ax, 4
		push	ax
		call	Aero_ComputeForcesMain_47600
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	Physics_IntegrateSecondaryPosition
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_BA397		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA41A		proc far

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
		mov	byte_7941D, 0
		mov	byte_7942A, 0
		pop	bp
		retf
sub_BA41A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA44F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	62h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_BA467
		jmp	loc_BA54B

loc_BA467:
		add	ax, 24h
		mov	[si], ax
		mov	ax, si
		add	ax, 24h
		mov	[si+4], ax
		mov	ax, si
		add	ax, 4Ah
		mov	[si+14h], ax
		mov	ax, si
		add	ax, 24h
		mov	[si+4Ah], ax
		mov	word ptr [si+22h], 0
		mov	word ptr [si+48h], 0
		mov	word ptr [si+24h], 1BAEh
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_74EBA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+4Ch], 1B42h
		mov	bx, [si+4Ah]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+56h], eax
		mov	[si+52h], eax
		mov	[si+4Eh], eax
		mov	ax, si
		add	ax, 4Eh
		mov	dword ptr [si+5Eh], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 1Eh
		mov	word ptr [si+2], 19B6h
		mov	word ptr [bx], 19D2h
		add	word ptr [bx-2], 1Eh
		mov	bx, [si+4]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 1A22h
		mov	word ptr [bx], 1A52h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74EFA
		pop	cx
		mov	bx, [si+4]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 1B26h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74F63
		pop	cx
		mov	bx, [si+14h]
		mov	dword ptr [bx+14h], 100h
		mov	word ptr [si+2], 1746h
		mov	word ptr [si+6], 1762h
		mov	bx, [si]
		mov	word ptr [bx], 1796h
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 17E6h
		mov	ax, si
		jmp	short loc_BA54D

loc_BA54B:
		mov	ax, si

loc_BA54D:
		mov	si, ax
		or	si, si
		jz	short loc_BA557
		mov	ax, [si]
		jmp	short loc_BA559

loc_BA557:
		mov	ax, si

loc_BA559:
		pop	si
		pop	bp
		retf
sub_BA44F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA55C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	62h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_BA57D
		jmp	loc_BA69E

loc_BA57D:
		add	ax, 24h
		mov	[si], ax
		mov	ax, si
		add	ax, 24h
		mov	[si+4], ax
		mov	ax, si
		add	ax, 4Ah
		mov	[si+14h], ax
		mov	ax, si
		add	ax, 24h
		mov	[si+4Ah], ax
		mov	word ptr [si+22h], 0
		mov	word ptr [si+48h], 0
		mov	word ptr [si+24h], 1BAEh
		push	[bp+var_2]
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_74EBF
		add	sp, 4
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+4Ch], 1B42h
		mov	bx, [si+4Ah]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+56h], eax
		mov	[si+52h], eax
		mov	[si+4Eh], eax
		mov	ax, si
		add	ax, 4Eh
		mov	dword ptr [si+5Eh], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 1Eh
		mov	word ptr [si+2], 19B6h
		mov	word ptr [bx], 19D2h
		add	word ptr [bx-2], 1Eh
		mov	bx, [si+4]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 1A22h
		mov	word ptr [bx], 1A52h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74EFA
		pop	cx
		mov	bx, [si+4]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+6], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 1B26h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74F63
		pop	cx
		mov	bx, [si+14h]
		mov	dword ptr [bx+14h], 100h
		mov	word ptr [si+2], 1746h
		mov	word ptr [si+6], 1762h
		mov	bx, [si]
		mov	word ptr [bx], 1796h
		mov	bx, [si+14h]
		mov	word ptr [bx+2], 17E6h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74EFA
		pop	cx
		mov	bx, [si+14h]
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8], eax
		mov	[bx+4], eax
		mov	ax, [si+14h]
		add	ax, 4
		mov	dword ptr [bx+14h], 100h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74F63
		pop	cx
		mov	ax, si
		jmp	short loc_BA6A0

loc_BA69E:
		mov	ax, si

loc_BA6A0:
		mov	si, ax
		or	si, si
		jz	short loc_BA6AA
		mov	ax, [si]
		jmp	short loc_BA6AC

loc_BA6AA:
		mov	ax, si

loc_BA6AC:
		pop	si
		leave
		retf
sub_BA55C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA6AF		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	62h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_BA6D1
		jmp	loc_BA7F2

loc_BA6D1:
		add	ax, 24h
		mov	[di], ax
		mov	ax, di
		add	ax, 24h
		mov	[di+4], ax
		mov	ax, di
		add	ax, 4Ah
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 24h
		mov	[di+4Ah], ax
		mov	word ptr [di+22h], 0
		mov	word ptr [di+48h], 0
		mov	word ptr [di+24h], 1BAEh
		push	[bp+var_2]
		mov	ax, di
		add	ax, 24h
		push	ax
		call	sub_74EBF
		add	sp, 4
		mov	bx, [di]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [di+4Ch], 1B42h
		mov	bx, [di+4Ah]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[di+56h], eax
		mov	[di+52h], eax
		mov	[di+4Eh], eax
		mov	ax, di
		add	ax, 4Eh
		mov	dword ptr [di+5Eh], 100h
		mov	bx, [di]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 1Eh
		mov	word ptr [di+2], 19B6h
		mov	word ptr [bx], 19D2h
		add	word ptr [bx-2], 1Eh
		mov	bx, [di+4]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [di+6], 1A22h
		mov	word ptr [bx], 1A52h
		mov	ax, di
		add	ax, 4
		push	ax
		call	sub_74EFA
		pop	cx
		mov	bx, [di+4]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [di+6], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [di+14h]
		mov	word ptr [bx+2], 1B26h
		mov	ax, di
		add	ax, 4
		push	ax
		call	sub_74F63
		pop	cx
		mov	bx, [di+14h]
		mov	dword ptr [bx+14h], 100h
		mov	word ptr [di+2], 1746h
		mov	word ptr [di+6], 1762h
		mov	bx, [di]
		mov	word ptr [bx], 1796h
		mov	bx, [di+14h]
		mov	word ptr [bx+2], 17E6h
		mov	ax, di
		add	ax, 4
		push	ax
		call	sub_74EFA
		pop	cx
		mov	bx, [di+14h]
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8], eax
		mov	[bx+4], eax
		mov	ax, [di+14h]
		add	ax, 4
		mov	dword ptr [bx+14h], 100h
		mov	ax, di
		add	ax, 4
		push	ax
		call	sub_74F63
		pop	cx
		mov	ax, di
		jmp	short loc_BA7F4

loc_BA7F2:
		mov	ax, di

loc_BA7F4:
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr Ctor_CompositeObjectC_RebindPointers_BA80E
		add	sp, 4
		or	di, di
		jz	short loc_BA808
		mov	ax, [di]
		jmp	short loc_BA80A

loc_BA808:
		mov	ax, di

loc_BA80A:
		pop	di
		pop	si
		leave
		retf
sub_BA6AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Ctor_CompositeObjectC_RebindPointers_4F91A (sub_4F91A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, rattache/reprojette des
; pointeurs entre l'objet source (si) et le nouvel objet (di) via
; sub_6CAC5/sub_6CB05/sub_6CB1E/sub_6CB69 — cohérent avec un fixup de reloc d'overlay pour
; objet composite.
; ==============================================================================================
Ctor_CompositeObjectC_RebindPointers_BA80E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_BA821
		mov	ax, [di]
		jmp	short loc_BA823

loc_BA821:
		mov	ax, di

loc_BA823:
		push	ax
		push	word ptr [si]
		call	sub_74EB5
		add	sp, 4
		or	di, di
		jz	short loc_BA839
		mov	ax, di
		add	ax, 4
		jmp	short loc_BA83B

loc_BA839:
		mov	ax, di

loc_BA83B:
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74EF5
		add	sp, 4
		or	di, di
		jz	short loc_BA853
		mov	ax, [di+14h]
		jmp	short loc_BA855

loc_BA853:
		mov	ax, di

loc_BA855:
		push	ax
		push	word ptr [si+14h]
		call	sub_74F0E
		add	sp, 4
		or	di, di
		jz	short loc_BA86C
		mov	ax, di
		add	ax, 4
		jmp	short loc_BA86E

loc_BA86C:
		mov	ax, di

loc_BA86E:
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74F59
		add	sp, 4
		or	di, di
		jz	short loc_BA885
		mov	ax, [di]
		jmp	short loc_BA887

loc_BA885:
		mov	ax, di

loc_BA887:
		push	ax
		push	word ptr [si]
		call	sub_74EB5
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
Ctor_CompositeObjectC_RebindPointers_BA80E		endp
ovr341		ends
