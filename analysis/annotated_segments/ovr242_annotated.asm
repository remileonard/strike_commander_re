ovr242		segment	para public 'OVERLAY' use16
		assume cs:ovr242
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 180 lignes, NON DÉTAILLÉE — variante de GlyphObject_LoadMetricsFromIFF_7DE90
; (seg241).
; ==============================================================================================
GlyphObject_LoadMetricsFromIFFB_7FB10	proc far		; CODE XREF: VROOMM_StubThunk_6AEF8J Font_LoadGlyphTable_7FF90+5Ep	...

var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di

loc_7FB18:
		mov	si, [bp+arg_0]

loc_7FB1B:
		mov	di, [bp+arg_2]

loc_7FB1E:
		mov	[bp+var_A], 0

loc_7FB26:
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	eax, [di+72h]
		mov	[bp+var_E], eax

loc_7FB3E:
		mov	[bp+var_12], eax

loc_7FB42:
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 2
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		push	large [bp+var_E]
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_A]
		push	ax
		push	si
		call	GlyphObject_ComputeMetrics_60456
		add	sp, 4
		mov	word ptr [si+10h], 2

loc_7FBB1:
		mov	word ptr [si+12h], 0
		push	2Dh ; '-'
		push	si
		mov	bx, [si]

loc_7FBBB:
		call	dword ptr [bx+18h]

loc_7FBBE:
		add	sp, 4
		mov	[si+14h], ax

loc_7FBC4:
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	61h ; 'a'
		call	Font_ComputeGlyphBoundingBox_5E74E
		cmp	[bp+var_1C], 0
		jnz	short loc_7FC16
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h ; 'A'

loc_7FC11:
		call	Font_ComputeGlyphBoundingBox_5E74E

loc_7FC16:				; CODE XREF: GlyphObject_LoadMetricsFromIFFB_7FB10+DEj
		mov	ax, [bp+var_1C]
		mov	[bp+var_20], ax
		cwd

loc_7FC1D:
		xor	ax, dx

loc_7FC1F:
		sub	ax, dx

loc_7FC21:
		mov	[si+17h], ax

loc_7FC24:
		mov	ax, [si+17h]

loc_7FC27:
		mov	[bp+var_22], ax
		mov	[si+0Eh], ax

loc_7FC2D:
		cmp	[bp+var_5], 0
		jz	short loc_7FC51

loc_7FC33:
		cmp	[bp+var_A], 0

loc_7FC38:
		jz	short loc_7FC51
		push	0
		mov	al, [bp+var_6]
		push	ax

loc_7FC40:
		lea	ax, [bp+var_A]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7FC51:				; CODE XREF: GlyphObject_LoadMetricsFromIFFB_7FB10+121j
					; GlyphObject_LoadMetricsFromIFFB_7FB10:loc_7FC38j
		pop	di
		pop	si

locret_7FC53:
		leave

locret_7FC54:
		retf
GlyphObject_LoadMetricsFromIFFB_7FB10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GlyphObject_MeasureChar_6064A.
; ==============================================================================================
GlyphObject_MeasureWrapperB_7FC55	proc far		; CODE XREF: VROOMM_StubThunk_6AEFDJ GlyphObject_MeasureAndAllocateExtended_802BA+5Bp

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_4], 0
		jmp	short loc_7FC7B
; ���������������������������������������������������������������������������

loc_7FC69:				; CODE XREF: GlyphObject_MeasureWrapperB_7FC55+35j
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_6064A
		add	sp, 4
		add	di, ax
		inc	[bp+var_4]

loc_7FC7B:				; CODE XREF: GlyphObject_MeasureWrapperB_7FC55+12j
		les	bx, [bp+arg_2]
		add	bx, [bp+var_4]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_7FC69
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GlyphObject_MeasureWrapperB_7FC55	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine GlyphObject_ResolveAndCache_605CE et GlyphObject_MeasureChar_6064A.
; ==============================================================================================
GlyphObject_ResolveAndMeasureB_7FC92	proc far		; CODE XREF: VROOMM_StubThunk_6AF02J

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], di
		mov	ax, [si+17h]
		inc	ax
		mov	[bp+var_4], ax
		mov	[bp+var_8], 0
		jmp	short loc_7FCEC
; ���������������������������������������������������������������������������

loc_7FCB1:				; CODE XREF: GlyphObject_ResolveAndMeasureB_7FC92+69j
		cmp	[bp+var_6], 0Ah
		jnz	short loc_7FCC2
		mov	di, [bp+var_2]
		mov	ax, [bp+var_4]
		add	[bp+arg_6], ax
		jmp	short loc_7FCE9
; ���������������������������������������������������������������������������

loc_7FCC2:				; CODE XREF: GlyphObject_ResolveAndMeasureB_7FC92+23j
		push	[bp+arg_6]
		push	di
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	[bp+arg_2]
		push	si
		call	GlyphObject_ResolveAndCache_605CE
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_6064A
		add	sp, 4
		mov	dx, di
		add	dx, ax
		mov	di, dx

loc_7FCE9:				; CODE XREF: GlyphObject_ResolveAndMeasureB_7FC92+2Ej
		inc	[bp+var_8]

loc_7FCEC:				; CODE XREF: GlyphObject_ResolveAndMeasureB_7FC92+1Dj
		les	bx, [bp+arg_8]
		add	bx, [bp+var_8]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_6], ax
		or	ax, ax
		jnz	short loc_7FCB1
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GlyphObject_ResolveAndMeasureB_7FC92	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue via CRT_Malloc32_Retry.
; ==============================================================================================
GlyphObject_AllocateExtended_7FD03	proc far		; CODE XREF: VROOMM_StubThunk_6AED5J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_7FD25
		push	large 0AEh ; '�'
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax

loc_7FD21:
		or	ax, dx

loc_7FD23:
		jz	short loc_7FD5C

loc_7FD25:				; CODE XREF: GlyphObject_AllocateExtended_7FD03+8j
		les	bx, [bp+arg_0]

loc_7FD28:
		mov	dword ptr es:[bx+6], 0

loc_7FD31:
		mov	byte ptr es:[bx+0Ah], 2

loc_7FD36:
		mov	byte ptr es:[bx+0Bh], 0

loc_7FD3B:
		mov	dword ptr es:[bx+0Ch], 0

loc_7FD44:
		mov	word ptr es:[bx+4], 0
		mov	ax, word ptr [bp+arg_0]

loc_7FD4D:
		add	ax, 0A1h ; '�'
		mov	ax, word ptr [bp+arg_0]

loc_7FD53:
		add	ax, 0A5h ; '�'
		mov	byte ptr es:[bx+0A0h], 0

loc_7FD5C:				; CODE XREF: GlyphObject_AllocateExtended_7FD03:loc_7FD23j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
GlyphObject_AllocateExtended_7FD03	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 138 lignes, NON DÉTAILLÉE — combine Path_ResolveDataFile,
; StreamReader_ConstructVariantA_63A39, ResourceRecord_InitAndValidate_645CD (seg193) —
; ouverture d'un fichier de définition de police résolu par chemin.
; ==============================================================================================
Font_OpenDefinitionFile_7FD64	proc far		; CODE XREF: VROOMM_StubThunk_6AEDFJ

var_FC		= word ptr -0FCh
var_9F		= dword	ptr -9Fh
var_9B		= dword	ptr -9Bh
var_97		= dword	ptr -97h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_54		= word ptr -54h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0FCh
		push	si
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	offset aPlaques	; "PLAQUES"
		push	ds
		push	offset aCockpits_0 ; "COCKPITS"
		lea	ax, [bp+var_54]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_FC], 2C8h
		mov	[bp+var_9B], 100h
		mov	[bp+var_9F], 0
		mov	[bp+var_FC], 2E0h
		mov	[bp+var_80], 0
		xor	ax, ax
		mov	[bp+var_82], ax
		movsx	eax, ax
		mov	[bp+var_97], eax
		push	large [dword_6D6DD]
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_InitAndValidate_645CD
		add	sp, 8
		or	ax, ax
		jz	short loc_7FDFA
		lea	ax, [bp+var_FC]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Font_LoadGlyphTable_7FF90
		add	sp, 6
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_Helper_645A5
		jmp	short loc_7FE02
; ���������������������������������������������������������������������������

loc_7FDFA:				; CODE XREF: Font_OpenDefinitionFile_7FD64+77j
		push	7010h
		call	VROOMM_StubThunk_6B70F

loc_7FE02:				; CODE XREF: Font_OpenDefinitionFile_7FD64+94j
		pop	cx
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 0
		mov	ax, word_70E62
		mov	[bp+var_2], ax
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_7FE39

loc_7FE20:
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		push	[bp+var_2]
		push	ax

loc_7FE2D:
		call	TextFormat_ApplyStyleAttribute_5E2D0

loc_7FE32:
		add	sp, 4
		mov	ax, si
		jmp	short loc_7FE3B
; ���������������������������������������������������������������������������

loc_7FE39:				; CODE XREF: Font_OpenDefinitionFile_7FD64+BAj
		mov	ax, si

loc_7FE3B:				; CODE XREF: Font_OpenDefinitionFile_7FD64+D3j
		les	bx, [bp+arg_0]
		mov	es:[bx+0A9h], ax
		mov	ax, es:[bx+0A9h]
		mov	[bp+var_4], ax
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_7FE72
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		push	[bp+var_4]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		mov	ax, si
		jmp	short loc_7FE74
; ���������������������������������������������������������������������������

loc_7FE72:				; CODE XREF: Font_OpenDefinitionFile_7FD64+F3j
		mov	ax, si

loc_7FE74:				; CODE XREF: Font_OpenDefinitionFile_7FD64+10Cj
		les	bx, [bp+arg_0]
		mov	es:[bx+0ABh], ax
		mov	[bp+var_FC], 2E0h
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	si
		leave
		retf
Font_OpenDefinitionFile_7FD64	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 118 lignes, NON DÉTAILLÉE — combine Memory_TypedFree_5C7B6,
; TextFormat_ReleaseStyleList_5E526 (×2, seg143), CRT_FreeNear_Wrap.
; ==============================================================================================
GlyphObject_ReleaseStylesAndBuffer_7FE9F	proc far		; CODE XREF: VROOMM_StubThunk_6AEDAJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Bh], 0
		jz	short loc_7FED8

loc_7FEAF:
		cmp	dword ptr es:[bx+6], 0
		jz	short loc_7FED8

loc_7FEB7:
		push	0

loc_7FEB9:
		mov	al, es:[bx+0Ah]
		push	ax

loc_7FEBE:
		mov	eax, es:[bx+6]

loc_7FEC3:
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_7FED8:				; CODE XREF: GlyphObject_ReleaseStylesAndBuffer_7FE9F+Ej
					; GlyphObject_ReleaseStylesAndBuffer_7FE9F+16j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+6], 0
		mov	byte ptr es:[bx+0Bh], 0
		mov	dword ptr es:[bx+0Ch], 0
		cmp	word ptr es:[bx+0ABh], 0
		jz	short loc_7FF15
		push	word ptr es:[bx+0ABh]
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]

loc_7FF0D:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_7FF13:
		jmp	short $+2

loc_7FF15:				; CODE XREF: GlyphObject_ReleaseStylesAndBuffer_7FE9F+59j
		les	bx, [bp+arg_0]

loc_7FF18:
		mov	word ptr es:[bx+0ABh], 0

loc_7FF1F:
		cmp	word ptr es:[bx+0A9h], 0

loc_7FF25:
		jz	short loc_7FF42

loc_7FF27:
		push	word ptr es:[bx+0A9h]

loc_7FF2C:
		call	TextFormat_ReleaseStyleList_5E526

loc_7FF31:
		pop	cx

loc_7FF32:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0A9h]
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_7FF42:				; CODE XREF: GlyphObject_ReleaseStylesAndBuffer_7FE9F:loc_7FF25j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0A9h], 0
		cmp	word ptr es:[bx], 0
		jz	short loc_7FF63

loc_7FF52:
		push	3
		push	word ptr es:[bx]
		mov	bx, es:[bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_7FF63:				; CODE XREF: GlyphObject_ReleaseStylesAndBuffer_7FE9F+B1j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0
		cmp	word ptr es:[bx+2], 0
		jz	short loc_7FF85
		push	3
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_7FF85:				; CODE XREF: GlyphObject_ReleaseStylesAndBuffer_7FE9F+D1j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		leave
		retf
GlyphObject_ReleaseStylesAndBuffer_7FE9F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 331 lignes, NON DÉTAILLÉE — combine plusieurs lectures IFF
; (ResourceRecord_SeekAndRead_64743) et GlyphObject_AllocateBuffer_604C9 (seg162) — chargement
; de la table de glyphes d'une police.
; ==============================================================================================
Font_LoadGlyphTable_7FF90	proc far		; CODE XREF: VROOMM_StubThunk_6AEE4J Font_OpenDefinitionFile_7FD64+84p

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		jmp	loc_8006B
; ���������������������������������������������������������������������������

loc_7FFA3:				; CODE XREF: Font_LoadGlyphTable_7FF90+F0j
		push	0
		push	large 45444957h
		push	si
		call	ResourceRecord_SeekAndRead_64743

loc_7FFB1:
		add	sp, 8
		or	ax, ax
		jz	short loc_80003
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_80003
		mov	[bp+var_4], si
		push	19h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_7FFF8
		push	ax
		call	GlyphObject_AllocateBuffer_604C9
		pop	cx
		mov	word ptr [di], 632h
		push	[bp+var_4]
		push	di
		push	cs
		call	near ptr GlyphObject_LoadMetricsFromIFFB_7FB10
		add	sp, 4
		mov	ax, di
		jmp	short loc_7FFFA
; ���������������������������������������������������������������������������

loc_7FFF8:				; CODE XREF: Font_LoadGlyphTable_7FF90+4Cj
		mov	ax, di

loc_7FFFA:				; CODE XREF: Font_LoadGlyphTable_7FF90+66j
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		inc	[bp+var_2]

loc_80003:				; CODE XREF: Font_LoadGlyphTable_7FF90+26j
					; Font_LoadGlyphTable_7FF90+3Bj
		push	0
		push	large 594E4954h
		push	si
		call	ResourceRecord_SeekAndRead_64743

loc_80011:
		add	sp, 8
		or	ax, ax
		jz	short loc_80064
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_80064
		mov	[bp+var_6], si
		push	19h

loc_80032:
		call	CRT_Malloc16_Retry

loc_80037:
		pop	cx

loc_80038:
		mov	di, ax
		or	ax, ax
		jz	short loc_80058

loc_8003E:
		push	ax

loc_8003F:
		call	GlyphObject_AllocateBuffer_604C9
		pop	cx

loc_80045:
		mov	word ptr [di], 632h
		push	[bp+var_6]
		push	di
		push	cs
		call	near ptr GlyphObject_LoadMetricsFromIFFB_7FB10
		add	sp, 4
		mov	ax, di
		jmp	short loc_8005A
; ���������������������������������������������������������������������������

loc_80058:				; CODE XREF: Font_LoadGlyphTable_7FF90+ACj
		mov	ax, di

loc_8005A:				; CODE XREF: Font_LoadGlyphTable_7FF90+C6j
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		inc	[bp+var_2]

loc_80064:				; CODE XREF: Font_LoadGlyphTable_7FF90+86j
					; Font_LoadGlyphTable_7FF90+9Bj
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8006B:				; CODE XREF: Font_LoadGlyphTable_7FF90+10j
		push	1
		push	large 544E4F46h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_80083
		jmp	loc_7FFA3
; ���������������������������������������������������������������������������

loc_80083:				; CODE XREF: Font_LoadGlyphTable_7FF90+EEj
		cmp	[bp+var_2], 2
		jz	short loc_80092
		push	7011h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_80092:				; CODE XREF: Font_LoadGlyphTable_7FF90+F7j
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_800D6
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]

loc_800B1:
		mov	es:[bx+9Ch], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]

loc_800C0:
		mov	es:[bx+98h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ah], ax
		jmp	short loc_8010D
; ���������������������������������������������������������������������������

loc_800D6:				; CODE XREF: Font_LoadGlyphTable_7FF90+115j
		mov	bx, word_70E62
		mov	ax, [bx+0Ah]
		sub	ax, [bx+6]
		inc	ax
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ch], ax
		mov	word ptr es:[bx+98h], 2
		mov	word ptr es:[bx+9Ah], 2
		mov	ax, es:[bx+9Ch]
		mov	bx, es:[bx]
		mov	dx, [bx+17h]
		inc	dx
		sub	ax, dx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+9Ch], ax

loc_8010D:				; CODE XREF: Font_LoadGlyphTable_7FF90+144j
		push	0

loc_8010F:
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax

loc_80120:
		jnz	short loc_80125

loc_80122:
		jmp	loc_801C2
; ���������������������������������������������������������������������������

loc_80125:				; CODE XREF: Font_LoadGlyphTable_7FF90:loc_80120j
		mov	eax, [si+72h]

loc_80129:
		mov	[bp+var_A], eax

loc_8012D:
		mov	[bp+var_E], eax
		push	1

loc_80133:
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch

loc_80144:
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_12]
		mov	es:[bx+6], eax
		mov	byte ptr es:[bx+0Ah], 2
		mov	byte ptr es:[bx+0Bh], 1
		mov	dword ptr es:[bx+0Ch], 0
		mov	eax, [bp+var_E]
		mov	es:[bx+0Ch], eax
		push	large [bp+var_A]
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax

loc_801B4:
		call	Struct_GetElementCountMinusOne_625CC
		les	bx, [bp+arg_0]

loc_801BC:
		mov	es:[bx+4], ax
		jmp	short loc_801CB
; ���������������������������������������������������������������������������

loc_801C2:				; CODE XREF: Font_LoadGlyphTable_7FF90:loc_80122j
		push	7012h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_801CB:				; CODE XREF: Font_LoadGlyphTable_7FF90+230j
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	ax, [bp+var_16]
		sub	ax, [bp+var_1A]
		inc	ax
		mov	[bp+var_14], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ah]
		shl	ax, 1
		mov	dx, [bp+var_14]
		sub	dx, ax
		mov	bx, es:[bx]

loc_80212:
		sub	dx, [bx+17h]

loc_80215:
		shr	dx, 1

loc_80217:
		mov	bx, word ptr [bp+arg_0]

loc_8021A:
		mov	ax, es:[bx+9Ah]
		add	ax, dx

loc_80221:
		mov	es:[bx+9Eh], ax
		pop	di
		pop	si
		leave
		retf
Font_LoadGlyphTable_7FF90	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateur typé et Font_ComputeGlyphBoundingBox_5E74E.
; ==============================================================================================
GlyphObject_MeasureAndAllocateB_8022A	proc far		; CODE XREF: VROOMM_StubThunk_6AEE9J GlyphObject_MeasureAndAllocateExtended_802BA+73p

var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+98h]
		shl	ax, 1
		add	si, ax

loc_80241:
		mov	[bp+var_2], 0
		xor	di, di
		mov	[bp+var_4], 0
		jmp	short loc_802A7
; ���������������������������������������������������������������������������

loc_8024F:				; CODE XREF: GlyphObject_MeasureAndAllocateB_8022A+87j
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	dx, [bp+var_A]
		sub	dx, [bp+var_E]
		inc	dx
		cmp	di, si
		jnb	short loc_80290
		cmp	dx, di
		ja	short loc_8029C

loc_80290:				; CODE XREF: GlyphObject_MeasureAndAllocateB_8022A+60j
		cmp	di, si
		jbe	short loc_802A4
		cmp	dx, di
		jnb	short loc_802A4
		cmp	dx, si
		jb	short loc_802A4

loc_8029C:				; CODE XREF: GlyphObject_MeasureAndAllocateB_8022A+64j
		mov	ax, [bp+var_4]
		mov	[bp+var_2], ax
		mov	di, dx

loc_802A4:				; CODE XREF: GlyphObject_MeasureAndAllocateB_8022A+68j
					; GlyphObject_MeasureAndAllocateB_8022A+6Cj ...
		inc	[bp+var_4]

loc_802A7:				; CODE XREF: GlyphObject_MeasureAndAllocateB_8022A+23j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		cmp	ax, [bp+var_4]
		ja	short loc_8024F
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
GlyphObject_MeasureAndAllocateB_8022A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 183 lignes, NON DÉTAILLÉE — variante étendue de
; GlyphObject_MeasureAndAllocateB_8022A (2 mesures).
; ==============================================================================================
GlyphObject_MeasureAndAllocateExtended_802BA	proc far		; CODE XREF: VROOMM_StubThunk_6AEEEJ GlyphObject_Helper9_80467+35p

var_16		= word ptr -16h
var_14		= word ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 16h
		xor	dx, dx
		jmp	short loc_802E4
; ���������������������������������������������������������������������������

loc_802C4:				; CODE XREF: GlyphObject_MeasureAndAllocateExtended_802BA+3Ej
		mov	cx, [bp+var_2]
		mov	bx, cx
		add	bx, 0FFBFh
		cmp	bx, 19h
		ja	short loc_802D8
		mov	cx, bx
		add	cx, 61h	; 'a'
		jmp	short $+2

loc_802D8:				; CODE XREF: GlyphObject_MeasureAndAllocateExtended_802BA+15j
		mov	ax, cx
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	es:[bx+10h], al
		inc	dx

loc_802E4:				; CODE XREF: GlyphObject_MeasureAndAllocateExtended_802BA+8j
		les	bx, [bp+arg_4]
		add	bx, dx
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_802FA
		cmp	dx, 80h	; '�'
		jl	short loc_802C4

loc_802FA:				; CODE XREF: GlyphObject_MeasureAndAllocateExtended_802BA+38j
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	byte ptr es:[bx+10h], 0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10h
		push	word ptr [bp+arg_0+2]
		push	ax
		mov	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx]
		push	cs
		call	near ptr GlyphObject_MeasureWrapperB_7FC55
		add	sp, 6
		les	bx, [bp+arg_0]

loc_8031E:
		mov	es:[bx+90h], ax

loc_80323:
		push	word ptr es:[bx+90h]
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocateB_8022A
		add	sp, 6

loc_80333:
		les	bx, [bp+arg_0]
		mov	es:[bx+96h], ax
		mov	ax, es:[bx+96h]
		mov	[bp+var_4], ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	large 0
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	dx, [bp+var_8]
		sub	dx, [bp+var_C]
		inc	dx
		mov	bx, word_70E62
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		sub	ax, dx
		sar	ax, 1
		les	bx, [bp+arg_0]
		mov	es:[bx+92h], ax
		mov	ax, es:[bx+9Ch]
		mov	es:[bx+94h], ax
		mov	ax, es:[bx+92h]
		mov	bx, es:[bx+0A9h]
		mov	[bx+4],	ax
		mov	bx, word ptr [bp+arg_0]
		add	ax, dx
		dec	ax
		mov	bx, es:[bx+0A9h]
		mov	[bx+8],	ax
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		mov	bx, es:[bx+0A9h]
		mov	[bx+6],	ax
		mov	bx, word ptr [bp+arg_0]

loc_803C2:
		mov	ax, es:[bx+96h]
		mov	[bp+var_E], ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		push	large 0
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	es:[bx+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_E]
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	ax, [bp+var_10]
		sub	ax, [bp+var_14]
		inc	ax
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9Ch]
		add	dx, ax
		dec	dx
		mov	bx, es:[bx+0A9h]
		mov	[bx+0Ah], dx
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+4],	ax

loc_80423:
		mov	bx, word ptr [bp+arg_0]

loc_80426:
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+6]

loc_8042E:
		mov	bx, word ptr [bp+arg_0]

loc_80431:
		mov	bx, es:[bx+0ABh]
		mov	[bx+6],	ax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+8],	ax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+0Ah]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+0Ah], ax
		leave
		retf
GlyphObject_MeasureAndAllocateExtended_802BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (36 lignes).
; ==============================================================================================
GlyphObject_Helper9_80467	proc far		; CODE XREF: VROOMM_StubThunk_6AEF3J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jz	short loc_80493
		mov	byte ptr es:[bx+0A0h], 0
		xor	eax, eax
		mov	es:[bx+0A1h], eax
		mov	es:[bx+0A5h], eax
		mov	byte ptr es:[bx+0ADh], 1

loc_80493:				; CODE XREF: GlyphObject_Helper9_80467+Fj
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocateExtended_802BA
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 1
		mov	eax, [bp+arg_8]
		mov	[bp+var_4], eax

loc_804B3:
		mov	eax, [bp+var_4]
		mov	es:[bx+0A1h], eax
		leave
		retf
GlyphObject_Helper9_80467	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GlyphObject_ScalarDeletingDtorA_6070E.
; ==============================================================================================
GlyphObject_DestructWrapperB_804BF	proc far		; CODE XREF: VROOMM_StubThunk_6AED0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_804E8
		push	0
		push	si
		call	GlyphObject_ScalarDeletingDtorA_6070E
		add	sp, 4
		test	di, 1
		jz	short loc_804E8
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_804E8:				; CODE XREF: GlyphObject_DestructWrapperB_804BF+Dj
					; GlyphObject_DestructWrapperB_804BF+1Ej
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_DestructWrapperB_804BF	endp

ovr242		ends
