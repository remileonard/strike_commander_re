seg005		segment	para public 'CODE' use16
		assume cs:seg005
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_Destruct_73BD (sub_73BD de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
IndexedRecordReader_Destruct_4BF0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4C36
		mov	word ptr [si], 1D0h
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jz	short loc_4C15
		push	si
		call	sub_527AA
		pop	cx

loc_4C15:
		push	word ptr [si+75h]
		call	sub_33B
		pop	cx
		push	0
		push	si
		call	StreamReader_Close_52616
		add	sp, 4
		test	di, 1
		jz	short loc_4C36
		push	si
		call	sub_33B
		pop	cx

loc_4C36:
		pop	di
		pop	si
		pop	bp
		retf
IndexedRecordReader_Destruct_4BF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantA_7407 (sub_7407
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantA_3D28A (sub_3D28A
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantA_65A1A (sub_65A1A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), construit un StreamReader (StreamReader_ConstructVariantA_63A39, seg190)
; et initialise les champs d'index (sub_65B03).
; ==============================================================================================
IndexedRecordReader_ConstructVariantA_4C3A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4C53
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4C65

loc_4C53:
		push	si
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	word ptr [si], 1D0h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_4D23
		pop	cx

loc_4C65:
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantA_4C3A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantB_7437 (sub_7437
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantB_3D2BA (sub_3D2BA
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantB_65A4A (sub_65A4A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que ConstructVariantA avec dispatch vtable [bx+0x14] additionnel.
; ==============================================================================================
IndexedRecordReader_ConstructVariantB_4C6A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4C83
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4CA5

loc_4C83:
		push	si
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	word ptr [si], 1D0h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_4D23
		pop	cx
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_4CA5:
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantB_4C6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantC_7477 (sub_7477
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantC_3D2FA (sub_3D2FA
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantC_65A8A (sub_65A8A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), construit via StreamReader_ConstructAndBind_63B23 (seg190) et initialise
; les champs d'index (sub_65B03), dispatch vtable [bx+0xC].
; ==============================================================================================
IndexedRecordReader_ConstructVariantC_4CAA		proc far

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
		jnz	short loc_4CC6
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4D1E

loc_4CC6:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		mov	word ptr [si], 1B0h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg017
		mov	word ptr [si+2], 38h
		mov	word ptr [si], 1B8h
		push	0
		push	eax
		push	large [bp+var_6]
		push	[bp+var_2]
		push	si
		call	sub_5252A
		add	sp, 0Eh
		mov	word ptr [si], 1D0h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_4D23
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_4D1E:
		mov	ax, si
		pop	si
		leave
		retf
IndexedRecordReader_ConstructVariantC_4CAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; IndexedRecordReader_InitFields_74F0 (sub_74F0 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à IndexedRecordReader_InitFields_3D373 (sub_3D373 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; IndexedRecordReader_InitFields_65B03 (sub_65B03 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, initialise les champs d'index de l'objet
; (+0x5D compteur courant, +0x5F total, +0x61/+0x65 position, +0x75 cache) à zéro. Appelée par
; les trois constructeurs ConstructVariant*.
; ==============================================================================================
IndexedRecordReader_InitFields_4D23		proc far

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
IndexedRecordReader_InitFields_4D23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D46		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_PrepareForRead_5299E
		pop	cx
		push	large 4
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_529F9
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
sub_4D46		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D86		proc far

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
		jnz	short loc_4DA4
		push	1D01h
		push	si
		call	sub_59C05
		add	sp, 4

loc_4DA4:
		cmp	di, 0FFFFh
		jz	short loc_4DB7
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_4EF9
		add	sp, 4
		or	al, al
		jz	short loc_4DE2

loc_4DB7:
		mov	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_4DD6
		push	large [si+65h]
		push	large [si+61h]
		push	large [bp+arg_4]
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		jmp	short loc_4DE2

loc_4DD6:
		push	1D00h
		push	si
		call	sub_59C05
		add	sp, 4

loc_4DE2:
		pop	di
		pop	si
		pop	bp
		retf
sub_4D86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4DE6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		inc	word ptr [si+5Fh]
		mov	ax, [si+5Fh]
		cmp	ax, [si+5Dh]
		jnz	short loc_4E04
		push	1D02h
		push	si
		call	sub_59C05
		add	sp, 4

loc_4E04:
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr sub_4EF9
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_4DE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E13		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+5Fh]
		dec	word ptr [si+5Fh]
		or	ax, ax
		jnz	short loc_4E30
		push	1D02h
		push	si
		call	sub_59C05
		add	sp, 4

loc_4E30:
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr sub_4EF9
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_4E13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E3F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Dh], 0
		jz	short loc_4E7E
		mov	ax, [si+5Dh]
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+75h], ax
		cmp	word ptr [si+75h], 0
		jz	short loc_4E7E
		push	large 4
		mov	ax, [si+5Dh]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	ds
		push	word ptr [si+75h]
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh

loc_4E7E:
		pop	si
		pop	bp
		retf
sub_4E3F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E81		proc far

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
		jbe	short loc_4EE1
		cmp	word ptr [si+75h], 0
		jz	short loc_4EB4
		mov	ax, dx
		shl	ax, 2
		mov	bx, [si+75h]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_4], eax
		jmp	short loc_4ED1

loc_4EB4:
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
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh

loc_4ED1:
		mov	word_5EFC8, 0C0h
		mov	eax, [bp+var_4]
		mov	[bp+var_4], eax
		jmp	short loc_4EED

loc_4EE1:
		push	1D02h
		push	si
		call	sub_59C05
		add	sp, 4

loc_4EED:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_4E81		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4EF9		proc far

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
		call	near ptr sub_4E81
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	ax, word_5EFC8
		mov	[si+6Dh], ax
		mov	[si+5Fh], di
		inc	di
		cmp	[si+5Dh], di
		jnz	short loc_4F34
		push	si
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		jmp	short loc_4F41

loc_4F34:
		push	di
		push	si
		push	cs
		call	near ptr sub_4E81
		push	dx
		push	ax
		pop	eax
		add	sp, 4

loc_4F41:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_4]
		mov	[si+61h], eax
		mov	eax, [bp+var_4]
		mov	[si+65h], eax
		push	eax
		push	si
		call	StreamReader_SeekVariant_5284E
		add	sp, 6
		mov	eax, [si+61h]
		mov	[si+71h], eax
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_4EF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4F72		proc far

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
		push	170h
		lea	ax, [bp+var_4]
		push	ax
		call	sub_59B44
		add	sp, 14h
		push	[bp+var_4]
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_59B3F
		add	sp, 4
		push	si
		call	StreamReader_Destruct_52306
		pop	cx
		lea	ax, [bp+var_4]
		push	ax
		call	sub_59B75
		pop	cx
		pop	si
		leave
		retf
sub_4F72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4FCC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4FF6
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_59B75
		pop	cx
		test	di, 1
		jz	short loc_4FF6
		push	si
sub_4FCC		endp

; START OF FUNCTION CHUNK FOR sub_4FCC
		db 9Ah, 3Bh
; END OF FUNCTION CHUNK FOR sub_4FCC
seg005		ends
