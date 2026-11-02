seg028		segment	para public 'CODE' use16
		assume cs:seg028
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0A1h, 33h, 8Bh, 0DCh, 36h, 83h, 47h, 4, 0F6h, 0EAh, 73h, 3, 0A1h, 33h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1106E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_11093

loc_1107A:
		les	bx, [si]
		add	bx, di
		mov	al, es:[bx]
		cbw
		push	ax
		call	CRT_CtypeLookup
		add	sp, 2
		les	bx, [si]
		add	bx, di
		mov	es:[bx], al
		inc	di

loc_11093:
		cmp	di, 8
		jl	short loc_1107A
		pop	di
		pop	si
		pop	bp
		retf
sub_1106E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1109C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_110B7
		push	9
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_110C4

loc_110B7:
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	[si+8], al

loc_110C4:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1109C		endp

; START OF FUNCTION CHUNK FOR sub_1109C
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1109C

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
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
String_ConstructFromPtrLen		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_110F3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	eax, eax
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+8], al
		push	large 8
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		pop	bp
		retf
sub_110F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Path_Build_C82C
; (sub_C82C de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-17. Construit un chemin dans le tampon arg_0 : copie le dossier
; (pointeur far arg_2), ajoute le nom (arg_6), puis l'extension (arg_A) si elle n'est pas
; nulle (CRT_MemFamily_Extra5 = copie, CRT_MemFamily_Extra2 = concaténation).
; ==============================================================================================
Path_Build_11125		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	ds
		push	si
		call	sub_3628
		add	sp, 8
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	ds
		push	si
		call	CRT_MemFamily_Extra2
		add	sp, 8
		cmp	[bp+arg_A], 0
		jz	short loc_11163
		push	word ptr [bp+arg_A+2]
		push	word ptr [bp+arg_A]
		push	ds
		push	si
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_11163:
		pop	si
		pop	bp
		retf
Path_Build_11125		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11166		proc far

var_42		= word ptr -42h
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		mov	si, [bp+arg_0]
		push	5Ch
		push	[bp+arg_8]
		push	[bp+arg_6]
		call	CRT_MemFamily_Extra3
		add	sp, 6
		or	ax, dx
		jz	short loc_11196
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	ds
		push	si
		call	sub_3628
		add	sp, 8
		jmp	short loc_111EB

loc_11196:
		push	ds
		push	offset aDATA
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	sub_3628
		add	sp, 8
		cmp	[bp+arg_2], 0
		jz	short loc_111D2
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ds
		push	offset a__1
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_111D2:
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	ss
sub_11166		endp

; START OF FUNCTION CHUNK FOR sub_11166
		db 8Dh
; END OF FUNCTION CHUNK FOR sub_11166
seg028		ends
