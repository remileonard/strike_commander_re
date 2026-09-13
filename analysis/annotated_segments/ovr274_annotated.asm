ovr274		segment	para public 'OVERLAY' use16
		assume cs:ovr274
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 252 lignes, NON DÉTAILLÉE — variante de AircraftComponent_LoadWithDwordFields_94D40.
; ==============================================================================================
AircraftComponent_LoadWithDwordFieldsC_95590	proc far		; CODE XREF: VROOMM_StubThunk_6B970J

var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax
		les	bx, [bp+arg_0]
		add	es:[bx+26h], di
		mov	eax, [si+72h]
		mov	[bp+var_16], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[bp+var_12], eax
		mov	[bp+var_E], 2
		mov	[bp+var_D], 1
		mov	[bp+var_C], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_C], eax
		push	0
		mov	al, [bp+var_E]
		push	ax
		push	large [bp+var_12]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		push	0
		mov	al, [bp+var_E]
		push	ax
		push	large [bp+var_12]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_1E+2],	dx
		mov	word ptr [bp+var_1E], ax
		push	0
		mov	al, [bp+var_E]
		push	ax
		push	large [bp+var_12]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_1E+2],	dx
		mov	word ptr [bp+var_1E], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large dword ptr	es:[bx+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832

loc_95661:
		add	sp, 0Ah
		mov	[bp+var_20], dx

loc_95667:
		mov	[bp+var_22], ax
		les	bx, [bp+arg_0]

loc_9566D:
		mov	eax, es:[bx+4]
		mov	[bp+var_26], eax
		push	0
		mov	al, es:[bx+20h]
		push	ax
		push	large dword ptr	es:[bx+1Ch]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_28], dx
		mov	[bp+var_2A], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+26h]
		sub	si, di
		jmp	loc_957BE
; ���������������������������������������������������������������������������

loc_9569F:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+237j
		les	bx, [bp+var_1E]
		mov	al, es:[bx+1]
		cbw
		imul	ax, 18h
		mov	dx, word ptr [bp+var_26+2]
		mov	bx, word ptr [bp+var_26]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		mov	bx, word ptr [bp+var_1E]
		mov	al, es:[bx+1]
		cbw
		imul	ax, 12h
		mov	dx, [bp+var_20]
		mov	bx, [bp+var_22]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	ax, word ptr dword_6E8D0
		xor	dx, dx
		sub	ax, [bp+var_2A]
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
		les	bx, [bp+var_1E]
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jz	short loc_9570A
		cmp	ax, 2
		jz	short loc_95771
		cmp	ax, 3
		jnz	short loc_95708
		jmp	loc_957B9
; ���������������������������������������������������������������������������

loc_95708:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+173j
		jmp	short loc_95754
; ���������������������������������������������������������������������������

loc_9570A:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+169j
		push	large [bp+var_1E]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Render_EdgeSetupSolidColor
		add	sp, 0Ch
		push	11h
		push	ds
		push	offset word_72488

loc_95725:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+1DFj
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_8]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Render_EdgeSetupRaw
		add	sp, 0Ch
		add	word ptr dword_6E8D0, 11h
		add	word ptr dword_6E8D4, 0Ah
		jmp	short loc_957B9
; ���������������������������������������������������������������������������

loc_95754:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590:loc_95708j
		push	large [bp+var_1E]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Render_EdgeSetupSolidColor
		add	sp, 0Ch
		push	11h
		push	ds
		push	offset word_72499
		jmp	short loc_95725
; ���������������������������������������������������������������������������

loc_95771:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+16Ej
		push	large [bp+var_1E]
		push	large [bp+var_4]
		push	large [dword_6E8D4]
		call	Render_EdgeSetupTexturedColor
		add	sp, 0Ch
		push	14h
		push	ds
		push	offset word_72474
		push	large [dword_6E8D0]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	large [bp+var_8]
		push	large [dword_6E8D4]
		push	large [dword_6E8D0]
		call	Render_EdgeSetupWithParam
		add	sp, 0Ch
		add	word ptr dword_6E8D0, 14h
		add	word ptr dword_6E8D4, 0Dh

loc_957B9:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+175j
					; AircraftComponent_LoadWithDwordFieldsC_95590+1C2j
		inc	si
		add	word ptr [bp+var_1E], 8

loc_957BE:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+10Cj
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], si
		jle	short loc_957CA
		jmp	loc_9569F
; ���������������������������������������������������������������������������

loc_957CA:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+235j
		cmp	[bp+var_D], 0
		jz	short loc_957EE
		cmp	[bp+var_12], 0
		jz	short loc_957EE
		push	0
		mov	al, [bp+var_E]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_957EE:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+23Ej
					; AircraftComponent_LoadWithDwordFieldsC_95590+245j
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadWithDwordFieldsC_95590	endp

ovr274		ends
