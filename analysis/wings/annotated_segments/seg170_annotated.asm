seg170		segment	para public 'CODE' use16
		assume cs:seg170
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ah, 4Ch, 0, 0FEh, 54h, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScroll_Construct_6F0FE (sub_6F0FE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScroll_Construct_3E7E8 (sub_3E7E8 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScroll_Construct_66FC4 (sub_66FC4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), initialise via sub_674F5 puis TextScroll_ComputeParams_67048 —
; constructeur d'un objet de défilement de texte.
; ==============================================================================================
TextScroll_Construct_55B3A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_55B53
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_55B69

loc_55B53:
		push	si
		call	sub_56070
		pop	cx
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr TextScroll_ComputeParams_55BBE
		add	sp, 6

loc_55B69:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScroll_Construct_55B3A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55B6E		proc far

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
		jnz	short loc_55B8B
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_55BB8

loc_55B8B:
		push	si
		call	sub_56070
		pop	cx
		mov	ax, [bp+arg_4]
		mov	word_60630, ax
		mov	word_5E7A6, di
		imul	[bp+arg_6]
		mov	dx, word_5E7A6
		add	dx, ax
		mov	word_5E7A8, dx
		mov	ax, di
		mov	word_5E7AC, ax
		mov	word_5E7AA, ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_RegisterHandler_55D45
		pop	cx

loc_55BB8:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_55B6E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScroll_ComputeParams_6F182 (sub_6F182 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScroll_ComputeParams_3E86C (sub_3E86C de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScroll_ComputeParams_67048 (sub_67048 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; calcule les paramètres de défilement (word_72E46=7 pas fixe, multiplié par un facteur arg)
; et enregistre un gestionnaire (TextScroll_RegisterHandler_671CA).
; ==============================================================================================
TextScroll_ComputeParams_55BBE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	word_60630, 7
		mov	word_5E7A6, cx
		mov	ax, word_60630
		imul	[bp+arg_4]
		mov	dx, word_5E7A6
		add	dx, ax
		mov	word_5E7A8, dx
		mov	ax, cx
		mov	word_5E7AC, ax
		mov	word_5E7AA, ax
		push	bx
		nop
		push	cs
		call	near ptr TextScroll_RegisterHandler_55D45
		pop	cx
		pop	bp
		retf
TextScroll_ComputeParams_55BBE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScroll_Helper_6F1B6 (sub_6F1B6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par
; instruction à TextScroll_Helper_3E8A0 (sub_3E8A0 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à TextScroll_Helper_6707C (sub_6707C de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par
; sub_67118 (combine sub_229C).
; ==============================================================================================
TextScroll_Helper_55BF2		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_60630
		add	word_5E7AC, ax
		mov	ax, word_5E7AC
		cmp	ax, word_5E7A8
		jb	short loc_55C0B
		mov	ax, word_5E7A6
		mov	word_5E7AC, ax

loc_55C0B:
		mov	ax, word_5E7AC
		cmp	ax, word_5E7AA
		jnz	short loc_55C19
		nop
		push	cs
		call	near ptr TextScroll_HelperB_55C1B

loc_55C19:
		pop	bp
		retf
TextScroll_Helper_55BF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScroll_HelperB_6F1DF (sub_6F1DF de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScroll_HelperB_3E8C9 (sub_3E8C9 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScroll_HelperB_670A5 (sub_670A5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par
; sub_67134 (combine sub_229C).
; ==============================================================================================
TextScroll_HelperB_55C1B		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_60630
		add	word_5E7AA, ax
		mov	ax, word_5E7AA
		cmp	ax, word_5E7A8
		jb	short loc_55C34
		mov	ax, word_5E7A6
		mov	word_5E7AA, ax

loc_55C34:
		pop	bp
		retf
TextScroll_HelperB_55C1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55C36		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		add	dx, word_60630
		cmp	dx, word_5E7A8
		jb	short loc_55C4B
		mov	ax, word_5E7A6
		jmp	short loc_55C4D

loc_55C4B:
		mov	ax, dx

loc_55C4D:
		pop	bp
		retf
sub_55C36		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55C4F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, word_5E7AA
		cmp	ax, word_5E7AC
		jnz	short loc_55C62
		mov	al, 0
		jmp	short loc_55C8C

loc_55C62:
		mov	ax, word_5E7AA
		cmp	ax, word_5E7AC
		jnb	short loc_55C7E
		cmp	dx, word_5E7AA
		jb	short loc_55C8A
		cmp	dx, word_5E7AC
		jnb	short loc_55C8A

loc_55C77:
		mov	ax, 1
		jmp	short loc_55C8C
		jmp	short loc_55C8A

loc_55C7E:
		cmp	dx, word_5E7AA
		jnb	short loc_55C77
		cmp	dx, word_5E7AC
		jb	short loc_55C77

loc_55C8A:
		xor	ax, ax

loc_55C8C:
		pop	bp
		retf
sub_55C4F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55C8E		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	word_60630
		push	large [bp+arg_0]
		push	ds
		push	word_5E7AC
		call	sub_3609
		add	sp, 0Ah
		push	cs
		call	near ptr TextScroll_Helper_55BF2
		pop	bp
		retf
sub_55C8E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScroll_ApplyHelperB_6F270 (sub_6F270 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScroll_ApplyHelperB_3E958 (sub_3E958 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScroll_ApplyHelperB_67134 (sub_67134 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_229C et TextScroll_HelperB_670A5.
; ==============================================================================================
TextScroll_ApplyHelperB_55CAC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, word_5E7AA
		cmp	ax, word_5E7AC
		jz	short loc_55CD0
		push	word_60630
		push	ax
		push	[bp+arg_0]
		call	CRT_Memmove
		add	sp, 6
		push	cs
		call	near ptr TextScroll_HelperB_55C1B
		mov	al, 1
		jmp	short loc_55CD2

loc_55CD0:
		mov	al, 0

loc_55CD2:
		pop	bp
		retf
TextScroll_ApplyHelperB_55CAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55CD4		proc far

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
		jz	short loc_55D0B
		mov	byte ptr [bp+var_8+1], 1
		jmp	short loc_55D1B

loc_55D0B:
		test	dx, 18h
		jz	short loc_55D17
		mov	byte ptr [bp+var_8+1], 2
		jmp	short loc_55D1B

loc_55D17:
		mov	byte ptr [bp+var_8+1], 0

loc_55D1B:
		test	dx, 2Ah
		jz	short loc_55D27
		mov	byte ptr [bp+var_8], 1
		jmp	short loc_55D37

loc_55D27:
		test	dx, 54h
		jz	short loc_55D33
		mov	byte ptr [bp+var_8], 2
		jmp	short loc_55D37

loc_55D33:
		mov	byte ptr [bp+var_8], 0

loc_55D37:
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_55C8E
		add	sp, 4
		leave
		retf
sub_55CD4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScroll_RegisterHandler_6F309 (sub_6F309 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScroll_RegisterHandler_3E9EE (sub_3E9EE de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScroll_RegisterHandler_671CA (sub_671CA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enregistre TextScroll_TickHandler_6715C (tag 0xFE) via sub_67517 — probable enregistrement
; dans le registre de modules à créneaux temporisés (seg161) ou un système apparenté.
; ==============================================================================================
TextScroll_RegisterHandler_55D45		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0FEh
		push	seg seg170
		push	offset sub_55CD4
		push	ax
		call	HandlerRegistry4Slot_Register_56092
		add	sp, 8
		pop	bp
		retf
TextScroll_RegisterHandler_55D45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScroll_ApplyHelperC_6F323 (sub_6F323 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScroll_ApplyHelperC_3EA08 (sub_3EA08 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScroll_ApplyHelperC_671E4 (sub_671E4 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par
; sub_67204.
; ==============================================================================================
TextScroll_ApplyHelperC_55D5F		proc far
		push	bp
		mov	bp, sp
		mov	byte_60632, 0
		push	6912h
		push	cs
		call	near ptr TextScroll_ApplyHelperB_55CAC
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55D7A
		nop
		push	cs
		call	near ptr TextScroll_ApplyHelperD_55D9D

loc_55D7A:
		mov	ax, 6912h
		pop	bp
		retf
TextScroll_ApplyHelperC_55D5F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScroll_FormatAndApply_6F343 (sub_6F343 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScroll_FormatAndApply_3EA28 (sub_3EA28 de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScroll_FormatAndApply_67204 (sub_67204 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine TextScroll_ApplyHelperC_671E4 et sub_3FD (formatage).
; ==============================================================================================
TextScroll_FormatAndApply_55D7F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	cs
		call	near ptr TextScroll_ApplyHelperC_55D5F
		push	ds
		push	si
		push	ds
		push	offset byte_60632
		mov	cx, 7
		call	CRT_Fmemcpy
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScroll_FormatAndApply_55D7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScroll_ApplyHelperD_6F361 (sub_6F361 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à TextScroll_ApplyHelperD_3EA46 (sub_3EA46 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScroll_ApplyHelperD_67222 (sub_67222 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_67481 et sub_67499 (×2 chacune).
; ==============================================================================================
TextScroll_ApplyHelperD_55D9D		proc far
		push	bp
		mov	bp, sp
		call	sub_55FFC
		cmp	ax, word_60634
		jnz	short loc_55DB6
		call	sub_56014
		cmp	ax, word_60636
		jz	short loc_55DCF

loc_55DB6:
		mov	byte_60632, 3
		call	sub_55FFC
		mov	word_60634, ax
		call	sub_56014
		mov	word_60636, ax
		mov	al, 1
		jmp	short loc_55DD6

loc_55DCF:
		mov	byte_60632, 0
		mov	al, 0

loc_55DD6:
		pop	bp
		retf
TextScroll_ApplyHelperD_55D9D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55DD8		proc far
		push	bp
		mov	bp, sp
		mov	byte_60632, 0
sub_55DD8		endp
seg170		ends
