seg057		segment	byte public 'CODE' use16
		assume cs:seg057
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,34L — convertit en majuscule (sub_E4B, table ctype) les 8 premiers caractères d'une
; chaîne : normalisation de nom de fichier DOS 8.3 (majuscules).
; ==============================================================================================
Path_NormalizeUppercase8	proc far		; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+2EAP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_2AFAC
; ���������������������������������������������������������������������������

loc_2AF95:				; CODE XREF: Path_NormalizeUppercase8+26j
		les	bx, [si]
		add	bx, di
		mov	al, es:[bx]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		les	bx, [si]
		add	bx, di
		mov	es:[bx], al
		inc	di

loc_2AFAC:				; CODE XREF: Path_NormalizeUppercase8+Aj
		cmp	di, 8
		jl	short loc_2AF95
		pop	di
		pop	si
		pop	bp
		retf
Path_NormalizeUppercase8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,30L — constructeur de String vide (3 champs à 0) avec allocation optionnelle (9 octets)
; : constructeur de chaîne vide.
; ==============================================================================================
String_ConstructEmpty	proc far		; CODE XREF: Program_InitVideoFontArgs+10P
					; Program_InitVideoFontArgs+137P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2AFCE
		push	9
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2AFDB

loc_2AFCE:				; CODE XREF: String_ConstructEmpty+9j
		xor	eax, eax
		mov	[si+4],	eax
		mov	[si], eax
		mov	[si+8],	al

loc_2AFDB:				; CODE XREF: String_ConstructEmpty+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
String_ConstructEmpty	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,30L — constructeur de String depuis un pointeur/longueur (sub_64A19) : constructeur
; String(char*, len).
; ==============================================================================================
String_ConstructFromPtrLen	proc far		; CODE XREF: Cinematic_LoadCameraDef+E2P
					; Font_LoadDefinitionFromIFF_7E1B4+306P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_2AFE1:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	eax, eax
		mov	[si+4],	eax
		mov	[si], eax

loc_2AFF1:
		mov	[si+8],	al

loc_2AFF4:
		push	large 8
		push	ds
		push	si
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
String_ConstructFromPtrLen	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,22L — variante far de sub_2AFE0 avec pointeur 32-bit : constructeur String(char far*,
; len).
; ==============================================================================================
String_ConstructFromFarPtrLen	proc far		; CODE XREF: AITargeting_LoadFieldsFromIFFB_8EAE8+11BP
					; Debris_LoadFieldMixC_9BFB0+5FP ...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	eax, eax
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		mov	es:[bx], eax
		mov	es:[bx+8], al
		push	large 8
		push	word ptr [bp+arg_0+2]
		push	bx
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		pop	bp
		retf
String_ConstructFromFarPtrLen	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,49L — assemble 2-3 segments de chemin (sub_2DF4 + sub_2D48, concaténation) :
; construction de chemin de fichier composite (base+dossier+extension).
; ==============================================================================================
Path_BuildComposite	proc far		; CODE XREF: Cockpit_LoadBettyPack+1DP
					; Path_ResolveDataFile+75p ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp

loc_2B032:
		mov	bp, sp
		push	si

loc_2B035:
		mov	si, [bp+arg_0]

loc_2B038:
		push	large [bp+arg_2]
		push	ds
		push	si

loc_2B03E:
		call	CRT_MemFamily_Extra5

loc_2B043:
		add	sp, 8
		push	large [bp+arg_6]
		push	ds
		push	si
		call	CRT_MemFamily_Extra2
		add	sp, 8
		cmp	[bp+arg_A], 0
		jz	short loc_2B069
		push	large [bp+arg_A]
		push	ds
		push	si

loc_2B061:
		call	CRT_MemFamily_Extra2

loc_2B066:
		add	sp, 8

loc_2B069:				; CODE XREF: Path_BuildComposite+28j
		pop	si
		pop	bp
		retf
Path_BuildComposite	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,84L — résolveur de chemin de fichier de données : si le nom contient déjà un backslash,
; l'utilise tel quel ; sinon construit '..\\..\\DATA\\'+sous-dossier+'\\'+nom via sub_2B031.
; Utilisé pour charger la police SM-FONT (seg012) et le pack Betty (seg015) — fonction
; centrale de résolution des chemins de données du jeu.
; ==============================================================================================
Path_ResolveDataFile	proc far		; CODE XREF: seg009:0358P
					; Program_InitVideoFontArgs+3FP ...

var_42		= word ptr -42h
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp

loc_2B06D:
		mov	bp, sp

loc_2B06F:
		sub	sp, 42h

loc_2B072:
		push	si

loc_2B073:
		mov	si, [bp+arg_0]

loc_2B076:
		push	5Ch ; '\'
		push	large [bp+arg_6]
		call	CRT_MemFamily_Extra3
		add	sp, 6
		or	ax, dx
		jz	short loc_2B098
		push	large [bp+arg_6]
		push	ds
		push	si
		call	CRT_MemFamily_Extra5
		add	sp, 8
		jmp	short loc_2B0E7
; ���������������������������������������������������������������������������

loc_2B098:				; CODE XREF: Path_ResolveDataFile+1Aj
		push	ds
		push	offset a____Data ; "..\\..\\DATA\\"
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		cmp	[bp+arg_2], 0
		jz	short loc_2B0D2
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ds
		push	offset asc_6E834 ; "\\"
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_2B0D2:				; CODE XREF: Path_ResolveDataFile+42j
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		push	si

loc_2B0E0:
		push	cs
		call	near ptr Path_BuildComposite

loc_2B0E4:
		add	sp, 0Eh

loc_2B0E7:				; CODE XREF: Path_ResolveDataFile+2Aj
		pop	si

locret_2B0E8:
		leave
		retf
Path_ResolveDataFile	endp

seg057		ends
