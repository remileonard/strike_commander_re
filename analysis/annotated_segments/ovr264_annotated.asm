ovr264		segment	para public 'OVERLAY' use16
		assume cs:ovr264
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle StreamReader_ReadTyped_63FA1 (seg190).
; ==============================================================================================
CRT_ReadTypedValue_8ECC0	proc far		; CODE XREF: VROOMM_StubThunk_6B705J CRT_FormatAndValidateStream_8ED6E+15p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large dword ptr	[si+5Dh]
		push	large 5Ah ; 'Z'
		push	ds
		mov	ax, si
		add	ax, 0A3h ; '�'
		push	ax
		push	si
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		mov	[bp+var_2], ax
		mov	word ptr [si+61h], 0
		jmp	short loc_8ED0B
; ���������������������������������������������������������������������������

loc_8ECEB:				; CODE XREF: CRT_ReadTypedValue_8ECC0+51j
		mov	bx, [si+61h]
		mov	al, [bx+si+0A3h]
		cbw
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0Dh
		jnz	short loc_8ED08
		mov	byte ptr [bx+si+0A5h], 0
		add	dword ptr [si+5Dh], 2
		jmp	short loc_8ED13
; ���������������������������������������������������������������������������

loc_8ED08:				; CODE XREF: CRT_ReadTypedValue_8ECC0+3Aj
		inc	word ptr [si+61h]

loc_8ED0B:				; CODE XREF: CRT_ReadTypedValue_8ECC0+29j
		mov	ax, [si+61h]
		cmp	ax, [bp+var_2]
		jl	short loc_8ECEB

loc_8ED13:				; CODE XREF: CRT_ReadTypedValue_8ECC0+46j
		movsx	eax, word ptr [si+61h]
		add	[si+5Dh], eax
		pop	si
		leave
		retf
CRT_ReadTypedValue_8ECC0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine CRT_Strlen et CRT_MemFamily_Prologue.
; ==============================================================================================
CRT_StringLengthHelper_8ED1F	proc far		; CODE XREF: VROOMM_StubThunk_6B70AJ CRT_FormatAndValidateStream_8ED6E+1Ep	...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		call	CRT_Strlen
		pop	cx
		mov	[bp+var_2], ax
		xor	di, di
		jmp	short loc_8ED5E
; ���������������������������������������������������������������������������

loc_8ED3A:				; CODE XREF: CRT_StringLengthHelper_8ED1F+47j
		push	[bp+var_2]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, di
		add	ax, 0A3h ; '�'
		push	ax
		call	far ptr	CRT_MemFamily_Prologue
		add	sp, 6
		or	ax, ax
		jnz	short loc_8ED5D
		mov	ax, si
		add	ax, di
		add	ax, 0A3h ; '�'
		jmp	short loc_8ED6A
; ���������������������������������������������������������������������������

loc_8ED5D:				; CODE XREF: CRT_StringLengthHelper_8ED1F+33j
		inc	di

loc_8ED5E:				; CODE XREF: CRT_StringLengthHelper_8ED1F+19j
		mov	ax, [si+61h]
		sub	ax, [bp+var_2]
		cmp	ax, di
		jg	short loc_8ED3A
		xor	ax, ax

loc_8ED6A:				; CODE XREF: CRT_StringLengthHelper_8ED1F+3Cj
		pop	di
		pop	si
		leave
		retf
CRT_StringLengthHelper_8ED1F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine CRT_Msg_Sprintf3, CRT_Strupr,
; StreamReader_ValidateState_63DB5/GetCapacity_64062 (seg190).
; ==============================================================================================
CRT_FormatAndValidateStream_8ED6E	proc far		; CODE XREF: VROOMM_StubThunk_6B700J

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0FFFFh
		jmp	loc_8EE0F
; ���������������������������������������������������������������������������

loc_8ED81:				; CODE XREF: CRT_FormatAndValidateStream_8ED6E+C7j
		push	si
		push	cs
		call	near ptr CRT_ReadTypedValue_8ECC0
		pop	cx
		push	0F50h
		push	si
		push	cs
		call	near ptr CRT_StringLengthHelper_8ED1F
		add	sp, 4
		mov	di, ax

loc_8ED94:
		or	di, di

loc_8ED96:
		jz	short loc_8EDAB

loc_8ED98:
		lea	ax, [bp+var_2]
		push	ax

loc_8ED9C:
		push	0F53h
		push	di

loc_8EDA0:
		call	CRT_Msg_Sprintf3
		add	sp, 6
		jmp	loc_8EE38
; ���������������������������������������������������������������������������

loc_8EDAB:				; CODE XREF: CRT_FormatAndValidateStream_8ED6E:loc_8ED96j
		push	0F56h
		push	si
		push	cs
		call	near ptr CRT_StringLengthHelper_8ED1F
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_8EE0F
		add	di, 4
		jmp	short loc_8EDC2
; ���������������������������������������������������������������������������

loc_8EDC1:				; CODE XREF: CRT_FormatAndValidateStream_8ED6E+57j
					; CRT_FormatAndValidateStream_8ED6E+5Cj ...
		inc	di

loc_8EDC2:				; CODE XREF: CRT_FormatAndValidateStream_8ED6E+51j
		cmp	byte ptr [di], 3Ah ; ':'
		jz	short loc_8EDC1
		cmp	byte ptr [di], 20h ; ' '
		jz	short loc_8EDC1
		cmp	byte ptr [di], 9
		jz	short loc_8EDC1
		mov	[bp+var_4], 0
		jmp	short loc_8EDE4
; ���������������������������������������������������������������������������

loc_8EDD8:				; CODE XREF: CRT_FormatAndValidateStream_8ED6E+8Cj
		mov	al, [di]
		mov	bx, [bp+var_4]
		mov	[bx+si+63h], al
		inc	di
		inc	[bp+var_4]

loc_8EDE4:				; CODE XREF: CRT_FormatAndValidateStream_8ED6E+68j
		cmp	[bp+var_4], 40h	; '@'
		jge	short loc_8EDFC
		mov	ax, [si+61h]
		cmp	ax, [bp+var_4]
		jle	short loc_8EDFC
		cmp	byte ptr [di], 20h ; ' '
		jz	short loc_8EDFC
		cmp	byte ptr [di], 0Dh
		jnz	short loc_8EDD8

loc_8EDFC:				; CODE XREF: CRT_FormatAndValidateStream_8ED6E+7Aj
					; CRT_FormatAndValidateStream_8ED6E+82j ...
		mov	ax, si
		add	ax, 63h	; 'c'
		push	ax
		call	CRT_Strupr
		pop	cx
		mov	bx, [bp+var_4]
		mov	byte ptr [bx+si+63h], 0

loc_8EE0F:				; CODE XREF: CRT_FormatAndValidateStream_8ED6E+10j
					; CRT_FormatAndValidateStream_8ED6E+4Cj
		mov	di, 1
		push	si
		call	StreamReader_ValidateState_63DB5
		pop	cx
		or	al, al
		jz	short loc_8EE31
		push	si
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, [si+5Dh]
		jle	short loc_8EE31
		dec	di
		jmp	short $+2

loc_8EE31:				; CODE XREF: CRT_FormatAndValidateStream_8ED6E+ADj
					; CRT_FormatAndValidateStream_8ED6E+BEj
		or	di, di
		jnz	short loc_8EE38
		jmp	loc_8ED81
; ���������������������������������������������������������������������������

loc_8EE38:				; CODE XREF: CRT_FormatAndValidateStream_8ED6E+3Aj
					; CRT_FormatAndValidateStream_8ED6E+C5j
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
CRT_FormatAndValidateStream_8ED6E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, combine PagedResourceC_RefreshAllInstances_5F4E0 (seg158), CRT_Msg_NullPtrAssign,
; CRT_Exit, Runtime_FatalErrorHandler_5F700 (seg160) — gestionnaire déclenché sur assignation
; de pointeur nul (confirme le message « Null pointer assignment » du seg339).
; ==============================================================================================
Runtime_NullPointerAssignHandler_8EE3F	proc far		; CODE XREF: VROOMM_StubThunk_6B70FJ

var_15E		= word ptr -15Eh
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 15Eh
		mov	ax, [bp+arg_0]
		cmp	ax, 0EEEEh
		jz	short loc_8EE55
		cmp	byte_6DFFF, 0
		jz	short loc_8EE72

loc_8EE55:				; CODE XREF: Runtime_NullPointerAssignHandler_8EE3F+Dj
		mov	byte_6DFFF, 1
		call	PagedResourceC_RefreshAllInstances_5F4E0
		push	0F5Bh
		call	CRT_Msg_NullPtrAssign
		pop	cx
		push	1
		call	CRT_Exit
		pop	cx
		jmp	short loc_8EE87
; ���������������������������������������������������������������������������

loc_8EE72:				; CODE XREF: Runtime_NullPointerAssignHandler_8EE3F+14j
		push	word_6DFFD
		push	ax
		push	0F85h
		lea	ax, [bp+var_15E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8

loc_8EE87:				; CODE XREF: Runtime_NullPointerAssignHandler_8EE3F+31j
		lea	ax, [bp+var_15E]
		push	ax
		call	Runtime_FatalErrorHandler_5F700
		pop	cx
		leave
		retf
Runtime_NullPointerAssignHandler_8EE3F	endp

ovr264		ends
