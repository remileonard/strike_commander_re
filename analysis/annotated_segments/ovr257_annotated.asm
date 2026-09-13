ovr257		segment	para public 'OVERLAY' use16
		assume cs:ovr257
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFieldGroupB_64A54 répété (125 lignes).
; ==============================================================================================
MissionRecord_LoadFieldGroupMixE_8D0A0	proc far		; CODE XREF: VROOMM_StubThunk_6B545J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp

loc_8D0A3:
		push	si
		mov	si, [bp+arg_6]
		cmp	[bp+arg_0], 0
		jnz	short loc_8D0CF
		push	1
		push	0
		push	2
		push	large 51h ; 'Q'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8D0CF
		jmp	loc_8D1B7
; ���������������������������������������������������������������������������

loc_8D0CF:				; CODE XREF: MissionRecord_LoadFieldGroupMixE_8D0A0+Cj
					; MissionRecord_LoadFieldGroupMixE_8D0A0+2Aj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0B2Fh
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+4], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx], 0DA2h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Dh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 29h	; ')'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 35h	; '5'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 41h	; 'A'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 45h	; 'E'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 49h	; 'I'
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8D1A6
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]

loc_8D140:
		mov	es:[bx+1Bh], ax
		push	si

loc_8D145:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]

loc_8D14E:
		mov	es:[bx+0Fh], ax
		push	si

loc_8D153:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+11h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_8D175:
		les	bx, [bp+arg_0]
		mov	es:[bx+13h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+19h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], ax

loc_8D1A6:				; CODE XREF: MissionRecord_LoadFieldGroupMixE_8D0A0+94j
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+4Dh], eax

loc_8D1B2:
		mov	byte ptr es:[bx+0Ch], 1

loc_8D1B7:				; CODE XREF: MissionRecord_LoadFieldGroupMixE_8D0A0+2Cj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		pop	bp
		retf
MissionRecord_LoadFieldGroupMixE_8D0A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin puis Memory_TypedFree_5C7B6.
; ==============================================================================================
MissionRecordField_ReleaseViaThunkB_8D1C0	proc far		; CODE XREF: VROOMM_StubThunk_6B540J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8D208
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0DA2h
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6B470
		add	sp, 6
		test	si, 1
		jz	short loc_8D208
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8D208:				; CODE XREF: MissionRecordField_ReleaseViaThunkB_8D1C0+Fj
					; MissionRecordField_ReleaseViaThunkB_8D1C0+2Bj
		pop	si
		leave
		retf
MissionRecordField_ReleaseViaThunkB_8D1C0	endp

ovr257		ends
