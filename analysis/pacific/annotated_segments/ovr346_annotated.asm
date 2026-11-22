ovr346		segment	para public 'OVERLAY' use16
		assume cs:ovr346
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_RegisterTickModule_5EEB0 (sub_5EEB0 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à AudioQueue_RegisterTickModule_AA810 (sub_AA810 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, enregistre le
; module auprès du minuteur matériel : référence explicitement Music_SequencerTickISR_5940B
; (seg121) via Stopwatch_RegisterTickModuleVariant_67662 (seg207, tag 5DC2h, cadence 0x14).
; Confirme le lien direct entre ce cluster et le registre de modules à créneaux temporisés
; (seg161) découvert plusieurs lots auparavant.
; ==============================================================================================
AudioQueue_RegisterTickModule_BFE20		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 14h
		push	seg seg133
		push	offset sub_5BD75
		push	6C8Eh
		call	Stopwatch_RegisterTickModuleVariant_6F7A1
		add	sp, 0Ah
		mov	[si+4], ax
		pop	si
		pop	bp
		retf
AudioQueue_RegisterTickModule_BFE20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Music_StopAndResetCombat_AA831 (sub_AA831 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'AudioQueue_AdvanceSlot_AA831'. far. LUE
; 2026-10-06. Music_StopWithFade_AB1EF(fondu) puis remet a zero byte_70869 (un combat a eu
; lieu) et byte_7086A (ennemis proches).
; ==============================================================================================
Music_StopAndResetCombat_BFE41		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	1
		push	ax
		nop
		push	cs
		call	near ptr Music_StopWithFade_C087A
		add	sp, 4
		mov	byte_79D87, 0
		mov	byte_79D88, 0
		pop	bp
		retf
Music_StopAndResetCombat_BFE41		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFE5E		proc far

var_238		= word ptr -238h
var_1C0		= word ptr -1C0h
var_15F		= dword ptr -15Fh
var_15B		= dword ptr -15Bh
var_153		= word ptr -153h
var_14F		= dword ptr -14Fh
var_148		= word ptr -148h
var_EB		= dword ptr -0EBh
var_E7		= dword ptr -0E7h
var_E2		= word ptr -0E2h
var_81		= dword ptr -81h
var_7D		= dword ptr -7Dh
var_75		= word ptr -75h
var_71		= dword ptr -71h
var_6A		= word ptr -6Ah
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 238h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	1
		push	si
		nop
		push	cs
		call	near ptr Music_StopWithFade_C087A
		add	sp, 4
		mov	byte_79D64, 0
		mov	word_79D66, 0
		mov	word_79D68, 0
		mov	word_79D6A, 0
		mov	dword_79D6E, 0
		mov	dword_79D72, 0
		mov	byte_79D76, 0
		mov	word_79D77, 0FFFFh
		mov	word_79D79, 0FFFFh
		mov	dword_79D7B, 0
		mov	dword_79D7F, 0
		mov	word_79D83, 0FFFFh
		mov	word_79D85, 0
		mov	byte_79D87, 0
		mov	byte_79D88, 0
		mov	ax, [bp+arg_4]
		cmp	ax, word_79D83
		jnz	short loc_BFEEC
		cmp	[bp+arg_4], 0FFFFh
		jz	short loc_BFEEC
		jmp	loc_C0312

loc_BFEEC:
		push	ds
		push	offset aDat
		push	ds
		push	di
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		cmp	[bp+arg_4], 0FFFFh
		jnz	short loc_BFF1F
		push	0
		jmp	short loc_BFF24

loc_BFF1F:
		mov	ax, [bp+arg_4]
		dec	ax
		push	ax

loc_BFF24:
		lea	ax, [bp+var_E2]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	eax, [bp+var_7D]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_75]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_BFF4B
		mov	eax, [bp+var_81]
		jmp	short loc_BFF4F

loc_BFF4B:
		mov	eax, [bp+var_71]

loc_BFF4F:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_148], 508h
		mov	[bp+var_E7], 100h
		mov	[bp+var_EB], 0
		mov	[bp+var_148], 0E61h
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		mov	al, byte_79E66
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_BFFB3
		cmp	ax, 3
		jnz	short loc_BFFB8
		push	365Fh
		jmp	short loc_BFFBB

loc_BFFB3:
		push	3664h
		jmp	short loc_BFFBB

loc_BFFB8:
		push	3669h

loc_BFFBB:
		lea	ax, [bp+var_E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	ds
		push	di
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		cmp	word_79D83, 0FFFFh
		jz	short loc_BFFFB
		jmp	loc_C009C

loc_BFFFB:
		push	0
		lea	ax, [bp+var_1C0]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	eax, [bp+var_15B]
		mov	[bp+var_16], eax
		mov	ax, [bp+var_153]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C0026
		mov	eax, [bp+var_15F]
		jmp	short loc_C002B

loc_C0026:
		mov	eax, [bp+var_14F]

loc_C002B:
		mov	edx, [bp+var_16]
		add	edx, eax
		mov	[bp+var_1A], edx
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_1A]
		jnz	short loc_C0043
		jmp	loc_C00D7

loc_C0043:
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	0
		push	large [bp+var_1A]
		push	large [bp+var_16]
		lea	ax, [bp+var_1C0]
		push	ax
		lea	ax, [bp+var_238]
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		lea	ax, [bp+var_238]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_C0316
		add	sp, 6
		lea	ax, [bp+var_238]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_C0630
		add	sp, 4
		push	2
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		jmp	short loc_C00D7

loc_C009C:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_6B4F3
		add	sp, 6
		xor	di, di
		jmp	short loc_C00D1

loc_C00B0:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_6B4F3
		add	sp, 6
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_6B4F3
		add	sp, 6
		inc	di

loc_C00D1:
		cmp	di, word_79D85
		jl	short loc_C00B0

loc_C00D7:
		mov	ax, word_79D85
		cmp	ax, word_79D66
		jnz	short loc_C00E3
		jmp	loc_C0172

loc_C00E3:
		push	[bp+arg_4]
		lea	ax, [bp+var_1C0]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	eax, [bp+var_15B]
		mov	[bp+var_16], eax
		mov	ax, [bp+var_153]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C010F
		mov	eax, [bp+var_15F]
		jmp	short loc_C0114

loc_C010F:
		mov	eax, [bp+var_14F]

loc_C0114:
		mov	edx, [bp+var_16]
		add	edx, eax
		mov	[bp+var_1A], edx
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_1A]
		jz	short loc_C0172
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	0
		push	large [bp+var_1A]
		push	large [bp+var_16]
		lea	ax, [bp+var_1C0]
		push	ax
		lea	ax, [bp+var_238]
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		lea	ax, [bp+var_238]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_C04BE
		add	sp, 6
		push	2
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_C0172:
		mov	ax, word_79D66
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	8
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_79D81, dx
		mov	word ptr dword_79D7F, ax
		mov	dx, word_79D81
		cmp	dx, 9FFFh
		xor	di, di
		jmp	short loc_C020C

loc_C01A6:
		push	1
		push	8
		push	2
		movsx	eax, word_79D66
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 2
		les	si, word ptr dword_79D7F
		add	si, bx
		mov	es:[si+2], dx
		mov	es:[si], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, word ptr dword_79D7F
		add	bx, ax
		mov	dx, es:[bx+2]
		cmp	dx, 9FFFh
		push	large 0FFFFFFFFh
		movsx	eax, word_79D66
		push	eax
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr dword_79D7F
		add	bx, ax
		push	large es:[bx]
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		inc	di

loc_C020C:
		cmp	di, word_79D66
		jl	short loc_C01A6
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_6B4F3
		add	sp, 6
		mov	ah, 0
		mov	word_79D6A, ax
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	8
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_79D7D, dx
		mov	word ptr dword_79D7B, ax
		mov	dx, word_79D7D
		cmp	dx, 9FFFh
		xor	di, di
		jmp	short loc_C02D6

loc_C0258:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_6B4F3
		add	sp, 6
		mov	byte ptr [bp+var_16+3], al
		push	1
		push	8
		push	2
		mov	ah, 0
		inc	ax
		movsx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 2
		les	si, word ptr dword_79D7B
		add	si, bx
		mov	es:[si+2], dx
		mov	es:[si], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, word ptr dword_79D7B
		add	bx, ax
		mov	dx, es:[bx+2]
		cmp	dx, 9FFFh
		push	large 0FFFFFFFFh
		mov	al, byte ptr [bp+var_16+3]
		mov	ah, 0
		inc	ax
		movsx	eax, ax
		push	eax
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr dword_79D7B
		add	bx, ax
		push	large es:[bx]
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		inc	di

loc_C02D6:
		cmp	di, word_79D6A
		jge	short loc_C02DF
		jmp	loc_C0258

loc_C02DF:
		mov	ax, [bp+arg_4]
		mov	word_79D83, ax
		push	2
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	0
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	2
		lea	ax, [bp+var_E2]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_C0312:
		pop	di
		pop	si
		leave
		retf
sub_BFE5E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0316		proc far

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_4]
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_6B4F3
		add	sp, 6
		mov	ah, 0
		mov	word_79D66, ax
		push	1
		push	8
		push	2
		imul	ax, ax, 0Ch
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_79D70, dx
		mov	word ptr dword_79D6E, ax
		mov	[bp+var_1C], 0D7Ch
		mov	ax, word_7AFA2
		mov	[bp+var_1A], ax
		lea	ax, [bp+var_1C]
		mov	word_7AFA2, ax
		mov	[bp+var_1C], 0D84h
		mov	[bp+var_18], 0
		mov	[bp+var_14], 0
		mov	[bp+var_20], 0
		mov	[bp+var_1E], 0FFFFh
		push	word_79D6C
		lea	ax, [bp+var_20]
		push	ax
		call	sub_5C97F
		add	sp, 4
		mov	ax, [si+5Dh]
		dec	ax
		mov	word_79D85, ax
		xor	di, di
		jmp	loc_C0499

loc_C03A0:
		mov	ax, di
		inc	ax
		mov	[bp+var_6], ax
		mov	ax, di
		imul	ax, ax, 0Ch
		mov	dx, word_79D70
		mov	bx, word ptr dword_79D6E
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_6B4F3
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+0Ah], al
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_6B4F3
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+0Bh], al
		push	[bp+var_6]
		push	si
		call	sub_7844
		add	sp, 4
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C0402
		mov	eax, [si+61h]
		jmp	short loc_C0406

loc_C0402:
		mov	eax, [si+71h]

loc_C0406:
		mov	[bp+var_A], eax
		cmp	[bp+var_A], 0
		jnz	short loc_C0414
		jmp	loc_C0498

loc_C0414:
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		les	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_12]
		mov	es:[bx], eax
		mov	byte ptr es:[bx+4], 3
		mov	byte ptr es:[bx+5], 1
		mov	dword ptr es:[bx+6], 0
		mov	eax, [bp+var_E]
		mov	es:[bx+6], eax
		push	0
		mov	al, es:[bx+4]
		push	ax
		push	large es:[bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		push	si
		call	sub_75C8
		add	sp, 8
		push	0
		push	large [bp+var_4]
		lea	ax, [bp+var_20]
		push	ax
		call	sub_5CA19
		add	sp, 8
		lea	ax, [bp+var_20]
		push	ax
		call	Music_ChannelStopSequence_5C915
		pop	cx

loc_C0498:
		inc	di

loc_C0499:
		cmp	di, word_79D85
		jge	short loc_C04A2
		jmp	loc_C03A0

loc_C04A2:
		lea	ax, [bp+var_20]
		push	ax
		call	Music_ChannelStopSequence_5C915
		pop	cx
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_1CD03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C0316		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C04BE		proc far

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_4]
		mov	[bp+var_1C], 0D7Ch
		mov	ax, word_7AFA2
		mov	[bp+var_1A], ax
		lea	ax, [bp+var_1C]
		mov	word_7AFA2, ax
		mov	[bp+var_1C], 0D84h
		mov	[bp+var_18], 0
		mov	[bp+var_14], 0
		mov	[bp+var_20], 0
		mov	[bp+var_1E], 0FFFFh
		push	word_79D6C
		lea	ax, [bp+var_20]
		push	ax
		call	sub_5C97F
		add	sp, 4
		mov	di, word_79D85
		jmp	loc_C060B

loc_C050F:
		mov	ax, di
		sub	ax, word_79D85
		mov	[bp+var_6], ax
		mov	ax, di
		imul	ax, ax, 0Ch
		mov	dx, word_79D70
		mov	bx, word ptr dword_79D6E
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_6B4F3
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+0Ah], al
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_6B4F3
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+0Bh], al
		push	[bp+var_6]
		push	si
		call	sub_7844
		add	sp, 4
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C0574
		mov	eax, [si+61h]
		jmp	short loc_C0578

loc_C0574:
		mov	eax, [si+71h]

loc_C0578:
		mov	[bp+var_A], eax
		cmp	[bp+var_A], 0
		jnz	short loc_C0586
		jmp	loc_C060A

loc_C0586:
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		les	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_12]
		mov	es:[bx], eax
		mov	byte ptr es:[bx+4], 3
		mov	byte ptr es:[bx+5], 1
		mov	dword ptr es:[bx+6], 0
		mov	eax, [bp+var_E]
		mov	es:[bx+6], eax
		push	0
		mov	al, es:[bx+4]
		push	ax
		push	large es:[bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		push	si
		call	sub_75C8
		add	sp, 8
		push	0
		push	large [bp+var_4]
		lea	ax, [bp+var_20]
		push	ax
		call	sub_5CA19
		add	sp, 8
		lea	ax, [bp+var_20]
		push	ax
		call	Music_ChannelStopSequence_5C915
		pop	cx

loc_C060A:
		inc	di

loc_C060B:
		cmp	di, word_79D66
		jge	short loc_C0614
		jmp	loc_C050F

loc_C0614:
		lea	ax, [bp+var_20]
		push	ax
		call	Music_ChannelStopSequence_5C915
		pop	cx
		push	2
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_1CD03
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C04BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0630		proc far

var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= dword ptr -96h
var_92		= byte ptr -92h
var_90		= word ptr -90h
var_33		= word ptr -33h
var_2F		= dword ptr -2Fh
var_23		= word ptr -23h
var_1F		= dword ptr -1Fh
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 9Eh
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	0
		push	si
		call	sub_7844
		add	sp, 4
		mov	eax, [si+65h]
		mov	[bp+var_4], eax
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C0662
		mov	eax, [si+61h]
		jmp	short loc_C0666

loc_C0662:
		mov	eax, [si+71h]

loc_C0666:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		push	edx
		push	large [bp+var_4]
		push	si
		lea	ax, [bp+var_90]
		push	ax
		call	IndexedRecordReader_ConstructVariantC_7477
		add	sp, 0Ch
		mov	ax, [bp+var_33]
		mov	word_79D68, ax
		push	1
		push	8
		push	2
		imul	ax, ax, 0Ah
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_79D74, dx
		mov	word ptr dword_79D72, ax
		mov	[bp+var_9A], 0D7Ch
		mov	ax, word_7AFA2
		mov	[bp+var_98], ax
		lea	ax, [bp+var_9A]
		mov	word_7AFA2, ax
		mov	[bp+var_9A], 0D84h
		mov	[bp+var_96], 0
		mov	[bp+var_92], 0
		mov	[bp+var_9E], 0
		mov	[bp+var_9C], 0FFFFh
		push	word_79D6C
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_5C97F
		add	sp, 4
		xor	si, si
		jmp	loc_C07C5

loc_C06F6:
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, word_79D74
		mov	bx, word ptr dword_79D72
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		push	si
		lea	ax, [bp+var_90]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	ax, [bp+var_23]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C072A
		mov	eax, [bp+var_2F]
		jmp	short loc_C072E

loc_C072A:
		mov	eax, [bp+var_1F]

loc_C072E:
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 0
		jnz	short loc_C073C
		jmp	loc_C07C4

loc_C073C:
		mov	[bp+var_14], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		les	bx, word ptr [bp+var_C]
		mov	eax, [bp+var_18]
		mov	es:[bx], eax
		mov	byte ptr es:[bx+4], 3
		mov	byte ptr es:[bx+5], 1
		mov	dword ptr es:[bx+6], 0
		mov	eax, [bp+var_14]
		mov	es:[bx+6], eax
		push	0
		mov	al, es:[bx+4]
		push	ax
		push	large es:[bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		lea	ax, [bp+var_90]
		push	ax
		call	sub_75C8
		add	sp, 8
		push	0
		push	large [bp+var_C]
		lea	ax, [bp+var_9E]
		push	ax
		call	sub_5CA19
		add	sp, 8
		lea	ax, [bp+var_9E]
		push	ax
		call	Music_ChannelStopSequence_5C915
		pop	cx

loc_C07C4:
		inc	si

loc_C07C5:
		cmp	si, word_79D68
		jge	short loc_C07CE
		jmp	loc_C06F6

loc_C07CE:
		lea	ax, [bp+var_9E]
		push	ax
		call	Music_ChannelStopSequence_5C915
		pop	cx
		push	2
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_1CD03
		add	sp, 4
		push	2
		lea	ax, [bp+var_90]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		pop	si
		leave
		retf
sub_C0630		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C07FA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_7D06D, 0
		jz	short loc_C081C
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DBFB
		add	sp, 4
		jmp	short loc_C081C

loc_C081C:
		cmp	word_7D07F, 0
		jz	short loc_C0838
		push	word_7D081
		mov	bx, word_7D07F
		push	word ptr [bx+4]
		call	sub_1DBFB
		add	sp, 4
		jmp	short loc_C0838

loc_C0838:
		pop	bp
		retf
sub_C07FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C083A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_7D06D, 0
		jz	short loc_C085C
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC01
		add	sp, 4
		jmp	short loc_C085C

loc_C085C:
		cmp	word_7D07F, 0
		jz	short loc_C0878
		push	word_7D081
		mov	bx, word_7D07F
		push	word ptr [bx+4]
		call	sub_1DC01
		add	sp, 4
		jmp	short loc_C0878

loc_C0878:
		pop	bp
		retf
sub_C083A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Music_StopWithFade_AB1EF (sub_AB1EF de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'AudioQueue_ProcessSequencerSlots_AB1EF'. far. LUE 2026-10-06. (musique, fondu) : piste
; demandee = 0xFFFF, canal de transition arrete ; si fondu et piste principale en cours :
; AIL_set_relative_volume_603F0(0, 1000 ms) puis attente active jusqu'a volume nul
; (AIL_relative_volume_603E4) ; arrete le canal principal.
; ==============================================================================================
Music_StopWithFade_C087A		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_79D77, 0FFFFh
		mov	byte_79D76, 0
		push	694Fh
		call	Music_ChannelStopSequence_5C915
		pop	cx
		cmp	[bp+arg_2], 0
		jnz	short loc_C089D
		jmp	loc_C093D

loc_C089D:
		cmp	word_7D06D, 0
		jz	short loc_C08C5
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_C08C1
		mov	ax, 1
		jmp	short loc_C08C3

loc_C08C1:
		xor	ax, ax

loc_C08C3:
		jmp	short loc_C08C7

loc_C08C5:
		mov	al, 0

loc_C08C7:
		or	al, al
		jz	short loc_C093D
		cmp	word_7D06D, 0
		jz	short loc_C08ED
		push	large 3E80000h
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC19
		add	sp, 8
		jmp	short loc_C08ED

loc_C08ED:
		cmp	word_7D06D, 0
		jz	short loc_C0915
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_C0911
		mov	ax, 1
		jmp	short loc_C0913

loc_C0911:
		xor	ax, ax

loc_C0913:
		jmp	short loc_C0917

loc_C0915:
		mov	al, 0

loc_C0917:
		or	al, al
		jz	short loc_C093D
		cmp	word_7D06D, 0
		jz	short loc_C0937
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC0D
		add	sp, 4
		jmp	short loc_C0939

loc_C0937:
		xor	ax, ax

loc_C0939:
		or	ax, ax
		jnz	short loc_C08ED

loc_C093D:
		push	693Dh
		call	Music_ChannelStopSequence_5C915
		pop	cx
		pop	bp
		retf
Music_StopWithFade_C087A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0948		proc far

var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	ax, [bp+arg_0]
		push	1
		push	ax
		push	cs
		call	near ptr Music_StopWithFade_C087A
		add	sp, 4
		xor	si, si
		jmp	short loc_C09A2

loc_C0960:
		push	0
		push	2
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr dword_79D7F
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr dword_79D7F
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0
		inc	si

loc_C09A2:
		cmp	si, word_79D66
		jl	short loc_C0960
		push	0
		push	2
		push	364Fh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword_79D7F, 0
		xor	si, si
		jmp	short loc_C0A09

loc_C09C7:
		push	0
		push	2
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr dword_79D7B
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		lea	ax, [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr dword_79D7B
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0
		inc	si

loc_C0A09:
		cmp	si, word_79D6A
		jl	short loc_C09C7
		push	0
		push	2
		push	364Bh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword_79D7B, 0
		xor	si, si
		jmp	loc_C0AEB

loc_C0A2F:
		mov	ax, si
		imul	ax, ax, 0Ch
		les	bx, word ptr dword_79D6E
		add	bx, ax
		cmp	byte ptr es:[bx+5], 0
		jz	short loc_C0A90
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word ptr dword_79D6E
		add	bx, ax
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_C0A90
		push	0
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word ptr dword_79D6E
		add	bx, ax
		mov	al, es:[bx+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word ptr dword_79D6E
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		lea	ax, [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C0A90

loc_C0A90:
		mov	ax, si
		imul	ax, ax, 0Ch
		les	bx, word ptr dword_79D6E
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word ptr dword_79D6E
		add	bx, ax
		mov	byte ptr es:[bx+5], 0
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word ptr dword_79D6E
		add	bx, ax
		mov	dword ptr es:[bx+6], 0
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word ptr dword_79D6E
		add	bx, ax
		mov	al, 0
		mov	es:[bx+0Bh], al
		mov	dx, si
		imul	dx, dx, 0Ch
		mov	bx, word ptr dword_79D6E
		add	bx, dx
		mov	es:[bx+0Ah], al
		inc	si

loc_C0AEB:
		cmp	si, word_79D66
		jge	short loc_C0AF4
		jmp	loc_C0A2F

loc_C0AF4:
		xor	si, si
		jmp	short loc_C0B58

loc_C0AF8:
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, word_79D74
		mov	bx, word ptr dword_79D72
		add	bx, ax
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		mov	es, [bp+var_E]
		cmp	byte ptr es:[bx+5], 0
		jz	short loc_C0B3E
		cmp	dword ptr es:[bx], 0
		jz	short loc_C0B3E
		push	0
		mov	al, es:[bx+4]
		push	ax
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C0B3E

loc_C0B3E:
		les	bx, [bp+var_10]
		mov	dword ptr es:[bx], 0
		mov	byte ptr es:[bx+5], 0
		mov	dword ptr es:[bx+6], 0
		inc	si

loc_C0B58:
		cmp	si, word_79D68
		jl	short loc_C0AF8
		cmp	dword_79D72, 0
		jz	short loc_C0B81
		push	0
		push	2
		push	3642h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword_79D72, 0

loc_C0B81:
		cmp	dword_79D6E, 0
		jz	short loc_C0BA4
		push	0
		push	2
		push	363Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword_79D6E, 0

loc_C0BA4:
		pop	si
		leave
		retf
sub_C0948		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0BA7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_79D65, 0
		jz	short loc_C0BD2
		mov	byte_79D65, 0
		push	1
		push	si
		push	cs
		call	near ptr Music_StopWithFade_C087A
		add	sp, 4
		push	word ptr [si+4]
		push	6C8Eh
		call	Stopwatch_UnregisterTickModule_6F7DE
		add	sp, 4

loc_C0BD2:
		pop	si
		pop	bp
		retf
sub_C0BA7		endp
ovr346		ends
