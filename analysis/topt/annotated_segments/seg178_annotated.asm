seg178		segment	para public 'CODE' use16
		assume cs:seg178
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à OptionCounter_Set_3F60E
; (sub_3F60E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; OptionCounter_Set_67DEA (sub_67DEA de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, écrit le compteur d'options (word_72E82). Référencée
; par ConfigOption_ConstructFull_66762 (seg201).
; ==============================================================================================
OptionCounter_Set_453D0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_4F790, ax
		pop	bp
		retf
OptionCounter_Set_453D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ConstructAndReset_3F619 (sub_3F619 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScrollDisplayB_ConstructAndReset_67DF5
; (sub_67DF5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658, 2 octets), initialise via TextScrollDisplayB_Construct_675B4
; (seg206) puis remet à zéro les compteurs d'animation (word_72ECE/72ED0/711FC/711C6/711C8).
; Référencée depuis seg047/seg049 (proches de TextRenderer_Main).
; ==============================================================================================
TextScrollDisplayB_ConstructAndReset_453DB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_453F4
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_45415

loc_453F4:
		push	si
		call	sub_44BD6
		pop	cx
		mov	word_4F7DC, 0
		mov	word_4F7DE, 0
		mov	word_4DE44, 0
		xor	ax, ax
		mov	word_4DE10, ax
		mov	word_4DE0E, ax

loc_45415:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplayB_ConstructAndReset_453DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplayB_InitAndRegister_3F658 (sub_3F658 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScrollDisplayB_InitAndRegister_67E34 (sub_67E34
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), initialise (TextFormat_InitAttributeTable_5E45D, seg143) et enregistre via
; HandlerRegistry4Slot_Register_67517 (seg205).
; ==============================================================================================
TextScrollDisplayB_InitAndRegister_4541A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word_4DE44, 0
		jnz	short loc_4546D
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_45446
		mov	word ptr [di], 0
		mov	word ptr [di+2], 0
		mov	byte ptr [di+0Dh], 0
		jmp	short loc_45448

loc_45446:
		mov	ax, di

loc_45448:
		mov	word_4DE46, ax
		push	0
		push	0
		push	large 0C7013Fh
		push	large 0
		push	large 0A000h
		push	ax
		call	TextFormat_InitAttributeTable_3595E
		add	sp, 12h
		mov	ax, word_4D36E
		mov	word_4DE44, ax

loc_4546D:
		push	1
		push	seg seg178
		push	offset TextScrollDisplayB_ApplyHelperB_454C6
		push	si
		call	HandlerRegistry4Slot_Register_44B39
		add	sp, 8
		pop	di
		pop	si
		pop	bp
		retf
TextScrollDisplayB_InitAndRegister_4541A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperA_3F6C0 (sub_3F6C0 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à TextScrollDisplayB_ApplyHelperA_67E9C (sub_67E9C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_67F60 et sub_67F26.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperA_45482		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	byte_4F77A, 0
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_454BA
		mov	al, byte_4DE12
		mov	[bp+var_1], al
		or	al, al
		jz	short loc_454A9
		nop
		push	cs
		call	near ptr TextScrollDisplayB_ApplyHelperD_4555C

loc_454A9:
		mov	word_4DE44, si
		cmp	[bp+var_1], 0
		jz	short loc_454BE
		nop
		push	cs
		call	near ptr TextScrollDisplayB_ApplyHelperC_45522
		jmp	short loc_454BE

loc_454BA:
		mov	word_4DE44, si

loc_454BE:
		mov	byte_4F77A, 1
		pop	si
		leave
		retf
TextScrollDisplayB_ApplyHelperA_45482		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperB_3F704 (sub_3F704 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à TextScrollDisplayB_ApplyHelperB_67EE0 (sub_67EE0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Cached-cluster helper sub_67FF8 et sub_67F8A.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperB_454C6		proc far

arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		cmp	byte_4DE12, 0
		jz	short loc_454F7
		cmp	byte_4F77A, 0
		jz	short loc_454F7
		mov	byte_4F77A, 0
		nop
		push	cs
		call	near ptr sub_455EE
		push	[bp+arg_6]
		mov	ax, [bp+arg_4]
		sar	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_45586
		add	sp, 4
		mov	byte_4F77A, 1

loc_454F7:
		pop	bp
		retf
TextScrollDisplayB_ApplyHelperB_454C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_3F737 (sub_3F737 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_67F13 (sub_67F13 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; CachedObject_DestructHelper_5DE34 (seg141, tag 5DFEh). Référencée par sub_8F47A (même
; appelant que Stopwatch_RegisterTickModule_67611, seg207).
; ==============================================================================================
TextScrollDisplayB_TickHelper_454F9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	6DDCh
		call	CachedObject_DestructHelper_35358
		add	sp, 4
		pop	bp
		retf
TextScrollDisplayB_TickHelper_454F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_SetWidgetValue_50654 (sub_50654 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe fine transmettant 2 arguments + id widget 59CDh à sub_23241 (probable setter
; générique de valeur de widget).
; ==============================================================================================
UIScreen_SetWidgetValue_4550C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	6DDCh
		call	sub_353ED
		add	sp, 6
		pop	bp
		retf
UIScreen_SetWidgetValue_4550C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperC_3F74A (sub_3F74A de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à TextScrollDisplayB_ApplyHelperC_67F26 (sub_67F26 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_67FF8 et sub_67F8A.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperC_45522		proc far

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	al, byte_4F77A
		mov	[bp+var_2], al
		mov	byte_4F77A, 0
		cmp	byte_4DE12, 0
		jz	short loc_4553F
		nop
		push	cs
		call	near ptr sub_455EE

loc_4553F:
		push	word_4DE10
		push	word_4DE0E
		nop
		push	cs
		call	near ptr sub_45586
		add	sp, 4
		mov	byte_4DE12, 1
		mov	al, [bp+var_2]
		mov	byte_4F77A, al
		leave
		retf
TextScrollDisplayB_ApplyHelperC_45522		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperD_3F784 (sub_3F784 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à TextScrollDisplayB_ApplyHelperD_67F60 (sub_67F60 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_67FF8.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperD_4555C		proc far

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	al, byte_4F77A
		mov	[bp+var_2], al
		mov	byte_4F77A, 0
		cmp	byte_4DE12, 0
		jz	short loc_45579
		nop
		push	cs
		call	near ptr sub_455EE

loc_45579:
		mov	byte_4DE12, 0
		mov	al, [bp+var_2]
		mov	byte_4F77A, al
		leave
		retf
TextScrollDisplayB_ApplyHelperD_4555C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45586		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word_4F7E0, 0
		jz	short loc_455A1
		mov	dx, word_4DE46
		jmp	short loc_455A5

loc_455A1:
		mov	dx, word_4DE44

loc_455A5:
		push	dx
		push	6E02h
		call	sub_3499B
		add	sp, 4
		mov	[bp+var_2], si
		mov	[bp+var_4], di
		mov	ax, [bp+var_2]
		mov	word_4F7BE, ax
		mov	ax, [bp+var_4]
		mov	word_4F7C0, ax
		push	6DDCh
		call	CachedObject_BuildComposite_355CF
		pop	cx
		push	di
		push	si
		push	6DDCh
		call	CachedObject_AllocateAndInit_35581
		add	sp, 6
		mov	word_4DE0E, si
		mov	word_4DE10, di
		push	6E02h
		call	SmallObject_UnregisterFromList_349C1
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_45586		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_455EE		proc far
		push	bp
		mov	bp, sp
		cmp	word_4F7E0, 0
		jz	short loc_455FE
		mov	dx, word_4DE46
		jmp	short loc_45602

loc_455FE:
		mov	dx, word_4DE44

loc_45602:
		push	dx
		push	6E02h
		call	sub_3499B
		add	sp, 4
		push	word_4DE10
		push	word_4DE0E
		push	6DDCh
		call	CachedObject_BuildVariant_356ED
		add	sp, 6
		push	6E02h
		call	SmallObject_UnregisterFromList_349C1
		pop	cx
		pop	bp
		retf
sub_455EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplayB_StopAnimation_3F863 (sub_3F863 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScrollDisplayB_StopAnimation_6803F (sub_6803F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle TextScrollDisplayB_UpdateObjectState_67F8A — arrête l'animation de défilement
; (associé au flag byte_72E70=0 dans l'appelant).
; ==============================================================================================
TextScrollDisplayB_StopAnimation_4562C		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_4F77A
		mov	[bp+var_2], al
		mov	byte_4F77A, 0
		mov	ax, word_4DE44
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_0]
		mov	word_4DE44, ax
		push	word_4DE10
		push	word_4DE0E
		push	cs
		call	near ptr sub_45586
		add	sp, 4
		mov	ax, [bp+var_4]
		mov	word_4DE44, ax
		mov	al, [bp+var_2]
		mov	byte_4F77A, al
		leave
		retf
TextScrollDisplayB_StopAnimation_4562C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextScrollDisplayB_StartAnimation_3F89D (sub_3F89D de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à TextScrollDisplayB_StartAnimation_68079 (sub_68079
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle TextScrollDisplayB_UpdateObjectStateB_67FF8 — démarre l'animation de défilement
; (associé au flag byte_72E70=1 dans l'appelant).
; ==============================================================================================
TextScrollDisplayB_StartAnimation_45666		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_4F77A
		mov	[bp+var_2], al
		mov	byte_4F77A, 0
		mov	ax, word_4DE44
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_0]
		mov	word_4DE44, ax
		push	cs
		call	near ptr sub_455EE
		mov	ax, [bp+var_4]
		mov	word_4DE44, ax
		mov	al, [bp+var_2]
		mov	byte_4F77A, al
		leave
		retf
TextScrollDisplayB_StartAnimation_45666		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45695		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	byte_4F77A, 0
		push	[bp+arg_0]
		push	cs
		call	near ptr TextScrollDisplayB_StopAnimation_4562C
		pop	cx
		pop	bp
		retf
sub_45695		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_456A7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	cs
		call	near ptr TextScrollDisplayB_StartAnimation_45666
		pop	cx
		mov	byte_4F77A, 1
		pop	bp
		retf
sub_456A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_456B9		proc far
		push	bp
		mov	bp, sp
		push	6DDCh
		call	CachedObject_Allocate_34F6C
		pop	cx
		pop	bp
		retf
sub_456B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_456C7		proc far
		push	bp
		mov	bp, sp
		push	6E02h
		call	SmallObject_UnregisterFromList_349C1
		pop	cx
		push	2
		push	6DDCh
		call	CachedObject_Destruct_351AB
		add	sp, 4
sub_456C7		endp
seg178		ends
