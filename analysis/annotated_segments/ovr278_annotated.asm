ovr278		segment	para public 'OVERLAY' use16
		assume cs:ovr278
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 191 lignes, NON DÉTAILLÉE — combine ReadFieldGroupA_64A19/ReadFieldGroupC_64A7E.
; ==============================================================================================
AircraftComponent_LoadMixedFields_96140	proc far		; CODE XREF: VROOMM_StubThunk_6BA30J

var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		xor	dx, dx
		jmp	short loc_9616A
; ���������������������������������������������������������������������������

loc_9614C:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+2Dj
		mov	ax, dx
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	dword ptr es:[bx+64h], 0

loc_9615F:
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	byte ptr es:[bx+5Ch], 0
		inc	dx

loc_9616A:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+Aj
		cmp	dx, 8
		jl	short loc_9614C
		push	0

loc_96171:
		push	large 41544544h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_96189
		jmp	loc_962AA
; ���������������������������������������������������������������������������

loc_96189:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+44j
		mov	[bp+var_4], 304C564Ch
		xor	di, di
		mov	[bp+var_6], 0
		jmp	loc_96296
; ���������������������������������������������������������������������������

loc_9619B:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+15Cj
		push	0
		push	large [bp+var_4]
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_961B3

loc_961B0:
		jmp	loc_9628B
; ���������������������������������������������������������������������������

loc_961B3:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+6Ej
		push	[bp+arg_4]

loc_961B6:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dx, di
		shl	dx, 2
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	es:[bx+64h], eax
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		add	eax, 0FFFFFFFCh
		mov	[bp+var_A], eax
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[bp+var_C], ax
		mov	ax, di
		shl	ax, 1
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	ax, [bp+var_C]
		mov	es:[bx+4Ch], ax
		push	1
		push	0
		push	2
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 2
		les	si, [bp+arg_0]
		add	si, bx
		mov	es:[si+2Eh], dx
		mov	es:[si+2Ch], ax
		mov	bx, word ptr [bp+arg_0]
		add	bx, di
		mov	byte ptr es:[bx+5Ch], 1
		push	large [bp+var_A]
		push	word ptr es:[si+2Eh]
		push	word ptr es:[si+2Ch]
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+2Eh]
		mov	dx, es:[bx+2Ch]
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		xor	dx, dx
		jmp	short loc_96285
; ���������������������������������������������������������������������������

loc_96264:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+148j
		les	bx, [bp+arg_0]

loc_96267:
		les	bx, es:[bx+28h]
		push	es

loc_9626C:
		les	si, [bp+var_10]
		mov	ax, es:[si]

loc_96272:
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		les	bx, [bp+var_10]
		mov	es:[bx], ax
		inc	dx
		add	word ptr [bp+var_10], 2

loc_96285:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+122j
		cmp	dx, [bp+var_C]
		jl	short loc_96264
		inc	di

loc_9628B:				; CODE XREF: AircraftComponent_LoadMixedFields_96140:loc_961B0j
		add	[bp+var_4], 1000000h
		inc	[bp+var_6]

loc_96296:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+58j
		cmp	[bp+var_6], 8
		jge	short loc_9629F
		jmp	loc_9619B
; ���������������������������������������������������������������������������

loc_9629F:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+15Aj
		push	[bp+arg_4]
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		jmp	short loc_962CD
; ���������������������������������������������������������������������������

loc_962AA:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+46j
		les	bx, [bp+arg_0]

loc_962AD:
		mov	dword ptr es:[bx+64h], 0
		mov	eax, es:[bx+28h]
		mov	es:[bx+2Ch], eax
		mov	ax, es:[bx+26h]
		mov	es:[bx+4Ch], ax
		mov	byte ptr es:[bx+5Ch], 0

loc_962CD:				; CODE XREF: AircraftComponent_LoadMixedFields_96140+168j
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadMixedFields_96140	endp

ovr278		ends
