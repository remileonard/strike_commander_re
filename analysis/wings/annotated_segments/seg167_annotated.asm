seg167		segment	para public 'CODE' use16
		assume cs:seg167
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FAh, 90h, 90h, 0E9h, 9Dh, 0FFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55316		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5532F
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_55346

loc_5532F:
		push	si
		call	OptionCounter_Construct_5700C
		pop	cx
		push	[bp+arg_6]
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr ConfigOption_ConstructFull_5534B
		add	sp, 8

loc_55346:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_55316		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_ConstructFull_6E90F (sub_6E90F de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_ConstructFull_66762 (sub_66762 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_67DEA, sub_67662 et Runtime_FatalErrorHandlerWithTag (sub_5F700, seg160) —
; finalise la construction d'une option de configuration.
; ==============================================================================================
ConfigOption_ConstructFull_5534B		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_5E73C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_553A3
		cmp	[bp+arg_2], 0
		jz	short loc_5539E
		mov	eax, [bp+arg_2]
		mov	dword_5E73D, eax
		mov	ax, [bp+arg_6]
		mov	word_5E741, ax
		push	0FFFFh
		call	OptionCounter_Set_57052
		pop	cx
		push	large 14h
		push	seg seg167
		push	offset sub_553F2
		push	693Ch
		call	Stopwatch_RegisterTickModuleVariant_561DD
		add	sp, 0Ah
		mov	word_5E746, ax
		cmp	word_5E746, 0FFFFh
		jnz	short loc_5539E
		push	4A2Bh
		call	sub_9D78
		pop	cx

loc_5539E:
		mov	byte_5E73C, 1

loc_553A3:
		pop	bp
		retf
ConfigOption_ConstructFull_5534B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_553A5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_553EE
		cmp	byte_5E73C, 0
		jz	short loc_553D6
		cmp	word_5E746, 0FFFFh
		jz	short loc_553D1
		push	word_5E746
		push	693Ch
		call	Stopwatch_UnregisterTickModule_5621A
		add	sp, 4

loc_553D1:
		mov	byte_5E73C, 0

loc_553D6:
		push	0
		push	si
		call	sub_5702E
		add	sp, 4
		test	di, 1
		jz	short loc_553EE
		push	si
		call	sub_33B
		pop	cx

loc_553EE:
		pop	di
		pop	si
		pop	bp
		retf
sub_553A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_553F2		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		call	Joystick_ReadButtonsWrapper_565F5
		mov	si, ax
		cmp	si, word_5E748
		jz	short loc_55484
		mov	ax, word_5E748
		xor	ax, si
		mov	[bp+var_2], ax
		cmp	byte_5E74A, 0
		jnz	short loc_55429
		inc	byte_5E74A
		mov	word_60586, 0
		mov	byte_60588, 0
		mov	byte_60589, 0

loc_55429:
		push	686Ah
		call	Joystick_FormatCalibrationDisplay_56AF4
		pop	cx
		mov	dl, 0
		mov	bl, 1
		jmp	short loc_5546D

loc_55438:
		mov	al, bl
		mov	ah, 0
		test	[bp+var_2], ax
		jz	short loc_55469
		mov	word_60586, 1
		mov	al, bl
		mov	ah, 0
		test	word_5E748, ax
		jz	short loc_55457
		mov	word_60586, 2

loc_55457:
		mov	al, dl
		mov	ah, 0
		sar	ax, 1
		mov	byte_60588, al
		mov	al, dl
		and	al, 1
		mov	byte_60589, al
		jmp	short loc_55472

loc_55469:
		inc	dl
		shl	bl, 1

loc_5546D:
		cmp	dl, 4
		jb	short loc_55438

loc_55472:
		mov	ax, word_60670
		test	word_60586, ax
		jz	short loc_55484
		push	large 6866h
		nop
		push	cs
		call	near ptr ConfigOption_FormatValue_5548B
		pop	cx

loc_55484:
		mov	word_5E748, si
		pop	si
		leave
		retf
sub_553F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_FormatValue_668A2 (sub_668A2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; formate une valeur (sub_3FD). Appelée par ConfigOption_ApplyAndDisplay_66809.
; ==============================================================================================
ConfigOption_FormatValue_5548B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_5E745
		mov	ah, 0
		cmp	ax, word_5E741
		jnb	short loc_554E3
		mov	ax, word_60670
		test	[si], ax
		jz	short loc_554E3
		mov	al, byte_5E745
		inc	al
		mov	byte_5E745, al
		mov	al, byte_5E744
		mov	ah, 0
		shl	ax, 4
		mov	dx, word_5E73F
		push	ax
		mov	ax, word ptr dword_5E73D
		pop	bx
		add	ax, bx
		push	dx
		push	ax
		push	ds
		push	si
		mov	cx, 10h
		call	CRT_Fmemcpy
		inc	byte_5E744
		mov	al, byte_5E744
		mov	ah, 0
		cmp	ax, word_5E741
		jb	short loc_554DF
		mov	byte_5E744, 0

loc_554DF:
		mov	al, 1
		jmp	short loc_554E5

loc_554E3:
		mov	al, 0

loc_554E5:
		pop	si
		pop	bp
		retf
ConfigOption_FormatValue_5548B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_FormatValueB_668FF (sub_668FF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; formate une valeur (sub_3FD). Appelée par loc_66A4F (thunk d'ajustement).
; ==============================================================================================
ConfigOption_FormatValueB_554E8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		cmp	byte_5E745, 0
		jz	short loc_55532
		mov	al, byte_5E745
		add	al, 0FFh
		mov	byte_5E745, al
		push	ds
		push	bx
		mov	al, byte_5E743
		mov	ah, 0
		shl	ax, 4
		mov	dx, word ptr dword_5E73D
		add	dx, ax
		push	word_5E73F
		push	dx
		mov	cx, 10h
		call	CRT_Fmemcpy
		inc	byte_5E743
		mov	al, byte_5E743
		mov	ah, 0
		cmp	ax, word_5E741
		jb	short loc_5552E
		mov	byte_5E743, 0

loc_5552E:
		mov	al, 1
		jmp	short loc_55534

loc_55532:
		mov	al, 0

loc_55534:
		pop	bp
		retf
ConfigOption_FormatValueB_554E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TerrainTile_ConstructDescriptor_6EAFA (sub_6EAFA de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à TerrainTile_ConstructDescriptor_9B451 (sub_9B451 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue et construit un
; descripteur de tuile (TerrainTile_DescriptorConstruct).
; ==============================================================================================
TerrainTile_ConstructDescriptor_55536		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5554F
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5555C

loc_5554F:
		push	si
		call	sub_563B0
		pop	cx
		mov	word_60584, 0Ah

loc_5555C:
		mov	ax, si
		pop	si
		pop	bp
		retf
TerrainTile_ConstructDescriptor_55536		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55561		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jge	short loc_55574
		mov	ax, dx
		neg	ax
		jmp	short loc_55576

loc_55574:
		mov	ax, dx

loc_55576:
		pop	bp
		retf
sub_55561		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_ApplyAndDisplayB_6698F (sub_6698F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 131 lignes, NON DÉTAILLÉE — combine sub_67B3A, sub_2FD (×2) et sub_3FD (×2). Appelée par
; sub_66A4F.
; ==============================================================================================
ConfigOption_ApplyAndDisplayB_55578		proc far

var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 12h
		lea	ax, [bp+var_12]
		push	ax
		call	Joystick_FormatCalibrationDisplay_56AF4
		pop	cx
		mov	[bp+var_2], 0
		jmp	loc_5561F

loc_55590:
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 6
		mov	bx, [bp+var_2]
		imul	bx, bx, 6
		lea	dx, [bp+var_12]
		add	bx, dx
		mov	dx, [bx]
		mov	bx, ax
		sub	dx, [bx+6858h]
		push	dx
		call	CRT_Abs16_300
		pop	cx
		mov	[bp+var_4], ax
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		imul	ax, ax, 6
		mov	bx, [bp+var_2]
		imul	bx, bx, 6
		lea	dx, [bp+var_10]
		add	bx, dx
		mov	dx, [bx]
		mov	bx, ax
		sub	dx, [bx+685Ah]
		push	dx
		call	CRT_Abs16_300
		pop	cx
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		cmp	ax, word_60584
		ja	short loc_555EC
		mov	ax, [bp+var_6]
		cmp	ax, word_60584
		jbe	short loc_5561C

loc_555EC:
		mov	word_60574, 4
		mov	al, byte ptr [bp+var_2]
		mov	byte_60576, al
		push	ds
		push	offset unk_60578
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		mov	cx, 6
		call	CRT_Fmemcpy
		push	ds
		push	offset unk_6057E
		lea	ax, [bp+var_C]
		push	ss
		push	ax
		mov	cx, 6
		call	CRT_Fmemcpy
		jmp	short loc_55628

loc_5561C:
		inc	[bp+var_2]

loc_5561F:
		cmp	[bp+var_2], 2
		jge	short loc_55628
		jmp	loc_55590

loc_55628:
		cmp	word_60574, 4
		jnz	short loc_55634
		mov	ax, 1
		jmp	short loc_55636

loc_55634:
		xor	ax, ax

loc_55636:
		leave
		retf
ConfigOption_ApplyAndDisplayB_55578		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_Dispatch_6EBFC (sub_6EBFC de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConfigOption_Dispatch_3E273 (sub_3E273 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à ConfigOption_Dispatch_66A4F (sub_66A4F de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; ConfigOption_FormatValueB_668FF et ConfigOption_ApplyAndDisplayB_6698F. Appelée par le thunk
; suivant.
; ==============================================================================================
ConfigOption_Dispatch_55638		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word_60574, 0

loc_55645:
		push	6854h
		push	cs
		call	near ptr ConfigOption_FormatValueB_554E8
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5565F
		test	si, 4
		jz	short loc_55665
		push	cs
		call	near ptr ConfigOption_ApplyAndDisplayB_55578
		jmp	short loc_55665

loc_5565F:
		test	word_60574, si
		jz	short loc_55645

loc_55665:
		mov	ax, 6854h
		pop	si
		pop	bp
		retf
ConfigOption_Dispatch_55638		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5566B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	cs
		call	near ptr ConfigOption_Dispatch_55638
		pop	cx
		push	ds
		push	si
		push	ds
		push	offset word_60574
		mov	cx, 10h
		call	CRT_Fmemcpy
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_5566B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5568D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 6854h
		pop	bp
		retf
sub_5568D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55698		proc far
		push	bp
		mov	bp, sp
sub_55698		endp

; START OF FUNCTION CHUNK FOR sub_55698
		db 0C7h, 6, 54h, 68h, 0
; END OF FUNCTION CHUNK FOR sub_55698
seg167		ends
