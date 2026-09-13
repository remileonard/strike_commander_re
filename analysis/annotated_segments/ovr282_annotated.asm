ovr282		segment	para public 'OVERLAY' use16
		assume cs:ovr282
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFieldGroupB_64A54/ReadFieldGroupA_64A19 (55 lignes).
; ==============================================================================================
AircraftComponent_LoadFieldGroupAB_965E0	proc far		; CODE XREF: VROOMM_StubThunk_6BAF0J

var_A		= word ptr -0Ah
var_8		= word ptr -8
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	byte ptr [bp+0], 0
		xor	si, si
		jmp	short loc_96636
; ���������������������������������������������������������������������������

loc_965F3:				; CODE XREF: AircraftComponent_LoadFieldGroupAB_965E0+5Ej
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_A], ax
		push	large 8
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		push	large 0
		push	[bp+var_A]
		lea	ax, [bp+var_8]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+86h]
		add	ax, si
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	VROOMM_StubThunk_6CD6C
		add	sp, 0Eh
		inc	si

loc_96636:				; CODE XREF: AircraftComponent_LoadFieldGroupAB_965E0+11j
		les	bx, [bp+arg_0]
		cmp	es:[bx+88h], si
		ja	short loc_965F3
		pop	di
		pop	si
		leave
		retf
AircraftComponent_LoadFieldGroupAB_965E0	endp

ovr282		ends
