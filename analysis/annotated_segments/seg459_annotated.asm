seg459		segment	para public 'OVERLAY' use16
		assume cs:seg459
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine AudioQueue_Helper_AB82E, AudioQueue_LoadAndPlayEntry_AB592,
; Sequencer_ReleaseSlot_59F87 (seg123).
; ==============================================================================================
AudioQueue_InitAndProcess_AB540	proc far		; CODE XREF: VROOMM_StubThunk_6D015J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_AB541:
		mov	bp, sp

loc_AB543:
		push	si
		push	di

loc_AB545:
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_Helper_AB82E
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+4],	ax
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_LoadAndPlayEntry_AB592
		pop	cx
		xor	di, di
		jmp	short loc_AB57A
; ���������������������������������������������������������������������������

loc_AB560:				; CODE XREF: AudioQueue_InitAndProcess_AB540+3Dj
		push	word ptr [si+4]
		mov	ax, di
		imul	ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 92h	; '�'
		push	dx
		call	Sequencer_ReleaseSlot_59F87
		add	sp, 4
		inc	di

loc_AB57A:				; CODE XREF: AudioQueue_InitAndProcess_AB540+1Ej
		cmp	di, 5
		jl	short loc_AB560
		pop	di
		pop	si
		pop	bp
		retf
AudioQueue_InitAndProcess_AB540	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle AudioQueue_AdvanceSlotEntry_AB770.
; ==============================================================================================
AudioQueue_AdvanceWrapper_AB583	proc far		; CODE XREF: VROOMM_StubThunk_6D01AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr AudioQueue_AdvanceSlotEntry_AB770
		pop	cx
		pop	bp
		retf
AudioQueue_AdvanceWrapper_AB583	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 247 lignes, NON DÉTAILLÉE — orchestrateur majeur du cluster : combine
; IndexedRecordReader_ConstructVariantA_65A1A (seg196), Sequencer_ReleaseSlot_59F87,
; IndexedRecordReader_AdvanceIndex_65E2C, allocateurs typés
; (Memory_TypedFreeWrapperC_5C6F3/Memory_TypedAllocDispatchB_5C832),
; IndexedRecordReader_SeekToIndex_65C6D, Sequencer_ProcessQueue_59FF5,
; Sequencer_AdvanceActiveSlot_59F1D (×2, seg123), IndexedRecordReader_Destruct_659D0 (seg196)
; — cycle complet de chargement et lecture d'une entrée audio/message indexée via le
; séquenceur. Candidat prioritaire pour session dédiée.
; ==============================================================================================
AudioQueue_LoadAndPlayEntry_AB592	proc far		; CODE XREF: VROOMM_StubThunk_6D01FJ AudioQueue_InitAndProcess_AB540+18p

var_E4		= word ptr -0E4h
var_E2		= word ptr -0E2h
var_E0		= dword	ptr -0E0h
var_DC		= byte ptr -0DCh
var_DB		= byte ptr -0DBh
var_DA		= dword	ptr -0DAh
var_D6		= word ptr -0D6h
var_75		= dword	ptr -75h
var_69		= word ptr -69h
var_65		= dword	ptr -65h
var_5E		= word ptr -5Eh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0E4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_70996
		mov	ah, 0

loc_AB5A3:
		cmp	ax, 1
		jz	short loc_AB5B2

loc_AB5A8:
		cmp	ax, 2
		jnz	short loc_AB5C1
		push	37D2h
		jmp	short loc_AB5B5
; ���������������������������������������������������������������������������

loc_AB5B2:				; CODE XREF: AudioQueue_LoadAndPlayEntry_AB592+14j
		push	37D7h

loc_AB5B5:				; CODE XREF: AudioQueue_LoadAndPlayEntry_AB592+1Ej
		lea	ax, [bp+var_6]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_AB5C1:				; CODE XREF: AudioQueue_LoadAndPlayEntry_AB592+19j
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		push	ds
		push	offset aSoundfx	; "soundfx"
		push	ds
		push	offset aSound	; "SOUND"
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_D6]
		push	ax

loc_AB5DF:
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx
		push	1

loc_AB5E7:
		lea	ax, [bp+var_5E]
		push	ax

loc_AB5EB:
		lea	ax, [bp+var_D6]
		push	ax
		mov	bx, [bp+var_D6]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	[bp+var_E0], 0
		mov	[bp+var_DC], 2
		mov	[bp+var_DB], 0
		mov	[bp+var_DA], 0
		mov	[bp+var_E4], 0
		mov	[bp+var_E2], 0FFFFh
		push	word ptr [si+4]
		lea	ax, [bp+var_E4]
		push	ax
		call	Sequencer_ReleaseSlot_59F87
		add	sp, 4

loc_AB632:
		xor	di, di
		jmp	loc_AB70B
; ���������������������������������������������������������������������������

loc_AB637:				; CODE XREF: AudioQueue_LoadAndPlayEntry_AB592+17Ej
		push	di
		lea	ax, [bp+var_D6]
		push	ax

loc_AB63D:
		call	IndexedRecordReader_AdvanceIndex_65E2C

loc_AB642:
		add	sp, 4
		mov	ax, [bp+var_69]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'

loc_AB64E:
		jnz	short loc_AB656

loc_AB650:
		mov	eax, [bp+var_75]
		jmp	short loc_AB65A
; ���������������������������������������������������������������������������

loc_AB656:				; CODE XREF: AudioQueue_LoadAndPlayEntry_AB592:loc_AB64Ej
		mov	eax, [bp+var_65]

loc_AB65A:				; CODE XREF: AudioQueue_LoadAndPlayEntry_AB592+C2j
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch

loc_AB671:
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		mov	bx, di
		imul	bx, 0Ah
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_E]
		mov	[bx+si+8], ax
		mov	[bx+si+6], dx
		mov	bx, di
		imul	bx, 0Ah
		mov	byte ptr [bx+si+0Ah], 3
		mov	bx, di
		imul	bx, 0Ah
		mov	byte ptr [bx+si+0Bh], 1
		mov	bx, di
		imul	bx, 0Ah

loc_AB69F:
		mov	dword ptr [bx+si+0Ch], 0

loc_AB6A7:
		mov	bx, di
		imul	bx, 0Ah
		mov	eax, [bp+var_A]
		mov	[bx+si+0Ch], eax
		push	0
		mov	bx, di
		imul	bx, 0Ah
		mov	al, [bx+si+0Ah]
		push	ax
		mov	bx, di
		imul	bx, 0Ah
		push	large dword ptr	[bx+si+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8
		push	0
		mov	ax, di
		imul	ax, 0Ah
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		lea	ax, [bp+var_E4]
		push	ax
		call	Sequencer_ProcessQueue_59FF5
		add	sp, 6
		lea	ax, [bp+var_E4]
		push	ax
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		inc	di

loc_AB70B:				; CODE XREF: AudioQueue_LoadAndPlayEntry_AB592+A2j
		cmp	di, 0Eh
		jge	short loc_AB713
		jmp	loc_AB637
; ���������������������������������������������������������������������������

loc_AB713:				; CODE XREF: AudioQueue_LoadAndPlayEntry_AB592+17Cj
		lea	ax, [bp+var_E4]
		push	ax

loc_AB718:
		call	Sequencer_AdvanceActiveSlot_59F1D

loc_AB71D:
		pop	cx

loc_AB71E:
		cmp	[bp+var_DB], 0

loc_AB723:
		jz	short loc_AB746

loc_AB725:
		cmp	[bp+var_E0], 0
		jz	short loc_AB746
		push	0
		mov	al, [bp+var_DC]
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6

loc_AB741:
		add	sp, 8
		jmp	short $+2

loc_AB746:				; CODE XREF: AudioQueue_LoadAndPlayEntry_AB592:loc_AB723j
					; AudioQueue_LoadAndPlayEntry_AB592+199j
		mov	[bp+var_E0], 0

loc_AB74F:
		mov	[bp+var_DB], 0
		mov	[bp+var_DA], 0
		push	2
		lea	ax, [bp+var_D6]
		push	ax

loc_AB764:
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
AudioQueue_LoadAndPlayEntry_AB592	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Sequencer_AdvanceActiveSlot_59F1D (seg123).
; ==============================================================================================
AudioQueue_AdvanceSlotEntry_AB770	proc far		; CODE XREF: VROOMM_StubThunk_6D029J AudioQueue_AdvanceWrapper_AB583+9p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_AB79B
; ���������������������������������������������������������������������������

loc_AB77C:				; CODE XREF: AudioQueue_AdvanceSlotEntry_AB770+2Ej
		mov	ax, di
		imul	ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 92h	; '�'
		push	dx
		call	Sequencer_AdvanceActiveSlot_59F1D
		pop	cx
		mov	bx, di
		imul	bx, 11h
		mov	byte ptr [bx+si+0A0h], 0Fh
		inc	di

loc_AB79B:				; CODE XREF: AudioQueue_AdvanceSlotEntry_AB770+Aj
		cmp	di, 5
		jl	short loc_AB77C
		pop	di

loc_AB7A1:
		pop	si
		pop	bp
		retf
AudioQueue_AdvanceSlotEntry_AB770	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine AudioQueue_AdvanceSlotEntry_AB770 et Memory_TypedFree_5C7B6.
; ==============================================================================================
AudioQueue_AdvanceAndRelease_AB7A4	proc far		; CODE XREF: VROOMM_StubThunk_6D024J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_7087C, 0
		jz	short loc_AB82A
		mov	byte_7087C, 0
		push	si
		push	cs
		call	near ptr AudioQueue_AdvanceSlotEntry_AB770
		pop	cx
		xor	di, di
		jmp	short loc_AB825
; ���������������������������������������������������������������������������

loc_AB7C2:				; CODE XREF: AudioQueue_AdvanceAndRelease_AB7A4+84j
		mov	bx, di
		imul	bx, 0Ah
		cmp	byte ptr [bx+si+0Bh], 0
		jz	short loc_AB7FF
		mov	bx, di
		imul	bx, 0Ah
		mov	ax, [bx+si+6]
		or	ax, [bx+si+8]
		jz	short loc_AB7FF
		push	0
		mov	bx, di
		imul	bx, 0Ah
		mov	al, [bx+si+0Ah]
		push	ax
		mov	ax, di
		imul	ax, 0Ah
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_AB7FF:				; CODE XREF: AudioQueue_AdvanceAndRelease_AB7A4+27j
					; AudioQueue_AdvanceAndRelease_AB7A4+34j
		mov	bx, di
		imul	bx, 0Ah
		mov	word ptr [bx+si+8], 0
		mov	word ptr [bx+si+6], 0
		mov	bx, di
		imul	bx, 0Ah
		mov	byte ptr [bx+si+0Bh], 0

loc_AB817:
		mov	bx, di
		imul	bx, 0Ah

loc_AB81C:
		mov	dword ptr [bx+si+0Ch], 0
		inc	di

loc_AB825:				; CODE XREF: AudioQueue_AdvanceAndRelease_AB7A4+1Cj
		cmp	di, 0Eh
		jl	short loc_AB7C2

loc_AB82A:				; CODE XREF: AudioQueue_AdvanceAndRelease_AB7A4+Dj
		pop	di
		pop	si
		pop	bp
		retf
AudioQueue_AdvanceAndRelease_AB7A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (33 lignes).
; ==============================================================================================
AudioQueue_Helper_AB82E	proc far		; CODE XREF: VROOMM_StubThunk_6D010J AudioQueue_InitAndProcess_AB540+Bp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_7087C, 1
		mov	word ptr [si+4], 0
		xor	dx, dx

loc_AB841:
		jmp	short loc_AB84E
; ���������������������������������������������������������������������������

loc_AB843:				; CODE XREF: AudioQueue_Helper_AB82E+23j
		mov	bx, dx
		imul	bx, 11h
		mov	byte ptr [bx+si+0A0h], 0Fh

loc_AB84D:
		inc	dx

loc_AB84E:				; CODE XREF: AudioQueue_Helper_AB82E:loc_AB841j
		cmp	dx, 5
		jl	short loc_AB843
		pop	si

loc_AB854:
		pop	bp
		retf
AudioQueue_Helper_AB82E	endp

seg459		ends
