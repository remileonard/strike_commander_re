ovr252		segment	para public 'OVERLAY' use16
		assume cs:ovr252
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle ReadFieldGroupB_64A54 à plusieurs reprises (142 lignes).
; ==============================================================================================
TextScroll_LoadMultipleFieldGroups_87F00	proc far		; CODE XREF: VROOMM_StubThunk_6B2E0J

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
		sub	sp, 18h
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
		jnz	short loc_87F26
		jmp	loc_87FC9
; ���������������������������������������������������������������������������

loc_87F26:				; CODE XREF: TextScroll_LoadMultipleFieldGroups_87F00+21j
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
		push	si
		call	UI_PositionListLabels
		pop	cx
		mov	ax, [si+22h]
		mov	[bp+var_2], ax
		mov	ax, [si+24h]
		mov	[bp+var_4], ax
		mov	ax, [si+26h]
		mov	[bp+var_6], ax
		mov	ax, [si+28h]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+8],	ax
		mov	ax, [bp+var_4]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_6]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_8]
		mov	[si+0Eh], ax
		mov	ax, [si+22h]
		mov	[bp+var_A], ax
		mov	ax, [si+24h]
		mov	[bp+var_C], ax
		mov	ax, [si+26h]
		mov	[bp+var_E], ax
		mov	ax, [si+28h]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[si+16h], ax
		mov	ax, [bp+var_C]
		mov	[si+18h], ax
		mov	ax, [bp+var_E]
		mov	[si+1Ah], ax
		mov	ax, [bp+var_10]
		mov	[si+1Ch], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+2Ah], ax
		push	di

loc_87FC0:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+2Ch], ax

loc_87FC9:				; CODE XREF: TextScroll_LoadMultipleFieldGroups_87F00+23j
		push	0
		push	large 50414853h
		push	di

loc_87FD2:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8803F
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
		mov	[si+2Eh], eax
		mov	byte ptr [si+32h], 3
		mov	byte ptr [si+33h], 1
		mov	dword ptr [si+34h], 0
		mov	eax, [bp+var_14]
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

loc_8803F:				; CODE XREF: TextScroll_LoadMultipleFieldGroups_87F00+DCj
		pop	di
		pop	si
		leave
		retf
TextScroll_LoadMultipleFieldGroups_87F00	endp

ovr252		ends
