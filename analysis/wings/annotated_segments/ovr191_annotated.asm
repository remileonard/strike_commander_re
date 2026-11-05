ovr191		segment	para public 'OVERLAY' use16
		assume cs:ovr191
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_RegisterTickModule_BFE20 (sub_BFE20 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
AudioQueue_RegisterTickModule_6CF30		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 14h
		push	seg seg039
		push	offset sub_1B71C
		push	693Ch
		call	Stopwatch_RegisterTickModuleVariant_561DD
		add	sp, 0Ah
		mov	[si+4], ax
		pop	si
		pop	bp
		retf
AudioQueue_RegisterTickModule_6CF30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6CF51		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	1
		push	ax
		nop
		push	cs
		call	near ptr Music_StopWithFade_6D944
		add	sp, 4
		pop	bp
		retf
sub_6CF51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6CF64		proc far

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
		call	near ptr Music_StopWithFade_6D944
		add	sp, 4
		mov	ax, [bp+arg_4]
		cmp	ax, word_5B78D
		jnz	short loc_6CF90
		cmp	[bp+arg_4], 0FFFFh
		jz	short loc_6CF90
		jmp	loc_6D45A

loc_6CF90:
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_ReleaseAllSlots_6DA12
		pop	cx
		push	ds
		push	offset aDat
		push	ds
		push	di
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		cmp	[bp+arg_4], 0FFFFh
		jnz	short loc_6CFCA
		push	0
		jmp	short loc_6CFCF

loc_6CFCA:
		mov	ax, [bp+arg_4]
		dec	ax
		push	ax

loc_6CFCF:
		lea	ax, [bp+var_E2]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_7D]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_75]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_6CFF6
		mov	eax, [bp+var_81]
		jmp	short loc_6CFFA

loc_6CFF6:
		mov	eax, [bp+var_71]

loc_6CFFA:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_148], 9B5h
		mov	[bp+var_E7], 100h
		mov	[bp+var_EB], 0
		mov	[bp+var_148], 0B2Ch
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		mov	al, byte_5CF9C
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_6D05E
		cmp	ax, 3
		jnz	short loc_6D063
		push	1A89h
		jmp	short loc_6D066

loc_6D05E:
		push	1A8Eh
		jmp	short loc_6D066

loc_6D063:
		push	1A93h

loc_6D066:
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
		call	sub_1F0C4
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		cmp	word_5B78D, 0FFFFh
		jz	short loc_6D0A6
		jmp	loc_6D147

loc_6D0A6:
		push	0
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_15B]
		mov	[bp+var_16], eax
		mov	ax, [bp+var_153]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_6D0D1
		mov	eax, [bp+var_15F]
		jmp	short loc_6D0D6

loc_6D0D1:
		mov	eax, [bp+var_14F]

loc_6D0D6:
		mov	edx, [bp+var_16]
		add	edx, eax
		mov	[bp+var_1A], edx
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_1A]
		jnz	short loc_6D0EE
		jmp	loc_6D182

loc_6D0EE:
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	0
		push	large [bp+var_1A]
		push	large [bp+var_16]
		lea	ax, [bp+var_1C0]
		push	ax
		lea	ax, [bp+var_238]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		lea	ax, [bp+var_238]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_6D45E
		add	sp, 6
		lea	ax, [bp+var_238]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_6D760
		add	sp, 4
		push	2
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		jmp	short loc_6D182

loc_6D147:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		xor	di, di
		jmp	short loc_6D17C

loc_6D15B:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		inc	di

loc_6D17C:
		cmp	di, word_5B78F
		jl	short loc_6D15B

loc_6D182:
		mov	ax, word_5B78F
		cmp	ax, word_5B776
		jnz	short loc_6D18E
		jmp	loc_6D21D

loc_6D18E:
		push	[bp+arg_4]
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_15B]
		mov	[bp+var_16], eax
		mov	ax, [bp+var_153]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_6D1BA
		mov	eax, [bp+var_15F]
		jmp	short loc_6D1BF

loc_6D1BA:
		mov	eax, [bp+var_14F]

loc_6D1BF:
		mov	edx, [bp+var_16]
		add	edx, eax
		mov	[bp+var_1A], edx
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_1A]
		jz	short loc_6D21D
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	0
		push	large [bp+var_1A]
		push	large [bp+var_16]
		lea	ax, [bp+var_1C0]
		push	ax
		lea	ax, [bp+var_238]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		lea	ax, [bp+var_238]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_6D5F7
		add	sp, 6
		push	2
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_6D21D:
		mov	ax, word_5B776
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	8
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word_5B78B, dx
		mov	word ptr dword_5B789, ax
		mov	dx, word_5B78B
		cmp	dx, 9FFFh
		jbe	short loc_6D258
		push	0D400h
		call	sub_9D47
		pop	cx

loc_6D258:
		cmp	dword_5B789, 0
		jnz	short loc_6D26D
		push	1
		push	1A72h
		call	sub_9D78
		add	sp, 4

loc_6D26D:
		xor	di, di
		jmp	loc_6D304

loc_6D272:
		push	1
		push	8
		push	2
		movsx	eax, word_5B776
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 2
		les	si, word ptr dword_5B789
		add	si, bx
		mov	es:[si+2], dx
		mov	es:[si], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, word ptr dword_5B789
		add	bx, ax
		mov	dx, es:[bx+2]
		cmp	dx, 9FFFh
		jbe	short loc_6D2BB
		push	0D401h
		call	sub_9D47
		pop	cx

loc_6D2BB:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr dword_5B789
		add	bx, ax
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jnz	short loc_6D2DC
		push	2
		push	1A72h
		call	sub_9D78
		add	sp, 4

loc_6D2DC:
		push	large 0FFFFFFFFh
		movsx	eax, word_5B776
		push	eax
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr dword_5B789
		add	bx, ax
		push	large es:[bx]
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		inc	di

loc_6D304:
		cmp	di, word_5B776
		jge	short loc_6D30D
		jmp	loc_6D272

loc_6D30D:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	ah, 0
		mov	word_5B77A, ax
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	8
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word_5B787, dx
		mov	word ptr dword_5B785, ax
		mov	dx, word_5B787
		cmp	dx, 9FFFh
		jbe	short loc_6D35A
		push	0D402h
		call	sub_9D47
		pop	cx

loc_6D35A:
		cmp	dword_5B785, 0
		jnz	short loc_6D36F
		push	3
		push	1A72h
		call	sub_9D78
		add	sp, 4

loc_6D36F:
		xor	di, di
		jmp	loc_6D41E

loc_6D374:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	byte ptr [bp+var_16+3], al
		push	1
		push	8
		push	2
		mov	ah, 0
		inc	ax
		movsx	eax, ax
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 2
		les	si, word ptr dword_5B785
		add	si, bx
		mov	es:[si+2], dx
		mov	es:[si], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, word ptr dword_5B785
		add	bx, ax
		mov	dx, es:[bx+2]
		cmp	dx, 9FFFh
		jbe	short loc_6D3D1
		push	0D403h
		call	sub_9D47
		pop	cx

loc_6D3D1:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr dword_5B785
		add	bx, ax
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jnz	short loc_6D3F2
		push	4
		push	1A72h
		call	sub_9D78
		add	sp, 4

loc_6D3F2:
		push	large 0FFFFFFFFh
		mov	al, byte ptr [bp+var_16+3]
		mov	ah, 0
		inc	ax
		movsx	eax, ax
		push	eax
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr dword_5B785
		add	bx, ax
		push	large es:[bx]
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		inc	di

loc_6D41E:
		cmp	di, word_5B77A
		jge	short loc_6D427
		jmp	loc_6D374

loc_6D427:
		mov	ax, [bp+arg_4]
		mov	word_5B78D, ax
		push	2
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	0
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		push	2
		lea	ax, [bp+var_E2]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_6D45A:
		pop	di
		pop	si
		leave
		retf
sub_6CF64		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D45E		proc far

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	ah, 0
		mov	word_5B776, ax
		push	seg stub191
		push	offset sub_58C45
		push	11h
		push	ax
		push	large 0C0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word_5B77E, ax
		mov	[bp+var_1A], 96Dh
		mov	ax, word_5DD68
		mov	[bp+var_18], ax
		lea	ax, [bp+var_1A]
		mov	word_5DD68, ax
		mov	[bp+var_1A], 975h
		mov	[bp+var_16], 0
		mov	[bp+var_12], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0FFFFh
		push	word_5B77C
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_1A714
		add	sp, 4
		mov	ax, [di+5Dh]
		dec	ax
		mov	word_5B78F, ax
		mov	[bp+var_2], 0
		jmp	loc_6D5CF

loc_6D4E4:
		mov	ax, [bp+var_2]
		inc	ax
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		mov	si, word_5B77E
		add	si, ax
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	[si+0Ah], al
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	[si+0Bh], al
		push	[bp+var_4]
		push	di
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_6D536
		mov	eax, [di+61h]
		jmp	short loc_6D53A

loc_6D536:
		mov	eax, [di+71h]

loc_6D53A:
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_6D548
		jmp	loc_6D5CC

loc_6D548:
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_C]
		mov	[si+6], eax
		cmp	byte ptr [si+4], 3
		jnz	short loc_6D5A0
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6D5A5

loc_6D5A0:
		mov	dx, [si+2]
		mov	ax, [si]

loc_6D5A5:
		push	dx
		push	ax
		push	[bp+var_4]
		push	di
		call	sub_54A85
		add	sp, 8
		push	0
		push	si
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_1A769
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx

loc_6D5CC:
		inc	[bp+var_2]

loc_6D5CF:
		mov	ax, [bp+var_2]
		cmp	ax, word_5B78F
		jge	short loc_6D5DB
		jmp	loc_6D4E4

loc_6D5DB:
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_19116
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_6D45E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D5F7		proc far

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_1A], 96Dh
		mov	ax, word_5DD68
		mov	[bp+var_18], ax
		lea	ax, [bp+var_1A]
		mov	word_5DD68, ax
		mov	[bp+var_1A], 975h
		mov	[bp+var_16], 0
		mov	[bp+var_12], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0FFFFh
		push	word_5B77C
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_1A714
		add	sp, 4
		mov	ax, word_5B78F
		mov	[bp+var_2], ax
		jmp	loc_6D738

loc_6D64A:
		mov	ax, [bp+var_2]
		sub	ax, word_5B78F
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		imul	ax, ax, 0Ch
		mov	si, word_5B77E
		add	si, ax
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	[si+0Ah], al
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_51CE7
		add	sp, 6
		mov	[si+0Bh], al
		push	[bp+var_4]
		push	di
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_6D69F
		mov	eax, [di+61h]
		jmp	short loc_6D6A3

loc_6D69F:
		mov	eax, [di+71h]

loc_6D6A3:
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_6D6B1
		jmp	loc_6D735

loc_6D6B1:
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_C]
		mov	[si+6], eax
		cmp	byte ptr [si+4], 3
		jnz	short loc_6D709
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6D70E

loc_6D709:
		mov	dx, [si+2]
		mov	ax, [si]

loc_6D70E:
		push	dx
		push	ax
		push	[bp+var_4]
		push	di
		call	sub_54A85
		add	sp, 8
		push	0
		push	si
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_1A769
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx

loc_6D735:
		inc	[bp+var_2]

loc_6D738:
		mov	ax, [bp+var_2]
		cmp	ax, word_5B776
		jge	short loc_6D744
		jmp	loc_6D64A

loc_6D744:
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_19116
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_6D5F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D760		proc far

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	0
		push	si
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_6D789
		mov	eax, [si+61h]
		jmp	short loc_6D78D

loc_6D789:
		mov	eax, [si+71h]

loc_6D78D:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_6D79B
		jmp	loc_6D8C1

loc_6D79B:
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	dword_5FE0A, eax
		mov	byte_5FE0E, 3
		mov	byte_5FE0F, 1
		mov	dword_5FE10, 0
		mov	eax, [bp+var_8]
		mov	dword_5FE10, eax
		cmp	byte_5FE0E, 3
		jnz	short loc_6D7FA
		push	0
		mov	al, byte_5FE0E
		push	ax
		push	large dword_5FE0A
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6D802

loc_6D7FA:
		mov	edx, dword_5FE0C
		mov	ax, word ptr dword_5FE0A

loc_6D802:
		push	dx
		push	ax
		push	0
		push	si
		call	sub_54A85
		add	sp, 8
		cmp	byte_5FE0E, 3
		jnz	short loc_6D82E
		push	0
		mov	al, byte_5FE0E
		push	ax
		push	large dword_5FE0A
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6D836

loc_6D82E:
		mov	edx, dword_5FE0C
		mov	ax, word ptr dword_5FE0A

loc_6D836:
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		les	bx, [bp+var_10]
		mov	al, es:[bx+14h]
		mov	ah, 0
		mov	word_5B778, ax
		mov	[bp+var_1A], 96Dh
		mov	ax, word_5DD68
		mov	[bp+var_18], ax
		lea	ax, [bp+var_1A]
		mov	word_5DD68, ax
		mov	[bp+var_1A], 975h
		mov	[bp+var_16], 0
		mov	[bp+var_12], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0FFFFh
		push	word_5B77C
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_1A714
		add	sp, 4
		xor	si, si
		jmp	short loc_6D8A3

loc_6D888:
		push	si
		push	60EAh
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_1A769
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		inc	si

loc_6D8A3:
		cmp	si, word_5B778
		jl	short loc_6D888
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_19116
		add	sp, 4

loc_6D8C1:
		pop	si
		leave
		retf
sub_6D760		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D8C4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_5FE17, 0
		jz	short loc_6D8E6
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CC3
		add	sp, 4
		jmp	short loc_6D8E6

loc_6D8E6:
		cmp	word_5FE29, 0
		jz	short loc_6D902
		push	word_5FE2B
		mov	bx, word_5FE29
		push	word ptr [bx+4]
		call	sub_9CC3
		add	sp, 4
		jmp	short loc_6D902

loc_6D902:
		pop	bp
		retf
sub_6D8C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D904		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_5FE17, 0
		jz	short loc_6D926
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CC9
		add	sp, 4
		jmp	short loc_6D926

loc_6D926:
		cmp	word_5FE29, 0
		jz	short loc_6D942
		push	word_5FE2B
		mov	bx, word_5FE29
		push	word ptr [bx+4]
		call	sub_9CC9
		add	sp, 4
		jmp	short loc_6D942

loc_6D942:
		pop	bp
		retf
sub_6D904		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Music_StopWithFade_C087A (sub_C087A de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Music_StopWithFade_AB1EF (sub_AB1EF de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'AudioQueue_ProcessSequencerSlots_AB1EF'. far. LUE 2026-10-06. (musique, fondu) : piste
; demandee = 0xFFFF, canal de transition arrete ; si fondu et piste principale en cours :
; AIL_set_relative_volume_603F0(0, 1000 ms) puis attente active jusqu'a volume nul
; (AIL_relative_volume_603E4) ; arrete le canal principal.
; ==============================================================================================
Music_StopWithFade_6D944		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_5B781, 0FFFFh
		mov	byte_5B780, 0
		push	6109h
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		cmp	[bp+arg_2], 0
		jnz	short loc_6D967
		jmp	loc_6DA07

loc_6D967:
		cmp	word_5FE17, 0
		jz	short loc_6D98F
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_6D98B
		mov	ax, 1
		jmp	short loc_6D98D

loc_6D98B:
		xor	ax, ax

loc_6D98D:
		jmp	short loc_6D991

loc_6D98F:
		mov	al, 0

loc_6D991:
		or	al, al
		jz	short loc_6DA07
		cmp	word_5FE17, 0
		jz	short loc_6D9B7
		push	large 3E80000h
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CE1
		add	sp, 8
		jmp	short loc_6D9B7

loc_6D9B7:
		cmp	word_5FE17, 0
		jz	short loc_6D9DF
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_6D9DB
		mov	ax, 1
		jmp	short loc_6D9DD

loc_6D9DB:
		xor	ax, ax

loc_6D9DD:
		jmp	short loc_6D9E1

loc_6D9DF:
		mov	al, 0

loc_6D9E1:
		or	al, al
		jz	short loc_6DA07
		cmp	word_5FE17, 0
		jz	short loc_6DA01
		push	word_5FE19
		mov	bx, word_5FE17
		push	word ptr [bx+4]
		call	sub_9CD5
		add	sp, 4
		jmp	short loc_6DA03

loc_6DA01:
		xor	ax, ax

loc_6DA03:
		or	ax, ax
		jnz	short loc_6D9B7

loc_6DA07:
		push	60F7h
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		pop	bp
		retf
Music_StopWithFade_6D944		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 21 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_ReleaseAllSlots_AB2BD (sub_AB2BD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 188 lignes, NON DÉTAILLÉE — libère massivement des ressources typées (Memory_TypedFree_5C7B6
; ×5+) — nettoyage complet de la file audio/message.
; ==============================================================================================
AudioQueue_ReleaseAllSlots_6DA12		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	ax, [bp+arg_0]
		xor	si, si
		jmp	short loc_6DA62

loc_6DA20:
		push	0
		push	2
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr dword_5B789
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr dword_5B789
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0
		inc	si

loc_6DA62:
		cmp	si, word_5B776
		jl	short loc_6DA20
		push	0
		push	2
		push	1A69h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	dword_5B789, 0
		xor	si, si
		jmp	short loc_6DAC9

loc_6DA87:
		push	0
		push	2
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr dword_5B785
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		lea	ax, [bp+var_8]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr dword_5B785
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0
		inc	si

loc_6DAC9:
		cmp	si, word_5B77A
		jl	short loc_6DA87
		push	0
		push	2
		push	1A65h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	dword_5B785, 0
		mov	si, word_5B78F
		jmp	loc_6DB93

loc_6DAF1:
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word_5B77E
		add	bx, ax
		cmp	byte ptr [bx+5], 0
		jz	short loc_6DB3E
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word_5B77E
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_6DB3E
		push	0
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word_5B77E
		add	bx, ax
		mov	al, [bx+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	dx, word_5B77E
		add	dx, ax
		push	dx
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6DB3E

loc_6DB3E:
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word_5B77E
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word_5B77E
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word_5B77E
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, si
		imul	ax, ax, 0Ch
		mov	bx, word_5B77E
		add	bx, ax
		mov	al, 0
		mov	[bx+0Bh], al
		mov	dx, si
		imul	dx, dx, 0Ch
		mov	bx, word_5B77E
		add	bx, dx
		mov	[bx+0Ah], al
		inc	si

loc_6DB93:
		cmp	si, word_5B776
		jge	short loc_6DB9C
		jmp	loc_6DAF1

loc_6DB9C:
		pop	si
		leave
		retf
AudioQueue_ReleaseAllSlots_6DA12		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DB9F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_5B775, 0
		jz	short loc_6DBF0
		mov	byte_5B775, 0
		push	1
		push	si
		push	cs
		call	near ptr Music_StopWithFade_6D944
		add	sp, 4
		push	word ptr [si+4]
		push	693Ch
		call	Stopwatch_UnregisterTickModule_5621A
		add	sp, 4
		push	si
		push	cs
		call	near ptr AudioQueue_ReleaseAllSlots_6DA12
		pop	cx
		push	seg stub191
		push	offset sub_58C40
		push	large 190000h
		push	0Ch
		push	word_5B77E
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	word_5B77E, 0

loc_6DBF0:
		pop	si
		pop	bp
		retf
sub_6DB9F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à AudioQueue_Helper_AB4BE
; (sub_AB4BE de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (17 lignes).
; ==============================================================================================
AudioQueue_Helper_6DBF3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		mov	ax, si
		pop	si
		pop	bp
		retf
AudioQueue_Helper_6DBF3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_ReleaseAndDestruct_AB4E1 (sub_AB4E1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6 et libération de l'objet (sub_338).
; ==============================================================================================
AudioQueue_ReleaseAndDestruct_6DC16		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6DC67
		cmp	byte ptr [si+5], 0
		jz	short loc_6DC45
		cmp	dword ptr [si], 0
		jz	short loc_6DC45
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6DC45

loc_6DC45:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_6DC67
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_6DC67

loc_6DC67:
		pop	di
		pop	si
		pop	bp
		retf
AudioQueue_ReleaseAndDestruct_6DC16		endp
ovr191		ends
