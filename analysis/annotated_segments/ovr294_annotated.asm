ovr294		segment	para public 'OVERLAY' use16
		assume cs:ovr294
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Terrain_SectorRefDec (×2), Memory_TypedFree_5C7B6, TerrainTile_DestructSimple.
; ==============================================================================================
Terrain_ReleaseSectorAndTile_99AA0	proc far		; CODE XREF: VROOMM_StubThunk_6BDC5J

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_99AB5
		jmp	loc_99B7B
; ���������������������������������������������������������������������������

loc_99AB5:				; CODE XREF: Terrain_ReleaseSectorAndTile_99AA0+10j
		mov	word ptr [si], 1986h
		cmp	byte_6EA75, 0
		jz	short loc_99B29
		push	0
		mov	al, [si+8]
		push	ax
		push	large dword ptr	[si+4]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832

loc_99AD2:
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx

loc_99AD8:
		mov	word ptr [bp+var_4], ax
		mov	eax, [si+0Ah]

loc_99ADF:
		mov	ebx, 6

loc_99AE5:
		cdq

loc_99AE7:
		idiv	ebx
		mov	[bp+var_6], ax
		mov	[bp+var_8], 0
		jmp	short loc_99B21
; ���������������������������������������������������������������������������

loc_99AF4:				; CODE XREF: Terrain_ReleaseSectorAndTile_99AA0+87j
		les	bx, [bp+var_4]
		mov	dl, es:[bx+4]
		cmp	dl, 0FFh
		jz	short loc_99B07
		push	dx
		call	Terrain_SectorRefDec
		pop	cx

loc_99B07:				; CODE XREF: Terrain_ReleaseSectorAndTile_99AA0+5Ej
		les	bx, [bp+var_4]
		mov	dl, es:[bx+5]
		cmp	dl, 0FFh
		jz	short loc_99B1A

loc_99B13:
		push	dx
		call	Terrain_SectorRefDec
		pop	cx

loc_99B1A:				; CODE XREF: Terrain_ReleaseSectorAndTile_99AA0+71j
		inc	[bp+var_8]
		add	word ptr [bp+var_4], 6

loc_99B21:				; CODE XREF: Terrain_ReleaseSectorAndTile_99AA0+52j
		mov	ax, [bp+var_8]

loc_99B24:
		cmp	ax, [bp+var_6]
		jl	short loc_99AF4

loc_99B29:				; CODE XREF: Terrain_ReleaseSectorAndTile_99AA0+1Ej
		cmp	byte ptr [si+9], 0
		jz	short loc_99B4F

loc_99B2F:
		cmp	dword ptr [si+4], 0
		jz	short loc_99B4F
		push	0
		mov	al, [si+8]
		push	ax

loc_99B3C:
		mov	ax, si

loc_99B3E:
		add	ax, 4
		push	ax

loc_99B42:
		push	5C44h
		call	Memory_TypedFree_5C7B6

loc_99B4A:
		add	sp, 8
		jmp	short $+2

loc_99B4F:				; CODE XREF: Terrain_ReleaseSectorAndTile_99AA0+8Dj
					; Terrain_ReleaseSectorAndTile_99AA0+94j
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0

loc_99B63:
		push	0
		push	si
		call	TerrainTile_DestructSimple
		add	sp, 4
		test	di, 1
		jz	short loc_99B7B
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_99B7B:				; CODE XREF: Terrain_ReleaseSectorAndTile_99AA0+12j
					; Terrain_ReleaseSectorAndTile_99AA0+D2j
		pop	di
		pop	si
		leave
		retf
Terrain_ReleaseSectorAndTile_99AA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 199 lignes, NON DÉTAILLÉE — variante de IndexedRecordReader_ScanAndReadTyped_99120.
; ==============================================================================================
IndexedRecordReader_ScanAndReadTypedB_99B7F	proc far		; CODE XREF: VROOMM_StubThunk_6BDC0J

var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di

loc_99B87:
		mov	si, [bp+arg_0]

loc_99B8A:
		mov	di, [bp+arg_2]
		mov	ax, 1209h

loc_99B90:
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		cmp	dword ptr [si+4], 0
		jz	short loc_99BA7
		jmp	loc_99CEB
; ���������������������������������������������������������������������������

loc_99BA7:				; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F+23j
		push	[bp+arg_4]
		push	di
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_99BC4
		mov	eax, [di+61h]
		jmp	short loc_99BC8
; ���������������������������������������������������������������������������

loc_99BC4:				; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F+3Dj
		mov	eax, [di+71h]

loc_99BC8:				; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F+43j
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax

loc_99BD0:
		push	1
		push	0
		push	2

loc_99BD6:
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+4],	eax
		mov	byte ptr [si+8], 2
		mov	byte ptr [si+9], 1
		mov	dword ptr [si+0Ah], 0
		mov	eax, [bp+var_8]
		mov	[si+0Ah], eax
		push	0
		mov	al, [si+8]
		push	ax
		push	large dword ptr	[si+4]

loc_99C13:
		push	5C44h

loc_99C16:
		call	Memory_TypedAllocDispatchB_5C832

loc_99C1B:
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	di
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8
		mov	word ptr [si+10h], 0
		mov	word ptr [si+0Eh], 7FFFh
		mov	[bp+var_10], 0
		push	0
		mov	al, [si+8]

loc_99C43:
		push	ax
		push	large dword ptr	[si+4]

loc_99C48:
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah

loc_99C53:
		mov	word ptr [bp+var_14+2],	dx

loc_99C56:
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_4]

loc_99C5D:
		mov	ebx, 6

loc_99C63:
		cdq
		idiv	ebx
		mov	[bp+var_16], ax
		xor	di, di
		jmp	short loc_99CCF
; ���������������������������������������������������������������������������

loc_99C6F:				; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F+153j
		cmp	byte_6EA75, 0
		jz	short loc_99C9C
		les	bx, [bp+var_14]
		mov	dl, es:[bx+4]
		cmp	dl, 0FFh
		jz	short loc_99C89

loc_99C82:
		push	dx

loc_99C83:
		call	Terrain_SectorRefInc
		pop	cx

loc_99C89:				; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F+101j
		les	bx, [bp+var_14]

loc_99C8C:
		mov	dl, es:[bx+5]

loc_99C90:
		cmp	dl, 0FFh

loc_99C93:
		jz	short loc_99C9C
		push	dx
		call	Terrain_SectorRefInc
		pop	cx

loc_99C9C:				; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F+F5j
					; IndexedRecordReader_ScanAndReadTypedB_99B7F:loc_99C93j
		mov	ax, [si+10h]
		les	bx, [bp+var_14]
		cmp	ax, es:[bx]
		jge	short loc_99CAD
		mov	ax, es:[bx]
		mov	[si+10h], ax

loc_99CAD:				; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F+126j
		mov	ax, [si+0Eh]
		les	bx, [bp+var_14]
		cmp	ax, es:[bx]
		jle	short loc_99CBE
		mov	ax, es:[bx]
		mov	[si+0Eh], ax

loc_99CBE:				; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F+137j
		les	bx, [bp+var_14]
		movsx	eax, word ptr es:[bx]
		add	[bp+var_10], eax
		add	word ptr [bp+var_14], 6
		inc	di

loc_99CCF:				; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F+EEj
		cmp	di, [bp+var_16]
		jl	short loc_99C6F
		movsx	ebx, [bp+var_16]
		mov	eax, [bp+var_10]
		cdq
		idiv	ebx
		mov	[si+12h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2],	ax

loc_99CEB:				; CODE XREF: IndexedRecordReader_ScanAndReadTypedB_99B7F+25j
		pop	di
		pop	si
		leave
		retf
IndexedRecordReader_ScanAndReadTypedB_99B7F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 190 lignes, NON DÉTAILLÉE — variante de Terrain_LoadHeightmapFromIFF_998C0, avec
; StreamReader.
; ==============================================================================================
Terrain_LoadHeightmapFromIFFB_99CEF	proc far		; CODE XREF: VROOMM_StubThunk_6BDCAJ

var_EC		= word ptr -0ECh
var_8F		= dword	ptr -8Fh
var_8B		= dword	ptr -8Bh
var_86		= word ptr -86h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0ECh
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
		mov	al, [si]
		mov	ah, 0
		or	ax, ax
		jz	short loc_99D19
		jmp	loc_99E78
; ���������������������������������������������������������������������������

loc_99D19:				; CODE XREF: Terrain_LoadHeightmapFromIFFB_99CEF+25j
		push	large 2Eh ; '.'
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_86]
		push	ax
		push	large 0
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	far ptr	Stdio_ArgTrampoline5
		add	sp, 0Ah

loc_99D42:
		lea	ax, [bp+var_86]
		push	ax

loc_99D47:
		push	[bp+var_2A]

loc_99D4A:
		push	di
		push	si
		call	Terrain_HeightmapAllocate

loc_99D51:
		add	sp, 8

loc_99D54:
		mov	eax, [bp+var_26]
		mov	[si+82h], eax
		mov	ax, [bp+var_28]
		mov	[si+86h], ax
		mov	ax, [si+86h]
		imul	word ptr [si+7]
		mov	[si+88h], ax
		push	1
		push	0
		push	2
		mov	ax, [si+9]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+8Ch], dx
		mov	[si+8Ah], ax

loc_99D93:
		lea	ax, [bp+var_EC]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_EC], 2C8h
		mov	[bp+var_8B], 100h
		mov	[bp+var_8F], 0
		mov	[bp+var_EC], 138Ah
		push	6
		mov	ax, di
		add	ax, 208h
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	ax, di
		add	ax, 208h
		push	ax

loc_99DD2:
		call	StreamReader_GetPosition_64075
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	ax, [di+275h]

loc_99DE4:
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_99DF3
		mov	eax, [di+269h]
		jmp	short loc_99DF8
; ���������������������������������������������������������������������������

loc_99DF3:				; CODE XREF: Terrain_LoadHeightmapFromIFFB_99CEF+FBj
		mov	eax, [di+279h]

loc_99DF8:				; CODE XREF: Terrain_LoadHeightmapFromIFFB_99CEF+102j
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		push	0
		push	edx
		push	large [bp+var_4]
		mov	ax, di
		add	ax, 208h
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		call	StreamReader_ConstructAndBind_63B23
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		mov	ax, [si+9]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	large dword ptr	[si+8Ah]

loc_99E31:
		lea	ax, [bp+var_EC]
		push	ax

loc_99E36:
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh

loc_99E3E:
		lea	ax, [bp+var_EC]
		push	ax

loc_99E43:
		call	StreamReader_CloseHook_63D6E
		pop	cx
		mov	ax, [bp+var_36]
		mov	[si+8Eh], ax
		mov	ax, [bp+var_34]
		mov	[si+90h], ax
		mov	eax, [bp+var_32]
		mov	[si+96h], eax

loc_99E60:
		mov	eax, [bp+var_2E]
		mov	[si+92h], eax
		push	0
		lea	ax, [bp+var_EC]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4

loc_99E78:				; CODE XREF: Terrain_LoadHeightmapFromIFFB_99CEF+27j
		pop	di
		pop	si
		leave
		retf
Terrain_LoadHeightmapFromIFFB_99CEF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFree_5C7B6 et TerrainTile_DescriptorDestruct.
; ==============================================================================================
Terrain_ReleaseTileDescriptorB_99E7C	proc far		; CODE XREF: VROOMM_StubThunk_6BDCFJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_99EB8
		push	0
		push	2
		mov	ax, si
		add	ax, 8Ah	; '�'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		push	0
		push	si
		call	TerrainTile_DescriptorDestruct
		add	sp, 4
		test	di, 1
		jz	short loc_99EB8
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_99EB8:				; CODE XREF: Terrain_ReleaseTileDescriptorB_99E7C+Dj
					; Terrain_ReleaseTileDescriptorB_99E7C+33j
		pop	di
		pop	si
		pop	bp
		retf
Terrain_ReleaseTileDescriptorB_99E7C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (22 lignes).
; ==============================================================================================
Terrain_Helper2_99EBC	proc far		; CODE XREF: VROOMM_StubThunk_6BDD4J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	word ptr [si+1]
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr Terrain_Helper3_99ED5
		add	sp, 6
		pop	si

loc_99ED3:
		pop	bp
		retf
Terrain_Helper2_99EBC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (41 lignes).
; ==============================================================================================
Terrain_Helper3_99ED5	proc far		; CODE XREF: VROOMM_StubThunk_6BDD9J Terrain_Helper2_99EBC+10p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_99ED8:
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_99EDD:
		mov	di, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	[si+43h], ax
		mov	[si+45h], di
		mov	ax, [di+7]
		mov	[si+47h], ax
		mov	ax, [di+86h]
		mov	[si+49h], ax
		push	large dword ptr	[di+92h]
		push	large dword ptr	[di+96h]
		movsx	eax, word ptr [di+90h]
		push	eax
		mov	bx, [si+43h]
		push	word ptr [bx+290h]
		push	si

loc_99F10:
		call	VROOMM_StubThunk_6BE24

loc_99F15:
		add	sp, 10h
		pop	di
		pop	si
		pop	bp
		retf
Terrain_Helper3_99ED5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (48 lignes).
; ==============================================================================================
Terrain_Helper4_99F1C	proc far		; CODE XREF: VROOMM_StubThunk_6BDDEJ

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[si+45h], di
		mov	ax, [di+7]

loc_99F30:
		mov	[si+47h], ax
		mov	ax, [di+86h]
		mov	[si+49h], ax
		movsx	eax, word ptr [di+90h]

loc_99F40:
		mov	[si+9],	eax
		mov	eax, [di+92h]
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax

loc_99F55:
		mov	eax, [bp+var_8]
		mov	[si+1],	eax
		push	word ptr [di+8Eh]
		push	si

loc_99F62:
		call	VROOMM_StubThunk_6BE33
		add	sp, 4
		pop	di
		pop	si

locret_99F6C:
		leave

locret_99F6D:
		retf
Terrain_Helper4_99F1C	endp

ovr294		ends
