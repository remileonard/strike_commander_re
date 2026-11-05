seg214		segment	para public 'CODE' use16
		assume cs:seg214
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6, 64h, 6Ch, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplay_Construct_3EA8B (sub_3EA8B de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextScrollDisplay_Construct_67267 (sub_67267 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658), initialise
; via TextScrollDisplay_ComputeLayout_672AF.
; ==============================================================================================
TextScrollDisplay_Construct_6F3A6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6F3BF
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6F3C4

loc_6F3BF:
		nop
		push	cs
		call	near ptr TextScrollDisplay_ComputeLayout_6F3EE

loc_6F3C4:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplay_Construct_6F3A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplay_Destruct_3EAAE (sub_3EAAE de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextScrollDisplay_Destruct_6728A (sub_6728A de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; TextScrollDisplay_Cleanup_67384 puis libère l'objet (sub_338).
; ==============================================================================================
TextScrollDisplay_Destruct_6F3C9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6F3EA
		nop
		push	cs
		call	near ptr TextScrollDisplay_Cleanup_6F4C3
		test	di, 1
		jz	short loc_6F3EA
		push	si
		call	sub_3B2
		pop	cx

loc_6F3EA:
		pop	di
		pop	si
		pop	bp
		retf
TextScrollDisplay_Destruct_6F3C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplay_ComputeLayout_3EAD3 (sub_3EAD3 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScrollDisplay_ComputeLayout_672AF (sub_672AF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 65 lignes, NON DÉTAILLÉE — calcule le layout d'affichage du défilement de texte.
; ==============================================================================================
TextScrollDisplay_ComputeLayout_6F3EE		proc far

var_28		= word ptr -28h
var_26		= word ptr -26h
var_18		= word ptr -18h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_18], 0
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E90
		add	sp, 8
		cmp	[bp+var_28], 0FFFFh
		jnz	short loc_6F41C
		mov	byte_7D3B8, 1
		jmp	short loc_6F421

loc_6F41C:
		mov	byte_7D3B8, 0

loc_6F421:
		mov	ax, [bp+var_26]
		mov	word_7D3B9, ax
		push	large 0
		nop
		push	cs
		call	near ptr TextScrollDisplay_RegisterEntries_6F4F8
		add	sp, 4
		push	large 100000h
		push	6C6Ch
		call	CRT_Memset_Public
		add	sp, 6
		push	large 80000h
		push	6C7Ch
		call	CRT_Memset_Public
		add	sp, 6
		nop
		push	cs
		call	near ptr TextScrollDisplay_InitState_6F47E
		leave
		retf
TextScrollDisplay_ComputeLayout_6F3EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F45B		proc far

var_28		= word ptr -28h
var_18		= word ptr -18h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_18], 0
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E90
		add	sp, 8
		leave
		retf
sub_6F45B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplay_InitState_3EB63 (sub_3EB63 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScrollDisplay_InitState_6733F (sub_6733F de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; sub_1839 (externe), TextScrollDisplay_RegisterEntries_673B9 et sub_22E1 (×2).
; ==============================================================================================
TextScrollDisplay_InitState_6F47E		proc far

var_28		= word ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_12], 219h
		mov	[bp+var_8], seg seg218
		mov	[bp+var_18], 14h
		mov	[bp+var_14], 3Fh
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E90
		add	sp, 8
		mov	ax, [bp+var_24]
		mov	word_7B27A, ax
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_22]
		mov	word_7B27E, ax
		mov	word_7B27C, dx
		leave
		retf
TextScrollDisplay_InitState_6F47E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplay_Cleanup_3EBA8 (sub_3EBA8 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextScrollDisplay_Cleanup_67384 (sub_67384 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle sub_1839. Appelée par
; TextScrollDisplay_Destruct_6728A.
; ==============================================================================================
TextScrollDisplay_Cleanup_6F4C3		proc far

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	ax, word_7B27C
		mov	[bp+var_12], ax
		mov	ax, word_7B27E
		mov	[bp+var_8], ax
		mov	[bp+var_18], 14h
		mov	ax, word_7B27A
		mov	[bp+var_14], ax
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E90
		add	sp, 8
		leave
		retf
TextScrollDisplay_Cleanup_6F4C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplay_RegisterEntries_3EBDD (sub_3EBDD de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScrollDisplay_RegisterEntries_673B9 (sub_673B9
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle sub_1839. Appelée par TextScrollDisplay_InitState_6733F.
; ==============================================================================================
TextScrollDisplay_RegisterEntries_6F4F8		proc far

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_18], 4
		mov	[bp+var_14], si
		mov	[bp+var_12], di
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E90
		add	sp, 8
		mov	word_7D3B4, si
		mov	word_7D3B6, di
		pop	di
		pop	si
		leave
		retf
TextScrollDisplay_RegisterEntries_6F4F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F533		proc far

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_18], 7
		mov	ax, [bp+arg_0]
		mov	[bp+var_14], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_12], ax
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E90
		add	sp, 8
		leave
		retf
sub_6F533		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F562		proc far

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_18], 8
		mov	ax, [bp+arg_0]
		mov	[bp+var_14], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_12], ax
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E90
		add	sp, 8
		leave
		retf
sub_6F562		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F591		proc far

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_18], 0Fh
		mov	ax, [bp+arg_0]
		mov	[bp+var_14], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_12], ax
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E90
		add	sp, 8
		leave
		retf
sub_6F591		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F5C0		proc far
		push	bp
		mov	bp, sp
		cmp	word_7B4CE, 0
		jz	short loc_6F5D3
		push	4B50h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_6F5D3:
		mov	ax, word_7D3B4
		pop	bp
		retf
sub_6F5C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F5D8		proc far
		push	bp
		mov	bp, sp
		cmp	word_7B4CE, 0
		jz	short loc_6F5EB
		push	4B50h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_6F5EB:
		mov	ax, word_7D3B6
		pop	bp
		retf
sub_6F5D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F5F0		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, 3
		int	33h
		mov	[bp+var_2], cx
		mov	[bp+var_4], dx
		mov	ax, 7
		mov	cx, [bp+var_2]
		mov	dx, [bp+var_2]
		int	33h
		mov	ax, 8
		mov	cx, [bp+var_4]
		mov	dx, [bp+var_4]
		int	33h
		leave
		retf
sub_6F5F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F619		proc far
		push	bp
		mov	bp, sp
		mov	ax, 7
		mov	cx, 0
		mov	dx, 27Fh
		int	33h
		mov	ax, 8
		mov	cx, 0
		mov	dx, 0C7h
		int	33h
		pop	bp
		retf
sub_6F619		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F634		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6F64D
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6F651

loc_6F64D:
		mov	word ptr [si], 0FFFFh

loc_6F651:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6F634		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HandlerRegistry4Slot_Register_3ED3B (sub_3ED3B de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à HandlerRegistry4Slot_Register_67517 (sub_67517 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enregistre un
; gestionnaire dans une table à capacité de 4 emplacements (word_711A8, tables à
; 0x5DA0/0x5DB0), avec repli sur PagedResourceB_RegistryLookupForUIScreen (sub_5F508, seg158)
; si pleine. Référencée par TextScroll_RegisterHandler_671CA (seg204) et sub_67E34.
; ==============================================================================================
HandlerRegistry4Slot_Register_6F656		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_7B278, 4
		jl	short loc_6F66C
		push	0
		call	PagedResourceC_RefreshAndFinalize_68315
		pop	cx

loc_6F66C:
		mov	ax, word_7B278
		mov	[si], ax
		mov	bx, word_7B278
		shl	bx, 2
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		mov	[bx+6C6Eh], ax
		mov	[bx+6C6Ch], dx
		mov	bx, word_7B278
		shl	bx, 1
		mov	ax, [bp+arg_6]
		mov	[bx+6C7Ch], ax
		inc	word_7B278
		pop	si
		pop	bp
		retf
HandlerRegistry4Slot_Register_6F656		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F69A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0FFFFh
		jz	short loc_6F6AB
		mov	ax, 1
		jmp	short loc_6F6AD

loc_6F6AB:
		xor	ax, ax

loc_6F6AD:
		mov	ah, 0
		or	ax, ax
		jz	short loc_6F6F0
		mov	cx, [si]
		jmp	short loc_6F6E2

loc_6F6B7:
		mov	bx, cx
		shl	bx, 2
		mov	ax, [bx+6C72h]
		mov	dx, [bx+6C70h]
		mov	bx, cx
		shl	bx, 2
		mov	[bx+6C6Eh], ax
		mov	[bx+6C6Ch], dx
		mov	bx, cx
		shl	bx, 1
		mov	ax, [bx+6C7Eh]
		mov	bx, cx
		shl	bx, 1
		mov	[bx+6C7Ch], ax
		inc	cx

loc_6F6E2:
		cmp	cx, word_7B278
		jl	short loc_6F6B7
		dec	word_7B278
		mov	word ptr [si], 0FFFFh
sub_6F69A		endp
seg214		ends
