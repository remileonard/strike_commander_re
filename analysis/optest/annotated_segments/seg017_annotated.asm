seg017		segment	byte public 'CODE' use16
		assume cs:seg017
		;org 5
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]

loc_C77D:				; DATA XREF: seg170:0146o
		xor	di, di
		jmp	short loc_C79A
; ���������������������������������������������������������������������������

loc_C781:				; CODE XREF: seg017:002Dj
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

loc_C79A:				; CODE XREF: seg017:000Fj
		cmp	di, 8
		jl	short loc_C781
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7A3	proc far		; CODE XREF: seg001:02EEP
					; sub_1FFCC+37P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C7BE
		push	9
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C7CB

loc_C7BE:				; CODE XREF: sub_C7A3+9j
		xor	eax, eax
		mov	[si+4],	eax
		mov	[si], eax
		mov	[si+8],	al

loc_C7CB:				; CODE XREF: sub_C7A3+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C7A3	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; String_ConstructFromPtrLen (sub_2AFE0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,30L — constructeur de String depuis un
; pointeur/longueur (sub_64A19) : constructeur String(char*, len).
; ==============================================================================================
String_ConstructFromPtrLen	proc far		; CODE XREF: sub_9B09+78P
					; sub_C13D+107P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	eax, eax
		mov	[si+4],	eax
		mov	[si], eax
		mov	[si+8],	al
		push	large 8
		push	ds
		push	si
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
String_ConstructFromPtrLen	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7FA	proc far		; CODE XREF: sub_C0550+64P
					; sub_C0550+4B6P

arg_0		= dword	ptr  6
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
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		pop	bp
		retf
sub_C7FA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Construit un chemin dans le tampon arg_0 : copie le dossier (pointeur
; far arg_2), ajoute le nom (arg_6), puis l'extension (arg_A) si elle n'est pas nulle
; (CRT_MemFamily_Extra5 = copie, CRT_MemFamily_Extra2 = concaténation).
; ==============================================================================================
Path_Build_C82C	proc far		; CODE XREF: sub_3166+1BP sub_3166+D9P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	ds
		push	si
		call	CRT_MemFamily_Extra5
		add	sp, 8
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	ds
		push	si
		call	CRT_MemFamily_Extra2
		add	sp, 8
		cmp	[bp+arg_A], 0
		jz	short loc_C86A
		push	word ptr [bp+arg_A+2]
		push	word ptr [bp+arg_A]
		push	ds
		push	si
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_C86A:				; CODE XREF: Path_Build_C82C+2Cj
		pop	si
		pop	bp
		retf
Path_Build_C82C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C86D	proc far		; CODE XREF: sub_702F+4CP
					; sub_702F+2B7P ...

var_42		= word ptr -42h
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		mov	si, [bp+arg_0]
		push	5Ch ; '\'
		push	[bp+arg_8]
		push	[bp+arg_6]
		call	CRT_MemFamily_Extra3
		add	sp, 6
		or	ax, dx
		jz	short loc_C89D
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	ds
		push	si
		call	CRT_MemFamily_Extra5
		add	sp, 8
		jmp	short loc_C8F2
; ���������������������������������������������������������������������������

loc_C89D:				; CODE XREF: sub_C86D+1Cj
		push	ds
		push	offset a____Data ; "..\\..\\DATA\\"
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		cmp	[bp+arg_2], 0
		jz	short loc_C8D9
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	ds
		push	offset asc_44AE6 ; "\\"
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	CRT_MemFamily_Extra2
		add	sp, 8

loc_C8D9:				; CODE XREF: sub_C86D+46j
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		push	si
		push	cs
		call	near ptr Path_Build_C82C
		add	sp, 0Eh

loc_C8F2:				; CODE XREF: sub_C86D+2Ej
		pop	si
		leave
		retf
sub_C86D	endp

seg017		ends
