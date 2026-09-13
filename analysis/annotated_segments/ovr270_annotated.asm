ovr270		segment	para public 'OVERLAY' use16
		assume cs:ovr270
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 352 lignes, NON DÉTAILLÉE — combine
; ResourceRecord_SeekAndReadB_647B2/Memory_TypedFreeWrapper_5C6F3 répétés — variante de
; MissionText_LoadSubtitleRecord_87A60 (seg251).
; ==============================================================================================
MissionText_LoadSubtitleRecordB_94710	proc far		; CODE XREF: VROOMM_StubThunk_6B8B5J MissionText_LoadSubtitleWithString_94A86+C5p	...

var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		push	0
		push	large 594C4F50h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_9473A
		jmp	loc_947F9
; ���������������������������������������������������������������������������

loc_9473A:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+25j
		mov	[bp+var_6], si
		push	1
		push	0
		push	2
		push	large 9Eh ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		or	ax, dx
		jnz	short loc_94761
		jmp	loc_947F0
; ���������������������������������������������������������������������������

loc_94761:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+4Cj
		les	bx, [bp+var_A]
		mov	word ptr es:[bx], 1588h
		mov	word ptr es:[bx], 15C4h

loc_9476E:
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		mov	dword ptr es:[bx+12h], 0
		mov	byte ptr es:[bx+16h], 2
		mov	byte ptr es:[bx+17h], 0
		mov	dword ptr es:[bx+18h], 0
		mov	dword ptr es:[bx+1Ch], 0
		mov	byte ptr es:[bx+20h], 2
		mov	byte ptr es:[bx+21h], 0
		mov	dword ptr es:[bx+22h], 0
		xor	ax, ax
		mov	es:[bx+88h], ax
		mov	es:[bx+86h], ax
		xor	ax, ax
		mov	es:[bx+8Ch], ax
		mov	es:[bx+8Ah], ax
		push	[bp+var_6]
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BA65

loc_947E4:
		add	sp, 6
		mov	dx, word ptr [bp+var_A+2]
		mov	ax, word ptr [bp+var_A]
		jmp	loc_94A5F
; ���������������������������������������������������������������������������

loc_947F0:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+4Ej
		mov	dx, word ptr [bp+var_A+2]
		mov	ax, word ptr [bp+var_A]
		jmp	loc_94A5F
; ���������������������������������������������������������������������������

loc_947F9:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+27j
		push	0
		push	large 54414C46h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_94877
		mov	[bp+var_C], si
		push	1
		push	0
		push	2
		push	large 17h
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		or	ax, dx
		jz	short loc_9486E
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 1588h
		mov	word ptr es:[bx], 15B8h
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	[bp+var_C]
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BB8A
		add	sp, 6
		mov	dx, word ptr [bp+var_10+2]
		mov	ax, word ptr [bp+var_10]

loc_9486B:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+346j
		jmp	loc_94A5F
; ���������������������������������������������������������������������������

loc_9486E:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+11Dj
		mov	dx, word ptr [bp+var_10+2]
		mov	ax, word ptr [bp+var_10]
		jmp	loc_94A5F
; ���������������������������������������������������������������������������

loc_94877:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+FCj
		push	0
		push	large 54534944h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_948FD
		mov	[bp+var_12], si
		push	1
		push	0
		push	2
		push	large 17h
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		or	ax, dx
		jz	short loc_948F4
		les	bx, [bp+var_16]
		mov	word ptr es:[bx], 1588h
		mov	word ptr es:[bx], 15B8h
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	[bp+var_12]
		push	dx
		push	bx
		call	VROOMM_StubThunk_6BB8A
		add	sp, 6
		les	bx, [bp+var_16]
		mov	word ptr es:[bx], 15ACh
		mov	dx, word ptr [bp+var_16+2]
		mov	ax, word ptr [bp+var_16]
		jmp	loc_94A5F
; ���������������������������������������������������������������������������

loc_948F4:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+19Bj
		mov	dx, word ptr [bp+var_16+2]
		mov	ax, word ptr [bp+var_16]
		jmp	loc_94A5F
; ���������������������������������������������������������������������������

loc_948FD:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+17Aj
		push	0
		push	large 4D494E41h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_9498F
		mov	[bp+var_18], si
		push	1
		push	0
		push	2
		push	large 22h ; '"'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2],	dx
		mov	word ptr [bp+var_1C], ax
		or	ax, dx
		jz	short loc_94986
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 1588h
		mov	word ptr es:[bx], 15B8h
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	dx
		push	bx

loc_9495E:
		call	Descriptor_ConstructDefaultScale

loc_94963:
		add	sp, 4

loc_94966:
		les	bx, [bp+var_1C]

loc_94969:
		mov	word ptr es:[bx], 15A0h

loc_9496E:
		push	[bp+var_18]
		push	word ptr [bp+var_1C+2]

loc_94974:
		push	bx
		call	VROOMM_StubThunk_6BBB0
		add	sp, 6
		mov	dx, word ptr [bp+var_1C+2]
		mov	ax, word ptr [bp+var_1C]
		jmp	loc_94A5F
; ���������������������������������������������������������������������������

loc_94986:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+221j
		mov	dx, word ptr [bp+var_1C+2]
		mov	ax, word ptr [bp+var_1C]
		jmp	loc_94A5F
; ���������������������������������������������������������������������������

loc_9498F:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+200j
		push	0
		push	large 52435254h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_949EF
		mov	[bp+var_1E], si
		push	1
		push	0
		push	2
		push	large 4
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_22+2],	dx
		mov	word ptr [bp+var_22], ax
		or	ax, dx
		jz	short loc_949E7
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 1588h
		mov	word ptr es:[bx], 1594h
		push	[bp+var_1E]
		push	dx
		push	bx
		call	VROOMM_StubThunk_6CC75
		add	sp, 6
		mov	dx, word ptr [bp+var_22+2]
		mov	ax, word ptr [bp+var_22]
		jmp	short loc_94A5F
; ���������������������������������������������������������������������������

loc_949E7:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+2B3j
		mov	dx, word ptr [bp+var_22+2]
		mov	ax, word ptr [bp+var_22]
		jmp	short loc_94A5F
; ���������������������������������������������������������������������������

loc_949EF:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+292j
		push	0
		push	large 42544641h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_94A18
		push	si
		push	large 0
		call	VROOMM_StubThunk_6CCA5
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_94A65
; ���������������������������������������������������������������������������

loc_94A18:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+2F2j
		push	0
		push	large 454E4F4Eh
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_94A65
		push	1
		push	0
		push	2
		push	large 2
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_26+2],	dx
		mov	word ptr [bp+var_26], ax
		or	ax, dx
		jz	short loc_94A59
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 1588h
		mov	ax, word ptr [bp+var_26]
		jmp	loc_9486B
; ���������������������������������������������������������������������������

loc_94A59:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+339j
		mov	dx, word ptr [bp+var_26+2]
		mov	ax, word ptr [bp+var_26]

loc_94A5F:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+DDj
					; MissionText_LoadSubtitleRecordB_94710+E6j ...
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_94A65:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+306j
					; MissionText_LoadSubtitleRecordB_94710+31Bj
		cmp	[bp+var_4], 0
		jnz	short loc_94A76
		push	6002h
		call	VROOMM_StubThunk_6B70F
		jmp	short loc_94A7C
; ���������������������������������������������������������������������������

loc_94A76:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+35Aj
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25

loc_94A7C:				; CODE XREF: MissionText_LoadSubtitleRecordB_94710+364j
		pop	cx
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
MissionText_LoadSubtitleRecordB_94710	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine String_ConstructFromPtrLen, ResourceRecord_AllocateAndDecode_64C21 (seg193).
; ==============================================================================================
MissionText_LoadSubtitleWithString_94A86	proc far		; CODE XREF: VROOMM_StubThunk_6B8BAJ

var_B8		= word ptr -0B8h
var_5B		= dword	ptr -5Bh
var_57		= dword	ptr -57h
var_53		= dword	ptr -53h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B8h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		push	0
		push	large 52505041h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_94AB1
		jmp	loc_94B95
; ���������������������������������������������������������������������������

loc_94AB1:				; CODE XREF: MissionText_LoadSubtitleWithString_94A86+26j
		push	0
		push	large 454C4946h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_94AC9
		jmp	loc_94B82
; ���������������������������������������������������������������������������

loc_94AC9:				; CODE XREF: MissionText_LoadSubtitleWithString_94A86+3Ej
		mov	[bp+var_10], si
		push	[bp+var_10]
		lea	ax, [bp+var_E]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_B8], 2C8h
		mov	[bp+var_57], 100h
		mov	[bp+var_5B], 0
		mov	[bp+var_B8], 2E0h
		mov	[bp+var_3C], 0
		xor	ax, ax
		mov	[bp+var_3E], ax
		movsx	eax, ax
		mov	[bp+var_53], eax
		push	1
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		mov	bx, [bp+var_B8]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	dword ptr [si+6Dh], 52505041h
		jnz	short loc_94B38
		mov	ax, 1
		jmp	short loc_94B3A
; ���������������������������������������������������������������������������

loc_94B38:				; CODE XREF: MissionText_LoadSubtitleWithString_94A86+ABj
		xor	ax, ax

loc_94B3A:				; CODE XREF: MissionText_LoadSubtitleWithString_94A86+B0j
		or	ax, ax
		jz	short loc_94B57
		push	si
		call	ResourceRecord_AllocateAndDecode_64C21
		pop	cx
		lea	ax, [bp+var_B8]
		push	ax
		push	cs
		call	near ptr MissionText_LoadSubtitleRecordB_94710
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_94B60
; ���������������������������������������������������������������������������

loc_94B57:				; CODE XREF: MissionText_LoadSubtitleWithString_94A86+B6j
		push	6003h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_94B60:				; CODE XREF: MissionText_LoadSubtitleWithString_94A86+CFj
		mov	[bp+var_B8], 2E0h
		lea	ax, [bp+var_B8]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0

loc_94B73:
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		jmp	short loc_94B8E
; ���������������������������������������������������������������������������

loc_94B82:				; CODE XREF: MissionText_LoadSubtitleWithString_94A86+40j
		push	si
		push	cs
		call	near ptr MissionText_LoadSubtitleRecordB_94710
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_94B8E:				; CODE XREF: MissionText_LoadSubtitleWithString_94A86+FAj
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_94B95:				; CODE XREF: MissionText_LoadSubtitleWithString_94A86+28j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
MissionText_LoadSubtitleWithString_94A86	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Widget_DestructWithLabel et Memory_TypedFree_5C7B6.
; ==============================================================================================
MissionText_ReleaseWidgetLabel_94B9E	proc far		; CODE XREF: VROOMM_StubThunk_6B8B0J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_94BE0
		push	0
		push	large [bp+arg_0]
		call	Widget_DestructWithLabel
		add	sp, 6
		test	si, 1
		jz	short loc_94BE0
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_94BE0:				; CODE XREF: MissionText_ReleaseWidgetLabel_94B9E+Fj
					; MissionText_ReleaseWidgetLabel_94B9E+23j
		pop	si
		leave
		retf
MissionText_ReleaseWidgetLabel_94B9E	endp

ovr270		ends
