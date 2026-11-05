seg040		segment	para public 'CODE' use16
		assume cs:seg040
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BF72		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1BF8B
		push	23h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1BFBB

loc_1BF8B:
		push	[bp+arg_E]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [si], 1EDFh
		mov	word ptr [si+0Ah], 1F03h
		mov	ax, [bp+arg_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+arg_A]
		mov	[si+1Fh], ax
		mov	ax, [bp+arg_C]
		mov	[si+21h], ax

loc_1BFBB:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1BF72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BFC0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_6]
		cmp	ax, 0FFFFh
		jz	short loc_1C010
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	ax
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1BFF6
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1BFFC

loc_1BFF6:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1BFFC:
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_5DD42
		call	sub_50B08
		add	sp, 12h

loc_1C010:
		pop	si
		pop	bp
		retf
sub_1BFC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C013		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+1Bh]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 8
		mov	[bp+var_2], 0
		jmp	short loc_1C04D

loc_1C038:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_1C04D:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_1C038
		pop	di
		pop	si
		leave
		retf
sub_1C013		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_624F3 (sub_624F3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le
; calque à sa position absolue (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 /
; Layer_GetY_2E15D) par Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_1C067		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1C013
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_1C067		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C094		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1C013
		add	sp, 6
		pop	si
		leave
		retf
sub_1C094		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C0BF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Dh], ax
		pop	si
		pop	bp
		retf
sub_1C0BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ScaledImageLayer_SetScale_94F4 (sub_94F4 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. Pose l'échelle d'un
; ScaledImageLayer : [arg_0 + 1Fh] = arg_2 (1/256, 256 = taille d'origine). mid15 : zoom des
; deux avions du premier plan, de 32 à 255.
; ==============================================================================================
ScaledImageLayer_SetScale_1C0CF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Fh], ax
		pop	si
		pop	bp
		retf
ScaledImageLayer_SetScale_1C0CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; MovingMaskLayer_SetTable_BA1C (sub_BA1C de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. +21h = arg_2 (table de 256
; couleurs du calque masque).
; ==============================================================================================
MovingMaskLayer_SetTable_1C0DF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
MovingMaskLayer_SetTable_1C0DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C0EF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Dh]
		pop	si
		pop	bp
		retf
sub_1C0EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C0FC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Fh]
		pop	si
		pop	bp
		retf
sub_1C0FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C109		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+21h]
		pop	si
		pop	bp
		retf
sub_1C109		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C116		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1C132
		push	25h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1C19D

loc_1C132:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_E]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_10]
		mov	[bp+var_C], ax
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 1E7Bh
		mov	word ptr [si+0Ah], 1E9Fh
		mov	ax, [bp+arg_8]
		mov	[si+21h], ax
		mov	ax, [bp+arg_A]
		mov	[si+23h], ax

loc_1C19D:
		mov	ax, si
		pop	si
		leave
		retf
sub_1C116		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C1A2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+1Bh]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 8
		mov	[bp+var_2], 0
		jmp	short loc_1C1DC

loc_1C1C7:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_1C1DC:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_1C1C7
		pop	di
		pop	si
		leave
		retf
sub_1C1A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_624F3 (sub_624F3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le
; calque à sa position absolue (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 /
; Layer_GetY_2E15D) par Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_1C1F6		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1C1A2
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_1C1F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C223		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1C1A2
		add	sp, 6
		pop	si
		leave
		retf
sub_1C223		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; MovingMaskLayer_SetTable_BA1C (sub_BA1C de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. +21h = arg_2 (table de 256
; couleurs du calque masque).
; ==============================================================================================
MovingMaskLayer_SetTable_1C24E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
MovingMaskLayer_SetTable_1C24E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C25E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+23h], ax
		pop	si
		pop	bp
		retf
sub_1C25E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C26E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1C287
		push	25h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1C2B7

loc_1C287:
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_1D22E
		add	sp, 0Eh
		mov	word ptr [si], 1E47h
		mov	word ptr [si+0Ah], 1E6Bh
		mov	ax, [bp+arg_8]
		mov	[si+21h], ax
		mov	ax, [bp+arg_A]
		mov	[si+23h], ax

loc_1C2B7:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1C26E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C2BC		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+1Bh]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 8
		mov	[bp+var_2], 0
		jmp	short loc_1C2F6

loc_1C2E1:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_1C2F6:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_1C2E1
		pop	di
		pop	si
		leave
		retf
sub_1C2BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_624F3 (sub_624F3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le
; calque à sa position absolue (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 /
; Layer_GetY_2E15D) par Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_1C310		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1C2BC
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_1C310		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C33D		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1C2BC
		add	sp, 6
		pop	si
		leave
		retf
sub_1C33D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; MovingMaskLayer_SetTable_BA1C (sub_BA1C de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. +21h = arg_2 (table de 256
; couleurs du calque masque).
; ==============================================================================================
MovingMaskLayer_SetTable_1C368		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
MovingMaskLayer_SetTable_1C368		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C378		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+23h], ax
		pop	si
		pop	bp
		retf
sub_1C378		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C388		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+1Dh]
		call	sub_45058
		pop	cx
		mov	word ptr [si+1Dh], 0
		or	di, di
		jz	short loc_1C3BE
		push	di
		call	CRT_Strdup
		pop	cx
		mov	[si+1Dh], ax
		push	word ptr [si+1Dh]
		call	CRT_Strupr_2D5D
		pop	cx
		mov	ax, [si+1Dh]
		mov	[si+1Fh], ax

loc_1C3BE:
		pop	di
		pop	si
		pop	bp
		retf
sub_1C388		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C3C2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1C3DF
		push	853h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_1C3DF
		jmp	loc_1C492

loc_1C3DF:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1D8Fh
		mov	word ptr [si+0Ah], 1DB3h
		mov	word ptr [si+2Eh], 1D6Bh
		mov	dword ptr [si+3Eh], 0
		mov	byte ptr [si+42h], 2
		mov	byte ptr [si+43h], 0
		mov	dword ptr [si+44h], 0
		mov	word ptr [si+30h], 0
		mov	word ptr [si+2Eh], 1D7Bh
		xor	eax, eax
		mov	[si+84Bh], eax
		mov	[si+84Fh], eax
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		xor	ax, ax
		mov	[si+21h], ax
		mov	[si+27h], ax
		mov	[si+25h], ax
		mov	word ptr [si+29h], 0
		mov	word ptr [si+23h], 0
		mov	byte ptr [si+2Bh], 0
		mov	byte ptr [si+2Ch], 0
		mov	byte ptr [si+2Dh], 1

loc_1C492:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1C3C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C497		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1C4B1
		push	853h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1C529

loc_1C4B1:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 1D8Fh
		mov	word ptr [si+0Ah], 1DB3h
		mov	word ptr [si+2Eh], 1D6Bh
		mov	dword ptr [si+3Eh], 0
		mov	byte ptr [si+42h], 2
		mov	byte ptr [si+43h], 0
		mov	dword ptr [si+44h], 0
		mov	word ptr [si+30h], 0
		mov	word ptr [si+2Eh], 1D7Bh
		xor	eax, eax
		mov	[si+84Bh], eax
		mov	[si+84Fh], eax
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		xor	ax, ax
		mov	[si+21h], ax
		mov	[si+27h], ax
		mov	[si+25h], ax
		mov	word ptr [si+29h], 0
		mov	word ptr [si+23h], 0
		mov	byte ptr [si+2Bh], 0
		mov	byte ptr [si+2Ch], 0
		mov	byte ptr [si+2Dh], 1

loc_1C529:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1C497		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C52E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1C54B
		push	853h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_1C54B
		jmp	loc_1C60A

loc_1C54B:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1D8Fh
		mov	word ptr [si+0Ah], 1DB3h
		mov	word ptr [si+2Eh], 1D6Bh
		mov	dword ptr [si+3Eh], 0
		mov	byte ptr [si+42h], 2
		mov	byte ptr [si+43h], 0
		mov	dword ptr [si+44h], 0
		mov	word ptr [si+30h], 0
		mov	word ptr [si+2Eh], 1D7Bh
		xor	eax, eax
		mov	[si+84Bh], eax
		mov	[si+84Fh], eax
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		xor	ax, ax
		mov	[si+21h], ax
		mov	[si+27h], ax
		mov	[si+25h], ax
		mov	word ptr [si+29h], 0
		mov	word ptr [si+23h], 0
		mov	byte ptr [si+2Bh], 0
		mov	byte ptr [si+2Ch], 0
		mov	byte ptr [si+2Dh], 1
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_1C688
		add	sp, 4

loc_1C60A:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1C52E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C60F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1C629
		push	853h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1C683

loc_1C629:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 1D8Fh
		mov	word ptr [si+0Ah], 1DB3h
		mov	word ptr [si+2Eh], 1D6Bh
		mov	dword ptr [si+3Eh], 0
		mov	byte ptr [si+42h], 2
		mov	byte ptr [si+43h], 0
		mov	dword ptr [si+44h], 0
		mov	word ptr [si+30h], 0
		mov	word ptr [si+2Eh], 1D7Bh
		xor	eax, eax
		mov	[si+84Bh], eax
		mov	[si+84Fh], eax
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_1C388
		add	sp, 4

loc_1C683:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1C60F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C688		proc far

var_BA		= word ptr -0BAh
var_5D		= dword ptr -5Dh
var_59		= dword ptr -59h
var_55		= dword ptr -55h
var_4D		= dword ptr -4Dh
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_12		= word ptr -12h
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0BAh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_BA]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_BA], 9B5h
		mov	[bp+var_59], 100h
		mov	[bp+var_5D], 0
		mov	[bp+var_BA], 9CDh
		push	1
		push	1AD8h
		lea	ax, [bp+var_BA]
		push	ax
		mov	bx, [bp+var_BA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_541A0
		pop	cx
		push	0
		push	large dword_5B802
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		jmp	short loc_1C726

loc_1C6EF:
		lea	ax, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	[bp+arg_2]
		lea	ax, [bp+var_12]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_1C731
		mov	eax, [bp+var_44]
		mov	[bp+var_55], eax
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_54140
		pop	cx

loc_1C726:
		mov	eax, [bp+var_4D]
		cmp	eax, dword_5B807
		jz	short loc_1C6EF

loc_1C731:
		mov	eax, [bp+var_48]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+11h], eax
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 1
		mov	dword ptr [si+17h], 0
		mov	eax, [bp+var_4]
		mov	[si+17h], eax
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1C78F
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1C795

loc_1C78F:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1C795:
		push	dx
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		mov	[bp+var_BA], 9CDh
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	si
		leave
		retf
sub_1C688		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PlayerComponent_LoadFieldsWithRetryEWrapper_61E18 (sub_61E18 de PACIFIC.EXE). Résumé repris
; de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PlayerComponent_LoadFieldsWithRetryEWrapper_A4A75
; (sub_A4A75 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, appelle AircraftDynamics_ReadMassChunk_A4A20 (lecteur du chunk DYNM/masse).
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_1C388
		add	sp, 4
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C7DA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+29h], 0
		jnz	short loc_1C81A
		cmp	byte ptr [si+2Bh], 0
		jz	short loc_1C81A
		mov	al, [si+2Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1C81A
		mov	ax, si
		add	ax, 2Eh
		push	ax
		call	sub_1B327
		pop	cx
		mov	[si+25h], ax
		push	0FFFFh
		mov	ax, si
		add	ax, 2Eh
		push	ax
		mov	bx, [si+2Eh]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	byte ptr [si+2Ch], 1

loc_1C81A:
		inc	word ptr [si+29h]
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_1C827
		mov	al, 1
		jmp	short loc_1C829

loc_1C827:
		mov	al, 0

loc_1C829:
		pop	si
		pop	bp
		retf
sub_1C7DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C82C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Bh], 1
		pop	si
		pop	bp
		retf
sub_1C82C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C83A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Bh], 1
		mov	word ptr [si+29h], 0
		pop	si
		pop	bp
		retf
sub_1C83A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TalkingHead_SetBaseFrame_61EF1 (sub_61EF1 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TalkingHead_SetBaseFrame_9D32 (sub_9D32 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Image de base +2118 et image
; affichée +2124 = arg_2.
; ==============================================================================================
TalkingHead_SetBaseFrame_1C84D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		mov	[si+27h], ax
		pop	si
		pop	bp
		retf
TalkingHead_SetBaseFrame_1C84D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C860		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1C896
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1C89C

loc_1C896:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1C89C:
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		cmp	word ptr [si+27h], 0
		jz	short loc_1C901
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	dx, [si+27h]
		cmp	dx, 0FFFFh
		jz	short loc_1C901
		push	dx
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1C8E5
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1C8EB

loc_1C8E5:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1C8EB:
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_1C901

loc_1C901:
		cmp	word ptr [si+25h], 0
		jz	short loc_1C952
		mov	[bp+var_A], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		mov	dx, [si+25h]
		cmp	dx, 0FFFFh
		jz	short loc_1C952
		push	dx
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1C936
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1C93C

loc_1C936:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1C93C:
		push	dx
		push	ax
		push	[bp+var_C]
		push	[bp+var_A]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_1C952

loc_1C952:
		mov	[bp+var_E], 0
		jmp	short loc_1C96E

loc_1C959:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_E]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_1C96E:
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_1C959
		pop	di
		pop	si
		leave
		retf
sub_1C860		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C988		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_1C860
		add	sp, 6
		pop	bp
		retf
sub_1C988		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C99E		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6
		pop	si
		leave
		retf
sub_1C99E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C9CC		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6
		pop	si
		leave
		retf
sub_1C9CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C9F8		proc far

var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_0]
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		push	ds
		push	offset unk_5B7BC
		mov	cx, 3
		call	CRT_Fmemcpy
		mov	word ptr [di+25h], 0
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 1Eh
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_1CA42
		cmp	byte ptr [di+2Dh], 0
		jz	short loc_1CA42
		mov	word ptr [di+27h], 0Bh
		jmp	short loc_1CA48

loc_1CA42:
		mov	ax, [di+21h]
		mov	[di+27h], ax

loc_1CA48:
		cmp	word ptr [di+21h], 14h
		jle	short loc_1CA54
		mov	ax, [di+21h]
		mov	[di+27h], ax

loc_1CA54:
		cmp	word ptr [di+1Dh], 0
		jnz	short loc_1CA5D
		jmp	loc_1CAFA

loc_1CA5D:
		mov	bx, [di+1Fh]
		mov	al, [bx]
		mov	byte ptr [bp+var_4], al
		or	al, al
		jnz	short loc_1CA6C
		jmp	loc_1CAFA

loc_1CA6C:
		inc	word ptr [di+1Fh]
		cbw
		mov	[bp+var_6], ax
		mov	cx, 4
		mov	bx, offset word_1CB05

loc_1CA79:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_6]
		jz	short loc_1CA88
		add	bx, 2
		loop	short loc_1CA79
		jmp	short loc_1CAD1

loc_1CA88:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_1CA8C:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 7Ah
		jg	short loc_1CA99
		cmp	byte ptr [bx], 61h
		jge	short loc_1CAA6

loc_1CA99:
		mov	bx, [di+1Fh]
		inc	word ptr [di+1Fh]
		mov	al, [bx]
		mov	byte ptr [bp+var_4], al
		jmp	short loc_1CAD1

loc_1CAA6:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 72h
		jnz	short loc_1CAD1
		jmp	short loc_1CAC9

loc_1CAB0:
		jmp	short loc_1CACE

loc_1CAB2:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 68h
		jnz	short loc_1CAD1
		mov	word ptr [di+25h], 8
		jmp	short loc_1CACE

loc_1CAC1:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 68h
		jnz	short loc_1CAD1

loc_1CAC9:
		mov	word ptr [di+25h], 5

loc_1CACE:
		inc	word ptr [di+1Fh]

loc_1CAD1:
		cmp	word ptr [di+25h], 0
		jnz	short loc_1CAFA
		cmp	byte ptr [bp+var_4], 61h
		jl	short loc_1CAFA
		cmp	byte ptr [bp+var_4], 7Ah
		jg	short loc_1CAFA
		mov	al, byte ptr [bp+var_4]
		cbw
		add	ax, word_5B7B8
		mov	bx, ax
		mov	al, [bx-61h]
		cbw
		add	ax, 0FFD0h
		mov	[di+25h], ax
		inc	word ptr [di+25h]

loc_1CAFA:
		push	di
		call	sub_45BE9
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_1C9F8		endp

; START OF FUNCTION CHUNK FOR sub_1C9F8
word_1CB05	dw 63h
		dw 65h
		dw 68h
		dw 74h
off_1CB0D	dw offset loc_1CAC1
		dw offset loc_1CA8C
		dw offset loc_1CAB0
		dw offset loc_1CAB2
; END OF FUNCTION CHUNK FOR sub_1C9F8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CB15		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Dh], 0
		jz	short loc_1CB2E
		mov	bx, [si+1Fh]
		cmp	byte ptr [bx], 0
		jz	short loc_1CB2E
		mov	al, 0
		jmp	short loc_1CB30

loc_1CB2E:
		mov	al, 1

loc_1CB30:
		pop	si
		pop	bp
		retf
sub_1CB15		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CB33		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1CBBC
		mov	word ptr [si], 1D8Fh
		mov	word ptr [si+0Ah], 1DB3h
		push	word ptr [si+1Dh]
		call	sub_45058
		pop	cx
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+2Eh], 1D6Bh
		mov	ax, si
		add	ax, 2Eh
		push	ax
		call	sub_1AA79
		pop	cx
		cmp	byte ptr [si+43h], 0
		jz	short loc_1CB90
		cmp	dword ptr [si+3Eh], 0
		jz	short loc_1CB90
		push	0
		mov	al, [si+42h]
		push	ax
		mov	ax, si
		add	ax, 3Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1CB90

loc_1CB90:
		mov	dword ptr [si+3Eh], 0
		mov	byte ptr [si+43h], 0
		mov	dword ptr [si+44h], 0
		push	0
		push	si
		call	sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_1CBBC
		push	si
		call	sub_33B
		pop	cx

loc_1CBBC:
		pop	di
		pop	si
		pop	bp
		retf
sub_1CB33		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CBC0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1CBDA
		push	855h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1CBE9

loc_1CBDA:
		push	si
		push	cs
		call	near ptr sub_1C3C2
		pop	cx
		mov	word ptr [si], 1D37h
		mov	word ptr [si+0Ah], 1D5Bh

loc_1CBE9:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1CBC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CBEE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1CC08
		push	855h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1CC1F

loc_1CC08:
		push	large 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1C497
		add	sp, 8
		mov	word ptr [si], 1D37h
		mov	word ptr [si+0Ah], 1D5Bh

loc_1CC1F:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1CBEE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AnimLayer_Construct_623BF (sub_623BF de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à AnimLayer_Construct_2E5CF (sub_2E5CF de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Calque
; animé : Layer_Construct_2DF9B puis table de méthodes dseg 16248, dont +28 =
; AnimLayer_Advance_2E607. L'image affichée +27 commence à 0.
; ==============================================================================================
AnimLayer_Construct_1CC24		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1CC3E
		push	855h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1CC58

loc_1CC3E:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1C497
		add	sp, 8
		mov	word ptr [si], 1D37h
		mov	word ptr [si+0Ah], 1D5Bh

loc_1CC58:
		mov	ax, si
		pop	si
		pop	bp
		retf
AnimLayer_Construct_1CC24		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CC5D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1CC77
		push	855h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1CCBA

loc_1CC77:
		push	si
		push	cs
		call	near ptr sub_1C3C2
		pop	cx
		mov	word ptr [si], 1D37h
		mov	word ptr [si+0Ah], 1D5Bh
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		xor	ax, ax
		mov	[si+21h], ax
		mov	[si+27h], ax
		mov	[si+25h], ax
		mov	word ptr [si+29h], 0
		mov	word ptr [si+23h], 0
		mov	byte ptr [si+2Bh], 0
		mov	byte ptr [si+2Ch], 0
		mov	byte ptr [si+2Dh], 1
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1C688
		add	sp, 4

loc_1CCBA:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1CC5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CCBF		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1CCF5
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1CCFB

loc_1CCF5:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1CCFB:
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		cmp	word ptr [si+25h], 0FFFFh
		jz	short loc_1CD60
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	dx, [si+25h]
		cmp	dx, 0FFFFh
		jz	short loc_1CD60
		push	dx
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1CD44
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1CD4A

loc_1CD44:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1CD4A:
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_1CD60

loc_1CD60:
		mov	[bp+var_A], 0
		jmp	short loc_1CD7C

loc_1CD67:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_A]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_1CD7C:
		lea	ax, [bp+var_A]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_1CD67
		pop	di
		pop	si
		leave
		retf
sub_1CCBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_624F3 (sub_624F3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le
; calque à sa position absolue (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 /
; Layer_GetY_2E15D) par Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_1CD96		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1CCBF
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_1CD96		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CDC3		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1CCBF
		add	sp, 6
		pop	si
		leave
		retf
sub_1CDC3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CDEE		proc far

var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		push	ds
		push	offset unk_5B7BF
		mov	cx, 3
		call	CRT_Fmemcpy
		mov	word ptr [si+25h], 0
		cmp	word ptr [si+1Dh], 0
		jz	short loc_1CE49
		mov	bx, [si+1Fh]
		mov	al, [bx]
		mov	byte ptr [bp+var_4], al
		or	al, al
		jz	short loc_1CE49
		inc	word ptr [si+1Fh]
		cmp	word ptr [si+25h], 0FFFFh
		jnz	short loc_1CE49
		cmp	byte ptr [bp+var_4], 61h
		jl	short loc_1CE49
		cmp	byte ptr [bp+var_4], 7Ah
		jg	short loc_1CE49
		cbw
		add	ax, word_5B7BA
		mov	bx, ax
		mov	al, [bx-61h]
		cbw
		add	ax, 0FFD0h
		mov	[si+25h], ax
		inc	word ptr [si+25h]

loc_1CE49:
		push	si
		call	sub_45BE9
		pop	cx
		pop	si
		leave
		retf
sub_1CDEE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CE53		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1CE6C
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1CEC7

loc_1CE6C:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1D07h
		mov	word ptr [si+0Ah], 1D27h
		mov	word ptr [si+1Bh], 1

loc_1CEC7:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1CE53		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CECC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1CEE5
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1CEFF

loc_1CEE5:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_45E51
		add	sp, 4
		mov	word ptr [si], 1D07h
		mov	word ptr [si+0Ah], 1D27h
		mov	word ptr [si+1Bh], 1

loc_1CEFF:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1CECC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CF04		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1CF1D
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1CF3D

loc_1CF1D:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 1D07h
		mov	word ptr [si+0Ah], 1D27h
		mov	word ptr [si+1Bh], 1

loc_1CF3D:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1CF04		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CF42		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1CF8B
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1CF91

loc_1CF8B:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1CF91:
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_461CC
		pop	cx
		pop	si
		leave
		retf
sub_1CF42		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CFAF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1CFD3
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1CFD9

loc_1CFD3:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1CFD9:
		or	ax, dx
		jz	short loc_1D010
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1CFFA
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1D000

loc_1CFFA:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1D000:
		push	dx
		push	ax
		call	sub_4A3E2
		dec	ax
		cmp	ax, [si+1Bh]
		jbe	short loc_1D010
		inc	word ptr [si+1Bh]

loc_1D010:
		push	si
		call	sub_45BE9
		pop	cx
		pop	si
		pop	bp
		retf
sub_1CFAF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D01A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D033
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D09C

loc_1D033:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1CD7h
		mov	word ptr [si+0Ah], 1CF7h

loc_1D09C:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D01A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D0A1		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D0BD
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D0E9

loc_1D0BD:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	Layer_ConstructAtOrigin_45E51
		add	sp, 4
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1CD7h
		mov	word ptr [si+0Ah], 1CF7h

loc_1D0E9:
		mov	ax, si
		pop	si
		leave
		retf
sub_1D0A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D0EE		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D10A
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D148

loc_1D10A:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1CD7h
		mov	word ptr [si+0Ah], 1CF7h

loc_1D148:
		mov	ax, si
		pop	si
		leave
		retf
sub_1D0EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D14D		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D169
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D1B0

loc_1D169:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1CD7h
		mov	word ptr [si+0Ah], 1CF7h

loc_1D1B0:
		mov	ax, si
		pop	si
		leave
		retf
sub_1D14D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D1B5		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D1D1
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D229

loc_1D1D1:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_A], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 1CD7h
		mov	word ptr [si+0Ah], 1CF7h

loc_1D229:
		mov	ax, si
		pop	si
		leave
		retf
sub_1D1B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D22E		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D24A
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D2A9

loc_1D24A:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_C], ax
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 1CD7h
		mov	word ptr [si+0Ah], 1CF7h

loc_1D2A9:
		mov	ax, si
		pop	si
		leave
		retf
sub_1D22E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D2AE		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1D2F7
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1D2FD

loc_1D2F7:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1D2FD:
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_461CC
		pop	cx
		pop	si
		leave
		retf
sub_1D2AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D31B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D334
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D38A

loc_1D334:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1CA7h
		mov	word ptr [si+0Ah], 1CC7h

loc_1D38A:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D31B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D38F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D3A8
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D3BD

loc_1D3A8:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_45E51
		add	sp, 4
		mov	word ptr [si], 1CA7h
		mov	word ptr [si+0Ah], 1CC7h

loc_1D3BD:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D38F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D3C2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D3DB
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D3F9

loc_1D3DB:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [si], 1CA7h
		mov	word ptr [si+0Ah], 1CC7h

loc_1D3F9:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D3C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D3FE		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1D447
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1D44D

loc_1D447:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1D44D:
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_461CC
		pop	cx
		pop	si
		leave
		retf
sub_1D3FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D46B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D484
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D4DA

loc_1D484:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1C77h
		mov	word ptr [si+0Ah], 1C97h

loc_1D4DA:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D46B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D4DF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D4F8
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D555

loc_1D4F8:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_45E51
		add	sp, 4
		mov	word ptr [si], 1C77h
		mov	word ptr [si+0Ah], 1C97h
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1D52A
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1D530

loc_1D52A:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1D530:
		push	dx
		push	ax
		call	sub_4A3E2
		mov	[si+1Eh], ax
		cmp	word ptr [si+1Eh], 1
		jle	short loc_1D551
		cmp	byte ptr [si+20h], 33h
		jle	short loc_1D551
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_1D555

loc_1D551:
		mov	byte ptr [si+1Dh], 0

loc_1D555:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D4DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D55A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D573
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D5DC

loc_1D573:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 1C77h
		mov	word ptr [si+0Ah], 1C97h
		mov	al, [bp+arg_8]
		mov	[si+20h], al
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1D5B1
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1D5B7

loc_1D5B1:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1D5B7:
		push	dx
		push	ax
		call	sub_4A3E2
		mov	[si+1Eh], ax
		cmp	word ptr [si+1Eh], 1
		jle	short loc_1D5D8
		cmp	byte ptr [si+20h], 33h
		jle	short loc_1D5D8
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_1D5DC

loc_1D5D8:
		mov	byte ptr [si+1Dh], 0

loc_1D5DC:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D55A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D5E1		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1D62A
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1D630

loc_1D62A:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1D630:
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_1D651
		push	si
		call	Layer_DrawAtOwnPos_461CC
		pop	cx

loc_1D651:
		pop	si
		leave
		retf
sub_1D5E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D654		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_1D674
		mov	ax, [si+1Eh]
		dec	ax
		cmp	ax, [si+1Bh]
		jbe	short loc_1D66F
		inc	word ptr [si+1Bh]
		jmp	short loc_1D674

loc_1D66F:
		mov	word ptr [si+1Bh], 1

loc_1D674:
		push	si
		call	sub_45BE9
		pop	cx
		pop	si
		pop	bp
		retf
sub_1D654		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D67E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D697
		push	15h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D6E1

loc_1D697:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1C47h
		mov	word ptr [si+0Ah], 1C67h
		mov	ax, [bp+arg_2]
		mov	[si+11h], ax
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	word ptr [si+13h], 0

loc_1D6E1:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D67E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D6E6		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D702
		push	15h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D75A

loc_1D702:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1C47h
		mov	word ptr [si+0Ah], 1C67h
		mov	ax, [bp+arg_2]
		mov	[si+11h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+0Eh], ax
		mov	word ptr [si+13h], 0

loc_1D75A:
		mov	ax, si
		pop	si
		leave
		retf
sub_1D6E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D75F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1D799
		mov	word ptr [si], 1C47h
		mov	word ptr [si+0Ah], 1C67h
		push	si
		push	si
		call	sub_45B7D
		add	sp, 4
		push	0
		push	si
		call	sub_45B0D
		add	sp, 4
		test	di, 1
		jz	short loc_1D799
		push	si
		call	sub_33B
		pop	cx

loc_1D799:
		pop	di
		pop	si
		pop	bp
		retf
sub_1D75F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D79D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1D79D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextLayer_SetText_62A17 (sub_62A17 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par
; instruction à TextLayer_SetText_ADB7 (sub_ADB7 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. Pose la chaîne d'un TextLayer
; : [arg_0 + 13h] = arg_2 (pointeur proche).
; ==============================================================================================
TextLayer_SetText_1D7A5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+13h], ax
		pop	si
		pop	bp
		retf
TextLayer_SetText_1D7A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D7B5		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+13h], 0
		jz	short loc_1D7DE
		push	word ptr [si+13h]
		push	[bp+arg_4]
		push	di
		push	1AECh
		push	word ptr [si+11h]
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah

loc_1D7DE:
		mov	[bp+var_2], 0
		jmp	short loc_1D7FA

loc_1D7E5:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_1D7FA:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_1D7E5
		pop	di
		pop	si
		leave
		retf
sub_1D7B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D814		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1D832
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [si+0Ch]
		jmp	short loc_1D835

loc_1D832:
		mov	ax, [si+0Ch]

loc_1D835:
		pop	si
		pop	bp
		retf
sub_1D814		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D838		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1D856
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		add	ax, [si+0Eh]
		jmp	short loc_1D859

loc_1D856:
		mov	ax, [si+0Eh]

loc_1D859:
		pop	si
		pop	bp
		retf
sub_1D838		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_624F3 (sub_624F3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le
; calque à sa position absolue (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 /
; Layer_GetY_2E15D) par Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_1D85C		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1D7B5
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_1D85C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D889		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1D7B5
		add	sp, 6
		pop	si
		leave
		retf
sub_1D889		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_2CA33 (sub_2CA33 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à StreamReader_DestructWrapper_659C1
; (sub_659C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée via vtable (DATA XREF seg339) — enveloppe appelant
; StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main (sub_27477,
; seg048).
; ==============================================================================================
StreamReader_DestructWrapper_1D8B4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_45BE9
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_1D8B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D8C3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D8DC
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D8F6

loc_1D8DC:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1D67E
		add	sp, 4
		mov	word ptr [si], 1C17h
		mov	word ptr [si+0Ah], 1C37h
		mov	ax, [bp+arg_4]
		mov	[si+15h], ax

loc_1D8F6:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D8C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D8FB		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+15h]
		mov	[bp+var_2], ax
		mov	bx, [si+11h]
		mov	[bx+14h], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_1D7B5
		add	sp, 6
		pop	si
		leave
		retf
sub_1D8FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D934		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+15h]
		mov	[bp+var_2], ax
		mov	bx, [si+11h]
		mov	[bx+14h], ax
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_1D7B5
		add	sp, 6
		pop	si
		leave
		retf
sub_1D934		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D96B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D984
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1D9DE

loc_1D984:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1BE7h
		mov	word ptr [si+0Ah], 1C07h
		mov	byte ptr [si+1Dh], 0

loc_1D9DE:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D96B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D9E3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1D9FC
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DA15

loc_1D9FC:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_45E51
		add	sp, 4
		mov	word ptr [si], 1BE7h
		mov	word ptr [si+0Ah], 1C07h
		mov	byte ptr [si+1Dh], 0

loc_1DA15:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1D9E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DA1A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1DA33
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DA55

loc_1DA33:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [si], 1BE7h
		mov	word ptr [si+0Ah], 1C07h
		mov	byte ptr [si+1Dh], 0

loc_1DA55:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1DA1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DA5A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_1DAA0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1DA87
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1DA8D

loc_1DA87:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1DA8D:
		push	dx
		push	ax
		call	sub_4A3E2
		mov	[bp+var_2], ax
		dec	ax
		cmp	[si+1Bh], ax
		jnb	short loc_1DAA0
		inc	word ptr [si+1Bh]

loc_1DAA0:
		push	si
		call	sub_4628D
		pop	cx
		pop	si
		leave
		retf
sub_1DA5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DAAA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1DACE
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1DAD4

loc_1DACE:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1DAD4:
		push	dx
		push	ax
		call	sub_4A3E2
		dec	ax
		cmp	ax, [si+1Bh]
		jnz	short loc_1DAE6
		mov	ax, 1
		jmp	short loc_1DAE8

loc_1DAE6:
		xor	ax, ax

loc_1DAE8:
		pop	si
		pop	bp
		retf
sub_1DAAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DAEB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1DB04
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DB22

loc_1DB04:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [si], 1BB7h
		mov	word ptr [si+0Ah], 1BD7h

loc_1DB22:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1DAEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DB27		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		call	CRT_Rand
		test	ax, 1
		jz	short loc_1DB5A
		call	CRT_Rand
		test	ax, 1
		jz	short loc_1DB4F
		call	CRT_Rand
		and	ax, 1
		add	[si+0Eh], ax
		jmp	short loc_1DB5A

loc_1DB4F:
		call	CRT_Rand
		and	ax, 1
		sub	[si+0Eh], ax

loc_1DB5A:
		call	CRT_Rand
		test	ax, 1
		jz	short loc_1DB86
		call	CRT_Rand
		test	ax, 1
		jz	short loc_1DB7B
		call	CRT_Rand
		and	ax, 1
		add	[si+0Ch], ax
		jmp	short loc_1DB86

loc_1DB7B:
		call	CRT_Rand
		and	ax, 1
		sub	[si+0Ch], ax

loc_1DB86:
		push	si
		call	sub_4628D
		pop	cx
		pop	si
		pop	bp
		retf
sub_1DB27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DB90		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1DBAA
		push	853h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DBB9

loc_1DBAA:
		push	si
		push	cs
		call	near ptr sub_1C3C2
		pop	cx
		mov	word ptr [si], 1B83h
		mov	word ptr [si+0Ah], 1BA7h

loc_1DBB9:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1DB90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AnimLayer_Construct_623BF (sub_623BF de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à AnimLayer_Construct_2E5CF (sub_2E5CF de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Calque
; animé : Layer_Construct_2DF9B puis table de méthodes dseg 16248, dont +28 =
; AnimLayer_Advance_2E607. L'image affichée +27 commence à 0.
; ==============================================================================================
AnimLayer_Construct_1DBBE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1DBD8
		push	853h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DBF2

loc_1DBD8:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1C497
		add	sp, 8
		mov	word ptr [si], 1B83h
		mov	word ptr [si+0Ah], 1BA7h

loc_1DBF2:
		mov	ax, si
		pop	si
		pop	bp
		retf
AnimLayer_Construct_1DBBE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DBF7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1DC11
		push	853h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DC2E

loc_1DC11:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1C60F
		add	sp, 0Ah
		mov	word ptr [si], 1B83h
		mov	word ptr [si+0Ah], 1BA7h

loc_1DC2E:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1DBF7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DC33		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_1C860
		add	sp, 6
		pop	bp
		retf
sub_1DC33		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DC49		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1DC62
		push	29h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DCCB

loc_1DC62:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1B53h
		mov	word ptr [si+0Ah], 1B73h

loc_1DCCB:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1DC49		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DCD0		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1DCEC
		push	29h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DD18

loc_1DCEC:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	Layer_ConstructAtOrigin_45E51
		add	sp, 4
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1B53h
		mov	word ptr [si+0Ah], 1B73h

loc_1DD18:
		mov	ax, si
		pop	si
		leave
		retf
sub_1DCD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DD1D		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1DD39
		push	29h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DD77

loc_1DD39:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1B53h
		mov	word ptr [si+0Ah], 1B73h

loc_1DD77:
		mov	ax, si
		pop	si
		leave
		retf
sub_1DD1D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DD7C		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1DD98
		push	29h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DDDF

loc_1DD98:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1B53h
		mov	word ptr [si+0Ah], 1B73h

loc_1DDDF:
		mov	ax, si
		pop	si
		leave
		retf
sub_1DD7C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DDE4		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, word_5DD42
		mov	[bp+var_2], ax
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	ax, [si+21h]
		mov	[bp+var_4], ax
		mov	ax, [si+23h]
		mov	[bp+var_6], ax
		mov	ax, [si+25h]
		mov	[bp+var_8], ax
		mov	ax, [si+27h]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_E], ax
		push	word ptr [si+1Bh]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1DE5B
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1DE61

loc_1DE5B:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1DE61:
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_18]
		push	ax
		call	sub_4A194
		add	sp, 0Ch
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	si
		leave
		retf
sub_1DDE4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DE82		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		push	si
		push	cs
		call	near ptr sub_1DDE4
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_1DE82		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DE9A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1DEB3
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1DEE6

loc_1DEB3:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 1B23h
		mov	word ptr [si+0Ah], 1B43h
		mov	al, [bp+arg_8]
		mov	[si+1Dh], al
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_1DEE1
		mov	word ptr [si+1Bh], 0
		jmp	short loc_1DEE6

loc_1DEE1:
		mov	word ptr [si+1Bh], 0Dh

loc_1DEE6:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1DE9A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DEEB		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+1Bh], 4
		jnb	short loc_1DF41
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1DF27
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1DF2D

loc_1DF27:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1DF2D:
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch

loc_1DF41:
		cmp	word ptr [si+1Bh], 8
		jbe	short loc_1DF89
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		push	0Dh
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1DF6F
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1DF75

loc_1DF6F:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1DF75:
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch

loc_1DF89:
		cmp	word ptr [si+1Bh], 0Ch
		jnz	short loc_1DFD3
		mov	[bp+var_A], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		push	1
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1DFB7
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1DFBD

loc_1DFB7:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1DFBD:
		push	dx
		push	ax
		push	[bp+var_C]
		push	[bp+var_A]

loc_1DFC5:
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_1E012

loc_1DFD3:
		mov	[bp+var_E], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_10], ax
		mov	dx, [si+1Bh]
		cmp	dx, 0FFFFh
		jz	short loc_1E012
		push	dx
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1E002
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1E008

loc_1E002:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1E008:
		push	dx
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		jmp	short loc_1DFC5

loc_1E012:
		pop	di
		pop	si
		leave
		retf
sub_1DEEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_624F3 (sub_624F3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le
; calque à sa position absolue (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 /
; Layer_GetY_2E15D) par Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_1E016		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1DEEB
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_1E016		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E043		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1DEEB
		add	sp, 6
		pop	si
		leave
		retf
sub_1E043		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E06E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_1E086
		cmp	word ptr [si+1Bh], 0Dh
		jnb	short loc_1E08F
		inc	word ptr [si+1Bh]
		jmp	short loc_1E08F

loc_1E086:
		cmp	word ptr [si+1Bh], 0
		jbe	short loc_1E08F
		dec	word ptr [si+1Bh]

loc_1E08F:
		pop	si
		pop	bp
		retf
sub_1E06E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E092		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1E0AB
		push	23h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1E114

loc_1E0AB:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1AF3h
		mov	word ptr [si+0Ah], 1B13h

loc_1E114:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1E092		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E119		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1E135
		push	23h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1E161

loc_1E135:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	Layer_ConstructAtOrigin_45E51
		add	sp, 4
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1AF3h
		mov	word ptr [si+0Ah], 1B13h

loc_1E161:
		mov	ax, si
		pop	si
		leave
		retf
sub_1E119		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E166		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1E182
		push	23h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1E1C0

loc_1E182:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1AF3h
		mov	word ptr [si+0Ah], 1B13h

loc_1E1C0:
		mov	ax, si
		pop	si
		leave
		retf
sub_1E166		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E1C5		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1E1E1
		push	23h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1E228

loc_1E1E1:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1AF3h
		mov	word ptr [si+0Ah], 1B13h

loc_1E228:
		mov	ax, si
		pop	si
		leave
		retf
sub_1E1C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E22D		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1E249
		push	23h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1E2A1

loc_1E249:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_A], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 1AF3h
		mov	word ptr [si+0Ah], 1B13h

loc_1E2A1:
		mov	ax, si
		pop	si
		leave
		retf
sub_1E22D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E2A6		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1E2C2
		push	23h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1E321

loc_1E2C2:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_C], ax
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 1AF3h
		mov	word ptr [si+0Ah], 1B13h

loc_1E321:
		mov	ax, si
		pop	si
		leave
		retf
sub_1E2A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; MovingMaskLayer_SetTable_BA1C (sub_BA1C de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. +21h = arg_2 (table de 256
; couleurs du calque masque).
; ==============================================================================================
MovingMaskLayer_SetTable_1E326		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
MovingMaskLayer_SetTable_1E326		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E336		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	di, ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_2], ax
		push	word ptr [si+21h]
		push	0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1E376
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1E37C

loc_1E376:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1E37C:
		push	dx
		push	ax
		push	[bp+var_2]
		push	di
		push	word_5DD42
		call	sub_4AC2A
		add	sp, 0Eh
		push	word ptr [si+21h]
		push	word ptr [si+1Bh]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1E3B1
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1E3B7

loc_1E3B1:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1E3B7:
		push	dx
		push	ax
		push	[bp+var_2]
		push	di
		push	word_5DD42
		call	sub_4AC2A
		add	sp, 0Eh
		pop	di
		pop	si
		leave
		retf
sub_1E336		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E3CD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E3F6
		push	0
		push	si
		call	Scene_Destruct_462C6
		add	sp, 4
		test	di, 1
		jz	short loc_1E3F6
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1E3F6

loc_1E3F6:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E3CD		endp

; ----------------------------------------------------------------------

sub_1E3FA		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1E336
sub_1E3FA		endp

; ----------------------------------------------------------------------

sub_1E406		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E406		endp

; ----------------------------------------------------------------------

sub_1E412		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_1E412		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E41E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E44E
		mov	word ptr [si], 1B23h
		mov	word ptr [si+0Ah], 1B43h
		push	0
		push	si
		call	sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_1E44E
		push	si
		call	sub_33B
		pop	cx

loc_1E44E:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E41E		endp

; ----------------------------------------------------------------------

sub_1E452		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1E043
sub_1E452		endp

; ----------------------------------------------------------------------

sub_1E45E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E45E		endp

; ----------------------------------------------------------------------

sub_1E46A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_1E016
sub_1E46A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E476		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E49F
		push	0
		push	si
		call	Scene_Destruct_462C6
		add	sp, 4
		test	di, 1
		jz	short loc_1E49F
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1E49F

loc_1E49F:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E476		endp

; ----------------------------------------------------------------------

sub_1E4A3		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1DE82
sub_1E4A3		endp

; ----------------------------------------------------------------------

sub_1E4AF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E4AF		endp

; ----------------------------------------------------------------------

sub_1E4BB		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_1E4BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E4C7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E4F0
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_1CB33
		add	sp, 4
		test	di, 1
		jz	short loc_1E4F0
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1E4F0

loc_1E4F0:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E4C7		endp

; ----------------------------------------------------------------------

sub_1E4F4		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1C9CC
sub_1E4F4		endp

; ----------------------------------------------------------------------

sub_1E500		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E500		endp

; ----------------------------------------------------------------------

sub_1E50C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1C99E
sub_1E50C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E518		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E548
		mov	word ptr [si], 1BB7h
		mov	word ptr [si+0Ah], 1BD7h
		push	0
		push	si
		call	sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_1E548
		push	si
		call	sub_33B
		pop	cx

loc_1E548:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E518		endp

; ----------------------------------------------------------------------

sub_1E54C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_461F9
sub_1E54C		endp

; ----------------------------------------------------------------------

sub_1E558		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E558		endp

; ----------------------------------------------------------------------

sub_1E564		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_1E564		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E570		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E599
		push	0
		push	si
		call	sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_1E599
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1E599

loc_1E599:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E570		endp

; ----------------------------------------------------------------------

sub_1E59D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_461F9
sub_1E59D		endp

; ----------------------------------------------------------------------

sub_1E5A9		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E5A9		endp

; ----------------------------------------------------------------------

sub_1E5B5		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_1E5B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E5C1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E5EA
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_1D75F
		add	sp, 4
		test	di, 1
		jz	short loc_1E5EA
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1E5EA

loc_1E5EA:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E5C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E5EE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1E5EE		endp

; ----------------------------------------------------------------------

sub_1E5F6		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1D934
sub_1E5F6		endp

; ----------------------------------------------------------------------

sub_1E602		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1E5EE
sub_1E602		endp

; ----------------------------------------------------------------------

sub_1E60E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1D8FB
sub_1E60E		endp

; ----------------------------------------------------------------------

sub_1E61A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1D889
sub_1E61A		endp

; ----------------------------------------------------------------------

sub_1E626		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1E5EE
sub_1E626		endp

; ----------------------------------------------------------------------

sub_1E632		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_1D85C
sub_1E632		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E63E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E66E
		mov	word ptr [si], 1C77h
		mov	word ptr [si+0Ah], 1C97h
		push	0
		push	si
		call	sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_1E66E
		push	si
		call	sub_33B
		pop	cx

loc_1E66E:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E63E		endp

; ----------------------------------------------------------------------

sub_1E672		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1D5E1
sub_1E672		endp

; ----------------------------------------------------------------------

sub_1E67E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E67E		endp

; ----------------------------------------------------------------------

sub_1E68A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_1E68A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E696		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E6BF
		push	0
		push	si
		call	sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_1E6BF
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1E6BF

loc_1E6BF:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E696		endp

; ----------------------------------------------------------------------

sub_1E6C3		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1D3FE
sub_1E6C3		endp

; ----------------------------------------------------------------------

sub_1E6CF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E6CF		endp

; ----------------------------------------------------------------------

sub_1E6DB		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_1E6DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E6E7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E710
		push	0
		push	si
		call	Scene_Destruct_462C6
		add	sp, 4
		test	di, 1
		jz	short loc_1E710
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1E710

loc_1E710:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E6E7		endp

; ----------------------------------------------------------------------

sub_1E714		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1D2AE
sub_1E714		endp

; ----------------------------------------------------------------------

sub_1E720		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E720		endp

; ----------------------------------------------------------------------

sub_1E72C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_1E72C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E738		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E768
		mov	word ptr [si], 1D07h
		mov	word ptr [si+0Ah], 1D27h
		push	0
		push	si
		call	sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_1E768
		push	si
		call	sub_33B
		pop	cx

loc_1E768:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E738		endp

; ----------------------------------------------------------------------

sub_1E76C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1CF42
sub_1E76C		endp

; ----------------------------------------------------------------------

sub_1E778		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E778		endp

; ----------------------------------------------------------------------

sub_1E784		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_1E784		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E790		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E7B9
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_1CB33
		add	sp, 4
		test	di, 1
		jz	short loc_1E7B9
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1E7B9

loc_1E7B9:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E790		endp

; ----------------------------------------------------------------------

sub_1E7BD		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1CDC3
sub_1E7BD		endp

; ----------------------------------------------------------------------

sub_1E7C9		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E7C9		endp

; ----------------------------------------------------------------------

sub_1E7D5		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_1CD96
sub_1E7D5		endp

; ----------------------------------------------------------------------

sub_1E7E1		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1C9CC
sub_1E7E1		endp

; ----------------------------------------------------------------------

sub_1E7ED		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E7ED		endp

; ----------------------------------------------------------------------

sub_1E7F9		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1C99E
sub_1E7F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E805		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1E805		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E80D		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		add	[si+2], ax
		mov	ax, [bp+var_4]
		add	[si+4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
sub_1E80D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E83F		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+2], ax
		mov	ax, [bp+var_4]
		mov	[si+4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
sub_1E83F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E86A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1E86A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ReleaseListEntry_63455 (sub_63455 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ReleaseListEntry_85DCA (sub_85DCA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle LinkedListB_Helper_5F66B (seg159).
; ==============================================================================================
HUDSymbol_ReleaseListEntry_1E872		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E899
		mov	word ptr [si], 1DEFh
		push	si
		call	sub_4853A
		pop	cx
		test	di, 1
		jz	short loc_1E899
		push	si
		call	sub_33B
		pop	cx

loc_1E899:
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseListEntry_1E872		endp

; ----------------------------------------------------------------------

sub_1E89D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_461F9
sub_1E89D		endp

; ----------------------------------------------------------------------

sub_1E8A9		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E8A9		endp

; ----------------------------------------------------------------------

sub_1E8B5		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_1E8B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E8C1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E8EA
		push	0
		push	si
		call	Scene_Destruct_462C6
		add	sp, 4
		test	di, 1
		jz	short loc_1E8EA
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1E8EA

loc_1E8EA:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E8C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E8EE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_6]
		cmp	ax, 0FFFFh
		jz	short loc_1E93B
		push	word ptr [si+23h]
		push	word ptr [si+21h]
		push	ax
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1E921
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1E927

loc_1E921:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1E927:
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_5DD42
		call	sub_4A616
		add	sp, 10h

loc_1E93B:
		pop	si
		pop	bp
		retf
sub_1E8EE		endp

; ----------------------------------------------------------------------

sub_1E93E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1C33D
sub_1E93E		endp

; ----------------------------------------------------------------------

sub_1E94A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E94A		endp

; ----------------------------------------------------------------------

sub_1E956		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_1C310
sub_1E956		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E962		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E98B
		push	0
		push	si
		call	Scene_Destruct_462C6
		add	sp, 4
		test	di, 1
		jz	short loc_1E98B
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1E98B

loc_1E98B:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E962		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E98F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_6]
		cmp	ax, 0FFFFh
		jz	short loc_1E9DC
		push	word ptr [si+23h]
		push	word ptr [si+21h]
		push	ax
		cmp	byte ptr [si+15h], 3
		jnz	short loc_1E9C2
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1E9C8

loc_1E9C2:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_1E9C8:
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_5DD42
		call	sub_4A616
		add	sp, 10h

loc_1E9DC:
		pop	si
		pop	bp
		retf
sub_1E98F		endp

; ----------------------------------------------------------------------

sub_1E9DF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1C223
sub_1E9DF		endp

; ----------------------------------------------------------------------

sub_1E9EB		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1E9EB		endp

; ----------------------------------------------------------------------

sub_1E9F7		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_1C1F6
sub_1E9F7		endp

; ----------------------------------------------------------------------

sub_1EA03		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_461F9
sub_1EA03		endp

; ----------------------------------------------------------------------

sub_1EA0F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1EA0F		endp

; ----------------------------------------------------------------------

sub_1EA1B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_1EA1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EA27		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1EA50
		push	0
		push	si
		call	sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_1EA50
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_1EA50

loc_1EA50:
		pop	di
		pop	si
		pop	bp
		retf
sub_1EA27		endp

; ----------------------------------------------------------------------

sub_1EA54		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1C094
sub_1EA54		endp

; ----------------------------------------------------------------------

sub_1EA60		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_1EA60		endp

; ----------------------------------------------------------------------

sub_1EA6C		proc far
		mov	bx, sp
sub_1EA6C		endp

; START OF FUNCTION CHUNK FOR sub_1EA6C
		db 36h, 83h
; END OF FUNCTION CHUNK FOR sub_1EA6C
seg040		ends
