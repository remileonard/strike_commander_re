seg111		segment	para public 'CODE' use16
		assume cs:seg111
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_Allocate_673DC (sub_673DC de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_Allocate_2D201 (sub_2D201 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à CachedObject_Allocate_5DA48 (sub_5DA48 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue via sub_658.
; Référencée depuis seg209 (segment distant non encore couvert).
; ==============================================================================================
CachedObject_Allocate_46FA2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_46FBB
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_46FFC

loc_46FBB:
		mov	word ptr [si], 1DC3h
		mov	word ptr [si], 1DCFh
		mov	word ptr [si], 4026h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+1Ah], 0

loc_46FFC:
		mov	ax, si
		pop	si
		pop	bp
		retf
CachedObject_Allocate_46FA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47001		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4701A
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_47062

loc_4701A:
		mov	word ptr [si], 1DC3h
		mov	word ptr [si], 1DCFh
		mov	word ptr [si], 4026h
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
		call	near ptr CachedObject_DestructHelper_4738E
		add	sp, 4

loc_47062:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_47001		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_ConstructVariantB_674A1 (sub_674A1 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_ConstructVariantB_5DB0D (sub_5DB0D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658) et appelle CachedObject_DestructHelper_5DE86. Référencée par sub_85ACB.
; ==============================================================================================
CachedObject_ConstructVariantB_47067		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_47080
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_470D1

loc_47080:
		mov	word ptr [si], 1DC3h
		mov	word ptr [si], 1DCFh
		mov	word ptr [si], 4026h
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
		call	near ptr CachedObject_DestructHelper_473E0
		add	sp, 0Ah

loc_470D1:
		mov	ax, si
		pop	si
		pop	bp
		retf
CachedObject_ConstructVariantB_47067		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_470D6		proc far

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
		jnz	short loc_470F2
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_47152

loc_470F2:
		mov	word ptr [si], 1DC3h
		mov	word ptr [si], 1DCFh
		mov	word ptr [si], 4026h
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
		call	near ptr CachedObject_DestructHelper_4738E
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+2], ax
		mov	ax, [bp+var_4]
		mov	[si+4], ax

loc_47152:
		mov	ax, si
		pop	si
		leave
		retf
sub_470D6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47157		proc far

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
		jnz	short loc_47173
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_471DC

loc_47173:
		mov	word ptr [si], 1DC3h
		mov	word ptr [si], 1DCFh
		mov	word ptr [si], 4026h
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
		call	near ptr CachedObject_DestructHelper_4738E
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

loc_471DC:
		mov	ax, si
		pop	si
		leave
		retf
sub_47157		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_Destruct_6761B (sub_6761B de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_Destruct_2D440 (sub_2D440 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à CachedObject_Destruct_5DC87 (sub_5DC87 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, destructeur : appelle
; sub_5DD29 puis libère deux blocs (Memory_TypedFree_5C7B6 ×2) et l'objet lui-même (sub_338).
; Référencée depuis seg209.
; ==============================================================================================
CachedObject_Destruct_471E1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_471F3
		jmp	loc_4727F

loc_471F3:
		mov	word ptr [si], 4026h
		push	si
		nop
		push	cs
		call	near ptr CachedObject_ReleaseFields_47283
		pop	cx
		cmp	byte ptr [si+15h], 0
		jz	short loc_47224
		cmp	dword ptr [si+10h], 0
		jz	short loc_47224
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_47224

loc_47224:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_4725E
		cmp	dword ptr [si+6], 0
		jz	short loc_4725E
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_4725E

loc_4725E:
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		test	di, 1
		jz	short loc_4727F
		push	si
		call	sub_33B
		pop	cx

loc_4727F:
		pop	di
		pop	si
		pop	bp
		retf
CachedObject_Destruct_471E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_ReleaseFields_676BD (sub_676BD de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_ReleaseFields_2D4E2 (sub_2D4E2 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à CachedObject_ReleaseFields_5DD29 (sub_5DD29 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, libère les
; champs internes d'un objet mis en cache (Memory_TypedFree_5C7B6 ×2). Appelée par
; CachedObject_Destruct_5DC87.
; ==============================================================================================
CachedObject_ReleaseFields_47283		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_472B0
		cmp	dword ptr [si+6], 0
		jz	short loc_472B0
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_472B0

loc_472B0:
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		cmp	byte ptr [si+15h], 0
		jz	short loc_472EA
		cmp	dword ptr [si+10h], 0
		jz	short loc_472EA
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_472EA

loc_472EA:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		pop	si
		pop	bp
		retf
CachedObject_ReleaseFields_47283		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_DestructCore_6773B (sub_6773B de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_DestructCore_2D560 (sub_2D560 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à CachedObject_DestructCore_5DDA7 (sub_5DDA7 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, cœur de
; destruction partagé (Memory_TypedFree_5C7B6 ×2). Appelée par
; CachedObject_DestructHelper_5DE34/5DE86.
; ==============================================================================================
CachedObject_DestructCore_47301		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_4732E
		cmp	dword ptr [si+6], 0
		jz	short loc_4732E
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_4732E

loc_4732E:
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		cmp	byte ptr [si+15h], 0
		jz	short loc_47368
		cmp	dword ptr [si+10h], 0
		jz	short loc_47368
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_47368

loc_47368:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si+1Ah], 0
		pop	si
		pop	bp
		retf
CachedObject_DestructCore_47301		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; CachedObject_DestructHelper_677C8 (sub_677C8 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à CachedObject_DestructHelper_2D5ED (sub_2D5ED de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à CachedObject_DestructHelper_5DE34 (sub_5DE34 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle CachedObject_DestructCore_5DDA7. Référencée en interne du segment.
; ==============================================================================================
CachedObject_DestructHelper_4738E		proc far

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
		call	near ptr CachedObject_DestructCore_47301
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
CachedObject_DestructHelper_4738E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; CachedObject_DestructHelper_6781A (sub_6781A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à CachedObject_DestructHelper_2D63F (sub_2D63F de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à CachedObject_DestructHelper_5DE86 (sub_5DE86 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle CachedObject_DestructCore_5DDA7. Référencée par
; CachedObject_ConstructVariantB_5DB0D.
; ==============================================================================================
CachedObject_DestructHelper_473E0		proc far

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
		call	near ptr CachedObject_DestructCore_47301
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
CachedObject_DestructHelper_473E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47423		proc far

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
		call	near ptr CachedObject_DestructCore_47301
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
		call	near ptr sub_4757C
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_47423		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47481		proc far

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
		jz	short loc_47498
		mov	ax, 1
		jmp	short loc_4749A

loc_47498:
		xor	ax, ax

loc_4749A:
		or	ax, ax
		jnz	short loc_474A1
		jmp	loc_47578

loc_474A1:
		xor	ax, ax
		mov	[bp+var_4], ax
		mov	[bp+var_2], ax
		cmp	byte ptr [si+0Ah], 3
		jnz	short loc_474C6
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large [si+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_474CC

loc_474C6:
		mov	dx, [si+8]
		mov	ax, [si+6]

loc_474CC:
		push	dx
		push	ax
		call	sub_4A3E2
		mov	[bp+var_E], ax
		xor	di, di
		jmp	short loc_4752C

loc_474DA:
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	large 0
		cmp	byte ptr [si+0Ah], 3
		jnz	short loc_474FF
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large [si+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_47505

loc_474FF:
		mov	dx, [si+8]
		mov	ax, [si+6]

loc_47505:
		push	dx
		push	ax
		push	di
		call	sub_47C50
		mov	dx, [bp+var_8]
		sub	dx, [bp+var_C]
		inc	dx
		cmp	dx, [bp+var_2]
		jle	short loc_4751C
		mov	[bp+var_2], dx

loc_4751C:
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_A]
		inc	dx
		cmp	dx, [bp+var_4]
		jle	short loc_4752B
		mov	[bp+var_4], dx

loc_4752B:
		inc	di

loc_4752C:
		cmp	di, [bp+var_E]
		jl	short loc_474DA
		mov	ax, [bp+var_2]
		imul	[bp+var_4]
		movsx	eax, ax
		mov	[bp+var_12], eax
		push	0
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
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

loc_47578:
		pop	di
		pop	si
		leave
		retf
sub_47481		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4757C		proc far

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
sub_4757C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_475BD		proc far

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
sub_475BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_475D3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1Ah]
		cmp	byte ptr [si+0Ah], 3
		jnz	short loc_475FA
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large [si+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_47600

loc_475FA:
		mov	dx, [si+8]
		mov	ax, [si+6]

loc_47600:
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_475D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47617		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		push	cs
		call	near ptr sub_475D3
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_47617		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4762F		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+14h], 3
		jnz	short loc_47656
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_4765C

loc_47656:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_4765C:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_47698
		push	si
		push	cs
		call	near ptr sub_47481
		pop	cx
		cmp	byte ptr [si+14h], 3
		jnz	short loc_4768C
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_47692

loc_4768C:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_47692:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_47698:
		cmp	[bp+var_4], 0
		jz	short loc_476E9
		push	word ptr [si+1Ah]
		cmp	byte ptr [si+0Ah], 3
		jnz	short loc_476BF
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large [si+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_476C5

loc_476BF:
		mov	dx, [si+8]
		mov	ax, [si+6]

loc_476C5:
		push	dx
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	large [bp+var_4]
		push	word_5DD42
		call	sub_4AA14
		add	sp, 10h
		mov	ax, [si+2]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		mov	[si+1Eh], ax

loc_476E9:
		pop	si
		leave
		retf
sub_4762F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_476EC		proc far

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
sub_476EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4772D		proc far

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
sub_4772D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47777		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+14h], 3
		jnz	short loc_4779E
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_477A4

loc_4779E:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_477A4:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_477EF
		push	word ptr [si+1Ah]
		cmp	byte ptr [si+0Ah], 3
		jnz	short loc_477D1
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large [si+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_477D7

loc_477D1:
		mov	dx, [si+8]
		mov	ax, [si+6]

loc_477D7:
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	large [bp+var_4]
		push	word_5DD42
		call	sub_4A3F8
		add	sp, 10h

loc_477EF:
		pop	si
		leave
		retf
sub_47777		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_477F2		proc far

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
sub_477F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47833		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+15h], 0
		jz	short loc_47860
		cmp	dword ptr [si+10h], 0
		jz	short loc_47860
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_47860

loc_47860:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
sub_47833		endp

; START OF FUNCTION CHUNK FOR sub_47833
		db 66h, 0C7h
		inc	sp
		push	ss
; END OF FUNCTION CHUNK FOR sub_47833
seg111		ends
