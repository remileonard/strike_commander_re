seg065		segment	para public 'CODE' use16
		assume cs:seg065
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26A55		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_26A55		endp

; START OF FUNCTION CHUNK FOR sub_26A55
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26A55

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26A5E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_49DEF, cl
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_4830A
		add	sp, 6
		push	0
		push	large 4E474C41h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_26AAB
		push	si
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], al
		jmp	short loc_26AB3

loc_26AAB:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+23h], 0

loc_26AB3:
		pop	si
		pop	bp
		retf
sub_26A5E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26AB6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		nop
		push	cs
		call	near ptr sub_26B54
		add	sp, 6
		mov	si, ax
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48319
		add	sp, 6
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_26AB6		endp

; START OF FUNCTION CHUNK FOR sub_26AB6
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26AB6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26AE3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_26AFE
		push	51h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_26B4C

loc_26AFE:
		mov	word ptr [si], 3884h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 37F8h
		push	si
		call	Debris_BodyReset
		add	sp, 2
		mov	word ptr [si], 38D0h
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	sub_2A4FF
		add	sp, 2
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	Matrix_BuildFromAngle_2A535
		add	sp, 2
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h

loc_26B4C:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_26AE3		endp

; START OF FUNCTION CHUNK FOR sub_26AE3
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26AE3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26B54		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_26B72
		push	51h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_26BE1

loc_26B72:
		mov	word ptr [si], 3884h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 37F8h
		push	si
		call	Debris_BodyReset
		add	sp, 2
		mov	word ptr [si], 38D0h
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	sub_2A4FF
		add	sp, 2
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	si
		call	sub_25CEB
		add	sp, 6
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	Matrix_BuildFromAngle_2A535
		add	sp, 2
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+23h]
		mov	[si+50h], al

loc_26BE1:
		mov	ax, si
		pop	si
		leave
		retf
sub_26B54		endp

; START OF FUNCTION CHUNK FOR sub_26B54
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_26B54

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TranslucentFont_Destruct_67184 (sub_67184 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. Destructeur (entrée 0 de la table de méthodes dseg 1DADh) de la police à
; pixels translucides des titres de mid1 : remet la table de méthodes (mov word ptr [si],
; 1DADh), appelle GlyphObject_ScalarDeletingDtorA_313D6, libère l'objet si le bit 0 de arg_2
; est mis.
; ==============================================================================================
TranslucentFont_Destruct_26BE9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_26C16
		mov	word ptr [si], 38D0h
		push	0
		push	si
		call	sub_482CA
		add	sp, 4
		test	di, 1
		jz	short loc_26C16
		push	si
		call	sub_39C
		add	sp, 2

loc_26C16:
		pop	di
		pop	si
		pop	bp
		retf
TranslucentFont_Destruct_26BE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26C1A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_26C1A		endp

; START OF FUNCTION CHUNK FOR sub_26C1A
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26C1A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26C26		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_25E1C
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_26C26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26C39		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	Matrix_BuildFullOrientation_2AE2E
		add	sp, 8
		push	si
		call	sub_25E1C
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_26C39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26C63		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	WorldObject_BuildOrientationMatrix_2A682
		add	sp, 4
		push	si
		call	sub_25E1C
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_26C63		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26C87		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 2Ch
		pop	bp
		retf
sub_26C87		endp

; START OF FUNCTION CHUNK FOR sub_26C87
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26C87

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26C96		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_26CB4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+74h]
		add	sp, 2
		mov	ax, [si+26h]
		pop	si
		pop	bp
		retf
		jmp	short loc_26CBC

loc_26CB4:
		mov	ax, si
		add	ax, 2Ch
		pop	si
		pop	bp
		retf
sub_26C96		endp

; START OF FUNCTION CHUNK FOR sub_26C96

loc_26CBC:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26C96

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26CBF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		push	[bp+arg_2]
		call	Matrix_WorldToLocal_2BED7
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_26CBF		endp

; START OF FUNCTION CHUNK FOR sub_26CBF
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26CBF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26CE1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		push	[bp+arg_2]
		call	sub_2BF97
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_26CE1		endp

; START OF FUNCTION CHUNK FOR sub_26CE1
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26CE1

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26D03		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	sub_2A606
		add	sp, 4
		push	si
		call	sub_25E1C
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_26D03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26D27		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_260FE
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_26D27		endp

; START OF FUNCTION CHUNK FOR sub_26D27
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_26D27

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26D3D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_26D91
		mov	bx, [si+26h]
		mov	al, [bx+30h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_26D91
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		push	word ptr [si+26h]
		call	sub_2A606
		add	sp, 4
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+78h]
		add	sp, 2
		push	ax
		push	word ptr [si+26h]
		call	sub_2B03A
		add	sp, 4
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 2

loc_26D91:
		pop	si
		pop	bp
		retf
sub_26D3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26D94		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_26D94		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26D9C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	di
		call	sub_2B004
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_26D9C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26DB5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
sub_26DB5		endp
seg065		ends
