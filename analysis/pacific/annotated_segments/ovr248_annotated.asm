ovr248		segment	para public 'OVERLAY' use16
		assume cs:ovr248
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_LoadMetricsFromIFFB_7FB10 (sub_7FB10 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 180 lignes, NON DÉTAILLÉE — variante de GlyphObject_LoadMetricsFromIFF_7DE90 (seg241).
; ==============================================================================================
GlyphObject_LoadMetricsFromIFFB_8E690		proc far

var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	eax, [di+72h]
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2], dx
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
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	si
		call	sub_690A8
		add	sp, 4
		mov	word ptr [si+10h], 2
		mov	word ptr [si+12h], 0
		push	2Dh
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[si+14h], ax
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	61h
		call	Font_ComputeGlyphBoundingBox_680A8
		cmp	[bp+var_1C], 0
		jnz	short loc_8E796
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h
		call	Font_ComputeGlyphBoundingBox_680A8

loc_8E796:
		mov	ax, [bp+var_1C]
		mov	[bp+var_20], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[si+17h], ax
		mov	ax, [si+17h]
		mov	[bp+var_22], ax
		mov	[si+0Eh], ax
		cmp	[bp+var_5], 0
		jz	short loc_8E7D1
		cmp	[bp+var_A], 0
		jz	short loc_8E7D1
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8E7D1

loc_8E7D1:
		pop	di
		pop	si
		leave
		retf
GlyphObject_LoadMetricsFromIFFB_8E690		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_AllocateExtended_7FD03 (sub_7FD03 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue via CRT_Malloc32_Retry.
; ==============================================================================================
GlyphObject_AllocateExtended_8E7D5		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_8E7F7
		push	large 0AEh
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_8E82E

loc_8E7F7:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+6], 0
		mov	byte ptr es:[bx+0Ah], 2
		mov	byte ptr es:[bx+0Bh], 0
		mov	dword ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx+4], 0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A1h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A5h
		mov	byte ptr es:[bx+0A0h], 0

loc_8E82E:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
GlyphObject_AllocateExtended_8E7D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Font_OpenDefinitionFile_7FD64 (sub_7FD64 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 138 lignes, NON DÉTAILLÉE — combine Path_ResolveDataFile,
; StreamReader_ConstructVariantA_63A39, ResourceRecord_InitAndValidate_645CD (seg193) —
; ouverture d'un fichier de définition de police résolu par chemin.
; ==============================================================================================
Font_OpenDefinitionFile_8E836		proc far

var_FC		= word ptr -0FCh
var_9F		= dword ptr -9Fh
var_9B		= dword ptr -9Bh
var_97		= dword ptr -97h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_54		= word ptr -54h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0FCh
		push	si
		push	seg seg225
		push	0
		push	ds
		push	offset aPLAQUES
		push	ds
		push	offset aCOCKPITS_1
		lea	ax, [bp+var_54]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_FC], 508h
		mov	[bp+var_9B], 100h
		mov	[bp+var_9F], 0
		mov	[bp+var_FC], 520h
		mov	[bp+var_80], 0
		xor	ax, ax
		mov	[bp+var_82], ax
		movsx	eax, ax
		mov	[bp+var_97], eax
		push	large dword_76ECD
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jz	short loc_8E8CC
		lea	ax, [bp+var_FC]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_8EA62
		add	sp, 6
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_Helper_6D61E
		jmp	short loc_8E8D4

loc_8E8CC:
		push	7010h
		call	sub_1DDFE

loc_8E8D4:
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 0
		mov	ax, word_7AF7E
		mov	[bp+var_2], ax
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_8E90B
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		push	[bp+var_2]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		mov	ax, si
		jmp	short loc_8E90D

loc_8E90B:
		mov	ax, si

loc_8E90D:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0A9h], ax
		mov	ax, es:[bx+0A9h]
		mov	[bp+var_4], ax
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_8E944
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		push	[bp+var_4]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		mov	ax, si
		jmp	short loc_8E946

loc_8E944:
		mov	ax, si

loc_8E946:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0ABh], ax
		mov	[bp+var_FC], 520h
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
Font_OpenDefinitionFile_8E836		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ReleaseStylesAndBuffer_7FE9F (sub_7FE9F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 118 lignes, NON DÉTAILLÉE — combine Memory_TypedFree_5C7B6,
; TextFormat_ReleaseStyleList_5E526 (×2, seg143), CRT_FreeNear_Wrap.
; ==============================================================================================
GlyphObject_ReleaseStylesAndBuffer_8E971		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Bh], 0
		jz	short loc_8E9AA
		cmp	dword ptr es:[bx+6], 0
		jz	short loc_8E9AA
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		mov	eax, es:[bx+6]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8E9AA

loc_8E9AA:
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+6], 0
		mov	byte ptr es:[bx+0Bh], 0
		mov	dword ptr es:[bx+0Ch], 0
		cmp	word ptr es:[bx+0ABh], 0
		jz	short loc_8E9E7
		push	word ptr es:[bx+0ABh]
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		call	sub_3B2
		pop	cx
		jmp	short loc_8E9E7

loc_8E9E7:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0ABh], 0
		cmp	word ptr es:[bx+0A9h], 0
		jz	short loc_8EA14
		push	word ptr es:[bx+0A9h]
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0A9h]
		call	sub_3B2
		pop	cx
		jmp	short loc_8EA14

loc_8EA14:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0A9h], 0
		cmp	word ptr es:[bx], 0
		jz	short loc_8EA35
		push	3
		push	word ptr es:[bx]
		mov	bx, es:[bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8EA35

loc_8EA35:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0
		cmp	word ptr es:[bx+2], 0
		jz	short loc_8EA57
		push	3
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8EA57

loc_8EA57:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		leave
		retf
GlyphObject_ReleaseStylesAndBuffer_8E971		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8EA62		proc far

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		jmp	loc_8EB3D

loc_8EA75:
		push	0
		push	large 45444957h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_8EAD5
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_8EAD5
		mov	[bp+var_4], si
		push	19h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_8EACA
		push	ax
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		mov	word ptr [di], 7A2h
		push	[bp+var_4]
		push	di
		push	cs
		call	near ptr GlyphObject_LoadMetricsFromIFFB_8E690
		add	sp, 4
		mov	ax, di
		jmp	short loc_8EACC

loc_8EACA:
		mov	ax, di

loc_8EACC:
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		inc	[bp+var_2]

loc_8EAD5:
		push	0
		push	large 594E4954h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_8EB36
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_8EB36
		mov	[bp+var_6], si
		push	19h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_8EB2A
		push	ax
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		mov	word ptr [di], 7A2h
		push	[bp+var_6]
		push	di
		push	cs
		call	near ptr GlyphObject_LoadMetricsFromIFFB_8E690
		add	sp, 4
		mov	ax, di
		jmp	short loc_8EB2C

loc_8EB2A:
		mov	ax, di

loc_8EB2C:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		inc	[bp+var_2]

loc_8EB36:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_8EB3D:
		push	1
		push	large 544E4F46h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_8EB55
		jmp	loc_8EA75

loc_8EB55:
		cmp	[bp+var_2], 2
		jz	short loc_8EB64
		push	7011h
		call	sub_1DDFE
		pop	cx

loc_8EB64:
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_8EBA8
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ch], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+98h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ah], ax
		jmp	short loc_8EBDF

loc_8EBA8:
		mov	bx, word_7AF7E
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
		mov	bx, [bp+arg_0]
		mov	es:[bx+9Ch], ax

loc_8EBDF:
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_8EBF7
		jmp	loc_8EC94

loc_8EBF7:
		mov	eax, [si+72h]
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2], dx
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
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		jmp	short loc_8EC9D

loc_8EC94:
		push	7012h
		call	sub_1DDFE
		pop	cx

loc_8EC9D:
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	Font_ComputeGlyphBoundingBox_680A8
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
		sub	dx, [bx+17h]
		shr	dx, 1
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ah]
		inc	ax
		add	ax, dx
		mov	es:[bx+9Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_8EA62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8ECFD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_8ED26
		push	0
		push	si
		call	sub_69368
		add	sp, 4
		test	di, 1
		jz	short loc_8ED26
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_8ED26

loc_8ED26:
		pop	di
		pop	si
		pop	bp
		retf
sub_8ECFD		endp
ovr248		ends
