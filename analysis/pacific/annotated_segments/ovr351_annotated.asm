ovr351		segment	para public 'OVERLAY' use16
		assume cs:ovr351
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C1F30		proc far

var_AE		= word ptr -0AEh
var_5E		= word ptr -5Eh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0AEh
		push	si
		mov	si, [bp+arg_0]
		push	word_7AF7C
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
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
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		push	seg seg008
		push	offset loc_61B6
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_AE]
		push	ax
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
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
		call	TextRenderer_LoadResourceFile_6E338
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
		call	sub_690A8
		add	sp, 4
		cmp	[bp+var_5], 0
		jz	short loc_C2042
		cmp	[bp+var_A], 0
		jz	short loc_C2042
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C2042

loc_C2042:
		pop	si
		leave
		retf
sub_C1F30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C2045		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C2061
		push	6Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_C2061
		jmp	loc_C20F0

loc_C2061:
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
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		mov	word ptr [si+43h], 909h
		xor	ax, ax
		mov	[si+47h], ax
		mov	[si+45h], ax
		mov	word ptr [si+43h], 391Fh
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+65h], 2
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_754F5
		pop	cx
		push	si
		push	cs
		call	near ptr sub_C1F30
		pop	cx
		mov	ax, [bp+arg_4]
		mov	[si+28h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Ah], ax
		mov	ax, [bp+arg_2]
		mov	[si+6Bh], ax
		push	si
		nop
		push	cs
		call	near ptr sub_C2264
		pop	cx

loc_C20F0:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C2045		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C20F5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C2111
		push	6Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_C2111
		jmp	loc_C219F

loc_C2111:
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
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		mov	word ptr [si+43h], 909h
		xor	ax, ax
		mov	[si+47h], ax
		mov	[si+45h], ax
		mov	word ptr [si+43h], 391Fh
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+65h], 2
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_754F5
		pop	cx
		push	si
		push	cs
		call	near ptr sub_C1F30
		pop	cx
		mov	ax, [bp+arg_4]
		mov	[si+28h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Ah], ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_C234E
		add	sp, 4

loc_C219F:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C20F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C21A4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_C21B6
		jmp	loc_C2260

loc_C21B6:
		push	si
		nop
		push	cs
		call	near ptr sub_C23E6
		pop	cx
		mov	word ptr [si+43h], 391Fh
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_754FA
		pop	cx
		cmp	byte ptr [si+66h], 0
		jz	short loc_C21F4
		cmp	dword ptr [si+61h], 0
		jz	short loc_C21F4
		push	0
		mov	al, [si+65h]
		push	ax
		mov	ax, si
		add	ax, 61h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C21F4

loc_C21F4:
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	word ptr [si+43h], 909h
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_68B0D
		pop	cx
		push	2
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	sub_69368
		add	sp, 4
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_C2260
		push	si
		call	sub_3B2
		pop	cx

loc_C2260:
		pop	di
		pop	si
		pop	bp
		retf
sub_C21A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C2264		proc far

var_D6		= word ptr -0D6h
var_75		= dword ptr -75h
var_69		= word ptr -69h
var_65		= dword ptr -65h
var_5E		= word ptr -5Eh
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0D6h
		push	si
		mov	si, [bp+arg_0]
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	3Bh
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	word ptr [si+6Bh]
		lea	ax, [bp+var_D6]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	ax, [bp+var_69]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C22DC
		mov	eax, [bp+var_75]
		jmp	short loc_C22E0

loc_C22DC:
		mov	eax, [bp+var_65]

loc_C22E0:
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	dx
		push	ax
		push	word ptr [si+6Bh]
		lea	ax, [bp+var_D6]
		push	ax
		call	sub_75C8
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
		lea	ax, [bp+var_D6]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		pop	si
		leave
		retf
sub_C2264		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C234E		proc far

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
		call	StreamReader_ConstructVariantC_6BFD4
		add	sp, 6
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	large 0FFFFFFFFh
		push	large [bp+var_4]
		push	dx
		push	ax
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
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
		call	sub_6C2A4
		pop	cx
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_Close_6C110
		add	sp, 4
		pop	si
		leave
		retf
sub_C234E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C23E6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		push	2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		pop	bp
		retf
sub_C23E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_GetSubpartAttrib (sub_381F2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,14L — accesseur
; d'un champ (+0x13 via référence +0xE) : getter d'un attribut de sous-composant.
; ==============================================================================================
Debris_GetSubpartAttrib_C23FE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		les	bx, [bx+4]
		mov	al, es:[bx]
		pop	bp
		retf
Debris_GetSubpartAttrib_C23FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C240E		proc far

var_1EA		= word ptr -1EAh
var_19A		= word ptr -19Ah
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1EAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_2], ax
		mov	[bp+var_4], ax
		mov	byte ptr [bp+var_19A], 0
		jmp	loc_C24C0

loc_C2431:
		mov	ax, di
		sub	ax, [bp+var_4]
		push	ax
		push	[bp+var_4]
		lea	ax, [bp+var_19A]
		push	ax
		call	sub_2F00
		add	sp, 6
		mov	al, [di+1]
		cbw
		mov	[bp+var_8], ax
		mov	cx, 4
		mov	bx, offset word_C256F

loc_C2454:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_8]
		jz	short loc_C2463
		add	bx, 2
		loop	short loc_C2454
		jmp	short loc_C24AC

loc_C2463:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_C2467:
		mov	bx, [si+28h]
		push	word ptr [bx]

loc_C246C:
		lea	ax, [bp+var_19A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	short loc_C24BD

loc_C247E:
		mov	bx, [si+28h]
		push	word ptr [bx+2]
		jmp	short loc_C246C

loc_C2486:
		mov	bx, [si+28h]
		push	word ptr [bx+4]
		jmp	short loc_C246C

loc_C248E:
		push	0Ah
		push	[bp+var_A]
		push	53h
		call	GameVar_Get_56414
		pop	cx
		add	ax, 76Ch
		push	ax
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	[bp+var_A]
		jmp	short loc_C246C

loc_C24AC:
		inc	di
		push	382Eh
		lea	ax, [bp+var_19A]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_C24BD:
		mov	[bp+var_4], di

loc_C24C0:
		push	24h
		push	[bp+var_4]
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	di, ax
		or	ax, ax
		jz	short loc_C24D6
		jmp	loc_C2431

loc_C24D6:
		push	[bp+var_4]
		lea	ax, [bp+var_19A]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		call	sub_65A86
		pop	cx
		lea	ax, [bp+var_19A]
		push	ax
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_2], ax
		mov	si, [bp+var_2]
		mov	[bp+var_6], 4
		jmp	short loc_C2555

loc_C2507:
		cmp	dx, 1Eh
		jle	short loc_C251E
		mov	di, 1Eh
		jmp	short loc_C2512

loc_C2511:
		dec	di

loc_C2512:
		mov	bx, di
		cmp	byte ptr [bx+si], 20h
		jnz	short loc_C2511
		mov	byte ptr [bx+si], 0
		jmp	short loc_C2521

loc_C251E:
		mov	di, dx
		dec	di

loc_C2521:
		push	seg seg008
		push	offset loc_61E8
		lea	ax, [bp+var_1EA]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	si
		push	2
		push	[bp+var_6]
		lea	ax, [bp+var_1EA]
		push	ax
		push	[bp+arg_2]
		call	sub_75D4A
		add	sp, 0Ah
		add	[bp+var_6], 0Fh
		mov	ax, di
		add	ax, si
		inc	ax
		mov	si, ax

loc_C2555:
		push	si
		call	CRT_Strlen
		pop	cx
		mov	dx, ax
		or	ax, ax
		jnz	short loc_C2507
		push	[bp+var_2]
		call	sub_65A86
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_C240E		endp

; START OF FUNCTION CHUNK FOR sub_C240E
word_C256F	dw 43h
		dw 4Eh
		dw 53h
		dw 59h
off_C2577	dw offset loc_C2486
		dw offset loc_C247E
		dw offset loc_C2467
		dw offset loc_C248E
; END OF FUNCTION CHUNK FOR sub_C240E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C257F		proc far

var_15C		= word ptr -15Ch
var_10C		= word ptr -10Ch
var_AF		= dword ptr -0AFh
var_AB		= dword ptr -0ABh
var_A7		= dword ptr -0A7h
var_9F		= byte ptr -9Fh
var_96		= dword ptr -96h
var_64		= word ptr -64h
var_14		= word ptr -14h
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 15Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	3Ch
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_10C]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_10C], 508h
		mov	[bp+var_AB], 100h
		mov	[bp+var_AF], 0
		mov	[bp+var_10C], 520h
		push	1
		lea	ax, [bp+var_64]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		mov	bx, [bp+var_10C]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_C264A
		shl	bx, 1
		jmp	cs:off_C27E2[bx]	; switch jump

loc_C2618:
		mov	[bp+var_4], 45434146h
		jmp	short loc_C2653

loc_C2622:
		mov	[bp+var_4], 52474946h
		jmp	short loc_C2653

loc_C262C:
		mov	[bp+var_4], 4C504346h
		jmp	short loc_C2653

loc_C2636:
		mov	[bp+var_4], 4C504746h
		jmp	short loc_C2653

loc_C2640:
		mov	[bp+var_4], 47494650h
		jmp	short loc_C2653

loc_C264A:
		push	0F001h
		call	sub_1DDFE
		pop	cx

loc_C2653:
		push	0
		push	large [bp+var_4]
		lea	ax, [bp+var_10C]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C2673
		push	0F00h
		call	sub_1DDFE
		pop	cx

loc_C2673:
		mov	[bp+var_5], 0
		jmp	short loc_C26BA

loc_C2679:
		mov	[bp+var_C], 0
		push	large 8
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_10C]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_14]
		push	ax
		push	[bp+arg_4]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_C26AB
		mov	[bp+var_5], 1
		jmp	short loc_C26D3

loc_C26AB:
		mov	eax, [bp+var_96]
		mov	[bp+var_A7], eax
		mov	[bp+var_9F], 0

loc_C26BA:
		push	1
		push	large 41544144h
		lea	ax, [bp+var_10C]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C2679

loc_C26D3:
		push	seg seg008
		push	offset loc_61C8
		lea	ax, [bp+var_15C]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C2705
		push	[bp+arg_4]
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_15C]
		push	ax
		call	Runtime_FatalErrorHandler_68BA2
		add	sp, 6

loc_C2705:
		lea	ax, [bp+var_10C]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_6], al
		lea	ax, [bp+var_10C]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		cmp	[bp+arg_2], 0
		jz	short loc_C272A
		cmp	[bp+arg_2], 1
		jnz	short loc_C273D

loc_C272A:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	39h
		jmp	short loc_C274E

loc_C273D:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	3Ah

loc_C274E:
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	al, [bp+var_6]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_75509
		add	sp, 6
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_A], eax
		mov	al, [si+4]
		mov	[bp+var_B], al
		mov	eax, [bp+var_A]
		mov	[di], eax
		mov	al, [bp+var_B]
		mov	[di+4], al
		mov	byte ptr [di+5], 0
		mov	dword ptr [di+6], 0
		mov	eax, [si+6]
		mov	[di+6], eax
		mov	[bp+var_10C], 520h
		lea	ax, [bp+var_10C]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_10C]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C257F		endp

; START OF FUNCTION CHUNK FOR sub_C257F
off_C27E2	dw offset loc_C2618
		dw offset loc_C2622
		dw offset loc_C262C
		dw offset loc_C2636
		dw offset loc_C2640
; END OF FUNCTION CHUNK FOR sub_C257F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConvData_LoadByName_C38E (sub_C38E de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Charge l'élément de type 0 nommé arg_0 par sub_C13D (pas lue, cherche dans convdata.iff)
; dans le descripteur arg_2, avec le drapeau arg_4. mid1 : visage « air » (« pri » dans
; optest.asm : octets modifiés par Rémi, « air » à l'origine) (scènes 9 et 17).
; ==============================================================================================
ConvData_LoadByName_C27EC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	0
		push	ax
		push	cs
		call	near ptr sub_C257F
		add	sp, 8
		pop	bp
		retf
ConvData_LoadByName_C27EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C2804		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		mov	si, [bp+arg_0]
		push	seg seg008
		push	offset loc_61E1
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	[bp+arg_2]
		lea	ax, [bp+var_50]
		push	ax
		push	2
		push	si
		push	cs
		call	near ptr sub_C257F
		add	sp, 8
		pop	si
		leave
		retf
sub_C2804		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConvData_LoadByName_C38E (sub_C38E de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Charge l'élément de type 0 nommé arg_0 par sub_C13D (pas lue, cherche dans convdata.iff)
; dans le descripteur arg_2, avec le drapeau arg_4. mid1 : visage « air » (« pri » dans
; optest.asm : octets modifiés par Rémi, « air » à l'origine) (scènes 9 et 17).
; ==============================================================================================
ConvData_LoadByName_C2834		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	1
		push	ax
		push	cs
		call	near ptr sub_C257F
		add	sp, 8
		pop	bp
		retf
ConvData_LoadByName_C2834		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C284C		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		mov	si, [bp+arg_0]
		push	seg seg008
		push	offset loc_61E1
		lea	ax, [bp+var_50]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	[bp+arg_2]
		lea	ax, [bp+var_50]
		push	ax
		push	3
		push	si
		push	cs
		call	near ptr sub_C257F
		add	sp, 8
		pop	si
		leave
		retf
sub_C284C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C287C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		push	ds
		push	di
		push	ds
		push	ax
		call	sub_38D6
		add	sp, 8
		push	64h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	di
		call	sub_3949
		add	sp, 8
		or	ax, ax
		jz	short loc_C28BD
		jmp	loc_C29C7

loc_C28BD:
		push	834h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_C28E3
		push	65h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	si
		call	sub_38D6
		add	sp, 8

loc_C28E3:
		push	835h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_C2909
		push	large 66h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	si
		call	sub_38D6
		add	sp, 8

loc_C2909:
		push	836h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_C292F
		push	67h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	si
		call	sub_38D6
		add	sp, 8

loc_C292F:
		push	837h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_C2955
		push	68h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	si
		call	sub_38D6
		add	sp, 8

loc_C2955:
		push	838h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_C297B
		push	69h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	si
		call	sub_38D6
		add	sp, 8

loc_C297B:
		push	839h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_C29A1
		push	6Ah
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	si
		call	sub_38D6
		add	sp, 8

loc_C29A1:
		push	83Ah
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_C29C7
		push	6Bh
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	si
		call	sub_38D6
		add	sp, 8

loc_C29C7:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_C287C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C29CD		proc far

var_256		= word ptr -256h
var_206		= word ptr -206h
var_1B6		= word ptr -1B6h
var_166		= word ptr -166h
var_116		= word ptr -116h
var_B9		= dword ptr -0B9h
var_B5		= dword ptr -0B5h
var_B1		= dword ptr -0B1h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_6E		= word ptr -6Eh
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 256h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	3Ch
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_116]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_116], 508h
		mov	[bp+var_B5], 100h
		mov	[bp+var_B9], 0
		mov	[bp+var_116], 520h
		push	1
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_116]
		push	ax
		mov	bx, [bp+var_116]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	37h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_166]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	38h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_1B6]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	39h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_206]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	3Ah
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_256]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	[bp+var_1], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_C287C
		add	sp, 4
		mov	di, ax
		push	0
		push	large 534B4342h
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		jmp	short loc_C2BC9

loc_C2B60:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C2BAB
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	di
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_C2BB4
		mov	[bp+var_1], 1
		jmp	short loc_C2BE5

loc_C2BAB:
		push	0F003h
		call	sub_1DDFE
		pop	cx

loc_C2BB4:
		mov	eax, [bp+var_A0]
		mov	[bp+var_B1], eax
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_C2BC9:
		push	1
		push	large 4B434142h
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_C2BE5
		jmp	loc_C2B60

loc_C2BE5:
		push	di
		call	sub_3B2
		pop	cx
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C2BFE
		push	0F004h
		call	sub_1DDFE
		pop	cx

loc_C2BFE:
		mov	eax, [bp+var_A0]
		mov	[bp+var_B1], eax
		push	0
		push	large 41544144h
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C2C24
		jmp	loc_C2E9A

loc_C2C24:
		mov	eax, [bp+var_A4]
		mov	ebx, 5
		cdq
		idiv	ebx
		mov	[bp+var_2], al
		cmp	[bp+var_2], 14h
		jb	short loc_C2C46
		push	9998h
		call	sub_1DDFE
		pop	cx

loc_C2C46:
		xor	di, di
		jmp	loc_C2E82

loc_C2C4B:
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_4], al
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_5], al
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_6], al
		cmp	[bp+var_4], 0
		jz	short loc_C2C7E
		jmp	loc_C2D87

loc_C2C7E:
		mov	al, [bp+var_5]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_206]
		push	ax
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_75509
		add	sp, 6
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_A], eax
		mov	al, [bx+4]
		mov	byte ptr [bp+var_C+1], al
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		add	bx, ax
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		add	bx, ax
		mov	al, byte ptr [bp+var_C+1]
		mov	[bx+4], al
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	bx, cx
		mov	eax, [bx+6]
		mov	dx, di
		imul	dx, dx, 0Ah
		mov	bx, [bp+arg_4]
		add	bx, dx
		mov	[bx+6], eax
		mov	al, [bp+var_6]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_256]
		push	ax
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_75509
		add	sp, 6
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_10], eax
		mov	al, [bx+4]
		mov	[bp+var_11], al
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	ax, word ptr [bp+var_10+2]
		mov	dx, word ptr [bp+var_10]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	al, [bp+var_11]

loc_C2D4D:
		mov	[bx+4], al
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	bx, cx
		mov	eax, [bx+6]
		mov	dx, di
		imul	dx, dx, 0Ah
		mov	bx, [bp+arg_6]
		add	bx, dx
		mov	[bx+6], eax
		jmp	loc_C2E6B

loc_C2D87:
		cmp	[bp+var_4], 1
		jz	short loc_C2D90
		jmp	loc_C2E62

loc_C2D90:
		mov	al, [bp+var_5]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_166]
		push	ax
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_75509
		add	sp, 6
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_16], eax
		mov	al, [bx+4]
		mov	[bp+var_17], al
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		add	bx, ax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		add	bx, ax
		mov	al, [bp+var_17]
		mov	[bx+4], al
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_4]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	bx, cx
		mov	eax, [bx+6]
		mov	dx, di
		imul	dx, dx, 0Ah
		mov	bx, [bp+arg_4]
		add	bx, dx
		mov	[bx+6], eax
		mov	al, [bp+var_6]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_1B6]
		push	ax
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_75509
		add	sp, 6
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		mov	al, [bx+4]
		mov	[bp+var_1D], al
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	ax, word ptr [bp+var_1C+2]
		mov	dx, word ptr [bp+var_1C]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	al, [bp+var_1D]
		jmp	loc_C2D4D

loc_C2E62:
		push	0F005h
		call	sub_1DDFE
		pop	cx

loc_C2E6B:
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	dx, di
		shl	dx, 1
		mov	bx, [bp+arg_8]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_C2E82:
		mov	al, [bp+var_2]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_C2E8E
		jmp	loc_C2C4B

loc_C2E8E:
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_Helper_6D61E
		jmp	short loc_C2EA2

loc_C2E9A:
		push	0F006h
		call	sub_1DDFE

loc_C2EA2:
		pop	cx
		mov	al, [bp+var_2]
		mov	[bp+var_3], al
		mov	[bp+var_116], 520h
		lea	ax, [bp+var_116]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_116]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_C29CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Interpréteur des scripts de conversation de Pacific Strike (équivalent
; de Conv_PlayScript_5AA4E d'OPTEST). Octet de commande, cmp bx, 11h puis table off_C4370 (18
; cas) : 0 GROUP_SHOT, 1 figurant, 3 CLOSEUP, 5 IF_FLAG (var_15 = 1 si le drapeau n'est pas
; posé), 10 SHOW_TEXT, 12 ELSE (inverse var_15), 13 ENDIF (var_15 = 0), 16 rien, 17 repères de
; carte ; autre = erreur 9999h. Tant que var_15 est posé, GROUP_SHOT et CLOSEUP sont lus sans
; être affichés. Voix : le dword après le texte est passé à la lecture de la parole («
; strtspch ») si son mot bas ≠ 65535. analysis/pacific/README.md § 4.
; ==============================================================================================
Conv_PlayScript_C2ED0		proc far

var_4B8		= word ptr -4B8h
var_4B6		= word ptr -4B6h
var_4B4		= word ptr -4B4h
var_4B2		= word ptr -4B2h
var_4A8		= word ptr -4A8h
var_480		= word ptr -480h
var_3EA		= word ptr -3EAh
var_3E8		= byte ptr -3E8h
var_3E7		= dword ptr -3E7h
var_3E3		= word ptr -3E3h
var_3E0		= word ptr -3E0h
var_3A4		= word ptr -3A4h
var_3A2		= byte ptr -3A2h
var_3A1		= word ptr -3A1h
var_3A0		= word ptr -3A0h
var_39E		= byte ptr -39Eh
var_39D		= word ptr -39Dh
var_39C		= word ptr -39Ch
var_39A		= byte ptr -39Ah
var_398		= dword ptr -398h
var_394		= dword ptr -394h
var_390		= word ptr -390h
var_38E		= word ptr -38Eh
var_36E		= word ptr -36Eh
var_35A		= word ptr -35Ah
var_332		= word ptr -332h
var_32E		= word ptr -32Eh
var_30A		= word ptr -30Ah
var_2DE		= word ptr -2DEh
var_2B6		= word ptr -2B6h
var_2A6		= word ptr -2A6h
var_27E		= word ptr -27Eh
var_1EE		= word ptr -1EEh
var_1B6		= word ptr -1B6h
var_126		= word ptr -126h
var_124		= word ptr -124h
var_11C		= word ptr -11Ch
var_11A		= byte ptr -11Ah
var_104		= word ptr -104h
var_EE		= word ptr -0EEh
var_EC		= byte ptr -0ECh
var_EB		= word ptr -0EBh
var_E7		= word ptr -0E7h
var_E4		= word ptr -0E4h
var_E2		= word ptr -0E2h
var_E0		= word ptr -0E0h
var_D7		= dword ptr -0D7h
var_D3		= word ptr -0D3h
var_D2		= word ptr -0D2h
var_D0		= byte ptr -0D0h
var_CF		= dword ptr -0CFh
var_CB		= word ptr -0CBh
var_C5		= word ptr -0C5h
var_C2		= word ptr -0C2h
var_C0		= word ptr -0C0h
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= word ptr -50h
var_4F		= word ptr -4Fh
var_4E		= word ptr -4Eh
var_4D		= word ptr -4Dh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_49		= word ptr -49h
var_47		= word ptr -47h
var_46		= word ptr -46h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_37		= word ptr -37h
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= word ptr -14h
var_A		= word ptr -0Ah
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4A8h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, di
		add	ax, 2Ch
		push	ax
		push	word_7AF7C
		lea	ax, [bp+var_C2]
		push	ax
		call	sub_75D04
		add	sp, 6
		mov	byte_7D13E, 0
		mov	byte ptr [bp+var_A], 0
		mov	byte ptr [bp+var_14], 0
		mov	[bp+var_15], 0
		mov	bx, [di+2Ah]
		mov	byte ptr [bx], 0
		jmp	loc_C4347

loc_C2F0D:
		mov	[bp+var_16], 0
		call	sub_75750
		cmp	byte_7D13E, 0
		jz	short loc_C2F2B
		lea	ax, [bp+var_C0]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		jmp	loc_C436C

loc_C2F2B:
		les	bx, [di+4]
		inc	word ptr [di+4]
		mov	al, es:[bx]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 11h
		jbe	short loc_C2F40
		jmp	loc_C433E

loc_C2F40:
		shl	bx, 1
		jmp	cs:off_C4370[bx]	; switch jump

loc_C2F47:
		call	sub_75750
		mov	[bp+var_1C], 390Fh
		mov	byte ptr [bp+var_1A], 0Bh
		mov	[bp+var_1C], 3917h
		push	di
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_756B3
		add	sp, 4
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_756B8
		pop	cx
		mov	[bp+var_15], al
		jmp	loc_C4347

loc_C2F77:
		cmp	[bp+var_15], 0
		jz	short loc_C2F84
		mov	[bp+var_15], 0
		jmp	loc_C4347

loc_C2F84:
		mov	[bp+var_15], 1
		jmp	loc_C4347

loc_C2F8B:
		mov	[bp+var_15], 0
		jmp	loc_C4347

loc_C2F92:
		call	sub_75750
		mov	[bp+var_D2], 390Fh
		mov	[bp+var_D0], 1
		mov	[bp+var_D2], 3907h
		push	di
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_7569F
		add	sp, 4
		jmp	loc_C4347

loc_C2FB9:
		call	sub_75750
		mov	[bp+var_20], 390Fh
		mov	byte ptr [bp+var_1E], 0Ah
		mov	[bp+var_20], 38FFh
		mov	[bp+var_1C], 0
		mov	[bp+var_1A], 0FFFFh
		push	di
		lea	ax, [bp+var_20]
		push	ax
		call	sub_756A9
		add	sp, 4
		mov	[bp+var_20], 38FFh
		push	[bp+var_1C]
		call	sub_65A86
		pop	cx
		jmp	loc_C4347

loc_C2FF4:
		call	sub_75750
		mov	[bp+var_11C], 390Fh
		mov	[bp+var_11A], 11h
		mov	[bp+var_11C], 38F7h
		mov	[bp+var_C5], 0
		push	di
		lea	ax, [bp+var_11C]
		push	ax
		call	sub_7569A
		add	sp, 4
		jmp	loc_C4347

loc_C3021:
		cmp	[bp+var_15], 0
		jz	short loc_C304E
		call	sub_75750
		mov	[bp+var_39C], 390Fh
		mov	[bp+var_39A], 0
		mov	[bp+var_39C], 38EFh
		push	di
		lea	ax, [bp+var_39C]
		push	ax
		call	sub_75690
		add	sp, 4
		jmp	loc_C4347

loc_C304E:
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_20], ax
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_26]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_E2]
		push	ax
		call	LayerGroup_Construct_66650
		add	sp, 8
		mov	[bp+var_EE], 390Fh
		mov	[bp+var_EC], 0
		mov	[bp+var_EE], 38EFh
		push	di
		lea	ax, [bp+var_EE]
		push	ax
		call	sub_75690
		add	sp, 4
		lea	ax, [bp+var_EB]
		mov	[bp+var_28], ax
		push	seg stub253
		push	offset sub_735A5
		push	large 10014h
		push	0Ah
		lea	ax, [bp+var_1B6]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	large 10014h
		push	0Ah
		lea	ax, [bp+var_27E]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_2A6]
		push	ax
		lea	ax, [bp+var_27E]
		push	ax
		lea	ax, [bp+var_1B6]
		push	ax
		push	[bp+var_28]
		push	di
		push	cs
		call	near ptr sub_C29CD
		add	sp, 0Ah
		mov	byte ptr [bp+var_2A+1], al
		xor	si, si
		jmp	short loc_C313E

loc_C3108:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_2A6]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_1B6]
		add	ax, dx
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	word ptr [bp+var_3A+2], ax
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		inc	si

loc_C313E:
		mov	al, byte ptr [bp+var_2A+1]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_C3108
		xor	si, si
		jmp	short loc_C318D

loc_C314B:
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_27E]
		add	ax, dx
		mov	word ptr [bp+var_3E], ax
		mov	word ptr [bp+var_3A+1], 0
		push	ax
		lea	ax, word ptr [bp+var_3E+2]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	word ptr [bp+var_3E+2]
		mov	al, byte ptr [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_3E+2]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	sub_76272
		add	sp, 8
		lea	ax, word ptr [bp+var_3E+2]
		push	ax
		call	sub_7627C
		pop	cx
		inc	si

loc_C318D:
		mov	al, byte ptr [bp+var_2A+1]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_C314B
		mov	byte ptr [bp+var_2A], 1
		push	seg stub253
		push	offset sub_735A5
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_30A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		xor	si, si
		mov	[bp+var_2B], 0
		push	3830h
		push	[bp+var_28]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_C31F4
		push	3838h
		push	[bp+var_28]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_C31F4
		push	3841h
		push	[bp+var_28]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_C31F4
		jmp	loc_C348C

loc_C31F4:
		push	large 0A0000h
		lea	ax, [bp+var_C2]
		push	ax
		push	0
		call	sub_62958
		add	sp, 8
		mov	word ptr [bp+var_3A+2], ax
		lea	ax, [bp+var_480]
		push	ax
		push	large 45544144h
		call	sub_75910
		add	sp, 6
		push	53h
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	51h
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	52h
		call	GameVar_Get_56414
		pop	cx
		imul	ax, ax, 14h
		lea	dx, [bp+var_480]
		add	ax, dx
		push	ax
		push	3849h
		lea	ax, [bp+var_4A8]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		lea	ax, [bp+var_4A8]
		push	ax
		push	word ptr [bp+var_3A+2]
		call	TextLayer_SetText_62A17
		add	sp, 4
		push	word ptr [bp+var_3A+2]
		lea	ax, [bp+var_E2]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		jmp	loc_C348C

loc_C3276:
		les	bx, [di+4]
		mov	al, es:[bx]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_C328E
		cmp	ax, 11h
		jnz	short loc_C328B
		jmp	loc_C339B

loc_C328B:
		jmp	loc_C3488

loc_C328E:
		inc	word ptr [di+4]
		mov	[bp+var_3A0], 390Fh
		mov	[bp+var_39E], 1
		mov	[bp+var_3A0], 3907h
		push	di
		lea	ax, [bp+var_3A0]
		push	ax
		call	sub_7569F
		add	sp, 4
		lea	ax, [bp+var_39D]
		mov	word ptr [bp+var_3A+2], ax
		inc	si
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_30A]
		add	ax, dx
		push	ax
		push	word ptr [bp+var_3A+2]
		push	di
		push	cs
		call	near ptr ConvData_LoadByName_C2834
		add	sp, 6
		push	0
		push	large [bp+var_394]
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_30A]
		add	ax, dx
		push	ax
		push	0
		call	sub_627D5
		add	sp, 0Ah
		mov	word ptr [bp+var_3A], ax
		push	ax
		lea	ax, [bp+var_E2]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		mov	[bp+var_44], 0
		mov	byte ptr [bp+var_40], 2
		mov	byte ptr [bp+var_40+1], 0
		mov	[bp+var_3E], 0
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	word ptr [bp+var_3A+2]
		push	3
		push	di
		push	cs
		call	near ptr sub_C257F
		add	sp, 8
		mov	[bp+var_47], 0
		lea	ax, word ptr [bp+var_44]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	[bp+var_4A]
		mov	al, byte ptr [bp+var_49+1]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	sub_76272
		add	sp, 8
		mov	byte ptr [bp+var_2A], 0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	byte ptr [bp+var_40+1], 0
		jz	short loc_C3384
		cmp	[bp+var_44], 0
		jz	short loc_C3384
		push	0
		mov	al, byte ptr [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C3384

loc_C3384:
		mov	[bp+var_44], 0
		mov	byte ptr [bp+var_40+1], 0
		mov	[bp+var_3E], 0
		jmp	loc_C348C

loc_C339B:
		inc	word ptr [di+4]
		mov	[bp+var_3EA], 390Fh
		mov	[bp+var_3E8], 11h
		mov	[bp+var_3EA], 38F7h
		mov	word ptr [bp+var_394+1], 0
		push	di
		lea	ax, [bp+var_3EA]
		push	ax
		call	sub_7569A
		add	sp, 4
		push	850h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_C33E1
		push	3855h
		lea	ax, word ptr [bp+var_3E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_C33F0

loc_C33E1:
		push	385Dh
		lea	ax, word ptr [bp+var_3E]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_C33F0:
		inc	si
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_30A]
		add	ax, dx
		push	ax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		push	di
		push	cs
		call	near ptr ConvData_LoadByName_C2834
		add	sp, 6
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	large [bp+var_3E7]
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_30A]
		add	ax, dx
		push	ax
		push	0
		call	sub_62E1B
		add	sp, 0Ah
		mov	[bp+var_40], ax
		push	word ptr [bp+var_394+1]
		push	ax
		call	sub_63137
		add	sp, 4
		xor	dx, dx
		jmp	short loc_C3463

loc_C343E:
		mov	word ptr [bp+var_44+2], dx
		mov	bx, dx
		shl	bx, 1
		lea	ax, [bp+var_3E3]
		add	bx, ax
		mov	ax, [bx]
		mov	word ptr [bp+var_44], ax
		mov	ax, word ptr [bp+var_44+2]
		shl	ax, 1
		mov	bx, [bp+var_40]
		mov	bx, [bx+1Dh]
		add	bx, ax
		mov	ax, word ptr [bp+var_44]
		mov	[bx], ax
		inc	dx

loc_C3463:
		cmp	dx, word ptr [bp+var_394+1]
		jl	short loc_C343E
		push	[bp+var_40]
		call	sub_6308B
		pop	cx
		push	[bp+var_40]
		lea	ax, [bp+var_E2]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		mov	byte ptr [bp+var_2A], 0
		jmp	short loc_C348C

loc_C3488:
		mov	[bp+var_2B], 1

loc_C348C:
		mov	al, [bp+var_2B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C3498
		jmp	loc_C3276

loc_C3498:
		mov	[bp+var_2C], 0
		mov	byte ptr [bp+var_2E+1], 0
		mov	[bp+var_1], 0
		jmp	loc_C36F0

loc_C34A7:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_C34B6
		mov	ax, 1
		jmp	short loc_C34B8

loc_C34B6:
		xor	ax, ax

loc_C34B8:
		mov	ah, 0
		or	ax, ax
		jz	short loc_C34C1
		jmp	loc_C36F0

loc_C34C1:
		les	bx, [di+4]
		mov	al, es:[bx]
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_C34D9
		cmp	ax, 0Ah
		jnz	short loc_C34D6
		jmp	loc_C3640

loc_C34D6:
		jmp	loc_C36EC

loc_C34D9:
		inc	word ptr [di+4]
		mov	[bp+var_3A4], 390Fh
		mov	[bp+var_3A2], 2
		mov	[bp+var_3A4], 38E7h
		mov	word ptr [bp+var_394+1], 0
		push	di
		lea	ax, [bp+var_3A4]
		push	ax
		call	sub_756A4
		add	sp, 4
		lea	ax, [bp+var_3A1]
		push	ax
		call	CRT_Strdup
		pop	cx
		mov	word ptr [bp+var_3A+2], ax
		inc	si
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_30A]
		add	ax, dx
		push	ax
		push	word ptr [bp+var_3A+2]
		push	di
		push	cs
		call	near ptr ConvData_LoadByName_C2834
		add	sp, 6
		push	large [bp+var_398]
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_30A]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_623BF
		add	sp, 8
		mov	word ptr [bp+var_3A], ax
		mov	al, [bp+var_2C]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_332]
		add	ax, dx
		mov	dx, word ptr [bp+var_3A]
		mov	bx, ax
		mov	[bx], dx
		push	word ptr [bp+var_394+1]
		call	CRT_Strdup
		pop	cx
		mov	dl, [bp+var_2C]
		mov	dh, 0
		shl	dx, 1
		lea	bx, [bp+var_35A]
		add	dx, bx
		mov	bx, dx
		mov	[bx], ax
		mov	al, [bp+var_2C]
		mov	ah, 0
		lea	dx, [bp+var_36E]
		add	ax, dx
		mov	dl, byte ptr [bp+var_394]
		mov	bx, ax
		mov	[bx], dl
		inc	[bp+var_2C]
		push	word ptr [bp+var_3A]
		lea	ax, [bp+var_E2]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		cmp	byte ptr [bp+var_2A], 0
		jnz	short loc_C35A3
		jmp	loc_C362D

loc_C35A3:
		mov	[bp+var_44], 0
		mov	byte ptr [bp+var_40], 2
		mov	byte ptr [bp+var_40+1], 0
		mov	[bp+var_3E], 0
		mov	[bp+var_47], 0
		lea	ax, word ptr [bp+var_44]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	[bp+var_4A]
		mov	al, byte ptr [bp+var_49+1]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	sub_76272
		add	sp, 8
		mov	byte ptr [bp+var_2A], 0
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	byte ptr [bp+var_40+1], 0
		jz	short loc_C3619
		cmp	[bp+var_44], 0
		jz	short loc_C3619
		push	0
		mov	al, byte ptr [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C3619

loc_C3619:
		mov	[bp+var_44], 0
		mov	byte ptr [bp+var_40+1], 0
		mov	[bp+var_3E], 0

loc_C362D:
		mov	[bp+var_3A4], 38E7h
		push	word ptr [bp+var_394+1]
		call	sub_65A86
		pop	cx
		jmp	loc_C36F0

loc_C3640:
		inc	word ptr [di+4]
		mov	[bp+var_40], 390Fh
		mov	byte ptr [bp+var_3E], 0Ah
		mov	[bp+var_40], 38FFh
		mov	word ptr [bp+var_3E+2], 0
		mov	word ptr [bp+var_3A], 0FFFFh
		push	di
		lea	ax, [bp+var_40]
		push	ax
		call	sub_756A9
		add	sp, 4
		cmp	word ptr [bp+var_3A], 0FFFFh
		jnz	short loc_C3672
		mov	al, 0
		jmp	short loc_C3674

loc_C3672:
		mov	al, 1

loc_C3674:
		or	al, al
		jz	short loc_C368B
		cmp	byte_7CB1B, 0
		jz	short loc_C368B
		cmp	word_79E69, 0
		jz	short loc_C368B
		mov	ax, 1
		jmp	short loc_C368D

loc_C368B:
		xor	ax, ax

loc_C368D:
		mov	[bp+var_1], al
		mov	ax, word ptr [bp+var_3A]
		mov	[bp+var_18], ax
		mov	ax, word ptr [bp+var_3A+2]
		mov	[bp+var_1A], ax
		mov	al, [bp+var_2C]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_332]
		add	ax, dx
		mov	bx, ax
		mov	word ptr [bx], 0
		push	word ptr [bp+var_3E+2]
		call	CRT_Strdup
		pop	cx
		mov	dl, [bp+var_2C]
		mov	dh, 0
		shl	dx, 1
		lea	bx, [bp+var_35A]
		add	dx, bx
		mov	bx, dx
		mov	[bx], ax
		mov	al, [bp+var_2C]
		mov	ah, 0
		lea	dx, [bp+var_36E]
		add	ax, dx
		mov	dl, byte ptr [bp+var_3E+1]
		mov	bx, ax
		mov	[bx], dl
		inc	[bp+var_2C]
		mov	[bp+var_40], 38FFh
		push	word ptr [bp+var_3E+2]
		call	sub_65A86
		pop	cx

loc_C36EC:
		mov	byte ptr [bp+var_2E+1], 1

loc_C36F0:
		mov	al, byte ptr [bp+var_2E+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C36FC
		jmp	loc_C34A7

loc_C36FC:
		mov	[bp+var_C5], 0
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	word_7AF7C
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+var_26]
		mov	al, byte ptr [bp+var_24]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	sub_76259
		add	sp, 8
		push	[bp+var_28]
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_36], 0
		mov	word ptr [bp+var_34], 98h
		mov	word ptr [bp+var_34+2], 13Fh
		mov	[bp+var_30], 0C7h
		mov	ax, di
		add	ax, 2Ch
		push	ax
		push	word_7AF7E
		sub	sp, 8
		mov	ax, [bp+var_36]
		mov	[bp+var_4B8], ax
		mov	ax, word ptr [bp+var_34]
		mov	[bp+var_4B6], ax
		mov	ax, word ptr [bp+var_34+2]
		mov	[bp+var_4B4], ax
		mov	ax, [bp+var_30]
		mov	[bp+var_4B2], ax
		lea	ax, [bp+var_390]
		push	ax
		call	sub_4D13
		add	sp, 0Eh
		cmp	[bp+var_2C], 0
		jnz	short loc_C3795
		jmp	loc_C39A0

loc_C3795:
		xor	si, si
		jmp	loc_C3972

loc_C379A:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_332]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_C37C9
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_35A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_332]
		add	bx, ax
		push	word ptr [bx]
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_61E18
		add	sp, 4

loc_C37C9:
		push	0
		lea	ax, [bp+var_390]
		push	ax
		call	sub_4DC6
		add	sp, 4
		mov	al, byte ptr [bp+si+var_36E]
		mov	byte ptr [bp+var_37], al
		lea	ax, [bp+var_37]
		push	ax
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	al, byte_7D13E
		mov	ah, 0
		or	ax, ax
		jz	short loc_C37FE
		jmp	loc_C388E

loc_C37FE:
		cmp	[bp+var_1], 0
		jz	short loc_C3875
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aStrtspch
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_3E0]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	0
		push	2
		push	[bp+var_1A]
		push	[bp+var_18]
		lea	ax, [bp+var_3E0]
		push	ax
		call	sub_5EF07
		add	sp, 0Ah
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C3873

loc_C3850:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_C3850
		push	0
		push	2
		push	[bp+var_1A]
		push	[bp+var_18]
		lea	ax, [bp+var_3E0]
		push	ax
		call	sub_5EF07
		add	sp, 0Ah

loc_C3873:
		jmp	short loc_C388E

loc_C3875:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_35A]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_390]
		push	ax
		push	di
		push	cs
		call	near ptr sub_C240E
		add	sp, 6

loc_C388E:
		call	sub_75750
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_332]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_C38E6
		jmp	short loc_C38B8

loc_C38A4:
		call	sub_7575F
		or	al, al
		jnz	short loc_C38FA
		lea	ax, [bp+var_E2]
		push	ax
		call	sub_66770
		pop	cx

loc_C38B8:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_332]
		add	bx, ax
		push	word ptr [bx]
		call	sub_622B0
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_C38A4
		jmp	short loc_C38FA

loc_C38D2:
		call	sub_7575F
		or	al, al
		jnz	short loc_C38FA
		lea	ax, [bp+var_E2]
		push	ax
		call	sub_66770
		pop	cx

loc_C38E6:
		cmp	[bp+var_C5], 28h
		jb	short loc_C38F2
		mov	ax, 1
		jmp	short loc_C38F4

loc_C38F2:
		xor	ax, ax

loc_C38F4:
		mov	ah, 0
		or	ax, ax
		jz	short loc_C38D2

loc_C38FA:
		cmp	[bp+var_1], 0
		jz	short loc_C3923
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jz	short loc_C3923
		jmp	short loc_C3917

loc_C390E:
		call	sub_7575F
		or	al, al
		jnz	short loc_C3923

loc_C3917:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_C390E

loc_C3923:
		cmp	[bp+var_1], 0
		jz	short loc_C3971
		call	sub_5EFE1
		mov	bx, word_79E71
		cmp	byte ptr [bx+1Dh], 0
		jz	short loc_C3959
		cmp	dword ptr [bx+18h], 0
		jz	short loc_C3959
		push	0
		mov	al, [bx+1Ch]
		push	ax
		mov	ax, word_79E71
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C3959

loc_C3959:
		mov	bx, word_79E71
		mov	dword ptr [bx+18h], 0
		mov	byte ptr [bx+1Dh], 0
		mov	dword ptr [bx+1Eh], 0

loc_C3971:
		inc	si

loc_C3972:
		mov	al, [bp+var_2C]
		mov	ah, 0
		cmp	ax, si
		jle	short loc_C397E
		jmp	loc_C379A

loc_C397E:
		xor	si, si
		jmp	short loc_C3995

loc_C3982:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_35A]
		add	bx, ax
		push	word ptr [bx]
		call	sub_65A86
		pop	cx
		inc	si

loc_C3995:
		mov	al, [bp+var_2C]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_C3982
		jmp	short loc_C3A06

loc_C39A0:
		lea	ax, [bp+var_A]
		push	ax
		push	[bp+var_28]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_C39D7
		push	0
		push	[bp+var_26]
		mov	al, byte ptr [bp+var_24]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	sub_76259
		add	sp, 8
		push	[bp+var_28]
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_C39D7:
		call	sub_75750
		jmp	short loc_C39F2

loc_C39DE:
		call	sub_7575F
		or	al, al
		jnz	short loc_C3A06
		lea	ax, [bp+var_E2]
		push	ax
		call	sub_66770
		pop	cx

loc_C39F2:
		cmp	[bp+var_C5], 14h
		jb	short loc_C39FE
		mov	ax, 1
		jmp	short loc_C3A00

loc_C39FE:
		xor	ax, ax

loc_C3A00:
		mov	ah, 0
		or	ax, ax
		jz	short loc_C39DE

loc_C3A06:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		lea	ax, [bp+var_38E]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	seg stub253
		push	offset sub_735A0
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_30A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A0
		push	large 10014h
		push	0Ah
		lea	ax, [bp+var_27E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A0
		push	large 10014h
		push	0Ah
		lea	ax, [bp+var_1B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_E2]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		lea	ax, [bp+var_26]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_67383
		pop	cx
		jmp	loc_C4347

loc_C3A96:
		cmp	[bp+var_15], 0
		jz	short loc_C3AE4
		call	sub_75750
		mov	[bp+var_E4], 390Fh
		mov	byte ptr [bp+var_E2], 3
		mov	[bp+var_E4], 38DFh
		mov	[bp+var_D0], 0
		mov	[bp+var_D3], 0
		mov	word ptr [bp+var_CF], 0FFFFh
		push	di
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_75695
		add	sp, 4
		mov	[bp+var_E4], 38DFh
		push	[bp+var_D3]
		call	sub_65A86
		pop	cx
		jmp	loc_C4347

loc_C3AE4:
		call	sub_75750
		mov	[bp+var_E4], 390Fh
		mov	byte ptr [bp+var_E2], 3
		mov	[bp+var_E4], 38DFh
		mov	[bp+var_D0], 0
		mov	[bp+var_D3], 0
		mov	word ptr [bp+var_CF], 0FFFFh
		push	di
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_75695
		add	sp, 4
		cmp	word ptr [bp+var_CF], 0FFFFh
		jnz	short loc_C3B24
		mov	al, 0
		jmp	short loc_C3B26

loc_C3B24:
		mov	al, 1

loc_C3B26:
		or	al, al
		jz	short loc_C3B3D
		cmp	byte_7CB1B, 0
		jz	short loc_C3B3D
		cmp	word_79E69, 0
		jz	short loc_C3B3D
		mov	ax, 1
		jmp	short loc_C3B3F

loc_C3B3D:
		xor	ax, ax

loc_C3B3F:
		mov	[bp+var_1], al
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_1C], ax
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_104]
		push	ax
		call	LayerGroup_Construct_66650
		add	sp, 8
		mov	[bp+var_2A], 0
		mov	[bp+var_28], 98h
		mov	[bp+var_26], 13Fh
		mov	[bp+var_24], 0C7h
		mov	ax, di
		add	ax, 2Ch
		push	ax
		push	word_7AF7E
		sub	sp, 8
		mov	ax, [bp+var_2A]
		mov	[bp+var_4B8], ax
		mov	ax, [bp+var_28]
		mov	[bp+var_4B6], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_4B4], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_4B2], ax
		lea	ax, [bp+var_126]
		push	ax
		call	sub_4D13
		add	sp, 0Eh
		lea	si, [bp+var_E0]
		push	386Eh
		push	si
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_C3C52
		push	4Eh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C3C21
		push	4Ah
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C3C0B
		push	4Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C3C06
		mov	si, 3876h
		jmp	short loc_C3C52

loc_C3C06:
		mov	si, 387Eh
		jmp	short loc_C3C52

loc_C3C0B:
		push	4Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C3C1C
		mov	si, 3885h
		jmp	short loc_C3C52

loc_C3C1C:
		mov	si, 388Bh
		jmp	short loc_C3C52

loc_C3C21:
		push	4Ah
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C3C43
		push	4Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C3C3E
		mov	si, 3890h
		jmp	short loc_C3C52

loc_C3C3E:
		mov	si, 3897h
		jmp	short loc_C3C52

loc_C3C43:
		push	4Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C3C52
		mov	si, 389Dh

loc_C3C52:
		push	38A2h
		push	si
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_C3C71
		push	4Bh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C3C71
		mov	si, 38AAh

loc_C3C71:
		push	38B1h
		push	si
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_C3C90
		push	4Dh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C3C90
		mov	si, 38BAh

loc_C3C90:
		push	38C1h
		push	si
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_C3CAF
		push	4Ah
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C3CAF
		mov	si, 38CAh

loc_C3CAF:
		push	seg stub253
		push	offset sub_735A5
		push	large 10014h
		push	0Ah
		lea	ax, [bp+var_1EE]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	large 10014h
		push	0Ah
		lea	ax, [bp+var_2B6]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_2DE]
		push	ax
		lea	ax, [bp+var_2B6]
		push	ax
		lea	ax, [bp+var_1EE]
		push	ax
		push	si
		push	di
		push	cs
		call	near ptr sub_C29CD
		add	sp, 0Ah
		mov	[bp+var_2B], al
		mov	[bp+var_2E], 0
		jmp	short loc_C3D43

loc_C3D07:
		mov	bx, [bp+var_2E]
		shl	bx, 1
		lea	ax, [bp+var_2DE]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, [bp+var_2E]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_1EE]
		add	ax, dx
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[bp+var_4E], ax
		push	[bp+var_4E]
		lea	ax, [bp+var_104]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		inc	[bp+var_2E]

loc_C3D43:
		mov	al, [bp+var_2B]
		mov	ah, 0
		cmp	ax, [bp+var_2E]
		jg	short loc_C3D07
		mov	[bp+var_2E], 0
		jmp	short loc_C3D99

loc_C3D54:
		mov	ax, [bp+var_2E]
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_2B6]
		add	ax, dx
		mov	word ptr [bp+var_54], ax
		mov	[bp+var_4F], 0
		push	ax
		lea	ax, word ptr [bp+var_54+2]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	word ptr [bp+var_54+2]
		mov	al, byte ptr [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_54+2]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	sub_76272
		add	sp, 8
		lea	ax, word ptr [bp+var_54+2]
		push	ax
		call	sub_7627C
		pop	cx
		inc	[bp+var_2E]

loc_C3D99:
		mov	al, [bp+var_2B]
		mov	ah, 0
		cmp	ax, [bp+var_2E]
		jg	short loc_C3D54
		lea	ax, [bp+var_CB]
		mov	[bp+var_30], ax
		mov	[bp+var_3A], 0
		mov	byte ptr [bp+var_36], 2
		mov	byte ptr [bp+var_36+1], 0
		mov	[bp+var_34], 0
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	[bp+var_30]
		push	di
		push	cs
		call	near ptr ConvData_LoadByName_C27EC
		add	sp, 6
		mov	[bp+var_44], 0
		mov	byte ptr [bp+var_40], 2
		mov	byte ptr [bp+var_40+1], 0
		mov	[bp+var_3E], 0
		push	0
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	di
		push	cs
		call	near ptr sub_C2804
		add	sp, 6
		push	large [bp+var_D7]
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	0
		call	sub_61AAE
		add	sp, 8
		mov	[bp+var_46], ax
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		mov	al, byte ptr [bp+var_E2+1]
		cbw
		push	ax
		push	[bp+var_46]
		call	TalkingHead_SetBaseFrame_61EF1
		add	sp, 4
		push	38D2h
		push	[bp+var_30]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_C3E54
		push	8A5h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_C3E54
		mov	bx, [bp+var_46]
		mov	word ptr [bx+850h], 23h

loc_C3E54:
		mov	[bp+var_49], 0
		lea	ax, word ptr [bp+var_44]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	[bp+var_4C]
		mov	al, byte ptr [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	sub_76272
		add	sp, 8
		push	si
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_C3EA4
		push	[bp+var_30]
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_C3EE5

loc_C3EA4:
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+var_22]
		mov	al, byte ptr [bp+var_20]
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	sub_76259
		add	sp, 8
		push	si
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	[bp+var_30]
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_C3EE5:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_C3EF4
		mov	ax, 1
		jmp	short loc_C3EF6

loc_C3EF4:
		xor	ax, ax

loc_C3EF6:
		mov	ah, 0
		or	ax, ax
		jz	short loc_C3EFF
		jmp	loc_C3FEF

loc_C3EFF:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 0Ah
		jz	short loc_C3F0B
		jmp	loc_C3FEF

loc_C3F0B:
		inc	word ptr [di+4]
		mov	word ptr [bp+var_58+2], 390Fh
		mov	byte ptr [bp+var_54], 0Ah
		mov	word ptr [bp+var_58+2], 38FFh
		mov	word ptr [bp+var_54+2], 0
		mov	[bp+var_50], 0FFFFh
		push	di
		lea	ax, word ptr [bp+var_58+2]
		push	ax
		call	sub_756A9
		add	sp, 4
		push	0
		lea	ax, [bp+var_126]
		push	ax
		call	sub_4DC6
		add	sp, 4
		mov	al, byte ptr [bp+var_54+1]
		mov	byte ptr [bp+var_58+1], al
		lea	ax, word ptr [bp+var_58+1]
		push	ax
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	si, word ptr [bp+var_54+2]
		mov	al, byte_7D13E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C3F75
		push	si
		lea	ax, [bp+var_126]
		push	ax
		push	di
		push	cs
		call	near ptr sub_C240E
		add	sp, 6

loc_C3F75:
		mov	[bp+var_E7], 0
		call	sub_75750
		push	si
		lea	ax, [bp+var_126]
		push	ax
		push	di
		push	cs
		call	near ptr sub_C240E
		add	sp, 6
		jmp	short loc_C3FA4

loc_C3F90:
		call	sub_7575F
		or	al, al
		jnz	short loc_C3FB8
		lea	ax, [bp+var_104]
		push	ax
		call	sub_66770
		pop	cx

loc_C3FA4:
		cmp	[bp+var_E7], 14h
		jb	short loc_C3FB0
		mov	ax, 1
		jmp	short loc_C3FB2

loc_C3FB0:
		xor	ax, ax

loc_C3FB2:
		mov	ah, 0
		or	ax, ax
		jz	short loc_C3F90

loc_C3FB8:
		mov	word ptr [bp+var_58+2], 38FFh
		push	word ptr [bp+var_54+2]
		call	sub_65A86
		pop	cx
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_C3FD5
		mov	ax, 1
		jmp	short loc_C3FD7

loc_C3FD5:
		xor	ax, ax

loc_C3FD7:
		mov	ah, 0
		or	ax, ax
		jz	short loc_C3FE0
		jmp	loc_C424E

loc_C3FE0:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 0Ah
		jnz	short loc_C3FEC
		jmp	loc_C3F0B

loc_C3FEC:
		jmp	loc_C424E

loc_C3FEF:
		push	0
		lea	ax, [bp+var_126]
		push	ax
		call	sub_4DC6
		add	sp, 4
		mov	al, byte ptr [bp+var_D2+1]
		mov	byte ptr [bp+var_4D], al
		lea	ax, [bp+var_4D]
		push	ax
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	ax, [bp+var_D3]
		mov	[bp+var_50], ax
		mov	al, byte_7D13E
		mov	ah, 0
		or	ax, ax
		jz	short loc_C402B
		jmp	loc_C40B0

loc_C402B:
		cmp	[bp+var_1], 0
		jz	short loc_C40A0
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aStrtspch_1
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_32E]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	0
		push	2
		push	large [bp+var_CF]
		lea	ax, [bp+var_32E]
		push	ax
		call	sub_5EF07
		add	sp, 0Ah
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C409E

loc_C407C:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_C407C
		push	0
		push	2
		push	large [bp+var_CF]
		lea	ax, [bp+var_32E]
		push	ax
		call	sub_5EF07
		add	sp, 0Ah

loc_C409E:
		jmp	short loc_C40B0

loc_C40A0:
		push	[bp+var_50]
		lea	ax, [bp+var_126]
		push	ax
		push	di
		push	cs
		call	near ptr sub_C240E
		add	sp, 6

loc_C40B0:
		push	[bp+var_D3]
		push	[bp+var_46]
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_61E18
		add	sp, 4
		call	sub_75750
		jmp	loc_C4149

loc_C40C7:
		call	sub_7575F
		or	al, al
		jz	short loc_C40DC
		mov	[bp+var_16], 1
		call	sub_5EFE1
		jmp	loc_C415B

loc_C40DC:
		push	1
		call	sub_5EFBF
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C413E
		cmp	[bp+var_1], 0
		jz	short loc_C413E
		mov	[bp+var_16], 1
		call	sub_5EFE1
		mov	bx, word_79E71
		cmp	byte ptr [bx+1Dh], 0
		jz	short loc_C4124
		cmp	dword ptr [bx+18h], 0
		jz	short loc_C4124
		push	0
		mov	al, [bx+1Ch]
		push	ax
		mov	ax, word_79E71
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C4124

loc_C4124:
		mov	bx, word_79E71
		mov	dword ptr [bx+18h], 0
		mov	byte ptr [bx+1Dh], 0
		mov	dword ptr [bx+1Eh], 0
		jmp	short loc_C415B

loc_C413E:
		lea	ax, [bp+var_104]
		push	ax
		call	sub_66770
		pop	cx

loc_C4149:
		push	[bp+var_46]
		call	sub_622B0
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C415B
		jmp	loc_C40C7

loc_C415B:
		mov	bx, [bp+var_46]
		mov	word ptr [bx+84Ah], 0FFFFh
		lea	ax, [bp+var_104]
		push	ax
		call	sub_66770
		pop	cx
		xor	eax, eax
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		mov	[bp+var_54], 0C8h
		mov	eax, dword_7B29D
		mov	[bp+var_58], eax
		cmp	[bp+var_1], 0
		jz	short loc_C41B5
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jz	short loc_C41B5
		jmp	short loc_C41A7

loc_C419E:
		call	sub_7575F
		or	al, al
		jnz	short loc_C4200

loc_C41A7:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_C419E
		jmp	short loc_C4200

loc_C41B5:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C4200
		mov	al, [bp+var_16]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C4200
		jmp	short loc_C41E4

loc_C41C9:
		call	sub_7575F
		or	al, al
		jz	short loc_C41D9
		call	sub_5EFE1
		jmp	short loc_C4200

loc_C41D9:
		lea	ax, [bp+var_104]
		push	ax
		call	sub_66770
		pop	cx

loc_C41E4:
		mov	eax, [bp+var_58]
		add	eax, [bp+var_54]
		cmp	eax, dword_7B29D
		ja	short loc_C41F8
		mov	ax, 1
		jmp	short loc_C41FA

loc_C41F8:
		xor	ax, ax

loc_C41FA:
		mov	ah, 0
		or	ax, ax
		jz	short loc_C41C9

loc_C4200:
		cmp	[bp+var_1], 0
		jz	short loc_C424E
		call	sub_5EFE1
		mov	bx, word_79E71
		cmp	byte ptr [bx+1Dh], 0
		jz	short loc_C4236
		cmp	dword ptr [bx+18h], 0
		jz	short loc_C4236
		push	0
		mov	al, [bx+1Ch]
		push	ax
		mov	ax, word_79E71
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C4236

loc_C4236:
		mov	bx, word_79E71
		mov	dword ptr [bx+18h], 0
		mov	byte ptr [bx+1Dh], 0
		mov	dword ptr [bx+1Eh], 0

loc_C424E:
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	byte ptr [bp+var_40+1], 0
		jz	short loc_C427C
		cmp	[bp+var_44], 0
		jz	short loc_C427C
		push	0
		mov	al, byte ptr [bp+var_40]
		push	ax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C427C

loc_C427C:
		mov	[bp+var_44], 0
		mov	byte ptr [bp+var_40+1], 0
		mov	[bp+var_3E], 0
		cmp	byte ptr [bp+var_36+1], 0
		jz	short loc_C42B4
		cmp	[bp+var_3A], 0
		jz	short loc_C42B4
		push	0
		mov	al, byte ptr [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C42B4

loc_C42B4:
		mov	[bp+var_3A], 0
		mov	byte ptr [bp+var_36+1], 0
		mov	[bp+var_34], 0
		push	seg stub253
		push	offset sub_735A0
		push	large 10014h
		push	0Ah
		lea	ax, [bp+var_2B6]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A0
		push	large 10014h
		push	0Ah
		lea	ax, [bp+var_1EE]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_124]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_104]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_67383
		pop	cx
		mov	[bp+var_E4], 38DFh
		push	[bp+var_D3]
		call	sub_65A86
		pop	cx
		jmp	short loc_C4347

loc_C433E:
		push	9999h
		call	sub_1DDFE
		pop	cx

loc_C4347:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_C4356
		mov	ax, 1
		jmp	short loc_C4358

loc_C4356:
		xor	ax, ax

loc_C4358:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C4361
		jmp	loc_C2F0D

loc_C4361:
		lea	ax, [bp+var_C0]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx

loc_C436C:
		pop	di
		pop	si
		leave
		retf
Conv_PlayScript_C2ED0		endp

; START OF FUNCTION CHUNK FOR Conv_PlayScript_C2ED0
off_C4370	dw offset loc_C3021
		dw offset loc_C2F92
		dw offset loc_C433E
		dw offset loc_C3A96
		dw offset loc_C433E
		dw offset loc_C2F47
		dw offset loc_C433E
		dw offset loc_C433E
		dw offset loc_C433E
		dw offset loc_C433E
		dw offset loc_C2FB9
		dw offset loc_C433E
		dw offset loc_C2F77
		dw offset loc_C2F8B
		dw offset loc_C433E
		dw offset loc_C433E
		dw offset loc_C4347
		dw offset loc_C2FF4
; END OF FUNCTION CHUNK FOR Conv_PlayScript_C2ED0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C4394		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_C4394		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C439E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_C439E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C43AB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_C43AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C43B8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_C43B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C43C5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C4431
		mov	word ptr [si], 391Fh
		push	si
		call	sub_754FA
		pop	cx
		cmp	byte ptr [si+23h], 0
		jz	short loc_C4405
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_C4405
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C4405

loc_C4405:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_C4431
		push	si
		call	sub_3B2
		pop	cx

loc_C4431:
		pop	di
		pop	si
		pop	bp
		retf
sub_C43C5		endp
ovr351		ends
