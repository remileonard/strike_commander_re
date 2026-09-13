ovr279		segment	para public 'OVERLAY' use16
		assume cs:ovr279
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (19 lignes).
; ==============================================================================================
AircraftComponent_Helper_962E0	proc far		; CODE XREF: VROOMM_StubThunk_6BA60J AircraftComponent_LoadMixedFieldsB_96321+10p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+4], 0
		mov	dword ptr es:[bx+28h], 0
		mov	dword ptr es:[bx+9Ah], 0
		xor	ax, ax
		mov	es:[bx+26h], ax
		mov	es:[bx+2], ax
		mov	byte ptr es:[bx+84h], 0
		mov	byte ptr es:[bx+85h], 0
		mov	word ptr es:[bx+98h], 0FFFFh
		pop	bp
		retf
AircraftComponent_Helper_962E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFinalField_64B51/ReadFieldGroupC_64A7E/ReadFieldGroupB_64A54 (132 lignes).
; ==============================================================================================
AircraftComponent_LoadMixedFieldsB_96321	proc far		; CODE XREF: VROOMM_StubThunk_6BA65J

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
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr AircraftComponent_Helper_962E0
		add	sp, 4
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9635B
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+84h], al

loc_9635B:				; CODE XREF: AircraftComponent_LoadMixedFieldsB_96321+29j
		push	0
		push	large 464E4941h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_96395
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+8Eh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+96h], ax
		jmp	short loc_963B9
; ���������������������������������������������������������������������������

loc_96395:				; CODE XREF: AircraftComponent_LoadMixedFieldsB_96321+4Dj
		mov	[bp+var_4], 0Ch
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+8Eh], eax

loc_963B2:
		mov	word ptr es:[bx+96h], 0

loc_963B9:				; CODE XREF: AircraftComponent_LoadMixedFieldsB_96321+72j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8Eh]

loc_963C2:
		mov	es:[bx+92h], eax
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B9A0
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BA90
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6B8E0
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_C], eax
		xor	di, di
		jmp	short loc_96458
; ���������������������������������������������������������������������������

loc_963FF:				; CODE XREF: AircraftComponent_LoadMixedFieldsB_96321+13Ej
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		add	dx, 0Ch
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		les	si, [bp+var_10]
		mov	eax, es:[si]
		mov	[bp+var_1C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_18], eax
		mov	eax, es:[si+8]
		mov	[bp+var_14], eax
		lea	ax, [bp+var_1C]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		les	bx, [bp+var_C]
		mov	eax, [bp+var_1C]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_18]
		mov	es:[bx+10h], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+14h], eax
		inc	di
		add	word ptr [bp+var_C], 18h

loc_96458:				; CODE XREF: AircraftComponent_LoadMixedFieldsB_96321+DCj
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], di
		jg	short loc_963FF
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadMixedFieldsB_96321	endp

ovr279		ends
