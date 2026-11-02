seg076		segment	para public 'CODE' use16
		assume cs:seg076
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0Eh, 0E8h, 20h, 0FFh, 83h, 0C4h, 2, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DCF9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2DCF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DD01		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2DD01		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DD09		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		call	sub_143DD
		add	sp, 2
		push	word_4D36E
		push	67C8h
		call	UI_ApplyEncodingHelper_35A77
		add	sp, 4
		cmp	[bp+arg_A], 0
		jz	short loc_2DD4A
		push	0
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	4
		push	5
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch

loc_2DD4A:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	27h
		push	5
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		push	di
		call	sub_143FC
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_2DD09		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DD70		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word_4D36E
		push	67C8h
		call	UI_ApplyEncodingHelper_35A77
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_2DD70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DD89		proc far

var_66		= word ptr -66h
var_9		= dword ptr -9
var_5		= dword ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_66], 480h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 5BDh
		push	0
		push	4092h
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 32h
		push	ds
		mov	ax, si
		add	ax, 51h
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	si
		leave
		retf
sub_2DD89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DE01		proc far

var_66		= word ptr -66h
var_9		= dword ptr -9
var_5		= dword ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_66], 480h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 5BDh
		push	1
		push	4092h
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 32h
		push	ds
		mov	ax, si
		add	ax, 51h
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	si
		leave
		retf
sub_2DE01		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DE79		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	409Eh
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jz	short loc_2DEB1
		call	sub_47BA8
		mov	[bp+var_2], al
		mov	al, [bp+var_2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_2DD01
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr sub_2DED8
		add	sp, 2

loc_2DEB1:
		push	0
		push	4092h
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jz	short loc_2DECD
		push	si
		nop
		push	cs
		call	near ptr sub_2DF50
		add	sp, 2
		jmp	short loc_2DED5

loc_2DECD:
		push	si
		push	cs
		call	near ptr sub_2DE01
		add	sp, 2

loc_2DED5:
		pop	si
		leave
		retf
sub_2DE79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DED8		proc far

var_66		= word ptr -66h
var_9		= dword ptr -9
var_5		= dword ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_66], 480h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 5BDh
		push	0
		push	409Eh
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 32h
		push	ds
		mov	ax, si
		add	ax, 51h
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	si
		leave
		retf
sub_2DED8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DF50		proc far

var_66		= word ptr -66h
var_9		= dword ptr -9
var_5		= dword ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	409Eh
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jnz	short loc_2DFD8
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_66], 480h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 5BDh
		push	1
		push	409Eh
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 32h
		push	ds
		mov	ax, si
		add	ax, 51h
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		jmp	short loc_2DFE3

loc_2DFD8:
		push	9025h
		call	sub_13451
		add	sp, 2

loc_2DFE3:
		pop	si
		leave
		retf
sub_2DF50		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DFE6		proc far

var_6A		= word ptr -6Ah
var_D		= dword ptr -0Dh
var_9		= dword ptr -9
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	0
		call	Music_Stop_2D9C2
		add	sp, 2
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_6A], 480h
		mov	[bp+var_9], 100h
		mov	[bp+var_D], 0
		mov	[bp+var_6A], 5BDh
		mov	[bp+var_2], 0
		jmp	loc_2E2B5

loc_2E024:
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	sub_45168
		add	sp, 2
		or	al, al
		jnz	short loc_2E037
		jmp	loc_2E2B2

loc_2E037:
		mov	[bp+var_3], 1
		jmp	loc_2E2A9

loc_2E03E:
		mov	al, byte ptr [bp+var_2]
		add	al, 41h
		mov	byte_4A533, al
		call	Joystick_InitCalibrationDefaults_45178
		push	32h
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	9Fh
		push	11h
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		mov	ax, [bp+var_2]
		shl	ax, 1
		add	ax, [bp+var_2]
		add	ax, 2Bh
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0A2h
		push	32h
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_2E08E

loc_2E089:
		call	sub_439D0

loc_2E08E:
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	sub_45152
		add	sp, 4
		or	al, al
		jnz	short loc_2E089
		jmp	short loc_2E0A7

loc_2E0A2:
		call	sub_439D0

loc_2E0A7:
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	sub_45152
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_2E0A2
		push	[bp+var_2]
		call	sub_451E9
		add	sp, 2
		jmp	short loc_2E0CD

loc_2E0C8:
		call	sub_439D0

loc_2E0CD:
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	sub_45152
		add	sp, 4
		or	al, al
		jnz	short loc_2E0C8
		push	32h
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	9Fh
		push	11h
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		mov	ax, [bp+var_2]
		shl	ax, 1
		add	ax, [bp+var_2]
		add	ax, 2Ch
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0A2h
		push	2Dh
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_2E122

loc_2E11D:
		call	sub_439D0

loc_2E122:
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	sub_45152
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_2E11D
		push	[bp+var_2]
		call	Joystick_ComputeCalibrationRatio_45225
		add	sp, 2
		jmp	short loc_2E148

loc_2E143:
		call	sub_439D0

loc_2E148:
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	sub_45152
		add	sp, 4
		or	al, al
		jnz	short loc_2E143
		push	32h
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	9Fh
		push	11h
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		mov	ax, [bp+var_2]
		shl	ax, 1
		add	ax, [bp+var_2]
		add	ax, 2Dh
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0A2h
		push	3Bh
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_2E19D

loc_2E198:
		call	sub_439D0

loc_2E19D:
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	sub_45152
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_2E198
		push	[bp+var_2]
		call	sub_45207
		add	sp, 2
		jmp	short loc_2E1C3

loc_2E1BE:
		call	sub_439D0

loc_2E1C3:
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	sub_45152
		add	sp, 4
		or	al, al
		jnz	short loc_2E1BE
		push	1Eh
		push	20h
		push	20h
		call	Joystick_InterpolateCalibrationPercent_4529E
		add	sp, 6
		cmp	word_4F7A2, 0
		jz	short loc_2E203
		cmp	word_4F7A6, 0
		jz	short loc_2E203
		cmp	word_4F7A4, 0
		jz	short loc_2E203
		cmp	word_4F7A8, 0
		jz	short loc_2E203
		mov	[bp+var_3], 0

loc_2E203:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2E242
		push	0
		push	1B50h
		lea	ax, [bp+var_6A]
		push	ax
		mov	bx, [bp+var_6A]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0
		push	large 22h
		push	ds
		push	offset word_4F792
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_4123E
		add	sp, 2
		jmp	short loc_2E2A9

loc_2E242:
		push	32h
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	9Fh
		push	11h
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		push	31h
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0A2h
		push	1Fh
		push	word_4D36E
		call	sub_38514
		add	sp, 0Ch
		push	3E8h
		call	PC_SoundOn
		add	sp, 2
		push	32h
		call	PIT_DelayLoop
		add	sp, 2
		call	sub_2159
		jmp	short loc_2E295

loc_2E290:
		call	sub_439D0

loc_2E295:
		push	3
		mov	al, byte ptr [bp+var_2]
		push	ax
		call	sub_45152
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_2E290

loc_2E2A9:
		cmp	[bp+var_3], 0
		jz	short loc_2E2B2
		jmp	loc_2E03E

loc_2E2B2:
		inc	[bp+var_2]

loc_2E2B5:
		cmp	[bp+var_2], 1
		jge	short loc_2E2BE
		jmp	loc_2E024

loc_2E2BE:
		push	0
		call	sub_450F2
		add	sp, 2
		push	1
		call	sub_45168
		add	sp, 2
		or	al, al
		jz	short loc_2E2F5
		call	sub_439D0
		push	1
		call	sub_451CD
		add	sp, 2
		mov	word_4A51D, ax
		cmp	word_4A51D, 0
		jnz	short loc_2E2F5
		mov	word_4A51D, 118h

loc_2E2F5:
		call	sub_2D9DE
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		leave
		retf
sub_2DFE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E30A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2E30A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E312		proc far
		push	bp
		mov	bp, sp
		mov	dword_4F4D6, 0
		mov	byte_4F4DA, 2
		mov	byte_4F4DB, 0
		mov	dword_4F4DC, 0
		mov	dword_4F4E0, 0
		mov	byte_4F4E4, 2
		mov	byte_4F4E5, 0
		mov	dword_4F4E6, 0
		mov	dword_4F4EA, 0
		mov	byte_4F4EE, 2
		mov	byte_4F4EF, 0
		mov	dword_4F4F0, 0
		mov	dword_4F4F4, 0
		mov	byte_4F4F8, 2
		mov	byte_4F4F9, 0
		mov	dword_4F4FA, 0
		mov	dword_4F4FE, 0
		mov	byte_4F502, 2
		mov	byte_4F503, 0
		mov	dword_4F504, 0
		mov	dword_4F508, 0
		mov	byte_4F50C, 2
		mov	byte_4F50D, 0
		mov	dword_4F50E, 0
		mov	dword_4F512, 0
		mov	byte_4F516, 2
		mov	byte_4F517, 0
		mov	dword_4F518, 0
		mov	dword_4F51C, 0
		mov	byte_4F520, 2
		mov	byte_4F521, 0
		mov	dword_4F522, 0
		mov	word_4F529, 0
		mov	al, 1
		mov	byte_4F531, al
		mov	byte_4F530, al
		mov	byte_4F52F, al
		mov	byte_4F52E, al
		mov	byte_4F52D, al
		mov	byte_4F52C, al
		mov	byte_4F52B, al
		mov	byte_4F528, al
		mov	byte_4F527, al
		mov	word_4F532, 4
		mov	word_4F534, 2
		mov	word_4F536, 2
		mov	word_4F538, 2
		mov	byte_4F53A, 1
		mov	byte_4F53B, 0
		mov	byte_4F53C, 1
		mov	al, 0
		mov	byte_4F53F, al
		mov	byte_4F53E, al
		mov	byte_4F53D, al
		mov	al, 0
		mov	byte_4F546, al
		mov	byte_4F544, al
		mov	byte_4F543, al
		mov	byte_4F545, al
		mov	byte_4F542, al
		mov	byte_4F541, al
		mov	byte_4F540, al
		mov	word_4F547, 0
		mov	byte_4F549, 1
		mov	byte_4F54A, 1
		mov	byte_4F54B, 0
		mov	byte_4F54C, 1
		mov	byte_4F54D, 1
		mov	byte_4F54E, 0
		mov	al, 0
		mov	byte_4F550, al
		mov	byte_4F54F, al
		mov	al, 1
		mov	byte_4F553, al
		mov	byte_4F552, al
		mov	byte_4F551, al
		mov	al, 0
		mov	byte_4F558, al
		mov	byte_4F557, al
		mov	byte_4F556, al
		mov	byte_4F555, al
		mov	byte_4F554, al
		pop	bp
		retf
sub_2E312		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 24 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceFile_ReleaseMultipleBlocks_90AD6 (sub_90AD6 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 156 lignes, NON DÉTAILLÉE — libère 5 blocs typés (Memory_TypedFree_5C7B6 ×5).
; ==============================================================================================
ResourceFile_ReleaseMultipleBlocks_2E4AB		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4F521, 0
		jz	short loc_2E4D3
		cmp	dword_4F51C, 0
		jz	short loc_2E4D3
		push	0
		mov	al, byte_4F520
		push	ax
		push	6B3Ch
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E4D3

loc_2E4D3:
		mov	dword_4F51C, 0
		mov	byte_4F521, 0
		mov	dword_4F522, 0
		cmp	byte_4F517, 0
		jz	short loc_2E50F
		cmp	dword_4F512, 0
		jz	short loc_2E50F
		push	0
		mov	al, byte_4F516
		push	ax
		push	6B32h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E50F

loc_2E50F:
		mov	dword_4F512, 0
		mov	byte_4F517, 0
		mov	dword_4F518, 0
		cmp	byte_4F50D, 0
		jz	short loc_2E54B
		cmp	dword_4F508, 0
		jz	short loc_2E54B
		push	0
		mov	al, byte_4F50C
		push	ax
		push	6B28h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E54B

loc_2E54B:
		mov	dword_4F508, 0
		mov	byte_4F50D, 0
		mov	dword_4F50E, 0
		cmp	byte_4F503, 0
		jz	short loc_2E587
		cmp	dword_4F4FE, 0
		jz	short loc_2E587
		push	0
		mov	al, byte_4F502
		push	ax
		push	6B1Eh
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E587

loc_2E587:
		mov	dword_4F4FE, 0
		mov	byte_4F503, 0
		mov	dword_4F504, 0
		cmp	byte_4F4F9, 0
		jz	short loc_2E5C3
		cmp	dword_4F4F4, 0
		jz	short loc_2E5C3
		push	0
		mov	al, byte_4F4F8
		push	ax
		push	6B14h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E5C3

loc_2E5C3:
		mov	dword_4F4F4, 0
		mov	byte_4F4F9, 0
		mov	dword_4F4FA, 0
		cmp	byte_4F4EF, 0
		jz	short loc_2E5FF
		cmp	dword_4F4EA, 0
		jz	short loc_2E5FF
		push	0
		mov	al, byte_4F4EE
		push	ax
		push	6B0Ah
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E5FF

loc_2E5FF:
		mov	dword_4F4EA, 0
		mov	byte_4F4EF, 0
		mov	dword_4F4F0, 0
		cmp	byte_4F4E5, 0
		jz	short loc_2E63B
		cmp	dword_4F4E0, 0
		jz	short loc_2E63B
		push	0
		mov	al, byte_4F4E4
		push	ax
		push	6B00h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E63B

loc_2E63B:
		mov	dword_4F4E0, 0
		mov	byte_4F4E5, 0
		mov	dword_4F4E6, 0
		cmp	byte_4F4DB, 0
		jz	short loc_2E677
		cmp	dword_4F4D6, 0
		jz	short loc_2E677
		push	0
		mov	al, byte_4F4DA
		push	ax
		push	6AF6h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_2E677

loc_2E677:
		mov	dword_4F4D6, 0
		mov	byte_4F4DB, 0
		mov	dword_4F4DC, 0
		pop	bp
		retf
ResourceFile_ReleaseMultipleBlocks_2E4AB		endp
seg076		ends
