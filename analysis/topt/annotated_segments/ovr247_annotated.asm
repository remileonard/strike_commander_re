ovr247		segment	para public 'OVERLAY' use16
		assume cs:ovr247
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEFF0		proc far

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
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	large [bp+var_12]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
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
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	si
		call	sub_36C9D
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
		push	0
		push	0
		push	0
		mov	al, [si+6]
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	61h
		call	sub_35BAA
		cmp	[bp+var_1C], 0
		jnz	short loc_BF104
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	0
		push	0
		push	0
		mov	al, [si+6]
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h
		call	sub_35BAA

loc_BF104:
		mov	ax, [bp+var_1C]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_20]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[si+17h], ax
		mov	ax, [si+17h]
		mov	[bp+var_22], ax
		mov	ax, [bp+var_22]
		mov	[si+0Eh], ax
		cmp	[bp+var_5], 0
		jz	short loc_BF145
		cmp	[bp+var_A], 0
		jz	short loc_BF145
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BF145

loc_BF145:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf
sub_BEFF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; GlyphObject_MeasureWrapperB_C754D (sub_C754D de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GlyphObject_MeasureWrapperB_7FC55 (sub_7FC55 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; GlyphObject_MeasureChar_6064A.
; ==============================================================================================
GlyphObject_MeasureWrapperB_BF15D		proc far

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
		xor	di, di
		mov	[bp+var_4], 0
		jmp	short loc_BF183

loc_BF171:
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_36E99
		add	sp, 4
		add	di, ax
		inc	[bp+var_4]

loc_BF183:
		les	bx, [bp+arg_2]
		add	bx, [bp+var_4]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_BF171
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GlyphObject_MeasureWrapperB_BF15D		endp

; START OF FUNCTION CHUNK FOR GlyphObject_MeasureWrapperB_BF15D
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR GlyphObject_MeasureWrapperB_BF15D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; GlyphObject_ResolveAndMeasureB_C758E (sub_C758E de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à GlyphObject_ResolveAndMeasureB_7FC92 (sub_7FC92 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine GlyphObject_ResolveAndCache_605CE et GlyphObject_MeasureChar_6064A.
; ==============================================================================================
GlyphObject_ResolveAndMeasureB_BF19E		proc far

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
		mov	[bp+var_2], di
		mov	ax, [si+17h]
		inc	ax
		mov	[bp+var_4], ax
		mov	[bp+var_8], 0
		jmp	short loc_BF1F8

loc_BF1BD:
		cmp	[bp+var_6], 0Ah
		jnz	short loc_BF1CE
		mov	di, [bp+var_2]
		mov	ax, [bp+var_4]
		add	[bp+arg_6], ax
		jmp	short loc_BF1F5

loc_BF1CE:
		push	[bp+arg_6]
		push	di
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	[bp+arg_2]
		push	si
		call	GlyphObject_ResolveAndCache_36E1D
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_36E99
		add	sp, 4
		mov	dx, di
		add	dx, ax
		mov	di, dx

loc_BF1F5:
		inc	[bp+var_8]

loc_BF1F8:
		les	bx, [bp+arg_8]
		add	bx, [bp+var_8]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_6], ax
		or	ax, ax
		jnz	short loc_BF1BD
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GlyphObject_ResolveAndMeasureB_BF19E		endp

; START OF FUNCTION CHUNK FOR GlyphObject_ResolveAndMeasureB_BF19E
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR GlyphObject_ResolveAndMeasureB_BF19E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF213		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_BF235
		push	large 0AEh
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_BF27B

loc_BF235:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+6], 0
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Ah], 2
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Bh], 0
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+0Ch], 0
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+4], 0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A1h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A5h
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 0

loc_BF27B:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_BF213		endp

; START OF FUNCTION CHUNK FOR sub_BF213
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BF213

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF285		proc far

var_FC		= word ptr -0FCh
var_9F		= dword ptr -9Fh
var_9B		= dword ptr -9Bh
var_97		= dword ptr -97h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_54		= word ptr -54h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0FCh
		push	si
		push	di
		push	seg seg182
		push	0
		push	ds
		push	offset aPLAQUES
		push	ds
		push	offset aCOCKPITS
		lea	ax, [bp+var_54]
		push	ax
		call	Path_BuildWithFolder_11166
		add	sp, 0Eh
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_FC], 480h
		mov	[bp+var_9B], 100h
		mov	[bp+var_9F], 0
		mov	[bp+var_FC], 498h
		mov	[bp+var_80], 0
		xor	ax, ax
		mov	[bp+var_82], ax
		movsx	eax, ax
		mov	[bp+var_97], eax
		push	large dword_4CA2B
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_InitAndValidate_425E0
		add	sp, 8
		or	ax, ax
		jz	short loc_BF323
		lea	ax, [bp+var_FC]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_BF4FA
		add	sp, 6
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		jmp	short loc_BF32E

loc_BF323:
		push	7010h
		call	sub_13451
		add	sp, 2

loc_BF32E:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 0
		mov	ax, word_4D36E
		mov	[bp+var_2], ax
		push	0Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_BF366
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		push	[bp+var_2]
		push	si
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, si
		jmp	short loc_BF368

loc_BF366:
		mov	ax, si

loc_BF368:
		les	bx, [bp+arg_0]
		mov	es:[bx+0A9h], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0A9h]
		mov	[bp+var_4], ax
		push	0Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_BF3A4
		mov	word ptr [di], 0
		mov	word ptr [di+2], 0
		push	[bp+var_4]
		push	di
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, di
		jmp	short loc_BF3A6

loc_BF3A4:
		mov	ax, di

loc_BF3A6:
		les	bx, [bp+arg_0]
		mov	es:[bx+0ABh], ax
		mov	[bp+var_FC], 498h
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_BF285		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF3D4		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Bh], 0
		jz	short loc_BF416
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+6], 0
		jz	short loc_BF416
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+6]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BF416

loc_BF416:
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Bh], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Ch], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0ABh], 0
		jz	short loc_BF463
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		call	sub_39C
		add	sp, 2
		jmp	short loc_BF463

loc_BF463:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0ABh], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0A9h], 0
		jz	short loc_BF49A
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0A9h]
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0A9h]
		call	sub_39C
		add	sp, 2
		jmp	short loc_BF49A

loc_BF49A:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0A9h], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0
		jz	short loc_BF4C4
		push	3
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_BF4C4

loc_BF4C4:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_BF4EF
		push	3
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_BF4EF

loc_BF4EF:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		leave
		retf
sub_BF3D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF4FA		proc far

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		jmp	loc_BF5E9

loc_BF50D:
		push	0
		push	large 45444957h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BF571
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BF571
		mov	[bp+var_4], si
		push	19h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_BF566
		push	di
		call	GlyphObject_AllocateBuffer_36D18
		add	sp, 2
		mov	word ptr [di], 4050h
		push	[bp+var_4]
		push	di
		push	cs
		call	near ptr sub_BEFF0
		add	sp, 4
		mov	ax, di
		jmp	short loc_BF568

loc_BF566:
		mov	ax, di

loc_BF568:
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		inc	[bp+var_2]

loc_BF571:
		push	0
		push	large 594E4954h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BF5E0
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BF5E0
		mov	[bp+var_6], si
		push	19h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_BF5D3
		push	[bp+var_8]
		call	GlyphObject_AllocateBuffer_36D18
		add	sp, 2
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 4050h
		push	[bp+var_6]
		push	[bp+var_8]
		push	cs
		call	near ptr sub_BEFF0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_BF5D6

loc_BF5D3:
		mov	ax, [bp+var_8]

loc_BF5D6:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		inc	[bp+var_2]

loc_BF5E0:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_BF5E9:
		push	1
		push	large 544E4F46h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jz	short loc_BF601
		jmp	loc_BF50D

loc_BF601:
		cmp	[bp+var_2], 2
		jz	short loc_BF612
		push	7011h
		call	sub_13451
		add	sp, 2

loc_BF612:
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BF65C
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ch], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+98h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ah], ax
		jmp	short loc_BF6A3

loc_BF65C:
		mov	bx, word_4D36E
		mov	ax, [bx+0Ah]
		mov	bx, word_4D36E
		sub	ax, [bx+6]
		inc	ax
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ch], ax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+98h], 2
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+9Ah], 2
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		mov	dx, [bx+17h]
		inc	dx
		sub	ax, dx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ch], ax

loc_BF6A3:
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_BF6BB
		jmp	loc_BF781

loc_BF6BB:
		mov	[bp+var_A], si
		mov	bx, [bp+var_A]
		mov	eax, [bx+72h]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	large [bp+var_12]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_16]
		mov	es:[bx+6], eax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ah], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Bh], 1
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Ch], 0
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_12]
		mov	es:[bx+0Ch], eax
		push	large [bp+var_E]
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_A]
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		jmp	short loc_BF78C

loc_BF781:
		push	7012h
		call	sub_13451
		add	sp, 2

loc_BF78C:
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_35BAA
		mov	ax, [bp+var_1A]
		sub	ax, [bp+var_1E]
		inc	ax
		mov	[bp+var_18], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ah]
		shl	ax, 1
		mov	dx, [bp+var_18]
		sub	dx, ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		sub	dx, [bx+17h]
		shr	dx, 1
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ah]
		add	ax, dx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_BF4FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF7F8		proc far

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
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+98h]
		shl	ax, 1
		add	[bp+arg_4], ax
		mov	[bp+var_2], 0
		xor	si, si
		xor	di, di
		jmp	short loc_BF87B

loc_BF818:
		mov	[bp+var_6], di
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		call	sub_35BAA
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_E]
		inc	ax
		mov	[bp+var_4], ax
		cmp	si, [bp+arg_4]
		jnb	short loc_BF862
		cmp	[bp+var_4], si
		ja	short loc_BF874

loc_BF862:
		cmp	si, [bp+arg_4]
		jbe	short loc_BF87A
		cmp	[bp+var_4], si
		jnb	short loc_BF87A
		mov	ax, [bp+var_4]
		cmp	ax, [bp+arg_4]
		jb	short loc_BF87A

loc_BF874:
		mov	[bp+var_2], di
		mov	si, [bp+var_4]

loc_BF87A:
		inc	di

loc_BF87B:
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], di
		ja	short loc_BF818
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_BF7F8		endp

; START OF FUNCTION CHUNK FOR sub_BF7F8
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BF7F8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF88F		proc far

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		xor	si, si
		jmp	short loc_BF8C2

loc_BF89B:
		mov	di, [bp+var_2]
		mov	ax, di
		add	ax, 0FFBFh
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 19h
		ja	short loc_BF8B6
		mov	ax, [bp+var_4]
		add	ax, 61h
		mov	di, ax
		jmp	short loc_BF8B6

loc_BF8B6:
		mov	ax, di
		les	bx, [bp+arg_0]
		add	bx, si
		mov	es:[bx+10h], al
		inc	si

loc_BF8C2:
		les	bx, [bp+arg_4]
		add	bx, si
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_BF8D8
		cmp	si, 80h
		jl	short loc_BF89B

loc_BF8D8:
		les	bx, [bp+arg_0]
		add	bx, si
		mov	byte ptr es:[bx+10h], 0
		mov	ax, [bp+arg_0]
		add	ax, 10h
		push	[bp+arg_2]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		push	cs
		call	near ptr GlyphObject_MeasureWrapperB_BF15D
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+90h], ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+90h]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_BF7F8
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+96h], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_8], ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		call	sub_35BAA
		mov	ax, [bp+var_C]
		sub	ax, [bp+var_10]
		inc	ax
		mov	[bp+var_6], ax
		mov	bx, word_4D36E
		mov	ax, [bx+8]
		mov	bx, word_4D36E
		sub	ax, [bx+4]
		inc	ax
		sub	ax, [bp+var_6]
		sar	ax, 1
		les	bx, [bp+arg_0]
		mov	es:[bx+92h], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+94h], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+92h]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+4], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+92h]
		add	ax, [bp+var_6]
		dec	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+8], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+6], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_12], ax
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_12]
		call	sub_35BAA
		mov	ax, [bp+var_14]
		sub	ax, [bp+var_18]
		inc	ax
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9Ch]
		add	dx, ax
		dec	dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+0Ah], dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+4]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+4], ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+6]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+6], ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+8]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+8], ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+0Ah]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+0Ah], ax
		pop	di
		pop	si
		leave
		retf
sub_BF88F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFA86		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jz	short loc_BFABE
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 0
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0A1h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+0A5h], eax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 1

loc_BFABE:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_BF88F
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 1
		mov	eax, [bp+arg_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+0A1h], eax
		leave
		retf
sub_BFA86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFAF1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_BFB1E
		push	0
		push	si
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		test	di, 1
		jz	short loc_BFB1C
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_BFB1C

loc_BFB1C:
		jmp	short loc_BFB1E

loc_BFB1E:
		pop	di
		pop	si
		pop	bp
		retf
sub_BFAF1		endp

; START OF FUNCTION CHUNK FOR sub_BFAF1
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BFAF1
ovr247		ends
