seg166		segment	para public 'CODE' use16
		assume cs:seg166
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_Destruct_3D240 (sub_3D240 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à IndexedRecordReader_Destruct_659D0 (sub_659D0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, destructeur
; (tag 402Ah) : ferme le flux (StreamReader_CloseHook_63D6E), libère un champ (+0x75) et le
; flux lui-même (StreamReader_Close_63BD5), libère l'objet si demandé. Référencée par
; sub_33485 et sub_3350E (proches du cœur IA).
; ==============================================================================================
IndexedRecordReader_Destruct_432D2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_43318
		mov	word ptr [si], 5372h
		push	si
		call	StreamReader_ValidateState_412A1
		pop	cx
		or	al, al
		jz	short loc_432F7
		push	si
		call	sub_4123E
		pop	cx

loc_432F7:
		push	word ptr [si+75h]
		call	sub_39C
		pop	cx
		push	0
		push	si
		call	StreamReader_Close_410AA
		add	sp, 4
		test	di, 1
		jz	short loc_43318
		push	si
		call	sub_39C
		pop	cx

loc_43318:
		pop	di
		pop	si
		pop	bp
		retf
IndexedRecordReader_Destruct_432D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantA_3D28A (sub_3D28A
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantA_65A1A (sub_65A1A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), construit un StreamReader (StreamReader_ConstructVariantA_63A39, seg190)
; et initialise les champs d'index (sub_65B03).
; ==============================================================================================
IndexedRecordReader_ConstructVariantA_4331C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_43335
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_43347

loc_43335:
		push	si
		call	StreamReader_ConstructVariantA_40ED4
		pop	cx
		mov	word ptr [si], 5372h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_43405
		pop	cx

loc_43347:
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantA_4331C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantB_3D2BA (sub_3D2BA
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantB_65A4A (sub_65A4A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que ConstructVariantA avec dispatch vtable [bx+0x14] additionnel.
; ==============================================================================================
IndexedRecordReader_ConstructVariantB_4334C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_43365
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_43387

loc_43365:
		push	si
		call	StreamReader_ConstructVariantA_40ED4
		pop	cx
		mov	word ptr [si], 5372h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_43405
		pop	cx
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_43387:
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantB_4334C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantC_3D2FA (sub_3D2FA
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantC_65A8A (sub_65A8A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), construit via StreamReader_ConstructAndBind_63B23 (seg190) et initialise
; les champs d'index (sub_65B03), dispatch vtable [bx+0xC].
; ==============================================================================================
IndexedRecordReader_ConstructVariantC_4338C		proc far

var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_433A8
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_43400

loc_433A8:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		mov	word ptr [si], 4511h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg123
		mov	word ptr [si+2], 7
		mov	word ptr [si], 52E9h
		push	0
		push	eax
		push	large [bp+var_6]
		push	[bp+var_2]
		push	si
		call	sub_40FBE
		add	sp, 0Eh
		mov	word ptr [si], 5372h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_43405
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_43400:
		mov	ax, si
		pop	si
		leave
		retf
IndexedRecordReader_ConstructVariantC_4338C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; IndexedRecordReader_InitFields_3D373 (sub_3D373 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à IndexedRecordReader_InitFields_65B03 (sub_65B03 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; initialise les champs d'index de l'objet (+0x5D compteur courant, +0x5F total, +0x61/+0x65
; position, +0x75 cache) à zéro. Appelée par les trois constructeurs ConstructVariant*.
; ==============================================================================================
IndexedRecordReader_InitFields_43405		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+5Dh], ax
		mov	[si+5Fh], ax
		movsx	eax, ax
		mov	[si+65h], eax
		mov	[si+61h], eax
		mov	word ptr [si+75h], 0
		pop	si
		pop	bp
		retf
IndexedRecordReader_InitFields_43405		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43428		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_PrepareForRead_41432
		pop	cx
		push	large 4
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		mov	eax, [bp+var_4]
		mov	ebx, 4
		cdq
		idiv	ebx
		dec	ax
		mov	[si+5Dh], ax
		mov	word ptr [si+5Fh], 0
		pop	si
		leave
		retf
sub_43428		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43468		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	dword_4DD0A, 0
		jnz	short loc_43494
		push	1
		push	0
		push	2
		push	large 40Fh
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word_4DD0C, dx
		mov	word ptr dword_4DD0A, ax

loc_43494:
		cmp	dword_4DD0E, 0
		jnz	short loc_434BA
		push	1
		push	0
		push	2
		push	large 300Fh
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word_4DD10, dx
		mov	word ptr dword_4DD0E, ax

loc_434BA:
		mov	word_4DBF7, 0
		mov	eax, dword_4DD0A
		mov	[bp+var_4], eax
		mov	cx, word ptr [bp+var_4+2]
		mov	bx, word ptr [bp+var_4]
		mov	dx, bx
		and	dx, 0Fh
		or	dx, dx
		jz	short loc_434DC
		sub	bx, dx
		inc	cx
		jmp	short loc_434DC

loc_434DC:
		mov	word_4DBF1, cx
		mov	word_4DBEF, bx
		mov	word_4DBF3, 400h
		mov	dx, word_4DD10
		cmp	word ptr dword_4DD0E, 0
		jz	short loc_434F6
		inc	dx

loc_434F6:
		mov	word_4DBE4, dx
		mov	eax, [bp+arg_6]
		mov	dword_4DBEB, eax
		mov	word_4DBDA, 0FFFFh
		push	large [bp+arg_2]
		push	[bp+arg_0]
		call	sub_401E8
		add	sp, 6
		leave
		retf
sub_43468		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43519		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jnz	short loc_43537
		push	1D01h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_43537:
		cmp	di, 0FFFFh
		jz	short loc_4354A
		push	di
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		or	al, al
		jz	short loc_43594

loc_4354A:
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		or	ax, ax
		jz	short loc_43570
		cmp	ax, 0C0h
		jnz	short loc_43588
		push	large [si+65h]
		push	large [si+61h]
		push	large [bp+arg_4]
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		jmp	short loc_43594

loc_43570:
		push	large [bp+arg_4]
		mov	eax, [si+65h]
		add	eax, 4
		push	eax
		push	si
		push	cs
		call	near ptr sub_43468
		add	sp, 0Ah
		jmp	short loc_43594

loc_43588:
		push	1D00h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_43594:
		pop	di
		pop	si
		pop	bp
		retf
sub_43519		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43598		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		inc	word ptr [si+5Fh]
		mov	ax, [si+5Fh]
		cmp	ax, [si+5Dh]
		jnz	short loc_435B6
		push	1D02h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_435B6:
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_43598		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_435C5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+5Fh]
		dec	word ptr [si+5Fh]
		or	ax, ax
		jnz	short loc_435E2
		push	1D02h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_435E2:
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_435C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_435F1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Dh], 0
		jz	short loc_43630
		mov	ax, [si+5Dh]
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+75h], ax
		cmp	word ptr [si+75h], 0
		jz	short loc_43630
		push	large 4
		mov	ax, [si+5Dh]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	ds
		push	word ptr [si+75h]
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh

loc_43630:
		pop	si
		pop	bp
		retf
sub_435F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ReadEntry_3D619 (sub_3D619 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; IndexedRecordReader_ReadEntry_65DA9 (sub_65DA9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit une entrée via
; StreamReader_ReadTyped_63FA1, gestion d'erreur (Runtime_FatalErrorHandlerWithTag). Appelée
; deux fois par sub_65E2C.
; ==============================================================================================
IndexedRecordReader_ReadEntry_43633		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[bp+var_4], 0
		cmp	[si+5Dh], dx
		jbe	short loc_4369E
		cmp	word ptr [si+75h], 0
		jz	short loc_43666
		mov	ax, dx
		shl	ax, 2
		mov	bx, [si+75h]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_4], eax
		jmp	short loc_43683

loc_43666:
		mov	ax, dx
		inc	ax
		shl	ax, 2
		movsx	eax, ax
		push	eax
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh

loc_43683:
		mov	eax, [bp+var_4]
		sar	eax, 18h
		mov	word_4F69C, ax
		mov	eax, [bp+var_4]
		and	eax, 0FFFFFFh
		mov	[bp+var_4], eax
		jmp	short loc_436AA

loc_4369E:
		push	1D02h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_436AA:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
IndexedRecordReader_ReadEntry_43633		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_AdvanceIndex_3D69C (sub_3D69C de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; IndexedRecordReader_AdvanceIndex_65E2C (sub_65E2C de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 115 lignes, NON DÉTAILLÉE —
; combine IndexedRecordReader_ReadEntry_65DA9 (×2), StreamReader_GetCapacity_64062,
; StreamReader_SeekVariant_63DF6, StreamReader_ReadTyped_63FA1 — avance vers l'entrée d'index
; suivante et positionne le flux.
; ==============================================================================================
IndexedRecordReader_AdvanceIndex_436B6		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr IndexedRecordReader_ReadEntry_43633
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	ax, word_4F69C
		mov	[si+6Dh], ax
		mov	[si+5Fh], di
		inc	di
		cmp	[si+5Dh], di
		jnz	short loc_436F1
		push	si
		call	StreamReader_GetCapacity_4154E
		push	dx
		push	ax
		pop	eax
		pop	cx
		jmp	short loc_436FE

loc_436F1:
		push	di
		push	si
		push	cs
		call	near ptr IndexedRecordReader_ReadEntry_43633
		push	dx
		push	ax
		pop	eax
		add	sp, 4

loc_436FE:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_4]
		mov	[si+61h], eax
		mov	eax, [bp+var_4]
		mov	[si+65h], eax
		push	eax
		push	si
		call	StreamReader_SeekVariant_412E2
		add	sp, 6
		test	word ptr [si+6Dh], 0C0h
		jnz	short loc_43741
		push	large [si+65h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 71h
		push	ax
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		jmp	short loc_43749

loc_43741:
		mov	eax, [si+61h]
		mov	[si+71h], eax

loc_43749:
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
IndexedRecordReader_AdvanceIndex_436B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4374F		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		push	large [si+69h]
		push	large [si+65h]
		push	large [si+61h]
		push	word ptr [si+5Fh]
		push	word ptr [si+5Dh]
		push	5332h
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_2F73C
		add	sp, 14h
		push	[bp+var_4]
		mov	ax, si
		add	ax, 6
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4
		push	si
		call	StreamReader_Destruct_40D9A
		pop	cx
		lea	ax, [bp+var_4]
		push	ax
sub_4374F		endp
seg166		ends
