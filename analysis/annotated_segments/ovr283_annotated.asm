ovr283		segment	para public 'OVERLAY' use16
		assume cs:ovr283
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation, ReadFinalField_64B51 (×2), gestion d'erreur (125 lignes).
; ==============================================================================================
AircraftComponent_LoadFinalFieldsWithErrorCheck_96650	proc far		; CODE XREF: VROOMM_StubThunk_6BB20J

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [si+72h]

loc_9665F:
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_8], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		push	ax
		push	large dword ptr	es:[bx+1Ch]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		xor	di, di
		jmp	loc_96738
; ���������������������������������������������������������������������������

loc_96692:				; CODE XREF: AircraftComponent_LoadFinalFieldsWithErrorCheck_96650+EDj
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	dx, ax
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], dx
		jle	short loc_966BD
		les	bx, es:[bx+28h]
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_A]
		mov	dx, [bp+var_C]
		add	dx, es:[bx]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		jmp	short loc_966C6
; ���������������������������������������������������������������������������

loc_966BD:				; CODE XREF: AircraftComponent_LoadFinalFieldsWithErrorCheck_96650+52j
		push	600Ah
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_966C6:				; CODE XREF: AircraftComponent_LoadFinalFieldsWithErrorCheck_96650+6Bj
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[bp+var_6], ax
		mov	cx, [bp+var_6]
		les	bx, [bp+arg_0]
		cmp	es:[bx+86h], cx
		jbe	short loc_966EB
		mov	ax, es:[bx+8Ah]
		mov	dx, cx
		imul	dx, 6
		add	ax, dx
		jmp	short loc_9670A
; ���������������������������������������������������������������������������

loc_966EB:				; CODE XREF: AircraftComponent_LoadFinalFieldsWithErrorCheck_96650+8Bj
		les	bx, [bp+arg_0]
		sub	cx, es:[bx+86h]
		cmp	es:[bx+88h], cx
		jbe	short loc_96708
		mov	ax, es:[bx+8Ch]
		mov	dx, cx
		imul	dx, 0Ch
		add	ax, dx
		jmp	short loc_9670A
; ���������������������������������������������������������������������������

loc_96708:				; CODE XREF: AircraftComponent_LoadFinalFieldsWithErrorCheck_96650+A8j
		xor	ax, ax

loc_9670A:				; CODE XREF: AircraftComponent_LoadFinalFieldsWithErrorCheck_96650+99j
					; AircraftComponent_LoadFinalFieldsWithErrorCheck_96650+B6j
		les	bx, [bp+var_4]
		mov	es:[bx+16h], ax
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_96721
		push	600Bh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_96721:				; CODE XREF: AircraftComponent_LoadFinalFieldsWithErrorCheck_96650+C6j
		push	large 6
		mov	ax, word ptr [bp+var_4]
		add	ax, 18h
		push	word ptr [bp+var_4+2]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		inc	di

loc_96738:				; CODE XREF: AircraftComponent_LoadFinalFieldsWithErrorCheck_96650+3Fj
		cmp	di, [bp+var_8]
		jge	short loc_96740
		jmp	loc_96692
; ���������������������������������������������������������������������������

loc_96740:				; CODE XREF: AircraftComponent_LoadFinalFieldsWithErrorCheck_96650+EBj
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadFinalFieldsWithErrorCheck_96650	endp

ovr283		ends
