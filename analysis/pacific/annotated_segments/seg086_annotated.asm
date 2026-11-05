seg086		segment	para public 'CODE' use16
		assume cs:seg086
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36310		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_36310		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3631A		proc far

var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+2], 0
		jnz	short loc_36331
		jmp	loc_36510

loc_36331:
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		cmp	[si+4], di
		jz	short loc_36346
		mov	[bp+var_1], 1
		mov	[bp+var_2], 1

loc_36346:
		mov	[si+4], di
		mov	[di+5Eh], si
		mov	ax, word_7977C
		mov	[si+6], ax

loc_36352:
		mov	bx, [si+2]
		mov	dx, [bx+0BFh]
		xor	cx, cx
		jmp	short loc_36397

loc_3635D:
		mov	bx, dx
		mov	eax, [bx+92h]
		cmp	eax, dword_7CC84
		jl	short loc_36392
		cmp	[si+71h], dx
		jz	short loc_3639C
		mov	[si+71h], dx
		push	bx
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_73FAE
		add	sp, 4
		xor	ax, ax
		mov	[si+127h], ax
		mov	[si+11Bh], ax
		mov	[bp+var_2], 1
		jmp	short loc_3639C

loc_36392:
		inc	cx
		add	dx, 9Ah

loc_36397:
		cmp	[si+8], cx
		jg	short loc_3635D

loc_3639C:
		cmp	byte_77C4C, 0
		jz	short loc_363BB
		mov	al, [bp+var_2]
		push	ax
		mov	ax, di
		add	ax, 14h
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_31A0F
		add	sp, 6

loc_363BB:
		movsx	eax, word ptr [si+119h]
		mov	[bp+var_6], eax
		mov	eax, [si+115h]
		mov	[bp+var_A], eax
		shl	eax, 8
		mov	edx, [di+1Ch]
		sub	edx, eax
		mov	[bp+var_E], edx
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	ax, word ptr [bp+var_12+1]
		mov	[si+119h], ax
		cmp	word ptr [si+119h], 0
		jle	short loc_36400
		cmp	[bp+var_6], 0
		jle	short loc_36400

loc_363FA:
		inc	word ptr [si+11Bh]
		jmp	short loc_36414

loc_36400:
		cmp	word ptr [si+119h], 0
		jge	short loc_3640E
		cmp	[bp+var_6], 0
		jl	short loc_363FA

loc_3640E:
		mov	word ptr [si+11Bh], 0

loc_36414:
		mov	eax, [di+1Ch]
		sar	eax, 8
		mov	[si+115h], eax
		mov	eax, [si+121h]
		mov	[bp+var_16], eax
		mov	ax, di
		add	ax, 14h
		push	ax
		push	word ptr [si+71h]
		call	Terrain_HeightSample
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[si+121h], eax
		movsx	eax, word ptr [si+125h]
		mov	[bp+var_1A], eax
		mov	ax, [si+121h]
		sub	ax, word ptr [bp+var_16]
		mov	[si+125h], ax
		cmp	word ptr [si+125h], 0
		jle	short loc_3646D
		cmp	[bp+var_1A], 0
		jle	short loc_3646D

loc_36467:
		inc	word ptr [si+127h]
		jmp	short loc_36481

loc_3646D:
		cmp	word ptr [si+125h], 0
		jge	short loc_3647B
		cmp	[bp+var_1A], 0
		jl	short loc_36467

loc_3647B:
		mov	word ptr [si+127h], 0

loc_36481:
		mov	eax, [si+115h]
		sub	eax, [si+121h]
		mov	[si+11Dh], eax
		cmp	word ptr [si+127h], 4
		jg	short loc_364A4
		cmp	word ptr [si+11Bh], 0Ah
		jg	short loc_364A4
		cmp	[bp+var_1], 0
		jz	short loc_364CF

loc_364A4:
		cmp	dword ptr [si+11Dh], 0
		jge	short loc_364B1
		xor	eax, eax
		jmp	short loc_364B6

loc_364B1:
		mov	eax, [si+11Dh]

loc_364B6:
		push	eax
		push	64DEh
		call	Palette_SelectFogRow_2DFD3
		add	sp, 6
		mov	word ptr [si+127h], 0
		mov	word ptr [si+11Bh], 0

loc_364CF:
		cmp	[bp+var_1], 0
		jz	short loc_364DC
		mov	[bp+var_1], 0
		jmp	loc_36352

loc_364DC:
		cmp	byte_77C4C, 0
		jz	short loc_364F2
		push	di
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Terrain_TileBoundaryTest
		add	sp, 4

loc_364F2:
		push	di
		mov	ax, si
		add	ax, 73h
		push	ax
		call	sub_312A5
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 0F0h
		push	ax
		call	Picking_ComputeWrapper
		add	sp, 4

loc_36510:
		pop	di
		pop	si
		leave
		retf
sub_3631A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36514		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word_77C4D, 0
		jz	short loc_36535
		mov	ax, word_7977C
		cmp	ax, word_77C4D
		jbe	short loc_36535
		mov	word_77C4D, 0

loc_36535:
		push	word_7977C
		push	658Ch
		call	TerrainTile_EvictOutOfRange
		add	sp, 4
		push	ds
		push	offset word_7CCEA
		call	sub_50903
		add	sp, 4
		mov	ax, si
		add	ax, 0B5h
		mov	[bp+var_4], ax
		mov	[bp+var_2], 0
		jmp	short loc_365B2

loc_3655F:
		mov	bx, [bp+var_4]
		mov	di, [bx]
		cmp	word ptr [di+4], 0
		jnz	short loc_365AB
		mov	ax, word_7977C
		sub	ax, [di+6]
		cmp	ax, 8
		jbe	short loc_365AB
		or	di, di
		jz	short loc_36585
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_36585

loc_36585:
		mov	di, [bp+var_4]
		mov	cx, [bp+var_4]
		add	cx, 2
		mov	dx, [bp+var_2]
		inc	dx
		jmp	short loc_365A1

loc_36594:
		mov	bx, cx
		mov	ax, [bx]
		mov	[di], ax
		add	cx, 2
		add	di, 2
		inc	dx

loc_365A1:
		cmp	[si+0B3h], dx
		jg	short loc_36594
		dec	word ptr [si+0B3h]

loc_365AB:
		inc	[bp+var_2]
		add	[bp+var_4], 2

loc_365B2:
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_2]
		jg	short loc_3655F
		call	sub_32716
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_36514		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_365C6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h
		xor	dx, dx
		jmp	short loc_365F5

loc_365D8:
		mov	cx, [di]
		mov	bx, cx
		mov	ax, [bx+4]
		cmp	ax, [bp+arg_2]
		jnz	short loc_365F1

loc_365E4:
		push	[bp+arg_2]
		push	cx
		push	cs
		call	near ptr sub_3631A
		add	sp, 4
		jmp	short loc_36649

loc_365F1:
		inc	dx
		add	di, 2

loc_365F5:
		cmp	[si+0B3h], dx
		jg	short loc_365D8
		mov	di, si
		add	di, 0B5h
		xor	dx, dx
		jmp	short loc_36613

loc_36605:
		mov	cx, [di]
		mov	bx, cx
		cmp	word ptr [bx+4], 0
		jz	short loc_365E4
		inc	dx
		add	di, 2

loc_36613:
		cmp	[si+0B3h], dx
		jg	short loc_36605
		cmp	word ptr [si+0B3h], 4
		jge	short loc_36649
		push	si
		call	sub_740F8
		pop	cx
		mov	bx, [si+0B3h]
		shl	bx, 1
		mov	[bx+si+0B5h], ax
		push	[bp+arg_2]
		mov	bx, [si+0B3h]
		shl	bx, 1
		push	word ptr [bx+si+0B5h]
		push	cs
		call	near ptr sub_3631A
		add	sp, 4
		inc	word ptr [si+0B3h]

loc_36649:
		pop	di
		pop	si
		pop	bp
		retf
sub_365C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3664D		proc far

var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		push	large 10000h
		push	0
		push	[bp+arg_8]
		call	Utility_Helper_57B7D
		add	sp, 8
		push	di
		push	word ptr [si+0BFh]
		call	Terrain_HeightSample
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	ax, si
		add	ax, 0B5h
		mov	[bp+var_8], ax
		mov	[bp+var_6], 0
		jmp	loc_36731

loc_36693:
		mov	bx, [bp+var_8]
		mov	ax, [bx]
		mov	[bp+var_A], ax
		push	di
		add	ax, 0Ah
		push	ax
		call	Camera_FrustumBoundsTest
		add	sp, 4
		or	al, al
		jz	short loc_3672A
		mov	eax, [bp+var_4]
		mov	[bp+var_E], eax
		shl	eax, 8
		cmp	eax, [di+8]
		jle	short loc_366C3
		mov	ax, 1
		jmp	short loc_366C5

loc_366C3:
		xor	ax, ax

loc_366C5:
		or	al, al
		jnz	short loc_366DC
		cmp	[bp+arg_A], 0
		jnz	short loc_366DC
		push	29Ch
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_3672A

loc_366DC:
		mov	byte ptr [si+207h], 1
		mov	eax, [bp+arg_0]
		mov	[bp+var_12], eax
		mov	si, di
		mov	ax, [bp+arg_8]
		mov	[bp+var_14], ax
		push	ax
		sub	sp, 0Ch
		mov	eax, [si]
		mov	[bp+var_2A], eax
		mov	eax, [si+4]
		mov	[bp+var_26], eax
		mov	eax, [si+8]
		mov	[bp+var_22], eax
		mov	ax, [bp+var_A]
		add	ax, 0Ah
		push	ax
		push	large [bp+var_12]
		call	sub_32021
		add	sp, 14h
		les	bx, word ptr [bp+var_12]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		jmp	short loc_3677A

loc_3672A:
		inc	[bp+var_6]
		add	[bp+var_8], 2

loc_36731:
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_6]
		jle	short loc_3673D
		jmp	loc_36693

loc_3673D:
		mov	byte ptr [si+207h], 0
		mov	si, word ptr [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		or	si, si
		jz	short loc_36755
		mov	ax, si
		jmp	short loc_3675F

loc_36755:
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_3675F:
		or	ax, ax
		jz	short loc_36772
		mov	eax, [bp+var_18]
		shl	eax, 8
		mov	[si], eax
		mov	ax, si
		jmp	short loc_36774

loc_36772:
		mov	ax, si

loc_36774:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_3677A:
		pop	di
		pop	si
		leave
		retf
sub_3664D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3677E		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	dx
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_3664D
		add	sp, 0Ch
		cmp	[bp+var_4], 200h
		jg	short loc_367AD
		mov	ax, 1
		jmp	short loc_367AF

loc_367AD:
		xor	ax, ax

loc_367AF:
		leave
		retf
sub_3677E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_367B1		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h
		mov	[bp+var_2], 0
		jmp	short loc_367E4

loc_367C9:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	ax
		mov	ax, [di]
		add	ax, 0Ah
		push	ax
		call	sub_74003
		add	sp, 4
		inc	[bp+var_2]
		add	di, 2

loc_367E4:
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_2]
		jg	short loc_367C9
		mov	ax, word_7977C
		add	ax, 4
		mov	word_77C4D, ax
		pop	di
		pop	si
		leave
		retf
sub_367B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Terrain_TestAdjacentVisibility (sub_37A2E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,73L — teste l'inclusion dans le frustum
; (sub_32F55) de chacun des 10 patches adjacents (+0xB5) : test de visibilité des patches de
; terrain voisins.
; ==============================================================================================
Terrain_TestAdjacentVisibility		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h
		mov	[bp+var_2], 0
		jmp	short loc_36848

loc_36812:
		mov	ax, [di]
		mov	[bp+var_4], ax
		push	[bp+arg_2]
		add	ax, 0Ah
		push	ax
		call	Camera_FrustumBoundsTest
		add	sp, 4
		or	al, al
		jz	short loc_36842
		mov	ax, [bp+arg_2]
		mov	[bp+var_6], ax
		push	ax
		mov	ax, [bp+var_4]
		add	ax, 0Ah
		push	ax
		call	sub_32C2E
		add	sp, 4
		jmp	short loc_36853

loc_36842:
		inc	[bp+var_2]
		add	di, 2

loc_36848:
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_2]
		jg	short loc_36812
		mov	al, 0FFh

loc_36853:
		pop	di
		pop	si
		leave
		retf
Terrain_TestAdjacentVisibility		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_DestructWrapper_3D231 (sub_3D231 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée via vtable (DATA XREF seg339) —
; enveloppe appelant StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main
; (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_36857		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	658Ch
		call	TerrainTile_ListClear
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_36857		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36868		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_36868		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36870		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h
		mov	[bp+var_6], 0
		jmp	short loc_368B6

loc_36888:
		mov	ax, [di]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_8], ax
		push	ax
		mov	ax, [bp+var_4]
		add	ax, 73h
		push	ax
		call	Model_RenderStatic
		add	sp, 4
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_368B0
		mov	al, 1
		jmp	short loc_368C1

loc_368B0:
		inc	[bp+var_6]
		add	di, 2

loc_368B6:
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_6]
		jg	short loc_36888
		mov	al, 0

loc_368C1:
		pop	di
		pop	si
		leave
		retf
sub_36870		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_368C5		proc far

var_E		= dword ptr -0Eh
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h
		mov	[bp+var_4], 0
		jmp	short loc_36922

loc_368DD:
		mov	ax, [di]
		mov	[bp+var_2], ax
		lea	ax, word ptr [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		mov	ax, [bp+var_2]
		add	ax, 0Ah
		push	ax
		call	Camera_DistanceLimitTest
		add	sp, 6
		or	al, al
		jz	short loc_3691C
		mov	al, [bp+arg_8]
		push	ax
		sub	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_E], eax
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 0C1h
		push	ax
		call	sub_73ED0
		add	sp, 0Ah

loc_3691C:
		inc	[bp+var_4]
		add	di, 2

loc_36922:
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_4]
		jg	short loc_368DD
		pop	di
		pop	si
		leave
		retf
sub_368C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3692F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, dx
		add	ax, 171h
		push	ax
sub_3692F		endp

; START OF FUNCTION CHUNK FOR sub_3692F
		db 9Ah, 3
; END OF FUNCTION CHUNK FOR sub_3692F
seg086		ends
