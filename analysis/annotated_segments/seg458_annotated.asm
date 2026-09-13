seg458		segment	para public 'OVERLAY' use16
		assume cs:seg458
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, enregistre le module auprès du minuteur matériel : référence explicitement
; Interrupt_TimerISR_5940B (seg121) via Stopwatch_RegisterTickModuleVariant_67662 (seg207, tag
; 5DC2h, cadence 0x14). Confirme le lien direct entre ce cluster et le registre de modules à
; créneaux temporisés (seg161) découvert plusieurs lots auparavant.
; ==============================================================================================
AudioQueue_RegisterTickModule_AA810	proc far		; CODE XREF: VROOMM_StubThunk_6CFB9J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 14h
		push	seg seg121
		push	offset Interrupt_TimerISR_5940B
		push	5DC2h
		call	Stopwatch_RegisterTickModuleVariant_67662
		add	sp, 0Ah
		mov	[si+4],	ax
		pop	si
		pop	bp
		retf
AudioQueue_RegisterTickModule_AA810	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle AudioQueue_ProcessMain_AB1EF.
; ==============================================================================================
AudioQueue_AdvanceSlot_AA831	proc far		; CODE XREF: VROOMM_StubThunk_6CFBEJ

arg_0		= word ptr  6

		push	bp

loc_AA832:
		mov	bp, sp

loc_AA834:
		mov	ax, [bp+arg_0]
		push	1
		push	ax
		nop
		push	cs

loc_AA83C:
		call	near ptr AudioQueue_ProcessSequencerSlots_AB1EF

loc_AA83F:
		add	sp, 4

loc_AA842:
		mov	byte_70869, 0

loc_AA847:
		mov	byte_7086A, 0
		pop	bp
		retf
AudioQueue_AdvanceSlot_AA831	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 552 lignes — plus grosse fonction de ce cluster, NON DÉTAILLÉE — orchestre
; AudioQueue_ProcessMain_AB1EF, AudioQueue_ReleaseAllSlots_AB2BD,
; IndexedRecordReader_ConstructVariantB_65A4A, IndexedRecordReader_AdvanceIndex_65E2C,
; StreamReader_ConstructVariantA_63A39, StreamReader_ConstructAndBind_63B23,
; IndexedRecordReader_ConstructVariantA_65A1A — lit des plages d'octets variables dans un
; enregistrement indexé, motif cohérent avec la lecture de clips audio/texte indexés (probable
; file de messages radio ou de dialogues). Résout la question ouverte du cluster sub_ABxxx
; consommateur du registre de modules, posée depuis plusieurs sessions. Candidat prioritaire
; pour session dédiée si le contenu exact (audio vs texte) doit être confirmé.
; ==============================================================================================
AudioQueue_ProcessMain_AA84E	proc far		; CODE XREF: VROOMM_StubThunk_6CFC3J

var_238		= word ptr -238h
var_1C0		= word ptr -1C0h
var_15F		= dword	ptr -15Fh
var_15B		= dword	ptr -15Bh
var_153		= word ptr -153h
var_14F		= dword	ptr -14Fh
var_148		= word ptr -148h
var_EB		= dword	ptr -0EBh
var_E7		= dword	ptr -0E7h
var_E2		= word ptr -0E2h
var_81		= dword	ptr -81h
var_7D		= dword	ptr -7Dh
var_75		= word ptr -75h
var_71		= dword	ptr -71h
var_6A		= word ptr -6Ah
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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

loc_AA861:
		push	cs

loc_AA862:
		call	near ptr AudioQueue_ProcessSequencerSlots_AB1EF

loc_AA865:
		add	sp, 4

loc_AA868:
		mov	ax, [bp+arg_4]

loc_AA86B:
		cmp	ax, word_70865

loc_AA86F:
		jnz	short loc_AA87A

loc_AA871:
		cmp	[bp+arg_4], 0FFFFh
		jz	short loc_AA87A
		jmp	loc_AACA2
; ���������������������������������������������������������������������������

loc_AA87A:				; CODE XREF: AudioQueue_ProcessMain_AA84E:loc_AA86Fj
					; AudioQueue_ProcessMain_AA84E+27j
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_ReleaseAllSlots_AB2BD
		pop	cx
		push	ds
		push	offset a_dat	; ".dat"
		push	ds
		push	di
		push	ds
		push	offset aSound	; "SOUND"
		lea	ax, [bp+var_6A]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_65A4A
		add	sp, 6
		cmp	[bp+arg_4], 0FFFFh
		jnz	short loc_AA8B4
		push	0
		jmp	short loc_AA8B9
; ���������������������������������������������������������������������������

loc_AA8B4:				; CODE XREF: AudioQueue_ProcessMain_AA84E+60j
		mov	ax, [bp+arg_4]
		dec	ax
		push	ax

loc_AA8B9:				; CODE XREF: AudioQueue_ProcessMain_AA84E+64j
		lea	ax, [bp+var_E2]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	eax, [bp+var_7D]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_75]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_AA8E0
		mov	eax, [bp+var_81]
		jmp	short loc_AA8E4
; ���������������������������������������������������������������������������

loc_AA8E0:				; CODE XREF: AudioQueue_ProcessMain_AA84E+89j
		mov	eax, [bp+var_71]

loc_AA8E4:				; CODE XREF: AudioQueue_ProcessMain_AA84E+90j
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_148], 2C8h
		mov	[bp+var_E7], 100h
		mov	[bp+var_EB], 0
		mov	[bp+var_148], 138Ah
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_E2]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ConstructAndBind_63B23
		add	sp, 0Eh
		mov	al, byte_70996

loc_AA937:
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_AA948

loc_AA93E:
		cmp	ax, 2
		jnz	short loc_AA957
		push	37C1h
		jmp	short loc_AA94B
; ���������������������������������������������������������������������������

loc_AA948:				; CODE XREF: AudioQueue_ProcessMain_AA84E+EEj
		push	37C6h

loc_AA94B:				; CODE XREF: AudioQueue_ProcessMain_AA84E+F8j
		lea	ax, [bp+var_E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_AA957:				; CODE XREF: AudioQueue_ProcessMain_AA84E+F3j
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	ds
		push	di
		push	ds

loc_AA95F:				; "SOUND"
		push	offset aSound
		lea	ax, [bp+var_6A]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_65A4A
		add	sp, 6
		cmp	word_70865, 0FFFFh
		jz	short loc_AA98B
		jmp	loc_AAA2C
; ���������������������������������������������������������������������������

loc_AA98B:				; CODE XREF: AudioQueue_ProcessMain_AA84E+138j
		push	0
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	eax, [bp+var_15B]
		mov	[bp+var_16], eax
		mov	ax, [bp+var_153]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_AA9B6
		mov	eax, [bp+var_15F]
		jmp	short loc_AA9BB
; ���������������������������������������������������������������������������

loc_AA9B6:				; CODE XREF: AudioQueue_ProcessMain_AA84E+15Fj
		mov	eax, [bp+var_14F]

loc_AA9BB:				; CODE XREF: AudioQueue_ProcessMain_AA84E+166j
		mov	edx, [bp+var_16]
		add	edx, eax
		mov	[bp+var_1A], edx
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_1A]
		jnz	short loc_AA9D3
		jmp	loc_AAA67
; ���������������������������������������������������������������������������

loc_AA9D3:				; CODE XREF: AudioQueue_ProcessMain_AA84E+180j
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx
		push	0
		push	large [bp+var_1A]
		push	large [bp+var_16]
		lea	ax, [bp+var_1C0]
		push	ax
		lea	ax, [bp+var_238]
		push	ax
		call	StreamReader_ConstructAndBind_63B23
		add	sp, 0Eh
		lea	ax, [bp+var_238]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_ReleaseAndAdvance_AACA6
		add	sp, 6
		lea	ax, [bp+var_238]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_ProcessAndAdvance_AAFA0
		add	sp, 4
		push	2
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4
		jmp	short loc_AAA67
; ���������������������������������������������������������������������������

loc_AAA2C:				; CODE XREF: AudioQueue_ProcessMain_AA84E+13Aj
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]

loc_AAA33:
		push	ax
		call	Handle_ReadByteField_63534
		add	sp, 6

loc_AAA3C:
		xor	di, di
		jmp	short loc_AAA61
; ���������������������������������������������������������������������������

loc_AAA40:				; CODE XREF: AudioQueue_ProcessMain_AA84E+217j
		push	large 0FFFFFFFFh

loc_AAA43:
		lea	ax, [bp+var_148]
		push	ax

loc_AAA48:
		call	Handle_ReadByteField_63534

loc_AAA4D:
		add	sp, 6

loc_AAA50:
		push	large 0FFFFFFFFh

loc_AAA53:
		lea	ax, [bp+var_148]

loc_AAA57:
		push	ax
		call	Handle_ReadByteField_63534
		add	sp, 6
		inc	di

loc_AAA61:				; CODE XREF: AudioQueue_ProcessMain_AA84E+1F0j
		cmp	di, word_70867
		jl	short loc_AAA40

loc_AAA67:				; CODE XREF: AudioQueue_ProcessMain_AA84E+182j
					; AudioQueue_ProcessMain_AA84E+1DCj
		mov	ax, word_70867
		cmp	ax, word_7084C
		jnz	short loc_AAA73
		jmp	loc_AAB02
; ���������������������������������������������������������������������������

loc_AAA73:				; CODE XREF: AudioQueue_ProcessMain_AA84E+220j
		push	[bp+arg_4]
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	eax, [bp+var_15B]
		mov	[bp+var_16], eax
		mov	ax, [bp+var_153]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_AAA9F
		mov	eax, [bp+var_15F]
		jmp	short loc_AAAA4
; ���������������������������������������������������������������������������

loc_AAA9F:				; CODE XREF: AudioQueue_ProcessMain_AA84E+248j
		mov	eax, [bp+var_14F]

loc_AAAA4:				; CODE XREF: AudioQueue_ProcessMain_AA84E+24Fj
		mov	edx, [bp+var_16]
		add	edx, eax
		mov	[bp+var_1A], edx
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_1A]
		jz	short loc_AAB02
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx
		push	0
		push	large [bp+var_1A]
		push	large [bp+var_16]
		lea	ax, [bp+var_1C0]
		push	ax
		lea	ax, [bp+var_238]
		push	ax
		call	StreamReader_ConstructAndBind_63B23
		add	sp, 0Eh
		lea	ax, [bp+var_238]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_ReleaseAndAdvanceB_AAE3B
		add	sp, 6
		push	2
		lea	ax, [bp+var_238]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4

loc_AAB02:				; CODE XREF: AudioQueue_ProcessMain_AA84E+222j
					; AudioQueue_ProcessMain_AA84E+269j
		mov	ax, word_7084C
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr dword_70861+2,	dx
		mov	word ptr dword_70861, ax
		mov	dx, word ptr dword_70861+2
		cmp	dx, 9FFFh
		xor	di, di
		jmp	short loc_AAB9C
; ���������������������������������������������������������������������������

loc_AAB36:				; CODE XREF: AudioQueue_ProcessMain_AA84E+352j
		push	1
		push	0

loc_AAB3A:
		push	2
		movsx	eax, word_7084C
		push	eax
		push	5C44h

loc_AAB47:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch

loc_AAB4F:
		mov	bx, di
		shl	bx, 2
		les	si, dword_70861
		add	si, bx
		mov	es:[si+2], dx
		mov	es:[si], ax

loc_AAB61:
		mov	ax, di

loc_AAB63:
		shl	ax, 2

loc_AAB66:
		mov	bx, word ptr dword_70861
		add	bx, ax

loc_AAB6C:
		mov	dx, es:[bx+2]

loc_AAB70:
		cmp	dx, 9FFFh
		push	large 0FFFFFFFFh
		movsx	eax, word_7084C
		push	eax
		mov	ax, di
		shl	ax, 2
		les	bx, dword_70861
		add	bx, ax
		push	large dword ptr	es:[bx]
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		inc	di

loc_AAB9C:				; CODE XREF: AudioQueue_ProcessMain_AA84E+2E6j
		cmp	di, word_7084C
		jl	short loc_AAB36
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_63534
		add	sp, 6
		mov	ah, 0
		mov	word_70850, ax
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr dword_7085D+2,	dx
		mov	word ptr dword_7085D, ax
		mov	dx, word ptr dword_7085D+2
		cmp	dx, 9FFFh
		xor	di, di
		jmp	short loc_AAC66
; ���������������������������������������������������������������������������

loc_AABE8:				; CODE XREF: AudioQueue_ProcessMain_AA84E+41Ej
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_148]
		push	ax
		call	Handle_ReadByteField_63534
		add	sp, 6
		mov	byte ptr [bp+var_16+3],	al
		push	1
		push	0
		push	2
		mov	ah, 0
		inc	ax
		movsx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 2
		les	si, dword_7085D
		add	si, bx
		mov	es:[si+2], dx
		mov	es:[si], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, word ptr dword_7085D
		add	bx, ax

loc_AAC32:
		mov	dx, es:[bx+2]

loc_AAC36:
		cmp	dx, 9FFFh

loc_AAC3A:
		push	large 0FFFFFFFFh
		mov	al, byte ptr [bp+var_16+3]
		mov	ah, 0

loc_AAC42:
		inc	ax

loc_AAC43:
		movsx	eax, ax

loc_AAC47:
		push	eax
		mov	ax, di

loc_AAC4B:
		shl	ax, 2
		les	bx, dword_7085D
		add	bx, ax
		push	large dword ptr	es:[bx]
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		inc	di

loc_AAC66:				; CODE XREF: AudioQueue_ProcessMain_AA84E+398j
		cmp	di, word_70850
		jge	short loc_AAC6F
		jmp	loc_AABE8
; ���������������������������������������������������������������������������

loc_AAC6F:				; CODE XREF: AudioQueue_ProcessMain_AA84E+41Cj
		mov	ax, [bp+arg_4]

loc_AAC72:
		mov	word_70865, ax
		push	2

loc_AAC77:
		lea	ax, [bp+var_1C0]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4
		push	0
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		push	2
		lea	ax, [bp+var_E2]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4

loc_AACA2:				; CODE XREF: AudioQueue_ProcessMain_AA84E+29j
		pop	di
		pop	si
		leave
		retf
AudioQueue_ProcessMain_AA84E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 196 lignes, NON DÉTAILLÉE — combine Handle_ReadByteField_63534 (×3, seg188),
; sub_1069, Sequencer_ReleaseSlot_59F87 (seg123), IndexedRecordReader_AdvanceIndex_65E2C,
; allocateurs typés (seg131).
; ==============================================================================================
AudioQueue_ReleaseAndAdvance_AACA6	proc far		; CODE XREF: VROOMM_StubThunk_6CFAAJ AudioQueue_ProcessMain_AA84E+1B9p

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
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
		call	Handle_ReadByteField_63534
		add	sp, 6
		mov	ah, 0
		mov	word_7084C, ax
		push	seg seg335
		push	offset VROOMM_StubThunk_6CFA5
		push	11h
		push	ax
		push	large 0C0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word_70854, ax
		mov	[bp+var_1A], 0
		mov	[bp+var_16], 2
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0FFFFh
		push	word_70852
		lea	ax, [bp+var_1E]
		push	ax
		call	Sequencer_ReleaseSlot_59F87
		add	sp, 4
		mov	ax, [di+5Dh]
		dec	ax
		mov	word_70867, ax
		mov	[bp+var_2], 0
		jmp	loc_AADFD
; ���������������������������������������������������������������������������

loc_AAD22:				; CODE XREF: AudioQueue_ReleaseAndAdvance_AACA6+160j
		mov	ax, [bp+var_2]
		inc	ax
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		imul	ax, 0Ch

loc_AAD2F:
		mov	si, word_70854
		add	si, ax

loc_AAD35:
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_63534
		add	sp, 6
		mov	[si+0Ah], al
		push	large 0FFFFFFFFh

loc_AAD49:
		push	[bp+arg_2]
		call	Handle_ReadByteField_63534
		add	sp, 6
		mov	[si+0Bh], al
		push	[bp+var_4]
		push	di
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h

loc_AAD69:
		cmp	ax, 0C0h ; '�'

loc_AAD6C:
		jnz	short loc_AAD74
		mov	eax, [di+61h]

loc_AAD72:
		jmp	short loc_AAD78
; ���������������������������������������������������������������������������

loc_AAD74:				; CODE XREF: AudioQueue_ReleaseAndAdvance_AACA6:loc_AAD6Cj
		mov	eax, [di+71h]

loc_AAD78:				; CODE XREF: AudioQueue_ReleaseAndAdvance_AACA6:loc_AAD72j
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jz	short loc_AADFA
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_C]
		mov	[si+6],	eax
		push	0
		mov	al, [si+4]
		push	ax
		push	large dword ptr	[si]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	di
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8
		push	0

loc_AADE3:
		push	si

loc_AADE4:
		lea	ax, [bp+var_1E]
		push	ax

loc_AADE8:
		call	Sequencer_ProcessQueue_59FF5

loc_AADED:
		add	sp, 6

loc_AADF0:
		lea	ax, [bp+var_1E]
		push	ax

loc_AADF4:
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx

loc_AADFA:				; CODE XREF: AudioQueue_ReleaseAndAdvance_AACA6+DBj
		inc	[bp+var_2]

loc_AADFD:				; CODE XREF: AudioQueue_ReleaseAndAdvance_AACA6+79j
		mov	ax, [bp+var_2]
		cmp	ax, word_70867
		jge	short loc_AAE09
		jmp	loc_AAD22
; ���������������������������������������������������������������������������

loc_AAE09:				; CODE XREF: AudioQueue_ReleaseAndAdvance_AACA6+15Ej
		lea	ax, [bp+var_1E]
		push	ax
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		cmp	[bp+var_15], 0
		jz	short loc_AAE37
		cmp	[bp+var_1A], 0
		jz	short loc_AAE37
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		push	5C44h

loc_AAE2D:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_AAE37:				; CODE XREF: AudioQueue_ReleaseAndAdvance_AACA6+171j
					; AudioQueue_ReleaseAndAdvance_AACA6+178j
		pop	di
		pop	si
		leave
		retf
AudioQueue_ReleaseAndAdvance_AACA6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 186 lignes, NON DÉTAILLÉE — variante de AudioQueue_ReleaseAndAdvance_AACA6, combine
; aussi IndexedRecordReader_SeekToIndex_65C6D (seg196) et Sequencer_ProcessQueue_59FF5
; (seg123).
; ==============================================================================================
AudioQueue_ReleaseAndAdvanceB_AAE3B	proc far		; CODE XREF: VROOMM_StubThunk_6CFAFJ AudioQueue_ProcessMain_AA84E+29Fp

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
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

loc_AAE43:
		mov	ax, [bp+arg_0]

loc_AAE46:
		mov	di, [bp+arg_4]

loc_AAE49:
		mov	[bp+var_1A], 0

loc_AAE51:
		mov	[bp+var_16], 2

loc_AAE55:
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0

loc_AAE61:
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0FFFFh

loc_AAE6B:
		push	word_70852

loc_AAE6F:
		lea	ax, [bp+var_1E]
		push	ax

loc_AAE73:
		call	Sequencer_ReleaseSlot_59F87
		add	sp, 4
		mov	ax, word_70867
		mov	[bp+var_2], ax
		jmp	loc_AAF62
; ���������������������������������������������������������������������������

loc_AAE84:				; CODE XREF: AudioQueue_ReleaseAndAdvanceB_AAE3B+130j
		mov	ax, [bp+var_2]
		sub	ax, word_70867
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		imul	ax, 0Ch
		mov	si, word_70854
		add	si, ax
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_63534
		add	sp, 6
		mov	[si+0Ah], al
		push	large 0FFFFFFFFh
		push	[bp+arg_2]
		call	Handle_ReadByteField_63534
		add	sp, 6
		mov	[si+0Bh], al
		push	[bp+var_4]
		push	di
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_AAED9
		mov	eax, [di+61h]
		jmp	short loc_AAEDD
; ���������������������������������������������������������������������������

loc_AAED9:				; CODE XREF: AudioQueue_ReleaseAndAdvanceB_AAE3B+96j
		mov	eax, [di+71h]

loc_AAEDD:				; CODE XREF: AudioQueue_ReleaseAndAdvanceB_AAE3B+9Cj
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0

loc_AAEE6:
		jz	short loc_AAF5F
		mov	[bp+var_C], eax
		push	1

loc_AAEEE:
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_C]
		mov	[si+6],	eax
		push	0
		mov	al, [si+4]
		push	ax
		push	large dword ptr	[si]
		push	5C44h

loc_AAF30:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	di

loc_AAF3E:
		call	IndexedRecordReader_SeekToIndex_65C6D

loc_AAF43:
		add	sp, 8

loc_AAF46:
		push	0
		push	si
		lea	ax, [bp+var_1E]
		push	ax
		call	Sequencer_ProcessQueue_59FF5
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx

loc_AAF5F:				; CODE XREF: AudioQueue_ReleaseAndAdvanceB_AAE3B:loc_AAEE6j
		inc	[bp+var_2]

loc_AAF62:				; CODE XREF: AudioQueue_ReleaseAndAdvanceB_AAE3B+46j
		mov	ax, [bp+var_2]
		cmp	ax, word_7084C
		jge	short loc_AAF6E
		jmp	loc_AAE84
; ���������������������������������������������������������������������������

loc_AAF6E:				; CODE XREF: AudioQueue_ReleaseAndAdvanceB_AAE3B+12Ej
		lea	ax, [bp+var_1E]
		push	ax

loc_AAF72:
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		cmp	[bp+var_15], 0
		jz	short loc_AAF9C
		cmp	[bp+var_1A], 0
		jz	short loc_AAF9C
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_AAF9C:				; CODE XREF: AudioQueue_ReleaseAndAdvanceB_AAE3B+141j
					; AudioQueue_ReleaseAndAdvanceB_AAE3B+148j
		pop	di
		pop	si
		leave
		retf
AudioQueue_ReleaseAndAdvanceB_AAE3B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 213 lignes, NON DÉTAILLÉE — combine IndexedRecordReader_AdvanceIndex_65E2C,
; IndexedRecordReader_ConstructVariantC_65A8A (seg196), sub_1069, Sequencer_ReleaseSlot_59F87,
; IndexedRecordReader_SeekToIndex_65C6D — cycle complet de traitement d'un élément de la file
; audio/message.
; ==============================================================================================
AudioQueue_ProcessAndAdvance_AAFA0	proc far		; CODE XREF: VROOMM_StubThunk_6CFB4J AudioQueue_ProcessMain_AA84E+1C7p

var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= dword	ptr -96h
var_92		= byte ptr -92h
var_91		= byte ptr -91h
var_90		= dword	ptr -90h
var_8C		= word ptr -8Ch
var_2F		= word ptr -2Fh
var_2B		= dword	ptr -2Bh
var_1F		= word ptr -1Fh
var_1B		= dword	ptr -1Bh
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 9Ah
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	0
		push	si
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	eax, [si+65h]
		mov	[bp+var_4], eax
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_AAFD3
		mov	eax, [si+61h]
		jmp	short loc_AAFD7
; ���������������������������������������������������������������������������

loc_AAFD3:				; CODE XREF: AudioQueue_ProcessAndAdvance_AAFA0+2Bj
		mov	eax, [si+71h]

loc_AAFD7:				; CODE XREF: AudioQueue_ProcessAndAdvance_AAFA0+31j
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx

loc_AAFE2:
		push	edx
		push	large [bp+var_4]
		push	si

loc_AAFE9:
		lea	ax, [bp+var_8C]
		push	ax
		call	IndexedRecordReader_ConstructVariantC_65A8A
		add	sp, 0Ch
		mov	ax, [bp+var_2F]
		mov	word_7084E, ax
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADAA
		push	11h
		push	ax
		push	large 0A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word_70856, ax
		mov	[bp+var_96], 0
		mov	[bp+var_92], 2
		mov	[bp+var_91], 0
		mov	[bp+var_90], 0

loc_AB032:
		mov	[bp+var_9A], 0

loc_AB038:
		mov	[bp+var_98], 0FFFFh

loc_AB03E:
		push	word_70852
		lea	ax, [bp+var_9A]
		push	ax
		call	Sequencer_ReleaseSlot_59F87
		add	sp, 4
		xor	di, di
		jmp	loc_AB109
; ���������������������������������������������������������������������������

loc_AB054:				; CODE XREF: AudioQueue_ProcessAndAdvance_AAFA0+16Fj
		mov	ax, di
		imul	ax, 0Ah
		mov	si, word_70856
		add	si, ax
		push	di
		lea	ax, [bp+var_8C]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	ax, [bp+var_1F]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_AB07E
		mov	eax, [bp+var_2B]
		jmp	short loc_AB082
; ���������������������������������������������������������������������������

loc_AB07E:				; CODE XREF: AudioQueue_ProcessAndAdvance_AAFA0+D6j
		mov	eax, [bp+var_1B]

loc_AB082:				; CODE XREF: AudioQueue_ProcessAndAdvance_AAFA0+DCj
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0
		jz	short loc_AB108
		mov	[bp+var_10], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_14]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_10]
		mov	[si+6],	eax
		push	0
		mov	al, [si+4]
		push	ax
		push	large dword ptr	[si]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		lea	ax, [bp+var_8C]
		push	ax
		call	IndexedRecordReader_SeekToIndex_65C6D

loc_AB0EA:
		add	sp, 8
		push	0
		push	si
		lea	ax, [bp+var_9A]
		push	ax
		call	Sequencer_ProcessQueue_59FF5
		add	sp, 6
		lea	ax, [bp+var_9A]
		push	ax
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx

loc_AB108:				; CODE XREF: AudioQueue_ProcessAndAdvance_AAFA0+EBj
		inc	di

loc_AB109:				; CODE XREF: AudioQueue_ProcessAndAdvance_AAFA0+B1j
		cmp	di, word_7084E
		jge	short loc_AB112
		jmp	loc_AB054
; ���������������������������������������������������������������������������

loc_AB112:				; CODE XREF: AudioQueue_ProcessAndAdvance_AAFA0+16Dj
		lea	ax, [bp+var_9A]
		push	ax
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		cmp	[bp+var_91], 0
		jz	short loc_AB145
		cmp	[bp+var_96], 0
		jz	short loc_AB145
		push	0
		mov	al, [bp+var_92]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_AB143:
		jmp	short $+2

loc_AB145:				; CODE XREF: AudioQueue_ProcessAndAdvance_AAFA0+182j
					; AudioQueue_ProcessAndAdvance_AAFA0+18Aj
		mov	[bp+var_96], 0
		mov	[bp+var_91], 0

loc_AB153:
		mov	[bp+var_90], 0
		push	2

loc_AB15E:
		lea	ax, [bp+var_8C]
		push	ax

loc_AB163:
		call	IndexedRecordReader_Destruct_659D0

loc_AB168:
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
AudioQueue_ProcessAndAdvance_AAFA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, appelle deux fois ModuleRegistry_Opcode_AB_603D2 (seg161, thunk d'activation
; d'emplacement du registre de modules) — confirme que ce cluster utilise directement les
; thunks d'opcode du registre de modules découverts en seg161.
; ==============================================================================================
AudioQueue_ActivateSlotOpcode_AB16F	proc far		; CODE XREF: VROOMM_StubThunk_6CFD2J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_AB172:
		mov	ax, [bp+arg_0]
		cmp	word_72C93, 0
		jz	short loc_AB191
		push	word_72C95
		mov	bx, word_72C93
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AB_603D2
		add	sp, 4
		jmp	short $+2

loc_AB191:				; CODE XREF: AudioQueue_ActivateSlotOpcode_AB16F+Bj
		cmp	word_72CA5, 0
		jz	short loc_AB1AD
		push	word_72CA7
		mov	bx, word_72CA5
		push	word ptr [bx+4]

loc_AB1A3:
		call	ModuleRegistry_Opcode_AB_603D2
		add	sp, 4

loc_AB1AB:
		jmp	short $+2

loc_AB1AD:				; CODE XREF: AudioQueue_ActivateSlotOpcode_AB16F+27j
		pop	bp
		retf
AudioQueue_ActivateSlotOpcode_AB16F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, appelle deux fois ModuleRegistry_Opcode_AD_603D8 (seg161, thunk de désactivation
; d'emplacement).
; ==============================================================================================
AudioQueue_DeactivateSlotOpcode_AB1AF	proc far		; CODE XREF: VROOMM_StubThunk_6CFD7J

arg_0		= word ptr  6

		push	bp

loc_AB1B0:
		mov	bp, sp

loc_AB1B2:
		mov	ax, [bp+arg_0]

loc_AB1B5:
		cmp	word_72C93, 0
		jz	short loc_AB1D1
		push	word_72C95
		mov	bx, word_72C93
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AD_603D8
		add	sp, 4
		jmp	short $+2

loc_AB1D1:				; CODE XREF: AudioQueue_DeactivateSlotOpcode_AB1AF+Bj
		cmp	word_72CA5, 0
		jz	short loc_AB1ED
		push	word_72CA7
		mov	bx, word_72CA5
		push	word ptr [bx+4]

loc_AB1E3:
		call	ModuleRegistry_Opcode_AD_603D8

loc_AB1E8:
		add	sp, 4
		jmp	short $+2

loc_AB1ED:				; CODE XREF: AudioQueue_DeactivateSlotOpcode_AB1AF+27j
		pop	bp
		retf
AudioQueue_DeactivateSlotOpcode_AB1AF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 123 lignes, NON DÉTAILLÉE — appelle directement Sequencer_AdvanceActiveSlot_59F1D
; (seg123, ×2) et les thunks d'opcode du registre de modules (ModuleRegistry_Opcode_AE_603DE
; probe, _B1_603F0, _AF_603E4) — cœur du traitement des emplacements actifs de la file
; audio/séquenceur.
; ==============================================================================================
AudioQueue_ProcessSequencerSlots_AB1EF	proc far		; CODE XREF: VROOMM_StubThunk_6CFDCJ
					; AudioQueue_AdvanceSlot_AA831:loc_AA83Cp	...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp

loc_AB1F2:
		mov	ax, [bp+arg_0]

loc_AB1F5:
		mov	word_70859, 0FFFFh
		mov	byte_70858, 0
		push	5BF5h
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		cmp	[bp+arg_2], 0
		jnz	short loc_AB212
		jmp	loc_AB2B2
; ���������������������������������������������������������������������������

loc_AB212:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+1Ej
		cmp	word_72C93, 0
		jz	short loc_AB23A
		push	word_72C95
		mov	bx, word_72C93
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AE_603DE
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_AB236
		mov	ax, 1
		jmp	short loc_AB238
; ���������������������������������������������������������������������������

loc_AB236:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+40j
		xor	ax, ax

loc_AB238:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+45j
		jmp	short loc_AB23C
; ���������������������������������������������������������������������������

loc_AB23A:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+28j
		mov	al, 0

loc_AB23C:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF:loc_AB238j
		or	al, al
		jz	short loc_AB2B2

loc_AB240:
		cmp	word_72C93, 0
		jz	short loc_AB262

loc_AB247:
		push	large 3E80000h

loc_AB24D:
		push	word_72C95
		mov	bx, word_72C93
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_B1_603F0
		add	sp, 8

loc_AB260:
		jmp	short $+2

loc_AB262:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+56j
					; AudioQueue_ProcessSequencerSlots_AB1EF+C1j
		cmp	word_72C93, 0
		jz	short loc_AB28A
		push	word_72C95
		mov	bx, word_72C93
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AE_603DE
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_AB286
		mov	ax, 1
		jmp	short loc_AB288
; ���������������������������������������������������������������������������

loc_AB286:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+90j
		xor	ax, ax

loc_AB288:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+95j
		jmp	short loc_AB28C
; ���������������������������������������������������������������������������

loc_AB28A:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+78j
		mov	al, 0

loc_AB28C:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF:loc_AB288j
		or	al, al
		jz	short loc_AB2B2
		cmp	word_72C93, 0
		jz	short loc_AB2AC
		push	word_72C95
		mov	bx, word_72C93
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_AF_603E4

loc_AB2A7:
		add	sp, 4
		jmp	short loc_AB2AE
; ���������������������������������������������������������������������������

loc_AB2AC:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+A6j
		xor	ax, ax

loc_AB2AE:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+BBj
		or	ax, ax
		jnz	short loc_AB262

loc_AB2B2:				; CODE XREF: AudioQueue_ProcessSequencerSlots_AB1EF+20j
					; AudioQueue_ProcessSequencerSlots_AB1EF+4Fj ...
		push	5BE3h
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		pop	bp
		retf
AudioQueue_ProcessSequencerSlots_AB1EF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 188 lignes, NON DÉTAILLÉE — libère massivement des ressources typées
; (Memory_TypedFree_5C7B6 ×5+) — nettoyage complet de la file audio/message.
; ==============================================================================================
AudioQueue_ReleaseAllSlots_AB2BD	proc far		; CODE XREF: VROOMM_StubThunk_6CFC8J AudioQueue_ProcessMain_AA84E+2Fp	...

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
		jmp	short loc_AB30D
; ���������������������������������������������������������������������������

loc_AB2CB:				; CODE XREF: AudioQueue_ReleaseAllSlots_AB2BD+54j
		push	0
		push	2
		mov	ax, si
		shl	ax, 2
		les	bx, dword_70861
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]

loc_AB2E1:
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx

loc_AB2E7:
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	ax, si
		shl	ax, 2
		les	bx, dword_70861
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0
		inc	si

loc_AB30D:				; CODE XREF: AudioQueue_ReleaseAllSlots_AB2BD+Cj
		cmp	si, word_7084C
		jl	short loc_AB2CB
		push	0
		push	2
		push	37B1h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword_70861, 0
		xor	si, si

loc_AB330:
		jmp	short loc_AB374
; ���������������������������������������������������������������������������

loc_AB332:				; CODE XREF: AudioQueue_ReleaseAllSlots_AB2BD+BBj
		push	0
		push	2

loc_AB336:
		mov	ax, si
		shl	ax, 2
		les	bx, dword_7085D
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	ax, si

loc_AB35F:
		shl	ax, 2
		les	bx, dword_7085D
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0

loc_AB373:
		inc	si

loc_AB374:				; CODE XREF: AudioQueue_ReleaseAllSlots_AB2BD:loc_AB330j
		cmp	si, word_70850
		jl	short loc_AB332
		push	0
		push	2
		push	37ADh
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword_7085D, 0
		mov	si, word_70867
		jmp	loc_AB43E
; ���������������������������������������������������������������������������

loc_AB39C:				; CODE XREF: AudioQueue_ReleaseAllSlots_AB2BD+187j
		mov	ax, si
		imul	ax, 0Ch

loc_AB3A1:
		mov	bx, word_70854
		add	bx, ax
		cmp	byte ptr [bx+5], 0

loc_AB3AB:
		jz	short loc_AB3E9
		mov	ax, si
		imul	ax, 0Ch
		mov	bx, word_70854
		add	bx, ax
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_AB3E9
		push	0
		mov	ax, si
		imul	ax, 0Ch
		mov	bx, word_70854
		add	bx, ax
		mov	al, [bx+4]
		push	ax
		mov	ax, si
		imul	ax, 0Ch
		mov	dx, word_70854
		add	dx, ax
		push	dx
		push	5C44h

loc_AB3DF:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_AB3E9:				; CODE XREF: AudioQueue_ReleaseAllSlots_AB2BD:loc_AB3ABj
					; AudioQueue_ReleaseAllSlots_AB2BD+100j
		mov	ax, si
		imul	ax, 0Ch
		mov	bx, word_70854
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		mov	ax, si
		imul	ax, 0Ch
		mov	bx, word_70854
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, si
		imul	ax, 0Ch
		mov	bx, word_70854
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, si
		imul	ax, 0Ch
		mov	bx, word_70854
		add	bx, ax
		mov	al, 0
		mov	[bx+0Bh], al
		mov	dx, si
		imul	dx, 0Ch
		mov	bx, word_70854
		add	bx, dx
		mov	[bx+0Ah], al
		inc	si

loc_AB43E:				; CODE XREF: AudioQueue_ReleaseAllSlots_AB2BD+DCj
		cmp	si, word_7084C

loc_AB442:
		jge	short loc_AB447
		jmp	loc_AB39C
; ���������������������������������������������������������������������������

loc_AB447:				; CODE XREF: AudioQueue_ReleaseAllSlots_AB2BD:loc_AB442j
		pop	si

locret_AB448:
		leave
		retf
AudioQueue_ReleaseAllSlots_AB2BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine AudioQueue_ProcessSequencerSlots_AB1EF, Stopwatch_UnregisterTickModule_6769F
; (seg207), AudioQueue_ReleaseAllSlots_AB2BD, sub_E77 (×2).
; ==============================================================================================
AudioQueue_UnregisterAndCleanup_AB44A	proc far		; CODE XREF: VROOMM_StubThunk_6CFCDJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_7084B, 0
		jz	short loc_AB4BB
		mov	byte_7084B, 0
		push	1
		push	si
		push	cs
		call	near ptr AudioQueue_ProcessSequencerSlots_AB1EF

loc_AB464:
		add	sp, 4

loc_AB467:
		push	word ptr [si+4]
		push	5DC2h

loc_AB46D:
		call	Stopwatch_UnregisterTickModule_6769F

loc_AB472:
		add	sp, 4
		push	si
		push	cs
		call	near ptr AudioQueue_ReleaseAllSlots_AB2BD
		pop	cx
		push	seg seg335
		push	offset VROOMM_StubThunk_6CFA0
		push	large 190000h
		push	0Ch
		push	word_70854
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	word_70854, 0
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADA5
		push	large 190000h
		push	0Ah

loc_AB4A9:
		push	word_70856
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	word_70856, 0

loc_AB4BB:				; CODE XREF: AudioQueue_UnregisterAndCleanup_AB44A+Cj
		pop	si
		pop	bp
		retf
AudioQueue_UnregisterAndCleanup_AB44A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (17 lignes).
; ==============================================================================================
AudioQueue_Helper_AB4BE	proc far		; CODE XREF: VROOMM_StubThunk_6CFA5J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		mov	ax, si
		pop	si
		pop	bp
		retf
AudioQueue_Helper_AB4BE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFree_5C7B6 et libération de l'objet (sub_338).
; ==============================================================================================
AudioQueue_ReleaseAndDestruct_AB4E1	proc far		; CODE XREF: VROOMM_StubThunk_6CFA0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_AB4E2:
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_AB532
		cmp	byte ptr [si+5], 0

loc_AB4F4:
		jz	short loc_AB510
		cmp	dword ptr [si],	0
		jz	short loc_AB510
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_AB510:				; CODE XREF: AudioQueue_ReleaseAndDestruct_AB4E1:loc_AB4F4j
					; AudioQueue_ReleaseAndDestruct_AB4E1+19j
		mov	dword ptr [si],	0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_AB532
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_AB532:				; CODE XREF: AudioQueue_ReleaseAndDestruct_AB4E1+Dj
					; AudioQueue_ReleaseAndDestruct_AB4E1+46j
		pop	di
		pop	si
		pop	bp
		retf
AudioQueue_ReleaseAndDestruct_AB4E1	endp

seg458		ends
