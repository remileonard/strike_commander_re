seg454		segment	para public 'OVERLAY' use16
		assume cs:seg454
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère une entrée (Memory_TypedFreeWrapperC_5C6F3, seg131).
; ==============================================================================================
TextCycler_ReleaseEntry_A7060	proc far		; CODE XREF: VROOMM_StubThunk_6CD3AJ TextCycler_ReadTypedEntry_A70B7+3Dp	...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_4]
		imul	[bp+arg_6]
		movsx	eax, ax
		mov	[bp+var_4], eax

loc_A7078:
		cmp	byte_6E339, 0
		jz	short loc_A7083
		mov	[bp+arg_8], 3

loc_A7083:				; CODE XREF: TextCycler_ReleaseEntry_A7060+1Dj
		push	1
		push	0
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+var_4]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+2],	dx
		mov	[si], ax
		mov	al, [bp+arg_8]
		mov	[si+4],	al
		mov	al, byte ptr [bp+arg_4]
		mov	[si+5],	al
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
TextCycler_ReleaseEntry_A7060	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 77 lignes, NON DÉTAILLÉE — combine StreamReader_ReadTyped_63FA1 (×2, seg190),
; TextCycler_ReleaseEntry_A7060, Memory_TypedAllocDispatchB_5C832 — lecture d'une entrée typée
; dans un cycle de texte.
; ==============================================================================================
TextCycler_ReadTypedEntry_A70B7	proc far		; CODE XREF: VROOMM_StubThunk_6CD44J TextCycler_LoadFromIndexedReader_A713E+3Dp	...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	large 0FFFFFFFFh
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	di
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		push	2
		push	large [bp+var_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TextCycler_ReleaseEntry_A7060
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_8], eax
		cmp	eax, 0
		jz	short loc_A712C
		push	large 0FFFFFFFFh
		push	eax
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
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh

loc_A712C:				; CODE XREF: TextCycler_ReadTypedEntry_A70B7+4Fj
		cmp	[bp+var_8], 0
		jz	short loc_A7138

loc_A7133:
		mov	ax, 1
		jmp	short loc_A713A
; ���������������������������������������������������������������������������

loc_A7138:				; CODE XREF: TextCycler_ReadTypedEntry_A70B7+7Aj
		xor	ax, ax

loc_A713A:				; CODE XREF: TextCycler_ReadTypedEntry_A70B7+7Fj
		pop	di
		pop	si

locret_A713C:
		leave
		retf
TextCycler_ReadTypedEntry_A70B7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 97 lignes, NON DÉTAILLÉE — combine IndexedRecordReader_AdvanceIndex_65E2C (seg196),
; TextCycler_ReadTypedEntry_A70B7 (×2), StreamReader_ConstructVariantC_63AD3 (seg190),
; StreamReader_ValidateState_63DB5, StreamReader_Close_63BD5 — charge une entrée de texte
; cyclique depuis un lecteur d'enregistrement indexé (probable file de dialogues/messages).
; ==============================================================================================
TextCycler_LoadFromIndexedReader_A713E	proc far		; CODE XREF: VROOMM_StubThunk_6CD49J TextCycler_AdvanceRandomB_A730E+6Bp	...

var_B0		= word ptr -0B0h
var_52		= word ptr -52h
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	[bp+var_1], 0
		cmp	[bp+arg_4], 0
		jz	short loc_A7186
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	IndexedRecordReader_AdvanceIndex_65E2C

loc_A7172:
		add	sp, 4
		push	[bp+arg_4]

loc_A7178:
		push	di
		push	si

loc_A717A:
		push	cs
		call	near ptr TextCycler_ReadTypedEntry_A70B7
		add	sp, 6

loc_A7181:
		mov	[bp+var_1], al
		jmp	short loc_A71DE
; ���������������������������������������������������������������������������

loc_A7186:				; CODE XREF: TextCycler_LoadFromIndexedReader_A713E+27j
		push	ds

loc_A7187:				; ".TXM"
		push	offset a_txm
		push	ds
		push	di
		push	ds
		push	offset unk_70432
		lea	ax, [bp+var_52]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantC_63AD3
		add	sp, 6
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ValidateState_63DB5
		pop	cx
		or	al, al
		jz	short loc_A71CF
		lea	ax, [bp+var_B0]
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr TextCycler_ReadTypedEntry_A70B7
		add	sp, 6
		mov	[bp+var_1], al

loc_A71CF:				; CODE XREF: TextCycler_LoadFromIndexedReader_A713E+7Ej
		push	2
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_Close_63BD5
		add	sp, 4

loc_A71DE:				; CODE XREF: TextCycler_LoadFromIndexedReader_A713E+46j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
TextCycler_LoadFromIndexedReader_A713E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un tampon typé (Memory_TypedFree_5C7B6).
; ==============================================================================================
TextCycler_ReleaseBuffer_A71E5	proc far		; CODE XREF: VROOMM_StubThunk_6CD3FJ TextCycler_ReleaseEntryConditional_A721F+11p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+4], 0FFh
		jnz	short loc_A71F7
		mov	ax, 1
		jmp	short loc_A71F9
; ���������������������������������������������������������������������������

loc_A71F7:				; CODE XREF: TextCycler_ReleaseBuffer_A71E5+Bj
		xor	ax, ax

loc_A71F9:				; CODE XREF: TextCycler_ReleaseBuffer_A71E5+10j
		or	al, al
		jz	short loc_A720A
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		jmp	short loc_A721C
; ���������������������������������������������������������������������������

loc_A720A:				; CODE XREF: TextCycler_ReleaseBuffer_A71E5+16j
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_A721C:				; CODE XREF: TextCycler_ReleaseBuffer_A71E5+23j
		pop	si
		pop	bp
		retf
TextCycler_ReleaseBuffer_A71E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un tampon (TextCycler_ReleaseBuffer_A71E5) puis l'objet lui-même si un flag (bit
; 0 de arg_2) est posé (sub_338).
; ==============================================================================================
TextCycler_ReleaseEntryConditional_A721F	proc far		; CODE XREF: VROOMM_StubThunk_6CD4EJ TextCycler_ReleaseAndReset_A73BA+37p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A7241
		push	si
		push	cs
		call	near ptr TextCycler_ReleaseBuffer_A71E5
		pop	cx
		test	di, 1
		jz	short loc_A7241

loc_A723A:
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A7241:				; CODE XREF: TextCycler_ReleaseEntryConditional_A721F+Dj
					; TextCycler_ReleaseEntryConditional_A721F+19j
		pop	di
		pop	si
		pop	bp
		retf
TextCycler_ReleaseEntryConditional_A721F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 93 lignes, NON DÉTAILLÉE — combine sub_1069, TextCycler_ReleaseEntry_A7060,
; Memory_TypedAllocDispatchB_5C832, ResourceRecord_ReadFieldGroupA_64A19 (seg193), sub_70D
; (générateur aléatoire), Anim_AdvanceFrameCycle_4FB84 (seg111) — probable sélection aléatoire
; d'une entrée de texte/dialogue suivante.
; ==============================================================================================
TextCycler_AdvanceRandomA_A7245	proc far		; CODE XREF: VROOMM_StubThunk_6CD53J

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	ax, [bp+arg_6]
		imul	[bp+arg_8]
		movsx	eax, ax
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_A]

loc_A7271:
		mov	[si+6],	ax
		push	seg seg331

loc_A7277:
		push	offset VROOMM_StubThunk_6CD35
		push	11h
		push	word ptr [si+6]
		push	large 60000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+8],	ax
		mov	di, [si+8]
		mov	[bp+var_6], 0
		jmp	short loc_A72D8
; ���������������������������������������������������������������������������

loc_A729A:				; CODE XREF: TextCycler_AdvanceRandomA_A7245+99j
		push	2
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	cs
		call	near ptr TextCycler_ReleaseEntry_A7060
		add	sp, 0Ah
		push	large [bp+var_4]
		push	0
		mov	al, [di+4]
		push	ax
		push	large dword ptr	[di]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		inc	[bp+var_6]
		add	di, 6

loc_A72D8:				; CODE XREF: TextCycler_AdvanceRandomA_A7245+53j
		mov	ax, [si+6]
		cmp	ax, [bp+var_6]
		jg	short loc_A729A
		mov	[bp+var_8], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_8]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[si+0Ah], ax
		push	si
		call	Anim_AdvanceFrameCycle_4FB84
		pop	cx
		pop	di
		pop	si
		leave
		retf
TextCycler_AdvanceRandomA_A7245	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 93 lignes, NON DÉTAILLÉE — variante de TextCycler_AdvanceRandomA_A7245 combinant
; sub_2945 (formatage), TextCycler_LoadFromIndexedReader_A713E, sub_70D,
; Anim_AdvanceFrameCycle_4FB84.
; ==============================================================================================
TextCycler_AdvanceRandomB_A730E	proc far		; CODE XREF: VROOMM_StubThunk_6CD58J TextCycler_AdvanceRandomBWithErrorCheck_A74A5+2Bp

var_14		= word ptr -14h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	ax, [bp+arg_4]
		mov	[si+6],	ax
		push	seg seg331

loc_A7332:
		push	offset VROOMM_StubThunk_6CD35
		push	11h

loc_A7337:
		push	word ptr [si+6]

loc_A733A:
		push	large 60000h

loc_A7340:
		call	CRT_Doprnt_Dispatch

loc_A7345:
		add	sp, 0Ch
		mov	[si+8],	ax
		mov	ax, [si+8]
		mov	[bp+var_2], ax
		xor	di, di
		jmp	short loc_A7384
; ���������������������������������������������������������������������������

loc_A7355:				; CODE XREF: TextCycler_AdvanceRandomB_A730E+79j
		push	di
		push	[bp+arg_2]
		push	3390h
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	ax, [bp+arg_8]
		add	ax, di
		push	ax
		push	[bp+arg_6]

loc_A7371:
		lea	ax, [bp+var_14]
		push	ax
		push	[bp+var_2]
		push	cs
		call	near ptr TextCycler_LoadFromIndexedReader_A713E
		add	sp, 8
		add	[bp+var_2], 6
		inc	di

loc_A7384:				; CODE XREF: TextCycler_AdvanceRandomB_A730E+45j
		cmp	[si+6],	di
		jg	short loc_A7355
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_4]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[si+0Ah], ax
		push	si
		call	Anim_AdvanceFrameCycle_4FB84
		pop	cx
		pop	di
		pop	si
		leave
		retf
TextCycler_AdvanceRandomB_A730E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_E77, TextCycler_ReleaseEntryConditional_A721F, sub_338.
; ==============================================================================================
TextCycler_ReleaseAndReset_A73BA	proc far		; CODE XREF: VROOMM_StubThunk_6CD5DJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A7404
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		push	seg seg331
		push	offset VROOMM_StubThunk_6CD4E
		push	large 190000h
		push	6
		push	word ptr [si+8]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	0
		push	si
		push	cs
		call	near ptr TextCycler_ReleaseEntryConditional_A721F
		add	sp, 4
		test	di, 1
		jz	short loc_A7404
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A7404:				; CODE XREF: TextCycler_ReleaseAndReset_A73BA+Dj
					; TextCycler_ReleaseAndReset_A73BA+41j
		pop	di
		pop	si
		pop	bp
		retf
TextCycler_ReleaseAndReset_A73BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_1069 (×2).
; ==============================================================================================
TextCycler_Helper_A7408	proc far		; CODE XREF: VROOMM_StubThunk_6CD62J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx], ax
		mov	ax, [bp+arg_6]
		mov	es:[bx+2], ax
		cmp	word ptr es:[bx], 0
		jz	short loc_A7441
		push	seg seg331
		push	offset VROOMM_StubThunk_6CD35
		push	11h
		push	word ptr es:[bx]

loc_A742C:
		push	large 60000h
		call	CRT_Doprnt_Dispatch

loc_A7437:
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax

loc_A7441:				; CODE XREF: TextCycler_Helper_A7408+17j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_A746C
		push	seg seg331
		push	offset VROOMM_StubThunk_6CD30
		push	11h
		push	word ptr es:[bx+2]
		push	large 0C0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax

loc_A746C:				; CODE XREF: TextCycler_Helper_A7408+41j
		pop	bp
		retf
TextCycler_Helper_A7408	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle TextCycler_LoadFromIndexedReader_A713E avec gestion d'erreur (sub_6B70F).
; ==============================================================================================
TextCycler_LoadWithErrorCheck_A746E	proc far		; CODE XREF: VROOMM_StubThunk_6CD67J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp

loc_A7471:
		mov	cx, [bp+arg_4]
		les	bx, [bp+arg_0]
		cmp	es:[bx], cx
		jbe	short loc_A749A
		push	[bp+arg_A]
		push	[bp+arg_8]

loc_A7482:
		push	[bp+arg_6]
		mov	ax, es:[bx+4]
		mov	dx, cx
		imul	dx, 6
		add	ax, dx
		push	ax
		push	cs
		call	near ptr TextCycler_LoadFromIndexedReader_A713E
		add	sp, 8
		jmp	short loc_A74A3
; ���������������������������������������������������������������������������

loc_A749A:				; CODE XREF: TextCycler_LoadWithErrorCheck_A746E+Cj
		push	902Dh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A74A3:				; CODE XREF: TextCycler_LoadWithErrorCheck_A746E+2Aj
		pop	bp
		retf
TextCycler_LoadWithErrorCheck_A746E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle TextCycler_AdvanceRandomB_A730E avec gestion d'erreur (sub_6B70F).
; ==============================================================================================
TextCycler_AdvanceRandomBWithErrorCheck_A74A5	proc far		; CODE XREF: VROOMM_StubThunk_6CD6CJ

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_4]
		les	bx, [bp+arg_0]
		sub	cx, es:[bx]
		cmp	es:[bx+2], cx
		jbe	short loc_A74D8
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, es:[bx+6]
		mov	dx, cx
		imul	dx, 0Ch
		add	ax, dx
		push	ax
		push	cs
		call	near ptr TextCycler_AdvanceRandomB_A730E
		add	sp, 0Ah
		jmp	short loc_A74E1
; ���������������������������������������������������������������������������

loc_A74D8:				; CODE XREF: TextCycler_AdvanceRandomBWithErrorCheck_A74A5+10j
		push	902Eh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A74E1:				; CODE XREF: TextCycler_AdvanceRandomBWithErrorCheck_A74A5+31j
		pop	bp
		retf
TextCycler_AdvanceRandomBWithErrorCheck_A74A5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_E77 (×2).
; ==============================================================================================
TextCycler_Helper2_A74E3	proc far		; CODE XREF: VROOMM_StubThunk_6CD71J TextCycler_ReleaseResource_A7538+13p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	seg seg331
		push	offset VROOMM_StubThunk_6CD4E
		push	large 190000h
		push	6
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg331
		push	offset VROOMM_StubThunk_6CD5D
		push	large 190000h
		push	0Ch
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+6], ax
		mov	es:[bx+4], ax
		xor	ax, ax

loc_A752F:
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		pop	bp
		retf
TextCycler_Helper2_A74E3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine TextCycler_Helper2_A74E3 et sub_346 (désallocation runtime).
; ==============================================================================================
TextCycler_ReleaseResource_A7538	proc far		; CODE XREF: VROOMM_StubThunk_6CD76J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_A7563
		push	large [bp+arg_0]
		push	cs
		call	near ptr TextCycler_Helper2_A74E3
		add	sp, 4
		test	si, 1
		jz	short loc_A7563
		push	large [bp+arg_0]
		call	CRT_Free_NearOrFar
		add	sp, 4

loc_A7563:				; CODE XREF: TextCycler_ReleaseResource_A7538+Cj
					; TextCycler_ReleaseResource_A7538+1Dj
		pop	si
		pop	bp
		retf
TextCycler_ReleaseResource_A7538	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658).
; ==============================================================================================
TextCycler_AllocateA_A7566	proc far		; CODE XREF: VROOMM_StubThunk_6CD35J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A757F
		push	6

loc_A7573:
		call	CRT_Malloc16_Retry

loc_A7578:
		pop	cx
		mov	si, ax
		or	ax, ax

loc_A757D:
		jz	short loc_A758A

loc_A757F:				; CODE XREF: TextCycler_AllocateA_A7566+9j
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2

loc_A758A:				; CODE XREF: TextCycler_AllocateA_A7566:loc_A757Dj
		mov	ax, si
		pop	si
		pop	bp
		retf
TextCycler_AllocateA_A7566	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658).
; ==============================================================================================
TextCycler_AllocateB_A758F	proc far		; CODE XREF: VROOMM_StubThunk_6CD30J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A75A8
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A75C0

loc_A75A8:				; CODE XREF: TextCycler_AllocateB_A758F+9j
		mov	dword ptr [si],	0
		mov	byte ptr [si+4], 2
		mov	word ptr [si+8], 0
		xor	ax, ax
		mov	[si+0Ah], ax
		mov	[si+6],	ax

loc_A75C0:				; CODE XREF: TextCycler_AllocateB_A758F+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TextCycler_AllocateB_A758F	endp

seg454		ends
