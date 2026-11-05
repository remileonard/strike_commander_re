seg171		segment	para public 'CODE' use16
		assume cs:seg171
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplay_Construct_6F3A6 (sub_6F3A6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScrollDisplay_Construct_3EA8B (sub_3EA8B de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScrollDisplay_Construct_67267 (sub_67267 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), initialise via TextScrollDisplay_ComputeLayout_672AF.
; ==============================================================================================
TextScrollDisplay_Construct_55DE2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_55DFB
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_55E00

loc_55DFB:
		nop
		push	cs
		call	near ptr TextScrollDisplay_ComputeLayout_55E2A

loc_55E00:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplay_Construct_55DE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplay_Destruct_6F3C9 (sub_6F3C9 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScrollDisplay_Destruct_3EAAE (sub_3EAAE de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScrollDisplay_Destruct_6728A (sub_6728A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle TextScrollDisplay_Cleanup_67384 puis libère l'objet (sub_338).
; ==============================================================================================
TextScrollDisplay_Destruct_55E05		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_55E26
		nop
		push	cs
		call	near ptr TextScrollDisplay_Cleanup_55EFF
		test	di, 1
		jz	short loc_55E26
		push	si
		call	sub_33B
		pop	cx

loc_55E26:
		pop	di
		pop	si
		pop	bp
		retf
TextScrollDisplay_Destruct_55E05		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplay_ComputeLayout_6F3EE (sub_6F3EE de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplay_ComputeLayout_3EAD3 (sub_3EAD3 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScrollDisplay_ComputeLayout_672AF (sub_672AF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 65 lignes, NON DÉTAILLÉE — calcule le layout d'affichage du défilement de texte.
; ==============================================================================================
TextScrollDisplay_ComputeLayout_55E2A		proc far

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
		call	sub_1B5E
		add	sp, 8
		cmp	[bp+var_28], 0FFFFh
		jnz	short loc_55E58
		mov	byte_60656, 1
		jmp	short loc_55E5D

loc_55E58:
		mov	byte_60656, 0

loc_55E5D:
		mov	ax, [bp+var_26]
		mov	word_60657, ax
		push	large 0
		nop
		push	cs
		call	near ptr TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		push	large 100000h
		push	691Ah
		call	CRT_Memset_Public
		add	sp, 6
		push	large 80000h
		push	692Ah
		call	CRT_Memset_Public
		add	sp, 6
		nop
		push	cs
		call	near ptr TextScrollDisplay_InitState_55EBA
		leave
		retf
TextScrollDisplay_ComputeLayout_55E2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55E97		proc far

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
		call	sub_1B5E
		add	sp, 8
		leave
		retf
sub_55E97		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplay_InitState_6F47E (sub_6F47E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplay_InitState_3EB63 (sub_3EB63 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScrollDisplay_InitState_6733F (sub_6733F de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; sub_1839 (externe), TextScrollDisplay_RegisterEntries_673B9 et sub_22E1 (×2).
; ==============================================================================================
TextScrollDisplay_InitState_55EBA		proc far

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
		mov	[bp+var_12], 211h
		mov	[bp+var_8], seg seg176
		mov	[bp+var_18], 14h
		mov	[bp+var_14], 3Fh
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1B5E
		add	sp, 8
		mov	ax, [bp+var_24]
		mov	word_5E7B0, ax
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_22]
		mov	word_5E7B4, ax
		mov	word_5E7B2, dx
		leave
		retf
TextScrollDisplay_InitState_55EBA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplay_Cleanup_6F4C3 (sub_6F4C3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScrollDisplay_Cleanup_3EBA8 (sub_3EBA8 de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScrollDisplay_Cleanup_67384 (sub_67384 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle sub_1839. Appelée par TextScrollDisplay_Destruct_6728A.
; ==============================================================================================
TextScrollDisplay_Cleanup_55EFF		proc far

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	ax, word_5E7B2
		mov	[bp+var_12], ax
		mov	ax, word_5E7B4
		mov	[bp+var_8], ax
		mov	[bp+var_18], 14h
		mov	ax, word_5E7B0
		mov	[bp+var_14], ax
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1B5E
		add	sp, 8
		leave
		retf
TextScrollDisplay_Cleanup_55EFF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplay_RegisterEntries_6F4F8 (sub_6F4F8 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à TextScrollDisplay_RegisterEntries_3EBDD (sub_3EBDD
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplay_RegisterEntries_673B9 (sub_673B9 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle sub_1839. Appelée par
; TextScrollDisplay_InitState_6733F.
; ==============================================================================================
TextScrollDisplay_RegisterEntries_55F34		proc far

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
		call	sub_1B5E
		add	sp, 8
		mov	word_60652, si
		mov	word_60654, di
		pop	di
		pop	si
		leave
		retf
TextScrollDisplay_RegisterEntries_55F34		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55F6F		proc far

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
		call	sub_1B5E
		add	sp, 8
		leave
		retf
sub_55F6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55F9E		proc far

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
		call	sub_1B5E
		add	sp, 8
		leave
		retf
sub_55F9E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55FCD		proc far

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
		call	sub_1B5E
		add	sp, 8
		leave
		retf
sub_55FCD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55FFC		proc far
		push	bp
		mov	bp, sp
		cmp	word_5EA0A, 0
		jz	short loc_5600F
		push	4A96h
		call	sub_9D78
		pop	cx

loc_5600F:
		mov	ax, word_60652
		pop	bp
		retf
sub_55FFC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56014		proc far
		push	bp
		mov	bp, sp
		cmp	word_5EA0A, 0
		jz	short loc_56027
		push	4A96h
		call	sub_9D78
		pop	cx

loc_56027:
		mov	ax, word_60654
		pop	bp
		retf
sub_56014		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5602C		proc far

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
sub_5602C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56055		proc far
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
sub_56055		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56070		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_56089
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5608D

loc_56089:
		mov	word ptr [si], 0FFFFh

loc_5608D:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_56070		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HandlerRegistry4Slot_Register_6F656 (sub_6F656 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
HandlerRegistry4Slot_Register_56092		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_5E7AE, 4
		jl	short loc_560A8
		push	0
		call	PagedResourceC_RefreshAndFinalize_47E2A
		pop	cx

loc_560A8:
		mov	ax, word_5E7AE
		mov	[si], ax
		mov	bx, word_5E7AE
		shl	bx, 2
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		mov	[bx+691Ch], ax
		mov	[bx+691Ah], dx
		mov	bx, word_5E7AE
		shl	bx, 1
		mov	ax, [bp+arg_6]
		mov	[bx+692Ah], ax
		inc	word_5E7AE
		pop	si
		pop	bp
		retf
HandlerRegistry4Slot_Register_56092		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_560D6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0FFFFh
		jz	short loc_560E7
		mov	ax, 1
		jmp	short loc_560E9

loc_560E7:
		xor	ax, ax

loc_560E9:
		mov	ah, 0
		or	ax, ax
		jz	short loc_5612C
		mov	cx, [si]
		jmp	short loc_5611E
sub_560D6		endp

; START OF FUNCTION CHUNK FOR sub_560D6
		db 8Bh, 0D9h, 0C1h, 0E3h, 2, 8Bh, 87h, 20h, 69h, 8Bh, 97h, 1Eh, 69h, 8Bh, 0D9h, 0C1h
		db 0E3h, 2, 89h, 87h, 1Ch, 69h, 89h, 97h, 1Ah, 69h, 8Bh, 0D9h, 0D1h, 0E3h, 8Bh, 87h
		db 2Ch, 69h, 8Bh, 0D9h, 0D1h, 0E3h, 89h, 87h, 2Ah, 69h, 41h

loc_5611E:
		db 3Bh
		push	cs
; END OF FUNCTION CHUNK FOR sub_560D6
seg171		ends
