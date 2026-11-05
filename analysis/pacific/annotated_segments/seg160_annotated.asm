seg160		segment	para public 'CODE' use16
		assume cs:seg160
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1, 0EBh, 2

loc_68013:
		db 0B0h, 0, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Text_ComputeMaxLineWidth_5E6BF (sub_5E6BF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, itère sur les lignes d'un texte (compte via
; sub_625CC), calcule la largeur de chaque ligne (sub_5E74E) et retourne le maximum — probable
; calcul de largeur de boîte de texte multi-lignes. Référencée par sub_97215 et sub_A60AC.
; ==============================================================================================
Text_ComputeMaxLineWidth_68019		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		xor	di, di
		push	large [bp+arg_0]
		call	sub_6AB8C
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_68053

loc_68033:
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	large 0
		push	large [bp+arg_0]
		push	si
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	dx, [bp+var_4]
		sub	dx, [bp+var_8]
		inc	dx
		cmp	dx, di
		jle	short loc_68052
		mov	di, dx

loc_68052:
		inc	si

loc_68053:
		cmp	si, [bp+var_2]
		jl	short loc_68033
		mov	ax, di
		pop	di
		pop	si
		leave
		retf	4
Text_ComputeMaxLineWidth_68019		endp
seg160		ends
