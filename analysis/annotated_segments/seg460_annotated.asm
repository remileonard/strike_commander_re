seg460		segment	para public 'OVERLAY' use16
		assume cs:seg460
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (21 lignes).
; ==============================================================================================
AudioQueue_Helper2_AB860	proc far		; CODE XREF: VROOMM_StubThunk_6D055J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_AB864:
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+34h], ax
		mov	byte ptr [si+40h], 0
		mov	word ptr [si+41h], 0
		mov	word ptr [si+49h], 0
		mov	word ptr [si+43h], 0
		pop	si
		pop	bp
		retf
AudioQueue_Helper2_AB860	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, appelle ModuleRegistry_Opcode_7E_60366 (seg161) — confirme un lien supplémentaire
; entre ce cluster et le registre de modules.
; ==============================================================================================
AudioQueue_OpcodeWrapper_AB883	proc far		; CODE XREF: VROOMM_StubThunk_6D05FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+34h], 0
		jz	short loc_AB89E
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_7E_60366
		pop	cx
		jmp	short $+2

loc_AB89E:				; CODE XREF: AudioQueue_OpcodeWrapper_AB883+Bj
		pop	si
		pop	bp
		retf
AudioQueue_OpcodeWrapper_AB883	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 167 lignes, NON DÉTAILLÉE — combine sub_1069,
; IndexedRecordReader_AdvanceIndex_65E2C, allocateurs typés,
; IndexedRecordReader_SeekToIndex_65C6D (seg196), sub_2AA4.
; ==============================================================================================
AudioQueue_ProcessAndDecode_AB8A1	proc far		; CODE XREF: VROOMM_StubThunk_6D050J AudioQueue_LoadFromMultipleReaders_AB9D7+AFp

var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_AB8A2:
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	ax, [bx+5Dh]

loc_AB8B2:
		mov	[bp+var_2], ax
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADAA
		push	11h
		push	ax
		push	large 0A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	loc_AB983
; ���������������������������������������������������������������������������

loc_AB8D7:				; CODE XREF: AudioQueue_ProcessAndDecode_AB8A1+EAj
		push	[bp+var_6]
		push	[bp+arg_2]

loc_AB8DD:
		call	IndexedRecordReader_AdvanceIndex_65E2C

loc_AB8E2:
		add	sp, 4

loc_AB8E5:
		mov	bx, [bp+arg_2]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_AB8F9
		mov	eax, [bx+61h]
		jmp	short loc_AB900
; ���������������������������������������������������������������������������

loc_AB8F9:				; CODE XREF: AudioQueue_ProcessAndDecode_AB8A1+50j
		mov	bx, [bp+arg_2]
		mov	eax, [bx+71h]

loc_AB900:				; CODE XREF: AudioQueue_ProcessAndDecode_AB8A1+56j
		mov	[bp+var_12], eax
		cmp	[bp+var_12], 0
		jz	short loc_AB980
		mov	ax, [bp+var_6]
		imul	ax, 0Ah

loc_AB911:
		mov	di, [bp+var_4]
		add	di, ax
		mov	eax, [bp+var_12]

loc_AB91A:
		mov	[bp+var_16], eax
		push	0
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch

loc_AB931:
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_1A], ax

loc_AB937:
		mov	eax, [bp+var_1A]
		mov	[di], eax

loc_AB93E:
		mov	byte ptr [di+4], 3

loc_AB942:
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_16]

loc_AB952:
		mov	[di+6],	eax
		cmp	dword ptr [di],	0
		jz	short loc_AB98E
		push	0
		mov	al, [di+4]
		push	ax
		push	large dword ptr	[di]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		push	[bp+arg_2]
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8

loc_AB980:				; CODE XREF: AudioQueue_ProcessAndDecode_AB8A1+68j
		inc	[bp+var_6]

loc_AB983:				; CODE XREF: AudioQueue_ProcessAndDecode_AB8A1+33j
		mov	ax, [bp+var_6]
		cmp	ax, [bp+var_2]
		jge	short loc_AB98E
		jmp	loc_AB8D7
; ���������������������������������������������������������������������������

loc_AB98E:				; CODE XREF: AudioQueue_ProcessAndDecode_AB8A1+B9j
					; AudioQueue_ProcessAndDecode_AB8A1+E8j
		mov	ax, [si+41h]
		inc	word ptr [si+41h]
		shl	ax, 3
		mov	di, si
		add	di, ax
		add	di, 4
		mov	ax, [bp+var_4]

loc_AB9A1:
		mov	[bp+var_8], ax
		mov	ax, [si+45h]

loc_AB9A7:
		mov	[bp+var_A], ax
		mov	ax, [si+47h]

loc_AB9AD:
		mov	[bp+var_C], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_8]
		mov	[di], ax
		push	[bp+var_A]
		call	CRT_Strdup
		pop	cx
		mov	[di+2],	ax
		mov	ax, [bp+var_C]
		mov	[di+4],	ax
		mov	ax, [bp+var_E]
		mov	[di+6],	ax
		pop	di
		pop	si
		leave
		retf
AudioQueue_ProcessAndDecode_AB8A1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 118 lignes, NON DÉTAILLÉE — combine sub_26F2B,
; IndexedRecordReader_ConstructVariantB_65A4A, IndexedRecordReader_AdvanceIndex_65E2C,
; IndexedRecordReader_ConstructVariantA_65A1A, StreamReader_ConstructAndBind_63B23 (seg190),
; AudioQueue_ProcessAndDecode_AB8A1, IndexedRecordReader_Destruct_659D0 (×2, seg196).
; ==============================================================================================
AudioQueue_LoadFromMultipleReaders_AB9D7	proc far		; CODE XREF: VROOMM_StubThunk_6D064J

var_F8		= word ptr -0F8h
var_80		= word ptr -80h
var_1F		= dword	ptr -1Fh
var_1B		= dword	ptr -1Bh
var_13		= word ptr -13h
var_F		= dword	ptr -0Fh
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+41h], 6
		jl	short loc_AB9EF
		jmp	loc_ABAA9
; ���������������������������������������������������������������������������

loc_AB9EF:				; CODE XREF: AudioQueue_LoadFromMultipleReaders_AB9D7+13j
		push	ds
		push	di

loc_AB9F1:
		call	Config_LoadOrCreate

loc_AB9F6:
		add	sp, 4
		or	al, al
		jnz	short loc_ABA00
		jmp	loc_ABAA9
; ���������������������������������������������������������������������������

loc_ABA00:				; CODE XREF: AudioQueue_LoadFromMultipleReaders_AB9D7+24j
		mov	[si+45h], di
		mov	ax, [bp+arg_4]
		mov	[si+47h], ax
		push	1
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_65A4A
		add	sp, 6

loc_ABA18:
		push	[bp+arg_4]
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	eax, [bp+var_1B]
		mov	[bp+var_4], eax

loc_ABA2F:
		mov	ax, [bp+var_13]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_ABA40
		mov	eax, [bp+var_1F]
		jmp	short loc_ABA44
; ���������������������������������������������������������������������������

loc_ABA40:				; CODE XREF: AudioQueue_LoadFromMultipleReaders_AB9D7+61j
		mov	eax, [bp+var_F]

loc_ABA44:				; CODE XREF: AudioQueue_LoadFromMultipleReaders_AB9D7+67j
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_8]
		jz	short loc_ABA9B
		lea	ax, [bp+var_F8]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructAndBind_63B23
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		push	cs
		call	near ptr AudioQueue_ProcessAndDecode_AB8A1
		add	sp, 4
		push	2
		lea	ax, [bp+var_F8]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4

loc_ABA9B:				; CODE XREF: AudioQueue_LoadFromMultipleReaders_AB9D7+80j
		push	2
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4

loc_ABAA9:				; CODE XREF: AudioQueue_LoadFromMultipleReaders_AB9D7+15j
					; AudioQueue_LoadFromMultipleReaders_AB9D7+26j
		pop	di
		pop	si
		leave
		retf
AudioQueue_LoadFromMultipleReaders_AB9D7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine AudioQueue_OpcodeWrapper_AB883, sub_E77, Heap_FreeAndCoalesce_5D30E (seg137).
; ==============================================================================================
AudioQueue_ReleaseAndCoalesce_ABAAD	proc far		; CODE XREF: VROOMM_StubThunk_6D05AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_70994, 0
		jz	short loc_ABB09
		cmp	word ptr [si+34h], 0
		jz	short loc_ABB04
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	ModuleRegistry_Opcode_7E_60366
		pop	cx
		xor	di, di
		jmp	short loc_ABAFF
; ���������������������������������������������������������������������������

loc_ABAD2:				; CODE XREF: AudioQueue_ReleaseAndCoalesce_ABAAD+55j
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADA5
		push	large 190000h
		push	0Ah
		mov	bx, di
		shl	bx, 3
		push	word ptr [bx+si+4]

loc_ABAE8:
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	bx, di

loc_ABAF2:
		shl	bx, 3
		push	word ptr [bx+si+6]
		call	Heap_FreeAndCoalesce_5D30E
		pop	cx
		inc	di

loc_ABAFF:				; CODE XREF: AudioQueue_ReleaseAndCoalesce_ABAAD+23j
		cmp	[si+41h], di
		jg	short loc_ABAD2

loc_ABB04:				; CODE XREF: AudioQueue_ReleaseAndCoalesce_ABAAD+13j
		mov	byte_70994, 0

loc_ABB09:				; CODE XREF: AudioQueue_ReleaseAndCoalesce_ABAAD+Dj
		pop	di
		pop	si
		pop	bp
		retf
AudioQueue_ReleaseAndCoalesce_ABAAD	endp

seg460		ends
