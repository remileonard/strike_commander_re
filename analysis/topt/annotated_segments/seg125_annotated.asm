seg125		segment	para public 'CODE' use16
		assume cs:seg125
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 74h, 7, 56h, 9Ah, 9Ch, 3, 0, 0, 59h

loc_36C99:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36C9D		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, dx
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+2], eax
		mov	al, [bp+var_5]
		mov	[si+6], al
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	eax, [di+6]
		mov	[si+8], eax
		mov	bx, dx
		cmp	byte ptr [bx+5], 1
		jnz	short loc_36CEE
		mov	di, dx
		mov	byte ptr [di+5], 0
		mov	byte ptr [si+7], 1

loc_36CEE:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		mov	[si+0Eh], ax
		mov	byte ptr [si+16h], 0FFh
		mov	word ptr [si+10h], 2
		mov	word ptr [si+12h], 0
		push	2Dh
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[si+14h], ax
		pop	di
		pop	si
		leave
		retf
sub_36C9D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_AllocateBuffer_31191 (sub_31191 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à GlyphObject_AllocateBuffer_604C9 (sub_604C9 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue
; (sub_658). Référencée par sub_60507.
; ==============================================================================================
GlyphObject_AllocateBuffer_36D18		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_36D31
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_36D51

loc_36D31:
		mov	word ptr [si], 4A24h
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	word ptr [si], 4A4Ch

loc_36D51:
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_AllocateBuffer_36D18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ConstructWithBuffer_311CF (sub_311CF de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à GlyphObject_ConstructWithBuffer_60507 (sub_60507 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658) puis GlyphObject_AllocateBuffer_604C9 puis
; GlyphObject_ComputeMetrics_60456.
; ==============================================================================================
GlyphObject_ConstructWithBuffer_36D56		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_36D6F
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_36D9A

loc_36D6F:
		mov	word ptr [si], 4A24h
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	word ptr [si], 4A4Ch
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_36C9D
		add	sp, 4

loc_36D9A:
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_ConstructWithBuffer_36D56		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36D9F		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h
		call	sub_35BAA
		mov	ax, [bp+var_6]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		inc	ax
		pop	si
		leave
		retf
sub_36D9F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36DDE		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h
		call	sub_35BAA
		mov	ax, [bp+var_6]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		inc	ax
		pop	si
		leave
		retf
sub_36DDE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ResolveAndCache_31296 (sub_31296 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à GlyphObject_ResolveAndCache_605CE (sub_605CE de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 84 lignes,
; NON DÉTAILLÉE — combine Memory_TypedAllocDispatchB_5C832 ×2, sub_61CD2, sub_61F52.
; ==============================================================================================
GlyphObject_ResolveAndCache_36E1D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dl, [bp+arg_4]
		cmp	byte ptr [si+16h], 0FFh
		jz	short loc_36E66
		mov	al, [si+16h]
		push	ax
		mov	al, dl
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	di
		call	sub_38294
		add	sp, 0Eh
		jmp	short loc_36E95

loc_36E66:
		mov	al, dl
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	di
		call	Shape_DrawSpans_38514
		add	sp, 0Ch

loc_36E95:
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_ResolveAndCache_36E1D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_MeasureChar_31312 (sub_31312 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à GlyphObject_MeasureChar_6064A (sub_6064A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Memory_TypedAllocDispatchB_5C832 et Font_ComputeGlyphBoundingBox_5E74E — mesure un caractère
; donné (variante paramétrable de MeasureRefCharA/B).
; ==============================================================================================
GlyphObject_MeasureChar_36E99		proc far

var_8		= word ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 20h
		jnz	short loc_36EAE
		mov	ax, [si+14h]
		jmp	short loc_36EDC

loc_36EAE:
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		call	sub_35BAA
		mov	ax, [bp+var_4]
		inc	ax

loc_36EDC:
		pop	si
		leave
		retf
GlyphObject_MeasureChar_36E99		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36EDF		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		call	sub_35BAA
		mov	ax, [bp+var_8]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		pop	si
		leave
		retf
sub_36EDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (1 sur
; 1), à sub_3139A (sub_3139A de OPTEST.EXE). Code non comparé instruction par instruction. —
; ==============================================================================================
MidgameEngine_3139A_36F21		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[si+16h], al
		xor	ax, ax
		pop	si
		pop	bp
		retf
MidgameEngine_3139A_36F21		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F33		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_36F33		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F3D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [di]
		mov	[si+16h], al
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
sub_36F3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F53		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_36F53		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (97 sur
; 97), à GlyphObject_ScalarDeletingDtorA_313D6 (sub_313D6 de OPTEST.EXE). Code non comparé
; instruction par instruction. — Reprise de STRIKE.EXE : même suite d'instructions, 3
; opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; GlyphObject_ScalarDeletingDtorA_6070E (sub_6070E de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, destructeur scalar-deleting (tag 3E68h) :
; pose le tag, libère le buffer via Memory_TypedFree_5C7B6 (tag 5C44h) si présent,
; réinitialise les champs, libère l'objet si demandé (sub_338). Référencée par sub_7FAE0 et
; sub_804BF.
; ==============================================================================================
GlyphObject_ScalarDeletingDtorA_36F5D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_36FCE
		mov	word ptr [si], 4A4Ch
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		cmp	byte ptr [si+7], 0
		jz	short loc_36FAD
		cmp	dword ptr [si+2], 0
		jz	short loc_36FAD
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_36FAD

loc_36FAD:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_36FCE
		push	si
		call	sub_39C
		pop	cx

loc_36FCE:
		pop	di
		pop	si
GlyphObject_ScalarDeletingDtorA_36F5D		endp
seg125		ends
