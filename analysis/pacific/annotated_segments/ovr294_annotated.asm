ovr294		segment	para public 'OVERLAY' use16
		assume cs:ovr294
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Terrain_ProcessTileThunks_9ADF0 (sub_9ADF0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle 3 thunks VROOMM voisins (63 lignes).
; ==============================================================================================
Terrain_ProcessTileThunks_A9450		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	[si+2], di
		mov	bx, [si+2]
		mov	ax, [bx+0BDh]
		mov	[si+8], ax
		mov	ax, [bx+0BFh]
		mov	[si+71h], ax
		push	word ptr [si+71h]
		push	bx
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_73FA9
		add	sp, 6
		xor	ax, ax
		mov	[si+119h], ax
		mov	[si+125h], ax
		mov	ax, 5
		mov	[si+127h], ax
		mov	[si+11Bh], ax
		mov	ax, di
		add	ax, 0C1h
		push	ax
		mov	ax, si
		add	ax, 73h
		push	ax
		call	sub_73F60
		add	sp, 4
		mov	ax, di
		add	ax, 171h
		push	ax
		mov	ax, si
		add	ax, 0F0h
		push	ax
		call	sub_740A0
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
Terrain_ProcessTileThunks_A9450		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Terrain_ProcessTileThunksB_9AE6C (sub_9AE6C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle 3 thunks VROOMM voisins et CRT_FreeNear_Wrap.
; ==============================================================================================
Terrain_ProcessTileThunksB_A94CC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A952A
		mov	word ptr [si], 15C6h
		cmp	word ptr [si+4], 0
		jz	short loc_A94ED
		mov	bx, [si+4]
		mov	word ptr [bx+5Eh], 0

loc_A94ED:
		push	2
		mov	ax, si
		add	ax, 0F0h
		push	ax
		call	sub_740A5
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 73h
		push	ax
		call	sub_73F65
		add	sp, 4
		push	0
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_73FF9
		add	sp, 4
		test	di, 1
		jz	short loc_A952A
		push	si
		call	sub_3B2
		pop	cx

loc_A952A:
		pop	di
		pop	si
		pop	bp
		retf
Terrain_ProcessTileThunksB_A94CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A952E		proc far

var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		lea	ax, [bp+var_E]
		push	ax
		call	sub_41A
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		push	[bp+var_E]
		call	sub_3E4
		add	sp, 4
		movzx	eax, [bp+var_6]
		movzx	edx, [bp+var_2]
		imul	eax, edx
		movzx	edx, [bp+var_4]
		imul	eax, edx
		mov	[bp+var_C], eax
		shld	edx, eax, 10h
		leave
		retf
sub_A952E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A956F		proc far

var_4C2		= word ptr -4C2h
var_465		= dword ptr -465h
var_461		= dword ptr -461h
var_45C		= word ptr -45Ch
var_40C		= word ptr -40Ch
var_3BC		= word ptr -3BCh
var_3AC		= word ptr -3ACh
var_3AA		= word ptr -3AAh
var_3A8		= word ptr -3A8h
var_3A4		= word ptr -3A4h
var_347		= dword ptr -347h
var_343		= dword ptr -343h
var_33F		= dword ptr -33Fh
var_32A		= word ptr -32Ah
var_328		= word ptr -328h
var_2AC		= word ptr -2ACh
var_25C		= word ptr -25Ch
var_20C		= word ptr -20Ch
var_1BC		= word ptr -1BCh
var_15F		= dword ptr -15Fh
var_15B		= dword ptr -15Bh
var_157		= dword ptr -157h
var_142		= word ptr -142h
var_140		= word ptr -140h
var_114		= word ptr -114h
var_B7		= dword ptr -0B7h
var_B3		= dword ptr -0B3h
var_AE		= word ptr -0AEh
var_51		= dword ptr -51h
var_4D		= dword ptr -4Dh
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4C2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	byte ptr [si+0Ah], 0
		mov	byte ptr [si+3], 0
		mov	word ptr [si+0B3h], 0
		mov	[bp+var_2], di
		push	8
		push	[bp+var_2]
		mov	ax, si
		add	ax, 27Fh
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+287h], 0
		mov	[bp+var_4], 0
		lea	ax, [bp+var_AE]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_AE], 508h
		mov	[bp+var_4D], 100h
		mov	[bp+var_51], 0
		mov	[bp+var_AE], 0E61h
		lea	ax, [bp+var_114]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_114], 508h
		mov	[bp+var_B3], 100h
		mov	[bp+var_B7], 0
		mov	[bp+var_114], 0E61h
		lea	ax, [bp+var_1BC]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_1BC], 508h
		mov	[bp+var_15B], 100h
		mov	[bp+var_15F], 0
		mov	[bp+var_1BC], 520h
		mov	[bp+var_140], 0
		xor	ax, ax
		mov	[bp+var_142], ax
		movsx	eax, ax
		mov	[bp+var_157], eax
		mov	[bp+var_1BC], 15AEh
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	ds
		push	offset aZIP
		push	ds
		push	di
		push	ds
		push	offset aTERRAIN_1
		lea	ax, [bp+var_25C]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	ds
		push	offset aPAK
		push	ds
		push	offset aTERRAIN_2
		push	ds
		push	offset a__1
		lea	ax, [bp+var_20C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	ds
		push	offset aIFF
		push	ds
		push	offset aTERRAIN_3
		push	ds
		push	offset a__1
		lea	ax, [bp+var_2AC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	[bp+var_F], 1
		lea	ax, [bp+var_3A4]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_3A4], 508h
		mov	[bp+var_343], 100h
		mov	[bp+var_347], 0
		mov	[bp+var_3A4], 520h
		mov	[bp+var_328], 0
		xor	ax, ax
		mov	[bp+var_32A], ax
		movsx	eax, ax
		mov	[bp+var_33F], eax
		push	ds
		lea	ax, [bp+var_2AC]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jnz	short loc_A96EA
		jmp	loc_A976F

loc_A96EA:
		push	large 52524554h
		lea	ax, [bp+var_2AC]
		push	ax
		lea	ax, [bp+var_3A4]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jz	short loc_A9754
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_3A4]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A9754
		lea	ax, [bp+var_3A4]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		mov	eax, [di]
		cmp	eax, [bp+var_E]
		jnz	short loc_A9748
		mov	eax, [di+4]
		cmp	eax, [bp+var_A]
		jnz	short loc_A9748
		mov	ax, 1
		jmp	short loc_A974A

loc_A9748:
		xor	ax, ax

loc_A974A:
		or	al, al
		jz	short loc_A9759
		mov	[bp+var_F], 0
		jmp	short loc_A9759

loc_A9754:
		mov	[bp+var_4], 1

loc_A9759:
		lea	ax, [bp+var_3A4]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		lea	ax, [bp+var_3A4]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx

loc_A976F:
		cmp	[bp+var_F], 0
		jnz	short loc_A977E
		cmp	[bp+var_4], 0
		jnz	short loc_A977E
		jmp	loc_A9C6C

loc_A977E:
		push	cs
		call	near ptr sub_A952E
		push	dx
		push	ax
		pop	eax
		cmp	eax, 10C8E0h
		jge	short loc_A9797
		push	1545h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_A9797:
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jz	short loc_A97A3
		jmp	loc_A9C18

loc_A97A3:
		cmp	byte_7C9F0, 2
		jnz	short loc_A97AF
		mov	ax, 1
		jmp	short loc_A97B1

loc_A97AF:
		xor	ax, ax

loc_A97B1:
		or	ax, ax
		jz	short loc_A97CB
		cmp	byte_7C9F0, 2
		jnz	short loc_A97CB
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_A97CB

loc_A97CB:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		mov	[bp+var_30], 0
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		lea	ax, [bp+var_3BC]
		push	ax
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		push	ds
		push	offset aShp_7
		push	ds
		push	offset aCsmlgp_3
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_45C]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_4C2]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_4C2], 508h
		mov	[bp+var_461], 100h
		mov	[bp+var_465], 0
		mov	[bp+var_4C2], 0E61h
		push	1
		lea	ax, [bp+var_45C]
		push	ax
		lea	ax, [bp+var_4C2]
		push	ax
		mov	bx, [bp+var_4C2]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_4C2]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_48+2], dx
		mov	word ptr [bp+var_48], ax
		mov	eax, [bp+var_48]
		mov	[bp+var_30], eax
		mov	[bp+var_2C], 3
		mov	[bp+var_2B], 1
		mov	[bp+var_2A], 0
		mov	eax, [bp+var_44]
		mov	[bp+var_2A], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_40]
		push	0
		mov	al, [bp+var_2C]
		push	ax
		push	large [bp+var_30]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_4C2]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_4C2]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_4C2]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		lea	ax, word ptr [bp+var_30]
		push	ax
		lea	ax, [bp+var_3BC]
		push	ax
		call	sub_690A8
		add	sp, 4
		mov	[bp+var_3AC], 1
		mov	[bp+var_3AA], 0
		mov	[bp+var_3A8], 3
		mov	bx, word_79260
		mov	ax, [bx+14h]
		mov	[bp+var_32], ax
		lea	ax, [bp+var_3BC]
		mov	[bx+14h], ax
		push	0FFh
		push	bx
		call	sub_75D09
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_38]
		push	ax
		call	sub_76245
		add	sp, 6
		push	ds
		push	offset aShp_8
		push	ds
		push	offset aBlkbrd_3
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_45C]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_4C2]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_4C2], 508h
		mov	[bp+var_461], 100h
		mov	[bp+var_465], 0
		mov	[bp+var_4C2], 0E61h
		push	1
		lea	ax, [bp+var_45C]
		push	ax
		lea	ax, [bp+var_4C2]
		push	ax
		mov	bx, [bp+var_4C2]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_4C2]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_48+2], dx
		mov	word ptr [bp+var_48], ax
		mov	eax, [bp+var_48]
		mov	[bp+var_26], eax
		mov	[bp+var_22], 3
		mov	[bp+var_21], 1
		mov	[bp+var_20], 0
		mov	eax, [bp+var_44]
		mov	[bp+var_20], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_40]
		push	0
		mov	al, [bp+var_22]
		push	ax
		push	large [bp+var_26]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_4C2]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_4C2]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_4C2]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	64DEh
		call	VGA_LoadPalette
		pop	cx
		push	large 0
		mov	al, [bp+var_22]
		push	ax
		push	large [bp+var_26]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_6329
		lea	ax, [bp+var_40C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_40C]
		push	ax
		push	large 3A005Bh
		call	sub_74BA9
		add	sp, 0Ah
		push	seg seg008
		push	offset loc_6339
		lea	ax, [bp+var_40C]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_40C]
		push	ax
		push	large 440069h
		call	sub_74BA9
		add	sp, 0Ah
		push	1
		lea	ax, [bp+var_25C]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		mov	bx, [bp+var_AE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		lea	ax, [bp+var_20C]
		push	ax
		lea	ax, [bp+var_114]
		push	ax
		mov	bx, [bp+var_114]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_114]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_1C91D
		add	sp, 4
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_6C2A4
		pop	cx
		lea	ax, [bp+var_114]
		push	ax
		call	sub_6C2A4
		pop	cx
		mov	ax, [bp+var_32]
		mov	[bp+var_3A], ax
		mov	bx, word_79260
		mov	[bx+14h], ax
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		cmp	byte_7C9F0, 2
		jnz	short loc_A9B45
		mov	ax, 1
		jmp	short loc_A9B47

loc_A9B45:
		xor	ax, ax

loc_A9B47:
		or	ax, ax
		jz	short loc_A9B8D
		cmp	byte_7C9F0, 2
		jnz	short loc_A9B8D
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_3C], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_3C], 0
		jnz	short loc_A9B8D
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_A9B8D

loc_A9B8D:
		lea	ax, [bp+var_38]
		push	ax
		call	sub_7627C
		pop	cx
		push	2
		lea	ax, [bp+var_3BC]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_2B], 0
		jz	short loc_A9BCA
		cmp	[bp+var_30], 0
		jz	short loc_A9BCA
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A9BCA

loc_A9BCA:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_A9C02
		cmp	[bp+var_26], 0
		jz	short loc_A9C02
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A9C02

loc_A9C02:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		jmp	short loc_A9C6C

loc_A9C18:
		push	1
		lea	ax, [bp+var_25C]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		mov	bx, [bp+var_AE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		lea	ax, [bp+var_20C]
		push	ax
		lea	ax, [bp+var_114]
		push	ax
		mov	bx, [bp+var_114]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_114]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_1C91D
		add	sp, 4
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_6C2A4
		pop	cx
		lea	ax, [bp+var_114]
		push	ax
		call	sub_6C2A4
		pop	cx

loc_A9C6C:
		push	0
		lea	ax, [bp+var_2AC]
		push	ax
		lea	ax, [bp+var_1BC]
		push	ax
		call	StreamReader_ReadDispatch_6C244
		add	sp, 6
		mov	al, 0
		push	large 0
		push	large 52524554h
		lea	ax, [bp+var_1BC]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_1BC]
		push	ax
		call	sub_766BF
		pop	cx
		push	large 0
		push	large 4F464E49h
		lea	ax, [bp+var_1BC]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		mov	word ptr [bp+var_14+2], ds
		mov	word ptr [bp+var_14], di
		push	large [bp+var_157]
		push	large 8
		push	large [bp+var_14]
		lea	ax, [bp+var_1BC]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_157], 8
		lea	ax, [bp+var_1BC]
		push	ax
		call	sub_766D3
		pop	cx
		lea	ax, [bp+var_1BC]
		push	ax
		call	sub_766C9
		pop	cx
		push	1
		lea	ax, [bp+var_20C]
		push	ax
		mov	ax, si
		add	ax, 208h
		push	ax
		mov	bx, [si+208h]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 208h
		push	ax
		call	sub_7844
		add	sp, 4
		mov	ax, si
		add	ax, 208h
		push	ax
		call	StreamReader_GetCapacity_6C5C7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_18], eax
		mov	ax, [si+275h]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_A9D42
		mov	eax, [si+269h]
		jmp	short loc_A9D47

loc_A9D42:
		mov	eax, [si+279h]

loc_A9D47:
		mov	edx, [bp+var_18]
		add	edx, eax
		mov	[bp+var_1C], edx
		push	0
		push	edx
		push	large [bp+var_18]
		mov	ax, si
		add	ax, 208h
		push	ax
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		push	0
		push	large 41524554h
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A9D8B
		jmp	loc_A9F41

loc_A9D8B:
		mov	byte ptr [si+0Ah], 1
		mov	[si+8], ds
		mov	word ptr [si+6], 1582h
		push	0
		push	large 53524556h
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A9DCC
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_20+2], ax
		cmp	word ptr [bp+var_20+2], 200h
		jnb	short loc_A9DD5
		push	0E00Bh
		jmp	short loc_A9DCF

loc_A9DCC:
		push	0E00Ch

loc_A9DCF:
		call	sub_1DDFE
		pop	cx

loc_A9DD5:
		push	0
		push	large 4F464E49h
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A9E10
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+28Ch], eax

loc_A9E10:
		push	0
		push	large 584F4C42h
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A9E2D
		jmp	loc_A9F1C

loc_A9E2D:
		push	0
		push	large 56454C45h
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A9E4A
		jmp	loc_A9EE6

loc_A9E4A:
		mov	eax, [si+7Dh]
		mov	ebx, 2Eh
		cdq
		idiv	ebx
		mov	[si+0BDh], ax
		cmp	word ptr [si+0BDh], 3
		jnz	short loc_A9E6A
		mov	word ptr [si+0BDh], 2

loc_A9E6A:
		push	seg stub294
		push	offset sub_740E4
		push	11h
		push	word ptr [si+0BDh]
		push	large 9A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+0BFh], ax
		mov	di, [si+0BFh]
		mov	word ptr [bp+var_20+2], 0
		jmp	short loc_A9EAA

loc_A9E93:
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	si
		push	di
		call	sub_73F9A
		add	sp, 6
		inc	word ptr [bp+var_20+2]
		add	di, 9Ah

loc_A9EAA:
		mov	ax, [si+0BDh]
		cmp	ax, word ptr [bp+var_20+2]
		jg	short loc_A9E93
		mov	di, [si+0BFh]
		mov	word ptr [si+290h], 0
		mov	word ptr [bp+var_20+2], 0
		jmp	short loc_A9EDD

loc_A9EC4:
		mov	ax, [si+290h]
		cmp	ax, [di+8Eh]
		jge	short loc_A9ED6
		mov	ax, [di+8Eh]
		mov	[si+290h], ax

loc_A9ED6:
		inc	word ptr [bp+var_20+2]
		add	di, 9Ah

loc_A9EDD:
		mov	ax, [si+0BDh]
		cmp	ax, word ptr [bp+var_20+2]
		jg	short loc_A9EC4

loc_A9EE6:
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	si
		mov	ax, si
		add	ax, 0C1h
		push	ax
		call	sub_73F35
		add	sp, 6
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	si
		mov	ax, si
		add	ax, 171h
		push	ax
		call	sub_74070
		add	sp, 6
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A9F1C:
		cmp	byte_7752B, 0
		jz	short loc_A9F41
		mov	ax, si
		add	ax, 0Bh
		push	ax
		push	ds
		push	offset word_7CCEA
		call	sub_73FEA
		add	sp, 6
		push	ds
		push	offset word_7CC8E
		call	sub_73EA0
		add	sp, 4

loc_A9F41:
		mov	[bp+var_3A4], 520h
		lea	ax, [bp+var_3A4]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_3A4]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	[bp+var_1BC], 520h
		lea	ax, [bp+var_1BC]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_1BC]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	0
		lea	ax, [bp+var_114]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_A956F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Terrain_ClearTileList_9B161 (sub_9B161 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; TerrainTile_ListClear, Memory_TypedFree_5C7B6, thunks voisins.
; ==============================================================================================
Terrain_ClearTileList_A9FA3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0B5h
		mov	[bp+var_2], 0
		jmp	short loc_A9FD5

loc_A9FBB:
		cmp	word ptr [di], 0
		jz	short loc_A9FCF
		push	3
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_A9FCF

loc_A9FCF:
		inc	[bp+var_2]
		add	di, 2

loc_A9FD5:
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_2]
		jg	short loc_A9FBB
		mov	word ptr [si+0B3h], 0
		push	658Ch
		call	TerrainTile_ListClear
		pop	cx
		mov	ax, si
		add	ax, 171h
		push	ax
		call	sub_74075
		pop	cx
		cmp	byte_7CCA3, 0
		jz	short loc_AA01E
		cmp	dword_7CC9E, 0
		jz	short loc_AA01E
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	656Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_AA01E

loc_AA01E:
		mov	dword_7CC9E, 0
		mov	byte_7CCA3, 0
		mov	dword_7CCA4, 0
		call	sub_73F30
		pop	di
		pop	si
		leave
		retf
Terrain_ClearTileList_A9FA3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA03E		proc far

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
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_AA053
		jmp	loc_AA1B0

loc_AA053:
		mov	word ptr [si], 158Ah
		mov	ax, si
		add	ax, 0B5h
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0
		jmp	short loc_AA084

loc_AA066:
		mov	bx, [bp+var_2]
		cmp	word ptr [bx], 0
		jz	short loc_AA07D
		push	3
		push	word ptr [bx]
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_AA07D

loc_AA07D:
		inc	[bp+var_4]
		add	[bp+var_2], 2

loc_AA084:
		mov	ax, [si+0B3h]
		cmp	ax, [bp+var_4]
		jg	short loc_AA066
		mov	word ptr [si+0B3h], 0
		push	658Ch
		call	TerrainTile_ListClear
		pop	cx
		cmp	byte_7CCA3, 0
		jz	short loc_AA0C1
		cmp	dword_7CC9E, 0
		jz	short loc_AA0C1
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	656Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_AA0C1

loc_AA0C1:
		mov	dword_7CC9E, 0
		mov	byte_7CCA3, 0
		mov	dword_7CCA4, 0
		push	seg stub289
		push	offset sub_73F9F
		push	large 190000h
		push	9Ah
		push	word ptr [si+0BFh]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	ds
		push	offset word_7CCEA
		call	sub_751BF
		add	sp, 4
		cmp	byte_7CCFB, 0
		jz	short loc_AA124
		cmp	dword_7CCF6, 0
		jz	short loc_AA124
		push	0
		mov	al, byte_7CCFA
		push	ax
		push	65C6h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_AA124

loc_AA124:
		mov	dword_7CCF6, 0
		mov	byte_7CCFB, 0
		mov	dword_7CCFC, 0
		push	ds
		push	offset word_7CC8E
		call	sub_751BF
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 208h
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 171h
		push	ax
		call	sub_7407A
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 0C1h
		push	ax
		call	sub_73F3A
		add	sp, 4
		mov	word ptr [si+0Bh], 520h
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	0
		push	si
		call	sub_1E120
		add	sp, 4
		test	di, 1
		jz	short loc_AA1B0
		push	si
		call	sub_3B2
		pop	cx

loc_AA1B0:
		pop	di
		pop	si
		leave
		retf
sub_AA03E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Terrain_AllocateAndFormatMultiple_9B2F4 (sub_9B2F4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 213 lignes, NON DÉTAILLÉE — alloue plusieurs blocs (CRT_Malloc16/32_Retry ×4) et formate
; (CRT_Doprnt_Dispatch).
; ==============================================================================================
Terrain_AllocateAndFormatMultiple_AA1B4		proc far

var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		cmp	byte ptr [si+0Ah], 0
		jnz	short loc_AA1C9
		jmp	loc_AA30C

loc_AA1C9:
		mov	[bp+var_2], si
		push	12Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_AA1DE
		jmp	loc_AA308

loc_AA1DE:
		mov	word ptr [si], 15C6h
		mov	dword ptr [si+23h], 0
		mov	byte ptr [si+27h], 2
		mov	byte ptr [si+28h], 0
		mov	dword ptr [si+29h], 0
		add	ax, 2Fh
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_AA20F
		mov	dx, word ptr [bp+var_6+2]
		jmp	short loc_AA220

loc_AA20F:
		push	large 2
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax

loc_AA220:
		or	ax, dx
		jz	short loc_AA226
		jmp	short loc_AA226

loc_AA226:
		mov	ax, si
		add	ax, 33h
		mov	word ptr [bp+var_A+2], ds
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_AA23D
		mov	dx, word ptr [bp+var_A+2]
		jmp	short loc_AA24E

loc_AA23D:
		push	large 2
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax

loc_AA24E:
		or	ax, dx
		jz	short loc_AA254
		jmp	short loc_AA254

loc_AA254:
		mov	ax, si
		add	ax, 39h
		mov	word ptr [bp+var_E+2], ds
		mov	word ptr [bp+var_E], ax
		cmp	[bp+var_E], 0
		jz	short loc_AA26B
		mov	dx, word ptr [bp+var_E+2]
		jmp	short loc_AA27C

loc_AA26B:
		push	large 2
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax

loc_AA27C:
		or	ax, dx
		jz	short loc_AA282
		jmp	short loc_AA282

loc_AA282:
		mov	dword ptr [si+3Bh], 0
		mov	byte ptr [si+3Fh], 2
		mov	byte ptr [si+40h], 0
		mov	dword ptr [si+41h], 0
		mov	byte ptr [si+0Ah], 0
		xor	ax, ax
		mov	[si+37h], ax
		mov	[si+2Dh], ax
		mov	[si+1Bh], ax
		xor	ax, ax
		mov	[si+47h], ax
		mov	[si+45h], ax
		mov	word ptr [si+55h], 0
		mov	word ptr [si+57h], 0
		mov	word ptr [si+59h], 0
		mov	word ptr [si+5Bh], 0
		mov	word ptr [si+5Dh], 0
		mov	word ptr [si+5Fh], 0
		mov	word ptr [si+4Fh], 0
		push	seg stub294
		push	offset sub_740DF
		push	large 10004h
		push	10h
		mov	ax, si
		add	ax, 0B0h
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	byte ptr [si+73h], 0
		mov	byte ptr [si+0F0h], 0
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr Terrain_ProcessTileThunks_A9450
		add	sp, 4
		mov	ax, si
		jmp	short loc_AA30A

loc_AA308:
		mov	ax, si

loc_AA30A:
		mov	dx, ax

loc_AA30C:
		mov	ax, dx
		pop	si
		leave
		retf
Terrain_AllocateAndFormatMultiple_AA1B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TerrainTile_ConstructDescriptor_9B451 (sub_9B451 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, alloue et construit un descripteur de tuile
; (TerrainTile_DescriptorConstruct).
; ==============================================================================================
TerrainTile_ConstructDescriptor_AA311		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_AA32B
		push	9Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AA33B

loc_AA32B:
		push	si
		call	TerrainTile_DescriptorConstruct
		pop	cx
		mov	dword ptr [si+8Ah], 0

loc_AA33B:
		mov	ax, si
		pop	si
		pop	bp
		retf
TerrainTile_ConstructDescriptor_AA311		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TerrainTile_Helper_9B480 (sub_9B480 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (15 lignes).
; ==============================================================================================
TerrainTile_Helper_AA340		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 8
		mov	ax, dx
		pop	bp
		retf
TerrainTile_Helper_AA340		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA34F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_AA34F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA357		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_AA357		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AA35F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_AA393
		mov	word ptr [si], 520h
		push	si
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		test	di, 1
		jz	short loc_AA393
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_AA393

loc_AA393:
		pop	di
		pop	si
		pop	bp
		retf
sub_AA35F		endp
ovr294		ends
