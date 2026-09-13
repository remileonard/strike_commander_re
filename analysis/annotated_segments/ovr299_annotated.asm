ovr299		segment	para public 'OVERLAY' use16
		assume cs:ovr299
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle 3 thunks VROOMM voisins (63 lignes).
; ==============================================================================================
Terrain_ProcessTileThunks_9ADF0	proc far		; CODE XREF: VROOMM_StubThunk_6BF14J Terrain_AllocateAndFormatMultiple_9B2F4+14Ap

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	[si+2],	di
		mov	bx, [si+2]
		mov	ax, [bx+0BDh]
		mov	[si+8],	ax
		mov	ax, [bx+0BFh]
		mov	[si+71h], ax

loc_9AE19:
		push	word ptr [si+71h]

loc_9AE1C:
		push	bx
		mov	ax, si
		add	ax, 0Ah

loc_9AE22:
		push	ax

loc_9AE23:
		call	VROOMM_StubThunk_6BDD9
		add	sp, 6
		xor	ax, ax
		mov	[si+119h], ax

loc_9AE31:
		mov	[si+125h], ax
		mov	ax, 5
		mov	[si+127h], ax
		mov	[si+11Bh], ax
		mov	ax, di
		add	ax, 0C1h ; '�'
		push	ax
		mov	ax, si
		add	ax, 73h	; 's'
		push	ax
		call	VROOMM_StubThunk_6BD90
		add	sp, 4
		mov	ax, di
		add	ax, 171h
		push	ax
		mov	ax, si
		add	ax, 0F0h ; '�'
		push	ax
		call	VROOMM_StubThunk_6BED0
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
Terrain_ProcessTileThunks_9ADF0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle 3 thunks VROOMM voisins et CRT_FreeNear_Wrap.
; ==============================================================================================
Terrain_ProcessTileThunksB_9AE6C	proc far		; CODE XREF: VROOMM_StubThunk_6BF19J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_9AE71:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9AECA
		mov	word ptr [si], 1ACCh
		cmp	word ptr [si+4], 0
		jz	short loc_9AE8D
		mov	bx, [si+4]
		mov	word ptr [bx+5Eh], 0

loc_9AE8D:				; CODE XREF: Terrain_ProcessTileThunksB_9AE6C+17j
		push	2

loc_9AE8F:
		mov	ax, si

loc_9AE91:
		add	ax, 0F0h ; '�'
		push	ax

loc_9AE95:
		call	VROOMM_StubThunk_6BED5
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 73h	; 's'

loc_9AEA4:
		push	ax
		call	VROOMM_StubThunk_6BD95
		add	sp, 4
		push	0
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	VROOMM_StubThunk_6BE29
		add	sp, 4
		test	di, 1
		jz	short loc_9AECA
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_9AECA:				; CODE XREF: Terrain_ProcessTileThunksB_9AE6C+Dj
					; Terrain_ProcessTileThunksB_9AE6C+55j
		pop	di
		pop	si
		pop	bp
		retf
Terrain_ProcessTileThunksB_9AE6C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 365 lignes, NON DÉTAILLÉE — combine copie de chaîne, Path_BuildComposite,
; IndexedRecordReader_AdvanceIndex_65E2C, StreamReader_ConstructAndBind_63B23 (seg190/196) —
; construction du chemin et chargement d'une tuile de terrain.
; ==============================================================================================
Terrain_BuildAndLoadTilePath_9AECE	proc far		; CODE XREF: VROOMM_StubThunk_6BF1EJ

var_5C		= word ptr -5Ch
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_9AED1:
		sub	sp, 5Ch

loc_9AED4:
		push	si
		push	di

loc_9AED6:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_9AEDC:
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	byte ptr [si+0Ah], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si+0B3h], 0
		mov	[bp+var_2], di
		push	8
		push	[bp+var_2]
		mov	ax, si
		add	ax, 27Fh
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6

loc_9AF10:
		mov	byte ptr [si+287h], 0
		push	ds
		push	offset a_pak_6	; ".PAK"
		push	ds
		push	di
		push	ds

loc_9AF1C:
		push	offset unk_6EB48

loc_9AF1F:
		lea	ax, [bp+var_5C]
		push	ax

loc_9AF23:
		call	Path_BuildComposite

loc_9AF28:
		add	sp, 0Eh
		push	1

loc_9AF2D:
		lea	ax, [bp+var_5C]
		push	ax
		mov	ax, si
		add	ax, 208h
		push	ax
		mov	bx, [si+208h]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 208h
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	ax, si

loc_9AF53:
		add	ax, 208h
		push	ax
		call	StreamReader_GetPosition_64075
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_6], eax
		mov	ax, [si+275h]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_9AF78
		mov	eax, [si+269h]
		jmp	short loc_9AF7D
; ���������������������������������������������������������������������������

loc_9AF78:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+A1j
		mov	eax, [si+279h]

loc_9AF7D:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+A8j
		mov	edx, [bp+var_6]
		add	edx, eax
		mov	[bp+var_A], edx

loc_9AF88:
		push	0
		push	edx

loc_9AF8C:
		push	large [bp+var_6]
		mov	ax, si

loc_9AF92:
		add	ax, 208h
		push	ax
		mov	ax, si

loc_9AF98:
		add	ax, 0Bh
		push	ax

loc_9AF9C:
		call	StreamReader_ConstructAndBind_63B23
		add	sp, 0Eh

loc_9AFA4:
		push	0
		push	large 41524554h
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_9AFC1
		jmp	loc_9B15D
; ���������������������������������������������������������������������������

loc_9AFC1:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+EEj
		mov	byte ptr [si+0Ah], 1
		mov	word ptr [si+8], ds
		mov	word ptr [si+6], 1AA0h
		push	0
		push	large 53524556h
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9AFF5
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		jmp	short loc_9AFFE
; ���������������������������������������������������������������������������

loc_9AFF5:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+117j
		push	0E00Ch
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_9AFFE:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+125j
		push	0
		push	large 4F464E49h
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9B039
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54

loc_9B023:
		pop	cx
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E

loc_9B02F:
		push	dx
		push	ax
		pop	eax

loc_9B033:
		pop	cx

loc_9B034:
		mov	[si+28Ch], eax

loc_9B039:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+148j
		push	0
		push	large 584F4C42h
		mov	ax, si

loc_9B043:
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_9B056
		jmp	loc_9B138
; ���������������������������������������������������������������������������

loc_9B056:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+183j
		push	0
		push	large 56454C45h
		mov	ax, si

loc_9B060:
		add	ax, 0Bh

loc_9B063:
		push	ax

loc_9B064:
		call	ResourceRecord_SeekAndRead_64743

loc_9B069:
		add	sp, 8
		or	ax, ax

loc_9B06E:
		jnz	short loc_9B073
		jmp	loc_9B102
; ���������������������������������������������������������������������������

loc_9B073:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE:loc_9B06Ej
		mov	eax, [si+7Dh]
		mov	ebx, 2Eh ; '.'
		cdq
		idiv	ebx

loc_9B082:
		mov	[si+0BDh], ax
		push	seg stub299
		push	offset VROOMM_StubThunk_6BF0F

loc_9B08C:
		push	11h

loc_9B08E:
		push	word ptr [si+0BDh]

loc_9B092:
		push	large 9A0000h

loc_9B098:
		call	CRT_Doprnt_Dispatch

loc_9B09D:
		add	sp, 0Ch
		mov	[si+0BFh], ax
		mov	di, [si+0BFh]
		mov	[bp+var_C], 0
		jmp	short loc_9B0C6
; ���������������������������������������������������������������������������

loc_9B0AF:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+1FFj
		mov	ax, si

loc_9B0B1:
		add	ax, 0Bh
		push	ax
		push	si

loc_9B0B6:
		push	di
		call	VROOMM_StubThunk_6BDCA
		add	sp, 6
		inc	[bp+var_C]
		add	di, 9Ah	; '�'

loc_9B0C6:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+1DFj
		mov	ax, [si+0BDh]
		cmp	ax, [bp+var_C]
		jg	short loc_9B0AF
		mov	di, [si+0BFh]
		mov	word ptr [si+290h], 0
		mov	[bp+var_C], 0
		jmp	short loc_9B0F9
; ���������������������������������������������������������������������������

loc_9B0E0:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+232j
		mov	ax, [si+290h]
		cmp	ax, [di+8Eh]
		jge	short loc_9B0F2
		mov	ax, [di+8Eh]
		mov	[si+290h], ax

loc_9B0F2:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+21Aj
		inc	[bp+var_C]
		add	di, 9Ah	; '�'

loc_9B0F9:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+210j
		mov	ax, [si+0BDh]
		cmp	ax, [bp+var_C]
		jg	short loc_9B0E0

loc_9B102:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+1A2j
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	si
		mov	ax, si
		add	ax, 0C1h ; '�'
		push	ax
		call	VROOMM_StubThunk_6BD65
		add	sp, 6
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	si
		mov	ax, si
		add	ax, 171h
		push	ax
		call	VROOMM_StubThunk_6BEA0

loc_9B129:
		add	sp, 6

loc_9B12C:
		mov	ax, si
		add	ax, 0Bh
		push	ax

loc_9B132:
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_9B138:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+185j
		cmp	byte_6E339, 0
		jz	short loc_9B15D
		mov	ax, si
		add	ax, 0Bh

loc_9B144:
		push	ax
		push	ds
		push	offset word_727BA
		call	VROOMM_StubThunk_6BE1A
		add	sp, 6
		push	ds
		push	offset word_7254A
		call	VROOMM_StubThunk_6BCD0
		add	sp, 4

loc_9B15D:				; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+F0j
					; Terrain_BuildAndLoadTilePath_9AECE+26Fj
		pop	di
		pop	si
		leave
		retf
Terrain_BuildAndLoadTilePath_9AECE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine TerrainTile_ListClear, Memory_TypedFree_5C7B6, thunks voisins.
; ==============================================================================================
Terrain_ClearTileList_9B161	proc far		; CODE XREF: VROOMM_StubThunk_6BF28J Terrain_FormatAndReleaseReader_9B1FC+18p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h ; '�'
		mov	[bp+var_2], 0
		jmp	short loc_9B193
; ���������������������������������������������������������������������������

loc_9B179:				; CODE XREF: Terrain_ClearTileList_9B161+39j
		cmp	word ptr [di], 0
		jz	short loc_9B18D
		push	3
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_9B18D:				; CODE XREF: Terrain_ClearTileList_9B161+1Bj
		inc	[bp+var_2]
		add	di, 2

loc_9B193:				; CODE XREF: Terrain_ClearTileList_9B161+16j
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_2]
		jg	short loc_9B179
		mov	word ptr [si+0B3h], 0
		push	5510h
		call	TerrainTile_ListClear
		pop	cx
		mov	ax, si
		add	ax, 171h
		push	ax
		call	VROOMM_StubThunk_6BEA5
		pop	cx
		cmp	byte_725A7, 0
		jz	short loc_9B1DC

loc_9B1BE:
		cmp	dword_725A2, 0
		jz	short loc_9B1DC
		push	0

loc_9B1C8:
		mov	al, byte_725A6
		push	ax
		push	54F2h

loc_9B1CF:
		push	5C44h

loc_9B1D2:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_9B1DC:				; CODE XREF: Terrain_ClearTileList_9B161+5Bj
					; Terrain_ClearTileList_9B161+63j
		mov	dword_725A2, 0
		mov	byte_725A7, 0
		mov	dword_725A8, 0
		call	VROOMM_StubThunk_6BD60
		pop	di
		pop	si
		leave
		retf
Terrain_ClearTileList_9B161	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 142 lignes, NON DÉTAILLÉE — combine CRT_Doprnt_Core, Memory_TypedFree_5C7B6,
; IndexedRecordReader_Destruct_659D0 (seg196).
; ==============================================================================================
Terrain_FormatAndReleaseReader_9B1FC	proc far		; CODE XREF: VROOMM_StubThunk_6BF2DJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_9B20E
		jmp	loc_9B2F0
; ���������������������������������������������������������������������������

loc_9B20E:				; CODE XREF: Terrain_FormatAndReleaseReader_9B1FC+Dj
		mov	word ptr [si], 1AA8h
		push	si

loc_9B213:
		push	cs
		call	near ptr Terrain_ClearTileList_9B161

loc_9B217:
		pop	cx

loc_9B218:
		push	seg stub294
		push	offset VROOMM_StubThunk_6BDCF

loc_9B21E:
		push	large 190000h

loc_9B224:
		push	9Ah ; '�'
		push	word ptr [si+0BFh]

loc_9B22B:
		call	CRT_Doprnt_Core

loc_9B230:
		add	sp, 0Ch
		push	ds

loc_9B234:
		push	offset word_727BA
		call	VROOMM_StubThunk_6CD71
		add	sp, 4
		cmp	byte_727C7, 0
		jz	short loc_9B264
		cmp	dword_727C2, 0
		jz	short loc_9B264
		push	0
		mov	al, byte_727C6
		push	ax
		push	5712h
		push	5C44h
		call	Memory_TypedFree_5C7B6

loc_9B25F:
		add	sp, 8
		jmp	short $+2

loc_9B264:				; CODE XREF: Terrain_FormatAndReleaseReader_9B1FC+48j
					; Terrain_FormatAndReleaseReader_9B1FC+50j
		mov	dword_727C2, 0
		mov	byte_727C7, 0

loc_9B272:
		mov	dword_727C8, 0
		push	ds
		push	offset word_7254A
		call	VROOMM_StubThunk_6CD71
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 208h
		push	ax

loc_9B28F:
		call	IndexedRecordReader_Destruct_659D0

loc_9B294:
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 171h
		push	ax
		call	VROOMM_StubThunk_6BEAA
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 0C1h ; '�'
		push	ax
		call	VROOMM_StubThunk_6BD6A
		add	sp, 4

loc_9B2B7:
		mov	word ptr [si+0Bh], 2E0h

loc_9B2BC:
		mov	ax, si
		add	ax, 0Bh
		push	ax

loc_9B2C2:
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		push	0
		push	si

loc_9B2DB:
		call	Handle_Destructor
		add	sp, 4

loc_9B2E3:
		test	di, 1

loc_9B2E7:
		jz	short loc_9B2F0
		push	si

loc_9B2EA:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_9B2F0:				; CODE XREF: Terrain_FormatAndReleaseReader_9B1FC+Fj
					; Terrain_FormatAndReleaseReader_9B1FC:loc_9B2E7j
		pop	di
		pop	si

loc_9B2F2:
		pop	bp
		retf
Terrain_FormatAndReleaseReader_9B1FC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 213 lignes, NON DÉTAILLÉE — alloue plusieurs blocs (CRT_Malloc16/32_Retry ×4) et
; formate (CRT_Doprnt_Dispatch).
; ==============================================================================================
Terrain_AllocateAndFormatMultiple_9B2F4	proc far		; CODE XREF: VROOMM_StubThunk_6BF23J

var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_9B2F7:
		sub	sp, 0Eh
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		cmp	byte ptr [si+0Ah], 0
		jnz	short loc_9B309
		jmp	loc_9B44C
; ���������������������������������������������������������������������������

loc_9B309:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+10j
		mov	[bp+var_2], si
		push	12Ah

loc_9B30F:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_9B31E
		jmp	loc_9B448
; ���������������������������������������������������������������������������

loc_9B31E:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+25j
		mov	word ptr [si], 1ACCh
		mov	dword ptr [si+23h], 0
		mov	byte ptr [si+27h], 2

loc_9B32E:
		mov	byte ptr [si+28h], 0

loc_9B332:
		mov	dword ptr [si+29h], 0
		add	ax, 2Fh	; '/'
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_9B34F
		mov	dx, word ptr [bp+var_6+2]
		jmp	short loc_9B360
; ���������������������������������������������������������������������������

loc_9B34F:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+54j
		push	large 2
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax

loc_9B360:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+59j
		or	ax, dx
		jz	short loc_9B366

loc_9B364:
		jmp	short $+2

loc_9B366:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+6Ej
		mov	ax, si

loc_9B368:
		add	ax, 33h	; '3'
		mov	word ptr [bp+var_A+2], ds

loc_9B36E:
		mov	word ptr [bp+var_A], ax

loc_9B371:
		cmp	[bp+var_A], 0
		jz	short loc_9B37D
		mov	dx, word ptr [bp+var_A+2]
		jmp	short loc_9B38E
; ���������������������������������������������������������������������������

loc_9B37D:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+82j
		push	large 2

loc_9B380:
		call	CRT_Malloc32_Retry

loc_9B385:
		add	sp, 4

loc_9B388:
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax

loc_9B38E:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+87j
		or	ax, dx

loc_9B390:
		jz	short loc_9B394

loc_9B392:
		jmp	short $+2

loc_9B394:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4:loc_9B390j
		mov	ax, si

loc_9B396:
		add	ax, 39h	; '9'
		mov	word ptr [bp+var_E+2], ds
		mov	word ptr [bp+var_E], ax

loc_9B39F:
		cmp	[bp+var_E], 0
		jz	short loc_9B3AB

loc_9B3A6:
		mov	dx, word ptr [bp+var_E+2]
		jmp	short loc_9B3BC
; ���������������������������������������������������������������������������

loc_9B3AB:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+B0j
		push	large 2

loc_9B3AE:
		call	CRT_Malloc32_Retry

loc_9B3B3:
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax

loc_9B3BC:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+B5j
		or	ax, dx
		jz	short loc_9B3C2

loc_9B3C0:
		jmp	short $+2

loc_9B3C2:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+CAj
		mov	dword ptr [si+3Bh], 0
		mov	byte ptr [si+3Fh], 2
		mov	byte ptr [si+40h], 0

loc_9B3D2:
		mov	dword ptr [si+41h], 0

loc_9B3DA:
		mov	byte ptr [si+0Ah], 0
		xor	ax, ax

loc_9B3E0:
		mov	[si+37h], ax
		mov	[si+2Dh], ax

loc_9B3E6:
		mov	[si+1Bh], ax
		xor	ax, ax
		mov	[si+47h], ax

loc_9B3EE:
		mov	[si+45h], ax
		mov	word ptr [si+55h], 0
		mov	word ptr [si+57h], 0
		mov	word ptr [si+59h], 0
		mov	word ptr [si+5Bh], 0
		mov	word ptr [si+5Dh], 0
		mov	word ptr [si+5Fh], 0

loc_9B40F:
		mov	word ptr [si+4Fh], 0
		push	seg stub299
		push	offset VROOMM_StubThunk_6BF0A
		push	large 10004h
		push	10h

loc_9B422:
		mov	ax, si

loc_9B424:
		add	ax, 0B0h ; '�'
		push	ax

loc_9B428:
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch

loc_9B430:
		mov	byte ptr [si+73h], 0
		mov	byte ptr [si+0F0h], 0
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr Terrain_ProcessTileThunks_9ADF0
		add	sp, 4
		mov	ax, si
		jmp	short loc_9B44A
; ���������������������������������������������������������������������������

loc_9B448:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+27j
		mov	ax, si

loc_9B44A:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+152j
		mov	dx, ax

loc_9B44C:				; CODE XREF: Terrain_AllocateAndFormatMultiple_9B2F4+12j
		mov	ax, dx
		pop	si
		leave
		retf
Terrain_AllocateAndFormatMultiple_9B2F4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue et construit un descripteur de tuile (TerrainTile_DescriptorConstruct).
; ==============================================================================================
TerrainTile_ConstructDescriptor_9B451	proc far		; CODE XREF: VROOMM_StubThunk_6BF0FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9B46B
		push	9Ah ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9B47B

loc_9B46B:				; CODE XREF: TerrainTile_ConstructDescriptor_9B451+9j
		push	si
		call	TerrainTile_DescriptorConstruct
		pop	cx
		mov	dword ptr [si+8Ah], 0

loc_9B47B:				; CODE XREF: TerrainTile_ConstructDescriptor_9B451+18j
		mov	ax, si
		pop	si
		pop	bp
		retf
TerrainTile_ConstructDescriptor_9B451	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (15 lignes).
; ==============================================================================================
TerrainTile_Helper_9B480	proc far		; CODE XREF: VROOMM_StubThunk_6BF0AJ

arg_0		= word ptr  6

		push	bp

loc_9B481:
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 8
		mov	ax, dx
		pop	bp
		retf
TerrainTile_Helper_9B480	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (10 lignes).
; ==============================================================================================
TerrainTile_Helper2_9B48F	proc far		; CODE XREF: VROOMM_StubThunk_6BF05J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
TerrainTile_Helper2_9B48F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (14 lignes).
; ==============================================================================================
TerrainTile_Helper3_9B497	proc far		; CODE XREF: VROOMM_StubThunk_6BF00J

arg_0		= word ptr  6

		push	bp

loc_9B498:
		mov	bp, sp

loc_9B49A:
		mov	ax, [bp+arg_0]
		pop	bp
		retf
TerrainTile_Helper3_9B497	endp

ovr299		ends
