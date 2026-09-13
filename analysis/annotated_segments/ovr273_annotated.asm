ovr273		segment	para public 'OVERLAY' use16
		assume cs:ovr273
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 273 lignes, NON DÉTAILLÉE — variante de AircraftComponent_LoadWithDwordFields_94D40.
; ==============================================================================================
AircraftComponent_LoadWithDwordFieldsB_952D0	proc far		; CODE XREF: VROOMM_StubThunk_6B940J

var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [si+72h]
		mov	ebx, 7
		cdq
		idiv	ebx
		mov	di, ax
		les	bx, [bp+arg_0]
		add	es:[bx+26h], di
		mov	eax, [si+72h]
		mov	[bp+var_1E], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_22+2],	dx
		mov	word ptr [bp+var_22], ax
		mov	eax, [bp+var_22]
		mov	[bp+var_1A], eax
		mov	[bp+var_16], 2
		mov	[bp+var_15], 1
		mov	[bp+var_14], 0
		mov	eax, [bp+var_1E]
		mov	[bp+var_14], eax
		push	0
		mov	al, [bp+var_16]
		push	ax
		push	large [bp+var_1A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		push	0
		mov	al, [bp+var_16]
		push	ax
		push	large [bp+var_1A]
		push	5C44h

loc_95361:
		call	Memory_TypedAllocDispatchB_5C832

loc_95366:
		add	sp, 0Ah
		mov	word ptr [bp+var_26+2],	dx
		mov	word ptr [bp+var_26], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large dword ptr	es:[bx+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_28], dx
		mov	[bp+var_2A], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_2E], eax
		push	0
		mov	al, es:[bx+20h]
		push	ax
		push	large dword ptr	es:[bx+1Ch]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_30], dx
		mov	[bp+var_32], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+26h]
		sub	si, di
		jmp	loc_9554F
; ���������������������������������������������������������������������������

loc_953C4:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+288j
		les	bx, [bp+var_26]
		mov	al, es:[bx+1]
		cbw
		imul	ax, 18h
		mov	dx, word ptr [bp+var_2E+2]
		mov	bx, word ptr [bp+var_2E]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		mov	bx, word ptr [bp+var_26]
		mov	al, es:[bx+2]
		cbw
		imul	ax, 18h
		mov	bx, word ptr [bp+var_2E]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	bx, word ptr [bp+var_26]
		mov	al, es:[bx+1]
		cbw
		imul	ax, 12h
		mov	dx, [bp+var_28]
		mov	bx, [bp+var_2A]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		mov	bx, word ptr [bp+var_26]
		mov	al, es:[bx+2]
		cbw
		imul	ax, 12h
		mov	bx, [bp+var_2A]
		add	bx, ax
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], bx
		mov	ax, word ptr dword_6E8D0
		xor	dx, dx
		sub	ax, [bp+var_32]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, [bp+var_26]
		mov	al, es:[bx]
		cbw
		cmp	ax, 2
		jz	short loc_954A8
		cmp	ax, 3
		jnz	short loc_95455
		jmp	loc_954FA
; ���������������������������������������������������������������������������

loc_95455:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+180j
		push	large [bp+var_26]
		push	large [bp+var_8]
		push	large [bp+var_4]

loc_95461:
		push	large [dword_6E8D4]
		call	Keyframe_InitWithParam
		add	sp, 10h
		push	13h
		push	ds
		push	offset word_72254
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Keyframe_InitVector
		add	sp, 10h
		add	word ptr dword_6E8D0, 13h
		add	word ptr dword_6E8D4, 0Bh
		jmp	loc_9554A
; ���������������������������������������������������������������������������

loc_954A8:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+17Bj
		push	large [bp+var_26]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Keyframe_InitWithEasing
		add	sp, 10h
		push	16h
		push	ds
		push	offset word_72267
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Keyframe_VectorInitWithParam
		add	sp, 10h
		add	word ptr dword_6E8D0, 16h
		add	word ptr dword_6E8D4, 0Eh
		jmp	short loc_9554A
; ���������������������������������������������������������������������������

loc_954FA:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+182j
		push	large [bp+var_26]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Keyframe_InitWithTwoParams
		add	sp, 10h
		push	14h
		push	ds
		push	offset word_7227D
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Keyframe_InitVector
		add	sp, 10h
		add	word ptr dword_6E8D0, 14h
		add	word ptr dword_6E8D4, 0Ch

loc_9554A:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+1D5j
					; AircraftComponent_LoadWithDwordFieldsB_952D0+228j
		inc	si
		add	word ptr [bp+var_26], 7

loc_9554F:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+F1j
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], si
		jle	short loc_9555B
		jmp	loc_953C4
; ���������������������������������������������������������������������������

loc_9555B:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+286j
		cmp	[bp+var_15], 0
		jz	short loc_9557F

loc_95561:
		cmp	[bp+var_1A], 0
		jz	short loc_9557F
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax

loc_95572:
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_9557F:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+28Fj
					; AircraftComponent_LoadWithDwordFieldsB_952D0+296j
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadWithDwordFieldsB_952D0	endp

ovr273		ends
