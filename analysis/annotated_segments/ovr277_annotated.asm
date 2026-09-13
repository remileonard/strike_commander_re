ovr277		segment	para public 'OVERLAY' use16
		assume cs:ovr277
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 165 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndReadB_647B2 (×2).
; ==============================================================================================
AircraftComponent_LoadSubrecord_95FD0	proc far		; CODE XREF: VROOMM_StubThunk_6BA00J

var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 53495254h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_95FF3
		jmp	loc_96130
; ���������������������������������������������������������������������������

loc_95FF3:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+1Ej
		push	0
		push	large 49525456h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_96021
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B910
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_96021:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+36j
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_9604D
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B9D0
		add	sp, 6
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		jmp	loc_96107
; ���������������������������������������������������������������������������

loc_9604D:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+64j
		xor	di, di
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8

loc_96060:
		or	ax, ax
		jz	short loc_96075
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax

loc_96075:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+92j
		mov	[bp+var_2], 0
		push	0
		push	large 534D4E41h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_960A1
		mov	eax, [si+72h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_2], ax

loc_960A1:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+BDj
		or	di, di
		jnz	short loc_960AB
		cmp	[bp+var_2], 0
		jz	short loc_960C1

loc_960AB:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+D3j
		push	[bp+var_2]
		push	di
		mov	ax, word ptr [bp+arg_0]

loc_960B2:
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]

loc_960B8:
		push	ax

loc_960B9:
		call	VROOMM_StubThunk_6CD62
		add	sp, 8

loc_960C1:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+D9j
		or	di, di
		jz	short loc_960E3

loc_960C5:
		push	0

loc_960C7:
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BAC0
		add	sp, 6

loc_960E3:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+F3j
		cmp	[bp+var_2], 0
		jz	short loc_96107
		push	0
		push	large 534D4E41h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BAF0
		add	sp, 6

loc_96107:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+7Aj
					; AircraftComponent_LoadSubrecord_95FD0+117j
		push	0
		push	large 59585655h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_96129
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BB20
		add	sp, 6

loc_96129:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+14Aj
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_96130:				; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+20j
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadSubrecord_95FD0	endp

ovr277		ends
