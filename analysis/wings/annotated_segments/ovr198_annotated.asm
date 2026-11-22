ovr198		segment	para public 'OVERLAY' use16
		assume cs:ovr198
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70C10		proc far

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
		jnz	short loc_70C2D
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_70C72

loc_70C2D:
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

loc_70C72:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_70C10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70C78		proc far

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
		jnz	short loc_70C91
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_70CD7

loc_70C91:
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

loc_70CD7:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_70C78		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70CDC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+42h], 0
		mov	dword ptr [si+48h], 0
		mov	word ptr [si+5Ah], 0
		pop	si
		pop	bp
		retf
sub_70CDC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70CFB		proc far

var_FA		= word ptr -0FAh
var_9D		= dword ptr -9Dh
var_99		= dword ptr -99h
var_95		= dword ptr -95h
var_8D		= dword ptr -8Dh
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_52		= word ptr -52h
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0FAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_70D30
		mov	[bp+var_2], di
		push	8
		push	[bp+var_2]
		push	646Ch
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte_60194, 0
		push	seg seg180
		push	0
		push	ds
		push	di
		jmp	short loc_70D3A

loc_70D30:
		push	seg seg180
		push	0
		push	ds
		push	offset unk_6018C

loc_70D3A:
		push	ds
		push	offset aPALETTE
		lea	ax, [bp+var_52]
		push	ax
		call	Path_BuildDataPath_1F0C4
		add	sp, 0Eh
		lea	ax, [bp+var_FA]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_FA], 9B5h
		mov	[bp+var_99], 100h
		mov	[bp+var_9D], 0
		mov	[bp+var_FA], 9CDh
		mov	[bp+var_7E], 0
		xor	ax, ax
		mov	[bp+var_80], ax
		movsx	eax, ax
		mov	[bp+var_95], eax
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_FA]
		push	ax
		mov	bx, [bp+var_FA]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_70DDF
		cmp	[bp+var_8D], 544C4150h
		jnz	short loc_70DAF
		mov	ax, 1
		jmp	short loc_70DB1

loc_70DAF:
		xor	ax, ax

loc_70DB1:
		or	ax, ax
		jz	short loc_70DDA
		lea	ax, [bp+var_FA]
		push	ax
		call	sub_541A0
		pop	cx
		lea	ax, [bp+var_FA]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_70E0C
		add	sp, 4
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		jmp	short loc_70DE7

loc_70DDA:
		push	9003h
		jmp	short loc_70DE2

loc_70DDF:
		push	9004h

loc_70DE2:
		call	sub_9D47

loc_70DE7:
		pop	cx
		mov	[bp+var_FA], 9CDh
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_FA]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_70CFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70E0C		proc far

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
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
		call	near ptr TextureLoader_LoadMixedFields_71236
		add	sp, 4
		cmp	word_603BE, 0
		jz	short loc_70E4C
		push	0
		push	large 4E424154h
		push	di
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_70E7B
		jmp	short loc_70E61

loc_70E4C:
		push	0
		push	large 46424154h
		push	di
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_70E7B

loc_70E61:
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
		call	near ptr Palette_LoadFadeFile_714C0
		add	sp, 4

loc_70E7B:
		cmp	byte ptr [si+62h], 3
		jnz	short loc_70E98
		push	0
		mov	al, [si+62h]
		push	ax
		push	large [si+5Eh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_70E9E

loc_70E98:
		mov	dx, [si+60h]
		mov	ax, [si+5Eh]

loc_70E9E:
		mov	bx, [si+52h]
		shl	bx, 8
		add	ax, bx
		mov	[si+8Ch], dx
		mov	[si+8Ah], ax
		cmp	dword ptr [si+80h], 0
		jz	short loc_70EB9
		jmp	loc_70F3C

loc_70EB9:
		push	1
		push	0
		push	2
		push	large 100h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[si+80h], eax
		mov	byte ptr [si+84h], 2
		mov	byte ptr [si+85h], 1
		mov	dword ptr [si+86h], 0
		mov	dword ptr [si+86h], 100h
		cmp	byte ptr [si+84h], 3
		jnz	short loc_70F1B
		push	0
		mov	al, [si+84h]
		push	ax
		push	large [si+80h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_70F23

loc_70F1B:
		mov	dx, [si+82h]
		mov	ax, [si+80h]

loc_70F23:
		mov	[bp+var_10], dx
		mov	[bp+var_12], ax
		xor	dx, dx
		jmp	short loc_70F36

loc_70F2D:
		les	bx, [bp+var_12]
		add	bx, dx
		mov	es:[bx], dl
		inc	dx

loc_70F36:
		cmp	dx, 100h
		jl	short loc_70F2D

loc_70F3C:
		push	large 0
		push	si
		call	Palette_SelectFogRow_35245
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_70E0C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70F4C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_70F5E
		jmp	loc_710D4

loc_70F5E:
		push	si
		nop
		push	cs
		call	near ptr TextureLoader_ReleaseMultipleB_710D8
		pop	cx
		cmp	byte ptr [si+85h], 0
		jz	short loc_70F8E
		cmp	dword ptr [si+80h], 0
		jz	short loc_70F8E
		push	0
		mov	al, [si+84h]
		push	ax
		mov	ax, si
		add	ax, 80h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_70F8E

loc_70F8E:
		mov	dword ptr [si+80h], 0
		mov	byte ptr [si+85h], 0
		mov	dword ptr [si+86h], 0
		cmp	byte ptr [si+63h], 0
		jz	short loc_70FCB
		cmp	dword ptr [si+5Eh], 0
		jz	short loc_70FCB
		push	0
		mov	al, [si+62h]
		push	ax
		mov	ax, si
		add	ax, 5Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_70FCB

loc_70FCB:
		mov	dword ptr [si+5Eh], 0
		mov	byte ptr [si+63h], 0
		mov	dword ptr [si+64h], 0
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_71005
		cmp	dword ptr [si+27h], 0
		jz	short loc_71005
		push	0
		mov	al, [si+2Bh]
		push	ax
		mov	ax, si
		add	ax, 27h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_71005

loc_71005:
		mov	dword ptr [si+27h], 0
		mov	byte ptr [si+2Ch], 0
		mov	dword ptr [si+2Dh], 0
		cmp	byte ptr [si+22h], 0
		jz	short loc_7103F
		cmp	dword ptr [si+1Dh], 0
		jz	short loc_7103F
		push	0
		mov	al, [si+21h]
		push	ax
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7103F

loc_7103F:
		mov	dword ptr [si+1Dh], 0
		mov	byte ptr [si+22h], 0
		mov	dword ptr [si+23h], 0
		cmp	byte ptr [si+18h], 0
		jz	short loc_71079
		cmp	dword ptr [si+13h], 0
		jz	short loc_71079
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_71079

loc_71079:
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		cmp	byte ptr [si+0Eh], 0
		jz	short loc_710B3
		cmp	dword ptr [si+9], 0
		jz	short loc_710B3
		push	0
		mov	al, [si+0Dh]
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_710B3

loc_710B3:
		mov	dword ptr [si+9], 0
		mov	byte ptr [si+0Eh], 0
		mov	dword ptr [si+0Fh], 0
		test	di, 1
		jz	short loc_710D4
		push	si
		call	sub_33B
		pop	cx

loc_710D4:
		pop	di
		pop	si
		pop	bp
		retf
sub_70F4C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_ReleaseMultipleB_A68C7 (sub_A68C7 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 11 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_ReleaseMultipleB_9829D (sub_9829D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 140 lignes, NON DÉTAILLÉE — variante de TextureLoader_ReleaseMultiple_98151.
; ==============================================================================================
TextureLoader_ReleaseMultipleB_710D8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Eh], 0
		jz	short loc_71105
		cmp	dword ptr [si+9], 0
		jz	short loc_71105
		push	0
		mov	al, [si+0Dh]
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_71105

loc_71105:
		mov	dword ptr [si+9], 0
		mov	byte ptr [si+0Eh], 0
		mov	dword ptr [si+0Fh], 0
		cmp	byte ptr [si+18h], 0
		jz	short loc_7113F
		cmp	dword ptr [si+13h], 0
		jz	short loc_7113F
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_7113F

loc_7113F:
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		cmp	byte ptr [si+22h], 0
		jz	short loc_71179
		cmp	dword ptr [si+1Dh], 0
		jz	short loc_71179
		push	0
		mov	al, [si+21h]
		push	ax
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_71179

loc_71179:
		mov	dword ptr [si+1Dh], 0
		mov	byte ptr [si+22h], 0
		mov	dword ptr [si+23h], 0
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_711B3
		cmp	dword ptr [si+27h], 0
		jz	short loc_711B3
		push	0
		mov	al, [si+2Bh]
		push	ax
		mov	ax, si
		add	ax, 27h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_711B3

loc_711B3:
		mov	dword ptr [si+27h], 0
		mov	byte ptr [si+2Ch], 0
		mov	dword ptr [si+2Dh], 0
		cmp	byte ptr [si+63h], 0
		jz	short loc_711ED
		cmp	dword ptr [si+5Eh], 0
		jz	short loc_711ED
		push	0
		mov	al, [si+62h]
		push	ax
		mov	ax, si
		add	ax, 5Eh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_711ED

loc_711ED:
		mov	dword ptr [si+5Eh], 0
		mov	byte ptr [si+63h], 0
		mov	dword ptr [si+64h], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 42h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	dword ptr [si+42h], 0
		push	word ptr [si+5Ah]
		call	sub_33B
		pop	cx
		mov	word ptr [si+5Ah], 0
		push	si
		call	Palette_DestructResource_35081
		pop	cx
		pop	si
		pop	bp
		retf
TextureLoader_ReleaseMultipleB_710D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TextureLoader_LoadMixedFields_A6A25 (sub_A6A25 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à TextureLoader_LoadMixedFields_983FB (sub_983FB de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14
; (partie chunks). CHARGEUR DE PALETTE.IFF : INFO (dd non rangé, puis +68h précision du
; brouillard, +52h, +4Eh log2 seuils par ligne, +46h lignes, +7Ah pas ; calcule +6Ah =
; 1<<+68h, +6Eh = moitié, +4Ch = 1<<+4Eh, +7Ch = +46h<<+7Ah) ; PALT
; (TextureLoader_LoadWithDwordFields_98784) ; SKYC ; BLWH ; RANG
; (TextureLoader_FormatAndLoad_985F6, sinon +58h = 0).
; ==============================================================================================
TextureLoader_LoadMixedFields_71236		proc far

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
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_71259
		jmp	loc_712DB

loc_71259:
		push	di
		call	ResourceRecord_ReadFieldGroupC_53FFD
		pop	cx
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[si+68h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[si+52h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[si+4Eh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[si+46h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
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

loc_712DB:
		push	0
		push	large 544C4150h
		push	di
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_712FA
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_715D4
		add	sp, 4

loc_712FA:
		push	0
		push	large 43594B53h
		push	di
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_71319
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_71362
		add	sp, 4

loc_71319:
		push	0
		push	large 48574C42h
		push	di
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_71338
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_71753
		add	sp, 4

loc_71338:
		push	0
		push	large 474E4152h
		push	di
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_71359
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_71440
		add	sp, 4
		jmp	short loc_7135E

loc_71359:
		mov	word ptr [si+58h], 0

loc_7135E:
		pop	di
		pop	si
		pop	bp
		retf
TextureLoader_LoadMixedFields_71236		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71362		proc far

var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[si+33h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[si+35h], ax
		mov	ax, [si+33h]
		imul	word ptr [si+35h]
		imul	ax, ax, 3
		movsx	eax, ax
		mov	[bp+var_4], eax
		cmp	dword ptr [si+27h], 0
		jnz	short loc_713D9
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
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

loc_713D9:
		push	large [bp+var_4]
		cmp	byte ptr [si+2Bh], 3
		jnz	short loc_713FA
		push	0
		mov	al, [si+2Bh]
		push	ax
		push	large [si+27h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_71400

loc_713FA:
		mov	dx, [si+29h]
		mov	ax, [si+27h]

loc_71400:
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		mov	word ptr [si+31h], 0
		mov	[bp+var_10], 4D6400h
		mov	ax, [si+33h]
		mov	[bp+var_12], ax
		movsx	ebx, [bp+var_12]
		mov	eax, [bp+var_10]
		cdq
		idiv	ebx
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		mov	[si+37h], eax
		mov	byte ptr [si+3Bh], 0
		pop	di
		pop	si
		leave
		retf
sub_71362		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71440		proc far

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
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[si+58h], ax
		cmp	word ptr [si+5Ah], 0
		jnz	short loc_71479
		push	seg stub198
		push	offset sub_58EF0
		push	1
		push	word ptr [si+58h]
		push	large 0F0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+5Ah], ax

loc_71479:
		xor	di, di
		jmp	short loc_714B7

loc_7147D:
		push	large 0Dh
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_53F98
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
		call	near ptr sub_70C10
		add	sp, 6
		push	ds
		push	ax
		mov	cx, 0Fh
		call	CRT_Fmemcpy
		inc	di

loc_714B7:
		cmp	[si+58h], di
		jg	short loc_7147D
		pop	di
		pop	si
		leave
		retf
sub_71440		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_LoadFadeFile_A6C9A (sub_A6C9A de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Palette_LoadFadeFile_98670 (sub_98670 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-28 (ex-
; TextureLoader_OpenAndLoadSubrecord_98670). Ouvre PALETTE\<nom>.IFF, nom donné par le chunk
; TABL de PALETTE.IFF (« palfade » : PALFADE.IFF) ; racine FORM FTBL obligatoire (erreur
; 9005h, fichier absent 9006h) ; chunk D_HZ → TextureLoader_LoadWithDwordFieldsC_98956 ; chunk
; FADE → Palette_LoadFadeTables_989B8. Appelée par TextureLoader_SelectMipLevel_980F0 quand
; PALETTE.IFF a un chunk TABL.
; ==============================================================================================
Palette_LoadFadeFile_714C0		proc far

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
		push	seg seg180
		push	0
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aPALETTE
		lea	ax, [bp+var_50]
		push	ax
		call	Path_BuildDataPath_1F0C4
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_F8], 9B5h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 9CDh
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
		jz	short loc_715A8
		push	0
		push	large 4C425446h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_715A3
		push	0
		push	large 5A485F44h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_7157A
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_7180F
		add	sp, 4

loc_7157A:
		push	0
		push	large 45444146h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_715B1
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_7187B
		add	sp, 4
		jmp	short loc_715B1

loc_715A3:
		push	9005h
		jmp	short loc_715AB

loc_715A8:
		push	9006h

loc_715AB:
		call	sub_9D47
		pop	cx

loc_715B1:
		mov	[bp+var_F8], 9CDh
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	si
		leave
		retf
Palette_LoadFadeFile_714C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_715D4		proc far

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
		cmp	dword ptr [si+9], 0
		jnz	short loc_7162E
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
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

loc_7162E:
		cmp	byte ptr [si+0Dh], 3
		jnz	short loc_7164B
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large [si+9]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_71651

loc_7164B:
		mov	dx, [si+0Bh]
		mov	ax, [si+9]

loc_71651:
		or	ax, dx
		jnz	short loc_7165E
		push	9007h
		call	sub_9D47
		pop	cx

loc_7165E:
		cmp	byte ptr [si+0Dh], 3
		jnz	short loc_7167B
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large [si+9]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_71681

loc_7167B:
		mov	dx, [si+0Bh]
		mov	ax, [si+9]

loc_71681:
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		cmp	byte ptr [si+0Dh], 3
		jnz	short loc_716A9
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large [si+9]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_716AF

loc_716A9:
		mov	dx, [si+0Bh]
		mov	ax, [si+9]

loc_716AF:
		push	dx
		push	ax
		push	si
		call	sub_35022
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
		cmp	dword ptr [si+1Dh], 0
		jnz	short loc_7171F
		movsx	eax, word ptr [si+7]
		mov	[bp+var_10], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
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

loc_7171F:
		cmp	byte ptr [si+21h], 3
		jnz	short loc_7173C
		push	0
		mov	al, [si+21h]
		push	ax
		push	large [si+1Dh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_71742

loc_7173C:
		mov	dx, [si+1Fh]
		mov	ax, [si+1Dh]

loc_71742:
		or	ax, dx
		jnz	short loc_7174F
		push	9030h
		call	sub_9D47
		pop	cx

loc_7174F:
		pop	di
		pop	si
		leave
		retf
sub_715D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71753		proc far

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
		cmp	dword ptr [si+13h], 0
		jnz	short loc_717AD
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
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

loc_717AD:
		cmp	byte ptr [si+17h], 3
		jnz	short loc_717CA
		push	0
		mov	al, [si+17h]
		push	ax
		push	large [si+13h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_717D0

loc_717CA:
		mov	dx, [si+15h]
		mov	ax, [si+13h]

loc_717D0:
		or	ax, dx
		jnz	short loc_717DD
		push	9009h
		call	sub_9D47
		pop	cx

loc_717DD:
		cmp	byte ptr [si+17h], 3
		jnz	short loc_717FA
		push	0
		mov	al, [si+17h]
		push	ax
		push	large [si+13h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_71800

loc_717FA:
		mov	dx, [si+15h]
		mov	ax, [si+13h]

loc_71800:
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_71753		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7180F		proc far

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
		jz	short loc_71838
		push	900Ah
		call	sub_9D47
		pop	cx

loc_71838:
		cmp	dword ptr [si+42h], 0
		jnz	short loc_7185A
		push	1
		push	0
		push	2
		push	large [di+72h]
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+44h], dx
		mov	[si+42h], ax

loc_7185A:
		cmp	dword ptr [si+42h], 0
		jnz	short loc_7186A
		push	900Bh
		call	sub_9D47
		pop	cx

loc_7186A:
		push	large [si+42h]
		push	di
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_7180F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7187B		proc far

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
		cmp	dword ptr [si+5Eh], 0
		jnz	short loc_718DB
		movsx	eax, word ptr [si+5Ch]
		mov	[bp+var_4], eax
		push	26AEh
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapperB_44862
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

loc_718DB:
		mov	ax, [si+5Ch]
		shr	ax, 8
		mov	[si+5Ch], ax
		cmp	byte ptr [si+62h], 3
		jnz	short loc_71901
		push	0
		mov	al, [si+62h]
		push	ax
		push	large [si+5Eh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_71907

loc_71901:
		mov	dx, [si+60h]
		mov	ax, [si+5Eh]

loc_71907:
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_7187B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71916		proc far
		push	bp
		mov	bp, sp
		push	646Ch
		call	String_ConstructEmpty
		pop	cx
		pop	bp
		retf
sub_71916		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71924		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_7193C
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_71941

loc_7193C:
		mov	ax, dx
		add	ax, 8

loc_71941:
		mov	ax, dx
		pop	bp
		retf
sub_71924		endp
ovr198		ends
