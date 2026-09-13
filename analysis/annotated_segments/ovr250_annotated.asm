ovr250		segment	para public 'OVERLAY' use16
		assume cs:ovr250
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue via CRT_Malloc16_Retry et thunk voisin (37 lignes).
; ==============================================================================================
TextScroll_Allocate_87930	proc far		; CODE XREF: VROOMM_StubThunk_6B250J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_87949
		push	78h ; 'x'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_87964

loc_87949:				; CODE XREF: TextScroll_Allocate_87930+9j
		push	si
		call	VROOMM_StubThunk_6B570
		pop	cx
		mov	word ptr [si], 888h
		mov	byte ptr [si+73h], 0
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr TextScroll_LoadFieldsFromIFF_87969
		add	sp, 4

loc_87964:				; CODE XREF: TextScroll_Allocate_87930+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScroll_Allocate_87930	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_SeekAndRead_64743 et ReadFinalField_64B51
; (×3)/ReadFieldGroupB_64A54 — chargement de champs de défilement de texte depuis IFF.
; ==============================================================================================
TextScroll_LoadFieldsFromIFF_87969	proc far		; CODE XREF: VROOMM_StubThunk_6B255J TextScroll_Allocate_87930+2Ep

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
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
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_879F3
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+6],	al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+7],	al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+3],	al
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]

loc_879C9:
		shl	eax, 8
		mov	[bp+var_6], eax

loc_879D1:
		mov	[si+0Dh], eax
		mov	eax, [si+0Dh]
		mov	[si+9],	eax
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+8],	al
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0

loc_879F3:				; CODE XREF: TextScroll_LoadFieldsFromIFF_87969+31j
		pop	di
		pop	si
		leave
		retf
TextScroll_LoadFieldsFromIFF_87969	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (28 lignes).
; ==============================================================================================
TextScroll_Helper3_879F7	proc far		; CODE XREF: VROOMM_StubThunk_6B25AJ

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+73h], 32h ; '2'
		mov	word ptr [si+17h], 0
		push	si
		call	VROOMM_StubThunk_6B57A
		pop	cx
		mov	[bp+var_2], si
		cmp	dword_6E477, 0
		jnz	short loc_87A28
		mov	ax, [bp+var_2]
		mov	word ptr dword_6E477+2,	ds
		mov	word ptr dword_6E477, ax
		jmp	short $+2

loc_87A28:				; CODE XREF: TextScroll_Helper3_879F7+23j
		pop	si
		leave
		retf
TextScroll_Helper3_879F7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (29 lignes).
; ==============================================================================================
TextScroll_Helper4_87A2B	proc far		; CODE XREF: VROOMM_StubThunk_6B25FJ

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6B57F
		pop	cx
		mov	[bp+var_2], si
		mov	ax, [bp+var_2]
		mov	dx, ds
		cmp	dx, word ptr dword_6E477+2
		jnz	short loc_87A5B
		cmp	ax, word ptr dword_6E477
		jnz	short loc_87A5B
		mov	dword_6E477, 0
		jmp	short $+2

loc_87A5B:				; CODE XREF: TextScroll_Helper4_87A2B+1Dj
					; TextScroll_Helper4_87A2B+23j
		pop	si
		leave
		retf
TextScroll_Helper4_87A2B	endp

ovr250		ends
