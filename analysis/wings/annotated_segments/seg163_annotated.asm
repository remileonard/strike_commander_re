seg163		segment	para public 'CODE' use16
		assume cs:seg163
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0ECh, 8Bh, 46h, 6, 50h, 9Ah, 6, 0, 30h, 52h, 59h, 5Dh, 0CBh

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
IndexedRecordReader_Destruct_5483E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_54884
		mov	word ptr [si], 49F0h
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jz	short loc_54863
		push	si
		call	sub_527AA
		pop	cx

loc_54863:
		push	word ptr [si+75h]
		call	sub_33B
		pop	cx
		push	0
		push	si
		call	StreamReader_Close_52616
		add	sp, 4
		test	di, 1
		jz	short loc_54884
		push	si
		call	sub_33B
		pop	cx

loc_54884:
		pop	di
		pop	si
		pop	bp
		retf
IndexedRecordReader_Destruct_5483E		endp

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
IndexedRecordReader_ConstructVariantA_54888		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_548A1
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_548B3

loc_548A1:
		push	si
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	word ptr [si], 49F0h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_54971
		pop	cx

loc_548B3:
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantA_54888		endp

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
IndexedRecordReader_ConstructVariantB_548B8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_548D1
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_548F3

loc_548D1:
		push	si
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	word ptr [si], 49F0h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_54971
		pop	cx
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_548F3:
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantB_548B8		endp

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
IndexedRecordReader_ConstructVariantC_548F8		proc far

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
		jnz	short loc_54914
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5496C

loc_54914:
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
		mov	word ptr [si], 49F0h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_54971
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_5496C:
		mov	ax, si
		pop	si
		leave
		retf
IndexedRecordReader_ConstructVariantC_548F8		endp

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
IndexedRecordReader_InitFields_54971		proc far

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
IndexedRecordReader_InitFields_54971		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54994		proc far

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
sub_54994		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_549D4		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	dword_5E6C8, 0
		jnz	short loc_54A00
		push	1
		push	0
		push	2
		push	large 40Fh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word_5E6CA, dx
		mov	word ptr dword_5E6C8, ax

loc_54A00:
		cmp	dword_5E6CC, 0
		jnz	short loc_54A26
		push	1
		push	0
		push	2
		push	large 300Fh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word_5E6CE, dx
		mov	word ptr dword_5E6CC, ax

loc_54A26:
		mov	word_5E5D3, 0
		mov	eax, dword_5E6C8
		mov	[bp+var_4], eax
		mov	cx, word ptr [bp+var_4+2]
		mov	bx, word ptr [bp+var_4]
		mov	dx, bx
		and	dx, 0Fh
		or	dx, dx
		jz	short loc_54A48
		sub	bx, dx
		inc	cx
		jmp	short loc_54A48

loc_54A48:
		mov	word_5E5CD, cx
		mov	word_5E5CB, bx
		mov	word_5E5CF, 400h
		mov	dx, word_5E6CE
		cmp	word ptr dword_5E6CC, 0
		jz	short loc_54A62
		inc	dx

loc_54A62:
		mov	word_5E5C0, dx
		mov	eax, [bp+arg_6]
		mov	dword_5E5C7, eax
		mov	word_5E5B6, 0FFFFh
		push	large [bp+arg_2]
		push	[bp+arg_0]
		call	sub_51A42
		add	sp, 6
		leave
		retf
sub_549D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54A85		proc far

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
		jnz	short loc_54AA3
		push	1D01h
		push	si
		call	sub_59C05
		add	sp, 4

loc_54AA3:
		cmp	di, 0FFFFh
		jz	short loc_54AB6
		push	di
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		or	al, al
		jz	short loc_54B00

loc_54AB6:
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		or	ax, ax
		jz	short loc_54ADC
		cmp	ax, 0C0h
		jnz	short loc_54AF4
		push	large [si+65h]
		push	large [si+61h]
		push	large [bp+arg_4]
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		jmp	short loc_54B00

loc_54ADC:
		push	large [bp+arg_4]
		mov	eax, [si+65h]
		add	eax, 4
		push	eax
		push	si
		push	cs
		call	near ptr sub_549D4
		add	sp, 0Ah
		jmp	short loc_54B00

loc_54AF4:
		push	1D00h
		push	si
		call	sub_59C05
		add	sp, 4

loc_54B00:
		pop	di
		pop	si
		pop	bp
		retf
sub_54A85		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54B04		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		inc	word ptr [si+5Fh]
		mov	ax, [si+5Fh]
		cmp	ax, [si+5Dh]
		jnz	short loc_54B22
		push	1D02h
		push	si
		call	sub_59C05
		add	sp, 4

loc_54B22:
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_54B04		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54B31		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+5Fh]
		dec	word ptr [si+5Fh]
		or	ax, ax
		jnz	short loc_54B4E
		push	1D02h
		push	si
		call	sub_59C05
		add	sp, 4

loc_54B4E:
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_54B31		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54B5D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Dh], 0
		jz	short loc_54B9C
		mov	ax, [si+5Dh]
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+75h], ax
		cmp	word ptr [si+75h], 0
		jz	short loc_54B9C
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

loc_54B9C:
		pop	si
		pop	bp
		retf
sub_54B5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ReadEntry_65DA9 (sub_65DA9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; lit une entrée via StreamReader_ReadTyped_63FA1, gestion d'erreur
; (Runtime_FatalErrorHandlerWithTag). Appelée deux fois par sub_65E2C.
; ==============================================================================================
IndexedRecordReader_ReadEntry_54B9F		proc far

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
		jbe	short loc_54C0A
		cmp	word ptr [si+75h], 0
		jz	short loc_54BD2
		mov	ax, dx
		shl	ax, 2
		mov	bx, [si+75h]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_4], eax
		jmp	short loc_54BEF

loc_54BD2:
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

loc_54BEF:
		mov	eax, [bp+var_4]
		sar	eax, 18h
		mov	word_60568, ax
		mov	eax, [bp+var_4]
		and	eax, 0FFFFFFh
		mov	[bp+var_4], eax
		jmp	short loc_54C16

loc_54C0A:
		push	1D02h
		push	si
		call	sub_59C05
		add	sp, 4

loc_54C16:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
IndexedRecordReader_ReadEntry_54B9F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_AdvanceIndex_65E2C (sub_65E2C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 115 lignes, NON DÉTAILLÉE — combine IndexedRecordReader_ReadEntry_65DA9 (×2),
; StreamReader_GetCapacity_64062, StreamReader_SeekVariant_63DF6, StreamReader_ReadTyped_63FA1
; — avance vers l'entrée d'index suivante et positionne le flux.
; ==============================================================================================
IndexedRecordReader_AdvanceIndex_54C22		proc far

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
		call	near ptr IndexedRecordReader_ReadEntry_54B9F
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	ax, word_60568
		mov	[si+6Dh], ax
		mov	[si+5Fh], di
		inc	di
		cmp	[si+5Dh], di
		jnz	short loc_54C5D
		push	si
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		jmp	short loc_54C6A

loc_54C5D:
		push	di
		push	si
		push	cs
		call	near ptr IndexedRecordReader_ReadEntry_54B9F
		push	dx
		push	ax
		pop	eax
		add	sp, 4

loc_54C6A:
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
		test	word ptr [si+6Dh], 0C0h
		jnz	short loc_54CAD
		push	large [si+65h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 71h
		push	ax
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		jmp	short loc_54CB5

loc_54CAD:
		mov	eax, [si+61h]
		mov	[si+71h], eax

loc_54CB5:
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
IndexedRecordReader_AdvanceIndex_54C22		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54CBB		proc far

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
		push	49B0h
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
sub_54CBB		endp

; START OF FUNCTION CHUNK FOR sub_54CBB
		db 9Ah
		and	ax, 0B500h
; END OF FUNCTION CHUNK FOR sub_54CBB
seg163		ends
