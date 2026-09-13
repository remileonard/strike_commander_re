ovr227		segment	para public 'OVERLAY' use16
		assume cs:ovr227
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, méthode virtuelle vide (no-op).
; ==============================================================================================
WorldObjectA_Method_NoOp_737E0	proc far		; CODE XREF: VROOMM_StubThunk_6AA2FJ
		push	bp
		mov	bp, sp
		pop	bp
		retf
WorldObjectA_Method_NoOp_737E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, réinitialise un vecteur position/orientation (0,0,0) écrit à deux emplacements
; (+2/+6/+0xA et +0xE/+0x12/+0x16) et un octet de flag (+0x1A=0).
; ==============================================================================================
WorldObjectA_ResetPositionVector_737E5	proc far		; CODE XREF: VROOMM_StubThunk_6AA34J WorldObjectA_Construct_7385B+2Fp

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_18]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+16h], eax
		mov	eax, [bp+var_18]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+0Ah], eax
		mov	byte ptr es:[bx+1Ah], 0
		leave
		retf
WorldObjectA_ResetPositionVector_737E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, constructeur (tag 0xC6, alloue 0x1B octets via Memory_TypedFreeWrapperC_5C6F3, seg131),
; initialise via WorldObjectA_ResetPositionVector_737E5.
; ==============================================================================================
WorldObjectA_Construct_7385B	proc far		; CODE XREF: VROOMM_StubThunk_6AA39J

var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_73898
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 0C6h ; '�'
		push	dx
		push	bx
		push	cs
		call	near ptr WorldObjectA_ResetPositionVector_737E5
		add	sp, 4
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short locret_7389E
; ���������������������������������������������������������������������������

loc_73898:				; CODE XREF: WorldObjectA_Construct_7385B+22j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

locret_7389E:				; CODE XREF: WorldObjectA_Construct_7385B+3Bj
		leave
		retf
WorldObjectA_Construct_7385B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, destructeur scalar-deleting conditionnel (tag 0xC6) : pose le tag puis libère
; (Memory_TypedFree_5C7B6, tag 5C44h) si le bit 0 du flag arg est posé.
; ==============================================================================================
WorldObjectA_ScalarDeletingDtor_738A0	proc far		; CODE XREF: VROOMM_StubThunk_6AA3EJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_738D8
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0C6h ; '�'
		test	ax, 1
		jz	short locret_738D8
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

locret_738D8:				; CODE XREF: WorldObjectA_ScalarDeletingDtor_738A0+Ej
					; WorldObjectA_ScalarDeletingDtor_738A0+1Bj
		leave
		retf
WorldObjectA_ScalarDeletingDtor_738A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, méthode virtuelle mettant à zéro le champ +2.
; ==============================================================================================
WorldObjectA_Method_ClearField2_738DA	proc far		; CODE XREF: VROOMM_StubThunk_6AA43J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		pop	bp
		retf
WorldObjectA_Method_ClearField2_738DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, stub retournant AL=1.
; ==============================================================================================
WorldObjectA_Method_ReturnTrue_738E8	proc far		; CODE XREF: VROOMM_StubThunk_6AA4DJ
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
WorldObjectA_Method_ReturnTrue_738E8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, destructeur scalar-deleting conditionnel (tag 0xAA), même motif que
; WorldObjectA_ScalarDeletingDtor_738A0 pour une classe sœur.
; ==============================================================================================
WorldObjectB_ScalarDeletingDtor_738EF	proc far		; CODE XREF: VROOMM_StubThunk_6AA48J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short locret_73927
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0AAh ; '�'
		test	ax, 1
		jz	short locret_73927
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

locret_73927:				; CODE XREF: WorldObjectB_ScalarDeletingDtor_738EF+Ej
					; WorldObjectB_ScalarDeletingDtor_738EF+1Bj
		leave
		retf
WorldObjectB_ScalarDeletingDtor_738EF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, stub retournant AX=0.
; ==============================================================================================
WorldObjectA_Method_ReturnZero_73929	proc far		; CODE XREF: VROOMM_StubThunk_6AA2AJ
		push	bp
		mov	bp, sp
		xor	ax, ax
		pop	bp
		retf
WorldObjectA_Method_ReturnZero_73929	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, méthode virtuelle vide (no-op).
; ==============================================================================================
WorldObjectA_Method_NoOpB_73930	proc far		; CODE XREF: VROOMM_StubThunk_6AA25J
		push	bp
		mov	bp, sp
		pop	bp
		retf
WorldObjectA_Method_NoOpB_73930	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, méthode virtuelle vide (no-op).
; ==============================================================================================
WorldObjectA_Method_NoOpC_73935	proc far		; CODE XREF: VROOMM_StubThunk_6AA20J
		push	bp
		mov	bp, sp
		pop	bp
		retf
WorldObjectA_Method_NoOpC_73935	endp

ovr227		ends
