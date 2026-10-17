seg015		segment	byte public 'CODE' use16
		assume cs:seg015
		;org 0Dh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C13D	proc far		; CODE XREF: ConvData_LoadByName_C38E+10p ConvData_LoadNormalOrNight_C3A6+18p ...

var_17C		= word ptr -17Ch
var_104		= word ptr -104h
var_A7		= dword	ptr -0A7h
var_A3		= dword	ptr -0A3h
var_9F		= dword	ptr -9Fh
var_8E		= dword	ptr -8Eh
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
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aConvdata ; "convdata"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_104]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_104], 556h
		mov	[bp+var_A3], 100h
		mov	[bp+var_A7], 0
		mov	[bp+var_104], 56Eh
		push	1
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		mov	bx, [bp+var_104]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+arg_0], 4
		jbe	short loc_C1B1
		push	19F6h
		call	sub_310B
		add	sp, 2

loc_C1B1:				; CODE XREF: sub_C13D+67j
		cmp	[bp+arg_0], 0
		jnz	short loc_C1CD
		push	0
		push	large [dword_44A3D]
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		jmp	short loc_C235
; ���������������������������������������������������������������������������

loc_C1CD:				; CODE XREF: sub_C13D+78j
		cmp	[bp+arg_0], 1
		jnz	short loc_C1E9
		push	0
		push	large [dword_44A42]
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		jmp	short loc_C235
; ���������������������������������������������������������������������������

loc_C1E9:				; CODE XREF: sub_C13D+94j
		cmp	[bp+arg_0], 2
		jnz	short loc_C205
		push	0
		push	large [dword_44A47]
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		jmp	short loc_C235
; ���������������������������������������������������������������������������

loc_C205:				; CODE XREF: sub_C13D+B0j
		cmp	[bp+arg_0], 3
		jnz	short loc_C221
		push	0
		push	large [dword_44A4C]
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		jmp	short loc_C235
; ���������������������������������������������������������������������������

loc_C221:				; CODE XREF: sub_C13D+CCj
		push	0
		push	large [dword_44A51]
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8

loc_C235:				; CODE XREF: sub_C13D+8Ej sub_C13D+AAj ...
		mov	[bp+var_1], 0
		jmp	short loc_C26F
; ���������������������������������������������������������������������������

loc_C23B:				; CODE XREF: sub_C13D+148j
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
		jnz	short loc_C265
		mov	[bp+var_1], 1
		jmp	short loc_C287
; ���������������������������������������������������������������������������
		jmp	short loc_C26F
; ���������������������������������������������������������������������������

loc_C265:				; CODE XREF: sub_C13D+11Ej
		mov	eax, [bp+var_8E]
		mov	[bp+var_9F], eax

loc_C26F:				; CODE XREF: sub_C13D+FCj
					; sub_C13D+126j
		push	1
		push	large [dword_44A56]
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_C23B

loc_C287:				; CODE XREF: sub_C13D+124j
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C2A1
		mov	al, [bp+arg_0]
		mov	ah, 0
		push	ax
		push	1A3Bh
		call	sub_310B
		add	sp, 4

loc_C2A1:				; CODE XREF: sub_C13D+151j
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		lea	ax, [bp+var_17C]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		cmp	[bp+arg_0], 0
		jz	short loc_C2D7
		cmp	[bp+arg_0], 1
		jnz	short loc_C306

loc_C2D7:				; CODE XREF: sub_C13D+192j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aConvshps ; "convshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		mov	bx, [bp+var_17C]
		call	dword ptr [bx+14h]
		add	sp, 6
		jmp	short loc_C333
; ���������������������������������������������������������������������������

loc_C306:				; CODE XREF: sub_C13D+198j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aConvpals ; "convpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_17C]
		push	ax
		mov	bx, [bp+var_17C]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_C333:				; CODE XREF: sub_C13D+1C7j
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
		call	near ptr Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_17C]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	2
		lea	ax, [bp+var_17C]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		mov	[bp+var_104], 56Eh
		lea	ax, [bp+var_104]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_104]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	si
		leave
		retf
sub_C13D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Charge l'élément de type 0 nommé arg_0 par sub_C13D (pas lue, cherche
; dans convdata.iff) dans le descripteur arg_2, avec le drapeau arg_4. mid1 : visage « air »
; (« pri » dans optest.asm : octets modifiés par Rémi, « air » à l'origine) (scènes 9 et 17).
; ==============================================================================================
ConvData_LoadByName_C38E	proc far		; CODE XREF: Midgame1_PlayPart2_671C0+11AP
					; Midgame1_PlayPart2_671C0+24B7P ...

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
		call	near ptr sub_C13D
		add	sp, 8
		pop	bp
		retf
ConvData_LoadByName_C38E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Charge l'élément de type 2 nommé « normal » (arg_4 nul) ou « night »
; (arg_4 non nul) par sub_C13D (pas lue, cherche dans convdata.iff) dans le descripteur arg_0.
; mid1 : « normal », utilisé comme palette.
; ==============================================================================================
ConvData_LoadNormalOrNight_C3A6	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+653P
					; sub_6B9C0+D03P ...

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_4], 0
		jnz	short loc_C3C6
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	1A6Ah
		push	2
		push	cs
		call	near ptr sub_C13D
		add	sp, 8
		jmp	short loc_C3D7
; ���������������������������������������������������������������������������

loc_C3C6:				; CODE XREF: ConvData_LoadNormalOrNight_C3A6+Bj
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	1A71h
		push	2
		push	cs
		call	near ptr sub_C13D
		add	sp, 8

loc_C3D7:				; CODE XREF: ConvData_LoadNormalOrNight_C3A6+1Ej
		pop	si
		pop	bp
		retf
ConvData_LoadNormalOrNight_C3A6	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	al, [bp+0Ah]
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	1
		push	cs
		call	near ptr sub_C13D
		add	sp, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	al, [bp+8]
		push	ax
		push	word ptr [bp+6]
		push	1A77h
		push	3
		push	cs
		call	near ptr sub_C13D
		add	sp, 8
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. (pak, numéro d'entrée, descripteur de sortie, type de mémoire) : se
; place sur l'entrée (IndexedRecordReader_AdvanceIndex_3D69C), lit sa taille (+97 si les bits
; 64 et 128 de +109 sont posés, sinon +113), erreur sub_310B si nulle ; type de mémoire
; demandé 3 : type 3 si taille < 65531, sinon type 2 ; autre valeur : ce type tel quel. Alloue
; le bloc (Memory_TypedFreeWrapper_2B7E1), remplit le descripteur (+0 handle, +4 type, +5 = 1
; possédé, +6 taille), le verrouille (Memory_TypedAllocDispatchB_2B920) et y lit l'entrée
; (IndexedRecordReader_SeekToIndex_3D4DD).
; ==============================================================================================
Pak_LoadEntry_C40A	proc far		; CODE XREF: sub_5803+1F3P
					; sub_5803+24AP ...

var_1E		= dword	ptr -1Eh
var_19		= byte ptr -19h
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_C435
		mov	eax, [di+61h]
		jmp	short loc_C439
; ���������������������������������������������������������������������������

loc_C435:				; CODE XREF: Pak_LoadEntry_C40A+23j
		mov	eax, [di+71h]

loc_C439:				; CODE XREF: Pak_LoadEntry_C40A+29j
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_C44F
		push	1A7Eh
		call	sub_310B
		add	sp, 2

loc_C44F:				; CODE XREF: Pak_LoadEntry_C40A+38j
		cmp	[bp+arg_6], 3
		jz	short loc_C458
		jmp	loc_C4EA
; ���������������������������������������������������������������������������

loc_C458:				; CODE XREF: Pak_LoadEntry_C40A+49j
		cmp	[bp+var_4], 0FFFBh
		jge	short loc_C4A6
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	large [bp+var_8]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_8]
		mov	[si+6],	eax
		jmp	short loc_C4E8
; ���������������������������������������������������������������������������

loc_C4A6:				; CODE XREF: Pak_LoadEntry_C40A+56j
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		push	1
		push	0
		push	2
		push	large [bp+var_10]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_14]
		mov	[si], eax
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_10]
		mov	[si+6],	eax

loc_C4E8:				; CODE XREF: Pak_LoadEntry_C40A+9Aj
		jmp	short loc_C536
; ���������������������������������������������������������������������������

loc_C4EA:				; CODE XREF: Pak_LoadEntry_C40A+4Bj
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	al, [bp+arg_6]
		mov	[bp+var_19], al
		push	1
		push	0
		mov	al, [bp+var_19]
		push	ax
		push	large [bp+var_18]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_1E+2],	dx
		mov	word ptr [bp+var_1E], ax
		mov	eax, [bp+var_1E]
		mov	[si], eax
		mov	al, [bp+var_19]
		mov	[si+4],	al
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_18]
		mov	[si+6],	eax

loc_C536:				; CODE XREF: Pak_LoadEntry_C40A:loc_C4E8j
		push	0
		mov	al, [si+4]
		push	ax
		push	word ptr [si+2]
		push	word ptr [si]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_2]
		push	di
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
Pak_LoadEntry_C40A	endp

seg015		ends
