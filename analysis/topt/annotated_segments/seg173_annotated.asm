seg173		segment	para public 'CODE' use16
		assume cs:seg173
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScroll_Construct_3E7E8 (sub_3E7E8 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextScroll_Construct_66FC4 (sub_66FC4 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658), initialise via
; sub_674F5 puis TextScroll_ComputeParams_67048 — constructeur d'un objet de défilement de
; texte.
; ==============================================================================================
TextScroll_Construct_445E1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_445FA
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_44610

loc_445FA:
		push	si
		call	sub_44B17
		pop	cx
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr TextScroll_ComputeParams_44665
		add	sp, 6

loc_44610:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScroll_Construct_445E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44615		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_44632
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4465F

loc_44632:
		push	si
		call	sub_44B17
		pop	cx
		mov	ax, [bp+arg_4]
		mov	word_4F750, ax
		mov	word_4DDE8, di
		imul	[bp+arg_6]
		mov	dx, word_4DDE8
		add	dx, ax
		mov	word_4DDEA, dx
		mov	ax, di
		mov	word_4DDEE, ax
		mov	word_4DDEC, ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_RegisterHandler_447EC
		pop	cx

loc_4465F:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_44615		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScroll_ComputeParams_3E86C (sub_3E86C de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextScroll_ComputeParams_67048 (sub_67048 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, calcule les paramètres de
; défilement (word_72E46=7 pas fixe, multiplié par un facteur arg) et enregistre un
; gestionnaire (TextScroll_RegisterHandler_671CA).
; ==============================================================================================
TextScroll_ComputeParams_44665		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	word_4F750, 7
		mov	word_4DDE8, cx
		mov	ax, word_4F750
		imul	[bp+arg_4]
		mov	dx, word_4DDE8
		add	dx, ax
		mov	word_4DDEA, dx
		mov	ax, cx
		mov	word_4DDEE, ax
		mov	word_4DDEC, ax
		push	bx
		nop
		push	cs
		call	near ptr TextScroll_RegisterHandler_447EC
		pop	cx
		pop	bp
		retf
TextScroll_ComputeParams_44665		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à TextScroll_Helper_3E8A0
; (sub_3E8A0 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_Helper_6707C (sub_6707C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, référencée par sub_67118 (combine sub_229C).
; ==============================================================================================
TextScroll_Helper_44699		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_4F750
		add	word_4DDEE, ax
		mov	ax, word_4DDEE
		cmp	ax, word_4DDEA
		jb	short loc_446B2
		mov	ax, word_4DDE8
		mov	word_4DDEE, ax

loc_446B2:
		mov	ax, word_4DDEE
		cmp	ax, word_4DDEC
		jnz	short loc_446C0
		nop
		push	cs
		call	near ptr TextScroll_HelperB_446C2

loc_446C0:
		pop	bp
		retf
TextScroll_Helper_44699		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScroll_HelperB_3E8C9 (sub_3E8C9 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à TextScroll_HelperB_670A5 (sub_670A5 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par sub_67134
; (combine sub_229C).
; ==============================================================================================
TextScroll_HelperB_446C2		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_4F750
		add	word_4DDEC, ax
		mov	ax, word_4DDEC
		cmp	ax, word_4DDEA
		jb	short loc_446DB
		mov	ax, word_4DDE8
		mov	word_4DDEC, ax

loc_446DB:
		pop	bp
		retf
TextScroll_HelperB_446C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_446DD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		add	dx, word_4F750
		cmp	dx, word_4DDEA
		jb	short loc_446F2
		mov	ax, word_4DDE8
		jmp	short loc_446F4

loc_446F2:
		mov	ax, dx

loc_446F4:
		pop	bp
		retf
sub_446DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_446F6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, word_4DDEC
		cmp	ax, word_4DDEE
		jnz	short loc_44709
		mov	al, 0
		jmp	short loc_44733

loc_44709:
		mov	ax, word_4DDEC
		cmp	ax, word_4DDEE
		jnb	short loc_44725
		cmp	dx, word_4DDEC
		jb	short loc_44731
		cmp	dx, word_4DDEE
		jnb	short loc_44731

loc_4471E:
		mov	ax, 1
		jmp	short loc_44733
		jmp	short loc_44731

loc_44725:
		cmp	dx, word_4DDEC
		jnb	short loc_4471E
		cmp	dx, word_4DDEE
		jb	short loc_4471E

loc_44731:
		xor	ax, ax

loc_44733:
		pop	bp
		retf
sub_446F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44735		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	word_4F750
		push	large [bp+arg_0]
		push	ds
		push	word_4DDEE
		call	sub_3545
		add	sp, 0Ah
		push	cs
		call	near ptr TextScroll_Helper_44699
		pop	bp
		retf
sub_44735		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScroll_ApplyHelperB_3E958 (sub_3E958 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextScroll_ApplyHelperB_67134 (sub_67134 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_229C et
; TextScroll_HelperB_670A5.
; ==============================================================================================
TextScroll_ApplyHelperB_44753		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, word_4DDEC
		cmp	ax, word_4DDEE
		jz	short loc_44777
		push	word_4F750
		push	ax
		push	[bp+arg_0]
		call	CRT_Memmove
		add	sp, 6
		push	cs
		call	near ptr TextScroll_HelperB_446C2
		mov	al, 1
		jmp	short loc_44779

loc_44777:
		mov	al, 0

loc_44779:
		pop	bp
		retf
TextScroll_ApplyHelperB_44753		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4477B		proc far

var_C		= byte ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	dx, [bp+arg_0]
		mov	byte ptr [bp+var_8], 0
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_A], ax
		mov	al, byte ptr [bp+var_A]
		mov	[bp+var_C], al
		mov	al, [bp+var_C]
		mov	[bp+var_2], al
		test	dx, 6
		jz	short loc_447B2
		mov	byte ptr [bp+var_8+1], 1
		jmp	short loc_447C2

loc_447B2:
		test	dx, 18h
		jz	short loc_447BE
		mov	byte ptr [bp+var_8+1], 2
		jmp	short loc_447C2

loc_447BE:
		mov	byte ptr [bp+var_8+1], 0

loc_447C2:
		test	dx, 2Ah
		jz	short loc_447CE
		mov	byte ptr [bp+var_8], 1
		jmp	short loc_447DE

loc_447CE:
		test	dx, 54h
		jz	short loc_447DA
		mov	byte ptr [bp+var_8], 2
		jmp	short loc_447DE

loc_447DA:
		mov	byte ptr [bp+var_8], 0

loc_447DE:
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_44735
		add	sp, 4
		leave
		retf
sub_4477B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScroll_RegisterHandler_3E9EE (sub_3E9EE de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextScroll_RegisterHandler_671CA (sub_671CA de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enregistre
; TextScroll_TickHandler_6715C (tag 0xFE) via sub_67517 — probable enregistrement dans le
; registre de modules à créneaux temporisés (seg161) ou un système apparenté.
; ==============================================================================================
TextScroll_RegisterHandler_447EC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0FEh
		push	seg seg173
		push	offset sub_4477B
		push	ax
		call	HandlerRegistry4Slot_Register_44B39
		add	sp, 8
		pop	bp
		retf
TextScroll_RegisterHandler_447EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScroll_ApplyHelperC_3EA08 (sub_3EA08 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScroll_ApplyHelperC_671E4 (sub_671E4 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par
; sub_67204.
; ==============================================================================================
TextScroll_ApplyHelperC_44806		proc far
		push	bp
		mov	bp, sp
		mov	byte_4F752, 0
		push	6D72h
		push	cs
		call	near ptr TextScroll_ApplyHelperB_44753
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44821
		nop
		push	cs
		call	near ptr TextScroll_ApplyHelperD_44844

loc_44821:
		mov	ax, 6D72h
		pop	bp
		retf
TextScroll_ApplyHelperC_44806		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScroll_FormatAndApply_3EA28 (sub_3EA28 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextScroll_FormatAndApply_67204 (sub_67204 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; TextScroll_ApplyHelperC_671E4 et sub_3FD (formatage).
; ==============================================================================================
TextScroll_FormatAndApply_44826		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	cs
		call	near ptr TextScroll_ApplyHelperC_44806
		push	ds
		push	si
		push	ds
		push	offset byte_4F752
		mov	cx, 7
		call	CRT_Fmemcpy
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScroll_FormatAndApply_44826		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScroll_ApplyHelperD_3EA46 (sub_3EA46 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextScroll_ApplyHelperD_67222 (sub_67222 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_67481 et sub_67499
; (×2 chacune).
; ==============================================================================================
TextScroll_ApplyHelperD_44844		proc far
		push	bp
		mov	bp, sp
		call	sub_44AA3
		cmp	ax, word_4F754
		jnz	short loc_4485D
		call	sub_44ABB
		cmp	ax, word_4F756
		jz	short loc_44876

loc_4485D:
		mov	byte_4F752, 3
		call	sub_44AA3
		mov	word_4F754, ax
		call	sub_44ABB
		mov	word_4F756, ax
		mov	al, 1
		jmp	short loc_4487D

loc_44876:
		mov	byte_4F752, 0
		mov	al, 0

loc_4487D:
		pop	bp
		retf
TextScroll_ApplyHelperD_44844		endp

; ----------------------------------------------------------------------

sub_4487F		proc far
		push	bp
sub_4487F		endp
seg173		ends
