ovr307		segment	para public 'OVERLAY' use16
		assume cs:ovr307
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFinalField_64B51 (×2) et String_ConstructFromFarPtrLen (×2).
; ==============================================================================================
Debris_LoadStringFields_9CBE0	proc far		; CODE XREF: VROOMM_StubThunk_6C110J Debris_LoadSubrecordWithRelease_9CCE5+7Ep

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx], al
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+1], al
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2
		push	word ptr [bp+arg_0+2]
		push	ax
		call	String_ConstructFromFarPtrLen
		add	sp, 6
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Bh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	String_ConstructFromFarPtrLen
		add	sp, 6
		pop	si
		pop	bp
		retf
Debris_LoadStringFields_9CBE0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (59 lignes).
; ==============================================================================================
Debris_Helper6_9CC2B	proc far		; CODE XREF: VROOMM_StubThunk_6C115J Debris_ReleaseWrapperB_9CD97+63p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+arg_4]
		mov	al, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx], al
		les	bx, [bp+arg_4]
		mov	al, es:[bx+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+1], al
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 2
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], eax
		mov	byte ptr es:[bx+0Ah], 0
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 0Bh
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx

loc_9CC8D:
		les	bx, [bp+var_8]

loc_9CC90:
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]

loc_9CC97:
		mov	es:[bx+0Bh], eax
		les	bx, [bp+var_8]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]

loc_9CCA7:
		mov	es:[bx+0Fh], eax

loc_9CCAC:
		mov	byte ptr es:[bx+13h], 0
		leave
		retf
Debris_Helper6_9CC2B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3.
; ==============================================================================================
Debris_ReleaseWrapper_9CCB3	proc far		; CODE XREF: VROOMM_StubThunk_6C12EJ

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_9CCB4:
		mov	bp, sp
		push	1
		push	0
		push	2
		push	large 8
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		push	[bp+arg_4]
		push	large dword ptr	es:[bx]
		nop
		push	cs
		call	near ptr Debris_LoadSubrecordWithRelease_9CCE5
		add	sp, 6
		pop	bp
		retf
Debris_ReleaseWrapper_9CCB3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_SeekAndReadB_647B2/ReadFieldGroupB_64A54 et libération typée.
; ==============================================================================================
Debris_LoadSubrecordWithRelease_9CCE5	proc far		; CODE XREF: VROOMM_StubThunk_6C11AJ Debris_ReleaseWrapper_9CCB3+2Ap

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 474D4144h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_9CD08
		jmp	loc_9CD8A
; ���������������������������������������������������������������������������

loc_9CD08:				; CODE XREF: Debris_LoadSubrecordWithRelease_9CCE5+1Ej
		push	0
		push	large 4D535953h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9CD79
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		push	1
		push	0
		push	2
		mov	ax, es:[bx+4]
		imul	ax, 14h
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		xor	di, di
		jmp	short loc_9CD6E
; ���������������������������������������������������������������������������

loc_9CD5D:				; CODE XREF: Debris_LoadSubrecordWithRelease_9CCE5+90j
		push	si
		push	large [bp+var_4]
		push	cs
		call	near ptr Debris_LoadStringFields_9CBE0
		add	sp, 6
		inc	di
		add	word ptr [bp+var_4], 14h

loc_9CD6E:				; CODE XREF: Debris_LoadSubrecordWithRelease_9CCE5+76j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], di
		jg	short loc_9CD5D
		jmp	short loc_9CD82
; ���������������������������������������������������������������������������

loc_9CD79:				; CODE XREF: Debris_LoadSubrecordWithRelease_9CCE5+36j
		push	0C00Ch
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_9CD82:				; CODE XREF: Debris_LoadSubrecordWithRelease_9CCE5+92j
		push	si

loc_9CD83:
		call	ResourceRecord_ReleaseAndClear_64D25

loc_9CD88:
		jmp	short loc_9CD92
; ���������������������������������������������������������������������������

loc_9CD8A:				; CODE XREF: Debris_LoadSubrecordWithRelease_9CCE5+20j
		push	0C00Dh
		call	VROOMM_StubThunk_6B70F

loc_9CD92:				; CODE XREF: Debris_LoadSubrecordWithRelease_9CCE5:loc_9CD88j
		pop	cx
		pop	di
		pop	si
		leave
		retf
Debris_LoadSubrecordWithRelease_9CCE5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3 (61 lignes).
; ==============================================================================================
Debris_ReleaseWrapperB_9CD97	proc far		; CODE XREF: VROOMM_StubThunk_6C11FJ Debris_ReleaseWrapperD_9CE33+37p

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_4]

loc_9CDA1:
		mov	ax, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax

loc_9CDAC:
		push	1
		push	0
		push	2
		mov	ax, es:[bx+4]
		imul	ax, 14h
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_9CE05
; ���������������������������������������������������������������������������

loc_9CDE3:				; CODE XREF: Debris_ReleaseWrapperB_9CD97+75j
		push	large [bp+var_4]
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, si
		imul	dx, 14h
		add	ax, dx
		push	word ptr es:[bx+2]
		push	ax
		push	cs
		call	near ptr Debris_Helper6_9CC2B
		add	sp, 8
		inc	si
		add	word ptr [bp+var_4], 14h

loc_9CE05:				; CODE XREF: Debris_ReleaseWrapperB_9CD97+4Aj
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si
		jg	short loc_9CDE3
		pop	si
		leave
		retf
Debris_ReleaseWrapperB_9CD97	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3 (20 lignes).
; ==============================================================================================
Debris_ReleaseWrapperC_9CE11	proc far		; CODE XREF: VROOMM_StubThunk_6C129J

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	1
		push	0
		push	2
		push	large 8
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
Debris_ReleaseWrapperC_9CE11	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3 (50 lignes).
; ==============================================================================================
Debris_ReleaseWrapperD_9CE33	proc far		; CODE XREF: VROOMM_StubThunk_6C124J

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_9CE36:
		sub	sp, 0Ah
		push	1

loc_9CE3B:
		push	0

loc_9CE3D:
		push	2

loc_9CE3F:
		push	large 8

loc_9CE42:
		push	5C44h

loc_9CE45:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	eax, [bp+arg_0]
		mov	[bp+var_A], eax
		push	large [bp+var_A]
		push	dx
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr Debris_ReleaseWrapperB_9CD97
		add	sp, 8
		les	bx, [bp+var_4]
		mov	ax, [bp+var_6]
		mov	es:[bx+6], ax
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
Debris_ReleaseWrapperD_9CE33	endp

ovr307		ends
