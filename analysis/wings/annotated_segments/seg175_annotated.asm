seg175		segment	para public 'CODE' use16
		assume cs:seg175
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à OptionCounter_Set_67DEA
; (sub_67DEA de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, écrit le compteur d'options (word_72E82). Référencée par
; ConfigOption_ConstructFull_66762 (seg201).
; ==============================================================================================
OptionCounter_Set_57052		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_60670, ax
		pop	bp
		retf
OptionCounter_Set_57052		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ConstructAndReset_6F974 (sub_6F974 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à TextScrollDisplayB_ConstructAndReset_3F619
; (sub_3F619 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ConstructAndReset_67DF5 (sub_67DF5 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658, 2 octets),
; initialise via TextScrollDisplayB_Construct_675B4 (seg206) puis remet à zéro les compteurs
; d'animation (word_72ECE/72ED0/711FC/711C6/711C8). Référencée depuis seg047/seg049 (proches
; de TextRenderer_Main).
; ==============================================================================================
TextScrollDisplayB_ConstructAndReset_5705D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_57076
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_57097

loc_57076:
		push	si
		call	sub_5612F
		pop	cx
		mov	word_606DE, 0
		mov	word_606E0, 0
		mov	word_5E806, 0
		xor	ax, ax
		mov	word_5E7CE, ax
		mov	word_5E7CC, ax

loc_57097:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplayB_ConstructAndReset_5705D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplayB_InitAndRegister_6F9B3 (sub_6F9B3 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à TextScrollDisplayB_InitAndRegister_3F658 (sub_3F658
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_InitAndRegister_67E34 (sub_67E34 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658), initialise
; (TextFormat_InitAttributeTable_5E45D, seg143) et enregistre via
; HandlerRegistry4Slot_Register_67517 (seg205).
; ==============================================================================================
TextScrollDisplayB_InitAndRegister_5709C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word_5E806, 0
		jnz	short loc_570EF
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_570C8
		mov	word ptr [di], 0
		mov	word ptr [di+2], 0
		mov	byte ptr [di+0Dh], 0
		jmp	short loc_570CA

loc_570C8:
		mov	ax, di

loc_570CA:
		mov	word_5E808, ax
		push	0
		push	0
		push	large 0C7013Fh
		push	large 0
		push	large 0A000h
		push	ax
		call	TextFormat_InitAttributeTable_47A04
		add	sp, 12h
		mov	ax, word_5DD44
		mov	word_5E806, ax

loc_570EF:
		push	1
		push	seg seg175
		push	offset TextScrollDisplayB_ApplyHelperB_57148
		push	si
		call	HandlerRegistry4Slot_Register_56092
		add	sp, 8
		pop	di
		pop	si
		pop	bp
		retf
TextScrollDisplayB_InitAndRegister_5709C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperA_6FA1B (sub_6FA1B de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à TextScrollDisplayB_ApplyHelperA_3F6C0 (sub_3F6C0 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperA_67E9C (sub_67E9C de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_67F60 et sub_67F26.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperA_57104		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	byte_6065A, 0
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5713C
		mov	al, byte_5E7D0
		mov	[bp+var_1], al
		or	al, al
		jz	short loc_5712B
		nop
		push	cs
		call	near ptr TextScrollDisplayB_ApplyHelperD_571DE

loc_5712B:
		mov	word_5E806, si
		cmp	[bp+var_1], 0
		jz	short loc_57140
		nop
		push	cs
		call	near ptr TextScrollDisplayB_ApplyHelperC_571A4
		jmp	short loc_57140

loc_5713C:
		mov	word_5E806, si

loc_57140:
		mov	byte_6065A, 1
		pop	si
		leave
		retf
TextScrollDisplayB_ApplyHelperA_57104		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperB_6FA5F (sub_6FA5F de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à TextScrollDisplayB_ApplyHelperB_3F704 (sub_3F704 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperB_67EE0 (sub_67EE0 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine Cached-cluster helper sub_67FF8 et
; sub_67F8A.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperB_57148		proc far

arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		cmp	byte_5E7D0, 0
		jz	short loc_57179
		cmp	byte_6065A, 0
		jz	short loc_57179
		mov	byte_6065A, 0
		nop
		push	cs
		call	near ptr sub_57270
		push	[bp+arg_6]
		mov	ax, [bp+arg_4]
		sar	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_57208
		add	sp, 4
		mov	byte_6065A, 1

loc_57179:
		pop	bp
		retf
TextScrollDisplayB_ApplyHelperB_57148		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_6FA92 (sub_6FA92 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_3F737 (sub_3F737 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_67F13 (sub_67F13 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; CachedObject_DestructHelper_5DE34 (seg141, tag 5DFEh). Référencée par sub_8F47A (même
; appelant que Stopwatch_RegisterTickModule_67611, seg207).
; ==============================================================================================
TextScrollDisplayB_TickHelper_5717B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	699Eh
		call	CachedObject_DestructHelper_4738E
		add	sp, 4
		pop	bp
		retf
TextScrollDisplayB_TickHelper_5717B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_SetWidgetValue_5160F (sub_5160F de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_SetWidgetValue_50654 (sub_50654 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe fine transmettant 2 arguments + id widget 59CDh à sub_23241 (probable setter
; générique de valeur de widget).
; ==============================================================================================
UIScreen_SetWidgetValue_5718E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	699Eh
		call	sub_47423
		add	sp, 6
		pop	bp
		retf
UIScreen_SetWidgetValue_5718E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperC_6FABB (sub_6FABB de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à TextScrollDisplayB_ApplyHelperC_3F74A (sub_3F74A de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperC_67F26 (sub_67F26 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_67FF8 et sub_67F8A.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperC_571A4		proc far

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	al, byte_6065A
		mov	[bp+var_2], al
		mov	byte_6065A, 0
		cmp	byte_5E7D0, 0
		jz	short loc_571C1
		nop
		push	cs
		call	near ptr sub_57270

loc_571C1:
		push	word_5E7CE
		push	word_5E7CC
		nop
		push	cs
		call	near ptr sub_57208
		add	sp, 4
		mov	byte_5E7D0, 1
		mov	al, [bp+var_2]
		mov	byte_6065A, al
		leave
		retf
TextScrollDisplayB_ApplyHelperC_571A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperD_6FAF5 (sub_6FAF5 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à TextScrollDisplayB_ApplyHelperD_3F784 (sub_3F784 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_ApplyHelperD_67F60 (sub_67F60 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_67FF8.
; ==============================================================================================
TextScrollDisplayB_ApplyHelperD_571DE		proc far

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	al, byte_6065A
		mov	[bp+var_2], al
		mov	byte_6065A, 0
		cmp	byte_5E7D0, 0
		jz	short loc_571FB
		nop
		push	cs
		call	near ptr sub_57270

loc_571FB:
		mov	byte_5E7D0, 0
		mov	al, [bp+var_2]
		mov	byte_6065A, al
		leave
		retf
TextScrollDisplayB_ApplyHelperD_571DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57208		proc far

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
		cmp	word_606E2, 0
		jz	short loc_57223
		mov	dx, word_5E808
		jmp	short loc_57227

loc_57223:
		mov	dx, word_5E806

loc_57227:
		push	dx
		push	69C4h
		call	sub_469A5
		add	sp, 4
		mov	[bp+var_2], si
		mov	[bp+var_4], di
		mov	ax, [bp+var_2]
		mov	word_606C0, ax
		mov	ax, [bp+var_4]
		mov	word_606C2, ax
		push	699Eh
		call	sub_4762F
		pop	cx
		push	di
		push	si
		push	699Eh
		call	sub_475D3
		add	sp, 6
		mov	word_5E7CC, si
		mov	word_5E7CE, di
		push	69C4h
		call	sub_469CB
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_57208		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57270		proc far
		push	bp
		mov	bp, sp
		cmp	word_606E2, 0
		jz	short loc_57280
		mov	dx, word_5E808
		jmp	short loc_57284

loc_57280:
		mov	dx, word_5E806

loc_57284:
		push	dx
		push	69C4h
		call	sub_469A5
		add	sp, 4
		push	word_5E7CE
		push	word_5E7CC
		push	699Eh
		call	sub_47777
		add	sp, 6
		push	69C4h
		call	sub_469CB
		pop	cx
		pop	bp
		retf
sub_57270		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplayB_StopAnimation_6FBC5 (sub_6FBC5 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à TextScrollDisplayB_StopAnimation_3F863 (sub_3F863 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_StopAnimation_6803F (sub_6803F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; TextScrollDisplayB_UpdateObjectState_67F8A — arrête l'animation de défilement (associé au
; flag byte_72E70=0 dans l'appelant).
; ==============================================================================================
TextScrollDisplayB_StopAnimation_572AE		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_6065A
		mov	[bp+var_2], al
		mov	byte_6065A, 0
		mov	ax, word_5E806
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_0]
		mov	word_5E806, ax
		push	word_5E7CE
		push	word_5E7CC
		push	cs
		call	near ptr sub_57208
		add	sp, 4
		mov	ax, [bp+var_4]
		mov	word_5E806, ax
		mov	al, [bp+var_2]
		mov	byte_6065A, al
		leave
		retf
TextScrollDisplayB_StopAnimation_572AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextScrollDisplayB_StartAnimation_6FBFF (sub_6FBFF de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à TextScrollDisplayB_StartAnimation_3F89D (sub_3F89D
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplayB_StartAnimation_68079 (sub_68079 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; TextScrollDisplayB_UpdateObjectStateB_67FF8 — démarre l'animation de défilement (associé au
; flag byte_72E70=1 dans l'appelant).
; ==============================================================================================
TextScrollDisplayB_StartAnimation_572E8		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_6065A
		mov	[bp+var_2], al
		mov	byte_6065A, 0
		mov	ax, word_5E806
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_0]
		mov	word_5E806, ax
		push	cs
		call	near ptr sub_57270
		mov	ax, [bp+var_4]
		mov	word_5E806, ax
		mov	al, [bp+var_2]
		mov	byte_6065A, al
		leave
		retf
TextScrollDisplayB_StartAnimation_572E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57317		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	byte_6065A, 0
		push	[bp+arg_0]
		push	cs
		call	near ptr TextScrollDisplayB_StopAnimation_572AE
		pop	cx
		pop	bp
		retf
sub_57317		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57329		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	cs
		call	near ptr TextScrollDisplayB_StartAnimation_572E8
		pop	cx
		mov	byte_6065A, 1
		pop	bp
		retf
sub_57329		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5733B		proc far
		push	bp
		mov	bp, sp
		push	699Eh
		call	CachedObject_Allocate_46FA2
		pop	cx
		pop	bp
		retf
sub_5733B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57349		proc far
		push	bp
		mov	bp, sp
		push	69C4h
		call	sub_469CB
		pop	cx
		push	2
		push	699Eh
		call	CachedObject_Destruct_471E1
sub_57349		endp

; START OF FUNCTION CHUNK FOR sub_57349
		db 83h
; END OF FUNCTION CHUNK FOR sub_57349
seg175		ends
