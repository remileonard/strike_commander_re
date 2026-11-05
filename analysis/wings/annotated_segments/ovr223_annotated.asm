ovr223		segment	para public 'OVERLAY' use16
		assume cs:ovr223
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_77F20		proc far

var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_8		= dword ptr -8
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
		mov	byte ptr [bp+var_8+2], 2
		mov	byte ptr [bp+var_8+3], 0
		mov	[bp+var_4], 0
		mov	eax, [di+72h]
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[bp+var_A], eax
		mov	byte ptr [bp+var_8+2], 2
		mov	byte ptr [bp+var_8+3], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		push	large [bp+var_E]
		cmp	byte ptr [bp+var_8+2], 3
		jnz	short loc_77FAC
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		push	large [bp+var_A]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_77FB3

loc_77FAC:
		mov	edx, [bp+var_8]
		mov	ax, word ptr [bp+var_A]

loc_77FB3:
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	si
		call	sub_48858
		add	sp, 4
		mov	word ptr [si+10h], 1
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
		cmp	byte ptr [si+6], 3
		jnz	short loc_78008
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_7800E

loc_78008:
		mov	dx, [si+4]
		mov	ax, [si+2]

loc_7800E:
		push	dx
		push	ax
		push	61h
		call	sub_47C50
		cmp	[bp+var_1C], 0
		jnz	short loc_78051
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	large 0
		cmp	byte ptr [si+6], 3
		jnz	short loc_78042
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_78048

loc_78042:
		mov	dx, [si+4]
		mov	ax, [si+2]

loc_78048:
		push	dx
		push	ax
		push	41h
		call	sub_47C50

loc_78051:
		mov	ax, [bp+var_1C]
		mov	[bp+var_20], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[si+17h], ax
		mov	ax, [si+17h]
		mov	[bp+var_22], ax
		mov	[si+0Eh], ax
		cmp	byte ptr [bp+var_8+3], 0
		jz	short loc_7808C
		cmp	[bp+var_A], 0
		jz	short loc_7808C
		push	0
		mov	al, byte ptr [bp+var_8+2]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7808C

loc_7808C:
		pop	di
		pop	si
		leave
		retf
sub_77F20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_78090		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+10h]
		mov	[bp+var_4], 0
		jmp	short loc_780BA

loc_780A5:
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	si
		call	sub_48A8C
		add	sp, 4
		add	di, ax
		add	di, [si+10h]
		inc	[bp+var_4]

loc_780BA:
		les	bx, [bp+arg_2]
		add	bx, [bp+var_4]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_780A5
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_78090		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_780D1		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	ax, di
		add	ax, [si+10h]
		mov	di, ax
		mov	[bp+var_2], di
		mov	ax, [si+17h]
		inc	ax
		mov	[bp+var_4], ax
		mov	[bp+var_8], 0
		jmp	short loc_78139

loc_780F7:
		cmp	[bp+var_6], 0Ah
		jnz	short loc_78108
		mov	di, [bp+var_2]
		mov	ax, [bp+var_4]
		add	[bp+arg_6], ax
		jmp	short loc_78136

loc_78108:
		push	[bp+arg_6]
		push	di
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	[bp+arg_2]
		push	si
		call	sub_489F4
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	si
		call	sub_48A8C
		add	sp, 4
		mov	dx, di
		add	dx, ax
		mov	di, dx
		mov	ax, di
		add	ax, [si+10h]
		mov	di, ax

loc_78136:
		inc	[bp+var_8]

loc_78139:
		les	bx, [bp+arg_8]
		add	bx, [bp+var_8]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_6], ax
		or	ax, ax
		jnz	short loc_780F7
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_780D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GlyphObject_AllocateExtended_8E7D5 (sub_8E7D5 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à GlyphObject_AllocateExtended_7FD03 (sub_7FD03 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, alloue via CRT_Malloc32_Retry.
; ==============================================================================================
GlyphObject_AllocateExtended_78150		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_78172
		push	large 0AEh
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_781A9

loc_78172:
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

loc_781A9:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
GlyphObject_AllocateExtended_78150		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Font_OpenDefinitionFile_8E836 (sub_8E836 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Font_OpenDefinitionFile_7FD64 (sub_7FD64 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 138 lignes, NON DÉTAILLÉE — combine Path_ResolveDataFile,
; StreamReader_ConstructVariantA_63A39, ResourceRecord_InitAndValidate_645CD (seg193) —
; ouverture d'un fichier de définition de police résolu par chemin.
; ==============================================================================================
Font_OpenDefinitionFile_781B1		proc far

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
		push	seg seg180
		push	0
		push	ds
		push	offset aPLAQUES
		push	ds
		push	offset aCOCKPITS
		lea	ax, [bp+var_54]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_FC], 9B5h
		mov	[bp+var_9B], 100h
		mov	[bp+var_9F], 0
		mov	[bp+var_FC], 9CDh
		mov	[bp+var_80], 0
		xor	ax, ax
		mov	[bp+var_82], ax
		movsx	eax, ax
		mov	[bp+var_97], eax
		push	large dword_5CD23
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_InitAndValidate_53B4C
		add	sp, 8
		or	ax, ax
		jz	short loc_78247
		lea	ax, [bp+var_FC]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_783DD
		add	sp, 6
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_Helper_53B24
		jmp	short loc_7824F

loc_78247:
		push	7010h
		call	sub_9D47

loc_7824F:
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 0
		mov	ax, word_5DD44
		mov	[bp+var_2], ax
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_78286
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		push	[bp+var_2]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	ax, si
		jmp	short loc_78288

loc_78286:
		mov	ax, si

loc_78288:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0A9h], ax
		mov	ax, es:[bx+0A9h]
		mov	[bp+var_4], ax
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_782BF
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		push	[bp+var_4]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	ax, si
		jmp	short loc_782C1

loc_782BF:
		mov	ax, si

loc_782C1:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0ABh], ax
		mov	[bp+var_FC], 9CDh
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	si
		leave
		retf
Font_OpenDefinitionFile_781B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ReleaseStylesAndBuffer_8E971 (sub_8E971 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ReleaseStylesAndBuffer_7FE9F (sub_7FE9F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 118 lignes, NON DÉTAILLÉE — combine Memory_TypedFree_5C7B6,
; TextFormat_ReleaseStyleList_5E526 (×2, seg143), CRT_FreeNear_Wrap.
; ==============================================================================================
GlyphObject_ReleaseStylesAndBuffer_782EC		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Bh], 0
		jz	short loc_78325
		cmp	dword ptr es:[bx+6], 0
		jz	short loc_78325
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		mov	eax, es:[bx+6]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_78325

loc_78325:
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+6], 0
		mov	byte ptr es:[bx+0Bh], 0
		mov	dword ptr es:[bx+0Ch], 0
		cmp	word ptr es:[bx+0ABh], 0
		jz	short loc_78362
		push	word ptr es:[bx+0ABh]
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		call	sub_33B
		pop	cx
		jmp	short loc_78362

loc_78362:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0ABh], 0
		cmp	word ptr es:[bx+0A9h], 0
		jz	short loc_7838F
		push	word ptr es:[bx+0A9h]
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0A9h]
		call	sub_33B
		pop	cx
		jmp	short loc_7838F

loc_7838F:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0A9h], 0
		cmp	word ptr es:[bx], 0
		jz	short loc_783B0
		push	3
		push	word ptr es:[bx]
		mov	bx, es:[bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_783B0

loc_783B0:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0
		cmp	word ptr es:[bx+2], 0
		jz	short loc_783D2
		push	3
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_783D2

loc_783D2:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		leave
		retf
GlyphObject_ReleaseStylesAndBuffer_782EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_783DD		proc far

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
		jmp	loc_784B8

loc_783F0:
		push	0
		push	large 45444957h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_78450
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_78450
		mov	[bp+var_4], si
		push	19h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_78445
		push	ax
		call	GlyphObject_AllocateBuffer_488D3
		pop	cx
		mov	word ptr [di], 3008h
		push	[bp+var_4]
		push	di
		push	cs
		call	near ptr sub_77F20
		add	sp, 4
		mov	ax, di
		jmp	short loc_78447

loc_78445:
		mov	ax, di

loc_78447:
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		inc	[bp+var_2]

loc_78450:
		push	0
		push	large 594E4954h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_784B1
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_784B1
		mov	[bp+var_6], si
		push	19h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_784A5
		push	ax
		call	GlyphObject_AllocateBuffer_488D3
		pop	cx
		mov	word ptr [di], 3008h
		push	[bp+var_6]
		push	di
		push	cs
		call	near ptr sub_77F20
		add	sp, 4
		mov	ax, di
		jmp	short loc_784A7

loc_784A5:
		mov	ax, di

loc_784A7:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		inc	[bp+var_2]

loc_784B1:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_784B8:
		push	1
		push	large 544E4F46h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_784D0
		jmp	loc_783F0

loc_784D0:
		cmp	[bp+var_2], 0
		jnz	short loc_784DF
		push	7011h
		call	sub_9D47
		pop	cx

loc_784DF:
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_78523
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ch], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+98h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ah], ax
		jmp	short loc_7855A

loc_78523:
		mov	bx, word_5DD44
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

loc_7855A:
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_78572
		jmp	loc_7860F

loc_78572:
		mov	eax, [si+72h]
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
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
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_4A3E2
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		jmp	short loc_78618

loc_7860F:
		push	7012h
		call	sub_9D47
		pop	cx

loc_78618:
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_47C50
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
		add	ax, dx
		mov	es:[bx+9Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_783DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_MeasureAndAllocateB_15AA8 (sub_15AA8 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_MeasureAndAllocateB_8022A (sub_8022A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine allocateur typé et Font_ComputeGlyphBoundingBox_5E74E.
; ==============================================================================================
GlyphObject_MeasureAndAllocateB_78677		proc far

var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
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
		mov	[bp+var_2], 0
		xor	di, di
		mov	[bp+var_4], 0
		jmp	short loc_786F4

loc_7869C:
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
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		call	sub_47C50
		mov	dx, [bp+var_A]
		sub	dx, [bp+var_E]
		inc	dx
		cmp	di, si
		jnb	short loc_786DD
		cmp	dx, di
		ja	short loc_786E9

loc_786DD:
		cmp	di, si
		jbe	short loc_786F1
		cmp	dx, di
		jnb	short loc_786F1
		cmp	dx, si
		jb	short loc_786F1

loc_786E9:
		mov	ax, [bp+var_4]
		mov	[bp+var_2], ax
		mov	di, dx

loc_786F1:
		inc	[bp+var_4]

loc_786F4:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		cmp	ax, [bp+var_4]
		ja	short loc_7869C
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
GlyphObject_MeasureAndAllocateB_78677		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_78707		proc far

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		xor	dx, dx
		jmp	short loc_78731

loc_78711:
		mov	cx, [bp+var_2]
		mov	bx, cx
		add	bx, 0FF9Fh
		cmp	bx, 19h
		ja	short loc_78725
		mov	cx, bx
		add	cx, 41h
		jmp	short loc_78725

loc_78725:
		mov	ax, cx
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	es:[bx+10h], al
		inc	dx

loc_78731:
		les	bx, [bp+arg_4]
		add	bx, dx
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_78747
		cmp	dx, 80h
		jl	short loc_78711

loc_78747:
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	byte ptr es:[bx+10h], 0
		mov	ax, [bp+arg_0]
		add	ax, 10h
		push	[bp+arg_2]
		push	ax
		mov	bx, [bp+arg_0]
		push	word ptr es:[bx]
		push	cs
		call	near ptr sub_78090
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+90h], ax
		push	word ptr es:[bx+90h]
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocateB_78677
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+96h], ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	large 0
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_47C50
		mov	cx, [bp+var_6]
		sub	cx, [bp+var_A]
		inc	cx
		les	bx, [bp+arg_0]
		add	cx, es:[bx+90h]
		push	cx
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		push	large 0
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	2
		call	sub_47C50
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_12]
		inc	ax
		pop	cx
		add	cx, ax
		mov	bx, word_5DD44
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		sub	ax, cx
		sar	ax, 1
		les	bx, [bp+arg_0]
		mov	es:[bx+92h], ax
		mov	ax, es:[bx+9Ch]
		mov	es:[bx+94h], ax
		mov	ax, es:[bx+92h]
		mov	bx, es:[bx+0A9h]
		mov	[bx+4], ax
		mov	bx, [bp+arg_0]
		add	ax, cx
		dec	ax
		mov	bx, es:[bx+0A9h]
		mov	[bx+8], ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		mov	bx, es:[bx+0A9h]
		mov	[bx+6], ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_14], ax
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	large 0
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_14]
		call	sub_47C50
		mov	ax, [bp+var_16]
		sub	ax, [bp+var_1A]
		inc	ax
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9Ch]
		add	dx, ax
		dec	dx
		mov	bx, es:[bx+0A9h]
		mov	[bx+0Ah], dx
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+4], ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+6]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+6], ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+8], ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+0Ah]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+0Ah], ax
		leave
		retf
sub_78707		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_788E6		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jz	short loc_78912
		mov	byte ptr es:[bx+0A0h], 0
		xor	eax, eax
		mov	es:[bx+0A1h], eax
		mov	es:[bx+0A5h], eax
		mov	byte ptr es:[bx+0ADh], 1

loc_78912:
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_78707
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 1
		cmp	[bp+arg_8], 200h
		jnz	short loc_78940
		mov	dword ptr es:[bx+0A1h], 100h
		jmp	short loc_78955

loc_78940:
		mov	eax, [bp+arg_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0A1h], eax

loc_78955:
		leave
		retf
sub_788E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_78957		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_78980
		push	0
		push	si
		call	sub_48B6C
		add	sp, 4
		test	di, 1
		jz	short loc_78980
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_78980

loc_78980:
		pop	di
		pop	si
		pop	bp
		retf
sub_78957		endp
ovr223		ends
