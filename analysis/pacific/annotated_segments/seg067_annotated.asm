seg067		segment	para public 'CODE' use16
		assume cs:seg067
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FEh, 8Bh, 46h, 0FCh, 0EBh, 4

loc_29456:
		db 33h, 0D2h, 33h, 0C0h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Path_NormalizeUppercase8 (sub_2AF89 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,34L — convertit en majuscule (sub_E4B, table ctype) les
; 8 premiers caractères d'une chaîne : normalisation de nom de fichier DOS 8.3 (majuscules).
; ==============================================================================================
Path_NormalizeUppercase8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_29480

loc_29469:
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

loc_29480:
		cmp	di, 8
		jl	short loc_29469
		pop	di
		pop	si
		pop	bp
		retf
Path_NormalizeUppercase8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à String_ConstructEmpty
; (sub_2AFB5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,30L — constructeur de String vide (3 champs à 0) avec allocation optionnelle (9
; octets) : constructeur de chaîne vide.
; ==============================================================================================
String_ConstructEmpty		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_294A2
		push	9
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_294AF

loc_294A2:
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	[si+8], al

loc_294AF:
		mov	ax, si
		pop	si
		pop	bp
		retf
String_ConstructEmpty		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; String_ConstructFromPtrLen (sub_C7D3 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à String_ConstructFromPtrLen (sub_2AFE0 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,30L — constructeur de String
; depuis un pointeur/longueur (sub_64A19) : constructeur String(char*, len).
; ==============================================================================================
String_ConstructFromPtrLen		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	[si+8], al
		push	large 8
		push	ds
		push	si
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
String_ConstructFromPtrLen		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_294DB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	eax, eax
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		mov	es:[bx], eax
		mov	es:[bx+8], al
		push	large 8
		push	[bp+arg_2]
		push	bx
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		pop	bp
		retf
sub_294DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Path_BuildComposite
; (sub_2B031 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,49L — assemble 2-3 segments de chemin (sub_2DF4 + sub_2D48, concaténation) :
; construction de chemin de fichier composite (base+dossier+extension).
; ==============================================================================================
Path_BuildComposite		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	ds
		push	si
		call	sub_38D6
		add	sp, 8
		push	large [bp+arg_6]
		push	ds
		push	si
		call	CRT_MemFamily_Extra2
		add	sp, 8
		cmp	[bp+arg_A], 0
		jz	short loc_2953D
		push	large [bp+arg_A]
		push	ds
		push	si
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_2953D:
		pop	si
		pop	bp
		retf
Path_BuildComposite		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29540		proc far

var_42		= word ptr -42h
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		mov	si, [bp+arg_0]
		push	5Ch
		push	large [bp+arg_6]
		call	CRT_MemFamily_Extra3
		add	sp, 6
		or	ax, dx
		jz	short loc_2956C
		push	large [bp+arg_6]
		push	ds
		push	si
		call	sub_38D6
		add	sp, 8
		jmp	short loc_295BB

loc_2956C:
		push	ds
		push	offset aDATA
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	sub_38D6
		add	sp, 8
		cmp	[bp+arg_2], 0
		jz	short loc_295A6
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ds
		push	offset a_
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_295A6:
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	ss
sub_29540		endp

; START OF FUNCTION CHUNK FOR sub_29540
		db 8Dh
; END OF FUNCTION CHUNK FOR sub_29540
seg067		ends
