seg174		segment	para public 'CODE' use16
		assume cs:seg174
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0ECh, 0C6h, 6, 72h, 6Dh, 0, 5Dh, 0CBh

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
TextScrollDisplay_Construct_44889		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_448A2
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_448A7

loc_448A2:
		nop
		push	cs
		call	near ptr TextScrollDisplay_ComputeLayout_448D1

loc_448A7:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplay_Construct_44889		endp

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
TextScrollDisplay_Destruct_448AC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_448CD
		nop
		push	cs
		call	near ptr TextScrollDisplay_Cleanup_449A6
		test	di, 1
		jz	short loc_448CD
		push	si
		call	sub_39C
		pop	cx

loc_448CD:
		pop	di
		pop	si
		pop	bp
		retf
TextScrollDisplay_Destruct_448AC		endp

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
TextScrollDisplay_ComputeLayout_448D1		proc far

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
		call	sub_1E67
		add	sp, 8
		cmp	[bp+var_28], 0FFFFh
		jnz	short loc_448FF
		mov	byte_4F776, 1
		jmp	short loc_44904

loc_448FF:
		mov	byte_4F776, 0

loc_44904:
		mov	ax, [bp+var_26]
		mov	word_4F777, ax
		push	large 0
		nop
		push	cs
		call	near ptr TextScrollDisplay_RegisterEntries_449DB
		add	sp, 4
		push	large 100000h
		push	6D7Ah
		call	CRT_Memset_Public
		add	sp, 6
		push	large 80000h
		push	6D8Ah
		call	CRT_Memset_Public
		add	sp, 6
		nop
		push	cs
		call	near ptr TextScrollDisplay_InitState_44961
		leave
		retf
TextScrollDisplay_ComputeLayout_448D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4493E		proc far

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
		call	sub_1E67
		add	sp, 8
		leave
		retf
sub_4493E		endp

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
TextScrollDisplay_InitState_44961		proc far

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
		mov	[bp+var_12], 40Fh
		mov	[bp+var_8], seg seg179
		mov	[bp+var_18], 14h
		mov	[bp+var_14], 3Fh
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E67
		add	sp, 8
		mov	ax, [bp+var_24]
		mov	word_4DDF2, ax
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_22]
		mov	word_4DDF6, ax
		mov	word_4DDF4, dx
		leave
		retf
TextScrollDisplay_InitState_44961		endp

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
TextScrollDisplay_Cleanup_449A6		proc far

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	ax, word_4DDF4
		mov	[bp+var_12], ax
		mov	ax, word_4DDF6
		mov	[bp+var_8], ax
		mov	[bp+var_18], 14h
		mov	ax, word_4DDF2
		mov	[bp+var_14], ax
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h
		call	sub_1E67
		add	sp, 8
		leave
		retf
TextScrollDisplay_Cleanup_449A6		endp

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
TextScrollDisplay_RegisterEntries_449DB		proc far

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
		call	sub_1E67
		add	sp, 8
		mov	word_4F772, si
		mov	word_4F774, di
		pop	di
		pop	si
		leave
		retf
TextScrollDisplay_RegisterEntries_449DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44A16		proc far

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
		call	sub_1E67
		add	sp, 8
		leave
		retf
sub_44A16		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44A45		proc far

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
		call	sub_1E67
		add	sp, 8
		leave
		retf
sub_44A45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44A74		proc far

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
		call	sub_1E67
		add	sp, 8
		leave
		retf
sub_44A74		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44AA3		proc far
		push	bp
		mov	bp, sp
		cmp	word_4E048, 0
		jz	short loc_44AB6
		push	5418h
		call	Runtime_FatalErrorHandler_36797
		pop	cx

loc_44AB6:
		mov	ax, word_4F772
		pop	bp
		retf
sub_44AA3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44ABB		proc far
		push	bp
		mov	bp, sp
		cmp	word_4E048, 0
		jz	short loc_44ACE
		push	5418h
		call	Runtime_FatalErrorHandler_36797
		pop	cx

loc_44ACE:
		mov	ax, word_4F774
		pop	bp
		retf
sub_44ABB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44AD3		proc far

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
sub_44AD3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44AFC		proc far
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
sub_44AFC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44B17		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_44B30
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_44B34

loc_44B30:
		mov	word ptr [si], 0FFFFh

loc_44B34:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_44B17		endp

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
HandlerRegistry4Slot_Register_44B39		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_4DDF0, 4
		jl	short loc_44B4F
		push	0
		call	PagedResourceC_RefreshAndFinalize_35E0F
		pop	cx

loc_44B4F:
		mov	ax, word_4DDF0
		mov	[si], ax
		mov	bx, word_4DDF0
		shl	bx, 2
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		mov	[bx+6D7Ch], ax
		mov	[bx+6D7Ah], dx
		mov	bx, word_4DDF0
		shl	bx, 1
		mov	ax, [bp+arg_6]
		mov	[bx+6D8Ah], ax
		inc	word_4DDF0
		pop	si
		pop	bp
		retf
HandlerRegistry4Slot_Register_44B39		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44B7D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0FFFFh
		jz	short loc_44B8E
		mov	ax, 1
		jmp	short loc_44B90

loc_44B8E:
		xor	ax, ax

loc_44B90:
		mov	ah, 0
		or	ax, ax
		jz	short loc_44BD3
		mov	cx, [si]
		jmp	short loc_44BC5

loc_44B9A:
		mov	bx, cx
		shl	bx, 2
		mov	ax, [bx+6D80h]
		mov	dx, [bx+6D7Eh]
		mov	bx, cx
		shl	bx, 2
		mov	[bx+6D7Ch], ax
		mov	[bx+6D7Ah], dx
		mov	bx, cx
		shl	bx, 1
		mov	ax, [bx+6D8Ch]
		mov	bx, cx
		shl	bx, 1
		mov	[bx+6D8Ah], ax
		inc	cx

loc_44BC5:
		cmp	cx, word_4DDF0
		jl	short loc_44B9A
		dec	word_4DDF0
sub_44B7D		endp

; START OF FUNCTION CHUNK FOR sub_44B7D
		db 0C7h
; END OF FUNCTION CHUNK FOR sub_44B7D
seg174		ends
