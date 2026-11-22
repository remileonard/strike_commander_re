seg087		segment	para public 'CODE' use16
		assume cs:seg087
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh, 36h, 22h, 44h, 9Ah, 0, 0, 88h, 2Fh, 59h, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; DisplaySurface_Construct_2F08E (sub_2F08E de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à DisplaySurface_Construct_5E819 (sub_5E819 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, construit un objet
; surface/tampon (sub_5EA03/5EA23 pour les sous-objets, sub_2E1D, sub_5EAB4, sub_5EA65).
; Référencée par sub_5E9A9.
; ==============================================================================================
DisplaySurface_Construct_2F5AC		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jnz	short loc_2F5CF
		push	si
		call	Member_ClearAndFree_2F796
		pop	cx
		push	0
		push	si
		call	Member_AllocateAndCopy_2F7B6
		add	sp, 4
		jmp	short loc_2F5DD

loc_2F5CF:
		mov	ax, [si]
		mov	dx, ds
		cmp	dx, word ptr [bp+arg_2+2]
		jnz	short loc_2F5DD
		cmp	ax, word ptr [bp+arg_2]
		jz	short loc_2F62B

loc_2F5DD:
		push	large [bp+arg_2]
		call	sub_3651
		add	sp, 4
		inc	ax
		mov	di, ax
		cmp	word ptr [si], 0
		jz	short loc_2F5F6
		cmp	[si+2], di
		jnb	short loc_2F607

loc_2F5F6:
		push	si
		call	Member_ClearAndFree_2F796
		pop	cx
		push	di
		push	si
		call	Member_AllocateAndCopy_2F7B6
		add	sp, 4

loc_2F607:
		cmp	word ptr [si], 0
		jz	short loc_2F62B
		push	si
		call	Member_NullTerminateIfSet_2F847
		pop	cx
		push	large [bp+arg_2]
		push	si
		call	Member_CopyRaw_2F7F8
		add	sp, 6
		mov	ax, [si+2]
		dec	ax
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx], 0

loc_2F62B:
		mov	ax, [si]
		pop	di
		pop	si
		pop	bp
		retf
DisplaySurface_Construct_2F5AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; DisplaySurface_CloneOrResize_2F113 (sub_2F113 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à DisplaySurface_CloneOrResize_5E89E (sub_5E89E de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 111 lignes, NON
; DÉTAILLÉE — combine sub_2E1D/sub_2B1C, DisplayCache_GetHeadValue_5D469 (seg137), et
; plusieurs constructions/copies de sous-objets (5EA23/5EA65 ×3/5EA03). Référencée par
; CachedObject_DestructSubobjects_5E95A (via appel indirect).
; ==============================================================================================
DisplaySurface_CloneOrResize_2F631		proc far

var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jnz	short loc_2F646
		jmp	loc_2F6E7

loc_2F646:
		push	large [bp+arg_2]
		call	sub_3651
		add	sp, 4
		mov	di, ax
		cmp	word ptr [si], 0
		jnz	short loc_2F65C
		inc	di
		jmp	short loc_2F677

loc_2F65C:
		push	word ptr [si]
		call	CRT_Strlen
		pop	cx
		add	ax, di
		inc	ax
		mov	dx, ax
		cmp	[si+2], dx
		jle	short loc_2F673
		mov	ax, [si+2]
		jmp	short loc_2F675

loc_2F673:
		mov	ax, dx

loc_2F675:
		mov	di, ax

loc_2F677:
		cmp	[si+2], di
		jnb	short loc_2F6DA
		call	sub_33289
		cmp	ax, [si+2]
		jbe	short loc_2F6DA
		mov	[bp+var_6], di
		mov	[bp+var_4], 0
		push	[bp+var_6]
		lea	ax, [bp+var_4]
		push	ax
		call	Member_AllocateAndCopy_2F7B6
		add	sp, 4
		cmp	word ptr [si], 0
		jz	short loc_2F6B1
		push	ds
		push	word ptr [si]
		lea	ax, [bp+var_4]
		push	ax
		call	Member_CopyRaw_2F7F8
		add	sp, 6

loc_2F6B1:
		push	large [bp+arg_2]
		lea	ax, [bp+var_4]
		push	ax
		call	Member_CopyRaw_2F7F8
		add	sp, 6
		lea	ax, [bp+var_4]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr DisplaySurface_Helper_2F70A
		add	sp, 4
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		jmp	short loc_2F6E7

loc_2F6DA:
		push	large [bp+arg_2]
		push	si
		call	Member_CopyRaw_2F7F8
		add	sp, 6

loc_2F6E7:
		mov	ax, [si]
		pop	di
		pop	si
		leave
		retf
DisplaySurface_CloneOrResize_2F631		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; CachedObject_DestructSubobjects_2F1CF (sub_2F1CF de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à CachedObject_DestructSubobjects_5E95A (sub_5E95A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, si
; un paramètre non nul est fourni, appelle DisplaySurface_CloneOrResize_5E89E ; retourne
; toujours le premier champ de l'objet. Appelée massivement par
; TextObjectCluster_DestructSubobjects_5C579 (seg130) et
; Memory_AllocatorTable_PopulateSlots_5CB99 (seg133).
; ==============================================================================================
CachedObject_DestructSubobjects_2F6ED		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	ax, ax
		jz	short loc_2F705
		push	ds
		push	ax
		push	si
		push	cs
		call	near ptr DisplaySurface_CloneOrResize_2F631
		add	sp, 6

loc_2F705:
		mov	ax, [si]
		pop	si
		pop	bp
		retf
CachedObject_DestructSubobjects_2F6ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; DisplaySurface_Helper_2F1EC (sub_2F1EC de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à DisplaySurface_Helper_5E977 (sub_5E977 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par
; DisplaySurface_ConstructWithMode_5E9A9.
; ==============================================================================================
DisplaySurface_Helper_2F70A		proc far

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
		mov	di, [bp+arg_2]
		mov	ax, [si]
		mov	[bp+var_2], ax
		mov	ax, [si+2]
		mov	[bp+var_4], ax
		mov	ax, [di]
		mov	[si], ax
		mov	ax, [di+2]
		mov	[si+2], ax
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	ax, [bp+var_4]
		mov	[di+2], ax
		pop	di
		pop	si
		leave
		retf
DisplaySurface_Helper_2F70A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; DisplaySurface_ConstructWithMode_2F21E (sub_2F21E de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à DisplaySurface_ConstructWithMode_5E9A9 (sub_5E9A9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Video_SetModeIfChanged (sub_2962, seg150), sub_5EAB4 et
; DisplaySurface_Construct_5E819 — construction d'une surface d'affichage liée à un mode vidéo
; donné. Appelée massivement par TextObjectCluster_DestructSubobjects_5C579 (seg130) et
; Memory_AllocatorTable_PopulateSlots_5CB99 (seg133).
; ==============================================================================================
DisplaySurface_ConstructWithMode_2F73C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, word_4CE02
		jz	short loc_2F763
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_4CE02
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_2F763:
		push	si
		call	Member_NullTerminateIfSet_2F847
		pop	cx
		push	ds
		push	word_4CE02
		push	si
		push	cs
		call	near ptr DisplaySurface_Construct_2F5AC
		add	sp, 6
		mov	ax, [si]
		pop	si
		leave
		retf
DisplaySurface_ConstructWithMode_2F73C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F77C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		dec	word ptr [si+2]
		mov	ax, [si+2]
		dec	ax
		mov	bx, [si]
		add	bx, ax
sub_2F77C		endp

; START OF FUNCTION CHUNK FOR sub_2F77C
		db 0C6h
		pop	es
; END OF FUNCTION CHUNK FOR sub_2F77C
seg087		ends
