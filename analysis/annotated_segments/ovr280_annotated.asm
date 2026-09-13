ovr280		segment	para public 'OVERLAY' use16
		assume cs:ovr280
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation et ReadFieldGroupC_64A7E répété (127 lignes).
; ==============================================================================================
AircraftComponent_LoadFieldGroupC_96470	proc far		; CODE XREF: VROOMM_StubThunk_6BA90J

var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_96473:
		sub	sp, 34h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 54524556h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_96493
		jmp	loc_9658B
; ���������������������������������������������������������������������������

loc_96493:				; CODE XREF: AircraftComponent_LoadFieldGroupC_96470+1Ej
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large dword ptr	es:[bx+12h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		les	bx, [bp+arg_0]

loc_964B0:
		mov	eax, es:[bx+4]

loc_964B5:
		mov	[bp+var_4], eax
		xor	di, di

loc_964BB:
		jmp	loc_9657F
; ���������������������������������������������������������������������������

loc_964BE:				; CODE XREF: AircraftComponent_LoadFieldGroupC_96470+118j
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		les	bx, [bp+var_4]
		mov	es:[bx+0Ch], eax
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	es:[bx+10h], eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	es:[bx+14h], eax
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+4], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+8], eax
		mov	[bp+var_2C], 0
		mov	eax, [bp+var_2C]
		mov	es:[bx+0Ch], eax
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]

loc_96564:
		mov	es:[bx+10h], eax
		mov	[bp+var_34], 0
		mov	eax, [bp+var_34]
		mov	es:[bx+14h], eax
		inc	di
		add	word ptr [bp+var_4], 18h

loc_9657F:				; CODE XREF: AircraftComponent_LoadFieldGroupC_96470:loc_964BBj
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], di
		jle	short loc_9658B
		jmp	loc_964BE
; ���������������������������������������������������������������������������

loc_9658B:				; CODE XREF: AircraftComponent_LoadFieldGroupC_96470+20j
					; AircraftComponent_LoadFieldGroupC_96470+116j
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadFieldGroupC_96470	endp

ovr280		ends
