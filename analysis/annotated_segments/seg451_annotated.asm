seg451		segment	para public 'OVERLAY' use16
		assume cs:seg451
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 197 lignes, NON DÉTAILLÉE — combine sub_3C942, sub_6C5A0,
; ResourceRecord_SeekAndRead_64743, ReadFieldGroupC_64A7E (×7), ReadFieldGroupB_64A54 (×2,
; seg193), gestion d'erreur — motif standard de chargement massif de champs IFF.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryM_A66F0	proc far		; CODE XREF: VROOMM_StubThunk_6CC70J

var_2C		= dword	ptr -2Ch
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
		sub	sp, 2Ch
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx

loc_A6702:
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	si
		push	large [bp+arg_0]
		call	IFF_LoadAngleParam
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C5A0
		add	sp, 6
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_A673C
		jmp	loc_A6896
; ���������������������������������������������������������������������������

loc_A673C:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryM_A66F0+47j
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+7Ch], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+5Eh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+62h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]

loc_A6783:
		mov	es:[bx+66h], eax

loc_A6788:
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E

loc_A678E:
		push	dx
		push	ax
		pop	eax
		pop	cx

loc_A6793:
		les	bx, [bp+arg_0]
		mov	es:[bx+6Ah], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+72h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+76h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+7Ah], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+80h], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 76h	; 'v'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]

loc_A67F4:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 100h
		jle	short loc_A6807
		mov	ax, 1
		jmp	short loc_A6809
; ���������������������������������������������������������������������������

loc_A6807:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryM_A66F0+110j
		xor	ax, ax

loc_A6809:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryM_A66F0+115j
		or	al, al
		jz	short loc_A682D

loc_A680D:
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		les	bx, [bp+arg_0]
		mov	es:[bx+76h], eax

loc_A682D:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryM_A66F0+11Bj
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 6Ah	; 'j'
		mov	word ptr [bp+var_18+2],	ax
		mov	word ptr [bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+66h]
		sub	eax, es:[bx+62h]
		mov	[bp+var_1C], eax
		mov	eax, dword_70458
		imul	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	edx, eax
		mov	ecx, [bp+var_14]

loc_A6874:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		sar	eax, 8
		mov	es:[bx+6Eh], eax
		jmp	short loc_A689F
; ���������������������������������������������������������������������������

loc_A6896:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryM_A66F0+49j
		push	0B008h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A689F:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryM_A66F0+1A4j
		pop	si
		leave
		retf
PlayerComponent_LoadFieldsWithRetryM_A66F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_SeekAndRead_64743 et ReadFinalField_64B51 (×2, seg193), gestion
; d'erreur.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryN_A68A2	proc far		; CODE XREF: VROOMM_StubThunk_6CC75J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A68EC
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+2], al
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+3], al
		jmp	short loc_A68F5
; ���������������������������������������������������������������������������

loc_A68EC:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryN_A68A2+2Aj
		push	0B009h
		call	VROOMM_StubThunk_6B70F

loc_A68F4:
		pop	cx

loc_A68F5:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryN_A68A2+48j
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryN_A68A2	endp

seg451		ends
