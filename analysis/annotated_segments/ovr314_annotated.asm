ovr314		segment	para public 'OVERLAY' use16
		assume cs:ovr314
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 164 lignes, NON DÉTAILLÉE — combine allocation, WorldObject_BaseConstruct,
; Camera_ResetState/ResetSecondaryFlag/GetHandle.
; ==============================================================================================
Camera_ConstructWithHandle_9D610	proc far		; CODE XREF: VROOMM_StubThunk_6C290J

var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	74h ; 't'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9D69C
		push	ax
		call	WorldObject_BaseConstruct

loc_9D633:
		pop	cx

loc_9D634:
		mov	word ptr [si+51h], 0
		mov	word ptr [si], 26A4h

loc_9D63D:
		push	si
		call	Camera_ResetState
		pop	cx
		mov	dword ptr [si+55h], 0
		mov	word ptr [si], 2618h
		push	si
		call	Camera_ResetSecondaryFlag
		pop	cx
		mov	dword ptr [si+5Ah], 0
		mov	word ptr [si], 2730h
		push	si

loc_9D664:
		call	Camera_GetHandle
		pop	cx

loc_9D66A:
		mov	dword ptr [si+5Eh], 0

loc_9D672:
		mov	word ptr [si], 27BCh

loc_9D676:
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+68h], eax
		mov	word ptr [si+6Fh], 0
		push	large [bp+var_4]
		push	si

loc_9D690:
		call	VROOMM_StubThunk_6C235
		add	sp, 6
		mov	ax, si
		jmp	short loc_9D69E
; ���������������������������������������������������������������������������

loc_9D69C:				; CODE XREF: Camera_ConstructWithHandle_9D610+1Bj
		mov	ax, si

loc_9D69E:				; CODE XREF: Camera_ConstructWithHandle_9D610+8Aj
		mov	si, ax

loc_9D6A0:
		or	si, si

loc_9D6A2:
		jnz	short loc_9D6A7

loc_9D6A4:
		jmp	loc_9D768
; ���������������������������������������������������������������������������

loc_9D6A7:				; CODE XREF: Camera_ConstructWithHandle_9D610:loc_9D6A2j
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+46h], 0
		jz	short loc_9D6DF
		push	si
		push	large dword ptr	es:[bx+46h]
		les	bx, es:[bx+46h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+55h], eax

loc_9D6DF:				; CODE XREF: Camera_ConstructWithHandle_9D610+ADj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+36h], 0
		jz	short loc_9D700
		push	si
		push	word ptr es:[bx+36h]
		mov	bx, es:[bx+36h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], ax
		mov	[si+51h], ax

loc_9D700:				; CODE XREF: Camera_ConstructWithHandle_9D610+D7j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+4Ah], 0
		jz	short loc_9D727
		push	si
		push	large dword ptr	es:[bx+4Ah]
		call	VROOMM_StubThunk_6C3F8
		add	sp, 6
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[si+5Ah], eax

loc_9D727:				; CODE XREF: Camera_ConstructWithHandle_9D610+F9j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+4Eh], 0
		jz	short loc_9D74E
		push	si
		push	large dword ptr	es:[bx+4Eh]
		call	VROOMM_StubThunk_6C124
		add	sp, 6
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[si+5Eh], eax

loc_9D74E:				; CODE XREF: Camera_ConstructWithHandle_9D610+120j
		push	large [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C32A
		add	sp, 6
		push	large [bp+arg_0]
		push	si

loc_9D760:
		call	VROOMM_StubThunk_6C325

loc_9D765:
		add	sp, 6

loc_9D768:				; CODE XREF: Camera_ConstructWithHandle_9D610:loc_9D6A4j
		mov	ax, si
		pop	si
		leave
		retf
Camera_ConstructWithHandle_9D610	endp

ovr314		ends
