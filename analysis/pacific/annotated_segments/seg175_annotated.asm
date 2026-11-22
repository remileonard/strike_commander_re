seg175		segment	para public 'CODE' use16
		assume cs:seg175
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3, 0, 0, 59h

loc_690A4:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_690A8		proc far

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
		jnz	short loc_690F9
		mov	di, dx
		mov	byte ptr [di+5], 0
		mov	byte ptr [si+7], 1

loc_690F9:
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
sub_690A8		endp

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
GlyphObject_AllocateBuffer_69123		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6913C
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6915C

loc_6913C:
		mov	word ptr [si], 48E2h
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	word ptr [si], 490Ah

loc_6915C:
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_AllocateBuffer_69123		endp

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
GlyphObject_ConstructWithBuffer_69161		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6917A
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_691A5

loc_6917A:
		mov	word ptr [si], 48E2h
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	word ptr [si], 490Ah
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_690A8
		add	sp, 4

loc_691A5:
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_ConstructWithBuffer_69161		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_691AA		proc far

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
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	ax, [bp+var_6]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		inc	ax
		pop	si
		leave
		retf
sub_691AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_691E9		proc far

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
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	ax, [bp+var_6]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		inc	ax
		pop	si
		leave
		retf
sub_691E9		endp

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
GlyphObject_ResolveAndCache_69228		proc far

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
		jz	short loc_69271
		mov	al, [si+16h]
		push	ax
		mov	al, dl
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	di
		call	sub_6A294
		add	sp, 0Eh
		jmp	short loc_692A0

loc_69271:
		mov	al, dl
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	di
		call	sub_6A514
		add	sp, 0Ch

loc_692A0:
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_ResolveAndCache_69228		endp

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
GlyphObject_MeasureChar_692A4		proc far

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
		jnz	short loc_692B9
		mov	ax, [si+14h]
		jmp	short loc_692E7

loc_692B9:
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	ax, [bp+var_4]
		inc	ax

loc_692E7:
		pop	si
		leave
		retf
GlyphObject_MeasureChar_692A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_692EA		proc far

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
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	ax, [bp+var_8]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		pop	si
		leave
		retf
sub_692EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6932C		proc far

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
sub_6932C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6933E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_6933E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69348		proc far

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
sub_69348		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6935E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_6935E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69368		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_693D9
		mov	word ptr [si], 490Ah
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		cmp	byte ptr [si+7], 0
		jz	short loc_693B8
		cmp	dword ptr [si+2], 0
		jz	short loc_693B8
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_693B8

loc_693B8:
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
sub_69368		endp
seg175		ends
