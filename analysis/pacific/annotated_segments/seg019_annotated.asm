seg019		segment	para public 'CODE' use16
		assume cs:seg019
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9EE2		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_9EE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; WorldObjectA_ResetPositionVector_737E5 (sub_737E5 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, réinitialise un vecteur
; position/orientation (0,0,0) écrit à deux emplacements (+2/+6/+0xA et +0xE/+0x12/+0x16) et
; un octet de flag (+0x1A=0).
; ==============================================================================================
WorldObjectA_ResetPositionVector_9EE7		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_18]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+16h], eax
		mov	eax, [bp+var_18]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+0Ah], eax
		mov	byte ptr es:[bx+1Ah], 0
		leave
		retf
WorldObjectA_ResetPositionVector_9EE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9F5D		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	1
		push	0
		push	2
		push	large 1Bh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_9F9A
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 3C8h
		push	dx
		push	bx
		push	cs
		call	near ptr WorldObjectA_ResetPositionVector_9EE7
		add	sp, 4
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_9FA0

loc_9F9A:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_9FA0:
		leave
		retf
sub_9F5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9FA2		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_9FDA
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3C8h
		test	ax, 1
		jz	short loc_9FDA
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_9FDA:
		leave
		retf
sub_9FA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9FDC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		pop	bp
		retf
sub_9FDC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9FEA		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_9FEA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9FF1		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_A029
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3ACh
		test	ax, 1
		jz	short loc_A029
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_A029:
		leave
		retf
sub_9FF1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A02B		proc far
		push	bp
		mov	bp, sp
		xor	ax, ax
sub_A02B		endp
seg019		ends
