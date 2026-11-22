seg217		segment	para public 'CODE' use16
		assume cs:seg217
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C4h, 4, 5Dh, 0CBh

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
TextScrollDisplayB_ConstructAndReset_6F974		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6F98D
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6F9AE

loc_6F98D:
		push	si
		call	sub_6F6F3
		pop	cx
		mov	word_7D3E0, 0
		mov	word_7D3E2, 0
		mov	word_7B2CA, 0
		xor	ax, ax
		mov	word_7B298, ax
		mov	word_7B296, ax

loc_6F9AE:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplayB_ConstructAndReset_6F974		endp

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
TextScrollDisplayB_InitAndRegister_6F9B3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word_7B2CA, 0
		jnz	short loc_6FA06
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6F9DF
		mov	word ptr [di], 0
		mov	word ptr [di+2], 0
		mov	byte ptr [di+0Dh], 0
		jmp	short loc_6F9E1

loc_6F9DF:
		mov	ax, di

loc_6F9E1:
		mov	word_7B2CC, ax
		push	0
		push	0
		push	large 0C7013Fh
		push	large 0
		push	large 0A000h
		push	ax
		call	TextFormat_InitAttributeTable_67DCE
		add	sp, 12h
		mov	ax, word_7AF7E
		mov	word_7B2CA, ax

loc_6FA06:
		push	1
		push	seg seg217
		push	offset TextScrollDisplayB_ApplyHelperB_6FA5F
		push	si
		call	HandlerRegistry4Slot_Register_6F656
		add	sp, 8
		pop	di
		pop	si
		pop	bp
		retf
TextScrollDisplayB_InitAndRegister_6F9B3		endp

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
TextScrollDisplayB_ApplyHelperA_6FA1B		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	byte_7D3BC, 0
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6FA53
		mov	al, byte_7B29A
		mov	[bp+var_1], al
		or	al, al
		jz	short loc_6FA42
		nop
		push	cs
		call	near ptr TextScrollDisplayB_ApplyHelperD_6FAF5

loc_6FA42:
		mov	word_7B2CA, si
		cmp	[bp+var_1], 0
		jz	short loc_6FA57
		nop
		push	cs
		call	near ptr TextScrollDisplayB_ApplyHelperC_6FABB
		jmp	short loc_6FA57

loc_6FA53:
		mov	word_7B2CA, si

loc_6FA57:
		mov	byte_7D3BC, 1
		pop	si
		leave
		retf
TextScrollDisplayB_ApplyHelperA_6FA1B		endp

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
TextScrollDisplayB_ApplyHelperB_6FA5F		proc far

arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		cmp	byte_7B29A, 0
		jz	short loc_6FA90
		cmp	byte_7D3BC, 0
		jz	short loc_6FA90
		mov	byte_7D3BC, 0
		nop
		push	cs
		call	near ptr sub_6FB87
		push	[bp+arg_6]
		mov	ax, [bp+arg_4]
		sar	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_6FB1F
		add	sp, 4
		mov	byte_7D3BC, 1

loc_6FA90:
		pop	bp
		retf
TextScrollDisplayB_ApplyHelperB_6FA5F		endp

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
TextScrollDisplayB_TickHelper_6FA92		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	6C90h
		call	CachedObject_DestructHelper_677C8
		add	sp, 4
		pop	bp
		retf
TextScrollDisplayB_TickHelper_6FA92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_SetWidgetValue_50654 (sub_50654 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe fine transmettant 2 arguments + id widget 59CDh à sub_23241 (probable setter
; générique de valeur de widget).
; ==============================================================================================
UIScreen_SetWidgetValue_6FAA5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	6C90h
		call	sub_6785D
		add	sp, 6
		pop	bp
		retf
UIScreen_SetWidgetValue_6FAA5		endp

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
TextScrollDisplayB_ApplyHelperC_6FABB		proc far

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	al, byte_7D3BC
		mov	[bp+var_2], al
		mov	byte_7D3BC, 0
		cmp	byte_7B29A, 0
		jz	short loc_6FAD8
		nop
		push	cs
		call	near ptr sub_6FB87

loc_6FAD8:
		push	word_7B298
		push	word_7B296
		nop
		push	cs
		call	near ptr sub_6FB1F
		add	sp, 4
		mov	byte_7B29A, 1
		mov	al, [bp+var_2]
		mov	byte_7D3BC, al
		leave
		retf
TextScrollDisplayB_ApplyHelperC_6FABB		endp

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
TextScrollDisplayB_ApplyHelperD_6FAF5		proc far

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	al, byte_7D3BC
		mov	[bp+var_2], al
		mov	byte_7D3BC, 0
		cmp	byte_7B29A, 0
		jz	short loc_6FB12
		nop
		push	cs
		call	near ptr sub_6FB87

loc_6FB12:
		mov	byte_7B29A, 0
		mov	al, [bp+var_2]
		mov	byte_7D3BC, al
		leave
		retf
TextScrollDisplayB_ApplyHelperD_6FAF5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FB1F		proc far

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
		cmp	word_7D3E4, 0
		jz	short loc_6FB3A
		mov	dx, word_7B2CC
		jmp	short loc_6FB3E

loc_6FB3A:
		mov	dx, word_7B2CA

loc_6FB3E:
		push	dx
		push	6CB6h
		call	sub_6735D
		add	sp, 4
		mov	[bp+var_2], si
		mov	[bp+var_4], di
		mov	ax, [bp+var_2]
		mov	word_7D3C2, ax
		mov	ax, [bp+var_4]
		mov	word_7D3C4, ax
		push	6C90h
		call	CachedObject_BuildComposite_67A3F
		pop	cx
		push	di
		push	si
		push	6C90h
		call	CachedObject_AllocateAndInit_679F1
		add	sp, 6
		mov	word_7B296, si
		mov	word_7B298, di
		push	6CB6h
		call	sub_67383
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_6FB1F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FB87		proc far
		push	bp
		mov	bp, sp
		cmp	word_7D3E4, 0
		jz	short loc_6FB97
		mov	dx, word_7B2CC
		jmp	short loc_6FB9B

loc_6FB97:
		mov	dx, word_7B2CA

loc_6FB9B:
		push	dx
		push	6CB6h
		call	sub_6735D
		add	sp, 4
		push	word_7B298
		push	word_7B296
		push	6C90h
		call	CachedObject_BuildVariant_67B5D
		add	sp, 6
		push	6CB6h
		call	sub_67383
		pop	cx
		pop	bp
		retf
sub_6FB87		endp

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
TextScrollDisplayB_StopAnimation_6FBC5		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_7D3BC
		mov	[bp+var_2], al
		mov	byte_7D3BC, 0
		mov	ax, word_7B2CA
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_0]
		mov	word_7B2CA, ax
		push	word_7B298
		push	word_7B296
		push	cs
		call	near ptr sub_6FB1F
		add	sp, 4
		mov	ax, [bp+var_4]
		mov	word_7B2CA, ax
		mov	al, [bp+var_2]
		mov	byte_7D3BC, al
		leave
		retf
TextScrollDisplayB_StopAnimation_6FBC5		endp

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
TextScrollDisplayB_StartAnimation_6FBFF		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_7D3BC
		mov	[bp+var_2], al
		mov	byte_7D3BC, 0
		mov	ax, word_7B2CA
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_0]
		mov	word_7B2CA, ax
		push	cs
		call	near ptr sub_6FB87
		mov	ax, [bp+var_4]
		mov	word_7B2CA, ax
		mov	al, [bp+var_2]
		mov	byte_7D3BC, al
		leave
		retf
TextScrollDisplayB_StartAnimation_6FBFF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FC2E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	byte_7D3BC, 0
		push	[bp+arg_0]
		push	cs
		call	near ptr TextScrollDisplayB_StopAnimation_6FBC5
		pop	cx
		pop	bp
		retf
sub_6FC2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FC40		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	cs
		call	near ptr TextScrollDisplayB_StartAnimation_6FBFF
		pop	cx
		mov	byte_7D3BC, 1
		pop	bp
		retf
sub_6FC40		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FC52		proc far
		push	bp
		mov	bp, sp
		push	6C90h
		call	CachedObject_Allocate_673DC
		pop	cx
		pop	bp
		retf
sub_6FC52		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FC60		proc far
		push	bp
		mov	bp, sp
		push	6CB6h
		call	sub_67383
		pop	cx
		push	2
sub_6FC60		endp

; START OF FUNCTION CHUNK FOR sub_6FC60
		db 68h
		nop
; END OF FUNCTION CHUNK FOR sub_6FC60
seg217		ends
