seg027		segment	para public 'CODE' use16
		assume cs:seg027
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13F53		proc far

var_5E		= word ptr -5Eh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Eh
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+73h], 0
		mov	word ptr [si+6Dh], 0
		mov	word ptr [si+6Fh], 0
		xor	dx, dx
		jmp	short loc_13F7C

loc_13F6F:
		mov	bx, dx
		cmp	byte ptr [bx+1278h], 0
		jz	short loc_13F7B
		mov	[si+71h], dl

loc_13F7B:
		inc	dx

loc_13F7C:
		cmp	dx, 7
		jl	short loc_13F6F
		xor	dx, dx
		jmp	short loc_13F9B

loc_13F85:
		mov	bx, dx
		cmp	byte ptr [bx+1278h], 0
		jz	short loc_13F9A
		mov	al, [si+71h]
		mov	ah, 0
		cmp	ax, dx
		jz	short loc_13F9A
		mov	[si+72h], dl

loc_13F9A:
		inc	dx

loc_13F9B:
		cmp	dx, 7
		jl	short loc_13F85
		push	word_5DD44
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	word ptr [si+10h], 0
		mov	word ptr [si+12h], 18h
		mov	word ptr [si+14h], 13Fh
		mov	word ptr [si+16h], 97h
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	word ptr [si+22h], 13Fh
		mov	word ptr [si+24h], 0C7h
		push	0
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		push	ds
		push	offset unk_5B043
		push	ds
		push	offset aConvfontShp
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	2
		lea	ax, [bp+var_5E]
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 2
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		lea	ax, word ptr [bp+var_A]
		push	ax
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	sub_48858
		add	sp, 4
		mov	ax, word_5CF9F
		mov	[si+6Bh], ax
		cmp	[bp+var_5], 0
		jz	short loc_14082
		cmp	[bp+var_A], 0
		jz	short loc_14082
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_14082

loc_14082:
		pop	si
		leave
		retf
sub_13F53		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14085		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_140A1
		push	76h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_140A1
		jmp	loc_1413D

loc_140A1:
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	dword ptr [si+8], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	byte ptr [si+19h], 0
		mov	word ptr [si+1Ah], 0
		mov	word ptr [si+1Ch], 0
		mov	byte ptr [si+27h], 0
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	GlyphObject_AllocateBuffer_488D3
		pop	cx
		mov	word ptr [si+43h], 492h
		xor	ax, ax
		mov	[si+47h], ax
		mov	[si+45h], ax
		mov	word ptr [si+43h], 151Bh
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+65h], 2
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_16848
		pop	cx
		push	si
		push	cs
		call	near ptr sub_13F53
		pop	cx
		mov	ax, [bp+arg_4]
		mov	[si+28h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Ah], ax
		mov	ax, [bp+arg_2]
		mov	[si+74h], ax
		mov	bx, [si+28h]
		test	byte ptr [bx+6], 1
		jz	short loc_14136
		mov	byte ptr [si+73h], 1

loc_14136:
		push	si
		nop
		push	cs
		call	near ptr sub_142B8
		pop	cx

loc_1413D:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_14085		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14142		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1415E
		push	76h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_1415E
		jmp	loc_141EC

loc_1415E:
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	dword ptr [si+8], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	byte ptr [si+19h], 0
		mov	word ptr [si+1Ah], 0
		mov	word ptr [si+1Ch], 0
		mov	byte ptr [si+27h], 0
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	GlyphObject_AllocateBuffer_488D3
		pop	cx
		mov	word ptr [si+43h], 492h
		xor	ax, ax
		mov	[si+47h], ax
		mov	[si+45h], ax
		mov	word ptr [si+43h], 151Bh
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+65h], 2
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_16848
		pop	cx
		push	si
		push	cs
		call	near ptr sub_13F53
		pop	cx
		mov	ax, [bp+arg_4]
		mov	[si+28h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Ah], ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_144C1
		add	sp, 4

loc_141EC:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_14142		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_141F1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_14203
		jmp	loc_142B4

loc_14203:
		push	si
		nop
		push	cs
		call	near ptr sub_14588
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_145B0
		pop	cx
		mov	word ptr [si+43h], 151Bh
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_1686F
		pop	cx
		cmp	byte ptr [si+66h], 0
		jz	short loc_14248
		cmp	dword ptr [si+61h], 0
		jz	short loc_14248
		push	0
		mov	al, [si+65h]
		push	ax
		mov	ax, si
		add	ax, 61h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_14248

loc_14248:
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	word ptr [si+43h], 492h
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_4870F
		pop	cx
		push	2
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	sub_48B6C
		add	sp, 4
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_142B4
		push	si
		call	sub_33B
		pop	cx

loc_142B4:
		pop	di
		pop	si
		pop	bp
		retf
sub_141F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_142B8		proc far

var_1DC		= word ptr -1DCh
var_1CE		= word ptr -1CEh
var_164		= word ptr -164h
var_156		= word ptr -156h
var_F5		= dword ptr -0F5h
var_F1		= dword ptr -0F1h
var_DE		= word ptr -0DEh
var_7D		= dword ptr -7Dh
var_71		= word ptr -71h
var_6D		= dword ptr -6Dh
var_66		= word ptr -66h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1DCh
		push	si
		mov	si, [bp+arg_0]
		push	ds
		push	offset aPak
		push	ds
		push	offset aConv
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_66]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	word ptr [si+74h]
		lea	ax, [bp+var_DE]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [bp+var_71]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_1430F
		mov	eax, [bp+var_7D]
		jmp	short loc_14313

loc_1430F:
		mov	eax, [bp+var_6D]

loc_14313:
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	dx
		push	ax
		push	word ptr [si+74h]
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_54A85
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+var_4]
		mov	[bp+var_E], ax
		mov	eax, [bp+var_C]
		mov	[si+4], eax
		mov	[si], eax
		movzx	eax, [bp+var_E]
		mov	[si+8], eax
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_527AA
		pop	cx
		lea	ax, [bp+var_156]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4C3A
		pop	cx
		cmp	word ptr [si+6Bh], 0
		jnz	short loc_14383
		jmp	loc_144A0

loc_14383:
		cmp	byte_5B3DC, 0
		jz	short loc_143F0
		push	word ptr [si+74h]
		push	1324h
		lea	ax, [bp+var_164]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	ss
		lea	ax, [bp+var_164]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_143F0
		lea	ax, [bp+var_1DC]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	1
		lea	ax, [bp+var_164]
		push	ax
		lea	ax, [bp+var_1DC]
		push	ax
		mov	bx, [bp+var_1DC]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_1DC]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_14559
		add	sp, 4
		push	2
		lea	ax, [bp+var_1DC]

loc_143E4:
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		jmp	loc_144A0

loc_143F0:
		push	ds
		push	offset aPak
		push	ds
		push	offset aCdconvns
		push	ds
		push	offset aDataNoise
		lea	ax, [bp+var_66]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	ds
		lea	ax, [bp+var_66]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jnz	short loc_1441C
		jmp	loc_1449B

loc_1441C:
		push	1
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_156]
		push	ax
		mov	bx, [bp+var_156]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	word ptr [si+74h]
		lea	ax, [bp+var_156]
		push	ax
		call	sub_4EF9
		add	sp, 4
		mov	eax, [bp+var_F1]
		mov	[bp+var_12], eax
		add	eax, [bp+var_F5]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_12]
		cmp	eax, [bp+var_16]
		jz	short loc_1449B
		lea	ax, [bp+var_1CE]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	0
		push	large [bp+var_16]
		push	large [bp+var_12]
		lea	ax, [bp+var_156]
		push	ax
		lea	ax, [bp+var_1CE]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		lea	ax, [bp+var_1CE]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_14559
		add	sp, 4
		push	2
		lea	ax, [bp+var_1CE]
		jmp	loc_143E4

loc_1449B:
		mov	word ptr [si+6Bh], 0

loc_144A0:
		push	2
		lea	ax, [bp+var_156]
		push	ax
		call	IndexedRecordReader_Destruct_4BF0
		add	sp, 4
		push	2
		lea	ax, [bp+var_DE]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		pop	si
		leave
		retf
sub_142B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_144C1		proc far

var_6C		= word ptr -6Ch
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_ConstructVariantC_524DA
		add	sp, 6
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	large 0FFFFFFFFh
		push	large [bp+var_4]
		push	dx
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+var_4]
		mov	[bp+var_E], ax
		mov	eax, [bp+var_C]
		mov	[si+4], eax
		mov	[si], eax
		movzx	eax, [bp+var_E]
		mov	[si+8], eax
		lea	ax, [bp+var_6C]
		push	ax
		call	sub_527AA
		pop	cx
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_Close_52616
		add	sp, 4
		pop	si
		leave
		retf
sub_144C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14559		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	ax, [bx+5Dh]
		mov	[si+6Dh], ax
		xor	di, di
		jmp	short loc_1457F

loc_1456E:
		push	di
		push	[bp+arg_2]
		push	di
		push	word ptr [si+6Bh]
		call	sub_412F9
		add	sp, 8
		inc	di

loc_1457F:
		cmp	[si+6Dh], di
		jg	short loc_1456E
		pop	di
		pop	si
		pop	bp
		retf
sub_14559		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14588		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+6Bh], 0
		jz	short loc_145AC
		xor	di, di
		jmp	short loc_145A7

loc_1459A:
		push	di
		push	word ptr [si+6Bh]
		call	sub_41495
		add	sp, 4
		inc	di

loc_145A7:
		cmp	[si+6Dh], di
		jg	short loc_1459A

loc_145AC:
		pop	di
		pop	si
		pop	bp
		retf
sub_14588		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_145B0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		push	2
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		pop	bp
		retf
sub_145B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_GetSubpartAttrib_C23FE (sub_C23FE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Debris_GetSubpartAttrib (sub_381F2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,14L — accesseur d'un champ (+0x13 via référence +0xE) :
; getter d'un attribut de sous-composant.
; ==============================================================================================
Debris_GetSubpartAttrib_145C8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		les	bx, [bx+4]
		mov	al, es:[bx]
		pop	bp
		retf
Debris_GetSubpartAttrib_145C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_145D8		proc far

var_E2		= word ptr -0E2h
var_CE		= word ptr -0CEh
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0E2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_2], ax
		mov	[bp+var_4], ax
		mov	byte ptr [bp+var_CE], 0
		jmp	loc_1478B

loc_145FB:
		mov	ax, di
		sub	ax, [bp+var_4]
		push	ax
		push	[bp+var_4]
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_2D7D
		add	sp, 6
		cmp	byte ptr [di+1], 53h
		jnz	short loc_1462F
		mov	bx, [si+28h]
		push	word ptr [bx]

loc_1461C:
		lea	ax, [bp+var_CE]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_14788

loc_1462F:
		cmp	byte ptr [di+1], 4Eh
		jnz	short loc_1463D
		mov	bx, [si+28h]
		push	word ptr [bx+2]
		jmp	short loc_1461C

loc_1463D:
		cmp	byte ptr [di+1], 43h
		jnz	short loc_1464B
		mov	bx, [si+28h]
		push	word ptr [bx+4]
		jmp	short loc_1461C

loc_1464B:
		cmp	byte ptr [di+1], 57h
		jnz	short loc_14658
		mov	ax, [si+2Ah]
		inc	ax
		jmp	loc_14773

loc_14658:
		cmp	byte ptr [di+1], 4Ch
		jnz	short loc_14667
		mov	ax, [si+2Ah]
		add	ax, 15h
		jmp	loc_14773

loc_14667:
		cmp	byte ptr [di+1], 4Fh
		jnz	short loc_14676
		mov	ax, [si+2Ah]
		add	ax, 29h
		jmp	loc_14773

loc_14676:
		cmp	byte ptr [di+1], 41h
		jnz	short loc_14681
		mov	al, [si+71h]
		jmp	short loc_1468A

loc_14681:
		cmp	byte ptr [di+1], 42h
		jnz	short loc_14696
		mov	al, [si+72h]

loc_1468A:
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+126Ah]
		jmp	short loc_1461C

loc_14696:
		cmp	byte ptr [di+1], 50h
		jnz	short loc_146E1
		push	0Ah
		lea	ax, [bp+var_E2]
		push	ax
		mov	bx, [si+28h]
		push	word ptr [bx+7]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	1331h
		lea	ax, [bp+var_E2]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	bx, [si+28h]
		cmp	word ptr [bx+7], 1
		jz	short loc_146DA
		push	1338h
		lea	ax, [bp+var_E2]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_146DA:
		lea	ax, [bp+var_E2]
		jmp	loc_14773

loc_146E1:
		cmp	byte ptr [di+1], 54h
		jnz	short loc_1472B
		push	0Ah
		lea	ax, [bp+var_E2]
		push	ax
		mov	bx, [si+28h]
		push	word ptr [bx+9]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	133Ah
		lea	ax, [bp+var_E2]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	bx, [si+28h]
		cmp	word ptr [bx+9], 1
		jz	short loc_14725
		push	1341h
		lea	ax, [bp+var_E2]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_14725:
		lea	ax, [bp+var_E2]
		jmp	short loc_14773

loc_1472B:
		cmp	byte ptr [di+1], 4Bh
		jnz	short loc_14777
		push	0Ah
		lea	ax, [bp+var_E2]
		push	ax
		mov	bx, [si+28h]
		push	word ptr [bx+0Bh]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	1343h
		lea	ax, [bp+var_E2]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	bx, [si+28h]
		cmp	word ptr [bx+0Bh], 1
		jz	short loc_1476F
		push	134Ah
		lea	ax, [bp+var_E2]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_1476F:
		lea	ax, [bp+var_E2]

loc_14773:
		push	ax
		jmp	loc_1461C

loc_14777:
		inc	di
		push	134Ch
		lea	ax, [bp+var_CE]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_14788:
		mov	[bp+var_4], di

loc_1478B:
		push	24h
		push	[bp+var_4]
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	di, ax
		or	ax, ax
		jz	short loc_147A1
		jmp	loc_145FB

loc_147A1:
		push	[bp+var_4]
		lea	ax, [bp+var_CE]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		call	sub_45058
		pop	cx
		lea	ax, [bp+var_CE]
		push	ax
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_2], ax
		mov	si, [bp+var_2]
		mov	[bp+var_6], 4
		jmp	short loc_1480B

loc_147D2:
		cmp	dx, 1Eh
		jle	short loc_147E9
		mov	di, 1Eh
		jmp	short loc_147DD

loc_147DC:
		dec	di

loc_147DD:
		mov	bx, di
		cmp	byte ptr [bx+si], 20h
		jnz	short loc_147DC
		mov	byte ptr [bx+si], 0
		jmp	short loc_147EC

loc_147E9:
		mov	di, dx
		dec	di

loc_147EC:
		push	si
		push	2
		push	[bp+var_6]
		push	134Eh
		push	[bp+arg_2]
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		add	[bp+var_6], 0Fh
		mov	ax, di
		add	ax, si
		inc	ax
		mov	si, ax

loc_1480B:
		push	si
		call	CRT_Strlen
		pop	cx
		mov	dx, ax
		or	ax, ax
		jnz	short loc_147D2
		push	[bp+var_2]
		call	sub_45058
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_145D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14825		proc far

var_108		= word ptr -108h
var_AB		= dword ptr -0ABh
var_A7		= dword ptr -0A7h
var_A3		= dword ptr -0A3h
var_92		= dword ptr -92h
var_60		= word ptr -60h
var_10		= word ptr -10h
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 108h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		push	ds
		push	offset aIFF
		push	ds
		push	offset aConvdata
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_60]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_108]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_108], 9B5h
		mov	[bp+var_A7], 100h
		mov	[bp+var_AB], 0
		mov	[bp+var_108], 9CDh
		push	1
		lea	ax, [bp+var_60]
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		mov	bx, [bp+var_108]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+arg_2], 4
		jbe	short loc_14899
		push	1355h
		call	sub_9D78
		pop	cx

loc_14899:
		cmp	[bp+arg_2], 0
		jnz	short loc_148A8
		push	0
		push	large dword_5B09C
		jmp	short loc_148DC

loc_148A8:
		cmp	[bp+arg_2], 1
		jnz	short loc_148B7
		push	0
		push	large dword_5B0A1
		jmp	short loc_148DC

loc_148B7:
		cmp	[bp+arg_2], 2
		jnz	short loc_148C6
		push	0
		push	large dword_5B0A6
		jmp	short loc_148DC

loc_148C6:
		cmp	[bp+arg_2], 3
		jnz	short loc_148D5
		push	0
		push	large dword_5B0AB
		jmp	short loc_148DC

loc_148D5:
		push	0
		push	large dword_5B0B0

loc_148DC:
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		mov	[bp+var_1], 0
		jmp	short loc_14923

loc_148EF:
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_10]
		push	ax
		push	[bp+arg_4]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_14919
		mov	[bp+var_1], 1
		jmp	short loc_1493B

loc_14919:
		mov	eax, [bp+var_92]
		mov	[bp+var_A3], eax

loc_14923:
		push	1
		push	large dword_5B0B5
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_148EF

loc_1493B:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_14955
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		push	139Ah
		call	sub_9D78
		add	sp, 4

loc_14955:
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_2], al
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		cmp	[bp+arg_2], 0
		jz	short loc_1497A
		cmp	[bp+arg_2], 1
		jnz	short loc_14984

loc_1497A:
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvshps
		jmp	short loc_1498C

loc_14984:
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvpals

loc_1498C:
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_60]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	al, [bp+var_2]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_16901
		add	sp, 6
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_6], eax
		mov	al, [si+4]
		mov	[bp+var_7], al
		mov	eax, [bp+var_6]
		mov	[di], eax
		mov	al, [bp+var_7]
		mov	[di+4], al
		mov	byte ptr [di+5], 0
		mov	dword ptr [di+6], 0
		mov	eax, [si+6]
		mov	[di+6], eax
		mov	[bp+var_108], 9CDh
		lea	ax, [bp+var_108]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_108]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_14825		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14A08		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	0
		push	dx
		push	cs
		call	near ptr sub_14825
		add	sp, 0Ah
		pop	bp
		retf
sub_14A08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14A24		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	cl, [bp+arg_4]
		cmp	[bp+arg_6], 0
		jnz	short loc_14A3D
		push	cx
		push	bx
		push	13C9h
		jmp	short loc_14A42

loc_14A3D:
		push	cx
		push	bx
		push	13D0h

loc_14A42:
		push	2
		push	dx
		push	cs
		call	near ptr sub_14825
		add	sp, 0Ah
		pop	bp
		retf
sub_14A24		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14A4E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	1
		push	dx
		push	cs
		call	near ptr sub_14825
		add	sp, 0Ah
		pop	bp
		retf
sub_14A4E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14A6A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	13D6h
		push	3
		push	dx
		push	cs
		call	near ptr sub_14825
		add	sp, 0Ah
		pop	bp
		retf
sub_14A6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14A86		proc far

var_25C		= word ptr -25Ch
var_20C		= word ptr -20Ch
var_1BC		= word ptr -1BCh
var_16C		= word ptr -16Ch
var_11C		= word ptr -11Ch
var_BF		= dword ptr -0BFh
var_BB		= dword ptr -0BBh
var_B7		= dword ptr -0B7h
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_74		= word ptr -74h
var_23		= byte ptr -23h
var_22		= dword ptr -22h
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_B		= byte ptr -0Bh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 25Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	ds
		push	offset aIFF
		push	ds
		push	offset aConvdata
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_74]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_11C]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_11C], 9B5h
		mov	[bp+var_BB], 100h
		mov	[bp+var_BF], 0
		mov	[bp+var_11C], 9CDh
		push	1
		lea	ax, [bp+var_74]
		push	ax
		lea	ax, [bp+var_11C]
		push	ax
		mov	bx, [bp+var_11C]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwishps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_16C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwipals
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_1BC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvshps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_20C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvpals
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_25C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	[bp+var_1], 0
		mov	[bp+var_4], 0
		push	0
		push	large dword_5B0FD
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		jmp	short loc_14BDB

loc_14B6E:
		mov	[bp+var_4], 1
		push	0
		push	large dword_5B107
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_14BBD
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	si
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_14BC6
		mov	[bp+var_1], 1
		jmp	short loc_14BF6

loc_14BBD:
		push	13ECh
		call	sub_9D78
		pop	cx

loc_14BC6:
		mov	eax, [bp+var_A6]
		mov	[bp+var_B7], eax
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_14BDB:
		push	1
		push	large dword_5B102
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_14BF6
		jmp	loc_14B6E

loc_14BF6:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_14C12
		lea	ax, [bp+var_74]
		push	ax
		push	si
		push	[bp+var_4]
		push	140Eh
		call	sub_9D78
		add	sp, 8

loc_14C12:
		mov	eax, [bp+var_A6]
		mov	[bp+var_B7], eax
		push	0
		push	large dword_5B17A
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_14C37
		jmp	loc_14F2C

loc_14C37:
		mov	eax, [bp+var_AA]
		mov	ebx, 5
		cdq
		idiv	ebx
		mov	[bp+var_5], al
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	11h
		mov	ah, 0
		push	ax
		push	large 0A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	bx, [bp+arg_4]
		mov	[bx], ax
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	11h
		mov	al, [bp+var_5]
		mov	ah, 0
		push	ax
		push	large 0A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	bx, [bp+arg_6]
		mov	[bx], ax
		mov	al, [bp+var_5]
		mov	ah, 0
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	bx, [bp+arg_8]
		mov	[bx], ax
		mov	[bp+var_8], 0
		jmp	loc_14F13

loc_14CA4:
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_9], al
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_A], al
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_B], al
		cmp	[bp+var_9], 0
		jz	short loc_14CD7
		jmp	loc_14DFE

loc_14CD7:
		mov	al, [bp+var_A]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_20C]
		push	ax
		mov	ax, di
		add	ax, 43h
		push	ax
		call	sub_16901
		add	sp, 6
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_10], eax
		mov	al, [bx+4]
		mov	[bp+var_11], al
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	ax, word ptr [bp+var_10+2]
		mov	dx, word ptr [bp+var_10]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_11]
		mov	[bx+4], al
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	si, cx
		mov	eax, [si+6]
		mov	[bx+6], eax
		mov	al, [bp+var_B]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_25C]
		push	ax
		mov	ax, di
		add	ax, 43h
		push	ax
		call	sub_16901
		add	sp, 6
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_16], eax
		mov	al, [bx+4]
		mov	[bp+var_17], al
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_17]

loc_14DBB:
		mov	[bx+4], al
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	si, cx
		mov	eax, [si+6]
		mov	[bx+6], eax
		jmp	loc_14EF7

loc_14DFE:
		cmp	[bp+var_9], 1
		jz	short loc_14E07
		jmp	loc_14EEE

loc_14E07:
		mov	al, [bp+var_A]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		mov	ax, di
		add	ax, 43h
		push	ax
		call	sub_16901
		add	sp, 6
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		mov	al, [bx+4]
		mov	[bp+var_1D], al
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	ax, word ptr [bp+var_1C+2]
		mov	dx, word ptr [bp+var_1C]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_1D]
		mov	[bx+4], al
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	si, cx
		mov	eax, [si+6]
		mov	[bx+6], eax
		mov	al, [bp+var_B]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_1BC]
		push	ax
		mov	ax, di
		add	ax, 43h
		push	ax
		call	sub_16901
		add	sp, 6
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_22], eax
		mov	al, [bx+4]
		mov	[bp+var_23], al
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	ax, word ptr [bp+var_22+2]
		mov	dx, word ptr [bp+var_22]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, [bp+var_8]
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_23]
		jmp	loc_14DBB

loc_14EEE:
		push	145Fh
		call	sub_9D78
		pop	cx

loc_14EF7:
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	dx, [bp+var_8]
		shl	dx, 1
		mov	bx, [bp+arg_8]
		mov	bx, [bx]
		add	bx, dx
		mov	[bx], ax
		inc	[bp+var_8]

loc_14F13:
		mov	al, [bp+var_5]
		mov	ah, 0
		cmp	ax, [bp+var_8]
		jle	short loc_14F20
		jmp	loc_14CA4

loc_14F20:
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_Helper_53B24
		jmp	short loc_14F34

loc_14F2C:
		push	1480h
		call	sub_9D78

loc_14F34:
		pop	cx
		mov	al, [bp+var_5]
		mov	[bp+var_6], al
		mov	[bp+var_11C], 9CDh
		lea	ax, [bp+var_11C]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_11C]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	al, [bp+var_6]
		pop	di
		pop	si
		leave
		retf
sub_14A86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14F62		proc far

var_1F4		= word ptr -1F4h
var_1F2		= word ptr -1F2h
var_1F0		= word ptr -1F0h
var_1EE		= word ptr -1EEh
var_1E4		= word ptr -1E4h
var_16C		= word ptr -16Ch
var_11C		= word ptr -11Ch
var_11A		= byte ptr -11Ah
var_119		= word ptr -119h
var_110		= dword ptr -110h
var_10C		= word ptr -10Ch
var_10B		= word ptr -10Bh
var_108		= word ptr -108h
var_102		= dword ptr -102h
var_FE		= word ptr -0FEh
var_CE		= word ptr -0CEh
var_CC		= byte ptr -0CCh
var_CB		= word ptr -0CBh
var_C2		= byte ptr -0C2h
var_C1		= word ptr -0C1h
var_B8		= dword ptr -0B8h
var_B4		= word ptr -0B4h
var_B2		= byte ptr -0B2h
var_B1		= byte ptr -0B1h
var_B0		= word ptr -0B0h
var_AE		= word ptr -0AEh
var_A8		= word ptr -0A8h
var_A6		= byte ptr -0A6h
var_A5		= word ptr -0A5h
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= byte ptr -98h
var_97		= word ptr -97h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_7F		= word ptr -7Fh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_71		= word ptr -71h
var_6F		= byte ptr -6Fh
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= byte ptr -5Ch
var_5B		= byte ptr -5Bh
var_5A		= word ptr -5Ah
var_57		= word ptr -57h
var_56		= word ptr -56h
var_54		= byte ptr -54h
var_53		= word ptr -53h
var_50		= dword ptr -50h
var_4C		= byte ptr -4Ch
var_4B		= byte ptr -4Bh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_43		= word ptr -43h
var_41		= byte ptr -41h
var_40		= dword ptr -40h
var_3D		= word ptr -3Dh
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_29		= word ptr -29h
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1B		= word ptr -1Bh
var_19		= byte ptr -19h
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_C		= word ptr -0Ch
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1E4h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	byte_603DE, 0
		mov	[bp+var_17], 0
		mov	byte ptr [bp+var_C], 0
		mov	byte ptr [bp+var_16], 0
		mov	bx, [di+2Ah]
		mov	byte ptr [bx], 0
		mov	[bp+var_18], 0
		jmp	loc_16739

loc_14F91:
		mov	[bp+var_19], 0
		call	sub_1F377
		les	bx, [di+4]
		inc	word ptr [di+4]
		mov	al, es:[bx]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 13h
		jbe	short loc_14FAF
		jmp	loc_1672A

loc_14FAF:
		shl	bx, 1
		jmp	cs:off_16757[bx]	; switch jump
		jmp	loc_16733

loc_14FB9:
		cmp	byte_603DE, 0
		jz	short loc_14FC3
		jmp	loc_16753

loc_14FC3:
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_1E], ax
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_469A5
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_7C], 0
		mov	[bp+var_7A], 0
		mov	[bp+var_6F], 0
		push	word_5DD42
		lea	ax, [bp+var_7C]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_78], 0
		mov	[bp+var_76], 0
		mov	[bp+var_74], 13Fh
		mov	[bp+var_72], 0C7h
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_9C]
		push	ax
		call	LayerGroup_Construct_45C22
		add	sp, 8
		mov	[bp+var_A8], 150Bh
		mov	[bp+var_A6], 0
		mov	[bp+var_A8], 1513h
		push	di
		lea	ax, [bp+var_A8]
		push	ax
		call	ConvRec_ReadName_18AAF
		add	sp, 4
		lea	ax, [bp+var_A5]
		mov	[bp+var_26], ax
		lea	ax, word ptr [bp+var_2E+2]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	[bp+var_26]
		push	di
		push	cs
		call	near ptr sub_14A86
		add	sp, 0Ah
		mov	byte ptr [bp+var_2E+1], al
		xor	si, si
		jmp	short loc_150AA

loc_15076:
		mov	ax, si
		shl	ax, 1
		mov	bx, word ptr [bp+var_2E+2]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+var_28]
		add	dx, ax
		push	dx
		push	0
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [bp+var_32], ax
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		inc	si

loc_150AA:
		mov	al, byte ptr [bp+var_2E+1]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_15076
		xor	si, si
		jmp	short loc_150F8

loc_150B7:
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+var_2A]
		add	dx, ax
		mov	word ptr [bp+var_3A+2], dx
		mov	word ptr [bp+var_34+1], 0
		push	dx
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	[bp+var_36]
		mov	al, byte ptr [bp+var_34]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46E08
		pop	cx
		inc	si

loc_150F8:
		mov	al, byte ptr [bp+var_2E+1]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_150B7
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_10C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word ptr [bp+var_32+2], 0
		jmp	loc_151FE

loc_15124:
		inc	word ptr [di+4]
		mov	[bp+var_11C], 150Bh
		mov	[bp+var_11A], 1
		mov	[bp+var_11C], 1503h
		push	di
		lea	ax, [bp+var_11C]
		push	ax
		call	ConvRec_ReadFigure_18C04
		add	sp, 4
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwishps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_16C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_16C]
		push	ax
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		lea	ax, [bp+var_119]
		mov	word ptr [bp+var_32], ax
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	word ptr [bp+var_34], ax
		mov	bx, word ptr [bp+var_34]
		add	bx, word ptr [bp+var_32]
		mov	byte ptr [bx-1], 0
		mov	ax, word ptr [bp+var_32]
		mov	word ptr [bp+var_3A+2], ax
		push	ax
		call	sub_22B1
		pop	cx
		mov	[bp+var_36], ax
		inc	word ptr [bp+var_32+2]
		push	3
		mov	ax, word ptr [bp+var_32+2]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_10C]
		add	ax, dx
		push	ax
		push	[bp+var_36]
		lea	ax, [bp+var_1E4]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	0
		push	large [bp+var_110]
		mov	ax, word ptr [bp+var_32+2]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_10C]
		add	ax, dx
		push	ax
		push	0
		call	ImageLayer_Construct_45FE8
		add	sp, 0Ah
		mov	word ptr [bp+var_3A], ax
		push	ax
		lea	ax, [bp+var_9C]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		push	2
		lea	ax, [bp+var_1E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_151FE:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 1
		jnz	short loc_1520A
		jmp	loc_15124

loc_1520A:
		mov	[bp+var_7F], 0
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+var_26]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_1526E
		mov	bx, [di+28h]
		mov	al, [bx+6]
		mov	ah, 0
		and	ax, 2
		cmp	ax, 2
		jnz	short loc_1523C
		mov	al, [bx+6]
		add	al, 0FEh
		mov	[bx+6], al
		jmp	short loc_1524A

loc_1523C:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4

loc_1524A:
		push	0
		push	[bp+var_24]
		mov	al, byte ptr [bp+var_22]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	[bp+var_26]
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_1526E:
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+var_26]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_152A5
		push	0
		push	[bp+var_24]
		mov	al, byte ptr [bp+var_22]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	[bp+var_26]
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_152A5:
		call	sub_1F377
		jmp	short loc_152D3

loc_152AC:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_152C8
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_152E6
		cmp	byte_603DE, 0
		jnz	short loc_152E6

loc_152C8:
		lea	ax, [bp+var_9C]
		push	ax
		call	sub_45D42
		pop	cx

loc_152D3:
		cmp	[bp+var_7F], 14h
		jb	short loc_152DE
		mov	ax, 1
		jmp	short loc_152E0

loc_152DE:
		xor	ax, ax

loc_152E0:
		mov	ah, 0
		or	ax, ax
		jz	short loc_152AC

loc_152E6:
		push	seg seg017
		push	offset sub_A168
		push	large 190000h
		push	0Ah
		push	[bp+var_28]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 190000h
		push	0Ah
		push	[bp+var_2A]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	word ptr [bp+var_2E+2]
		call	sub_33B
		pop	cx
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_10C]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_9C]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		lea	ax, [bp+var_7C]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		lea	ax, [bp+var_24]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_469CB
		pop	cx
		jmp	loc_16733

loc_1536C:
		cmp	byte_603DE, 0
		jz	short loc_15376
		jmp	loc_16753

loc_15376:
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_1E], ax
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_469A5
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_8E]
		push	ax
		call	LayerGroup_Construct_45C22
		add	sp, 8
		mov	[bp+var_9A], 150Bh
		mov	[bp+var_98], 0
		mov	[bp+var_9A], 1513h
		push	di
		lea	ax, [bp+var_9A]
		push	ax
		call	ConvRec_ReadName_18AAF
		add	sp, 4
		lea	ax, [bp+var_97]
		mov	[bp+var_26], ax
		lea	ax, word ptr [bp+var_2E+2]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	[bp+var_26]
		push	di
		push	cs
		call	near ptr sub_14A86
		add	sp, 0Ah
		mov	byte ptr [bp+var_2E+1], al
		xor	si, si
		jmp	short loc_1542B

loc_153F7:
		mov	ax, si
		shl	ax, 1
		mov	bx, word ptr [bp+var_2E+2]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+var_28]
		add	dx, ax
		push	dx
		push	0
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [bp+var_32], ax
		push	ax
		lea	ax, [bp+var_8E]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		inc	si

loc_1542B:
		mov	al, byte ptr [bp+var_2E+1]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_153F7
		xor	si, si
		jmp	short loc_15479

loc_15438:
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+var_2A]
		add	dx, ax
		mov	word ptr [bp+var_3A+2], dx
		mov	word ptr [bp+var_34+1], 0
		push	dx
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	[bp+var_36]
		mov	al, byte ptr [bp+var_34]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		lea	ax, [bp+var_36]
		push	ax
		call	sub_46E08
		pop	cx
		inc	si

loc_15479:
		mov	al, byte ptr [bp+var_2E+1]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_15438
		mov	[bp+var_3A], 0
		mov	byte ptr [bp+var_36], 2
		mov	byte ptr [bp+var_36+1], 0
		mov	[bp+var_34], 0
		push	2
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	di
		push	cs
		call	near ptr sub_14A6A
		add	sp, 6
		mov	[bp+var_3D], 0
		lea	ax, word ptr [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	word ptr [bp+var_40]
		mov	al, byte ptr [bp+var_40+2]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		lea	ax, word ptr [bp+var_40]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	byte ptr [bp+var_36+1], 0
		jz	short loc_15502
		cmp	[bp+var_3A], 0
		jz	short loc_15502
		push	0
		mov	al, byte ptr [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_15502

loc_15502:
		mov	[bp+var_3A], 0
		mov	byte ptr [bp+var_36+1], 0
		mov	[bp+var_34], 0
		mov	byte ptr [bp+var_2E], 1
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_FE]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word ptr [bp+var_32+2], 0
		jmp	loc_1566E

loc_1553D:
		inc	word ptr [di+4]
		mov	word ptr [bp+var_110+2], 150Bh
		mov	byte ptr [bp+var_10C], 1
		mov	word ptr [bp+var_110+2], 1503h
		push	di
		lea	ax, word ptr [bp+var_110+2]
		push	ax
		call	ConvRec_ReadFigure_18C04
		add	sp, 4
		lea	ax, [bp+var_10B]
		mov	word ptr [bp+var_32], ax
		push	ax
		call	CRT_Strlen
		pop	cx
		mov	dx, word ptr [bp+var_32]
		add	dx, ax
		mov	bx, dx
		mov	al, [bx-1]
		mov	byte ptr [bp+var_34+1], al
		inc	word ptr [bp+var_32+2]
		push	3
		mov	ax, word ptr [bp+var_32+2]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_FE]
		add	ax, dx
		push	ax
		push	word ptr [bp+var_32]
		push	di
		push	cs
		call	near ptr sub_14A4E
		add	sp, 8
		mov	al, byte ptr [bp+var_34+1]
		push	ax
		push	large [bp+var_102]
		mov	ax, word ptr [bp+var_32+2]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_FE]
		add	ax, dx
		push	ax
		push	0
		call	sub_1D55A
		add	sp, 0Ah
		mov	[bp+var_36], ax
		push	ax
		lea	ax, [bp+var_8E]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		cmp	byte ptr [bp+var_2E], 0
		jnz	short loc_155D1
		jmp	loc_1566E

loc_155D1:
		mov	[bp+var_40], 0
		mov	byte ptr [bp+var_3C], 2
		mov	byte ptr [bp+var_3C+1], 0
		mov	[bp+var_3A], 0
		push	2
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	word ptr [bp+var_32]
		push	4
		push	di
		push	cs
		call	near ptr sub_14825
		add	sp, 0Ah
		mov	[bp+var_43], 0
		lea	ax, word ptr [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	word ptr [bp+var_46]
		mov	al, byte ptr [bp+var_46+2]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		mov	byte ptr [bp+var_2E], 0
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	byte ptr [bp+var_3C+1], 0
		jz	short loc_1565A
		cmp	[bp+var_40], 0
		jz	short loc_1565A
		push	0
		mov	al, byte ptr [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1565A

loc_1565A:
		mov	[bp+var_40], 0
		mov	byte ptr [bp+var_3C+1], 0
		mov	[bp+var_3A], 0

loc_1566E:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 1
		jnz	short loc_1567A
		jmp	loc_1553D

loc_1567A:
		mov	[bp+var_71], 0
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+var_26]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_156DE
		mov	bx, [di+28h]
		mov	al, [bx+6]
		mov	ah, 0
		and	ax, 2
		cmp	ax, 2
		jnz	short loc_156AC
		mov	al, [bx+6]
		add	al, 0FEh
		mov	[bx+6], al
		jmp	short loc_156BA

loc_156AC:
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4

loc_156BA:
		push	0
		push	[bp+var_24]
		mov	al, byte ptr [bp+var_22]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	[bp+var_26]
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_156DE:
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+var_26]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_15715
		push	0
		push	[bp+var_24]
		mov	al, byte ptr [bp+var_22]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	[bp+var_26]
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_15715:
		call	sub_1F377
		jmp	short loc_15743

loc_1571C:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_15738
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_15756
		cmp	byte_603DE, 0
		jnz	short loc_15756

loc_15738:
		lea	ax, [bp+var_8E]
		push	ax
		call	sub_45D42
		pop	cx

loc_15743:
		cmp	[bp+var_71], 5
		jb	short loc_1574E
		mov	ax, 1
		jmp	short loc_15750

loc_1574E:
		xor	ax, ax

loc_15750:
		mov	ah, 0
		or	ax, ax
		jz	short loc_1571C

loc_15756:
		push	seg seg017
		push	offset sub_A168
		push	large 190000h
		push	0Ah
		push	[bp+var_28]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 190000h
		push	0Ah
		push	[bp+var_2A]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	word ptr [bp+var_2E+2]
		call	sub_33B
		pop	cx
		push	seg seg017
		push	offset sub_A168
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_FE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_8E]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		lea	ax, [bp+var_24]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_469CB
		pop	cx
		jmp	loc_16733

loc_157D2:
		cmp	byte_603DE, 0
		jz	short loc_157DC
		jmp	loc_16753

loc_157DC:
		mov	[bp+var_22], 0
		mov	[bp+var_20], 98h
		mov	[bp+var_1E], 13Fh
		mov	[bp+var_1C], 0C7h
		mov	ax, di
		add	ax, 2Ch
		push	ax
		push	word_5DD44
		sub	sp, 8
		mov	ax, [bp+var_22]
		mov	[bp+var_1F4], ax
		mov	ax, [bp+var_20]
		mov	[bp+var_1F2], ax
		mov	ax, [bp+var_1E]
		mov	[bp+var_1F0], ax
		mov	ax, [bp+var_1C]
		mov	[bp+var_1EE], ax
		lea	ax, [bp+var_90]
		push	ax
		call	sub_59CE5
		add	sp, 0Eh
		mov	[bp+var_28], 150Bh
		mov	byte ptr [bp+var_26], 0Ah
		mov	[bp+var_28], 14FBh
		mov	[bp+var_24], 0
		push	di
		lea	ax, [bp+var_28]
		push	ax
		call	sub_18D3D
		add	sp, 4
		push	0
		lea	ax, [bp+var_90]
		push	ax
		call	sub_59D12
		add	sp, 4
		mov	al, byte ptr [bp+var_26+1]
		mov	byte ptr [bp+var_29], al
		lea	ax, [bp+var_29]
		push	ax
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	[bp+var_24]
		lea	ax, [bp+var_108]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [bp+var_2A], 0
		cmp	word ptr [di+6Bh], 0
		jz	short loc_158A2
		mov	ax, [di+6Fh]
		shl	ax, 3
		mov	bx, [di+6Bh]
		mov	bx, [bx+8]
		add	bx, ax
		mov	ax, [bx+4]
		or	ax, [bx+6]
		jz	short loc_158A2
		mov	byte ptr [bp+var_2A], 1

loc_158A2:
		cmp	byte_603B5, 0
		jz	short loc_158BB
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	di
		push	cs
		call	near ptr sub_145D8
		add	sp, 6

loc_158BB:
		cmp	byte ptr [bp+var_2A], 0
		jnz	short loc_158C4
		jmp	loc_1594B

loc_158C4:
		lea	ax, [bp+var_108]
		push	ax
		call	CRT_Strlen
		pop	cx
		or	ax, ax
		jz	short loc_1594B
		cmp	byte_603B4, 0
		jz	short loc_1594B
		push	large 0FFh
		push	0
		push	word ptr [di+6Fh]
		push	word ptr [di+6Bh]
		call	sub_4163D
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_2E], eax
		cmp	byte ptr [bp+var_29], 0FFh
		jnz	short loc_15901
		jmp	loc_159C0

loc_15901:
		jmp	short loc_15934

loc_15903:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_15934
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1591F
		cmp	byte_603DE, 0
		jz	short loc_15934

loc_1591F:
		inc	[bp+var_19]
		push	large [bp+var_2E]
		push	word ptr [di+6Bh]
		call	sub_417DC
		add	sp, 6
		jmp	loc_159C0

loc_15934:
		push	large [bp+var_2E]
		push	word ptr [di+6Bh]
		call	sub_41729
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jz	short loc_15903
		jmp	short loc_159C0

loc_1594B:
		xor	eax, eax
		mov	[bp+var_2E], eax
		mov	[bp+var_32], eax
		mov	word ptr [bp+var_34], 8
		cmp	byte ptr [bp+var_29], 0FFh
		jz	short loc_1597B
		lea	ax, [bp+var_108]
		push	ax
		call	CRT_Strlen
		pop	cx
		or	ax, ax
		jnz	short loc_15975
		mov	ax, 8
		jmp	short loc_15978

loc_15975:
		mov	ax, 32h

loc_15978:
		mov	word ptr [bp+var_34], ax

loc_1597B:
		call	sub_1F377
		xor	si, si
		jmp	short loc_159BB

loc_15984:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_159A0
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_159C0
		cmp	byte_603DE, 0
		jnz	short loc_159C0

loc_159A0:
		mov	[bp+var_2E], 0Ah
		mov	eax, dword_5E7D3
		mov	[bp+var_32], eax
		lea	ax, word ptr [bp+var_32]
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		inc	si

loc_159BB:
		cmp	si, word ptr [bp+var_34]
		jl	short loc_15984

loc_159C0:
		inc	word ptr [di+6Fh]
		call	sub_1F377
		mov	[bp+var_28], 14FBh
		push	[bp+var_24]
		call	sub_45058
		pop	cx
		lea	ax, [bp+var_8E]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	loc_16733

loc_159E4:
		cmp	byte_603DE, 0
		jz	short loc_159EE
		jmp	loc_16753

loc_159EE:
		call	sub_1F377
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_1E], ax
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_469A5
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Dh
		lea	ax, [bp+var_8E]
		push	ax
		call	LayerGroup_Construct_45C22
		add	sp, 8
		mov	word ptr [bp+var_2E+2], 0
		mov	[bp+var_2A], 98h
		mov	[bp+var_28], 13Fh
		mov	[bp+var_26], 0C7h
		mov	ax, di
		add	ax, 2Ch
		push	ax
		push	word_5DD44
		sub	sp, 8
		mov	ax, word ptr [bp+var_2E+2]
		mov	[bp+var_1F4], ax
		mov	ax, [bp+var_2A]
		mov	[bp+var_1F2], ax
		mov	ax, [bp+var_28]
		mov	[bp+var_1F0], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_1EE], ax
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_59CE5
		add	sp, 0Eh
		mov	[bp+var_CE], 150Bh
		mov	[bp+var_CC], 3
		mov	[bp+var_CE], 14F3h
		mov	[bp+var_B1], 0
		mov	[bp+var_B4], 0
		push	di
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_18AD6
		add	sp, 4
		lea	ax, [bp+var_C1]
		mov	word ptr [bp+var_2E], ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_32+2]
		push	ax
		push	word ptr [bp+var_2E]
		push	di
		push	cs
		call	near ptr sub_14A86
		add	sp, 0Ah
		mov	byte ptr [bp+var_36+1], al
		mov	word ptr [bp+var_3A], 0
		jmp	short loc_15B17

loc_15ACC:
		mov	ax, word ptr [bp+var_3A]
		shl	ax, 1
		mov	bx, word ptr [bp+var_34]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, word ptr [bp+var_3A]
		imul	ax, ax, 0Ah
		mov	dx, word ptr [bp+var_32+2]
		add	dx, ax
		push	dx
		push	0
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [bp+var_60+2], ax
		mov	al, byte ptr [bp+var_36+1]
		mov	ah, 0
		dec	ax
		cmp	ax, word ptr [bp+var_3A]
		jnz	short loc_15B04
		mov	ax, word ptr [bp+var_60+2]
		mov	word ptr [bp+var_3A+2], ax

loc_15B04:
		push	word ptr [bp+var_60+2]
		lea	ax, [bp+var_8E]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		inc	word ptr [bp+var_3A]

loc_15B17:
		mov	al, byte ptr [bp+var_36+1]
		mov	ah, 0
		cmp	ax, word ptr [bp+var_3A]
		jg	short loc_15ACC
		mov	word ptr [bp+var_3A], 0
		jmp	short loc_15B6C

loc_15B28:
		mov	ax, word ptr [bp+var_3A]
		imul	ax, ax, 0Ah
		mov	dx, word ptr [bp+var_32]
		add	dx, ax
		mov	word ptr [bp+var_64], dx
		mov	word ptr [bp+var_60+1], 0
		push	dx
		lea	ax, word ptr [bp+var_64+2]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	word ptr [bp+var_64+2]
		mov	al, byte ptr [bp+var_60]
		push	ax
		lea	ax, word ptr [bp+var_64+2]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		lea	ax, word ptr [bp+var_64+2]
		push	ax
		call	sub_46E08
		pop	cx
		inc	word ptr [bp+var_3A]

loc_15B6C:
		mov	al, byte ptr [bp+var_36+1]
		mov	ah, 0
		cmp	ax, word ptr [bp+var_3A]
		jg	short loc_15B28
		lea	ax, [bp+var_CB]
		mov	[bp+var_3C], ax
		mov	[bp+var_46], 0
		mov	byte ptr [bp+var_43+1], 2
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	3
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	[bp+var_3C]
		push	di
		push	cs
		call	near ptr sub_14A08
		add	sp, 8
		mov	[bp+var_50], 0
		mov	[bp+var_4C], 2
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	di
		push	cs
		call	near ptr sub_14A24
		add	sp, 8
		push	large [bp+var_B8]
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	0
		call	sub_1C497
		add	sp, 8
		mov	si, ax
		push	ax
		lea	ax, [bp+var_8E]
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		mov	al, [bp+var_C2]
		cbw
		push	ax
		push	si
		call	TalkingHead_SetBaseFrame_1C84D
		add	sp, 4
		mov	[bp+var_53], 0
		lea	ax, word ptr [bp+var_50]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		call	sub_46A98
		add	sp, 4
		push	[bp+var_56]
		mov	al, [bp+var_54]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		push	word ptr [bp+var_2E]
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_15C52
		push	[bp+var_3C]
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_15CAF

loc_15C52:
		mov	bx, [di+28h]
		mov	al, [bx+6]
		mov	ah, 0
		and	ax, 2
		cmp	ax, 2
		jnz	short loc_15C6C
		mov	al, [bx+6]
		add	al, 0FEh
		mov	[bx+6], al
		jmp	short loc_15C7C

loc_15C6C:
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4

loc_15C7C:
		push	0
		push	[bp+var_24]
		mov	al, byte ptr [bp+var_22]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	word ptr [bp+var_2E]
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	[bp+var_3C]
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_15CAF:
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_59D12
		add	sp, 4
		mov	al, [bp+var_B2]
		mov	byte ptr [bp+var_57], al
		lea	ax, [bp+var_57]
		push	ax
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	ax, [bp+var_B4]
		mov	[bp+var_5A], ax
		mov	[bp+var_5B], 0
		cmp	word ptr [di+6Bh], 0
		jz	short loc_15D03
		mov	ax, [di+6Fh]
		shl	ax, 3
		mov	bx, [di+6Bh]
		mov	bx, [bx+8]
		add	bx, ax
		mov	ax, [bx+4]
		or	ax, [bx+6]
		jz	short loc_15D03
		mov	[bp+var_5B], 1

loc_15D03:
		push	[bp+var_5A]
		call	CRT_Strlen
		pop	cx
		or	ax, ax
		jnz	short loc_15D14
		mov	[bp+var_5B], 0

loc_15D14:
		call	sub_1F377
		lea	ax, [bp+var_8E]
		push	ax
		call	sub_45D42
		pop	cx
		mov	[bp+var_5C], 0
		cmp	byte_603B5, 0
		jz	short loc_15D3F
		push	[bp+var_5A]
		lea	ax, [bp+var_B0]
		push	ax
		push	di
		push	cs
		call	near ptr sub_145D8
		add	sp, 6

loc_15D3F:
		mov	al, byte_603B4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15D4C
		mov	[bp+var_5B], 0

loc_15D4C:
		cmp	[bp+var_5B], 0
		jz	short loc_15D7E
		push	large 0FFh
		push	0
		push	word ptr [di+6Fh]
		push	word ptr [di+6Bh]
		call	sub_4163D
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_60], eax
		push	127Fh
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4
		jmp	short loc_15D8B

loc_15D7E:
		push	[bp+var_B4]
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4

loc_15D8B:
		mov	byte ptr [bp+var_64+3], 0
		mov	[bp+var_5C], 0
		xor	eax, eax
		mov	[bp+var_66], eax
		mov	[bp+var_6A], eax
		mov	[bp+var_66], 2Dh
		mov	eax, dword_5E7D3
		mov	[bp+var_6A], eax
		jmp	loc_16086

loc_15DB1:
		mov	[bp+var_5C], 0
		lea	ax, [bp+var_8E]
		push	ax
		call	sub_45D42
		pop	cx
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_15E06
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_15DDC
		cmp	byte_603DE, 0
		jz	short loc_15E06

loc_15DDC:
		inc	[bp+var_19]
		cmp	[bp+var_5B], 0
		jz	short loc_15DF4
		push	large [bp+var_60]
		push	word ptr [di+6Bh]
		call	sub_417DC
		add	sp, 6

loc_15DF4:
		cmp	byte_603DE, 0
		jz	short loc_15E02
		mov	byte ptr [bp+var_64+3], 1
		jmp	loc_16086

loc_15E02:
		mov	[bp+var_5C], 1

loc_15E06:
		mov	al, [bp+var_5B]
		mov	ah, 0
		or	ax, ax
		jz	short loc_15E12
		jmp	loc_15EF7

loc_15E12:
		push	si
		call	sub_1CB15
		pop	cx
		or	al, al
		jnz	short loc_15E49
		cmp	[bp+var_5C], 0
		jnz	short loc_15E26
		jmp	loc_16086

loc_15E26:
		jmp	short loc_15E49

loc_15E28:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_15E49
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_15E44
		cmp	byte_603DE, 0
		jz	short loc_15E49

loc_15E44:
		inc	[bp+var_19]
		jmp	short loc_15E6E

loc_15E49:
		mov	eax, [bp+var_6A]
		add	eax, [bp+var_66]
		cmp	eax, dword_5E7D3
		ja	short loc_15E5D
		mov	ax, 1
		jmp	short loc_15E5F

loc_15E5D:
		xor	ax, ax

loc_15E5F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15E6E
		mov	al, [bp+var_5C]
		mov	ah, 0
		or	ax, ax
		jz	short loc_15E28

loc_15E6E:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 13h
		jnz	short loc_15EED
		mov	al, byte_603DE
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15EED
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_15E8F
		mov	ax, 1
		jmp	short loc_15E91

loc_15E8F:
		xor	ax, ax

loc_15E91:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15EED
		inc	word ptr [di+4]
		push	di
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_18AD6
		add	sp, 4
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_59D12
		add	sp, 4
		push	[bp+var_B4]
		lea	ax, [bp+var_B0]
		push	ax
		push	di
		push	cs
		call	near ptr sub_145D8
		add	sp, 6
		mov	[bp+var_71], 0
		push	[bp+var_B4]
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4
		mov	[bp+var_66], 3Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_6A], eax
		jmp	loc_16086

loc_15EED:
		mov	byte ptr [bp+var_64+3], 1
		jmp	loc_16086
		jmp	loc_16086

loc_15EF7:
		cmp	[bp+var_5B], 0
		jnz	short loc_15F00
		jmp	loc_16009

loc_15F00:
		cmp	byte_603B5, 0
		jnz	short loc_15F0A
		jmp	loc_16009

loc_15F0A:
		push	large [bp+var_60]
		push	word ptr [di+6Bh]
		call	sub_41729
		add	sp, 6
		or	al, al
		jnz	short loc_15F49
		cmp	[bp+var_5C], 0
		jnz	short loc_15F26
		jmp	loc_15FE5

loc_15F26:
		jmp	short loc_15F49

loc_15F28:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_15F49
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_15F44
		cmp	byte_603DE, 0
		jz	short loc_15F49

loc_15F44:
		inc	[bp+var_19]
		jmp	short loc_15F6E

loc_15F49:
		mov	eax, [bp+var_6A]
		add	eax, [bp+var_66]
		cmp	eax, dword_5E7D3
		ja	short loc_15F5D
		mov	ax, 1
		jmp	short loc_15F5F

loc_15F5D:
		xor	ax, ax

loc_15F5F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15F6E
		mov	al, [bp+var_5C]
		mov	ah, 0
		or	ax, ax
		jz	short loc_15F28

loc_15F6E:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 13h
		jnz	short loc_15FDB
		mov	al, byte_603DE
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15FDB
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_15F8F
		mov	ax, 1
		jmp	short loc_15F91

loc_15F8F:
		xor	ax, ax

loc_15F91:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15FDB
		inc	word ptr [di+4]
		push	di
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_18AD6
		add	sp, 4
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_59D12
		add	sp, 4
		push	[bp+var_B4]
		lea	ax, [bp+var_B0]
		push	ax
		push	di
		push	cs
		call	near ptr sub_145D8
		add	sp, 6
		mov	[bp+var_66], 3Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_6A], eax
		jmp	loc_16086

loc_15FDB:
		mov	byte ptr [bp+var_64+3], 1
		jmp	loc_16086
		jmp	loc_16086

loc_15FE5:
		push	si
		call	sub_1CB15
		pop	cx
		or	al, al
		jnz	short loc_15FF3
		jmp	loc_16086

loc_15FF3:
		mov	[bp+var_71], 0
		push	127Fh
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4
		jmp	loc_16086
		jmp	short loc_16086

loc_16009:
		cmp	[bp+var_5B], 0
		jz	short loc_16086
		mov	al, byte_603B5
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16086
		push	large [bp+var_60]
		push	word ptr [di+6Bh]
		call	sub_41729
		add	sp, 6
		or	al, al
		jnz	short loc_16044
		cmp	[bp+var_5C], 0
		jz	short loc_1606A
		jmp	short loc_16044

loc_16033:
		inc	word ptr [di+4]
		push	di
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_18AD6
		add	sp, 4

loc_16044:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 13h
		jnz	short loc_16064
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_1605C
		mov	ax, 1
		jmp	short loc_1605E

loc_1605C:
		xor	ax, ax

loc_1605E:
		mov	ah, 0
		or	ax, ax
		jz	short loc_16033

loc_16064:
		mov	byte ptr [bp+var_64+3], 1
		jmp	short loc_16086

loc_1606A:
		push	si
		call	sub_1CB15
		pop	cx
		or	al, al
		jz	short loc_16086
		mov	[bp+var_71], 0
		push	127Fh
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4

loc_16086:
		mov	al, byte ptr [bp+var_64+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16092
		jmp	loc_15DB1

loc_16092:
		cmp	byte_603DE, 0
		jz	short loc_1609C
		jmp	loc_165F4

loc_1609C:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		pop	cx
		push	0
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4
		mov	al, [bp+var_5C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16131
		mov	al, [bp+var_5B]
		mov	ah, 0
		or	ax, ax
		jz	short loc_160C9
		mov	al, byte_603B4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16131

loc_160C9:
		mov	word ptr [bp+var_60+2], 0Ah
		push	[bp+var_B4]
		call	CRT_Strlen
		pop	cx
		or	ax, ax
		jz	short loc_160E1
		mov	word ptr [bp+var_60+2], 4

loc_160E1:
		mov	al, [bp+var_19]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16131
		mov	[bp+var_71], 0
		jmp	short loc_1611C

loc_160F1:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_16111
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_16131
		cmp	byte_603DE, 0
		jz	short loc_1611C
		jmp	short loc_16131
		jmp	short loc_1611C

loc_16111:
		lea	ax, [bp+var_8E]
		push	ax
		call	sub_45D42
		pop	cx

loc_1611C:
		mov	ax, [bp+var_71]
		cmp	ax, word ptr [bp+var_60+2]
		jb	short loc_16129
		mov	ax, 1
		jmp	short loc_1612B

loc_16129:
		xor	ax, ax

loc_1612B:
		mov	ah, 0
		or	ax, ax
		jz	short loc_160F1

loc_16131:
		cmp	byte_603DE, 0
		jz	short loc_1613B
		jmp	loc_165F4

loc_1613B:
		inc	word ptr [di+6Fh]
		call	sub_1F377
		jmp	loc_165D1

loc_16146:
		inc	word ptr [di+4]
		push	di
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_18AD6
		add	sp, 4
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_59D12
		add	sp, 4
		mov	ax, [bp+var_B4]
		mov	word ptr [bp+var_60+2], ax
		mov	byte ptr [bp+var_60+1], 0
		cmp	word ptr [di+6Bh], 0
		jz	short loc_16191
		mov	ax, [di+6Fh]
		shl	ax, 3
		mov	bx, [di+6Bh]
		mov	bx, [bx+8]
		add	bx, ax
		mov	ax, [bx+4]
		or	ax, [bx+6]
		jz	short loc_16191
		mov	byte ptr [bp+var_60+1], 1

loc_16191:
		push	word ptr [bp+var_60+2]
		call	CRT_Strlen
		pop	cx
		or	ax, ax
		jnz	short loc_161A2
		mov	byte ptr [bp+var_60+1], 0

loc_161A2:
		mov	al, byte_603B4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_161AF
		mov	byte ptr [bp+var_60+1], 0

loc_161AF:
		mov	[bp+var_71], 0
		call	sub_1F377
		cmp	byte_603B5, 0
		jz	short loc_161D0
		push	word ptr [bp+var_60+2]
		lea	ax, [bp+var_B0]
		push	ax
		push	di
		push	cs
		call	near ptr sub_145D8
		add	sp, 6

loc_161D0:
		mov	al, byte_603B4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_161DD
		mov	byte ptr [bp+var_60+1], 0

loc_161DD:
		cmp	byte ptr [bp+var_60+1], 0
		jz	short loc_1620F
		push	large 0FFh
		push	0
		push	word ptr [di+6Fh]
		push	word ptr [di+6Bh]
		call	sub_4163D
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ah
		mov	[bp+var_64], eax
		push	127Fh
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4
		jmp	short loc_1621C

loc_1620F:
		push	[bp+var_B4]
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4

loc_1621C:
		mov	byte ptr [bp+var_66+1], 0
		mov	[bp+var_5C], 0
		xor	eax, eax
		mov	[bp+var_6A], eax
		mov	[bp+var_6E], eax
		mov	[bp+var_6A], 3Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_6E], eax
		jmp	loc_16517

loc_16242:
		mov	[bp+var_5C], 0
		lea	ax, [bp+var_8E]
		push	ax
		call	sub_45D42
		pop	cx
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_16297
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1626D
		cmp	byte_603DE, 0
		jz	short loc_16297

loc_1626D:
		inc	[bp+var_19]
		cmp	byte ptr [bp+var_60+1], 0
		jz	short loc_16285
		push	large [bp+var_64]
		push	word ptr [di+6Bh]
		call	sub_417DC
		add	sp, 6

loc_16285:
		cmp	byte_603DE, 0
		jz	short loc_16293
		mov	byte ptr [bp+var_66+1], 1
		jmp	loc_16517

loc_16293:
		mov	[bp+var_5C], 1

loc_16297:
		mov	al, byte ptr [bp+var_60+1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_162A3
		jmp	loc_16388

loc_162A3:
		push	si
		call	sub_1CB15
		pop	cx
		or	al, al
		jnz	short loc_162DA
		cmp	[bp+var_5C], 0
		jnz	short loc_162B7
		jmp	loc_16517

loc_162B7:
		jmp	short loc_162DA

loc_162B9:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_162DA
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_162D5
		cmp	byte_603DE, 0
		jz	short loc_162DA

loc_162D5:
		inc	[bp+var_19]
		jmp	short loc_162FF

loc_162DA:
		mov	eax, [bp+var_6E]
		add	eax, [bp+var_6A]
		cmp	eax, dword_5E7D3
		ja	short loc_162EE
		mov	ax, 1
		jmp	short loc_162F0

loc_162EE:
		xor	ax, ax

loc_162F0:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_162FF
		mov	al, [bp+var_5C]
		mov	ah, 0
		or	ax, ax
		jz	short loc_162B9

loc_162FF:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 13h
		jnz	short loc_1637E
		mov	al, byte_603DE
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1637E
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_16320
		mov	ax, 1
		jmp	short loc_16322

loc_16320:
		xor	ax, ax

loc_16322:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1637E
		inc	word ptr [di+4]
		push	di
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_18AD6
		add	sp, 4
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_59D12
		add	sp, 4
		push	[bp+var_B4]
		lea	ax, [bp+var_B0]
		push	ax
		push	di
		push	cs
		call	near ptr sub_145D8
		add	sp, 6
		mov	[bp+var_71], 0
		push	[bp+var_B4]
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4
		mov	[bp+var_6A], 3Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_6E], eax
		jmp	loc_16517

loc_1637E:
		mov	byte ptr [bp+var_66+1], 1
		jmp	loc_16517
		jmp	loc_16517

loc_16388:
		cmp	byte ptr [bp+var_60+1], 0
		jnz	short loc_16391
		jmp	loc_1649A

loc_16391:
		cmp	byte_603B5, 0
		jnz	short loc_1639B
		jmp	loc_1649A

loc_1639B:
		push	large [bp+var_64]
		push	word ptr [di+6Bh]
		call	sub_41729
		add	sp, 6
		or	al, al
		jnz	short loc_163DA
		cmp	[bp+var_5C], 0
		jnz	short loc_163B7
		jmp	loc_16476

loc_163B7:
		jmp	short loc_163DA

loc_163B9:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_163DA
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_163D5
		cmp	byte_603DE, 0
		jz	short loc_163DA

loc_163D5:
		inc	[bp+var_19]
		jmp	short loc_163FF

loc_163DA:
		mov	eax, [bp+var_6E]
		add	eax, [bp+var_6A]
		cmp	eax, dword_5E7D3
		ja	short loc_163EE
		mov	ax, 1
		jmp	short loc_163F0

loc_163EE:
		xor	ax, ax

loc_163F0:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_163FF
		mov	al, [bp+var_5C]
		mov	ah, 0
		or	ax, ax
		jz	short loc_163B9

loc_163FF:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 13h
		jnz	short loc_1646C
		mov	al, byte_603DE
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1646C
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_16420
		mov	ax, 1
		jmp	short loc_16422

loc_16420:
		xor	ax, ax

loc_16422:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1646C
		inc	word ptr [di+4]
		push	di
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_18AD6
		add	sp, 4
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_59D12
		add	sp, 4
		push	[bp+var_B4]
		lea	ax, [bp+var_B0]
		push	ax
		push	di
		push	cs
		call	near ptr sub_145D8
		add	sp, 6
		mov	[bp+var_6A], 3Ch
		mov	eax, dword_5E7D3
		mov	[bp+var_6E], eax
		jmp	loc_16517

loc_1646C:
		mov	byte ptr [bp+var_66+1], 1
		jmp	loc_16517
		jmp	loc_16517

loc_16476:
		push	si
		call	sub_1CB15
		pop	cx
		or	al, al
		jnz	short loc_16484
		jmp	loc_16517

loc_16484:
		mov	[bp+var_71], 0
		push	127Fh
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4
		jmp	loc_16517
		jmp	short loc_16517

loc_1649A:
		cmp	byte ptr [bp+var_60+1], 0
		jz	short loc_16517
		mov	al, byte_603B5
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16517
		push	large [bp+var_64]
		push	word ptr [di+6Bh]
		call	sub_41729
		add	sp, 6
		or	al, al
		jnz	short loc_164D5
		cmp	[bp+var_5C], 0
		jz	short loc_164FB
		jmp	short loc_164D5

loc_164C4:
		inc	word ptr [di+4]
		push	di
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_18AD6
		add	sp, 4

loc_164D5:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 13h
		jnz	short loc_164F5
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_164ED
		mov	ax, 1
		jmp	short loc_164EF

loc_164ED:
		xor	ax, ax

loc_164EF:
		mov	ah, 0
		or	ax, ax
		jz	short loc_164C4

loc_164F5:
		mov	byte ptr [bp+var_66+1], 1
		jmp	short loc_16517

loc_164FB:
		push	si
		call	sub_1CB15
		pop	cx
		or	al, al
		jz	short loc_16517
		mov	[bp+var_71], 0
		push	127Fh
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4

loc_16517:
		mov	al, byte ptr [bp+var_66+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16523
		jmp	loc_16242

loc_16523:
		cmp	byte_603DE, 0
		jz	short loc_1652D
		jmp	loc_165F4

loc_1652D:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		pop	cx
		push	0
		push	si
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_1C7C7
		add	sp, 4
		mov	al, [bp+var_5C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_165C2
		mov	al, byte ptr [bp+var_60+1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1655A
		mov	al, byte_603B4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_165C2

loc_1655A:
		mov	word ptr [bp+var_64+2], 0Ah
		push	[bp+var_B4]
		call	CRT_Strlen
		pop	cx
		or	ax, ax
		jz	short loc_16572
		mov	word ptr [bp+var_64+2], 4

loc_16572:
		mov	al, [bp+var_19]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_165C2
		mov	[bp+var_71], 0
		jmp	short loc_165AD

loc_16582:
		push	0
		call	sub_1FA51
		pop	cx
		or	al, al
		jz	short loc_165A2
		mov	al, [di+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_165C2
		cmp	byte_603DE, 0
		jz	short loc_165AD
		jmp	short loc_165C2
		jmp	short loc_165AD

loc_165A2:
		lea	ax, [bp+var_8E]
		push	ax
		call	sub_45D42
		pop	cx

loc_165AD:
		mov	ax, [bp+var_71]
		cmp	ax, word ptr [bp+var_64+2]
		jb	short loc_165BA
		mov	ax, 1
		jmp	short loc_165BC

loc_165BA:
		xor	ax, ax

loc_165BC:
		mov	ah, 0
		or	ax, ax
		jz	short loc_16582

loc_165C2:
		cmp	byte_603DE, 0
		jnz	short loc_165F4
		inc	word ptr [di+6Fh]
		call	sub_1F377

loc_165D1:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_165E0
		mov	ax, 1
		jmp	short loc_165E2

loc_165E0:
		xor	ax, ax

loc_165E2:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_165F4
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 4
		jnz	short loc_165F4
		jmp	loc_16146

loc_165F4:
		push	seg seg017
		push	offset sub_A168
		push	large 190000h
		push	0Ah
		push	word ptr [bp+var_32+2]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg017
		push	offset sub_A168
		push	large 190000h
		push	0Ah
		push	word ptr [bp+var_32]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	word ptr [bp+var_34]
		call	sub_33B
		pop	cx
		lea	ax, [bp+var_56]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	[bp+var_4B], 0
		jz	short loc_1665D
		cmp	[bp+var_50], 0
		jz	short loc_1665D
		push	0
		mov	al, [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1665D

loc_1665D:
		mov	[bp+var_50], 0
		mov	[bp+var_4B], 0
		mov	[bp+var_4A], 0
		cmp	[bp+var_41], 0
		jz	short loc_16695
		cmp	[bp+var_46], 0
		jz	short loc_16695
		push	0
		mov	al, byte ptr [bp+var_43+1]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_16695

loc_16695:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		mov	[bp+var_CE], 14F3h
		push	[bp+var_B4]
		call	sub_45058
		pop	cx
		lea	ax, [bp+var_AE]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	2
		lea	ax, [bp+var_8E]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		lea	ax, [bp+var_24]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_469CB
		pop	cx
		jmp	short loc_16733

loc_166E9:
		cmp	byte_603DE, 0
		jnz	short loc_16753
		mov	[bp+var_1E], 150Bh
		mov	byte ptr [bp+var_1C], 0Ch
		mov	[bp+var_1E], 14EBh
		push	di
		lea	ax, [bp+var_1E]
		push	ax
		call	ConvRec_ReadNumber_18DDA
		add	sp, 4
		mov	ax, [bp+var_1B]
		mov	[bp+var_20], ax
		add	[di+4], ax
		jmp	short loc_16733

loc_16716:
		cmp	byte_603DE, 0
		jnz	short loc_16753
		push	14A5h
		call	sub_9D78
		pop	cx
		jmp	short loc_16733
		jmp	short loc_16733

loc_1672A:
		push	14C1h
		call	sub_9D78
		pop	cx

loc_16733:
		cmp	[bp+var_17], 0
		jnz	short loc_16753

loc_16739:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_16748
		mov	ax, 1
		jmp	short loc_1674A

loc_16748:
		xor	ax, ax

loc_1674A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16753
		jmp	loc_14F91

loc_16753:
		pop	di
		pop	si
		leave
		retf
sub_14F62		endp

; START OF FUNCTION CHUNK FOR sub_14F62
off_16757	dw offset loc_1536C
		dw offset loc_1672A
		dw offset loc_1672A
		dw offset loc_159E4
		dw offset loc_16716
		dw offset loc_1672A
		dw offset loc_1672A
		dw offset loc_1672A
		dw offset loc_1672A
		dw offset loc_1672A
		dw offset loc_157D2
		dw offset loc_1672A
		dw offset loc_166E9
		dw offset loc_1672A
		dw offset loc_1672A
		dw offset loc_1672A
		dw offset loc_16733
		dw offset loc_1672A
		dw offset loc_14FB9
		dw offset loc_16716
; END OF FUNCTION CHUNK FOR sub_14F62

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; MissionRecord_Helper_95F76 (sub_95F76 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à MissionRecord_Helper_7D249 (sub_7D249 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (CRT_Malloc16_Retry, 29
; lignes).
; ==============================================================================================
MissionRecord_Helper_1677F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_16798
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_167AF

loc_16798:
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0

loc_167AF:
		mov	ax, si
		pop	si
		pop	bp
		retf
MissionRecord_Helper_1677F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_167B4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_167B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_167BE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_167BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_167CB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_167CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_167D8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_16844
		mov	word ptr [si], 151Bh
		push	si
		call	sub_1686F
		pop	cx
		cmp	byte ptr [si+23h], 0
		jz	short loc_16818
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_16818
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_16818

loc_16818:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	word ptr [si], 492h
		push	si
		call	sub_4870F
		pop	cx
		test	di, 1
		jz	short loc_16844
		push	si
sub_167D8		endp

; START OF FUNCTION CHUNK FOR sub_167D8
		db 9Ah, 3Bh
; END OF FUNCTION CHUNK FOR sub_167D8
seg027		ends
