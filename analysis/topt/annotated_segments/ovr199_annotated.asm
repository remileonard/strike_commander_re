ovr199		segment	para public 'OVERLAY' use16
		assume cs:ovr199
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
AudioQueue_RegisterTickModule_68480		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 14h
		push	seg seg024
		push	offset sub_D351
		push	6D9Ch
		call	Stopwatch_RegisterTickModuleVariant_44C84
		add	sp, 0Ah
		mov	[si+4], ax
		pop	si
		pop	bp
		retf
AudioQueue_RegisterTickModule_68480		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_684A1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	si
		nop
		push	cs
		call	near ptr sub_68EFF
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_684A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_684B6		proc far

var_23C		= word ptr -23Ch
var_1C4		= word ptr -1C4h
var_163		= dword ptr -163h
var_15F		= dword ptr -15Fh
var_157		= word ptr -157h
var_153		= dword ptr -153h
var_14C		= word ptr -14Ch
var_EF		= dword ptr -0EFh
var_EB		= dword ptr -0EBh
var_E6		= word ptr -0E6h
var_85		= dword ptr -85h
var_81		= dword ptr -81h
var_79		= word ptr -79h
var_75		= dword ptr -75h
var_6E		= word ptr -6Eh
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 23Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	1
		push	di
		nop
		push	cs
		call	near ptr sub_68EFF
		add	sp, 4
		mov	ax, [bp+arg_4]
		cmp	ax, word_4A699
		jnz	short loc_684DF
		cmp	[bp+arg_4], 0FFFFh
		jz	short loc_684DF
		jmp	loc_6897C

loc_684DF:
		push	di
		nop
		push	cs
		call	near ptr sub_68FD4
		add	sp, 2
		push	ds
		push	offset aDat
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_11166
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		cmp	[bp+arg_4], 0FFFFh
		jnz	short loc_6852A
		push	0
		lea	ax, [bp+var_E6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		jmp	short loc_6853C

loc_6852A:
		mov	ax, [bp+arg_4]
		dec	ax
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4

loc_6853C:
		mov	eax, [bp+var_81]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_79]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_68557
		mov	eax, [bp+var_85]
		jmp	short loc_6855B

loc_68557:
		mov	eax, [bp+var_75]

loc_6855B:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_14C], 480h
		mov	[bp+var_EB], 100h
		mov	[bp+var_EF], 0
		mov	[bp+var_14C], 5BDh
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	sub_40FBE
		add	sp, 0Eh
		mov	al, byte_4CA58
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_685CF
		cmp	ax, 3
		jz	short loc_685BE
		jmp	short loc_685E0

loc_685BE:
		push	1CC3h
		lea	ax, [bp+var_E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_685F1

loc_685CF:
		push	1CC8h
		lea	ax, [bp+var_E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_685F1

loc_685E0:
		push	1CCDh
		lea	ax, [bp+var_E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_685F1

loc_685F1:
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_11166
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_1C4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		cmp	word_4A699, 0FFFFh
		jz	short loc_68627
		jmp	loc_686C7

loc_68627:
		push	0
		lea	ax, [bp+var_1C4]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	eax, [bp+var_15F]
		mov	[bp+var_1A], eax
		mov	ax, [bp+var_157]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_68652
		mov	eax, [bp+var_163]
		jmp	short loc_68657

loc_68652:
		mov	eax, [bp+var_153]

loc_68657:
		mov	edx, [bp+var_1A]
		add	edx, eax
		mov	[bp+var_1E], edx
		mov	eax, [bp+var_1A]
		cmp	eax, [bp+var_1E]
		jz	short loc_686C5
		lea	ax, [bp+var_23C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		push	0
		push	large [bp+var_1E]
		push	large [bp+var_1A]
		lea	ax, [bp+var_1C4]
		push	ax
		lea	ax, [bp+var_23C]
		push	ax
		call	sub_40FBE
		add	sp, 0Eh
		lea	ax, [bp+var_23C]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		push	di
		nop
		push	cs
		call	near ptr sub_68980
		add	sp, 6
		lea	ax, [bp+var_23C]
		push	ax
		push	di
		nop
		push	cs
		call	near ptr sub_68CA0
		add	sp, 4
		push	2
		lea	ax, [bp+var_23C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_686C5:
		jmp	short loc_68702

loc_686C7:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_14C]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		xor	si, si
		jmp	short loc_686FC

loc_686DB:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_14C]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_14C]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		inc	si

loc_686FC:
		cmp	si, word_4A69B
		jl	short loc_686DB

loc_68702:
		mov	ax, word_4A69B
		cmp	ax, word_4A680
		jnz	short loc_6870E
		jmp	loc_6879F

loc_6870E:
		push	[bp+arg_4]
		lea	ax, [bp+var_1C4]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	eax, [bp+var_15F]
		mov	[bp+var_1A], eax
		mov	ax, [bp+var_157]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_6873A
		mov	eax, [bp+var_163]
		jmp	short loc_6873F

loc_6873A:
		mov	eax, [bp+var_153]

loc_6873F:
		mov	edx, [bp+var_1A]
		add	edx, eax
		mov	[bp+var_1E], edx
		mov	eax, [bp+var_1A]
		cmp	eax, [bp+var_1E]
		jz	short loc_6879F
		lea	ax, [bp+var_23C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		push	0
		push	large [bp+var_1E]
		push	large [bp+var_1A]
		lea	ax, [bp+var_1C4]
		push	ax
		lea	ax, [bp+var_23C]
		push	ax
		call	sub_40FBE
		add	sp, 0Eh
		lea	ax, [bp+var_23C]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		push	di
		nop
		push	cs
		call	near ptr sub_68B2A
		add	sp, 6
		push	2
		lea	ax, [bp+var_23C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_6879F:
		mov	ax, word_4A680
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	8
		push	2
		push	large [bp+var_12]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word_4A697, dx
		mov	word_4A695, ax
		mov	ax, word_4A697
		mov	[bp+var_14], ax
		cmp	[bp+var_14], 9FFFh
		jbe	short loc_687D6

loc_687D6:
		mov	[bp+var_16], 0
		jmp	short loc_68851

loc_687DD:
		push	1
		push	8
		push	2
		movsx	eax, word_4A680
		push	eax
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	bx, [bp+var_16]
		shl	bx, 2
		les	si, word_4A695
		add	si, bx
		mov	es:[si+2], dx
		mov	es:[si], ax
		mov	ax, [bp+var_16]
		shl	ax, 2
		les	bx, word_4A695
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	[bp+var_14], ax
		cmp	[bp+var_14], 9FFFh
		jbe	short loc_68823

loc_68823:
		push	large 0FFFFFFFFh
		movsx	eax, word_4A680
		push	eax
		mov	ax, [bp+var_16]
		shl	ax, 2
		les	bx, word_4A695
		add	bx, ax
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		inc	[bp+var_16]

loc_68851:
		mov	ax, [bp+var_16]
		cmp	ax, word_4A680
		jl	short loc_687DD
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_14C]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	ah, 0
		mov	word_4A684, ax
		mov	ax, word_4A684
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	8
		push	2
		push	large [bp+var_12]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word_4A693, dx
		mov	word_4A691, ax
		mov	ax, word_4A693
		mov	[bp+var_14], ax
		cmp	[bp+var_14], 9FFFh
		jbe	short loc_688A6

loc_688A6:
		mov	[bp+var_16], 0
		jmp	loc_6893D

loc_688AE:
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_14C]
		push	ax
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	byte ptr [bp+var_1A+3], al
		push	1
		push	8
		push	2
		mov	al, byte ptr [bp+var_1A+3]
		mov	ah, 0
		inc	ax
		movsx	eax, ax
		push	eax
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	bx, [bp+var_16]
		shl	bx, 2
		les	si, word_4A691
		add	si, bx
		mov	es:[si+2], dx
		mov	es:[si], ax
		mov	ax, [bp+var_16]
		shl	ax, 2
		les	bx, word_4A691
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	[bp+var_14], ax
		cmp	[bp+var_14], 9FFFh
		jbe	short loc_6890B

loc_6890B:
		push	large 0FFFFFFFFh
		mov	al, byte ptr [bp+var_1A+3]
		mov	ah, 0
		inc	ax
		movsx	eax, ax
		push	eax
		mov	ax, [bp+var_16]
		shl	ax, 2
		les	bx, word_4A691
		add	bx, ax
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		inc	[bp+var_16]

loc_6893D:
		mov	ax, [bp+var_16]
		cmp	ax, word_4A684
		jge	short loc_68949
		jmp	loc_688AE

loc_68949:
		mov	ax, [bp+arg_4]
		mov	word_4A699, ax
		push	2
		lea	ax, [bp+var_1C4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	0
		lea	ax, [bp+var_14C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		push	2
		lea	ax, [bp+var_E6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_6897C:
		pop	di
		pop	si
		leave
		retf
sub_684B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68980		proc far

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
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	ah, 0
		mov	word_4A680, ax
		push	seg stub199
		push	offset sub_47C75
		push	11h
		push	word_4A680
		push	0Ch
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word_4A688, ax
		mov	[bp+var_1A], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_18], ax
		lea	ax, [bp+var_1A]
		mov	word_4D392, ax
		mov	[bp+var_1A], 1BCh
		mov	[bp+var_16], 0
		mov	[bp+var_12], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0FFFFh
		push	word_4A686
		lea	ax, [bp+var_1E]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		mov	bx, [bp+arg_4]
		mov	ax, [bx+5Dh]
		dec	ax
		mov	word_4A69B, ax
		mov	[bp+var_2], 0
		jmp	loc_68B00

loc_68A07:
		mov	ax, [bp+var_2]
		inc	ax
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_4A688
		add	dx, ax
		mov	di, dx
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[di+0Ah], al
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[di+0Bh], al
		push	[bp+var_4]
		push	[bp+arg_4]
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	bx, [bp+arg_4]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_68A65
		mov	bx, [bp+arg_4]
		mov	eax, [bx+61h]
		jmp	short loc_68A6C

loc_68A65:
		mov	bx, [bp+arg_4]
		mov	eax, [bx+71h]

loc_68A6C:
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_68A7A
		jmp	loc_68AFD

loc_68A7A:
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	large [bp+var_C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[di], eax
		mov	byte ptr [di+4], 3
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_C]
		mov	[di+6], eax
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+arg_4]
		call	sub_43519
		add	sp, 8
		push	0
		push	di
		lea	ax, [bp+var_1E]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_68AFD:
		inc	[bp+var_2]

loc_68B00:
		mov	ax, [bp+var_2]
		cmp	ax, word_4A69B
		jge	short loc_68B0C
		jmp	loc_68A07

loc_68B0C:
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_5C1C
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_68980		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68B2A		proc far

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
		mov	si, [bp+arg_0]
		mov	[bp+var_1A], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_18], ax
		lea	ax, [bp+var_1A]
		mov	word_4D392, ax
		mov	[bp+var_1A], 1BCh
		mov	[bp+var_16], 0
		mov	[bp+var_12], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0FFFFh
		push	word_4A686
		lea	ax, [bp+var_1E]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		mov	ax, word_4A69B
		mov	[bp+var_2], ax
		jmp	loc_68C76

loc_68B7A:
		mov	ax, [bp+var_2]
		sub	ax, word_4A69B
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_4A688
		add	dx, ax
		mov	di, dx
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[di+0Ah], al
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_4048D
		add	sp, 6
		mov	[di+0Bh], al
		push	[bp+var_4]
		push	[bp+arg_4]
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	bx, [bp+arg_4]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_68BDB
		mov	bx, [bp+arg_4]
		mov	eax, [bx+61h]
		jmp	short loc_68BE2

loc_68BDB:
		mov	bx, [bp+arg_4]
		mov	eax, [bx+71h]

loc_68BE2:
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_68BF0
		jmp	loc_68C73

loc_68BF0:
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	large [bp+var_C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[di], eax
		mov	byte ptr [di+4], 3
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_C]
		mov	[di+6], eax
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+arg_4]
		call	sub_43519
		add	sp, 8
		push	0
		push	di
		lea	ax, [bp+var_1E]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_68C73:
		inc	[bp+var_2]

loc_68C76:
		mov	ax, [bp+var_2]
		cmp	ax, word_4A680
		jge	short loc_68C82
		jmp	loc_68B7A

loc_68C82:
		lea	ax, [bp+var_1E]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_5C1C
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_68B2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68CA0		proc far

var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= word ptr -96h
var_94		= dword ptr -94h
var_90		= byte ptr -90h
var_8E		= word ptr -8Eh
var_31		= word ptr -31h
var_2D		= dword ptr -2Dh
var_21		= word ptr -21h
var_1D		= dword ptr -1Dh
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 9Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	0
		push	[bp+arg_2]
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_68CDB
		mov	bx, [bp+arg_2]
		mov	eax, [bx+61h]
		jmp	short loc_68CE2

loc_68CDB:
		mov	bx, [bp+arg_2]
		mov	eax, [bx+71h]

loc_68CE2:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_8E]
		push	ax
		call	IndexedRecordReader_ConstructVariantC_4338C
		add	sp, 0Ch
		mov	ax, [bp+var_31]
		mov	word_4A682, ax
		push	seg stub192
		push	offset sub_479E5
		push	11h
		push	word_4A682
		push	0Ah
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word_4A68A, ax
		mov	[bp+var_98], 1B4h
		mov	ax, word_4D392
		mov	[bp+var_96], ax
		lea	ax, [bp+var_98]
		mov	word_4D392, ax
		mov	[bp+var_98], 1BCh
		mov	[bp+var_94], 0
		mov	[bp+var_90], 0
		mov	[bp+var_9C], 0
		mov	[bp+var_9A], 0FFFFh
		push	word_4A686
		lea	ax, [bp+var_9C]
		push	ax
		call	MusicChannel_Init_B75B
		add	sp, 4
		mov	[bp+var_A], 0
		jmp	loc_68E40

loc_68D73:
		mov	ax, [bp+var_A]
		mov	dx, 0Ah
		imul	dx
		mov	dx, word_4A68A
		add	dx, ax
		mov	di, dx
		push	[bp+var_A]
		lea	ax, [bp+var_8E]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	ax, [bp+var_21]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_68DA4
		mov	eax, [bp+var_2D]
		jmp	short loc_68DA8

loc_68DA4:
		mov	eax, [bp+var_1D]

loc_68DA8:
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0
		jnz	short loc_68DB6
		jmp	loc_68E3D

loc_68DB6:
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		push	1
		push	0
		push	3
		push	large [bp+var_12]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[di], eax
		mov	byte ptr [di+4], 3
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_12]
		mov	[di+6], eax
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_A]
		lea	ax, [bp+var_8E]
		push	ax
		call	sub_43519
		add	sp, 8
		push	0
		push	di
		lea	ax, [bp+var_9C]
		push	ax
		call	MusicChannel_RegisterSequence_B7A2
		add	sp, 6
		lea	ax, [bp+var_9C]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2

loc_68E3D:
		inc	[bp+var_A]

loc_68E40:
		mov	ax, [bp+var_A]
		cmp	ax, word_4A682
		jge	short loc_68E4C
		jmp	loc_68D73

loc_68E4C:
		lea	ax, [bp+var_9C]
		push	ax
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		push	2
		lea	ax, [bp+var_98]
		push	ax
		call	sub_5C1C
		add	sp, 4
		push	2
		lea	ax, [bp+var_8E]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_68CA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68E7B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_4EF49, 0
		jz	short loc_68E9E
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_68E9E

loc_68E9E:
		cmp	word_4EF5B, 0
		jz	short loc_68EBA
		push	word_4EF5D
		mov	bx, word_4EF5B
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_68EBA

loc_68EBA:
		pop	si
		pop	bp
		retf
sub_68E7B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68EBD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_4EF49, 0
		jz	short loc_68EE0
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50DD
		add	sp, 4
		jmp	short loc_68EE0

loc_68EE0:
		cmp	word_4EF5B, 0
		jz	short loc_68EFC
		push	word_4EF5D
		mov	bx, word_4EF5B
		push	word ptr [bx+4]
		call	sub_50DD
		add	sp, 4
		jmp	short loc_68EFC

loc_68EFC:
		pop	si
		pop	bp
		retf
sub_68EBD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68EFF		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word_4A68D, 0FFFFh
		mov	byte_4A68C, 0
		push	657Bh
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		cmp	[bp+arg_2], 0
		jnz	short loc_68F25
		jmp	loc_68FC6

loc_68F25:
		cmp	word_4EF49, 0
		jz	short loc_68F4D
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_68F49
		mov	ax, 1
		jmp	short loc_68F4B

loc_68F49:
		xor	ax, ax

loc_68F4B:
		jmp	short loc_68F4F

loc_68F4D:
		mov	al, 0

loc_68F4F:
		or	al, al
		jz	short loc_68FC6
		cmp	word_4EF49, 0
		jz	short loc_68F74
		push	3E8h
		push	0
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50F5
		add	sp, 8
		jmp	short loc_68F74

loc_68F74:
		jmp	short loc_68F76

loc_68F76:
		cmp	word_4EF49, 0
		jz	short loc_68F9E
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_68F9A
		mov	ax, 1
		jmp	short loc_68F9C

loc_68F9A:
		xor	ax, ax

loc_68F9C:
		jmp	short loc_68FA0

loc_68F9E:
		mov	al, 0

loc_68FA0:
		or	al, al
		jz	short loc_68FC6
		cmp	word_4EF49, 0
		jz	short loc_68FC0
		push	word_4EF4B
		mov	bx, word_4EF49
		push	word ptr [bx+4]
		call	sub_50E9
		add	sp, 4
		jmp	short loc_68FC2

loc_68FC0:
		xor	ax, ax

loc_68FC2:
		or	ax, ax
		jnz	short loc_68F76

loc_68FC6:
		push	6569h
		call	Music_ChannelStopSequence_B6F1
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_68EFF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68FD4		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_69025

loc_68FE3:
		push	0
		push	2
		mov	ax, di
		shl	ax, 2
		les	bx, word_4A695
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		mov	ax, di
		shl	ax, 2
		les	bx, word_4A695
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0
		inc	di

loc_69025:
		cmp	di, word_4A680
		jl	short loc_68FE3
		push	0
		push	2
		push	1CB5h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		mov	dword ptr word_4A695, 0
		xor	di, di
		jmp	short loc_6908C

loc_6904A:
		push	0
		push	2
		mov	ax, di
		shl	ax, 2
		les	bx, word_4A691
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		lea	ax, [bp+var_8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		mov	ax, di
		shl	ax, 2
		les	bx, word_4A691
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0
		inc	di

loc_6908C:
		cmp	di, word_4A684
		jl	short loc_6904A
		push	0
		push	2
		push	1CB1h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		mov	dword ptr word_4A691, 0
		mov	di, word_4A69B
		jmp	loc_6916A

loc_690B4:
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_4A688
		add	bx, ax
		cmp	byte ptr [bx+5], 0
		jz	short loc_69109
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_4A688
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_69109
		push	0
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_4A688
		add	bx, ax
		mov	al, [bx+4]
		push	ax
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	dx, word_4A688
		add	dx, ax
		push	dx
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_69109

loc_69109:
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_4A688
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_4A688
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_4A688
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_4A688
		add	bx, ax
		mov	al, 0
		mov	[bx+0Bh], al
		push	ax
		mov	ax, di
		mov	dx, 0Ch
		imul	dx
		mov	bx, word_4A688
		add	bx, ax
		pop	ax
		mov	[bx+0Ah], al
		inc	di

loc_6916A:
		cmp	di, word_4A680
		jge	short loc_69173
		jmp	loc_690B4

loc_69173:
		pop	di
		pop	si
		leave
		retf
sub_68FD4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_69177		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_4A67F, 0
		jz	short loc_691E6
		mov	byte_4A67F, 0
		push	1
		push	si
		push	cs
		call	near ptr sub_68EFF
		add	sp, 4
		push	word ptr [si+4]
		push	6D9Ch
		call	Stopwatch_UnregisterTickModule_44CC1
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_68FD4
		add	sp, 2
		push	seg stub199
		push	offset sub_47C70
		push	19h
		push	0
		push	0Ch
		push	word_4A688
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	word_4A688, 0
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	word_4A68A
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	word_4A68A, 0

loc_691E6:
		pop	si
		pop	bp
		retf
sub_69177		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à AudioQueue_Helper_5FC6C
; (sub_5FC6C de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; AudioQueue_Helper_AB4BE (sub_AB4BE de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (17 lignes).
; ==============================================================================================
AudioQueue_Helper_691E9		proc far

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
AudioQueue_Helper_691E9		endp

; START OF FUNCTION CHUNK FOR AudioQueue_Helper_691E9
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR AudioQueue_Helper_691E9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6920F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_69264
		cmp	byte ptr [si+5], 0
		jz	short loc_6923E
		cmp	dword ptr [si], 0
		jz	short loc_6923E
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6923E

loc_6923E:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_69262
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_69262

loc_69262:
		jmp	short loc_69264

loc_69264:
		pop	di
		pop	si
		pop	bp
		retf
sub_6920F		endp

; START OF FUNCTION CHUNK FOR sub_6920F
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_6920F
ovr199		ends
