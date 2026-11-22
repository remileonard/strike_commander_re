seg162		segment	para public 'CODE' use16
		assume cs:seg162
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6Ah, 0, 9Ah, 1, 0, 0D6h, 51h, 83h, 0C4h, 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5439C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_52A9E
		pop	cx
		cmp	dword ptr [si+5Dh], 0
		jnz	short loc_54407
		jmp	short loc_543D3

loc_543B3:
		mov	eax, [si+61h]
		sar	eax, 1
		mov	[si+61h], eax
		cmp	dword ptr [si+61h], 0
		jnz	short loc_543D3
		push	1AE0h
		push	si
		call	sub_59C05
		add	sp, 4
		jmp	short loc_543EC

loc_543D3:
		push	0
		push	2
		push	67B0h
		call	Memory_TypedAllocDispatchC_4495C
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, [si+61h]
		jle	short loc_543B3

loc_543EC:
		push	3
		push	0
		push	2
		push	large [si+61h]
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+5Fh], dx
		mov	[si+5Dh], ax

loc_54407:
		pop	si
		pop	bp
		retf
sub_5439C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5440A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_54423
		push	65h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_54443

loc_54423:
		push	[bp+arg_2]
		push	si
		call	StreamReader_ConstructVariantB_5248F
		add	sp, 4
		mov	word ptr [si], 9B5h
		mov	eax, [bp+arg_4]
		mov	[si+61h], eax
		mov	dword ptr [si+5Dh], 0

loc_54443:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_5440A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54448		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_54464
		push	65h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_544AC

loc_54464:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	word ptr [si], 1B0h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg017
		mov	word ptr [si+2], 38h
		mov	word ptr [si], 1B8h
		push	0
		push	large 0
		push	large 0
		push	ax
		push	si
		call	sub_5252A
		add	sp, 0Eh
		mov	word ptr [si], 9B5h
		mov	eax, [bp+arg_4]
		mov	[si+61h], eax
		mov	dword ptr [si+5Dh], 0

loc_544AC:
		mov	ax, si
		pop	si
		leave
		retf
sub_54448		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ReleaseBuffer_6DFAB (sub_6DFAB de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ReleaseBuffer_3CEB3 (sub_3CEB3 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_ReleaseBuffer_65643 (sub_65643 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, libère le
; tampon (Memory_TypedFree_5C7B6), ferme le flux sous-jacent (StreamReader_Close_63BD5,
; seg190) et libère l'objet (sub_338). DECOUVERTE COMPLEMENTAIRE : cette fonction est AUSSI
; utilisee comme fonction de SCORE pour MVRS ID=0x1 (tag 0x2B4) - reutilisation d'un
; utilitaire generique SANS INITIALISER AL AVANT LE RETOUR (pas de 'mov al,...' avant le
; retf), contrairement a toutes les autres fonctions de score qui bornent explicitement leur
; resultat 0-9/0-10. Le 'score' resultant pour ID=0x1 est donc indetermine (valeur residuelle
; de AL) - suggere un emplacement vestigial jamais concu comme un vrai type de comportement
; MVRS.
; ==============================================================================================
StreamReader_ReleaseBuffer_544B1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_544F9
		mov	word ptr [si], 9B5h
		cmp	dword ptr [si+5Dh], 0
		jz	short loc_544E1
		push	1A04h
		push	2
		mov	ax, si
		add	ax, 5Dh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_544E1:
		push	0
		push	si
		call	StreamReader_Close_52616
		add	sp, 4
		test	di, 1
		jz	short loc_544F9
		push	si
		call	sub_33B
		pop	cx

loc_544F9:
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_ReleaseBuffer_544B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; StreamReader_WriteTyped_6DFF7 (sub_6DFF7 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; StreamReader_WriteTyped_3CEFF (sub_3CEFF de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_WriteTyped_6568F (sub_6568F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, écriture typée à travers le
; flux tamponné — pendant en écriture de StreamReader_ReadTyped_63FA1 (seg190) : gère la
; position courante (+0x4D) et la capacité (+0x55), délègue à sub_65795 pour le débordement de
; capacité. Référencée massivement (seg188, seg193-194) — fonction centrale du système
; d'écriture typée par handle.
; ==============================================================================================
StreamReader_WriteTyped_544FD		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	eax, [bp+arg_A]
		mov	[bp+var_8], eax
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_54526
		mov	eax, [si+4Dh]
		mov	[bp+var_8], eax

loc_54526:
		mov	[bp+var_10], 0
		mov	[bp+var_C], 0
		mov	eax, [bp+var_8]
		add	eax, [bp+arg_6]
		cmp	eax, [si+55h]
		jle	short loc_54573
		mov	eax, [bp+var_8]
		add	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		sub	eax, [si+55h]
		mov	[bp+var_10], eax
		push	large [si+55h]
		push	eax
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_WriteWithGrowth_54603
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax

loc_54573:
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jnz	short loc_545D5
		push	large [bp+arg_6]
		mov	eax, [bp+var_8]
		add	eax, [si+51h]
		push	eax
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_545BA
		mov	eax, [bp+var_8]
		add	eax, [bp+var_4]
		mov	[si+4Dh], eax
		jmp	short loc_545F7

loc_545BA:
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_545D0
		push	si
		call	StreamReader_ReportError_52AA6
		pop	cx
		jmp	short loc_545D0

loc_545D0:
		push	1A05h
		jmp	short loc_545EE

loc_545D5:
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_545EB
		push	si
		call	StreamReader_ReportError_52AA6
		pop	cx
		jmp	short loc_545EB

loc_545EB:
		push	1A01h

loc_545EE:
		push	si
		call	sub_59C05
		add	sp, 4

loc_545F7:
		mov	eax, [si+4Dh]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_WriteTyped_544FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; StreamReader_WriteWithGrowth_6E0FD (sub_6E0FD de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 6 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à StreamReader_WriteWithGrowth_3D005 (sub_3D005 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à StreamReader_WriteWithGrowth_65795 (sub_65795 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 289 lignes,
; NON DÉTAILLÉE — la plus grosse fonction du segment, gros buffer local (0x1D octets +
; plusieurs dwords). Appelée par StreamReader_WriteTyped_6568F en cas de dépassement de
; capacité — probable écriture avec agrandissement automatique du tampon. Candidat pour
; session dédiée.
; ==============================================================================================
StreamReader_WriteWithGrowth_54603		proc far

var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1D], 0
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_54620
		mov	eax, [si+4Dh]
		mov	[bp+arg_A], eax

loc_54620:
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_A]
		cmp	eax, [bp+var_8]
		jl	short loc_54641
		jmp	loc_54794

loc_54641:
		mov	eax, [bp+var_8]
		sub	eax, [bp+arg_A]
		mov	[bp+var_4], eax
		push	large [bp+arg_6]
		push	large [bp+var_8]
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0FFFFFFFFh
		jnz	short loc_5469F
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5468C
		push	si
		call	StreamReader_ReportError_52AA6
		pop	cx
		jmp	short loc_5468C

loc_5468C:
		push	1A06h

loc_5468F:
		push	si
		call	sub_59C05
		add	sp, 4
		mov	[bp+var_1D], 1
		jmp	loc_54794

loc_5469F:
		mov	eax, [si+61h]
		mov	[bp+var_1C], eax
		cmp	eax, [bp+var_4]
		jle	short loc_546B5
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax

loc_546B5:
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		sub	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		jmp	loc_5478A

loc_546DC:
		push	large [bp+var_1C]
		push	large [bp+var_C]
		push	large [si+5Dh]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_18], eax
		cmp	[bp+var_18], 0FFFFFFFFh
		jz	short loc_54750
		push	large [bp+var_1C]
		push	large [bp+var_10]
		push	large [si+5Dh]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0FFFFFFFFh
		jz	short loc_54734
		sub	[bp+var_4], eax
		jmp	short loc_5476C

loc_54734:
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5474A
		push	si
		call	StreamReader_ReportError_52AA6
		pop	cx
		jmp	short loc_5474A

loc_5474A:
		push	1A08h
		jmp	loc_5468F

loc_54750:
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_54766
		push	si
		call	StreamReader_ReportError_52AA6
		pop	cx
		jmp	short loc_54766

loc_54766:
		push	1A09h
		jmp	loc_5468F

loc_5476C:
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_4]
		jle	short loc_5477E
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax

loc_5477E:
		mov	eax, [bp+var_1C]
		sub	[bp+var_C], eax
		sub	[bp+var_10], eax

loc_5478A:
		cmp	[bp+var_4], 0
		jz	short loc_54794
		jmp	loc_546DC

loc_54794:
		mov	al, [bp+var_1D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_547FE
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0FFFFFFFFh
		jz	short loc_547DC
		mov	eax, [bp+arg_A]
		add	eax, [bp+arg_6]
		mov	[si+4Dh], eax
		mov	eax, [bp+arg_6]
		add	[si+55h], eax
		jmp	short loc_547FE

loc_547DC:
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_547F2
		push	si
		call	StreamReader_ReportError_52AA6
		pop	cx
		jmp	short loc_547F2

loc_547F2:
		push	1A07h
		push	si
		call	sub_59C05
		add	sp, 4

loc_547FE:
		mov	eax, [si+4Dh]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_WriteWithGrowth_54603		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5480A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5482A
		mov	word ptr [si], 490Ah
		mov	word ptr [si+2], 0
		jmp	short loc_5482C

loc_5482A:
		mov	ax, si

loc_5482C:
		pop	si
		pop	bp
		retf
sub_5480A		endp

; ----------------------------------------------------------------------

sub_5482F		proc far
		push	bp
sub_5482F		endp
seg162		ends
