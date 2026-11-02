seg109		segment	para public 'CODE' use16
		assume cs:seg109
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 46h, 0FAh, 50h, 0Eh, 0E8h, 85h, 0FEh, 59h, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_Allocate_2D201 (sub_2D201 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à CachedObject_Allocate_5DA48 (sub_5DA48 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue via sub_658.
; Référencée depuis seg209 (segment distant non encore couvert).
; ==============================================================================================
CachedObject_Allocate_34F6C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_34F85
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_34FC6

loc_34F85:
		mov	word ptr [si], 1FEDh
		mov	word ptr [si], 1FF9h
		mov	word ptr [si], 4990h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+1Ah], 0

loc_34FC6:
		mov	ax, si
		pop	si
		pop	bp
		retf
CachedObject_Allocate_34F6C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34FCB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_34FE4
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3502C

loc_34FE4:
		mov	word ptr [si], 1FEDh
		mov	word ptr [si], 1FF9h
		mov	word ptr [si], 4990h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_35358
		add	sp, 4

loc_3502C:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_34FCB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_ConstructVariantB_5DB0D (sub_5DB0D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658) et appelle CachedObject_DestructHelper_5DE86. Référencée par sub_85ACB.
; ==============================================================================================
CachedObject_ConstructVariantB_35031		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3504A
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3509B

loc_3504A:
		mov	word ptr [si], 1FEDh
		mov	word ptr [si], 1FF9h
		mov	word ptr [si], 4990h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	al, [bp+arg_8]
		push	ax
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_353AA
		add	sp, 0Ah

loc_3509B:
		mov	ax, si
		pop	si
		pop	bp
		retf
CachedObject_ConstructVariantB_35031		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_350A0		proc far

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
		jnz	short loc_350BC
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3511C

loc_350BC:
		mov	word ptr [si], 1FEDh
		mov	word ptr [si], 1FF9h
		mov	word ptr [si], 4990h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_35358
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+2], ax
		mov	ax, [bp+var_4]
		mov	[si+4], ax

loc_3511C:
		mov	ax, si
		pop	si
		leave
		retf
sub_350A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35121		proc far

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
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3513D
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_351A6

loc_3513D:
		mov	word ptr [si], 1FEDh
		mov	word ptr [si], 1FF9h
		mov	word ptr [si], 4990h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_35358
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+2], ax
		mov	ax, [bp+var_4]
		mov	[si+4], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		mov	[si+1Ah], ax

loc_351A6:
		mov	ax, si
		pop	si
		leave
		retf
sub_35121		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_Destruct_2D440 (sub_2D440 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à CachedObject_Destruct_5DC87 (sub_5DC87 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, destructeur : appelle
; sub_5DD29 puis libère deux blocs (Memory_TypedFree_5C7B6 ×2) et l'objet lui-même (sub_338).
; Référencée depuis seg209.
; ==============================================================================================
CachedObject_Destruct_351AB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_351BD
		jmp	loc_35249

loc_351BD:
		mov	word ptr [si], 4990h
		push	si
		nop
		push	cs
		call	near ptr CachedObject_ReleaseFields_3524D
		pop	cx
		cmp	byte ptr [si+15h], 0
		jz	short loc_351EE
		cmp	dword ptr [si+10h], 0
		jz	short loc_351EE
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_351EE

loc_351EE:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_35228
		cmp	dword ptr [si+6], 0
		jz	short loc_35228
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_35228

loc_35228:
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		test	di, 1
		jz	short loc_35249
		push	si
		call	sub_39C
		pop	cx

loc_35249:
		pop	di
		pop	si
		pop	bp
		retf
CachedObject_Destruct_351AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_ReleaseFields_2D4E2 (sub_2D4E2 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à CachedObject_ReleaseFields_5DD29 (sub_5DD29 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, libère les
; champs internes d'un objet mis en cache (Memory_TypedFree_5C7B6 ×2). Appelée par
; CachedObject_Destruct_5DC87.
; ==============================================================================================
CachedObject_ReleaseFields_3524D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_3527A
		cmp	dword ptr [si+6], 0
		jz	short loc_3527A
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_3527A

loc_3527A:
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		cmp	byte ptr [si+15h], 0
		jz	short loc_352B4
		cmp	dword ptr [si+10h], 0
		jz	short loc_352B4
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_352B4

loc_352B4:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		pop	si
		pop	bp
		retf
CachedObject_ReleaseFields_3524D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_DestructCore_2D560 (sub_2D560 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à CachedObject_DestructCore_5DDA7 (sub_5DDA7 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, cœur de
; destruction partagé (Memory_TypedFree_5C7B6 ×2). Appelée par
; CachedObject_DestructHelper_5DE34/5DE86.
; ==============================================================================================
CachedObject_DestructCore_352CB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_352F8
		cmp	dword ptr [si+6], 0
		jz	short loc_352F8
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_352F8

loc_352F8:
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		cmp	byte ptr [si+15h], 0
		jz	short loc_35332
		cmp	dword ptr [si+10h], 0
		jz	short loc_35332
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_35332

loc_35332:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si+1Ah], 0
		pop	si
		pop	bp
		retf
CachedObject_DestructCore_352CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; CachedObject_DestructHelper_2D5ED (sub_2D5ED de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à CachedObject_DestructHelper_5DE34 (sub_5DE34 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; CachedObject_DestructCore_5DDA7. Référencée en interne du segment.
; ==============================================================================================
CachedObject_DestructHelper_35358		proc far

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
		push	si
		push	cs
		call	near ptr CachedObject_DestructCore_352CB
		pop	cx
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+6], eax
		mov	al, [bp+var_5]
		mov	[si+0Ah], al
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	eax, [di+6]
		mov	[si+0Ch], eax
		mov	di, [bp+arg_2]
		mov	byte ptr [di+5], 0
		mov	byte ptr [si+0Bh], 1
		pop	di
		pop	si
		leave
		retf
CachedObject_DestructHelper_35358		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; CachedObject_DestructHelper_2D63F (sub_2D63F de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à CachedObject_DestructHelper_5DE86 (sub_5DE86 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; CachedObject_DestructCore_5DDA7. Référencée par CachedObject_ConstructVariantB_5DB0D.
; ==============================================================================================
CachedObject_DestructHelper_353AA		proc far

var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr CachedObject_DestructCore_352CB
		pop	cx
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	al, [bp+arg_6]
		mov	[bp+var_5], al
		mov	al, [bp+arg_8]
		mov	[bp+var_6], al
		mov	eax, [bp+var_4]
		mov	[si+6], eax
		mov	al, [bp+var_5]
		mov	[si+0Ah], al
		mov	al, [bp+var_6]
		mov	[si+0Bh], al
		mov	dword ptr [si+0Ch], 0
		pop	si
		leave
		retf
CachedObject_DestructHelper_353AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_353ED		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr CachedObject_DestructCore_352CB
		pop	cx
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+6], eax
		mov	al, [bp+var_5]
		mov	[si+0Ah], al
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	eax, [di+6]
		mov	[si+0Ch], eax
		mov	di, [bp+arg_2]
		mov	byte ptr [di+5], 0
		mov	byte ptr [si+0Bh], 1
		push	[bp+arg_4]
		push	si
		nop
		push	cs
		call	near ptr sub_3552A
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_353ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_BuildAndTransform_2D682 (sub_2D682 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à CachedObject_BuildAndTransform_5DEC9 (sub_5DEC9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 131 lignes, NON DÉTAILLÉE — combine Memory_TypedAllocDispatchB_5C832 ×2, sub_625CC,
; sub_5E74E, Memory_TypedFreeWrapper_5C6F3 (seg131). Référencée par sub_5E00C.
; ==============================================================================================
CachedObject_BuildAndTransform_3544B		proc far

var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+6], 0
		jz	short loc_35462
		mov	ax, 1
		jmp	short loc_35464

loc_35462:
		xor	ax, ax

loc_35464:
		or	ax, ax
		jnz	short loc_3546B
		jmp	loc_35526

loc_3546B:
		xor	ax, ax
		mov	[bp+var_4], ax
		mov	[bp+var_2], ax
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large [si+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		mov	[bp+var_E], ax
		xor	di, di
		jmp	short loc_354DA

loc_35496:
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	large 0
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large [si+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	sub_35BAA
		mov	dx, [bp+var_8]
		sub	dx, [bp+var_C]
		inc	dx
		cmp	dx, [bp+var_2]
		jle	short loc_354CA
		mov	[bp+var_2], dx

loc_354CA:
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_A]
		inc	dx
		cmp	dx, [bp+var_4]
		jle	short loc_354D9
		mov	[bp+var_4], dx

loc_354D9:
		inc	di

loc_354DA:
		cmp	di, [bp+var_E]
		jl	short loc_35496
		mov	ax, [bp+var_2]
		imul	[bp+var_4]
		movsx	eax, ax
		mov	[bp+var_12], eax
		push	0
		push	0
		push	2
		push	eax
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_12]
		mov	[si+16h], eax

loc_35526:
		pop	di
		pop	si
		leave
		retf
CachedObject_BuildAndTransform_3544B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3552A		proc far

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
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+10h], eax
		mov	al, [bp+var_5]
		mov	[si+14h], al
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	eax, [di+6]
		mov	[si+16h], eax
		pop	di
		pop	si
		leave
		retf
sub_3552A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3556B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Ah], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
sub_3556B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_AllocateAndInit_2D777 (sub_2D777 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à CachedObject_AllocateAndInit_5DFBE (sub_5DFBE de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Memory_TypedAllocDispatchB_5C832 et sub_61F52. Référencée en interne (loc_5DFF4).
; ==============================================================================================
CachedObject_AllocateAndInit_35581		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1Ah]
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large [si+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
CachedObject_AllocateAndInit_35581		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_355B7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		push	cs
		call	near ptr CachedObject_AllocateAndInit_35581
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_355B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_BuildComposite_2D7C5 (sub_2D7C5 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à CachedObject_BuildComposite_5E00C (sub_5E00C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 85 lignes,
; NON DÉTAILLÉE — combine Memory_TypedAllocDispatchB_5C832 ×3,
; CachedObject_BuildAndTransform_5DEC9, sub_62BFE. Référencée par sub_67F8A.
; ==============================================================================================
CachedObject_BuildComposite_355CF		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_3561C
		push	si
		push	cs
		call	near ptr CachedObject_BuildAndTransform_3544B
		pop	cx
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_3561C:
		cmp	[bp+var_4], 0
		jz	short loc_3565F
		push	word ptr [si+1Ah]
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large [si+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	large [bp+var_4]
		push	word_4D36C
		call	sub_391BE
		add	sp, 10h
		mov	ax, [si+2]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		mov	[si+1Eh], ax

loc_3565F:
		pop	si
		leave
		retf
CachedObject_BuildComposite_355CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35662		proc far

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
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
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
		call	dword ptr [bx+4]
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
sub_35662		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_356A3		proc far

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
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		add	[si+2], ax
		mov	ax, [bp+var_4]
		add	[si+4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[bp+var_6], ax
		mov	[si+1Ah], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
sub_356A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_BuildVariant_2D8E3 (sub_2D8E3 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à CachedObject_BuildVariant_5E12A (sub_5E12A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Memory_TypedAllocDispatchB_5C832 ×2 et sub_625E2. Référencée par sub_67FF8.
; ==============================================================================================
CachedObject_BuildVariant_356ED		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_35749
		push	word ptr [si+1Ah]
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large [si+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	large [bp+var_4]
		push	word_4D36C
		call	sub_38BA2
		add	sp, 10h

loc_35749:
		pop	si
		leave
		retf
CachedObject_BuildVariant_356ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3574C		proc far

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
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
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
		call	dword ptr [bx+4]
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
sub_3574C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3578D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+15h], 0
		jz	short loc_357BA
		cmp	dword ptr [si+10h], 0
		jz	short loc_357BA
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_357BA

loc_357BA:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		pop	si
		pop	bp
sub_3578D		endp
seg109		ends
