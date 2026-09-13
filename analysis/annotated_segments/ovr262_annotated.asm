ovr262		segment	para public 'OVERLAY' use16
		assume cs:ovr262
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFieldGroupB_64A54 répété (124 lignes).
; ==============================================================================================
AITargeting_LoadCalibrationRecordC_8E740	proc far		; CODE XREF: VROOMM_StubThunk_6B6A0J

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	al, 0
		mov	[si+41h], al
		mov	[si+40h], al
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8E7DF
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+22h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+24h], ax
		push	di

loc_8E790:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+26h], ax
		push	di

loc_8E79A:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8E7A0:
		mov	[si+28h], ax
		push	di

loc_8E7A4:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+38h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+3Ah], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+3Ch], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+3Eh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+54h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+56h], ax

loc_8E7DF:				; CODE XREF: AITargeting_LoadCalibrationRecordC_8E740+39j
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8E855
		mov	eax, [di+72h]
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
		mov	eax, [bp+var_8]
		mov	[si+2Eh], eax
		mov	byte ptr [si+32h], 3
		mov	byte ptr [si+33h], 1
		mov	dword ptr [si+34h], 0
		mov	eax, [bp+var_4]
		mov	[si+34h], eax
		push	0
		mov	al, [si+32h]
		push	ax
		push	large dword ptr	[si+2Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8E855:				; CODE XREF: AITargeting_LoadCalibrationRecordC_8E740+B2j
		pop	di
		pop	si
		leave
		retf
AITargeting_LoadCalibrationRecordC_8E740	endp

ovr262		ends
