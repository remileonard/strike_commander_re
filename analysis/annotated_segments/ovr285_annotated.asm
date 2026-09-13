ovr285		segment	para public 'OVERLAY' use16
		assume cs:ovr285
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (29 lignes).
; ==============================================================================================
AircraftComponent_Helper2_971A0	proc far		; CODE XREF: VROOMM_StubThunk_6BB8AJ

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_971A3:
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]

loc_971AC:
		nop
		push	cs
		call	near ptr AircraftComponent_LoadMixedFieldsC_971C4
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AircraftComponent_LoadWithDwordFieldsD_97215
		add	sp, 6
		pop	si
		pop	bp
		retf
AircraftComponent_Helper2_971A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFieldGroupB_64A54 ×2 et ReadFinalField_64B51 (39 lignes).
; ==============================================================================================
AircraftComponent_LoadMixedFieldsC_971C4	proc far		; CODE XREF: VROOMM_StubThunk_6BB80J AircraftComponent_Helper2_971A0+Ep

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_97212
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_97212:				; CODE XREF: AircraftComponent_LoadMixedFieldsC_971C4+1Aj
		pop	si
		pop	bp
		retf
AircraftComponent_LoadMixedFieldsC_971C4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de AircraftComponent_LoadWithDwordFields_94D40 (130 lignes).
; ==============================================================================================
AircraftComponent_LoadWithDwordFieldsD_97215	proc far		; CODE XREF: VROOMM_StubThunk_6BB85J AircraftComponent_Helper2_971A0+1Bp

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
		sub	sp, 28h
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_97237
		jmp	loc_97362
; ���������������������������������������������������������������������������

loc_97237:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsD_97215+1Dj
		mov	eax, [si+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+0Ch], 3
		mov	byte ptr es:[bx+0Dh], 1
		mov	dword ptr es:[bx+0Eh], 0
		mov	eax, [bp+var_4]
		mov	es:[bx+0Eh], eax
		push	0
		mov	al, es:[bx+0Ch]
		push	ax
		push	large dword ptr	es:[bx+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		push	0
		les	bx, [bp+arg_0]

loc_972A7:
		mov	al, es:[bx+0Ch]
		push	ax
		push	large dword ptr	es:[bx+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		call	Text_ComputeMaxLineHeight_5E706

loc_972C3:
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], ax
		push	0
		mov	al, es:[bx+0Ch]
		push	ax
		push	large dword ptr	es:[bx+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		call	Text_ComputeMaxLineWidth_5E6BF
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], ax
		mov	ax, es:[bx+12h]
		sar	ax, 1
		movsx	eax, ax
		mov	[bp+var_14], eax
		mov	ax, es:[bx+14h]
		sar	ax, 1
		movsx	eax, ax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_18]
		shl	eax, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_C], eax
		push	large 0
		push	eax
		push	large [bp+var_10]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_28+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_97362:				; CODE XREF: AircraftComponent_LoadWithDwordFieldsD_97215+1Fj
		pop	si
		leave
		retf
AircraftComponent_LoadWithDwordFieldsD_97215	endp

ovr285		ends
