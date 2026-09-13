ovr311		segment	para public 'OVERLAY' use16
		assume cs:ovr311
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunks voisins uniquement (40 lignes).
; ==============================================================================================
Camera_Helper2_9D380	proc far		; CODE XREF: VROOMM_StubThunk_6C200J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_9D381:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1

loc_9D393:
		mov	byte_6E33B, cl
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C1D4

loc_9D3A1:
		add	sp, 6
		push	si
		mov	ax, word ptr [bp+arg_0]

loc_9D3A8:
		add	ax, 4Ah	; 'J'

loc_9D3AB:
		push	word ptr [bp+arg_0+2]
		push	ax
		call	VROOMM_StubThunk_6C43E
		add	sp, 6
		pop	si
		pop	bp
		retf
Camera_Helper2_9D380	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation, WorldObject_BaseConstruct,
; Camera_ResetState/ResetSecondaryFlag/InitAndGetHandle.
; ==============================================================================================
Camera_ConstructWithSecondaryFlag_9D3BA	proc far		; CODE XREF: VROOMM_StubThunk_6C205J

var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	5Eh ; '^'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9D41E
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si+51h], 0
		mov	word ptr [si], 26A4h
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
		push	large [bp+var_4]
		push	si
		call	Camera_InitAndGetHandle
		add	sp, 6
		mov	ax, si
		jmp	short loc_9D420
; ���������������������������������������������������������������������������

loc_9D41E:				; CODE XREF: Camera_ConstructWithSecondaryFlag_9D3BA+1Bj
		mov	ax, si

loc_9D420:				; CODE XREF: Camera_ConstructWithSecondaryFlag_9D3BA+62j
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		push	si

loc_9D430:
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+46h]
		les	bx, es:[bx+46h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+55h], eax
		push	si
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+36h]
		mov	bx, es:[bx+36h]
		mov	bx, [bx]
		call	dword ptr [bx+8]

loc_9D463:
		add	sp, 4
		mov	[bp+var_A], ax
		mov	[si+51h], ax

loc_9D46C:
		push	si
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+4Ah]
		call	VROOMM_StubThunk_6C3F8
		add	sp, 6
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax

loc_9D483:
		mov	eax, [bp+var_E]

loc_9D487:
		mov	[si+5Ah], eax
		mov	ax, si
		pop	si

locret_9D48E:
		leave
		retf
Camera_ConstructWithSecondaryFlag_9D3BA	endp

ovr311		ends
