seg026		segment	para public 'CODE' use16
		assume cs:seg026
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0D2h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10A01		proc far

var_17C		= word ptr -17Ch
var_104		= word ptr -104h
var_A7		= dword ptr -0A7h
var_A3		= dword ptr -0A3h
var_9F		= dword ptr -9Fh
var_8E		= dword ptr -8Eh
var_5C		= word ptr -5Ch
var_C		= word ptr -0Ch
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= byte ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 17Ch
		push	si
		mov	si, [bp+arg_2]
		push	ds
		push	offset aIff
		push	ds
		push	offset aConvdat2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_104]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_104], 480h
		mov	[bp+var_A3], 100h
		mov	[bp+var_A7], 0
		mov	[bp+var_104], 498h
		push	1
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		mov	bx, [bp+var_104]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+arg_0], 4
		jbe	short loc_10A75
		push	2158h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_10A75:
		cmp	[bp+arg_0], 0
		jnz	short loc_10A91
		push	0
		push	large dword_4AB5F
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		jmp	short loc_10AF9

loc_10A91:
		cmp	[bp+arg_0], 1
		jnz	short loc_10AAD
		push	0
		push	large dword_4AB64
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		jmp	short loc_10AF9

loc_10AAD:
		cmp	[bp+arg_0], 2
		jnz	short loc_10AC9
		push	0
		push	large dword_4AB69
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		jmp	short loc_10AF9

loc_10AC9:
		cmp	[bp+arg_0], 3
		jnz	short loc_10AE5
		push	0
		push	large dword_4AB6E
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		jmp	short loc_10AF9

loc_10AE5:
		push	0
		push	large dword_4AB73
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8

loc_10AF9:
		mov	[bp+var_1], 0
		jmp	short loc_10B33

loc_10AFF:
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_C]
		push	ax
		push	si
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_10B29
		mov	[bp+var_1], 1
		jmp	short loc_10B4B
		jmp	short loc_10B33

loc_10B29:
		mov	eax, [bp+var_8E]
		mov	[bp+var_9F], eax

loc_10B33:
		push	1
		push	large dword_4AB78
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_10AFF

loc_10B4B:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_10B65
		mov	al, [bp+arg_0]
		mov	ah, 0
		push	ax
		push	219Dh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_10B65:
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		lea	ax, [bp+var_17C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		cmp	[bp+arg_0], 0
		jz	short loc_10B9B
		cmp	[bp+arg_0], 1
		jnz	short loc_10BFF

loc_10B9B:
		cmp	[bp+var_2], 5Ch
		jbe	short loc_10BD0
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvshp2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		mov	bx, [bp+var_17C]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_10BFD

loc_10BD0:
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		mov	bx, [bp+var_17C]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_10BFD:
		jmp	short loc_10C2C

loc_10BFF:
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		mov	bx, [bp+var_17C]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_10C2C:
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		mov	al, [bp+var_2]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		nop
		push	cs
		call	near ptr Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_17C]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	2
		lea	ax, [bp+var_17C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		mov	[bp+var_104], 498h
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_104]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	si
		leave
		retf
sub_10A01		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ConvData_LoadByName_C38E (sub_C38E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-17. Charge l'élément de type 0 nommé arg_0
; par sub_C13D (pas lue, cherche dans convdata.iff) dans le descripteur arg_2, avec le drapeau
; arg_4. mid1 : visage « air » (« pri » dans optest.asm : octets modifiés par Rémi, « air » à
; l'origine) (scènes 9 et 17).
; ==============================================================================================
ConvData_LoadByName_10C87		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	0
		push	cs
		call	near ptr sub_10A01
		add	sp, 8
		pop	bp
		retf
ConvData_LoadByName_10C87		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConvData_LoadNormalOrNight_C3A6 (sub_C3A6 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Charge l'élément de type 2 nommé « normal » (arg_4 nul) ou « night » (arg_4
; non nul) par sub_C13D (pas lue, cherche dans convdata.iff) dans le descripteur arg_0. mid1 :
; « normal », utilisé comme palette.
; ==============================================================================================
ConvData_LoadNormalOrNight_10C9F		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_4], 0
		jnz	short loc_10CBF
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	21CCh
		push	2
		push	cs
		call	near ptr sub_10A01
		add	sp, 8
		jmp	short loc_10CD0

loc_10CBF:
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	21D3h
		push	2
		push	cs
		call	near ptr sub_10A01
		add	sp, 8

loc_10CD0:
		pop	si
		pop	bp
		retf
ConvData_LoadNormalOrNight_10C9F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConvData_LoadByName_C38E (sub_C38E de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Charge l'élément de type 0 nommé arg_0 par sub_C13D (pas lue, cherche dans convdata.iff)
; dans le descripteur arg_2, avec le drapeau arg_4. mid1 : visage « air » (« pri » dans
; optest.asm : octets modifiés par Rémi, « air » à l'origine) (scènes 9 et 17).
; ==============================================================================================
ConvData_LoadByName_10CD3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	1
		push	cs
		call	near ptr sub_10A01
		add	sp, 8
		pop	bp
		retf
ConvData_LoadByName_10CD3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10CEB		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+arg_0]
		push	21D9h
		push	3
		push	cs
		call	near ptr sub_10A01
		add	sp, 8
		pop	bp
		retf
sub_10CEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (339 sur
; 339), à Pak_LoadEntry_C40A (sub_C40A de OPTEST.EXE). Code non comparé instruction par
; instruction. — far, LUE 2026-10-17. (pak, numéro d'entrée, descripteur de sortie, type de
; mémoire) : se place sur l'entrée (IndexedRecordReader_AdvanceIndex_3D69C), lit sa taille
; (+97 si les bits 64 et 128 de +109 sont posés, sinon +113), erreur sub_310B si nulle ; type
; de mémoire demandé 3 : type 3 si taille < 65531, sinon type 2 ; autre valeur : ce type tel
; quel. Alloue le bloc (Memory_TypedFreeWrapper_2B7E1), remplit le descripteur (+0 handle, +4
; type, +5 = 1 possédé, +6 taille), le verrouille (Memory_TypedAllocDispatchB_2B920) et y lit
; l'entrée (IndexedRecordReader_SeekToIndex_3D4DD).
; ==============================================================================================
Pak_LoadEntry_10D03		proc far

var_1E		= dword ptr -1Eh
var_19		= byte ptr -19h
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_4]
		push	[bp+arg_2]
		push	di
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_10D2E
		mov	eax, [di+61h]
		jmp	short loc_10D32

loc_10D2E:
		mov	eax, [di+71h]

loc_10D32:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_10D48
		push	21E0h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_10D48:
		cmp	[bp+arg_6], 3
		jz	short loc_10D51
		jmp	loc_10DE3

loc_10D51:
		cmp	[bp+var_4], 0FFFBh
		jge	short loc_10D9F
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	large [bp+var_8]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_8]
		mov	[si+6], eax
		jmp	short loc_10DE1

loc_10D9F:
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		push	1
		push	0
		push	2
		push	large [bp+var_10]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_14]
		mov	[si], eax
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_10]
		mov	[si+6], eax

loc_10DE1:
		jmp	short loc_10E2F

loc_10DE3:
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	al, [bp+arg_6]
		mov	[bp+var_19], al
		push	1
		push	0
		mov	al, [bp+var_19]
		push	ax
		push	large [bp+var_18]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_1E+2], dx
		mov	word ptr [bp+var_1E], ax
		mov	eax, [bp+var_1E]
		mov	[si], eax
		mov	al, [bp+var_19]
		mov	[si+4], al
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_18]
		mov	[si+6], eax

loc_10E2F:
		push	0
		mov	al, [si+4]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_2]
		push	di
		call	IndexedRecordReader_ReadEntryInto_43519
Pak_LoadEntry_10D03		endp
seg026		ends
