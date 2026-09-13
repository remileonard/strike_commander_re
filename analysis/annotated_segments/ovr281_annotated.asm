ovr281		segment	para public 'OVERLAY' use16
		assume cs:ovr281
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle ReadFieldGroupA_64A19 (43 lignes).
; ==============================================================================================
AircraftComponent_LoadFieldGroupA_96590	proc far		; CODE XREF: VROOMM_StubThunk_6BAC0J

var_8		= word ptr -8
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	byte ptr [bp+0], 0
		xor	si, si
		jmp	short loc_965CD
; ���������������������������������������������������������������������������

loc_9659F:				; CODE XREF: AircraftComponent_LoadFieldGroupA_96590+45j
		push	large 8
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		push	large 0
		lea	ax, [bp+var_8]
		push	ax
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	VROOMM_StubThunk_6CD67
		add	sp, 0Ch
		inc	si

loc_965CD:				; CODE XREF: AircraftComponent_LoadFieldGroupA_96590+Dj
		les	bx, [bp+arg_0]
		cmp	es:[bx+86h], si
		ja	short loc_9659F
		pop	si
		leave
		retf
AircraftComponent_LoadFieldGroupA_96590	endp

ovr281		ends
