seg043		segment	para public 'CODE' use16
		assume cs:seg043
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 45h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Path_NormalizeUppercase8 (sub_2945D de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Path_NormalizeUppercase8 (sub_2AF89 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,34L — convertit en majuscule
; (sub_E4B, table ctype) les 8 premiers caractères d'une chaîne : normalisation de nom de
; fichier DOS 8.3 (majuscules).
; ==============================================================================================
Path_NormalizeUppercase8		proc far

arg_0		= word ptr  6

		push	bp

loc_1EFE2:
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_1F004

loc_1EFED:
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

loc_1F004:
		cmp	di, 8
		jl	short loc_1EFED
		pop	di
		pop	si
		pop	bp
		retf
Path_NormalizeUppercase8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à String_ConstructEmpty
; (sub_29489 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; String_ConstructEmpty (sub_2AFB5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,30L — constructeur de String vide (3 champs à 0) avec
; allocation optionnelle (9 octets) : constructeur de chaîne vide.
; ==============================================================================================
String_ConstructEmpty		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1F026
		push	9
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1F033

loc_1F026:
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	[si+8], al

loc_1F033:
		mov	ax, si
		pop	si
		pop	bp
		retf
String_ConstructEmpty		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; String_ConstructFromPtrLen (sub_294B4 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à String_ConstructFromPtrLen (sub_C7D3 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à String_ConstructFromPtrLen (sub_2AFE0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,30L
; — constructeur de String depuis un pointeur/longueur (sub_64A19) : constructeur
; String(char*, len).
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
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
String_ConstructFromPtrLen		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F05F		proc far

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
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		pop	bp
		retf
sub_1F05F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Path_BuildComposite
; (sub_29505 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Path_BuildComposite (sub_2B031 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,49L — assemble 2-3 segments de chemin (sub_2DF4 + sub_2D48,
; concaténation) : construction de chemin de fichier composite (base+dossier+extension).
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
		call	sub_36EC
		add	sp, 8
		push	large [bp+arg_6]
		push	ds
		push	si
		call	CRT_MemFamily_Extra2
		add	sp, 8
		cmp	[bp+arg_A], 0
		jz	short loc_1F0C1
		push	large [bp+arg_A]
		push	ds
		push	si
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_1F0C1:
		pop	si
		pop	bp
		retf
Path_BuildComposite		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F0C4		proc far

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
		jz	short loc_1F0F0
		push	large [bp+arg_6]
		push	ds
		push	si
		call	sub_36EC
		add	sp, 8
		jmp	short loc_1F13F

loc_1F0F0:
		push	ds
		push	offset aDATA
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	sub_36EC
		add	sp, 8
		cmp	[bp+arg_2], 0
		jz	short loc_1F12A
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ds
		push	offset a__7
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_1F12A:
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		push	si
		push	cs
		call	near ptr Path_BuildComposite
		add	sp, 0Eh

loc_1F13F:
		pop	si
sub_1F0C4		endp
seg043		ends
