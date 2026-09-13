ovr313		segment	para public 'OVERLAY' use16
		assume cs:ovr313
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_SeekAndRead_64743 et String_ConstructFromFarPtrLen (123 lignes).
; ==============================================================================================
MissionRecord_LoadStringFields_9D4F0	proc far		; CODE XREF: VROOMM_StubThunk_6C260J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C200
		add	sp, 6
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4Eh	; 'N'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	VROOMM_StubThunk_6C12E
		add	sp, 6
		push	0
		push	large 43454A45h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9D549
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Ah	; 'Z'

loc_9D533:
		push	word ptr [bp+arg_0+2]
		push	ax
		call	String_ConstructFromFarPtrLen
		add	sp, 6
		les	bx, [bp+arg_0]

loc_9D542:
		mov	byte ptr es:[bx+63h], 1
		jmp	short loc_9D551
; ���������������������������������������������������������������������������

loc_9D549:				; CODE XREF: MissionRecord_LoadStringFields_9D4F0+3Aj
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+63h], 0

loc_9D551:				; CODE XREF: MissionRecord_LoadStringFields_9D4F0+57j
		push	0
		push	large 464E494Ah
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_9D569
		jmp	loc_9D5E9
; ���������������������������������������������������������������������������

loc_9D569:				; CODE XREF: MissionRecord_LoadStringFields_9D4F0+74j
		push	si

loc_9D56A:
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+53h], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+54h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+56h], ax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+52h], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+64h], ax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+59h], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+66h], ax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+58h], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+68h], ax
		jmp	short loc_9D60C
; ���������������������������������������������������������������������������

loc_9D5E9:				; CODE XREF: MissionRecord_LoadStringFields_9D4F0+76j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+53h], 0
		mov	byte ptr es:[bx+52h], 2
		mov	word ptr es:[bx+64h], 5
		mov	byte ptr es:[bx+59h], 0
		mov	byte ptr es:[bx+58h], 6
		mov	word ptr es:[bx+68h], 1Eh

loc_9D60C:				; CODE XREF: MissionRecord_LoadStringFields_9D4F0+F7j
		pop	si
		pop	bp
		retf
MissionRecord_LoadStringFields_9D4F0	endp

ovr313		ends
