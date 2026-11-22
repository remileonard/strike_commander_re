seg095		segment	para public 'CODE' use16
		assume cs:seg095
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 7, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40CF3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		or	si, si
		jnz	short loc_40D13
		push	71h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_40D13
		jmp	loc_40E1C

loc_40D13:
		mov	word ptr [si], 96Dh
		mov	ax, word_5DD68
		mov	[si+2], ax
		mov	word_5DD68, si
		mov	word ptr [si], 3A71h
		mov	word_603E0, si
		mov	byte ptr [si+70h], 0
		mov	ax, [bp+arg_2]
		mov	[si+6], ax
		mov	ax, [si+6]
		shl	ax, 3
		push	ax
		call	sub_44F3F
		pop	cx
		mov	[si+8], ax
		push	0
		mov	ax, [si+6]
		shl	ax, 3
		push	ax
		push	word ptr [si+8]
		call	CRT_Memset
		add	sp, 6
		mov	ax, [si+6]
		shl	ax, 1
		push	ax
		call	sub_44F3F
		pop	cx
		mov	word_603E2, ax
		push	0
		mov	ax, [si+6]
		shl	ax, 1
		push	ax
		push	word_603E2
		call	CRT_Memset
		add	sp, 6
		mov	word ptr [si+10h], 0
		mov	[si+0Eh], di
		or	di, di
		jz	short loc_40DAC
		mov	ax, [si+0Eh]
		imul	ax, ax, 14h
		push	ax
		call	sub_44F3F
		pop	cx
		mov	[si+12h], ax
		push	0
		mov	ax, [si+0Eh]
		imul	ax, ax, 14h
		push	ax
		push	word ptr [si+12h]
		call	CRT_Memset
		add	sp, 6
		jmp	short loc_40DB1

loc_40DAC:
		mov	word ptr [si+12h], 0

loc_40DB1:
		push	0
		push	50h
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	CRT_Memset
		add	sp, 6
		mov	dword ptr [si+0Ah], 0
		mov	word ptr [si+14h], 0
		mov	dword ptr [si+16h], 0
		mov	dword ptr [si+1Ah], 0
		push	1
		push	8
		push	2
		push	large 1000h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word_5D6B2, dx
		mov	word_5D6B0, ax
		push	1
		push	8
		push	2
		push	large 400h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word_5D6B6, dx
		mov	word_5D6B4, ax

loc_40E1C:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_40CF3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40E22		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	[si+6], dx
		jbe	short loc_40E40
		mov	ax, dx
		shl	ax, 1
		mov	bx, word_603E2
		add	bx, ax
		mov	ax, [bp+arg_4]
		mov	[bx], ax

loc_40E40:
		pop	si
		pop	bp
		retf
sub_40E22		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40E43		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_40E75
		mov	word ptr [si], 3A71h
		push	si
		nop
		push	cs
		call	near ptr sub_40E88
		pop	cx
		push	0
		push	si
		call	sub_47DAD
		add	sp, 4
		test	di, 1
		jz	short loc_40E75
		push	si
		call	sub_33B
		pop	cx

loc_40E75:
		pop	di
		pop	si
		pop	bp
		retf
sub_40E43		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_3FE83 (sub_3FE83 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldWrapper_3C848 (sub_3C848 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_64FD8 (sub_64FD8 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe appelant sub_6501E.
; Référencée par sub_A8F22.
; ==============================================================================================
ResourceRecord_WriteFieldWrapper_40E79		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_40E88
		pop	cx
		pop	bp
		retf
ResourceRecord_WriteFieldWrapper_40E79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40E88		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_5D762, 0
		jnz	short loc_40E99
		jmp	loc_40F5A

loc_40E99:
		call	sub_3E669
		mov	byte_5D762, 0
		cmp	word ptr [si+8], 0
		jz	short loc_40EB7
		push	word ptr [si+8]
		call	sub_45058
		pop	cx
		mov	word ptr [si+8], 0

loc_40EB7:
		cmp	word_603E2, 0
		jz	short loc_40ECE
		push	word_603E2
		call	sub_45058
		pop	cx
		mov	word_603E2, 0

loc_40ECE:
		cmp	word ptr [si+12h], 0
		jz	short loc_40EE2
		push	word ptr [si+12h]
		call	sub_45058
		pop	cx
		mov	word ptr [si+12h], 0

loc_40EE2:
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_40F06
		push	0
		push	2
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	dword ptr [si+0Ah], 0

loc_40F06:
		push	word ptr [si+4]
		push	693Ch
		call	Stopwatch_UnregisterTickModule_5621A
		add	sp, 4
		cmp	dword ptr word_5D6B0, 0
		jz	short loc_40F37
		push	0
		push	2
		push	3990h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	dword ptr word_5D6B0, 0

loc_40F37:
		cmp	dword ptr word_5D6B4, 0
		jz	short loc_40F5A
		push	0
		push	2
		push	3994h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	dword ptr word_5D6B4, 0

loc_40F5A:
		pop	si
		pop	bp
		retf
sub_40E88		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40F5D		proc far
		push	bp
		mov	bp, sp
		cmp	byte_5D762, 0
		jz	short loc_40F71
		mov	byte_5D762, 0
		call	sub_3E669

loc_40F71:
		pop	bp
		retf
sub_40F5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40F73		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	1
		push	8
		push	2
		push	large 400h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+0Ch], dx
		mov	[si+0Ah], ax
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_40FF3
		push	large 4000000h
		push	large [si+0Ah]
		call	sub_3651
		add	sp, 8
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		push	[bp+arg_6]
		push	[bp+arg_2]
		push	[bp+arg_4]
		call	sub_3E643
		add	sp, 0Ah
		cmp	ax, 0FFFFh
		jz	short loc_40FF3
		mov	byte_5D762, 1
		mov	[bp+var_1], 1
		push	large 3Ch
		push	seg seg092
		push	offset sub_3DE30
		push	693Ch
		call	Stopwatch_RegisterTickModuleVariant_561DD
		add	sp, 0Ah
		mov	[si+4], ax

loc_40FF3:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_40F73		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40FF9		proc far

var_E4		= word ptr -0E4h
var_83		= dword ptr -83h
var_77		= word ptr -77h
var_73		= dword ptr -73h
var_6C		= word ptr -6Ch
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0E4h
		mov	ax, [bp+arg_0]
		push	large 2Ah
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		or	ax, dx
		jz	short loc_4103C
		les	bx, [bp+var_C]
		mov	dword ptr es:[bx+20h], 0
		mov	byte ptr es:[bx+24h], 2
		mov	byte ptr es:[bx+25h], 0
		mov	dword ptr es:[bx+26h], 0
		mov	ax, [bp+var_C]
		jmp	short loc_41042

loc_4103C:
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]

loc_41042:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_41052
		jmp	loc_4119D

loc_41052:
		push	ds
		push	offset aPAK
		push	ds
		push	offset aDIGITAL
		push	ds
		push	offset aSOUND_1
		lea	ax, [bp+var_6C]
		push	ax
		call	Path_BuildDataPath_1F0C4
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_6C]
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	[bp+arg_2]
		lea	ax, [bp+var_E4]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [bp+var_77]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_4109F
		mov	eax, [bp+var_83]
		jmp	short loc_410A3

loc_4109F:
		mov	eax, [bp+var_73]

loc_410A3:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_410C4

loc_410AE:
		push	2
		lea	ax, [bp+var_E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		xor	dx, dx
		xor	ax, ax
		jmp	loc_411AB

loc_410C4:
		mov	[bp+var_10], 20h
		mov	eax, [bp+var_10]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2], dx
		mov	word ptr [bp+var_1C], ax
		les	bx, word ptr [bp+var_8]
		mov	eax, [bp+var_1C]
		mov	es:[bx+20h], eax
		mov	byte ptr es:[bx+24h], 3
		mov	byte ptr es:[bx+25h], 1
		mov	dword ptr es:[bx+26h], 0
		mov	eax, [bp+var_18]
		mov	es:[bx+26h], eax
		push	0
		mov	al, es:[bx+24h]
		push	ax
		push	large es:[bx+20h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_4113B
		jmp	loc_410AE

loc_4113B:
		push	large 0FFFFFFFFh
		push	large [bp+var_10]
		push	large [bp+var_8]
		lea	ax, [bp+var_E4]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large [bp+var_4]
		push	0
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+24h]
		push	ax
		push	large es:[bx+20h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_E4]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_527AA
		pop	cx
		push	2
		lea	ax, [bp+var_E4]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_4119D:
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		mov	dx, word ptr [bp+var_14+2]
		mov	ax, word ptr [bp+var_14]

loc_411AB:
		leave
		retf
sub_40FF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_411AD		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	large 2Ah
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		or	ax, dx
		jz	short loc_411F3
		les	bx, [bp+var_C]
		mov	dword ptr es:[bx+20h], 0
		mov	byte ptr es:[bx+24h], 2
		mov	byte ptr es:[bx+25h], 0
		mov	dword ptr es:[bx+26h], 0
		mov	ax, [bp+var_C]
		jmp	short loc_411F9

loc_411F3:
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]

loc_411F9:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_41209
		jmp	loc_412F0

loc_41209:
		push	[bp+arg_4]
		push	si
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_41226
		mov	eax, [si+61h]
		jmp	short loc_4122A

loc_41226:
		mov	eax, [si+71h]

loc_4122A:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_4123C

loc_41235:
		xor	dx, dx
		xor	ax, ax
		jmp	loc_412F6

loc_4123C:
		mov	[bp+var_10], 20h
		mov	eax, [bp+var_10]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_14], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		les	bx, word ptr [bp+var_8]
		mov	eax, [bp+var_18]
		mov	es:[bx+20h], eax
		mov	byte ptr es:[bx+24h], 3
		mov	byte ptr es:[bx+25h], 1
		mov	dword ptr es:[bx+26h], 0
		mov	eax, [bp+var_14]
		mov	es:[bx+26h], eax
		push	0
		mov	al, es:[bx+24h]
		push	ax
		push	large es:[bx+20h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_41235
		push	large 0FFFFFFFFh
		push	large [bp+var_10]
		push	large [bp+var_8]
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large [bp+var_4]
		push	0
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+24h]
		push	ax
		push	large es:[bx+20h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh

loc_412F0:
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]

loc_412F6:
		pop	si
		leave
		retf
sub_411AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_412F9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [di+8]
		add	bx, ax
		cmp	word ptr [bx], 0
		jbe	short loc_41320
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [di+8]
		add	bx, ax
		inc	word ptr [bx]
		jmp	short loc_41378

loc_41320:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	cs
		call	near ptr sub_411AD
		add	sp, 6
		mov	bx, [bp+arg_2]
		shl	bx, 3
		mov	si, [di+8]
		add	si, bx
		mov	[si+6], dx
		mov	[si+4], ax
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [di+8]
		add	bx, ax
		mov	word ptr [bx+2], 64h
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [di+8]
		add	bx, ax
		mov	ax, [bx+4]
		or	ax, [bx+6]
		jz	short loc_41378
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [di+8]
		add	bx, ax
		inc	word ptr [bx]
		add	dword ptr [di+1Ah], 2Ah
		mov	al, 1
		jmp	short loc_4137A

loc_41378:
		mov	al, 0

loc_4137A:
		pop	di
		pop	si
		pop	bp
		retf
sub_412F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4137E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [di+8]
		add	bx, ax
		cmp	word ptr [bx], 0
		jbe	short loc_413A5
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [di+8]
		add	bx, ax
		inc	word ptr [bx]
		jmp	short loc_41405

loc_413A5:
		push	[bp+arg_2]
		push	di
		push	cs
		call	near ptr sub_40FF9
		add	sp, 4
		mov	bx, [bp+arg_2]
		shl	bx, 3
		mov	si, [di+8]
		add	si, bx
		mov	[si+6], dx
		mov	[si+4], ax
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [di+8]
		add	bx, ax
		mov	ax, [bp+arg_2]
		shl	ax, 1
		mov	si, word_603E2
		add	si, ax
		mov	ax, [si]
		mov	[bx+2], ax
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [di+8]
		add	bx, ax
		mov	ax, [bx+4]
		or	ax, [bx+6]
		jz	short loc_41405
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [di+8]
		add	bx, ax
		inc	word ptr [bx]
		add	dword ptr [di+1Ah], 2Ah
		mov	al, 1
		jmp	short loc_41407

loc_41405:
		mov	al, 0

loc_41407:
		pop	di
		pop	si
		pop	bp
		retf
sub_4137E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4140B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_4142B

loc_41417:
		mov	bx, di
		imul	bx, bx, 14h
		cmp	dword ptr [bx+si+1Eh], 0
		jz	short loc_4142A
		push	di
		call	sub_3E776
		pop	cx

loc_4142A:
		inc	di

loc_4142B:
		cmp	di, 4
		jl	short loc_41417
		mov	byte ptr [si+70h], 1
		pop	di
		pop	si
		pop	bp
		retf
sub_4140B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41438		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_41458

loc_41444:
		mov	bx, di
		imul	bx, bx, 14h
		cmp	dword ptr [bx+si+1Eh], 0
		jz	short loc_41457
		push	di
		call	sub_3E798
		pop	cx

loc_41457:
		inc	di

loc_41458:
		cmp	di, 4
		jl	short loc_41444
		mov	byte ptr [si+70h], 0
		pop	di
		pop	si
		pop	bp
		retf
sub_41438		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41465		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	bx, dx
		imul	bx, bx, 14h
		cmp	dword ptr [bx+si+1Eh], 0
		jz	short loc_41492
		dec	word ptr [si+14h]
		mov	bx, dx
		imul	bx, bx, 14h
		mov	dword ptr [bx+si+1Eh], 0
		push	dx
		call	sub_3E776
		pop	cx

loc_41492:
		pop	si
		pop	bp
		retf
sub_41465		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41495		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_414C3

loc_414AA:
		mov	bx, [bp+var_2]
		imul	bx, bx, 14h
		cmp	[bx+si+22h], di
		jnz	short loc_414C0
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_41465
		add	sp, 4

loc_414C0:
		inc	[bp+var_2]

loc_414C3:
		cmp	[bp+var_2], 4
		jb	short loc_414AA
		cmp	word ptr [si+10h], 0
		jz	short loc_41506
		mov	[bp+var_2], 0
		jmp	short loc_414FE

loc_414D6:
		mov	ax, [bp+var_2]
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		cmp	[bx+4], di
		jnz	short loc_414FB
		mov	ax, [bp+var_2]
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	dword ptr [bx], 0
		dec	word ptr [si+10h]

loc_414FB:
		inc	[bp+var_2]

loc_414FE:
		mov	ax, [si+0Eh]
		cmp	ax, [bp+var_2]
		ja	short loc_414D6

loc_41506:
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	word ptr [bx], 0
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	ax, [bx+4]
		or	ax, [bx+6]
		jnz	short loc_41529
		jmp	loc_415F7

loc_41529:
		sub	dword ptr [si+1Ah], 2Ah
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		les	bx, [bx+4]
		cmp	byte ptr es:[bx+25h], 0
		jz	short loc_41599
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		mov	ax, es:[bx+20h]
		or	ax, es:[bx+22h]
		jz	short loc_41599
		push	0
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		mov	al, es:[bx+24h]
		push	ax
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		mov	ax, es:[bx+22h]
		mov	dx, es:[bx+20h]
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		lea	ax, [bp+var_6]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_41599

loc_41599:
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		les	bx, [bx+4]
		mov	word ptr es:[bx+22h], 0
		mov	word ptr es:[bx+20h], 0
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		mov	byte ptr es:[bx+25h], 0
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		mov	dword ptr es:[bx+26h], 0
		push	0
		push	2
		mov	ax, di
		shl	ax, 3
		mov	dx, [si+8]
		add	dx, ax
		add	dx, 4
		push	dx
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_415F7:
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	word ptr [bx+6], 0
		mov	word ptr [bx+4], 0
		pop	di
		pop	si
		leave
		retf
sub_41495		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4160F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_41634

loc_4161B:
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_41633
		push	di
		push	si
		push	cs
		call	near ptr sub_41495
		add	sp, 4

loc_41633:
		inc	di

loc_41634:
		cmp	[si+6], di
		ja	short loc_4161B
		pop	di
		pop	si
		pop	bp
		retf
sub_4160F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4163D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		cmp	word ptr [bx], 0
		jnz	short loc_4165B

loc_41655:
		xor	eax, eax
		jmp	loc_41720

loc_4165B:
		cli
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_41CEA
		add	sp, 6
		mov	di, ax
		cmp	di, 0FFFFh
		jnz	short loc_41675
		sti
		jmp	short loc_41655

loc_41675:
		inc	word ptr [si+14h]
		inc	dword ptr [si+16h]
		mov	eax, [si+16h]
		mov	bx, di
		imul	bx, bx, 14h
		mov	[bx+si+1Eh], eax
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bp+arg_2]
		mov	[bx+si+22h], ax
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bp+arg_4]
		mov	[bx+si+24h], ax
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bp+arg_6]
		mov	[bx+si+26h], ax
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		les	bx, [bx+4]
		mov	ax, es:[bx+4]
		sub	ax, [bp+arg_8]
		mov	bx, di
		imul	bx, bx, 14h
		mov	[bx+si+28h], ax
		mov	bx, di
		imul	bx, bx, 14h
		mov	byte ptr [bx+si+2Ah], 0
		mov	bx, di
		imul	bx, bx, 14h
		mov	byte ptr [bx+si+2Bh], 0
		mov	bx, di
		imul	bx, bx, 14h
		push	word ptr [bx+si+26h]
		mov	bx, di
		imul	bx, bx, 14h
		push	word ptr [bx+si+28h]
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	word ptr es:[bx]
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	large es:[bx+20h]
		push	di
		call	sub_3E6F5
		add	sp, 0Ch
		sti
		mov	bx, di
		imul	bx, bx, 14h
		mov	eax, [bx+si+1Eh]

loc_41720:
		shld	edx, eax, 10h
		pop	di
		pop	si
		pop	bp
		retf
sub_4163D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41729		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+arg_0]
		mov	[bp+var_1], 1
		xor	cx, cx
		jmp	short loc_41754

loc_4173A:
		mov	ax, cx
		imul	ax, ax, 14h
		mov	bx, dx
		add	bx, ax
		mov	eax, [bx+1Eh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_41753
		mov	[bp+var_1], 0
		jmp	short loc_41759

loc_41753:
		inc	cx

loc_41754:
		cmp	cx, 4
		jl	short loc_4173A

loc_41759:
		mov	al, [bp+var_1]
		leave
		retf
sub_41729		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4175E		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_4176A

loc_41769:
		inc	dx

loc_4176A:
		cmp	dx, 4
		jnb	short loc_4177E
		mov	bx, dx
		imul	bx, bx, 14h
		mov	eax, [bx+si+1Eh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_41769

loc_4177E:
		cmp	dx, 4
		jnb	short loc_417D9
		mov	bx, dx
		imul	bx, bx, 14h
		push	word ptr [bx+si+26h]
		mov	bx, dx
		imul	bx, bx, 14h
		mov	ax, [bx+si+22h]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		les	bx, [bx+4]
		push	word ptr es:[bx+4]
		mov	bx, dx
		imul	bx, bx, 14h
		mov	ax, [bx+si+22h]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	word ptr es:[bx]
		mov	bx, dx
		imul	bx, bx, 14h
		mov	ax, [bx+si+22h]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	large es:[bx+20h]
		push	dx
		call	sub_3E6F5
		add	sp, 0Ch

loc_417D9:
		pop	si
		pop	bp
		retf
sub_4175E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_417DC		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_417E7

loc_417E6:
		inc	cx

loc_417E7:
		cmp	cx, 4
		jnb	short loc_417FF
		mov	ax, cx
		imul	ax, ax, 14h
		mov	bx, dx
		add	bx, ax
		mov	eax, [bx+1Eh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_417E6

loc_417FF:
		cmp	cx, 4
		jnb	short loc_4180D
		push	cx
		push	dx
		push	cs
		call	near ptr sub_41465
		add	sp, 4

loc_4180D:
		pop	bp
		retf
sub_417DC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4180F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		cmp	word ptr [bx], 0
		jnz	short loc_4182D

loc_41827:
		xor	eax, eax
		jmp	loc_41916

loc_4182D:
		cli
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_41CEA
		add	sp, 6
		mov	di, ax
		cmp	di, 0FFFFh
		jnz	short loc_41847
		sti
		jmp	short loc_41827

loc_41847:
		inc	word ptr [si+14h]
		inc	dword ptr [si+16h]
		mov	eax, [si+16h]
		mov	bx, di
		imul	bx, bx, 14h
		mov	[bx+si+1Eh], eax
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bp+arg_2]
		mov	[bx+si+22h], ax
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bp+arg_4]
		mov	[bx+si+24h], ax
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bp+arg_6]
		mov	[bx+si+26h], ax
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		les	bx, [bx+4]
		mov	ax, es:[bx+4]
		sub	ax, [bp+arg_8]
		mov	bx, di
		imul	bx, bx, 14h
		mov	[bx+si+28h], ax
		mov	bx, di
		imul	bx, bx, 14h
		mov	byte ptr [bx+si+2Ah], 1
		mov	bx, di
		imul	bx, bx, 14h
		mov	byte ptr [bx+si+2Bh], 0
		mov	bx, di
		imul	bx, bx, 14h
		push	word ptr [bx+si+26h]
		mov	bx, di
		imul	bx, bx, 14h
		push	word ptr [bx+si+28h]
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	word ptr es:[bx+0Ch]
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	word ptr es:[bx+8]
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	word ptr es:[bx]
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	large es:[bx+20h]
		push	di
		call	sub_3E7BA
		add	sp, 10h
		sti
		mov	bx, di
		imul	bx, bx, 14h
		mov	eax, [bx+si+1Eh]

loc_41916:
		shld	edx, eax, 10h
		pop	di
		pop	si
		pop	bp
		retf
sub_4180F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4191F		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_4192B

loc_4192A:
		inc	dx

loc_4192B:
		cmp	dx, 4
		jnb	short loc_4193F
		mov	bx, dx
		imul	bx, bx, 14h
		mov	eax, [bx+si+1Eh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_4192A

loc_4193F:
		cmp	dx, 4
		jnb	short loc_41958
		mov	bx, dx
		imul	bx, bx, 14h
		cmp	byte ptr [bx+si+2Ah], 0
		jz	short loc_41994
		push	dx
		call	sub_3E84D
		pop	cx
		jmp	short loc_41994

loc_41958:
		cmp	word ptr [si+10h], 0
		jz	short loc_41994
		xor	dx, dx
		jmp	short loc_41963

loc_41962:
		inc	dx

loc_41963:
		cmp	[si+0Eh], dx
		jbe	short loc_4197B
		mov	ax, dx
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	eax, [bx]
		cmp	eax, [bp+arg_2]
		jnz	short loc_41962

loc_4197B:
		cmp	[si+0Eh], dx
		jbe	short loc_41994
		dec	word ptr [si+10h]
		mov	ax, dx
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	dword ptr [bx], 0

loc_41994:
		pop	si
		pop	bp
		retf
sub_4191F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41997		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_419A3

loc_419A2:
		inc	dx

loc_419A3:
		cmp	dx, 4
		jnb	short loc_419B7
		mov	bx, dx
		imul	bx, bx, 14h
		mov	eax, [bx+si+1Eh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_419A2

loc_419B7:
		cmp	dx, 4
		jnb	short loc_419C7
		push	dx
		push	si
		push	cs
		call	near ptr sub_41465
		add	sp, 4
		jmp	short loc_41A03

loc_419C7:
		cmp	word ptr [si+10h], 0
		jz	short loc_41A03
		xor	dx, dx
		jmp	short loc_419D2

loc_419D1:
		inc	dx

loc_419D2:
		cmp	[si+0Eh], dx
		jbe	short loc_419EA
		mov	ax, dx
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	eax, [bx]
		cmp	eax, [bp+arg_2]
		jnz	short loc_419D1

loc_419EA:
		cmp	[si+0Eh], dx
		jbe	short loc_41A03
		dec	word ptr [si+10h]
		mov	ax, dx
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	dword ptr [bx], 0

loc_41A03:
		pop	si
		pop	bp
		retf
sub_41997		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41A06		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_41A32

loc_41A10:
		mov	ax, cx
		imul	ax, ax, 14h
		mov	bx, dx
		add	bx, ax
		mov	eax, [bx+1Eh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_41A31
		mov	ax, cx
		imul	ax, ax, 14h
		mov	bx, dx
		add	bx, ax
		mov	ax, [bx+22h]
		jmp	short loc_41A3A

loc_41A31:
		inc	cx

loc_41A32:
		cmp	cx, 4
		jb	short loc_41A10
		mov	ax, 0FFFFh

loc_41A3A:
		pop	bp
		retf
sub_41A06		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41A3C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_41A5E

loc_41A48:
		mov	bx, di
		imul	bx, bx, 14h
		cmp	dword ptr [bx+si+1Eh], 0
		jz	short loc_41A5D
		push	di
		push	si
		push	cs
		call	near ptr sub_41465
		add	sp, 4

loc_41A5D:
		inc	di

loc_41A5E:
		cmp	di, 4
		jb	short loc_41A48
		xor	di, di
		jmp	short loc_41A8C

loc_41A67:
		mov	ax, di
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		cmp	dword ptr [bx], 0
		jz	short loc_41A8B
		dec	word ptr [si+10h]
		mov	ax, di
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	dword ptr [bx], 0

loc_41A8B:
		inc	di

loc_41A8C:
		cmp	[si+0Eh], di
		ja	short loc_41A67
		pop	di
		pop	si
		pop	bp
		retf
sub_41A3C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41A95		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_41A3C
		pop	cx
		push	0
		mov	ax, [si+0Eh]
		imul	ax, ax, 14h
		push	ax
		push	word ptr [si+12h]
		call	CRT_Memset
		add	sp, 6
		push	0
		push	50h
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	CRT_Memset
		add	sp, 6
		xor	di, di
		jmp	short loc_41B21

loc_41ACD:
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_41B20
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		les	bx, [bx+4]
		mov	eax, es:[bx]
		add	eax, 20h
		sub	[si+1Ah], eax
		push	0
		push	2
		mov	ax, di
		shl	ax, 3
		mov	dx, [si+8]
		add	dx, ax
		add	dx, 4
		push	dx
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	ax, di
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	word ptr [bx], 0

loc_41B20:
		inc	di

loc_41B21:
		cmp	[si+6], di
		ja	short loc_41ACD
		pop	di
		pop	si
		pop	bp
		retf
sub_41A95		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41B2A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	di, di
		jmp	short loc_41B3A

loc_41B39:
		inc	di

loc_41B3A:
		cmp	di, 4
		jnb	short loc_41B4F
		mov	bx, di
		imul	bx, bx, 14h
		mov	eax, [bx+si+1Eh]
		mov	bx, dx
		cmp	eax, [bx]
		jnz	short loc_41B39

loc_41B4F:
		cmp	di, 4
		jnb	short loc_41B6D
		push	[bp+arg_4]
		push	di
		call	sub_3E673
		add	sp, 4
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bp+arg_4]
		mov	[bx+si+26h], ax
		jmp	short loc_41BA6

loc_41B6D:
		cmp	word ptr [si+10h], 0
		jz	short loc_41BA6
		xor	di, di
		jmp	short loc_41B78

loc_41B77:
		inc	di

loc_41B78:
		cmp	[si+0Eh], di
		jbe	short loc_41B91
		mov	ax, di
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	eax, [bx]
		mov	bx, dx
		cmp	eax, [bx]
		jnz	short loc_41B77

loc_41B91:
		cmp	[si+0Eh], di
		jbe	short loc_41BA6
		mov	ax, di
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	ax, [bp+arg_4]
		mov	[bx+8], ax

loc_41BA6:
		pop	di
		pop	si
		pop	bp
		retf
sub_41B2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41BAA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, [bp+arg_4]
		xor	dx, dx
		jmp	short loc_41BBD

loc_41BBC:
		inc	dx

loc_41BBD:
		cmp	dx, 4
		jnb	short loc_41BD0
		mov	bx, dx
		imul	bx, bx, 14h
		mov	eax, [bx+si+1Eh]
		cmp	eax, [di]
		jnz	short loc_41BBC

loc_41BD0:
		cmp	dx, 4
		jnb	short loc_41BF0
		mov	bx, dx
		imul	bx, bx, 14h
		mov	[bx+si+28h], cx
		mov	bx, dx
		imul	bx, bx, 14h
		push	word ptr [bx+si+28h]
		push	dx
		call	sub_3E6BC
		add	sp, 4
		jmp	short loc_41C24

loc_41BF0:
		cmp	word ptr [si+10h], 0
		jz	short loc_41C24
		xor	dx, dx
		jmp	short loc_41BFB

loc_41BFA:
		inc	dx

loc_41BFB:
		cmp	[si+0Eh], dx
		jbe	short loc_41C12
		mov	ax, dx
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	eax, [bx]
		cmp	eax, [di]
		jnz	short loc_41BFA

loc_41C12:
		cmp	[si+0Eh], dx
		jbe	short loc_41C24
		mov	ax, dx
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	[bx+0Ah], cx

loc_41C24:
		pop	di
		pop	si
		pop	bp
		retf
sub_41BAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41C28		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, [bp+arg_4]
		xor	dx, dx
		jmp	short loc_41C3B

loc_41C3A:
		inc	dx

loc_41C3B:
		cmp	dx, 4
		jnb	short loc_41C4E
		mov	bx, dx
		imul	bx, bx, 14h
		mov	eax, [bx+si+1Eh]
		cmp	eax, [di]
		jnz	short loc_41C3A

loc_41C4E:
		cmp	dx, 4
		jnb	short loc_41C6E
		mov	bx, dx
		imul	bx, bx, 14h
		add	[bx+si+28h], cx
		mov	bx, dx
		imul	bx, bx, 14h
		push	word ptr [bx+si+28h]
		push	dx
		call	sub_3E6BC
		add	sp, 4
		jmp	short loc_41CA2

loc_41C6E:
		cmp	word ptr [si+10h], 0
		jz	short loc_41CA2
		xor	dx, dx
		jmp	short loc_41C79

loc_41C78:
		inc	dx

loc_41C79:
		cmp	[si+0Eh], dx
		jbe	short loc_41C90
		mov	ax, dx
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	eax, [bx]
		cmp	eax, [di]
		jnz	short loc_41C78

loc_41C90:
		cmp	[si+0Eh], dx
		jbe	short loc_41CA2
		mov	ax, dx
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		add	[bx+0Ah], cx

loc_41CA2:
		pop	di
		pop	si
		pop	bp
		retf
sub_41C28		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41CA6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_3DE30
		pop	bp
		retf
sub_41CA6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41CB3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_41CD6

loc_41CBF:
		mov	bx, di
		imul	bx, bx, 14h
		cmp	dword ptr [bx+si+1Eh], 0
		jnz	short loc_41CD5
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_41E0E
		add	sp, 4

loc_41CD5:
		inc	di

loc_41CD6:
		cmp	word ptr [si+14h], 4
		jnb	short loc_41CE6
		mov	bx, word_603E0
		cmp	word ptr [bx+10h], 0
		jnz	short loc_41CBF

loc_41CE6:
		pop	di
		pop	si
		pop	bp
		retf
sub_41CB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41CEA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 4
		jnb	short loc_41D4B
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		cmp	word ptr [bx], 0
		jnz	short loc_41D1D
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_4137E
		add	sp, 4
		or	al, al
		jnz	short loc_41D1D

loc_41D17:
		mov	ax, 0FFFFh
		jmp	loc_41DBD

loc_41D1D:
		xor	di, di
		jmp	short loc_41D22

loc_41D21:
		inc	di

loc_41D22:
		cmp	di, 4
		jge	short loc_41D33
		mov	bx, di
		imul	bx, bx, 14h
		cmp	dword ptr [bx+si+1Eh], 0
		jnz	short loc_41D21

loc_41D33:
		cmp	di, 4
		jge	short loc_41D3B
		jmp	loc_41DBB

loc_41D3B:
		push	word ptr [si+14h]
		push	3A56h
		call	sub_9D78

loc_41D46:
		add	sp, 4
		jmp	short loc_41DBB

loc_41D4B:
		xor	di, di
		mov	cx, 1
		jmp	short loc_41D67

loc_41D52:
		mov	bx, cx
		imul	bx, bx, 14h
		mov	ax, [bx+si+24h]
		mov	bx, di
		imul	bx, bx, 14h
		cmp	ax, [bx+si+24h]
		jnb	short loc_41D66
		mov	di, cx

loc_41D66:
		inc	cx

loc_41D67:
		cmp	cx, 4
		jl	short loc_41D52
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bx+si+24h]
		cmp	ax, [bp+arg_4]
		ja	short loc_41D17
		mov	ax, [bp+arg_2]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		cmp	word ptr [bx], 0
		jnz	short loc_41D9B
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_4137E
		add	sp, 4
		or	al, al
		jnz	short loc_41D9B
		jmp	loc_41D17

loc_41D9B:
		mov	bx, di
		imul	bx, bx, 14h
		cmp	byte ptr [bx+si+2Ah], 1
		jnz	short loc_41DB0
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_41DC1
		add	sp, 4

loc_41DB0:
		push	di
		push	si
		push	cs
		call	near ptr sub_41465
		jmp	short loc_41D46
		jmp	loc_41D17

loc_41DBB:
		mov	ax, di

loc_41DBD:
		pop	di
		pop	si
		pop	bp
		retf
sub_41CEA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41DC1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+10h]
		cmp	ax, [si+0Eh]
		jz	short loc_41E0B
		inc	word ptr [si+10h]
		xor	dx, dx
		jmp	short loc_41DD8

loc_41DD7:
		inc	dx

loc_41DD8:
		mov	ax, dx
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		cmp	dword ptr [bx], 0
		jnz	short loc_41DD7
		mov	ax, dx
		imul	ax, ax, 14h
		mov	dx, [si+12h]
		add	dx, ax
		push	ds
		push	dx
		mov	ax, [bp+arg_2]
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		add	dx, 1Eh
		push	ds
		push	dx
		mov	cx, 14h
		call	CRT_Fmemcpy

loc_41E0B:
		pop	si
		pop	bp
		retf
sub_41DC1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41E0E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		dec	word ptr [si+10h]
		mov	[bp+var_2], 0
		jmp	short loc_41E29

loc_41E26:
		inc	[bp+var_2]

loc_41E29:
		mov	ax, [bp+var_2]
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		cmp	dword ptr [bx], 0
		jz	short loc_41E26
		mov	ax, di
		imul	ax, ax, 14h
		mov	dx, si
		add	dx, ax
		add	dx, 1Eh
		push	ds
		push	dx
		mov	ax, [bp+var_2]
		imul	ax, ax, 14h
		mov	dx, [si+12h]
		add	dx, ax
		push	ds
		push	dx
		mov	cx, 14h
		call	CRT_Fmemcpy
		mov	ax, [bp+var_2]
		imul	ax, ax, 14h
		mov	bx, [si+12h]
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	word ptr [si+14h]
		mov	bx, di
		imul	bx, bx, 14h
		push	word ptr [bx+si+26h]
		mov	bx, di
		imul	bx, bx, 14h
		push	word ptr [bx+si+28h]
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bx+si+22h]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		les	bx, [bx+4]
		push	word ptr es:[bx+0Ch]
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bx+si+22h]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	word ptr es:[bx+8]
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bx+si+22h]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	word ptr es:[bx]
		mov	bx, di
		imul	bx, bx, 14h
		mov	ax, [bx+si+22h]
		shl	ax, 3
		mov	bx, [si+8]
		add	bx, ax
		mov	bx, [bx+4]
		push	large es:[bx+20h]
		push	di
		call	sub_3E7BA
		add	sp, 10h
		pop	di
		pop	si
		leave
		retf
sub_41E0E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41EEB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, word_603E0
		dec	word ptr [bx+14h]
		mov	ax, [bp+arg_0]
		imul	ax, ax, 14h
		add	bx, ax
sub_41EEB		endp

; START OF FUNCTION CHUNK FOR sub_41EEB
		db 66h, 0C7h
		inc	di
; END OF FUNCTION CHUNK FOR sub_41EEB
seg095		ends
