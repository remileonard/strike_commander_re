ovr292		segment	para public 'OVERLAY' use16
		assume cs:ovr292
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 267 lignes, NON DÉTAILLÉE — alloue plusieurs tampons typés
; (Memory_TypedAllocDispatchB_5C832 répété).
; ==============================================================================================
Terrain_AllocateSectorBuffers_99650	proc far		; CODE XREF: VROOMM_StubThunk_6BD60J Terrain_LoadATRIChunk_998C0+F1p

var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4

		push	bp

loc_99651:
		mov	bp, sp

loc_99653:
		sub	sp, 32h
		push	si
		push	1
		push	0
		push	2

loc_9965D:
		push	large 960h

loc_99663:
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	eax, [bp+var_4]
		mov	dword_725A2, eax
		mov	byte_725A6, 2

loc_99681:
		mov	byte_725A7, 1

loc_99686:
		mov	dword_725A8, 0
		mov	dword_725A8, 960h
		push	0
		mov	al, byte_725A6
		push	ax
		push	large [dword_725A2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	0
		mov	al, byte_725A6
		push	ax
		push	large [dword_725A2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		push	0
		mov	al, byte_725A6
		push	ax

loc_996D0:
		push	large [dword_725A2]

loc_996D5:
		push	5C44h

loc_996D8:
		call	Memory_TypedAllocDispatchB_5C832

loc_996DD:
		add	sp, 0Ah

loc_996E0:
		mov	word ptr dword_6EA68+2,	dx

loc_996E4:
		mov	word ptr dword_6EA68, ax

loc_996E7:
		mov	ax, [bp+var_8]
		mov	[bp+var_A], ax
		mov	word_7259E, ax
		add	ax, 258h
		mov	[bp+var_C], ax
		mov	word_725A0, ax
		mov	ax, word ptr dword_6EA68+2
		mov	dx, word_7259E
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		mov	dx, word_725A0
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		mov	si, [bp+var_8]
		xor	cx, cx
		jmp	loc_99819
; ���������������������������������������������������������������������������

loc_99718:				; CODE XREF: Terrain_AllocateSectorBuffers_99650+1CEj
		mov	ax, cx

loc_9971A:
		imul	ax, 1Eh
		les	bx, [bp+var_10]
		add	bx, ax
		mov	byte ptr es:[bx], 0FFh
		mov	ax, cx
		imul	ax, 3
		imul	ax, 1Eh
		mov	dx, si
		add	dx, ax
		mov	[bp+var_12], dx
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax
		mov	ax, [bp+var_12]
		mov	es:[bx+1], ax
		mov	ax, cx
		imul	ax, 3
		inc	ax
		imul	ax, 1Eh
		mov	dx, si
		add	dx, ax
		mov	[bp+var_14], dx
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax
		mov	ax, [bp+var_14]

loc_99763:
		mov	es:[bx+3], ax
		mov	ax, cx
		imul	ax, 3
		add	ax, 2
		imul	ax, 1Eh
		mov	dx, si
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax
		mov	ax, [bp+var_16]
		mov	es:[bx+5], ax
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+7], 0
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+9], 0
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+0Bh], 0
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+0Dh], 0
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax

loc_997D4:
		mov	word ptr es:[bx+0Fh], 0
		mov	ax, cx
		imul	ax, 1Eh

loc_997DF:
		mov	bx, word ptr [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+11h], 0
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax
		mov	byte ptr es:[bx+13h], 0
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+14h], 0
		mov	ax, cx
		imul	ax, 1Eh
		mov	bx, word ptr [bp+var_10]
		add	bx, ax

loc_99813:
		mov	byte ptr es:[bx+1Ch], 0

loc_99818:
		inc	cx

loc_99819:				; CODE XREF: Terrain_AllocateSectorBuffers_99650+C5j
		cmp	cx, 14h
		jge	short loc_99821
		jmp	loc_99718
; ���������������������������������������������������������������������������

loc_99821:				; CODE XREF: Terrain_AllocateSectorBuffers_99650+1CCj
		mov	ax, word ptr dword_6EA68+2

loc_99824:
		mov	dx, word_725A0
		mov	word ptr [bp+var_1A+2],	ax
		mov	word ptr [bp+var_1A], dx
		xor	cx, cx

loc_99830:
		jmp	short loc_998B0
; ���������������������������������������������������������������������������

loc_99832:				; CODE XREF: Terrain_AllocateSectorBuffers_99650+265j
		mov	[bp+var_1E], 0
		mov	eax, [bp+var_1E]
		les	bx, [bp+var_1A]
		mov	es:[bx+11h], eax
		mov	[bp+var_22], 0
		mov	eax, [bp+var_22]
		mov	es:[bx+15h], eax
		mov	[bp+var_26], 0
		mov	eax, [bp+var_26]
		mov	es:[bx+19h], eax
		mov	byte ptr es:[bx+1Dh], 0
		mov	[bp+var_2A], 0
		mov	eax, [bp+var_2A]
		mov	es:[bx], eax
		mov	[bp+var_2E], 0
		mov	eax, [bp+var_2E]
		mov	es:[bx+4], eax
		mov	[bp+var_32], 0
		mov	eax, [bp+var_32]
		mov	es:[bx+8], eax
		mov	word ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx+0Eh], 0
		add	word ptr [bp+var_1A], 1Eh
		inc	cx

loc_998B0:				; CODE XREF: Terrain_AllocateSectorBuffers_99650:loc_99830j
		cmp	cx, 3Ch	; '<'
		jge	short loc_998B8
		jmp	loc_99832
; ���������������������������������������������������������������������������

loc_998B8:				; CODE XREF: Terrain_AllocateSectorBuffers_99650+263j
		mov	byte_6EA15, 0
		pop	si
		leave
		retf
Terrain_AllocateSectorBuffers_99650	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,152L — LECTEUR DU CHUNK 'ATRI' du FORM TERA (dans <nom>.PAK). seek_chunk('ATRI') (tag
; 0x49525441) ; ReadFieldGroupA(rr, hdr, 0x35) -> en-tete 53 o : +0x00 u16 dim ; +0x02 u32 ->
; terrain+0x8A ; +0x06 u16 count ; +0x08 count x u32 -> terrain+0x90 ; +0x18 count x u32 ->
; terrain+0xA0 ; +0x28 char[13] nom du blob ('MAURITAN.TRI'). sprintf(nameBuf, hdr+0x28) via
; Stdio_ArgTrampoline5 ; Terrain_HeightmapAllocate_33346(terrain, rr, dim, nameBuf) qui alloue
; la grille dim x dim u16 (terrain+0x03), resout l'extension (.ELV->1 .MED->2 .LOW->3 .AVG->4
; .TRI->5), positionne l'IndexedRecordReader rr+0x208 sur le blob et bind un sous-flux
; terrain+0x0B dessus. Le blob .TRI est un PAK imbrique de 324 cellules (grille 18x18) ;
; cellules non vides = u16 count + count x record 70 o de placement d'objet d'aerodrome (nom
; modele + variante detail + X/Z/Y + flags). Detail : analysis/DATA_MODEL.md §6.8 / §6.8bis.
; Nom IDA 'Heightmap' trompeur.
; ==============================================================================================
Terrain_LoadATRIChunk_998C0	proc far		; CODE XREF: VROOMM_StubThunk_6BD65J

var_86		= word ptr -86h
var_36		= word ptr -36h
var_34		= dword	ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_1E		= word ptr -1Eh
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	al, [si]
		mov	ah, 0

loc_998D3:
		or	ax, ax
		jz	short loc_998DA
		jmp	loc_999B4
; ���������������������������������������������������������������������������

loc_998DA:				; CODE XREF: Terrain_LoadATRIChunk_998C0+15j
		push	0

loc_998DC:
		push	large 49525441h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_998F2
		jmp	loc_999B4
; ���������������������������������������������������������������������������

loc_998F2:				; CODE XREF: Terrain_LoadATRIChunk_998C0+2Dj
		push	large 35h ; '5'
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_86]
		push	ax
		push	large 0
		push	0
		lea	ax, [bp+var_E]
		push	ax

loc_99911:
		call	far ptr	Stdio_ArgTrampoline5

loc_99916:
		add	sp, 0Ah
		lea	ax, [bp+var_86]
		push	ax
		push	[bp+var_36]
		push	[bp+arg_2]
		push	si
		call	Terrain_HeightmapAllocate
		add	sp, 8
		mov	eax, [bp+var_34]
		mov	[si+8Ah], eax
		movsx	eax, word ptr [si+7]

loc_9993B:
		mov	edx, [si+8Ah]

loc_99940:
		imul	edx, eax

loc_99944:
		mov	[si+82h], edx

loc_99949:
		mov	eax, [si+82h]

loc_9994E:
		sar	eax, 1

loc_99951:
		mov	[si+86h], eax

loc_99956:
		mov	ax, [bp+var_30]

loc_99959:
		mov	[si+8Eh], ax
		xor	cx, cx

loc_9995F:
		jmp	short loc_99990
; ���������������������������������������������������������������������������

loc_99961:				; CODE XREF: Terrain_LoadATRIChunk_998C0+D4j
		mov	bx, cx

loc_99963:
		shl	bx, 2
		lea	ax, [bp+var_2E]
		add	bx, ax
		mov	eax, [bx]
		mov	bx, cx
		shl	bx, 2
		mov	[bx+si+90h], eax
		mov	bx, cx
		shl	bx, 2
		lea	ax, [bp+var_1E]

loc_99980:
		add	bx, ax

loc_99982:
		mov	eax, [bx]

loc_99985:
		mov	bx, cx
		shl	bx, 2
		mov	[bx+si+0A0h], eax
		inc	cx

loc_99990:				; CODE XREF: Terrain_LoadATRIChunk_998C0:loc_9995Fj
		cmp	[si+8Eh], cx
		jg	short loc_99961
		push	0
		mov	al, byte_725A6
		push	ax
		push	large [dword_725A2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_999B4
		push	cs
		call	near ptr Terrain_AllocateSectorBuffers_99650

loc_999B4:				; CODE XREF: Terrain_LoadATRIChunk_998C0+17j
					; Terrain_LoadATRIChunk_998C0+2Fj ...
		mov	dword_6EA68, 0
		pop	di
		pop	si
		leave
		retf
Terrain_LoadATRIChunk_998C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle TerrainTile_DescriptorDestruct.
; ==============================================================================================
Terrain_ReleaseTileDescriptor_999C1	proc far		; CODE XREF: VROOMM_StubThunk_6BD6AJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_999E8
		push	0
		push	si
		call	TerrainTile_DescriptorDestruct

loc_999D8:
		add	sp, 4
		test	di, 1
		jz	short loc_999E8
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_999E8:				; CODE XREF: Terrain_ReleaseTileDescriptor_999C1+Dj
					; Terrain_ReleaseTileDescriptor_999C1+1Ej
		pop	di
		pop	si
		pop	bp
		retf
Terrain_ReleaseTileDescriptor_999C1	endp

ovr292		ends
