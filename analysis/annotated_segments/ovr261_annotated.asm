ovr261		segment	para public 'OVERLAY' use16
		assume cs:ovr261
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 310 lignes, NON DÉTAILLÉE — combine ReadFieldGroupB_64A54 répété (variante de
; AITargeting_LoadCalibrationRecord_8DF49, seg260).
; ==============================================================================================
AITargeting_LoadCalibrationRecordB_8E450	proc far		; CODE XREF: VROOMM_StubThunk_6B670J

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8E476
		jmp	loc_8E5AD
; ���������������������������������������������������������������������������

loc_8E476:				; CODE XREF: AITargeting_LoadCalibrationRecordB_8E450+21j
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		movsx	eax, ax
		imul	eax, 73Ch
		mov	[si+2Eh], eax
		push	di

loc_8E48D:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8E493:
		mov	[si+34h], ax

loc_8E496:
		mov	[si+32h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+22h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+24h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+26h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+28h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+2Ah], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+2Ch], ax
		push	di
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
		mov	[si+64h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+66h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+68h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+6Ah], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+6Ch], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+6Eh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+50h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+52h], ax
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+36h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+37h], al
		mov	ax, [si+22h]
		mov	[bp+var_2], ax
		mov	ax, [si+24h]
		mov	[bp+var_4], ax
		mov	ax, [si+26h]
		mov	[bp+var_6], ax
		mov	ax, [si+28h]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+16h], ax
		mov	ax, [bp+var_4]
		mov	[si+18h], ax
		mov	ax, [bp+var_6]
		mov	[si+1Ah], ax
		mov	ax, [bp+var_8]
		mov	[si+1Ch], ax
		mov	ax, [si+22h]
		mov	[bp+var_A], ax
		mov	ax, [si+24h]
		mov	[bp+var_C], ax
		mov	ax, [si+26h]
		mov	[bp+var_E], ax
		mov	ax, [si+28h]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[si+8],	ax
		mov	ax, [bp+var_C]

loc_8E59E:
		mov	[si+0Ah], ax

loc_8E5A1:
		mov	ax, [bp+var_E]
		mov	[si+0Ch], ax

loc_8E5A7:
		mov	ax, [bp+var_10]
		mov	[si+0Eh], ax

loc_8E5AD:				; CODE XREF: AITargeting_LoadCalibrationRecordB_8E450+23j
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_8E5C5
		jmp	loc_8E72E
; ���������������������������������������������������������������������������

loc_8E5C5:				; CODE XREF: AITargeting_LoadCalibrationRecordB_8E450+170j
		push	0
		push	large 424D5953h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8E63B
		mov	eax, [di+72h]
		mov	[bp+var_14], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2],	dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[si+3Ch], eax
		mov	byte ptr [si+40h], 3
		mov	byte ptr [si+41h], 1
		mov	dword ptr [si+42h], 0
		mov	eax, [bp+var_14]
		mov	[si+42h], eax
		push	0
		mov	al, [si+40h]
		push	ax
		push	large dword ptr	[si+3Ch]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8E63B:				; CODE XREF: AITargeting_LoadCalibrationRecordB_8E450+188j
		push	0
		push	large 4D4F4F5Ah
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8E6B1
		mov	eax, [di+72h]
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2],	dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[si+46h], eax
		mov	byte ptr [si+4Ah], 3
		mov	byte ptr [si+4Bh], 1
		mov	dword ptr [si+4Ch], 0
		mov	eax, [bp+var_1C]
		mov	[si+4Ch], eax
		push	0
		mov	al, [si+4Ah]
		push	ax

loc_8E697:
		push	large dword ptr	[si+46h]

loc_8E69B:
		push	5C44h

loc_8E69E:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8E6B1:				; CODE XREF: AITargeting_LoadCalibrationRecordB_8E450+1FEj
		push	0
		push	large 4D524F4Eh
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8E727
		mov	eax, [di+72h]
		mov	[bp+var_24], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_28+2],	dx
		mov	word ptr [bp+var_28], ax
		mov	eax, [bp+var_28]
		mov	[si+54h], eax
		mov	byte ptr [si+58h], 3
		mov	byte ptr [si+59h], 1
		mov	dword ptr [si+5Ah], 0
		mov	eax, [bp+var_24]
		mov	[si+5Ah], eax
		push	0
		mov	al, [si+58h]
		push	ax
		push	large dword ptr	[si+54h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8E727:				; CODE XREF: AITargeting_LoadCalibrationRecordB_8E450+274j
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8E72E:				; CODE XREF: AITargeting_LoadCalibrationRecordB_8E450+172j
		pop	di
		pop	si
		leave
		retf
AITargeting_LoadCalibrationRecordB_8E450	endp

ovr261		ends
