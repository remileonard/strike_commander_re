seg011		segment	para public 'CODE' use16
		assume cs:seg011
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 30h, 3, 8Eh, 0C0h, 26h, 0C7h, 6, 60h, 0, 34h, 3, 5Dh, 0CBh

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
IndexedRecordReader_Destruct_73BD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7403
		mov	word ptr [si], 392h
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		or	al, al
		jz	short loc_73E2
		push	si
		call	sub_6C2A4
		pop	cx

loc_73E2:
		push	word ptr [si+75h]
		call	sub_3B2
		pop	cx
		push	0
		push	si
		call	StreamReader_Close_6C110
		add	sp, 4
		test	di, 1
		jz	short loc_7403
		push	si
		call	sub_3B2
		pop	cx

loc_7403:
		pop	di
		pop	si
		pop	bp
		retf
IndexedRecordReader_Destruct_73BD		endp

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
IndexedRecordReader_ConstructVariantA_7407		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_7420
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_7432

loc_7420:
		push	si
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	word ptr [si], 392h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_74F0
		pop	cx

loc_7432:
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantA_7407		endp

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
IndexedRecordReader_ConstructVariantB_7437		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_7450
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_7472

loc_7450:
		push	si
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	word ptr [si], 392h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_74F0
		pop	cx
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_7472:
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantB_7437		endp

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
IndexedRecordReader_ConstructVariantC_7477		proc far

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
		jnz	short loc_7493
		push	77h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_74EB

loc_7493:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		mov	word ptr [si], 372h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg173
		mov	word ptr [si+2], 2
		mov	word ptr [si], 37Ah
		push	0
		push	eax
		push	large [bp+var_6]
		push	[bp+var_2]
		push	si
		call	sub_6C024
		add	sp, 0Eh
		mov	word ptr [si], 392h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_74F0
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_74EB:
		mov	ax, si
		pop	si
		leave
		retf
IndexedRecordReader_ConstructVariantC_7477		endp

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
IndexedRecordReader_InitFields_74F0		proc far

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
IndexedRecordReader_InitFields_74F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7513		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_PrepareForRead_6C498
		pop	cx
		push	large 4
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
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
sub_7513		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7553		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	dword_7C7B6, 0
		jnz	short loc_7569
		mov	eax, dword_7748F
		mov	dword_7C7B6, eax

loc_7569:
		mov	word_7B0F7, 0
		mov	eax, dword_76A78
		mov	[bp+var_4], eax
		mov	cx, word ptr [bp+var_4+2]
		mov	bx, word ptr [bp+var_4]
		mov	dx, bx
		and	dx, 0Fh
		or	dx, dx
		jz	short loc_758B
		sub	bx, dx
		inc	cx
		jmp	short loc_758B

loc_758B:
		mov	word_7B0F1, cx
		mov	word_7B0EF, bx
		mov	word_7B0F3, 400h
		mov	dx, word_7C7B8
		cmp	word ptr dword_7C7B6, 0
		jz	short loc_75A5
		inc	dx

loc_75A5:
		mov	word_7B0E4, dx
		mov	eax, [bp+arg_6]
		mov	dword_7B0EB, eax
		mov	word_7B0DA, 0FFFFh
		push	large [bp+arg_2]
		push	[bp+arg_0]
		call	sub_6B24E
		add	sp, 6
		leave
		retf
sub_7553		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_75C8		proc far

var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jnz	short loc_75E9
		push	1D01h
		push	si
		call	sub_76675
		add	sp, 4

loc_75E9:
		cmp	di, 0FFFFh
		jz	short loc_75FF
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_7844
		add	sp, 4
		or	al, al
		jnz	short loc_75FF
		jmp	loc_770F

loc_75FF:
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		mov	[bp+var_A], ax
		mov	cx, 4
		mov	bx, offset word_7713

loc_760E:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_A]
		jz	short loc_761E
		add	bx, 2
		loop	short loc_760E
		jmp	loc_7703

loc_761E:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_7622:
		push	large [si+65h]
		push	large [si+61h]
		push	large [bp+arg_4]
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		jmp	loc_770F

loc_763A:
		push	large [bp+arg_4]
		mov	eax, [si+65h]
		add	eax, 4
		push	eax
		push	si
		push	cs
		call	near ptr sub_7553
		add	sp, 0Ah
		jmp	loc_770F

loc_7653:
		mov	eax, [si+61h]
		add	eax, 0FFFFFFFCh
		mov	dword_7C7BA, eax
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_7670
		mov	eax, [si+61h]
		jmp	short loc_7674

loc_7670:
		mov	eax, [si+71h]

loc_7674:
		mov	[bp+var_8], eax
		push	large dword_7C7BA
		mov	eax, [si+65h]
		add	eax, 4
		push	eax
		push	si
		push	large [bp+arg_4]
		call	sub_1C401
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jz	short loc_770F
		push	0D110h
		jmp	short loc_7706

loc_76AB:
		mov	eax, [si+61h]
		add	eax, 0FFFFFFFCh
		mov	dword_7C7BA, eax
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_76C8
		mov	eax, [si+61h]
		jmp	short loc_76CC

loc_76C8:
		mov	eax, [si+71h]

loc_76CC:
		mov	[bp+var_8], eax
		push	large dword_7C7BA
		mov	eax, [si+65h]
		add	eax, 4
		push	eax
		push	si
		push	large [bp+arg_4]
		call	sub_1C574
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jge	short loc_770F
		push	0D120h
		jmp	short loc_7706

loc_7703:
		push	1D00h

loc_7706:
		push	si
		call	sub_76675
		add	sp, 4

loc_770F:
		pop	di
		pop	si
		leave
		retf
sub_75C8		endp

; START OF FUNCTION CHUNK FOR sub_75C8
word_7713	dw 0
		dw 40h
		dw 80h
		dw 0C0h
off_771B	dw offset loc_763A
		dw offset loc_7653
		dw offset loc_76AB
		dw offset loc_7622
; END OF FUNCTION CHUNK FOR sub_75C8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7723		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		inc	word ptr [si+5Fh]
		mov	ax, [si+5Fh]
		cmp	ax, [si+5Dh]
		jnz	short loc_7741
		push	1D02h
		push	si
		call	sub_76675
		add	sp, 4

loc_7741:
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr sub_7844
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_7723		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7750		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+5Fh]
		dec	word ptr [si+5Fh]
		or	ax, ax
		jnz	short loc_776D
		push	1D02h
		push	si
		call	sub_76675
		add	sp, 4

loc_776D:
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr sub_7844
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_7750		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_777C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Dh], 0
		jz	short loc_77BB
		mov	ax, [si+5Dh]
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+75h], ax
		cmp	word ptr [si+75h], 0
		jz	short loc_77BB
		push	large 4
		mov	ax, [si+5Dh]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	ds
		push	word ptr [si+75h]
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh

loc_77BB:
		pop	si
		pop	bp
		retf
sub_777C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_77BE		proc far

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
		jbe	short loc_782C
		cmp	word ptr [si+75h], 0
		jz	short loc_77F1
		mov	ax, dx
		shl	ax, 2
		mov	bx, [si+75h]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_4], eax
		jmp	short loc_780E

loc_77F1:
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
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh

loc_780E:
		mov	eax, [bp+var_4]
		sar	eax, 18h
		and	ax, 0FFh
		mov	word_7C7BE, ax
		mov	eax, [bp+var_4]
		and	eax, 0FFFFFFh
		mov	[bp+var_4], eax
		jmp	short loc_7838

loc_782C:
		push	1D02h
		push	si
		call	sub_76675
		add	sp, 4

loc_7838:
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_77BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7844		proc far

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
		call	near ptr sub_77BE
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	ax, word_7C7BE
		mov	[si+6Dh], ax
		mov	[si+5Fh], di
		inc	di
		cmp	[si+5Dh], di
		jnz	short loc_787F
		push	si
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		jmp	short loc_788C

loc_787F:
		push	di
		push	si
		push	cs
		call	near ptr sub_77BE
		push	dx
		push	ax
		pop	eax
		add	sp, 4

loc_788C:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_4]
		mov	[si+61h], eax
		mov	eax, [bp+var_4]
		mov	[si+65h], eax
		push	eax
		push	si
		call	StreamReader_SeekVariant_6C348
		add	sp, 6
		test	word ptr [si+6Dh], 0C0h
		jz	short loc_78CC
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 40h
		jz	short loc_78CC
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 80h
		jnz	short loc_78E5

loc_78CC:
		push	large [si+65h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 71h
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		jmp	short loc_78ED

loc_78E5:
		mov	eax, [si+61h]
		mov	[si+71h], eax

loc_78ED:
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_7844		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_78F3		proc far

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
		push	34Ch
		lea	ax, [bp+var_4]
		push	ax
		call	sub_765B4
		add	sp, 14h
		push	[bp+var_4]
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_765AF
		add	sp, 4
		push	si
		call	StreamReader_Destruct_6BE00
		pop	cx
		lea	ax, [bp+var_4]
		push	ax
		call	sub_765E5
		pop	cx
		pop	si
		leave
		retf
sub_78F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_794D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_7977
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_765E5
		pop	cx
		test	di, 1
		jz	short loc_7977
		push	si
sub_794D		endp

; START OF FUNCTION CHUNK FOR sub_794D
		db 9Ah
; END OF FUNCTION CHUNK FOR sub_794D
seg011		ends
