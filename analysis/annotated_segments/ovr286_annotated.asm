ovr286		segment	para public 'OVERLAY' use16
		assume cs:ovr286
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine HudIcon_ConstructDefault et lecture de champs IFF (90 lignes).
; ==============================================================================================
HudIcon_ConstructAndLoadFromIFF_97370	proc far		; CODE XREF: VROOMM_StubThunk_6BBB0J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		call	HudIcon_ConstructDefault
		add	sp, 4
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BB8A
		add	sp, 6
		push	0
		push	large 55514553h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax

loc_973A3:
		jz	short loc_973D7
		push	si

loc_973A6:
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]

loc_973AF:
		mov	es:[bx+17h], al
		push	si

loc_973B4:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_973D7:				; CODE XREF: HudIcon_ConstructAndLoadFromIFF_97370:loc_973A3j
		push	0
		push	large 49524353h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_97444
		mov	eax, [si+72h]
		mov	ebx, 2
		cdq
		idiv	ebx
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], ax
		push	1
		push	0
		push	2
		mov	ax, es:[bx+1Ch]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], dx
		mov	es:[bx+1Eh], ax
		mov	ax, es:[bx+1Ch]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	large dword ptr	es:[bx+1Eh]
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah

loc_97444:				; CODE XREF: HudIcon_ConstructAndLoadFromIFF_97370+7Aj
		pop	si
		pop	bp
		retf
HudIcon_ConstructAndLoadFromIFF_97370	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Widget_ConstructComposite (116 lignes).
; ==============================================================================================
AircraftComponent_ConstructWidget_97447	proc far		; CODE XREF: VROOMM_StubThunk_6BBB5J

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	[bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		call	Widget_ConstructComposite
		add	sp, 0Ah
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ah], eax
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_974DA
		cmp	word ptr es:[bx+1Ah], 0
		jge	short loc_9749D
		mov	ax, es:[bx+1Ch]
		dec	ax
		les	bx, [bp+arg_0]
		mov	es:[bx+1Eh], ax
		jmp	short loc_974A6
; ���������������������������������������������������������������������������

loc_9749D:				; CODE XREF: AircraftComponent_ConstructWidget_97447+46j
		les	bx, [bp+arg_0]

loc_974A0:
		mov	word ptr es:[bx+1Eh], 0

loc_974A6:				; CODE XREF: AircraftComponent_ConstructWidget_97447+54j
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_974C7

loc_974B1:
		les	bx, es:[bx+1Eh]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+1Eh]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		jmp	short loc_974CE
; ���������������������������������������������������������������������������

loc_974C7:				; CODE XREF: AircraftComponent_ConstructWidget_97447+68j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Eh]

loc_974CE:				; CODE XREF: AircraftComponent_ConstructWidget_97447+7Ej
		mov	[bp+var_A], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+9]
		jmp	short loc_9752D
; ���������������������������������������������������������������������������

loc_974DA:				; CODE XREF: AircraftComponent_ConstructWidget_97447+3Fj
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+1Ah], 0
		jge	short loc_974F2
		mov	ax, es:[bx+2]
		dec	ax
		les	bx, [bp+arg_0]
		mov	es:[bx+1Eh], ax
		jmp	short loc_974FB
; ���������������������������������������������������������������������������

loc_974F2:				; CODE XREF: AircraftComponent_ConstructWidget_97447+9Bj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+1Eh], 0

loc_974FB:				; CODE XREF: AircraftComponent_ConstructWidget_97447+A9j
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+1Eh], 0
		jz	short loc_9751C
		les	bx, es:[bx+1Eh]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+1Eh]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		jmp	short loc_97523
; ���������������������������������������������������������������������������

loc_9751C:				; CODE XREF: AircraftComponent_ConstructWidget_97447+BDj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Eh]

loc_97523:				; CODE XREF: AircraftComponent_ConstructWidget_97447+D3j
		mov	[bp+var_C], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+9]

loc_9752D:				; CODE XREF: AircraftComponent_ConstructWidget_97447+91j
		mov	es:[bx+6], ax
		pop	si
		leave
		retf
AircraftComponent_ConstructWidget_97447	endp

ovr286		ends
