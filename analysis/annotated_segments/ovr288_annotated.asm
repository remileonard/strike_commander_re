ovr288		segment	para public 'OVERLAY' use16
		assume cs:ovr288
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (CRT_Malloc16_Retry, 52 lignes).
; ==============================================================================================
TextureLoader_Allocate_97F40	proc far		; CODE XREF: VROOMM_StubThunk_6BC65J TextureLoader_FormatAndLoad_985F6+60p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_97F5D
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_97F9D

loc_97F5D:				; CODE XREF: TextureLoader_Allocate_97F40+Dj
		mov	ax, [di]
		mov	[si+6],	ax
		mov	ax, [di+2]
		mov	[si+0Bh], ax
		mov	ax, [di+4]
		mov	[si+0Dh], ax
		mov	al, [di+6]
		mov	[si+8],	al
		mov	al, [di+7]
		mov	[si+9],	al
		mov	al, [di+8]
		mov	[si+0Ah], al
		mov	al, [di+9]
		mov	[si+2],	al
		mov	al, [di+0Ah]
		mov	[si+3],	al
		mov	al, [di+0Bh]
		mov	[si+4],	al
		mov	al, [di+0Ch]
		mov	[si+5],	al
		mov	ax, [bp+arg_4]
		mov	[si], ax

loc_97F9D:				; CODE XREF: TextureLoader_Allocate_97F40+1Bj
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
TextureLoader_Allocate_97F40	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (CRT_Malloc16_Retry, 58 lignes).
; ==============================================================================================
TextureLoader_AllocateB_97FA3	proc far		; CODE XREF: VROOMM_StubThunk_6BC6AJ

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= byte ptr  16h
arg_12		= byte ptr  18h
arg_14		= byte ptr  1Ah
arg_16		= byte ptr  1Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_97FBC
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_97FFD

loc_97FBC:				; CODE XREF: TextureLoader_AllocateB_97FA3+9j
		mov	ax, [bp+arg_2]
		mov	[si+6],	ax
		mov	al, [bp+arg_4]
		mov	[si+8],	al
		mov	al, [bp+arg_6]
		mov	[si+9],	al
		mov	al, [bp+arg_8]
		mov	[si+0Ah], al
		mov	ax, [bp+arg_A]
		mov	[si+0Bh], ax
		mov	ax, [bp+arg_C]
		mov	[si+0Dh], ax
		mov	ax, [bp+arg_E]
		mov	[si], ax
		mov	al, [bp+arg_10]
		mov	[si+2],	al
		mov	al, [bp+arg_12]
		mov	[si+3],	al
		mov	al, [bp+arg_14]
		mov	[si+4],	al
		mov	al, [bp+arg_16]
		mov	[si+5],	al

loc_97FFD:				; CODE XREF: TextureLoader_AllocateB_97FA3+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TextureLoader_AllocateB_97FA3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (10 lignes).
; ==============================================================================================
TextureLoader_Helper_98002	proc far		; CODE XREF: VROOMM_StubThunk_6BC97J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
TextureLoader_Helper_98002	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Path_ResolveDataFile, StreamReader, ResourceRecord_AllocateAndDecode_64C21
; (seg193).
; ==============================================================================================
TextureLoader_OpenAndDecode_9800A	proc far		; CODE XREF: VROOMM_StubThunk_6BCA1J

var_F8		= word ptr -0F8h
var_9B		= dword	ptr -9Bh
var_97		= dword	ptr -97h
var_93		= dword	ptr -93h
var_8B		= dword	ptr -8Bh
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		mov	si, [bp+arg_0]
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aPalette	; "PALETTE"
		lea	ax, [bp+var_50]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_F8], 2C8h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 2E0h
		mov	[bp+var_7C], 0
		xor	ax, ax
		mov	[bp+var_7E], ax
		movsx	eax, ax
		mov	[bp+var_93], eax
		push	1
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		mov	bx, [bp+var_F8]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_980C4
		cmp	[bp+var_8B], 544C4150h
		jnz	short loc_98094
		mov	ax, 1
		jmp	short loc_98096
; ���������������������������������������������������������������������������

loc_98094:				; CODE XREF: TextureLoader_OpenAndDecode_9800A+83j
		xor	ax, ax

loc_98096:				; CODE XREF: TextureLoader_OpenAndDecode_9800A+88j
		or	ax, ax
		jz	short loc_980BF
		lea	ax, [bp+var_F8]
		push	ax

loc_9809F:
		call	ResourceRecord_AllocateAndDecode_64C21
		pop	cx

loc_980A5:
		lea	ax, [bp+var_F8]

loc_980A9:
		push	ax
		push	si
		nop
		push	cs

loc_980AD:
		call	near ptr TextureLoader_SelectMipLevel_980F0
		add	sp, 4

loc_980B3:
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReleaseAndClear_64D25
		jmp	short loc_980CC
; ���������������������������������������������������������������������������

loc_980BF:				; CODE XREF: TextureLoader_OpenAndDecode_9800A+8Ej
		push	9003h
		jmp	short loc_980C7
; ���������������������������������������������������������������������������

loc_980C4:				; CODE XREF: TextureLoader_OpenAndDecode_9800A+78j
		push	9004h

loc_980C7:				; CODE XREF: TextureLoader_OpenAndDecode_9800A+B8j
		call	VROOMM_StubThunk_6B70F

loc_980CC:				; CODE XREF: TextureLoader_OpenAndDecode_9800A+B3j
		pop	cx
		mov	[bp+var_F8], 2E0h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	si
		leave
		retf
TextureLoader_OpenAndDecode_9800A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine String_ConstructEmpty/FromPtrLen, Texture_SelectMipLevel — sélection du niveau
; de mipmap d'une texture.
; ==============================================================================================
TextureLoader_SelectMipLevel_980F0	proc far		; CODE XREF: VROOMM_StubThunk_6BC9CJ
					; TextureLoader_OpenAndDecode_9800A:loc_980ADp

var_A		= word ptr -0Ah
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	di
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_LoadMixedFields_983FB
		add	sp, 4
		push	0
		push	large 4C424154h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_98141
		push	di
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_OpenAndLoadSubrecord_98670
		add	sp, 4

loc_98141:				; CODE XREF: TextureLoader_SelectMipLevel_980F0+35j
		push	large 0
		push	si
		call	Texture_SelectMipLevel
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
TextureLoader_SelectMipLevel_980F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 137 lignes, NON DÉTAILLÉE — libère 5+ blocs typés (Memory_TypedFree_5C7B6 répété).
; ==============================================================================================
TextureLoader_ReleaseMultiple_98151	proc far		; CODE XREF: VROOMM_StubThunk_6BCA6J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_98163
		jmp	loc_98299
; ���������������������������������������������������������������������������

loc_98163:				; CODE XREF: TextureLoader_ReleaseMultiple_98151+Dj
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_ReleaseMultipleB_9829D
		pop	cx
		cmp	byte ptr [si+63h], 0
		jz	short loc_98190
		cmp	dword ptr [si+5Eh], 0
		jz	short loc_98190
		push	0
		mov	al, [si+62h]
		push	ax
		mov	ax, si
		add	ax, 5Eh	; '^'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_98190:				; CODE XREF: TextureLoader_ReleaseMultiple_98151+1Dj
					; TextureLoader_ReleaseMultiple_98151+24j
		mov	dword ptr [si+5Eh], 0
		mov	byte ptr [si+63h], 0

loc_9819C:
		mov	dword ptr [si+64h], 0
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_981CA
		cmp	dword ptr [si+27h], 0
		jz	short loc_981CA
		push	0
		mov	al, [si+2Bh]
		push	ax
		mov	ax, si
		add	ax, 27h	; '''
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_981CA:				; CODE XREF: TextureLoader_ReleaseMultiple_98151+57j
					; TextureLoader_ReleaseMultiple_98151+5Ej
		mov	dword ptr [si+27h], 0
		mov	byte ptr [si+2Ch], 0
		mov	dword ptr [si+2Dh], 0
		cmp	byte ptr [si+22h], 0
		jz	short loc_98204
		cmp	dword ptr [si+1Dh], 0
		jz	short loc_98204
		push	0
		mov	al, [si+21h]
		push	ax
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_98204:				; CODE XREF: TextureLoader_ReleaseMultiple_98151+91j
					; TextureLoader_ReleaseMultiple_98151+98j
		mov	dword ptr [si+1Dh], 0
		mov	byte ptr [si+22h], 0
		mov	dword ptr [si+23h], 0
		cmp	byte ptr [si+18h], 0
		jz	short loc_9823E
		cmp	dword ptr [si+13h], 0
		jz	short loc_9823E
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_9823E:				; CODE XREF: TextureLoader_ReleaseMultiple_98151+CBj
					; TextureLoader_ReleaseMultiple_98151+D2j
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		cmp	byte ptr [si+0Eh], 0
		jz	short loc_98278
		cmp	dword ptr [si+9], 0
		jz	short loc_98278
		push	0
		mov	al, [si+0Dh]
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_98278:				; CODE XREF: TextureLoader_ReleaseMultiple_98151+105j
					; TextureLoader_ReleaseMultiple_98151+10Cj
		mov	dword ptr [si+9], 0
		mov	byte ptr [si+0Eh], 0
		mov	dword ptr [si+0Fh], 0
		test	di, 1
		jz	short loc_98299
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_98299:				; CODE XREF: TextureLoader_ReleaseMultiple_98151+Fj
					; TextureLoader_ReleaseMultiple_98151+13Fj
		pop	di
		pop	si
		pop	bp
		retf
TextureLoader_ReleaseMultiple_98151	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 140 lignes, NON DÉTAILLÉE — variante de TextureLoader_ReleaseMultiple_98151.
; ==============================================================================================
TextureLoader_ReleaseMultipleB_9829D	proc far		; CODE XREF: VROOMM_StubThunk_6BCABJ TextureLoader_ReleaseMultiple_98151+15p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_982A1:
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Eh], 0
		jz	short loc_982CA
		cmp	dword ptr [si+9], 0
		jz	short loc_982CA
		push	0

loc_982B3:
		mov	al, [si+0Dh]
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_982CA:				; CODE XREF: TextureLoader_ReleaseMultipleB_9829D+Bj
					; TextureLoader_ReleaseMultipleB_9829D+12j
		mov	dword ptr [si+9], 0
		mov	byte ptr [si+0Eh], 0
		mov	dword ptr [si+0Fh], 0
		cmp	byte ptr [si+18h], 0
		jz	short loc_98304
		cmp	dword ptr [si+13h], 0
		jz	short loc_98304
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_98304:				; CODE XREF: TextureLoader_ReleaseMultipleB_9829D+45j
					; TextureLoader_ReleaseMultipleB_9829D+4Cj
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		cmp	byte ptr [si+22h], 0
		jz	short loc_9833E
		cmp	dword ptr [si+1Dh], 0
		jz	short loc_9833E
		push	0
		mov	al, [si+21h]
		push	ax
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_9833E:				; CODE XREF: TextureLoader_ReleaseMultipleB_9829D+7Fj
					; TextureLoader_ReleaseMultipleB_9829D+86j
		mov	dword ptr [si+1Dh], 0
		mov	byte ptr [si+22h], 0
		mov	dword ptr [si+23h], 0
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_98378
		cmp	dword ptr [si+27h], 0
		jz	short loc_98378
		push	0
		mov	al, [si+2Bh]
		push	ax
		mov	ax, si
		add	ax, 27h	; '''
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_98378:				; CODE XREF: TextureLoader_ReleaseMultipleB_9829D+B9j
					; TextureLoader_ReleaseMultipleB_9829D+C0j
		mov	dword ptr [si+27h], 0
		mov	byte ptr [si+2Ch], 0
		mov	dword ptr [si+2Dh], 0
		cmp	byte ptr [si+63h], 0
		jz	short loc_983B2
		cmp	dword ptr [si+5Eh], 0
		jz	short loc_983B2
		push	0
		mov	al, [si+62h]
		push	ax
		mov	ax, si
		add	ax, 5Eh	; '^'

loc_983A4:
		push	ax

loc_983A5:
		push	5C44h

loc_983A8:
		call	Memory_TypedFree_5C7B6

loc_983AD:
		add	sp, 8
		jmp	short $+2

loc_983B2:				; CODE XREF: TextureLoader_ReleaseMultipleB_9829D+F3j
					; TextureLoader_ReleaseMultipleB_9829D+FAj
		mov	dword ptr [si+5Eh], 0
		mov	byte ptr [si+63h], 0
		mov	dword ptr [si+64h], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 42h	; 'B'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+42h], 0
		push	word ptr [si+5Ah]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+5Ah], 0
		push	si
		call	Palette_DestructResource
		pop	cx
		pop	si
		pop	bp
		retf
TextureLoader_ReleaseMultipleB_9829D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 138 lignes, NON DÉTAILLÉE — combine ReadFieldGroupC_64A7E/ReadFieldGroupB_64A54
; (répété).
; ==============================================================================================
TextureLoader_LoadMixedFields_983FB	proc far		; CODE XREF: VROOMM_StubThunk_6BC6FJ TextureLoader_SelectMipLevel_980F0+1Cp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_9841E
		jmp	loc_984A0
; ���������������������������������������������������������������������������

loc_9841E:				; CODE XREF: TextureLoader_LoadMixedFields_983FB+1Ej
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		pop	cx
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+68h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+52h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+4Eh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+46h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+7Ah], ax
		mov	cl, [si+68h]
		mov	eax, 1
		shl	eax, cl
		mov	[si+6Ah], eax
		mov	eax, [si+6Ah]
		sar	eax, 1
		mov	[si+6Eh], eax
		mov	word ptr [si+54h], 0
		mov	ax, [si+52h]
		mov	[si+56h], ax
		mov	ax, [si+56h]
		shl	ax, 8
		mov	[si+50h], ax
		mov	cl, [si+4Eh]
		mov	ax, 1
		shl	ax, cl
		mov	[si+4Ch], ax
		movsx	eax, word ptr [si+46h]
		mov	cl, [si+7Ah]
		shl	eax, cl
		mov	[si+7Ch], eax

loc_984A0:				; CODE XREF: TextureLoader_LoadMixedFields_983FB+20j
		push	0
		push	large 544C4150h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_984BF
		push	di
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_LoadWithDwordFields_98784
		add	sp, 4

loc_984BF:				; CODE XREF: TextureLoader_LoadMixedFields_983FB+B8j
		push	0
		push	large 43594B53h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_984DE
		push	di
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_LoadMixedFieldsB_98527
		add	sp, 4

loc_984DE:				; CODE XREF: TextureLoader_LoadMixedFields_983FB+D7j
		push	0
		push	large 48574C42h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_984FD
		push	di
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_LoadWithDwordFieldsB_988BD
		add	sp, 4

loc_984FD:				; CODE XREF: TextureLoader_LoadMixedFields_983FB+F6j
		push	0
		push	large 474E4152h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9851E
		push	di
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_FormatAndLoad_985F6
		add	sp, 4
		jmp	short loc_98523
; ���������������������������������������������������������������������������

loc_9851E:				; CODE XREF: TextureLoader_LoadMixedFields_983FB+115j
		mov	word ptr [si+58h], 0

loc_98523:				; CODE XREF: TextureLoader_LoadMixedFields_983FB+121j
		pop	di
		pop	si
		pop	bp
		retf
TextureLoader_LoadMixedFields_983FB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFieldGroupB_64A54 (×2), allocateur typé, ReadFieldGroupA_64A19 (85 lignes).
; ==============================================================================================
TextureLoader_LoadMixedFieldsB_98527	proc far		; CODE XREF: VROOMM_StubThunk_6BC92J TextureLoader_LoadMixedFields_983FB+DDp

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+33h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+35h], ax
		mov	ax, [si+33h]
		imul	word ptr [si+35h]
		imul	ax, 3
		movsx	eax, ax
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+27h], eax
		mov	byte ptr [si+2Bh], 2
		mov	byte ptr [si+2Ch], 1
		mov	dword ptr [si+2Dh], 0
		mov	eax, [bp+var_8]
		mov	[si+2Dh], eax
		push	0
		mov	al, [si+2Bh]
		push	ax
		push	large dword ptr	[si+27h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax

loc_985B2:
		push	large [bp+var_4]
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	word ptr [si+31h], 0
		mov	[bp+var_14], 4D6400h
		mov	ax, [si+33h]
		mov	[bp+var_16], ax
		movsx	ebx, [bp+var_16]
		mov	eax, [bp+var_14]
		cdq
		idiv	ebx
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	[si+37h], eax
		mov	byte ptr [si+3Bh], 0
		pop	di
		pop	si
		leave
		retf
TextureLoader_LoadMixedFieldsB_98527	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFieldGroupB_64A54, CRT_Doprnt_Dispatch, ReadFieldGroupA_64A19, CRT_Fmemcpy.
; ==============================================================================================
TextureLoader_FormatAndLoad_985F6	proc far		; CODE XREF: VROOMM_StubThunk_6BC7EJ TextureLoader_LoadMixedFields_983FB+11Bp

var_1E		= word ptr -1Eh
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+58h], ax
		push	seg stub288
		push	offset VROOMM_StubThunk_6BC60
		push	1
		push	word ptr [si+58h]
		push	large 0F0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+5Ah], ax
		xor	di, di
		jmp	short loc_98667
; ���������������������������������������������������������������������������

loc_9862D:				; CODE XREF: TextureLoader_FormatAndLoad_985F6+74j
		push	large 0Dh
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	ax, di
		imul	ax, 0Fh
		mov	dx, [si+5Ah]
		add	dx, ax
		push	ds
		push	dx
		push	si
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		push	cs
		call	near ptr TextureLoader_Allocate_97F40
		add	sp, 6
		push	ds
		push	ax
		mov	cx, 0Fh
		call	CRT_Fmemcpy
		inc	di

loc_98667:				; CODE XREF: TextureLoader_FormatAndLoad_985F6+35j
		cmp	[si+58h], di
		jg	short loc_9862D
		pop	di
		pop	si
		leave
		retf
TextureLoader_FormatAndLoad_985F6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Path_ResolveDataFile, StreamReader, ResourceRecord_SeekAndReadB_647B2 (123
; lignes).
; ==============================================================================================
TextureLoader_OpenAndLoadSubrecord_98670	proc far		; CODE XREF: VROOMM_StubThunk_6BC83J TextureLoader_SelectMipLevel_980F0+4Bp

var_F8		= word ptr -0F8h
var_9B		= dword	ptr -9Bh
var_97		= dword	ptr -97h
var_93		= dword	ptr -93h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		mov	si, [bp+arg_0]
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aPalette	; "PALETTE"
		lea	ax, [bp+var_50]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx

loc_986A0:
		mov	[bp+var_F8], 2C8h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 2E0h
		mov	[bp+var_7C], 0
		xor	ax, ax
		mov	[bp+var_7E], ax
		movsx	eax, ax
		mov	[bp+var_93], eax
		push	1
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		mov	bx, [bp+var_F8]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_98758
		push	0
		push	large 4C425446h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_98753
		push	0
		push	large 5A485F44h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9872A
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_LoadWithDwordFieldsC_98956
		add	sp, 4

loc_9872A:				; CODE XREF: TextureLoader_OpenAndLoadSubrecord_98670+AAj
		push	0
		push	large 45444146h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_98761
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_LoadWithDwordFieldsD_989B8
		add	sp, 4
		jmp	short loc_98761
; ���������������������������������������������������������������������������

loc_98753:				; CODE XREF: TextureLoader_OpenAndLoadSubrecord_98670+91j
		push	9005h
		jmp	short loc_9875B
; ���������������������������������������������������������������������������

loc_98758:				; CODE XREF: TextureLoader_OpenAndLoadSubrecord_98670+78j
		push	9006h

loc_9875B:				; CODE XREF: TextureLoader_OpenAndLoadSubrecord_98670+E6j
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_98761:				; CODE XREF: TextureLoader_OpenAndLoadSubrecord_98670+D1j
					; TextureLoader_OpenAndLoadSubrecord_98670+E1j
		mov	[bp+var_F8], 2E0h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	si
		leave
		retf
TextureLoader_OpenAndLoadSubrecord_98670	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 136 lignes, NON DÉTAILLÉE — même motif que
; AircraftComponent_LoadWithDwordFields_94D40 (seg272).
; ==============================================================================================
TextureLoader_LoadWithDwordFields_98784	proc far		; CODE XREF: VROOMM_StubThunk_6BC74J TextureLoader_LoadMixedFields_983FB+BEp

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2

loc_987A4:
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+9],	eax
		mov	byte ptr [si+0Dh], 2
		mov	byte ptr [si+0Eh], 1
		mov	dword ptr [si+0Fh], 0
		mov	eax, [bp+var_8]
		mov	[si+0Fh], eax
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large dword ptr	[si+9]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_987F9
		push	9007h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_987F9:				; CODE XREF: TextureLoader_LoadWithDwordFields_98784+6Aj
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large dword ptr	[si+9]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large dword ptr	[si+9]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	Palette_ParseBlock
		add	sp, 6
		mov	byte ptr [si+3Dh], 0
		mov	byte ptr [si+3Eh], 0FFh
		mov	al, 0
		mov	[si+41h], al
		mov	[si+40h], al
		mov	[si+3Fh], al
		mov	ax, word ptr [bp+var_4]
		add	ax, 0FFFCh

loc_98852:
		mov	[si+7],	ax

loc_98855:
		movsx	eax, word ptr [si+7]

loc_9885A:
		mov	[bp+var_10], eax
		push	1

loc_98860:
		push	0

loc_98862:
		push	2

loc_98864:
		push	eax

loc_98866:
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_14]
		mov	[si+1Dh], eax
		mov	byte ptr [si+21h], 2
		mov	byte ptr [si+22h], 1
		mov	dword ptr [si+23h], 0
		mov	eax, [bp+var_10]
		mov	[si+23h], eax
		push	0
		mov	al, [si+21h]
		push	ax
		push	large dword ptr	[si+1Dh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_988B9
		push	9030h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_988B9:				; CODE XREF: TextureLoader_LoadWithDwordFields_98784+12Aj
		pop	di
		pop	si
		leave
		retf
TextureLoader_LoadWithDwordFields_98784	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de TextureLoader_LoadWithDwordFields_98784 (65 lignes).
; ==============================================================================================
TextureLoader_LoadWithDwordFieldsB_988BD	proc far		; CODE XREF: VROOMM_StubThunk_6BC79J TextureLoader_LoadMixedFields_983FB+FCp

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+13h], eax
		mov	byte ptr [si+17h], 2
		mov	byte ptr [si+18h], 1
		mov	dword ptr [si+19h], 0
		mov	eax, [bp+var_8]
		mov	[si+19h], eax
		push	0
		mov	al, [si+17h]
		push	ax
		push	large dword ptr	[si+13h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_98932
		push	9009h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_98932:				; CODE XREF: TextureLoader_LoadWithDwordFieldsB_988BD+6Aj
		push	0
		mov	al, [si+17h]
		push	ax
		push	large dword ptr	[si+13h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
TextureLoader_LoadWithDwordFieldsB_988BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de TextureLoader_LoadWithDwordFields_98784 (52 lignes).
; ==============================================================================================
TextureLoader_LoadWithDwordFieldsC_98956	proc far		; CODE XREF: VROOMM_StubThunk_6BC88J TextureLoader_OpenAndLoadSubrecord_98670+B4p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_98957:
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_9895E:
		mov	di, [bp+arg_2]
		mov	ax, [si+46h]
		mov	cl, [si+4Eh]
		shl	ax, cl
		shl	ax, 2
		movzx	eax, ax
		cmp	eax, [di+72h]
		jz	short loc_9897F
		push	900Ah
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_9897F:				; CODE XREF: TextureLoader_LoadWithDwordFieldsC_98956+1Ej
		push	1
		push	0
		push	2
		push	large dword ptr	[di+72h]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+44h], dx
		mov	[si+42h], ax
		or	ax, dx
		jnz	short loc_989A7
		push	900Bh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_989A7:				; CODE XREF: TextureLoader_LoadWithDwordFieldsC_98956+46j
		push	large dword ptr	[si+42h]
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
TextureLoader_LoadWithDwordFieldsC_98956	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFreeWrapperB_5C774 (seg132), allocateur, ReadDwordFieldB_64AFF.
; ==============================================================================================
TextureLoader_LoadWithDwordFieldsD_989B8	proc far		; CODE XREF: VROOMM_StubThunk_6BC8DJ TextureLoader_OpenAndLoadSubrecord_98670+DBp

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
		mov	ax, [di+72h]
		mov	[si+5Ch], ax
		movsx	eax, word ptr [si+5Ch]
		mov	[bp+var_4], eax
		push	191Eh
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+5Eh], eax
		mov	byte ptr [si+62h], 2
		mov	byte ptr [si+63h], 1
		mov	dword ptr [si+64h], 0
		mov	eax, [bp+var_4]
		mov	[si+64h], eax
		mov	ax, [si+5Ch]
		shr	ax, 8
		mov	[si+5Ch], ax
		push	0
		mov	al, [si+62h]
		push	ax
		push	large dword ptr	[si+5Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
TextureLoader_LoadWithDwordFieldsD_989B8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (CRT_Malloc16_Retry, 22 lignes).
; ==============================================================================================
TextureLoader_AllocateC_98A3E	proc far		; CODE XREF: VROOMM_StubThunk_6BC60J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_98A54
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax

loc_98A52:
		or	ax, ax

loc_98A54:				; CODE XREF: TextureLoader_AllocateC_98A3E+8j
		mov	ax, dx
		pop	bp
		retf
TextureLoader_AllocateC_98A3E	endp

ovr288		ends
