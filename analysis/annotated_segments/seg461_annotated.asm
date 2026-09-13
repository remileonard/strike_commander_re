seg461		segment	para public 'OVERLAY' use16
		assume cs:seg461
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 119 lignes, NON DÉTAILLÉE — combine IndexedRecordReader_AdvanceIndex_65E2C,
; Memory_TypedFree_5C7B6, Memory_TypedFreeWrapperC_5C6F3, Memory_TypedAllocDispatchB_5C832,
; IndexedRecordReader_SeekToIndex_65C6D (seg196).
; ==============================================================================================
AudioQueue_ProcessAndDecodeB_ABB10	proc far		; CODE XREF: VROOMM_StubThunk_6D090J AudioQueue_MainProcessEntry_ABBEF+139p

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_ABB13:
		sub	sp, 0Ch
		push	si
		push	di

loc_ABB18:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_4]
		push	di

loc_ABB22:
		call	IndexedRecordReader_AdvanceIndex_65E2C

loc_ABB27:
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h

loc_ABB30:
		cmp	ax, 0C0h ; '�'
		jnz	short loc_ABB3B
		mov	eax, [di+61h]
		jmp	short loc_ABB3F
; ���������������������������������������������������������������������������

loc_ABB3B:				; CODE XREF: AudioQueue_ProcessAndDecodeB_ABB10+23j
		mov	eax, [di+71h]

loc_ABB3F:				; CODE XREF: AudioQueue_ProcessAndDecodeB_ABB10+29j
		mov	[bp+var_4], eax

loc_ABB43:
		cmp	[bp+var_4], 0

loc_ABB48:
		jnz	short loc_ABB4D
		jmp	loc_ABBEB
; ���������������������������������������������������������������������������

loc_ABB4D:				; CODE XREF: AudioQueue_ProcessAndDecodeB_ABB10:loc_ABB48j
		cmp	byte ptr [si+3Bh], 0
		jz	short loc_ABB73

loc_ABB53:
		cmp	dword ptr [si+36h], 0
		jz	short loc_ABB73
		push	0
		mov	al, [si+3Ah]
		push	ax
		mov	ax, si
		add	ax, 36h	; '6'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_ABB73:				; CODE XREF: AudioQueue_ProcessAndDecodeB_ABB10+41j
					; AudioQueue_ProcessAndDecodeB_ABB10+48j
		mov	dword ptr [si+36h], 0
		mov	byte ptr [si+3Bh], 0
		mov	dword ptr [si+3Ch], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+36h], eax
		mov	byte ptr [si+3Ah], 3
		mov	byte ptr [si+3Bh], 1
		mov	dword ptr [si+3Ch], 0
		mov	eax, [bp+var_8]
		mov	[si+3Ch], eax
		push	0
		mov	al, [si+3Ah]
		push	ax
		push	large dword ptr	[si+36h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]

loc_ABBE2:
		push	di

loc_ABBE3:
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8

loc_ABBEB:				; CODE XREF: AudioQueue_ProcessAndDecodeB_ABB10+3Aj
		pop	di
		pop	si

locret_ABBED:
		leave
		retf
AudioQueue_ProcessAndDecodeB_ABB10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 254 lignes, NON DÉTAILLÉE — dernière grosse fonction du fichier : combine
; AudioQueue_OpcodeHelper_ABDAF, sub_2ADC, sub_26F2B,
; IndexedRecordReader_ConstructVariantA_65A1A (×2, seg196),
; IndexedRecordReader_AdvanceIndex_65E2C, StreamReader_ConstructAndBind_63B23 (seg190),
; AudioQueue_ProcessAndDecodeB_ABB10, IndexedRecordReader_Destruct_659D0 (×2),
; Memory_TypedAllocDispatchB_5C832, ModuleRegistry_Opcode_7B_6034E/_7D_60360 (seg161) — point
; d'entrée principal de traitement d'une entrée de la file audio/message. Candidat pour
; session dédiée.
; ==============================================================================================
AudioQueue_MainProcessEntry_ABBEF	proc far		; CODE XREF: VROOMM_StubThunk_6D095J

var_FC		= word ptr -0FCh
var_84		= word ptr -84h
var_23		= dword	ptr -23h
var_1F		= dword	ptr -1Fh
var_17		= word ptr -17h
var_13		= dword	ptr -13h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp

loc_ABBF0:
		mov	bp, sp

loc_ABBF2:
		sub	sp, 0FCh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		xor	di, di
		cmp	word ptr [si+34h], 0
		jnz	short loc_ABC0A
		jmp	loc_ABDA8
; ���������������������������������������������������������������������������

loc_ABC0A:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+16j
		push	1
		push	si
		nop
		push	cs

loc_ABC0F:
		call	near ptr AudioQueue_OpcodeHelper_ABDAF
		add	sp, 4
		mov	ah, 0

loc_ABC17:
		or	ax, ax
		jz	short loc_ABC26
		mov	al, [si+40h]
		cmp	al, [bp+arg_8]
		jb	short loc_ABC26
		jmp	loc_ABDA8
; ���������������������������������������������������������������������������

loc_ABC26:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+2Aj
					; AudioQueue_MainProcessEntry_ABBEF+32j
		mov	[bp+var_4], 0
		jmp	short loc_ABC74
; ���������������������������������������������������������������������������

loc_ABC2D:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+8Bj
		mov	ax, [bp+var_4]
		shl	ax, 3

loc_ABC33:
		mov	dx, si

loc_ABC35:
		add	dx, ax

loc_ABC37:
		add	dx, 4
		mov	word ptr [bp+var_8+2], dx

loc_ABC3D:
		push	[bp+arg_2]

loc_ABC40:
		mov	bx, word ptr [bp+var_8+2]

loc_ABC43:
		push	word ptr [bx+2]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_ABC71
		mov	bx, word ptr [bp+var_8+2]
		mov	ax, [bx+4]
		cmp	ax, [bp+arg_4]
		jnz	short loc_ABC71
		mov	ax, [bx+6]
		cmp	ax, [bp+arg_6]
		jle	short loc_ABC71
		mov	ax, [bp+arg_6]
		imul	ax, 0Ah
		mov	di, [bx]
		add	di, ax
		jmp	short loc_ABC7C
; ���������������������������������������������������������������������������

loc_ABC71:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+61j
					; AudioQueue_MainProcessEntry_ABBEF+6Cj ...
		inc	[bp+var_4]

loc_ABC74:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+3Cj
		mov	ax, [si+41h]
		cmp	ax, [bp+var_4]
		jg	short loc_ABC2D

loc_ABC7C:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+80j
		or	di, di
		jz	short loc_ABC83
		jmp	loc_ABD51
; ���������������������������������������������������������������������������

loc_ABC83:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+8Fj
		push	ds
		push	[bp+arg_2]
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jnz	short loc_ABC96
		jmp	loc_ABD51
; ���������������������������������������������������������������������������

loc_ABC96:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+A2j
		lea	ax, [bp+var_84]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx

loc_ABCA1:
		push	1

loc_ABCA3:
		push	[bp+arg_2]

loc_ABCA6:
		lea	ax, [bp+var_84]
		push	ax
		mov	bx, [bp+var_84]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_84]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	eax, [bp+var_1F]
		mov	[bp-8],	eax
		mov	ax, [bp+var_17]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_ABCDE
		mov	eax, [bp+var_23]
		jmp	short loc_ABCE2
; ���������������������������������������������������������������������������

loc_ABCDE:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+E7j
		mov	eax, [bp+var_13]

loc_ABCE2:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+EDj
		mov	edx, [bp-8]
		add	edx, eax
		mov	[bp+var_C], edx
		mov	eax, [bp-8]

loc_ABCF1:
		cmp	eax, [bp+var_C]
		jz	short loc_ABD3D
		lea	ax, [bp+var_FC]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx
		push	0
		push	large [bp+var_C]
		push	large dword ptr	[bp-8]
		lea	ax, [bp+var_84]
		push	ax

loc_ABD11:
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ConstructAndBind_63B23
		add	sp, 0Eh
		push	[bp+arg_6]
		lea	ax, [bp+var_FC]
		push	ax
		push	si
		push	cs
		call	near ptr AudioQueue_ProcessAndDecodeB_ABB10
		add	sp, 6
		push	2
		lea	ax, [bp+var_FC]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4

loc_ABD3D:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+106j
		mov	di, si

loc_ABD3F:
		add	di, 36h	; '6'
		push	2
		lea	ax, [bp+var_84]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4

loc_ABD51:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+91j
					; AudioQueue_MainProcessEntry_ABBEF+A4j
		or	di, di

loc_ABD53:
		jz	short loc_ABDA8
		cmp	dword ptr [di],	0
		jz	short loc_ABDA8
		push	0
		mov	al, [di+4]
		push	ax
		push	large dword ptr	[di]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_ABDA8
		mov	[si+43h], di
		mov	bx, [si+34h]
		mov	di, [bx+4]
		push	0FFFFh
		push	dx
		push	ax
		push	di
		call	ModuleRegistry_Opcode_7B_6034E
		add	sp, 8
		push	di
		call	ModuleRegistry_Opcode_7D_60360
		pop	cx
		mov	[bp+var_1], 1
		mov	al, [bp+arg_8]
		mov	[si+40h], al
		mov	word ptr [si+49h], 0

loc_ABDA8:				; CODE XREF: AudioQueue_MainProcessEntry_ABBEF+18j
					; AudioQueue_MainProcessEntry_ABBEF+34j ...
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
AudioQueue_MainProcessEntry_ABBEF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle ModuleRegistry_Opcode_7C_6035A (seg161).
; ==============================================================================================
AudioQueue_OpcodeHelper_ABDAF	proc far		; CODE XREF: VROOMM_StubThunk_6D09AJ
					; AudioQueue_MainProcessEntry_ABBEF:loc_ABC0Fp

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp

loc_ABDB2:
		sub	sp, 2
		push	si

loc_ABDB6:
		mov	si, [bp+arg_0]
		mov	dl, 0
		cmp	word ptr [si+34h], 0
		jz	short loc_ABDE7
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_7C_6035A
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 2
		jnz	short loc_ABDE3
		mov	al, [si+40h]
		cmp	al, [bp+arg_2]
		jb	short loc_ABDE3
		mov	ax, 1
		jmp	short loc_ABDE5
; ���������������������������������������������������������������������������

loc_ABDE3:				; CODE XREF: AudioQueue_OpcodeHelper_ABDAF+25j
					; AudioQueue_OpcodeHelper_ABDAF+2Dj
		xor	ax, ax

loc_ABDE5:				; CODE XREF: AudioQueue_OpcodeHelper_ABDAF+32j
		mov	dl, al

loc_ABDE7:				; CODE XREF: AudioQueue_OpcodeHelper_ABDAF+10j
		mov	al, dl
		pop	si
		leave
		retf
AudioQueue_OpcodeHelper_ABDAF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dernière fonction du fichier — combine ModuleRegistry_Opcode_7C_6035A,
; Memory_TypedAllocDispatchB_5C832, ModuleRegistry_Opcode_7B_6034E,
; ModuleRegistry_Opcode_7D_60360 (seg161), Memory_TypedFree_5C7B6 — finalisation/nettoyage
; d'une entrée de la file audio/message.
; ==============================================================================================
AudioQueue_FinalizeAndRelease_ABDEC	proc far		; CODE XREF: VROOMM_StubThunk_6D09FJ

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+34h], 0
		jnz	short loc_ABE00
		jmp	loc_ABE9B
; ���������������������������������������������������������������������������

loc_ABE00:				; CODE XREF: AudioQueue_FinalizeAndRelease_ABDEC+Fj
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_7C_6035A
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 2

loc_ABE13:
		jnz	short loc_ABE18
		jmp	loc_ABE9B
; ���������������������������������������������������������������������������

loc_ABE18:				; CODE XREF: AudioQueue_FinalizeAndRelease_ABDEC:loc_ABE13j
		cmp	word ptr [si+49h], 0
		jz	short loc_ABE58
		mov	bx, [si+34h]
		mov	di, [bx+4]

loc_ABE24:
		push	large 0FFFF0000h
		mov	bx, [si+43h]
		mov	al, [bx+4]
		push	ax
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax

loc_ABE43:
		push	di

loc_ABE44:
		call	ModuleRegistry_Opcode_7B_6034E
		add	sp, 8
		push	di

loc_ABE4D:
		call	ModuleRegistry_Opcode_7D_60360
		pop	cx

loc_ABE53:
		dec	word ptr [si+49h]
		jmp	short loc_ABE9B
; ���������������������������������������������������������������������������

loc_ABE58:				; CODE XREF: AudioQueue_FinalizeAndRelease_ABDEC+30j
		mov	word ptr [si+43h], 0
		cmp	byte ptr [si+3Bh], 0
		jz	short loc_ABE83
		cmp	dword ptr [si+36h], 0
		jz	short loc_ABE83
		push	0
		mov	al, [si+3Ah]
		push	ax
		mov	ax, si
		add	ax, 36h	; '6'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_ABE83:				; CODE XREF: AudioQueue_FinalizeAndRelease_ABDEC+75j
					; AudioQueue_FinalizeAndRelease_ABDEC+7Cj
		mov	dword ptr [si+36h], 0
		mov	byte ptr [si+3Bh], 0
		mov	dword ptr [si+3Ch], 0
		mov	byte ptr [si+40h], 0

loc_ABE9B:				; CODE XREF: AudioQueue_FinalizeAndRelease_ABDEC+11j
					; AudioQueue_FinalizeAndRelease_ABDEC+29j ...
		pop	di
		pop	si
		leave
		retf
AudioQueue_FinalizeAndRelease_ABDEC	endp

seg461		ends
