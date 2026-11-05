seg041		segment	para public 'CODE' use16
		assume cs:seg041
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 47h, 4, 0F6h, 90h, 90h, 0E9h, 0EFh, 0D5h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EA78		proc far

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
		push	ds
		push	offset aIFF
		push	ds
		push	offset aConvdata
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_104]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_104], 9B5h
		mov	[bp+var_A3], 100h
		mov	[bp+var_A7], 0
		mov	[bp+var_104], 9CDh
		push	1
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		mov	bx, [bp+var_104]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+arg_0], 4
		jbe	short loc_1EAE4
		push	1F2Eh
		call	sub_9D78
		pop	cx

loc_1EAE4:
		cmp	[bp+arg_0], 0
		jnz	short loc_1EAF3
		push	0
		push	large dword_5BC75
		jmp	short loc_1EB27

loc_1EAF3:
		cmp	[bp+arg_0], 1
		jnz	short loc_1EB02
		push	0
		push	large dword_5BC7A
		jmp	short loc_1EB27

loc_1EB02:
		cmp	[bp+arg_0], 2
		jnz	short loc_1EB11
		push	0
		push	large dword_5BC7F
		jmp	short loc_1EB27

loc_1EB11:
		cmp	[bp+arg_0], 3
		jnz	short loc_1EB20
		push	0
		push	large dword_5BC84
		jmp	short loc_1EB27

loc_1EB20:
		push	0
		push	large dword_5BC89

loc_1EB27:
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		mov	[bp+var_1], 0
		jmp	short loc_1EB6E

loc_1EB3A:
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+arg_2]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_1EB64
		mov	[bp+var_1], 1
		jmp	short loc_1EB86

loc_1EB64:
		mov	eax, [bp+var_8E]
		mov	[bp+var_9F], eax

loc_1EB6E:
		push	1
		push	large dword_5BC8E
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_1EB3A

loc_1EB86:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1EBA0
		mov	al, [bp+arg_0]
		mov	ah, 0
		push	ax
		push	1F73h
		call	sub_9D78
		add	sp, 4

loc_1EBA0:
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_2], al
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		lea	ax, [bp+var_17C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		cmp	[bp+arg_0], 0
		jz	short loc_1EBD0
		cmp	[bp+arg_0], 1
		jnz	short loc_1EBDA

loc_1EBD0:
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvshps
		jmp	short loc_1EBE2

loc_1EBDA:
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvpals

loc_1EBE2:
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		mov	bx, [bp+var_17C]
		call	dword ptr [bx+14h]
		add	sp, 6
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
		call	near ptr sub_1ECCB
		add	sp, 8
		lea	ax, [bp+var_17C]
		push	ax
		call	sub_527AA
		pop	cx
		push	2
		lea	ax, [bp+var_17C]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		mov	[bp+var_104], 9CDh
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_104]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		leave
		retf
sub_1EA78		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConvData_LoadByName_C27EC (sub_C27EC de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à ConvData_LoadByName_C38E (sub_C38E de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Charge
; l'élément de type 0 nommé arg_0 par sub_C13D (pas lue, cherche dans convdata.iff) dans le
; descripteur arg_2, avec le drapeau arg_4. mid1 : visage « air » (« pri » dans optest.asm :
; octets modifiés par Rémi, « air » à l'origine) (scènes 9 et 17).
; ==============================================================================================
ConvData_LoadByName_1EC5D		proc far

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
		call	near ptr sub_1EA78
		add	sp, 8
		pop	bp
		retf
ConvData_LoadByName_1EC5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EC75		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bl, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jnz	short loc_1EC8B
		push	bx
		push	dx
		push	1FA2h
		jmp	short loc_1EC90

loc_1EC8B:
		push	bx
		push	dx
		push	1FA9h

loc_1EC90:
		push	2
		push	cs
		call	near ptr sub_1EA78
		add	sp, 8
		pop	bp
		retf
sub_1EC75		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConvData_LoadByName_C27EC (sub_C27EC de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à ConvData_LoadByName_C38E (sub_C38E de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Charge
; l'élément de type 0 nommé arg_0 par sub_C13D (pas lue, cherche dans convdata.iff) dans le
; descripteur arg_2, avec le drapeau arg_4. mid1 : visage « air » (« pri » dans optest.asm :
; octets modifiés par Rémi, « air » à l'origine) (scènes 9 et 17).
; ==============================================================================================
ConvData_LoadByName_1EC9B		proc far

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
		call	near ptr sub_1EA78
		add	sp, 8
		pop	bp
		retf
ConvData_LoadByName_1EC9B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1ECB3		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+arg_0]
		push	1FAFh
		push	3
		push	cs
		call	near ptr sub_1EA78
		add	sp, 8
		pop	bp
		retf
sub_1ECB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1ECCB		proc far

var_46		= word ptr -46h
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
		sub	sp, 46h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_4]
		push	[bp+arg_2]
		push	di
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_1ECF6
		mov	eax, [di+61h]
		jmp	short loc_1ECFA

loc_1ECF6:
		mov	eax, [di+71h]

loc_1ECFA:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_1ED21
		push	[bp+arg_2]
		push	1FB6h
		lea	ax, [bp+var_46]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp+var_46]
		push	ax
		call	sub_9D78
		pop	cx

loc_1ED21:
		cmp	[bp+arg_6], 3
		jz	short loc_1ED2A
		jmp	loc_1EDB1

loc_1ED2A:
		cmp	[bp+var_4], 0FFFBh
		jge	short loc_1ED73
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_8]
		jmp	loc_1EDF6

loc_1ED73:
		mov	eax, [bp+var_4]
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
		mov	[si], eax
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_10]
		jmp	short loc_1EDF6

loc_1EDB1:
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	al, [bp+arg_6]
		mov	[bp+var_19], al
		push	1
		push	0
		push	ax
		push	large [bp+var_18]
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
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

loc_1EDF6:
		mov	[si+6], eax
		cmp	byte ptr [si+4], 3
		jnz	short loc_1EE16
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1EE1B

loc_1EE16:
		mov	dx, [si+2]
		mov	ax, [si]

loc_1EE1B:
		push	dx
		push	ax
		push	[bp+arg_2]
sub_1ECCB		endp
seg041		ends
