seg207		segment	para public 'CODE' use16
		assume cs:seg207
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ah, 0, 0, 0E0h, 6Bh, 59h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextRenderer_LoadResourceFile_3DA1F (sub_3DA1F de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextRenderer_LoadResourceFile_661AF (sub_661AF de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 126 lignes,
; NON DÉTAILLÉE — construit un StreamReader temporaire (StreamReader_ConstructVariantA_63A39,
; seg190), l'ouvre en lecture (StreamReader_ReadDispatch_63D0E, seg190), et si succès lit son
; contenu (StreamReader_GetCapacity_64062, Memory_TypedFreeWrapperC_5C6F3). Référencée
; directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
TextRenderer_LoadResourceFile_6E338		proc far

var_6A		= word ptr -6Ah
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		mov	[bp+var_4], 0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		push	1
		push	[bp+arg_0]
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadDispatch_6C244
		add	sp, 6
		cmp	al, 1
		jnz	short loc_6E3CB
		push	1
		push	0
		mov	al, [bp+arg_2]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		pop	cx
		push	dx
		push	ax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_6E3CB
		push	0
		mov	al, [bp+arg_2]
		push	ax
		push	dx
		push	word ptr [bp+var_4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		pop	cx
		push	dx
		push	ax
		push	large [bp+var_C]
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh

loc_6E3CB:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	2
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_Close_6C110
		add	sp, 4
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]
		leave
		retf
TextRenderer_LoadResourceFile_6E338		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E3E9		proc far

var_6A		= word ptr -6Ah
var_D		= dword ptr -0Dh
var_9		= dword ptr -9
var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		mov	[bp+var_2], 1
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_6A], 508h
		mov	[bp+var_9], 100h
		mov	[bp+var_D], 0
		push	0
		push	[bp+arg_0]
		lea	ax, [bp+var_6A]
		push	ax
		mov	bx, [bp+var_6A]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	[bp+var_2], al
		cmp	[bp+var_2], 1
		jnz	short loc_6E452
		push	large 0FFFFFFFFh
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		cmp	eax, [bp+arg_6]
		jz	short loc_6E452
		mov	[bp+var_2], 0

loc_6E452:
		mov	al, [bp+var_2]
		mov	[bp+var_4], al
		push	2
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	al, [bp+var_4]
		leave
		retf
sub_6E3E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6E46B		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6E499
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		jmp	short loc_6E49B

loc_6E499:
		mov	ax, si

loc_6E49B:
		mov	si, ax
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	al, [bp+arg_2]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si], eax
		mov	al, [bp+var_5]
		mov	[si+4], al
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
sub_6E46B		endp
seg207		ends
