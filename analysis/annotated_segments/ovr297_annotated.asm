ovr297		segment	para public 'OVERLAY' use16
		assume cs:ovr297
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFieldGroupA_64A19, Stdio_ArgTrampoline5, Terrain_HeightmapAllocate —
; variante de Terrain_LoadHeightmapFromIFF_998C0 (seg292).
; ==============================================================================================
Terrain_LoadHeightmapFromIFFC_9AC10	proc far		; CODE XREF: VROOMM_StubThunk_6BEA0J

var_6C		= word ptr -6Ch
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp

loc_9AC11:
		mov	bp, sp

loc_9AC13:
		sub	sp, 6Ch

loc_9AC16:
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	al, [si]

loc_9AC20:
		mov	ah, 0

loc_9AC22:
		or	ax, ax
		jz	short loc_9AC29

loc_9AC26:
		jmp	loc_9AD06
; ���������������������������������������������������������������������������

loc_9AC29:				; CODE XREF: Terrain_LoadHeightmapFromIFFC_9AC10+14j
		push	0

loc_9AC2B:
		push	large 534A424Fh
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_9AC41
		jmp	loc_9AD06
; ���������������������������������������������������������������������������

loc_9AC41:				; CODE XREF: Terrain_LoadHeightmapFromIFFC_9AC10+2Cj
		push	large 1Bh
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah

loc_9AC52:
		lea	ax, [bp+var_6C]
		push	ax
		push	large 0
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	far ptr	Stdio_ArgTrampoline5
		add	sp, 0Ah

loc_9AC67:
		lea	ax, [bp+var_6C]
		push	ax

loc_9AC6B:
		push	[bp+var_1C]
		push	[bp+arg_2]
		push	si

loc_9AC72:
		call	Terrain_HeightmapAllocate
		add	sp, 8
		mov	eax, [bp+var_1A]
		mov	[si+8Ah], eax
		movsx	eax, word ptr [si+7]
		mov	edx, [si+8Ah]
		imul	edx, eax

loc_9AC91:
		mov	[si+82h], edx

loc_9AC96:
		mov	eax, [si+82h]
		sar	eax, 1

loc_9AC9E:
		mov	[si+86h], eax

loc_9ACA3:
		mov	eax, [bp+var_16]

loc_9ACA7:
		mov	[si+8Eh], eax
		mov	eax, [bp+var_12]

loc_9ACB0:
		mov	[si+92h], eax
		cmp	dword_6EB2A, 0
		jnz	short loc_9AD06
		push	1
		push	0
		push	2

loc_9ACC3:
		mov	ax, [si+7]
		shl	ax, 2
		imul	word ptr [si+7]
		movzx	eax, ax

loc_9ACD0:
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr dword_6EB2A+2,	dx

loc_9ACE1:
		mov	word ptr dword_6EB2A, ax
		xor	cx, cx
		jmp	short loc_9ACFC
; ���������������������������������������������������������������������������

loc_9ACE8:				; CODE XREF: Terrain_LoadHeightmapFromIFFC_9AC10+F4j
		mov	ax, cx
		shl	ax, 2
		les	bx, dword_6EB2A
		add	bx, ax
		mov	dword ptr es:[bx], 0
		inc	cx

loc_9ACFC:				; CODE XREF: Terrain_LoadHeightmapFromIFFC_9AC10+D6j
		mov	ax, [si+7]
		imul	word ptr [si+7]
		cmp	ax, cx
		jg	short loc_9ACE8

loc_9AD06:				; CODE XREF: Terrain_LoadHeightmapFromIFFC_9AC10:loc_9AC26j
					; Terrain_LoadHeightmapFromIFFC_9AC10+2Ej ...
		pop	di
		pop	si
		leave
		retf
Terrain_LoadHeightmapFromIFFC_9AC10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (35 lignes).
; ==============================================================================================
Terrain_Helper5_9AD0A	proc far		; CODE XREF: VROOMM_StubThunk_6BEA5J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_9AD29
; ���������������������������������������������������������������������������

loc_9AD15:				; CODE XREF: Terrain_Helper5_9AD0A+27j
		mov	ax, cx
		shl	ax, 2
		les	bx, dword_6EB2A

loc_9AD1E:
		add	bx, ax

loc_9AD20:
		mov	dword ptr es:[bx], 0

loc_9AD28:
		inc	cx

loc_9AD29:				; CODE XREF: Terrain_Helper5_9AD0A+9j
		mov	ax, [si+7]
		imul	word ptr [si+7]
		cmp	ax, cx
		jg	short loc_9AD15
		pop	si
		pop	bp
		retf
Terrain_Helper5_9AD0A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFree_5C7B6 et TerrainTile_DescriptorDestruct.
; ==============================================================================================
Terrain_ReleaseTileDescriptorC_9AD36	proc far		; CODE XREF: VROOMM_StubThunk_6BEAAJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si

loc_9AD43:
		jz	short loc_9AD78

loc_9AD45:
		push	0

loc_9AD47:
		push	2
		push	1A7Ah

loc_9AD4C:
		push	5C44h

loc_9AD4F:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword_6EB2A, 0
		push	0

loc_9AD62:
		push	si

loc_9AD63:
		call	TerrainTile_DescriptorDestruct
		add	sp, 4

loc_9AD6B:
		test	di, 1

loc_9AD6F:
		jz	short loc_9AD78
		push	si

loc_9AD72:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_9AD78:				; CODE XREF: Terrain_ReleaseTileDescriptorC_9AD36:loc_9AD43j
					; Terrain_ReleaseTileDescriptorC_9AD36:loc_9AD6Fj
		pop	di
		pop	si
		pop	bp
		retf
Terrain_ReleaseTileDescriptorC_9AD36	endp

ovr297		ends
