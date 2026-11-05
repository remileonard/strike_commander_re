ovr283		segment	para public 'OVERLAY' use16
		assume cs:ovr283
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A6560		proc far

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
		jnz	short loc_A657D
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A65C2

loc_A657D:
		mov	ax, si
		add	ax, 8
		mov	ax, [di]
		mov	[si+6], ax
		mov	ax, [di+2]
		mov	[si+0Bh], ax
		mov	ax, [di+4]
		mov	[si+0Dh], ax
		mov	al, [di+6]
		mov	[si+8], al
		mov	al, [di+7]
		mov	[si+9], al
		mov	al, [di+8]
		mov	[si+0Ah], al
		mov	al, [di+9]
		mov	[si+2], al
		mov	al, [di+0Ah]
		mov	[si+3], al
		mov	al, [di+0Bh]
		mov	[si+4], al
		mov	al, [di+0Ch]
		mov	[si+5], al
		mov	ax, [bp+arg_4]
		mov	[si], ax

loc_A65C2:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_A6560		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A65C8		proc far

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
		jnz	short loc_A65E1
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A6627

loc_A65E1:
		mov	ax, si
		add	ax, 8
		mov	ax, [bp+arg_2]
		mov	[si+6], ax
		mov	al, [bp+arg_4]
		mov	[si+8], al
		mov	al, [bp+arg_6]
		mov	[si+9], al
		mov	al, [bp+arg_8]
		mov	[si+0Ah], al
		mov	ax, [bp+arg_A]
		mov	[si+0Bh], ax
		mov	ax, [bp+arg_C]
		mov	[si+0Dh], ax
		mov	ax, [bp+arg_E]
		mov	[si], ax
		mov	al, [bp+arg_10]
		mov	[si+2], al
		mov	al, [bp+arg_12]
		mov	[si+3], al
		mov	al, [bp+arg_14]
		mov	[si+4], al
		mov	al, [bp+arg_16]
		mov	[si+5], al

loc_A6627:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_A65C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A662C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_A662C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_OpenAndDecode_9800A (sub_9800A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Path_ResolveDataFile, StreamReader, ResourceRecord_AllocateAndDecode_64C21 (seg193).
; ==============================================================================================
TextureLoader_OpenAndDecode_A6634		proc far

var_F8		= word ptr -0F8h
var_9B		= dword ptr -9Bh
var_97		= dword ptr -97h
var_93		= dword ptr -93h
var_8B		= dword ptr -8Bh
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
		push	seg seg225
		push	0
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aPALETTE
		lea	ax, [bp+var_50]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_F8], 508h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 520h
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
		jz	short loc_A66EE
		cmp	[bp+var_8B], 544C4150h
		jnz	short loc_A66BE
		mov	ax, 1
		jmp	short loc_A66C0

loc_A66BE:
		xor	ax, ax

loc_A66C0:
		or	ax, ax
		jz	short loc_A66E9
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_6DC9A
		pop	cx
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_SelectMipLevel_A671A
		add	sp, 4
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_A66F6

loc_A66E9:
		push	9003h
		jmp	short loc_A66F1

loc_A66EE:
		push	9004h

loc_A66F1:
		call	sub_1DDFE

loc_A66F6:
		pop	cx
		mov	[bp+var_F8], 520h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
TextureLoader_OpenAndDecode_A6634		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextureLoader_SelectMipLevel_980F0 (sub_980F0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine String_ConstructEmpty/FromPtrLen,
; Palette_SelectFogRow_2EA80 — sélection du niveau de mipmap d'une texture.
; ==============================================================================================
TextureLoader_SelectMipLevel_A671A		proc far

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
		call	near ptr TextureLoader_LoadMixedFields_A6A25
		add	sp, 4
		push	0
		push	large 4C424154h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A676B
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
		call	near ptr Palette_LoadFadeFile_A6C9A
		add	sp, 4

loc_A676B:
		push	large 0
		push	si
		call	Palette_SelectFogRow_2DFD3
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
TextureLoader_SelectMipLevel_A671A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_ReleaseMultiple_98151 (sub_98151 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 137 lignes, NON DÉTAILLÉE — libère 5+ blocs typés (Memory_TypedFree_5C7B6 répété).
; ==============================================================================================
TextureLoader_ReleaseMultiple_A677B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_A678D
		jmp	loc_A68C3

loc_A678D:
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_ReleaseMultipleB_A68C7
		pop	cx
		cmp	byte ptr [si+63h], 0
		jz	short loc_A67BA
		cmp	dword ptr [si+5Eh], 0
		jz	short loc_A67BA
		push	0
		mov	al, [si+62h]
		push	ax
		mov	ax, si
		add	ax, 5Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A67BA

loc_A67BA:
		mov	dword ptr [si+5Eh], 0
		mov	byte ptr [si+63h], 0
		mov	dword ptr [si+64h], 0
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_A67F4
		cmp	dword ptr [si+27h], 0
		jz	short loc_A67F4
		push	0
		mov	al, [si+2Bh]
		push	ax
		mov	ax, si
		add	ax, 27h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A67F4

loc_A67F4:
		mov	dword ptr [si+27h], 0
		mov	byte ptr [si+2Ch], 0
		mov	dword ptr [si+2Dh], 0
		cmp	byte ptr [si+22h], 0
		jz	short loc_A682E
		cmp	dword ptr [si+1Dh], 0
		jz	short loc_A682E
		push	0
		mov	al, [si+21h]
		push	ax
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A682E

loc_A682E:
		mov	dword ptr [si+1Dh], 0
		mov	byte ptr [si+22h], 0
		mov	dword ptr [si+23h], 0
		cmp	byte ptr [si+18h], 0
		jz	short loc_A6868
		cmp	dword ptr [si+13h], 0
		jz	short loc_A6868
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A6868

loc_A6868:
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		cmp	byte ptr [si+0Eh], 0
		jz	short loc_A68A2
		cmp	dword ptr [si+9], 0
		jz	short loc_A68A2
		push	0
		mov	al, [si+0Dh]
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A68A2

loc_A68A2:
		mov	dword ptr [si+9], 0
		mov	byte ptr [si+0Eh], 0
		mov	dword ptr [si+0Fh], 0
		test	di, 1
		jz	short loc_A68C3
		push	si
		call	sub_3B2
		pop	cx

loc_A68C3:
		pop	di
		pop	si
		pop	bp
		retf
TextureLoader_ReleaseMultiple_A677B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 11 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_ReleaseMultipleB_9829D (sub_9829D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 140 lignes, NON DÉTAILLÉE — variante de TextureLoader_ReleaseMultiple_98151.
; ==============================================================================================
TextureLoader_ReleaseMultipleB_A68C7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Eh], 0
		jz	short loc_A68F4
		cmp	dword ptr [si+9], 0
		jz	short loc_A68F4
		push	0
		mov	al, [si+0Dh]
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A68F4

loc_A68F4:
		mov	dword ptr [si+9], 0
		mov	byte ptr [si+0Eh], 0
		mov	dword ptr [si+0Fh], 0
		cmp	byte ptr [si+18h], 0
		jz	short loc_A692E
		cmp	dword ptr [si+13h], 0
		jz	short loc_A692E
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A692E

loc_A692E:
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		cmp	byte ptr [si+22h], 0
		jz	short loc_A6968
		cmp	dword ptr [si+1Dh], 0
		jz	short loc_A6968
		push	0
		mov	al, [si+21h]
		push	ax
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A6968

loc_A6968:
		mov	dword ptr [si+1Dh], 0
		mov	byte ptr [si+22h], 0
		mov	dword ptr [si+23h], 0
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_A69A2
		cmp	dword ptr [si+27h], 0
		jz	short loc_A69A2
		push	0
		mov	al, [si+2Bh]
		push	ax
		mov	ax, si
		add	ax, 27h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A69A2

loc_A69A2:
		mov	dword ptr [si+27h], 0
		mov	byte ptr [si+2Ch], 0
		mov	dword ptr [si+2Dh], 0
		cmp	byte ptr [si+63h], 0
		jz	short loc_A69DC
		cmp	dword ptr [si+5Eh], 0
		jz	short loc_A69DC
		push	0
		mov	al, [si+62h]
		push	ax
		mov	ax, si
		add	ax, 5Eh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A69DC

loc_A69DC:
		mov	dword ptr [si+5Eh], 0
		mov	byte ptr [si+63h], 0
		mov	dword ptr [si+64h], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 42h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+42h], 0
		push	word ptr [si+5Ah]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+5Ah], 0
		push	si
		call	Palette_DestructResource
		pop	cx
		pop	si
		pop	bp
		retf
TextureLoader_ReleaseMultipleB_A68C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextureLoader_LoadMixedFields_983FB (sub_983FB de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-14 (partie chunks). CHARGEUR DE
; PALETTE.IFF : INFO (dd non rangé, puis +68h précision du brouillard, +52h, +4Eh log2 seuils
; par ligne, +46h lignes, +7Ah pas ; calcule +6Ah = 1<<+68h, +6Eh = moitié, +4Ch = 1<<+4Eh,
; +7Ch = +46h<<+7Ah) ; PALT (TextureLoader_LoadWithDwordFields_98784) ; SKYC ; BLWH ; RANG
; (TextureLoader_FormatAndLoad_985F6, sinon +58h = 0).
; ==============================================================================================
TextureLoader_LoadMixedFields_A6A25		proc far

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
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A6A48
		jmp	loc_A6ACA

loc_A6A48:
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		pop	cx
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+68h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+52h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+4Eh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+46h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
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

loc_A6ACA:
		push	0
		push	large 544C4150h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A6AE9
		push	di
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_LoadWithDwordFields_A6DAE
		add	sp, 4

loc_A6AE9:
		push	0
		push	large 43594B53h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A6B08
		push	di
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_LoadMixedFieldsB_A6B51
		add	sp, 4

loc_A6B08:
		push	0
		push	large 48574C42h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A6B27
		push	di
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_LoadWithDwordFieldsB_A6EE7
		add	sp, 4

loc_A6B27:
		push	0
		push	large 474E4152h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A6B48
		push	di
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_FormatAndLoad_A6C20
		add	sp, 4
		jmp	short loc_A6B4D

loc_A6B48:
		mov	word ptr [si+58h], 0

loc_A6B4D:
		pop	di
		pop	si
		pop	bp
		retf
TextureLoader_LoadMixedFields_A6A25		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_LoadMixedFieldsB_98527 (sub_98527 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine ReadFieldGroupB_64A54 (×2), allocateur typé, ReadFieldGroupA_64A19 (85 lignes).
; ==============================================================================================
TextureLoader_LoadMixedFieldsB_A6B51		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+33h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+35h], ax
		mov	ax, [si+33h]
		imul	word ptr [si+35h]
		imul	ax, ax, 3
		movsx	eax, ax
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
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
		push	large [si+27h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		push	large [bp+var_4]
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
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
TextureLoader_LoadMixedFieldsB_A6B51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_FormatAndLoad_985F6 (sub_985F6 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-14. LECTEUR DU CHUNK 'RANG' de PALETTE.IFF : uint16 nombre de couleurs de base →
; palette+58h ; alloue nombre × 15 o → palette+5Ah ; pour chacune, lit 13 o et les convertit
; par TextureLoader_Allocate_97F40 en entrée de 15 o.
; ==============================================================================================
TextureLoader_FormatAndLoad_A6C20		proc far

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
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+58h], ax
		push	seg stub283
		push	offset sub_73E30
		push	1
		push	word ptr [si+58h]
		push	large 0F0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+5Ah], ax
		xor	di, di
		jmp	short loc_A6C91

loc_A6C57:
		push	large 0Dh
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	ax, di
		imul	ax, ax, 0Fh
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
		call	near ptr sub_A6560
		add	sp, 6
		push	ds
		push	ax
		mov	cx, 0Fh
		call	CRT_Fmemcpy
		inc	di

loc_A6C91:
		cmp	[si+58h], di
		jg	short loc_A6C57
		pop	di
		pop	si
		leave
		retf
TextureLoader_FormatAndLoad_A6C20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_LoadFadeFile_98670 (sub_98670 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-28
; (ex-TextureLoader_OpenAndLoadSubrecord_98670). Ouvre PALETTE\<nom>.IFF, nom donné par le
; chunk TABL de PALETTE.IFF (« palfade » : PALFADE.IFF) ; racine FORM FTBL obligatoire (erreur
; 9005h, fichier absent 9006h) ; chunk D_HZ → TextureLoader_LoadWithDwordFieldsC_98956 ; chunk
; FADE → Palette_LoadFadeTables_989B8. Appelée par TextureLoader_SelectMipLevel_980F0 quand
; PALETTE.IFF a un chunk TABL.
; ==============================================================================================
Palette_LoadFadeFile_A6C9A		proc far

var_F8		= word ptr -0F8h
var_9B		= dword ptr -9Bh
var_97		= dword ptr -97h
var_93		= dword ptr -93h
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
		push	seg seg225
		push	0
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aPALETTE
		lea	ax, [bp+var_50]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_F8], 508h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 520h
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
		jz	short loc_A6D82
		push	0
		push	large 4C425446h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_A6D7D
		push	0
		push	large 5A485F44h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A6D54
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_LoadWithDwordFieldsC_A6F80
		add	sp, 4

loc_A6D54:
		push	0
		push	large 45444146h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A6D8B
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Palette_LoadFadeTables_A6FE2
		add	sp, 4
		jmp	short loc_A6D8B

loc_A6D7D:
		push	9005h
		jmp	short loc_A6D85

loc_A6D82:
		push	9006h

loc_A6D85:
		call	sub_1DDFE
		pop	cx

loc_A6D8B:
		mov	[bp+var_F8], 520h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
Palette_LoadFadeFile_A6C9A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_LoadWithDwordFields_98784 (sub_98784 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 136 lignes, NON DÉTAILLÉE — même motif que AircraftComponent_LoadWithDwordFields_94D40
; (seg272).
; ==============================================================================================
TextureLoader_LoadWithDwordFields_A6DAE		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+9], eax
		mov	byte ptr [si+0Dh], 2
		mov	byte ptr [si+0Eh], 1
		mov	dword ptr [si+0Fh], 0
		mov	eax, [bp+var_8]
		mov	[si+0Fh], eax
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large [si+9]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_A6E23
		push	9007h
		call	sub_1DDFE
		pop	cx

loc_A6E23:
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large [si+9]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large [si+9]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
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
		mov	[si+7], ax
		movsx	eax, word ptr [si+7]
		mov	[bp+var_10], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2], dx
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
		push	large [si+1Dh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_A6EE3
		push	9030h
		call	sub_1DDFE
		pop	cx

loc_A6EE3:
		pop	di
		pop	si
		leave
		retf
TextureLoader_LoadWithDwordFields_A6DAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_LoadWithDwordFieldsB_988BD (sub_988BD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; variante de TextureLoader_LoadWithDwordFields_98784 (65 lignes).
; ==============================================================================================
TextureLoader_LoadWithDwordFieldsB_A6EE7		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
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
		push	large [si+13h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_A6F5C
		push	9009h
		call	sub_1DDFE
		pop	cx

loc_A6F5C:
		push	0
		mov	al, [si+17h]
		push	ax
		push	large [si+13h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
TextureLoader_LoadWithDwordFieldsB_A6EE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_LoadWithDwordFieldsC_98956 (sub_98956 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-14. LIT LE TABLEAU DES SEUILS DE BROUILLARD de la palette : contrôle que la
; taille vaut lignes [+46h] << [+4Eh] × 4 (sinon erreur 900Ah), alloue et lit les dword dans
; palette+42h. Appelée par Palette_LoadFadeFile_98670 (fichier nommé par TABL, « palfade »).
; ==============================================================================================
TextureLoader_LoadWithDwordFieldsC_A6F80		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+46h]
		mov	cl, [si+4Eh]
		shl	ax, cl
		shl	ax, 2
		movzx	eax, ax
		cmp	eax, [di+72h]
		jz	short loc_A6FA9
		push	900Ah
		call	sub_1DDFE
		pop	cx

loc_A6FA9:
		push	1
		push	0
		push	2
		push	large [di+72h]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+44h], dx
		mov	[si+42h], ax
		or	ax, dx
		jnz	short loc_A6FD1
		push	900Bh
		call	sub_1DDFE
		pop	cx

loc_A6FD1:
		push	large [si+42h]
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
TextureLoader_LoadWithDwordFieldsC_A6F80		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_LoadFadeTables_989B8 (sub_989B8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-28 (ex-TextureLoader_LoadWithDwordFieldsD_989B8). Chunk FADE de PALFADE.IFF :
; bloc de la taille du chunk (type 2) rangé en objet palette +0x5E (pointeur) / +0x62 (type) /
; +0x64 (taille), nombre de tables +0x5C = taille >> 8 (shr ax, 8), puis lecture brute du
; chunk. Pour l'objet palette global (word_724CA), +0x5E et +0x62 sont dword_72528 et
; byte_7252C : les tables de 256 octets lues par Particle_Draw_4C7ED (teinte des fumées) et
; les faces translucides. Données : 44 tables (11 264 octets) ; 0 à 15 éclaircissent, 16 à 31
; assombrissent, 32 à 43 teintent (SMOKE_SYSTEM.md § 5.4).
; ==============================================================================================
Palette_LoadFadeTables_A6FE2		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
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
		push	1414h
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapperB_65290
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
		push	large [si+5Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
Palette_LoadFadeTables_A6FE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A7068		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_A7080
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_A7085

loc_A7080:
		mov	ax, dx
		add	ax, 8

loc_A7085:
		mov	ax, dx
		pop	bp
		retf
sub_A7068		endp
ovr283		ends
