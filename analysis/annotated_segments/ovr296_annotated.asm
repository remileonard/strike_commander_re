ovr296		segment	para public 'OVERLAY' use16
		assume cs:ovr296
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (CRT_Malloc16_Retry, 38 lignes).
; ==============================================================================================
TerrainTile_Allocate_9A8F0	proc far		; CODE XREF: VROOMM_StubThunk_6BE70J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9A909
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9A920

loc_9A909:				; CODE XREF: TerrainTile_Allocate_9A8F0+9j
		mov	word ptr [si], 1966h
		mov	word ptr [si], 1A7Eh

loc_9A911:
		mov	word ptr [si+6], 0

loc_9A916:
		mov	word ptr [si+0Ah], 0

loc_9A91B:
		mov	word ptr [si+4], 0

loc_9A920:				; CODE XREF: TerrainTile_Allocate_9A8F0+17j
		mov	ax, si
		pop	si

loc_9A923:
		pop	bp
		retf
TerrainTile_Allocate_9A8F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle TerrainTile_DestructSimple.
; ==============================================================================================
TerrainTile_ReleaseSimple_9A925	proc far		; CODE XREF: VROOMM_StubThunk_6BE7AJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_9A926:
		mov	bp, sp
		push	si
		push	di

loc_9A92A:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9A956
		mov	word ptr [si], 1A7Eh
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		push	0
		push	si
		call	TerrainTile_DestructSimple
		add	sp, 4
		test	di, 1
		jz	short loc_9A956
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_9A956:				; CODE XREF: TerrainTile_ReleaseSimple_9A925+Dj
					; TerrainTile_ReleaseSimple_9A925+28j
		pop	di
		pop	si
		pop	bp
		retf
TerrainTile_ReleaseSimple_9A925	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 413 lignes, NON DÉTAILLÉE — combine IndexedRecordReader_AdvanceIndex_65E2C (seg196),
; CRT_Msg_Sprintf1, allocation et copie de chaîne.
; ==============================================================================================
TerrainSector_LoadIndexedRecord_9A95A	proc far		; CODE XREF: VROOMM_StubThunk_6BE75J

var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_66		= word ptr -66h
var_59		= word ptr -59h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [si+6], 0
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+4], 0
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1

loc_9A983:
		mov	byte_6E33B, cl
		mov	ax, [bp+arg_6]
		mov	[si+2],	ax
		mov	ax, [bp+arg_4]
		mov	[si+8],	ax

loc_9A993:
		push	ax

loc_9A994:
		push	di

loc_9A995:
		call	IndexedRecordReader_AdvanceIndex_65E2C

loc_9A99A:
		add	sp, 4

loc_9A99D:
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_9A9AE
		mov	eax, [di+61h]
		jmp	short loc_9A9B2
; ���������������������������������������������������������������������������

loc_9A9AE:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A+4Cj
		mov	eax, [di+71h]

loc_9A9B2:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A+52j
		cmp	eax, 0
		jg	short loc_9A9BB

loc_9A9B8:
		jmp	loc_9AC01
; ���������������������������������������������������������������������������

loc_9A9BB:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A+5Cj
		push	[bp+arg_4]
		push	1A8Eh

loc_9A9C1:
		lea	ax, [bp+var_A]
		push	ax

loc_9A9C5:
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	0Fh

loc_9A9CF:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_C], ax
		or	ax, ax

loc_9A9DA:
		jz	short loc_9AA0D
		push	ax
		call	String_ConstructEmpty
		pop	cx

loc_9A9E3:
		push	8
		lea	ax, [bp+var_A]
		push	ax
		push	[bp+var_C]
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+var_C]
		mov	byte ptr [bx+8], 0
		mov	word ptr [bx+9], 0
		xor	ax, ax
		mov	[bx+0Dh], ax
		mov	[bx+0Bh], ax
		mov	ax, [bp+var_C]
		jmp	short loc_9AA10
; ���������������������������������������������������������������������������

loc_9AA0D:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A:loc_9A9DAj
		mov	ax, [bp+var_C]

loc_9AA10:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A+B1j
		mov	[si+6],	ax
		push	di
		call	StreamReader_GetPosition_64075
		push	dx
		push	ax
		pop	eax
		pop	cx

loc_9AA1E:
		mov	[bp+var_12], eax

loc_9AA22:
		push	large dword ptr	[di+65h]
		push	di

loc_9AA27:
		call	StreamReader_SeekVariant_63DF6
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2
		push	ds
		mov	ax, si
		add	ax, 4
		push	ax
		push	di

loc_9AA3D:
		call	StreamReader_ReadTyped_63FA1

loc_9AA42:
		add	sp, 0Eh

loc_9AA45:
		mov	ax, [si+4]

loc_9AA48:
		shl	ax, 1
		push	ax

loc_9AA4B:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+0Ah], ax

loc_9AA54:
		mov	ax, [bp+arg_4]
		shl	ax, 2
		les	bx, dword_6EB2A
		add	bx, ax

loc_9AA60:
		mov	eax, es:[bx]

loc_9AA64:
		mov	[bp+var_16], eax
		mov	[bp+var_1A], 1
		mov	ax, [si+0Ah]
		mov	[bp+var_1C], ax
		mov	[bp+var_1E], 0
		jmp	loc_9ABD9
; ���������������������������������������������������������������������������

loc_9AA7E:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A+287j
		push	large 0FFFFFFFFh

loc_9AA81:
		push	large 46h ; 'F'
		push	ss
		lea	ax, [bp+var_66]

loc_9AA88:
		push	ax
		push	di

loc_9AA8A:
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh

loc_9AA92:
		mov	eax, [bp+var_1A]
		test	[bp+var_16], eax

loc_9AA9A:
		jz	short loc_9AAB5

loc_9AA9C:
		push	1
		push	1
		push	ss
		lea	ax, [bp+var_59]
		push	ax
		push	571Ch
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah

loc_9AAB0:
		mov	[bp+var_E], ax
		jmp	short loc_9AACC
; ���������������������������������������������������������������������������

loc_9AAB5:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A:loc_9AA9Aj
		push	1

loc_9AAB7:
		push	1
		push	ss
		lea	ax, [bp+var_66]
		push	ax
		push	571Ch
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	[bp+var_E], ax

loc_9AACC:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A+159j
		cmp	[bp+var_E], 0
		jnz	short loc_9AAD5

loc_9AAD2:
		jmp	loc_9ABBF
; ���������������������������������������������������������������������������

loc_9AAD5:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A+176j
		sub	sp, 4

loc_9AAD8:
		mov	eax, [bp+var_48]

loc_9AADC:
		mov	[bp+var_6E], eax

loc_9AAE0:
		sub	sp, 4

loc_9AAE3:
		mov	eax, [bp+var_4C]

loc_9AAE7:
		mov	[bp+var_72], eax
		sub	sp, 4
		mov	eax, [bp+var_50]
		mov	[bp+var_76], eax
		mov	ax, [bp+var_E]
		add	ax, 12h
		push	ax
		call	Utility_Helper_55E65
		add	sp, 0Eh
		sub	sp, 4
		mov	eax, [bp+var_3C]
		mov	[bp+var_6E], eax
		sub	sp, 4

loc_9AB13:
		mov	eax, [bp+var_40]
		mov	[bp+var_72], eax
		sub	sp, 4
		mov	eax, [bp+var_44]

loc_9AB22:
		mov	[bp+var_76], eax

loc_9AB26:
		push	[bp+var_E]

loc_9AB29:
		mov	bx, [bp+var_E]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx

loc_9AB32:
		push	ax

loc_9AB33:
		call	Utility_Helper_55E65
		add	sp, 0Eh
		sub	sp, 4

loc_9AB3E:
		mov	eax, [bp+var_30]
		mov	[bp+var_6E], eax
		sub	sp, 4
		mov	eax, [bp+var_34]
		mov	[bp+var_72], eax
		sub	sp, 4
		mov	eax, [bp+var_38]
		mov	[bp+var_76], eax
		push	[bp+var_E]
		mov	bx, [bp+var_E]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax

loc_9AB6C:
		call	Utility_Helper_55E65

loc_9AB71:
		add	sp, 0Eh
		sub	sp, 4

loc_9AB77:
		mov	eax, [bp+var_24]
		mov	[bp+var_6E], eax
		sub	sp, 4
		mov	eax, [bp+var_28]
		mov	[bp+var_72], eax
		sub	sp, 4
		mov	eax, [bp+var_2C]

loc_9AB91:
		mov	[bp+var_76], eax
		push	[bp+var_E]

loc_9AB98:
		mov	bx, [bp+var_E]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx

loc_9ABA1:
		add	ax, 18h
		push	ax

loc_9ABA5:
		call	Utility_Helper_55E65
		add	sp, 0Eh
		mov	ax, [bp+var_E]

loc_9ABB0:
		mov	[bp+var_20], ax
		push	ax
		push	word ptr [si+6]
		call	Container_KeyCompare
		add	sp, 4

loc_9ABBF:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A:loc_9AAD2j
		mov	bx, [bp+var_1C]
		mov	ax, [bp+var_E]
		mov	[bx], ax
		mov	eax, [bp+var_1A]
		shl	eax, 1

loc_9ABCE:
		mov	[bp+var_1A], eax
		inc	[bp+var_1E]

loc_9ABD5:
		add	[bp+var_1C], 2

loc_9ABD9:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A+121j
		mov	ax, [si+4]
		cmp	ax, [bp+var_1E]
		jle	short loc_9ABE4
		jmp	loc_9AA7E
; ���������������������������������������������������������������������������

loc_9ABE4:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A+285j
		push	large [bp+var_12]
		push	di
		call	StreamReader_SeekVariant_63DF6
		add	sp, 6
		push	word ptr [si+6]
		push	59C3h
		call	Container_Append
		add	sp, 4
		jmp	short loc_9AC0B
; ���������������������������������������������������������������������������

loc_9AC01:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A:loc_9A9B8j
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0

loc_9AC0B:				; CODE XREF: TerrainSector_LoadIndexedRecord_9A95A+2A5j
		pop	di
		pop	si
		leave
		retf
TerrainSector_LoadIndexedRecord_9A95A	endp

ovr296		ends
