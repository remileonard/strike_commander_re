seg213		segment	para public 'CODE' use16
		assume cs:seg213
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2, 68h, 50h, 6Ch, 9Ah, 50h, 0, 5Ah, 6Eh, 83h, 0C4h, 4, 5Dh, 0CBh

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
TextScroll_Construct_6F0FE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6F117
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6F12D

loc_6F117:
		push	si
		call	sub_6F634
		pop	cx
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr TextScroll_ComputeParams_6F182
		add	sp, 6

loc_6F12D:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScroll_Construct_6F0FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F132		proc far

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
		jnz	short loc_6F14F
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6F17C

loc_6F14F:
		push	si
		call	sub_6F634
		pop	cx
		mov	ax, [bp+arg_4]
		mov	word_7D392, ax
		mov	word_7B270, di
		imul	[bp+arg_6]
		mov	dx, word_7B270
		add	dx, ax
		mov	word_7B272, dx
		mov	ax, di
		mov	word_7B276, ax
		mov	word_7B274, ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_RegisterHandler_6F309
		pop	cx

loc_6F17C:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_6F132		endp

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
TextScroll_ComputeParams_6F182		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	word_7D392, 7
		mov	word_7B270, cx
		mov	ax, word_7D392
		imul	[bp+arg_4]
		mov	dx, word_7B270
		add	dx, ax
		mov	word_7B272, dx
		mov	ax, cx
		mov	word_7B276, ax
		mov	word_7B274, ax
		push	bx
		nop
		push	cs
		call	near ptr TextScroll_RegisterHandler_6F309
		pop	cx
		pop	bp
		retf
TextScroll_ComputeParams_6F182		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à TextScroll_Helper_3E8A0
; (sub_3E8A0 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScroll_Helper_6707C (sub_6707C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, référencée par sub_67118 (combine sub_229C).
; ==============================================================================================
TextScroll_Helper_6F1B6		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_7D392
		add	word_7B276, ax
		mov	ax, word_7B276
		cmp	ax, word_7B272
		jb	short loc_6F1CF
		mov	ax, word_7B270
		mov	word_7B276, ax

loc_6F1CF:
		mov	ax, word_7B276
		cmp	ax, word_7B274
		jnz	short loc_6F1DD
		nop
		push	cs
		call	near ptr TextScroll_HelperB_6F1DF

loc_6F1DD:
		pop	bp
		retf
TextScroll_Helper_6F1B6		endp

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
TextScroll_HelperB_6F1DF		proc far
		push	bp
		mov	bp, sp
		mov	ax, word_7D392
		add	word_7B274, ax
		mov	ax, word_7B274
		cmp	ax, word_7B272
		jb	short loc_6F1F8
		mov	ax, word_7B270
		mov	word_7B274, ax

loc_6F1F8:
		pop	bp
		retf
TextScroll_HelperB_6F1DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F1FA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		add	dx, word_7D392
		cmp	dx, word_7B272
		jb	short loc_6F20F
		mov	ax, word_7B270
		jmp	short loc_6F211

loc_6F20F:
		mov	ax, dx

loc_6F211:
		pop	bp
		retf
sub_6F1FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F213		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, word_7B274
		cmp	ax, word_7B276
		jnz	short loc_6F226
		mov	al, 0
		jmp	short loc_6F250

loc_6F226:
		mov	ax, word_7B274
		cmp	ax, word_7B276
		jnb	short loc_6F242
		cmp	dx, word_7B274
		jb	short loc_6F24E
		cmp	dx, word_7B276
		jnb	short loc_6F24E

loc_6F23B:
		mov	ax, 1
		jmp	short loc_6F250
		jmp	short loc_6F24E

loc_6F242:
		cmp	dx, word_7B274
		jnb	short loc_6F23B
		cmp	dx, word_7B276
		jb	short loc_6F23B

loc_6F24E:
		xor	ax, ax

loc_6F250:
		pop	bp
		retf
sub_6F213		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F252		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	word_7D392
		push	large [bp+arg_0]
		push	ds
		push	word_7B276
		call	sub_37C3
		add	sp, 0Ah
		push	cs
		call	near ptr TextScroll_Helper_6F1B6
		pop	bp
		retf
sub_6F252		endp

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
TextScroll_ApplyHelperB_6F270		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, word_7B274
		cmp	ax, word_7B276
		jz	short loc_6F294
		push	word_7D392
		push	ax
		push	[bp+arg_0]
		call	CRT_Memmove
		add	sp, 6
		push	cs
		call	near ptr TextScroll_HelperB_6F1DF
		mov	al, 1
		jmp	short loc_6F296

loc_6F294:
		mov	al, 0

loc_6F296:
		pop	bp
		retf
TextScroll_ApplyHelperB_6F270		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F298		proc far

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
		jz	short loc_6F2CF
		mov	byte ptr [bp+var_8+1], 1
		jmp	short loc_6F2DF

loc_6F2CF:
		test	dx, 18h
		jz	short loc_6F2DB
		mov	byte ptr [bp+var_8+1], 2
		jmp	short loc_6F2DF

loc_6F2DB:
		mov	byte ptr [bp+var_8+1], 0

loc_6F2DF:
		test	dx, 2Ah
		jz	short loc_6F2EB
		mov	byte ptr [bp+var_8], 1
		jmp	short loc_6F2FB

loc_6F2EB:
		test	dx, 54h
		jz	short loc_6F2F7
		mov	byte ptr [bp+var_8], 2
		jmp	short loc_6F2FB

loc_6F2F7:
		mov	byte ptr [bp+var_8], 0

loc_6F2FB:
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_6F252
		add	sp, 4
		leave
		retf
sub_6F298		endp

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
TextScroll_RegisterHandler_6F309		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0FEh
		push	seg seg213
		push	offset sub_6F298
		push	ax
		call	HandlerRegistry4Slot_Register_6F656
		add	sp, 8
		pop	bp
		retf
TextScroll_RegisterHandler_6F309		endp

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
TextScroll_ApplyHelperC_6F323		proc far
		push	bp
		mov	bp, sp
		mov	byte_7D394, 0
		push	6C64h
		push	cs
		call	near ptr TextScroll_ApplyHelperB_6F270
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6F33E
		nop
		push	cs
		call	near ptr TextScroll_ApplyHelperD_6F361

loc_6F33E:
		mov	ax, 6C64h
		pop	bp
		retf
TextScroll_ApplyHelperC_6F323		endp

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
TextScroll_FormatAndApply_6F343		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	cs
		call	near ptr TextScroll_ApplyHelperC_6F323
		push	ds
		push	si
		push	ds
		push	offset byte_7D394
		mov	cx, 7
		call	CRT_Fmemcpy
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScroll_FormatAndApply_6F343		endp

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
TextScroll_ApplyHelperD_6F361		proc far
		push	bp
		mov	bp, sp
		call	sub_6F5C0
		cmp	ax, word_7D396
		jnz	short loc_6F37A
		call	sub_6F5D8
		cmp	ax, word_7D398
		jz	short loc_6F393

loc_6F37A:
		mov	byte_7D394, 3
		call	sub_6F5C0
		mov	word_7D396, ax
		call	sub_6F5D8
		mov	word_7D398, ax
		mov	al, 1
		jmp	short loc_6F39A

loc_6F393:
		mov	byte_7D394, 0
		mov	al, 0

loc_6F39A:
		pop	bp
		retf
TextScroll_ApplyHelperD_6F361		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F39C		proc far
		push	bp
		mov	bp, sp
sub_6F39C		endp

; START OF FUNCTION CHUNK FOR sub_6F39C
		db 0C6h
; END OF FUNCTION CHUNK FOR sub_6F39C
seg213		ends
