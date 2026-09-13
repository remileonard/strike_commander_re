seg212		segment	byte public 'CODE' use16
		assume cs:seg212
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
seg_68249	dw seg seg216		; DATA XREF: VROOMM_LocateAndValidate_68254+7r VROOMM_Helper_68384+4r ...
seg_6824B	dw seg seg339		; DATA XREF: VROOMM_LocateAndValidate_68254+C4r
byte_6824D	db 50h,	41h, 54h, 48h, 3Dh
word_68252	dw 0			; DATA XREF: VROOMM_ReadAndParseHeader_684DF:loc_684EBw

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 224 lignes, NON DÉTAILLÉE — recherche le fichier « strike.exe » (chaîne embarquée),
; teste la version DOS puis valide/ouvre le fichier via VROOMM_OpenWithDefaultPath_684A7 et
; VROOMM_CheckCopyright_683F9. Point d'entrée du loader VROOMM (Borland) pour ce segment.
; ==============================================================================================
VROOMM_LocateAndValidate_68254	proc far		; CODE XREF: seg212:093Ap

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	ds
		mov	ds, cs:seg_68249
		assume ds:seg216
		push	si
		push	di
		cld

loc_68263:
		cmp	word_69E80, 0
		jnz	short loc_6826D
		jmp	loc_68379
; ���������������������������������������������������������������������������

loc_6826D:				; CODE XREF: VROOMM_LocateAndValidate_68254+14j
		call	VROOMM_CheckDOSVersionAndOpen_68405
		jnb	short loc_6829E

loc_68272:
		mov	ax, [bp+arg_0]

loc_68275:
		or	ax, [bp+arg_2]

loc_68278:
		jnz	short loc_68284

loc_6827A:				; "strike.exe"
		mov	[bp+arg_0], (offset aStrike_exe	- (offset off_69E9E+2))

loc_6827F:
		mov	[bp+arg_2], 69EAh

loc_68284:				; CODE XREF: VROOMM_LocateAndValidate_68254:loc_68278j
		call	VROOMM_CheckCopyright_683F9
		jnb	short loc_6829E
		call	VROOMM_ReadHeader_6844A
		jnb	short loc_6829E
		mov	ax, 0FFFEh
		jmp	loc_6837B
; ���������������������������������������������������������������������������

loc_68294:				; CODE XREF: VROOMM_LocateAndValidate_68254+59j
					; VROOMM_LocateAndValidate_68254+69j ...
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		mov	ax, 0FFFFh
		jmp	loc_6837B
; ���������������������������������������������������������������������������

loc_6829E:				; CODE XREF: VROOMM_LocateAndValidate_68254+1Cj
					; VROOMM_LocateAndValidate_68254+33j ...
		mov	bx, ax
		mov	word_69E98, bx
		mov	cx, 14h
		call	VROOMM_CloseFile_684CF
		mov	cx, 0FFFDh
		jb	short loc_68294
		xor	ax, ax
		xor	dx, dx
		cmp	[bp+var_14], 5A4Dh
		jz	short loc_682BF
		mov	cx, 0FFFCh
		jmp	short loc_68294
; ���������������������������������������������������������������������������

loc_682BF:				; CODE XREF: VROOMM_LocateAndValidate_68254+64j
		mov	ax, [bp+var_10]
		mov	cx, [bp+var_12]
		jcxz	short loc_682C8
		dec	ax

loc_682C8:				; CODE XREF: VROOMM_LocateAndValidate_68254+71j
		mov	dx, 200h

loc_682CB:
		mul	dx
		add	ax, cx
		add	ax, 0Fh

loc_682D2:
		adc	dx, 0
		and	ax, 0FFF0h

loc_682D8:				; CODE XREF: VROOMM_LocateAndValidate_68254+BBj
		push	dx
		push	ax
		mov	cx, dx
		mov	dx, ax
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		mov	cx, 10h
		call	VROOMM_CloseFile_684CF
		pop	ax
		pop	dx
		mov	cx, 0FFFDh

loc_682EE:
		jb	short loc_68294

loc_682F0:
		add	ax, 10h

loc_682F3:
		adc	dx, 0

loc_682F6:
		cmp	[bp+var_14], 4246h

loc_682FB:
		mov	cx, 0FFFCh

loc_682FE:
		jz	short loc_68302

loc_68300:
		jmp	short loc_68294
; ���������������������������������������������������������������������������

loc_68302:				; CODE XREF: VROOMM_LocateAndValidate_68254:loc_682FEj
		cmp	[bp+var_12], 564Fh
		jz	short loc_68311
		add	ax, [bp+var_10]
		adc	dx, [bp+var_E]
		jmp	short loc_682D8
; ���������������������������������������������������������������������������

loc_68311:				; CODE XREF: VROOMM_LocateAndValidate_68254+B3j
		mov	word_69E84, ax

loc_68314:
		mov	word_69E86, dx
		mov	es, cs:seg_6824B
		assume es:seg339
		mov	ax, [bp+var_10]

loc_68320:
		mov	es:word_71A18, ax
		mov	ax, [bp+var_E]

loc_68327:
		mov	es:word_71A1A, ax
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

loc_6832F:
		mov	word_69E98, 0
		nop
		push	cs
		call	near ptr VROOMM_Helper_68384
		mov	ax, [bp+arg_6]
		inc	ax
		mov	word_69E94, ax

loc_68341:
		mov	word_69E90, ax
		mov	bx, [bp+arg_4]
		mov	word_69E96, bx
		call	VROOMM_ReadAndParseHeader_684DF
		mov	bx, word_69E96

loc_68352:
		sub	bx, word_69E94

loc_68356:
		cmp	bx, word_69E8A
		jnb	short loc_68362

loc_6835C:
		mov	cx, 0FFFBh
		jmp	loc_68294
; ���������������������������������������������������������������������������

loc_68362:				; CODE XREF: VROOMM_LocateAndValidate_68254+106j
		shr	bx, 1
		shr	bx, 1
		mov	word_69E88, bx
		call	VROOMM_AllocateAndRelocate_6855F
		jnb	short loc_68379

loc_6836F:
		mov	bx, word_69E98

loc_68373:
		mov	cx, 0FFFFh
		jmp	short loc_6837B
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_68379:				; CODE XREF: VROOMM_LocateAndValidate_68254+16j
					; VROOMM_LocateAndValidate_68254+119j
		xor	ax, ax

loc_6837B:				; CODE XREF: VROOMM_LocateAndValidate_68254+3Dj
					; VROOMM_LocateAndValidate_68254+47j ...
		pop	di
		pop	si

loc_6837D:
		pop	ds
		assume ds:seg339
		mov	sp, bp

loc_68380:
		pop	bp
		retf	8
VROOMM_LocateAndValidate_68254	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, rôle exact non détaillé (voisin du chargeur d'exécutable).
; ==============================================================================================
VROOMM_Helper_68384	proc far		; CODE XREF: VROOMM_LocateAndValidate_68254+E3p
					; seg212:loc_683E9p
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:seg_68249
		assume ds:seg216
		mov	al, byte ptr word_69E80+1
		mov	ah, 35h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		push	es
		push	bx
		push	ds
		mov	al, byte ptr word_69E80+1
		mov	dx, word_69DE2
		mov	ds, seg_69DE4
		assume ds:seg212
		mov	ah, 25h
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		assume ds:seg339
		pop	word_6D0B2
		pop	word_6D0B4
		cmp	seg_6D168, 0
		jz	short loc_683C6
		mov	bx, seg_6D168
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

loc_683BE:
		mov	seg_6D168, 0
		jmp	short loc_683D4
; ���������������������������������������������������������������������������

loc_683C6:				; CODE XREF: VROOMM_Helper_68384+30j
		lea	dx, aCopyright1991B+0Ah
		mov	ah, 3Dh	; '='

loc_683CC:
		mov	al, byte_6D0B6

loc_683CF:				; DOS -	2+ - OPEN DISK FILE WITH HANDLE
		int	21h		; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read, 1 -	write, 2 - read	& write
		mov	seg_6D168, ax

loc_683D4:				; CODE XREF: VROOMM_Helper_68384+40j
		pop	ds
		pop	bp
		retf
VROOMM_Helper_68384	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF implicite) — rôle exact non détaillé.
; ==============================================================================================
VROOMM_Helper2_683D7:				; DATA XREF: seg339:off_72010o
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:seg_68249
		assume ds:seg216
		cmp	word_69E98, 0
		jz	short loc_683EC
		nop
		push	cs

loc_683E9:
		call	near ptr VROOMM_Helper_68384

loc_683EC:				; CODE XREF: seg212:01A5j
		push	cs
		call	off_69DF4

loc_683F1:
		push	cs

loc_683F2:
		call	off_69DF2
		pop	ds
		assume ds:seg339
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, copie/vérifie une chaîne (proche d'un texte « Copyright 1991 » embarqué) avant
; d'appeler VROOMM_OpenFile_684A7.
; ==============================================================================================
VROOMM_CheckCopyright_683F9	proc near		; CODE XREF: VROOMM_LocateAndValidate_68254:loc_68284p
		push	ds

loc_683FA:
		lea	di, aCopyright1991B+0Ah
		push	ds
		pop	es

loc_68400:
		call	VROOMM_OpenFile_684A7
		pop	ds

locret_68404:
		retn
VROOMM_CheckCopyright_683F9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, vérifie la version DOS (int 21h) puis ouvre un fichier via VROOMM_OpenFile_684A7.
; ==============================================================================================
VROOMM_CheckDOSVersionAndOpen_68405	proc near		; CODE XREF: VROOMM_LocateAndValidate_68254:loc_6826Dp
		mov	ah, 30h

loc_68407:				; DOS -	GET DOS	VERSION
		int	21h		; Return: AL = major version number (00h for DOS 1.x)
		cmp	al, 3
		jb	short locret_68449

loc_6840D:
		mov	byte_6D0B6, 20h	; ' '
		push	ds

loc_68413:
		mov	ax, seg	seg339
		mov	ds, ax
		mov	ds, word_6D13C
		xor	si, si
		cld

loc_6841F:				; CODE XREF: VROOMM_CheckDOSVersionAndOpen_68405+1Dj
					; VROOMM_CheckDOSVersionAndOpen_68405+22j
		lodsb

loc_68420:
		or	al, al
		jnz	short loc_6841F
		lodsb
		or	al, al
		jnz	short loc_6841F
		lodsw
		lea	di, aCopyright1991B+0Ah
		mov	ax, seg	seg216
		mov	es, ax
		assume es:seg216
		mov	bx, di

loc_68435:				; CODE XREF: VROOMM_CheckDOSVersionAndOpen_68405+38j
					; VROOMM_CheckDOSVersionAndOpen_68405+3Cj
		lodsb
		stosb
		or	al, al
		jz	short loc_68443
		cmp	al, 5Ch	; '\'
		jnz	short loc_68435
		mov	bx, di
		jmp	short loc_68435
; ���������������������������������������������������������������������������

loc_68443:				; CODE XREF: VROOMM_CheckDOSVersionAndOpen_68405+34j
		mov	di, bx
		call	VROOMM_OpenFile_684A7
		pop	ds

locret_68449:				; CODE XREF: VROOMM_CheckDOSVersionAndOpen_68405+6j
		retn
VROOMM_CheckDOSVersionAndOpen_68405	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⚠️ far, 88 lignes, NON DÉTAILLÉE — lit l'en-tête du fichier ouvert (int 21h READ) et appelle
; VROOMM_ComputeSizeFromHeader_689F1 — probable lecture de l'en-tête MZ.
; ==============================================================================================
VROOMM_ReadHeader_6844A	proc near		; CODE XREF: VROOMM_LocateAndValidate_68254+35p
		push	ds
		mov	ax, seg	seg339
		mov	ds, ax
		mov	ds, word_6D13C
		xor	si, si

loc_68456:				; CODE XREF: VROOMM_ReadHeader_6844A+21j
		mov	di, 0Dh
		push	cs
		pop	es
		assume es:seg212
		mov	cx, 5
		cld
		repe cmpsb
		jz	short loc_68470
		dec	si

loc_68464:				; CODE XREF: VROOMM_ReadHeader_6844A+1Dj
		lodsb
		or	al, al
		jnz	short loc_68464
		cmp	al, [si]
		jnz	short loc_68456

loc_6846D:				; CODE XREF: VROOMM_ReadHeader_6844A+29j
		pop	ds
		stc
		retn
; ���������������������������������������������������������������������������

loc_68470:				; CODE XREF: VROOMM_ReadHeader_6844A+17j
					; VROOMM_ReadHeader_6844A:loc_684A3j
		cmp	byte ptr [si], 0
		jz	short loc_6846D
		lea	di, aCopyright1991B+0Ah
		mov	ax, seg	seg216
		mov	es, ax
		assume es:seg216
		xor	al, al

loc_68480:				; CODE XREF: VROOMM_ReadHeader_6844A+42j
		mov	ah, al
		lodsb

loc_68483:
		or	al, al
		jz	short loc_6848E
		cmp	al, 3Bh	; ';'
		jz	short loc_6848F
		stosb
		jmp	short loc_68480
; ���������������������������������������������������������������������������

loc_6848E:				; CODE XREF: VROOMM_ReadHeader_6844A+3Bj
		dec	si

loc_6848F:				; CODE XREF: VROOMM_ReadHeader_6844A+3Fj
		cmp	ah, 3Ah	; ':'

loc_68492:
		jz	short loc_6849C

loc_68494:
		cmp	ah, 5Ch	; '\'
		jz	short loc_6849C
		mov	al, 5Ch	; '\'
		stosb

loc_6849C:				; CODE XREF: VROOMM_ReadHeader_6844A:loc_68492j
					; VROOMM_ReadHeader_6844A+4Dj
		push	ds

loc_6849D:
		push	si

loc_6849E:
		call	VROOMM_OpenFile_684A7
		pop	si

loc_684A2:
		pop	ds

loc_684A3:
		jb	short loc_68470
		pop	ds
		retn
VROOMM_ReadHeader_6844A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, copie un chemin (12 caractères max, ou chemin par défaut) puis ouvre le fichier (int
; 21h AH=3Dh).
; ==============================================================================================
VROOMM_OpenFile_684A7	proc near		; CODE XREF: VROOMM_CheckCopyright_683F9:loc_68400p
					; VROOMM_CheckDOSVersionAndOpen_68405+40p ...
		lds	si, [bp+6]
		mov	ax, ds
		or	ax, si
		jz	short loc_684BE
		mov	cx, 0Ch

loc_684B3:				; CODE XREF: VROOMM_OpenFile_684A7+12j
		lodsb
		stosb
		or	al, al
		jz	short loc_684BE
		loop	loc_684B3
		sub	al, al
		stosb

loc_684BE:				; CODE XREF: VROOMM_OpenFile_684A7+7j
					; VROOMM_OpenFile_684A7+10j
		lea	dx, aCopyright1991B+0Ah
		mov	ax, seg	seg216
		mov	ds, ax
		assume ds:seg216
		mov	ah, 3Dh	; '='
		mov	al, byte_69DE6
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read
		retn
VROOMM_OpenFile_684A7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, ferme un fichier (int 21h AH=3Eh).
; ==============================================================================================
VROOMM_CloseFile_684CF	proc near		; CODE XREF: VROOMM_LocateAndValidate_68254+53p
					; VROOMM_LocateAndValidate_68254+92p
		push	ds
		lea	dx, [bp-14h]

loc_684D3:
		push	ss
		pop	ds
		assume ds:seg339
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ds
		jb	short locret_684DE
		cmp	ax, cx

locret_684DE:				; CODE XREF: VROOMM_CloseFile_684CF+Bj
		retn
VROOMM_CloseFile_684CF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⚠️ far, 84 lignes, NON DÉTAILLÉE — combine VROOMM_ComputeSizeFromHeader_689F1 — lit et
; interprète l'en-tête MZ du fichier exécutable/overlay ciblé.
; ==============================================================================================
VROOMM_ReadAndParseHeader_684DF	proc near		; CODE XREF: VROOMM_LocateAndValidate_68254+F7p
					; seg212:loc_68B37p
		mov	ax, seg	seg339

loc_684E2:
		mov	es, ax
		assume es:seg339
		mov	ax, es:word_6D140
		add	ax, 10h

loc_684EB:
		mov	cs:word_68252, ax

loc_684EF:
		mov	ax, 69E8h
		mov	es, ax
		assume es:nothing

loc_684F4:
		xor	bx, bx
		xor	di, di

loc_684F8:
		lea	si, off_6D16E+2

loc_684FC:				; CODE XREF: VROOMM_ReadAndParseHeader_684DF+74j
		test	word ptr [si+4], 2
		jz	short loc_68509

loc_68503:
		cmp	word ptr [si+2], 0
		jnz	short loc_6850C

loc_68509:				; CODE XREF: VROOMM_ReadAndParseHeader_684DF+22j
		jmp	short loc_6854A
; ���������������������������������������������������������������������������
		align 2

loc_6850C:				; CODE XREF: VROOMM_ReadAndParseHeader_684DF+28j
		mov	ax, [si]
		push	es
		mov	es:12h,	ax
		mov	es, ax
		assume es:nothing
		cmp	byte ptr es:1Ah, 0FFh
		jnz	short loc_68528
		pop	es

loc_6851E:
		mov	word ptr es:12h, 0
		jmp	short loc_6854A
; ���������������������������������������������������������������������������
		align 2

loc_68528:				; CODE XREF: VROOMM_ReadAndParseHeader_684DF+3Cj
		pop	ax
		mov	word ptr es:18h, 4CAh

loc_68530:
		mov	ax, word_6D154

loc_68533:
		mov	dx, word_6D156
		add	es:4, ax
		adc	es:6, dx
		call	VROOMM_ComputeSizeFromHeader_689F1
		cmp	bx, dx
		jnb	short loc_6854A
		xchg	bx, dx

loc_6854A:				; CODE XREF: VROOMM_ReadAndParseHeader_684DF:loc_68509j
					; VROOMM_ReadAndParseHeader_684DF+46j ...
		add	si, 8
		cmp	si, 0C08h
		jnb	short loc_68555
		jmp	short loc_684FC
; ���������������������������������������������������������������������������

loc_68555:				; CODE XREF: VROOMM_ReadAndParseHeader_684DF+72j
		xor	ax, ax
		add	bx, 2
		mov	word_6D15A, bx
		retn
VROOMM_ReadAndParseHeader_684DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⚠️ far, 117 lignes, NON DÉTAILLÉE — orchestre VROOMM_SkipRelocationsA_6862C,
; VROOMM_SkipRelocationsB_68665, VROOMM_PatchFarJumpTable_688D7 et un pointeur de fonction
; externe (off_69DF6) — probable allocation mémoire et relogement de l'image exécutable
; chargée.
; ==============================================================================================
VROOMM_AllocateAndRelocate_6855F	proc near		; CODE XREF: VROOMM_LocateAndValidate_68254+116p
		mov	cx, word_6D162

loc_68563:
		mov	seg_6D16C, cx
		mov	bx, cx
		mov	si, seg_6D164
		mov	di, word_6D166
		push	ds

loc_68572:				; CODE XREF: VROOMM_AllocateAndRelocate_6855F+47j
		mov	ds, cx
		assume ds:nothing

loc_68574:
		mov	cx, ds:12h
		jcxz	short loc_685A8
		mov	es, cx
		assume es:nothing
		mov	ax, es:4
		mov	dx, es:6
		sub	ax, ds:4
		sbb	dx, ds:6
		mov	cx, 10h
		div	cx
		add	ax, si
		cmp	ax, di

loc_68596:
		ja	short loc_685A8
		mov	ds:10h,	si
		mov	si, ax

loc_6859E:
		mov	cx, es
		mov	ds:1Ch,	cx
		mov	bx, ds
		jmp	short loc_68572
; ���������������������������������������������������������������������������

loc_685A8:				; CODE XREF: VROOMM_AllocateAndRelocate_6855F+19j
					; VROOMM_AllocateAndRelocate_6855F:loc_68596j
		mov	ds, bx
		mov	word ptr ds:1Ch, 0
		pop	ds
		assume ds:seg339
		mov	word ptr off_6D15E+2, si
		mov	ax, seg_6D164
		sub	si, ax
		jnz	short loc_685BF
		jmp	short loc_6861D
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_685BF:				; CODE XREF: VROOMM_AllocateAndRelocate_6855F+5Bj
		mov	cl, 4
		rol	si, cl
		mov	di, si
		and	di, 0Fh
		and	si, 0FFF0h
		mov	es, seg_6D16C
		assume es:nothing
		mov	dx, es:4
		mov	cx, es:6
		call	VROOMM_SkipRelocationsA_6862C
		jb	short locret_6861E
		mov	ax, seg_6D16C
		push	ds

loc_685E2:				; CODE XREF: VROOMM_AllocateAndRelocate_6855F+BBj
		mov	es, ax
		mov	cx, es:0Ah
		jcxz	short loc_685EE
		call	VROOMM_SkipRelocationsB_68665

loc_685EE:				; CODE XREF: VROOMM_AllocateAndRelocate_6855F+8Aj
		cmp	word ptr es:0Ch, 0

loc_685F4:
		jz	short loc_685F9

loc_685F6:
		call	VROOMM_PatchFarJumpTable_688D7

loc_685F9:				; CODE XREF: VROOMM_AllocateAndRelocate_6855F:loc_685F4j
		mov	ax, es:10h
		dec	ax

loc_685FE:
		mov	ds, ax

loc_68600:
		mov	off_6D0BE, es
		push	es

loc_68605:
		mov	ax, 0FFFFh
		mov	bx, ax
		mov	ds, cs:seg_68249
		assume ds:seg216
		call	off_69DF6

loc_68613:
		pop	es
		mov	ax, es:1Ch
		or	ax, ax
		jnz	short loc_685E2
		pop	ds
		assume ds:seg339

loc_6861D:				; CODE XREF: VROOMM_AllocateAndRelocate_6855F+5Dj
		clc

locret_6861E:				; CODE XREF: VROOMM_AllocateAndRelocate_6855F+7Dj
		retn
VROOMM_AllocateAndRelocate_6855F	endp

; ���������������������������������������������������������������������������
		mov	cl, 4
		shr	ax, cl

loc_68623:
		ror	dx, cl

loc_68625:
		and	dx, 0F000h
		or	ax, dx
		retn

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⚠️ far, 63 lignes, NON DÉTAILLÉE — parcourt la table de relogement MZ (int 21h LSEEK/READ).
; ==============================================================================================
VROOMM_SkipRelocationsA_6862C	proc near		; CODE XREF: VROOMM_AllocateAndRelocate_6855F+7Ap
					; seg212:04E7p
		push	ax

loc_6862D:
		mov	bx, seg_6D168

loc_68631:
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		pop	ax
		push	ds
		mov	ds, ax
		jmp	short loc_68643
; ���������������������������������������������������������������������������

loc_6863C:				; CODE XREF: VROOMM_SkipRelocationsA_6862C+35j
		mov	ax, ds

loc_6863E:
		add	ax, 0FFFh
		mov	ds, ax
		assume ds:nothing

loc_68643:				; CODE XREF: VROOMM_SkipRelocationsA_6862C+Ej
		mov	cx, 0FFF0h

loc_68646:
		or	di, di

loc_68648:
		jnz	short loc_6864C
		mov	cx, si

loc_6864C:				; CODE XREF: VROOMM_SkipRelocationsA_6862C:loc_68648j
		xor	dx, dx
		mov	ah, 3Fh

loc_68650:				; DOS -	2+ - READ FROM FILE WITH HANDLE
		int	21h		; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

loc_68652:
		jb	short loc_68663

loc_68654:
		cmp	ax, cx

loc_68656:
		jb	short loc_68663
		sub	si, ax
		sbb	di, 0
		mov	ax, si
		or	ax, di
		jnz	short loc_6863C

loc_68663:				; CODE XREF: VROOMM_SkipRelocationsA_6862C:loc_68652j
					; VROOMM_SkipRelocationsA_6862C:loc_68656j
		pop	ds
		assume ds:seg339
		retn
VROOMM_SkipRelocationsA_6862C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⚠️ far, 60 lignes, NON DÉTAILLÉE — variante de VROOMM_SkipRelocationsA_6862C (int 21h
; LSEEK/READ).
; ==============================================================================================
VROOMM_SkipRelocationsB_68665	proc near		; CODE XREF: VROOMM_AllocateAndRelocate_6855F+8Cp
					; seg212:04F3p
		push	ds
		push	es
		mov	ax, es:8
		mov	si, ax
		and	si, 0Fh

loc_68670:
		shr	ax, 1

loc_68672:
		shr	ax, 1

loc_68674:
		shr	ax, 1

loc_68676:
		shr	ax, 1

loc_68678:
		mov	dx, es:10h
		add	ax, dx

loc_6867F:
		mov	ds, ax
		mov	es, dx

loc_68683:
		shr	cx, 1
		cld

loc_68686:				; CODE XREF: VROOMM_SkipRelocationsB_68665+40j
		lodsw
		mov	bx, ax
		mov	di, es:[bx]
		push	ds
		mov	ax, 69EAh
		mov	ds, ax
		assume ds:nothing

loc_68692:
		mov	ax, di
		and	di, 0FFF8h
		mov	dx, [di]
		mov	es:[bx], dx

loc_6869C:
		test	ax, 1
		jz	short loc_686A4
		call	VROOMM_Helper3_686AA

loc_686A4:				; CODE XREF: VROOMM_SkipRelocationsB_68665+3Aj
		pop	ds
		assume ds:seg339
		loop	loc_68686
		pop	es
		pop	ds
		retn
VROOMM_SkipRelocationsB_68665	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, rôle exact non détaillé, référencée par VROOMM_AllocateAndFinalize_6879E.
; ==============================================================================================
VROOMM_Helper3_686AA	proc near		; CODE XREF: VROOMM_SkipRelocationsB_68665+3Cp
		push	cx
		mov	ds, dx
		mov	ah, es:[bx-1]
		mov	al, ah
		and	ax, 0F807h
		cmp	ah, 0B8h ; '�'
		jnz	short loc_68706
		mov	cx, ax
		mov	ah, es:[bx+2]

loc_686C1:
		mov	al, ah

loc_686C3:
		and	ax, 0F807h

loc_686C6:
		cmp	ah, 50h	; 'P'

loc_686C9:
		jnz	short loc_68706
		cmp	al, cl
		jnz	short loc_68706

loc_686CF:
		mov	dx, ax

loc_686D1:
		mov	ah, es:[bx+3]
		mov	al, ah
		and	ax, 0F807h
		cmp	cx, ax
		jnz	short loc_68706
		mov	ah, es:[bx+6]
		mov	al, ah
		and	ax, 0F807h
		cmp	ax, dx
		jnz	short loc_68706
		mov	di, 20h	; ' '

loc_686EE:
		mov	cx, off_6D0BC

loc_686F2:
		mov	ax, es:[bx+4]

loc_686F6:				; CODE XREF: VROOMM_Helper3_686AA:loc_686FEj
		cmp	ax, [di+2]

loc_686F9:
		jz	short loc_68702
		add	di, 5

loc_686FE:
		loop	loc_686F6
		jmp	short loc_68708
; ���������������������������������������������������������������������������

loc_68702:				; CODE XREF: VROOMM_Helper3_686AA:loc_686F9j
		mov	es:[bx+4], di

loc_68706:				; CODE XREF: VROOMM_Helper3_686AA+Fj
					; VROOMM_Helper3_686AA:loc_686C9j	...
		pop	cx
		retn
; ���������������������������������������������������������������������������

loc_68708:				; CODE XREF: VROOMM_Helper3_686AA+56j
		pop	cx
		retn
VROOMM_Helper3_686AA	endp

; ���������������������������������������������������������������������������
		mov	si, es:8
		xor	di, di
		add	si, es:0Ah
		adc	di, 0
		mov	dx, es:4
		mov	cx, es:6
		mov	ax, es:10h
		call	VROOMM_SkipRelocationsA_6862C
		jb	short locret_68737
		mov	cx, es:0Ah
		jcxz	short loc_68736
		call	VROOMM_SkipRelocationsB_68665

loc_68736:				; CODE XREF: seg212:04F1j
		clc

locret_68737:				; CODE XREF: seg212:04EAj
		retn
; ���������������������������������������������������������������������������
		push	bp

loc_68739:
		mov	bp, sp

loc_6873B:
		test	bp, 1
		jz	short loc_68746

loc_68741:
		jmp	far ptr	loc_2DF
; ���������������������������������������������������������������������������

loc_68746:				; CODE XREF: seg212:04FFj
		push	ax

loc_68747:
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	ds
		push	es

loc_6874E:
		mov	ax, seg	seg216
		mov	ds, ax
		assume ds:seg216
		sti

loc_68754:
		les	bx, [bp+2]
		push	word ptr es:[bx]
		sub	word ptr [bp+2], 2
		jnz	short loc_68765
		call	VROOMM_ApplyRelocationsMain_687E8
		jmp	short loc_6877D
; ���������������������������������������������������������������������������

loc_68765:				; CODE XREF: seg212:051Ej
		add	bp, 6
		mov	ax, [bp+0]
		xchg	ax, [bp-6]
		mov	[bp+0],	ax

loc_68771:
		call	VROOMM_ApplyRelocationsMain_687E8
		mov	ax, [bp+0]
		xchg	ax, [bp-6]
		mov	[bp+0],	ax

loc_6877D:				; CODE XREF: seg212:0523j
		pop	bx
		mov	al, es:1Ah
		and	al, 8
		and	byte ptr es:1Ah, 0F7h
		cbw
		mov	ds, cs:seg_68249
		call	off_69DF6
		pop	es
		pop	ds
		assume ds:seg339
		pop	di
		pop	si
		pop	dx
		pop	cx

loc_6879A:
		pop	bx
		pop	ax
		pop	bp
		iret

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, orchestre VROOMM_ComputeSizeFromHeader_689F1, VROOMM_PatchFarJumpTable_6887B,
; VROOMM_CheckImageHasTrailer_68863, VROOMM_ComputeParagraphs_689E5,
; VROOMM_MoveImageAndFixup_68928, VROOMM_AdvanceLoadPointer_68979,
; VROOMM_ComputeRemainingSpace_689C9.
; ==============================================================================================
VROOMM_AllocateAndFinalize_6879E	proc near		; CODE XREF: VROOMM_ApplyRelocationsMain_687E8+21p
		push	es
		inc	word_6D16A
		call	VROOMM_ComputeSizeFromHeader_689F1
		jmp	short loc_687D6
; ���������������������������������������������������������������������������

loc_687A8:				; CODE XREF: VROOMM_AllocateAndFinalize_6879E+3Ej
		popf
		push	dx
		jnb	short loc_687AF
		call	VROOMM_PatchFarJumpTable_6887B

loc_687AF:				; CODE XREF: VROOMM_AllocateAndFinalize_6879E+Cj
		mov	es, seg_6D16C
		mov	ax, es:1Ch
		mov	seg_6D16C, ax
		cmp	byte ptr es:1Bh, 0

loc_687C0:
		jnz	short loc_687CA
		call	VROOMM_CheckImageHasTrailer_68863
		call	VROOMM_ComputeParagraphs_689E5
		jmp	short loc_687D5
; ���������������������������������������������������������������������������

loc_687CA:				; CODE XREF: VROOMM_AllocateAndFinalize_6879E:loc_687C0j
		dec	byte ptr es:1Bh
		call	VROOMM_MoveImageAndFixup_68928
		call	VROOMM_AdvanceLoadPointer_68979

loc_687D5:				; CODE XREF: VROOMM_AllocateAndFinalize_6879E+2Aj
		pop	dx

loc_687D6:				; CODE XREF: VROOMM_AllocateAndFinalize_6879E+8j
		call	VROOMM_ComputeRemainingSpace_689C9
		pushf
		cmp	dx, ax
		ja	short loc_687A8
		popf
		pop	es

loc_687E0:
		mov	ax, word ptr off_6D15E+2

loc_687E3:
		mov	es:10h,	ax

locret_687E7:
		retn
VROOMM_AllocateAndFinalize_6879E	endp ; sp =  2


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⚠️ far, 85 lignes, NON DÉTAILLÉE — applique la table de relogement MZ (comparable à
; VROOMM_AllocateAndFinalize_6879E, mêmes helpers PatchFarJumpTable/CheckImageHasTrailer/Compu
; teParagraphs/AdvanceLoadPointer/ComputeRemainingSpace).
; ==============================================================================================
VROOMM_ApplyRelocationsMain_687E8	proc near		; CODE XREF: seg212:0520p
					; seg212:loc_68771p ...

; FUNCTION CHUNK AT 02DF SIZE 0000001D BYTES

		inc	seg_6D15C

loc_687EC:
		cmp	word ptr es:10h, 0
		jz	short loc_68803

loc_687F4:
		mov	byte ptr es:1Bh, 1
		or	byte ptr es:1Ah, 4
		jmp	short loc_6881F
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_68803:				; CODE XREF: VROOMM_ApplyRelocationsMain_687E8+Aj
		or	byte ptr es:1Ah, 8
		call	VROOMM_AllocateAndFinalize_6879E
		push	ds
		dec	ax
		mov	ds, ax
		mov	off_6D0BE, es
		pop	ds
		call	word ptr es:18h
		jb	short loc_6885E
		call	VROOMM_AdvanceLoadPointer_68979

loc_6881F:				; CODE XREF: VROOMM_ApplyRelocationsMain_687E8+18j
		call	VROOMM_ConditionalPatchTrampoline_688B6
		mov	al, es:1Ah
		and	al, 3
		add	es:1Bh,	al
		push	es
		call	VROOMM_ComputeRemainingSpace_689C9

loc_68831:
		mov	es, seg_6D16C

loc_68835:				; CODE XREF: VROOMM_ApplyRelocationsMain_687E8+72j
		mov	cx, es:1Ch
		jcxz	short loc_6885C

loc_6883C:
		cmp	ax, word_6D158

loc_68840:
		jnb	short loc_6885C
		push	cx

loc_68843:
		push	ax

loc_68844:
		cmp	byte ptr es:1Bh, 0
		jz	short loc_68850

loc_6884C:
		xor	ax, ax
		jmp	short loc_68856
; ���������������������������������������������������������������������������

loc_68850:				; CODE XREF: VROOMM_ApplyRelocationsMain_687E8+62j
		call	VROOMM_PatchIntTrampoline_688F5
		call	VROOMM_ComputeParagraphs_689E5

loc_68856:				; CODE XREF: VROOMM_ApplyRelocationsMain_687E8+66j
		pop	cx
		pop	es
		add	ax, cx
		jmp	short loc_68835
; ���������������������������������������������������������������������������

loc_6885C:				; CODE XREF: VROOMM_ApplyRelocationsMain_687E8+52j
					; VROOMM_ApplyRelocationsMain_687E8:loc_68840j
		pop	es
		retn
; ���������������������������������������������������������������������������

loc_6885E:				; CODE XREF: VROOMM_ApplyRelocationsMain_687E8+32j
		jmp	far ptr	loc_2DF
VROOMM_ApplyRelocationsMain_687E8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, vérifie un motif d'en-tête à l'offset image+0x18 (constante 0x4CA) et appelle un
; pointeur externe (off_6D0C0) si présent.
; ==============================================================================================
VROOMM_CheckImageHasTrailer_68863	proc near		; CODE XREF: VROOMM_AllocateAndFinalize_6879E+24p
		call	VROOMM_PatchIntTrampoline_688F5
		cmp	word ptr es:18h, 4CAh
		jnz	short loc_68873

loc_6886F:
		call	off_6D0C0

loc_68873:				; CODE XREF: VROOMM_CheckImageHasTrailer_68863+Aj
		mov	word ptr es:10h, 0
		retn
VROOMM_CheckImageHasTrailer_68863	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⚠️ far, 44 lignes, NON DÉTAILLÉE — écrit des instructions JMP FAR (opcode 0xEA) dans l'image
; chargée, motif de patch de table de sauts (probable installation de points d'entrée
; d'overlay).
; ==============================================================================================
VROOMM_PatchFarJumpTable_6887B	proc near		; CODE XREF: VROOMM_AllocateAndFinalize_6879E+Ep
		mov	ax, seg_6D16C
		xor	cx, cx

loc_68880:				; CODE XREF: VROOMM_PatchFarJumpTable_6887B+Fj
		inc	cx
		push	ax

loc_68882:
		mov	es, ax

loc_68884:
		mov	ax, es:1Ch
		or	ax, ax
		jnz	short loc_68880
		mov	seg_6D16C, ax
		mov	ax, word_6D166

loc_68892:
		mov	word ptr off_6D15E+2, ax

loc_68895:				; CODE XREF: VROOMM_PatchFarJumpTable_6887B+32j
		pop	es
		push	cx

loc_68897:
		mov	ax, seg_6D16C

loc_6889A:
		mov	es:1Ch,	ax
		mov	seg_6D16C, es

loc_688A2:
		call	VROOMM_ComputeParagraphs_689E5

loc_688A5:
		sub	word ptr off_6D15E+2, ax
		call	VROOMM_MoveImageAndFixup_68928
		pop	cx
		loop	loc_68895
		mov	ax, seg_6D164
		mov	word ptr off_6D15E+2, ax
		retn
VROOMM_PatchFarJumpTable_6887B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, patche un trampoline JMP FAR (0xEA) à l'offset image+0x20 si nécessaire (délègue à
; VROOMM_PatchFarJumpTable_688D7).
; ==============================================================================================
VROOMM_ConditionalPatchTrampoline_688B6	proc near		; CODE XREF: VROOMM_ApplyRelocationsMain_687E8:loc_6881Fp
		cmp	word ptr es:0Ch, 0
		jnz	short loc_688BF
		retn
; ���������������������������������������������������������������������������

loc_688BF:				; CODE XREF: VROOMM_ConditionalPatchTrampoline_688B6+6j
		cmp	byte ptr es:20h, 0EAh ;	'�'
		jz	short locret_688F4
		mov	cx, es:2
		jcxz	short VROOMM_PatchFarJumpTable_688D7
		mov	ax, es:10h

loc_688D2:
		mov	dx, es

loc_688D4:
		call	VROOMM_PatchRelocationEntry_68997
VROOMM_ConditionalPatchTrampoline_688B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, écrit une série d'instructions JMP FAR (opcode 0xEA) pour reconstruire une table de
; sauts après relogement.
; ==============================================================================================
VROOMM_PatchFarJumpTable_688D7	proc near		; CODE XREF: VROOMM_AllocateAndRelocate_6855F:loc_685F6p
					; VROOMM_ConditionalPatchTrampoline_688B6+16j
		mov	bx, es:10h
		mov	cx, es:0Ch

loc_688E1:
		mov	di, 20h	; ' '
		cld

loc_688E5:				; CODE XREF: VROOMM_PatchFarJumpTable_688D7:loc_688F2j
		mov	dx, es:[di+2]
		mov	al, 0EAh ; '�'
		stosb
		mov	ax, dx
		stosw
		mov	ax, bx

loc_688F1:
		stosw

loc_688F2:
		loop	loc_688E5

locret_688F4:				; CODE XREF: VROOMM_ConditionalPatchTrampoline_688B6+Fj
		retn
VROOMM_PatchFarJumpTable_688D7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, écrit une série d'instructions INT (opcode 0xCD) — motif de patch de trampoline
; d'interruption (probable installation de points d'entrée pour hooks matériels du type de
; ceux du seg154/seg161/seg211).
; ==============================================================================================
VROOMM_PatchIntTrampoline_688F5	proc near		; CODE XREF: VROOMM_ApplyRelocationsMain_687E8:loc_68850p
					; VROOMM_CheckImageHasTrailer_68863p
		cmp	byte ptr es:20h, 0CDh ;	'�'
		jz	short locret_68927
		mov	ax, es

loc_688FF:
		mov	dx, es:10h

loc_68904:
		xor	cx, cx
		call	VROOMM_PatchRelocationEntry_68997
		mov	es:2, cx
		mov	cx, es:0Ch
		mov	di, 20h	; ' '
		cld

loc_68917:				; CODE XREF: VROOMM_PatchIntTrampoline_688F5:loc_68925j
		mov	dx, es:[di+1]
		mov	ax, word_6D150
		stosw
		mov	ax, dx
		stosw
		xor	al, al
		stosb

loc_68925:
		loop	loc_68917

locret_68927:				; CODE XREF: VROOMM_PatchIntTrampoline_688F5+6j
		retn
VROOMM_PatchIntTrampoline_688F5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⚠️ far, 52 lignes, NON DÉTAILLÉE — déplace l'image chargée en mémoire (rep movsw, direction
; ajustée selon chevauchement) et retouche l'en-tête (patch de trampolines via
; VROOMM_PatchIntTrampoline_688F5 ou table de relogement).
; ==============================================================================================
VROOMM_MoveImageAndFixup_68928	proc near		; CODE XREF: VROOMM_AllocateAndFinalize_6879E+31p
					; VROOMM_PatchFarJumpTable_6887B+2Ep
		mov	ax, word ptr off_6D15E+2
		mov	dx, es:10h
		mov	es:10h,	ax
		mov	cx, es:8
		inc	cx
		shr	cx, 1
		xor	si, si
		cld
		cmp	ax, dx
		jb	short loc_68949

loc_68943:
		mov	si, cx
		dec	si
		shl	si, 1
		std

loc_68949:				; CODE XREF: VROOMM_MoveImageAndFixup_68928+19j
		mov	di, si
		push	ds
		push	es
		mov	ds, dx
		mov	es, ax
		rep movsw
		cld
		dec	ax
		mov	ds, ax
		pop	es
		mov	off_6D0BE, es
		inc	ax
		pop	ds
		cmp	byte ptr es:20h, 0CDh ;	'�'
		jz	short locret_68978
		call	VROOMM_FindRelocationSlot_689A3
		mov	cx, es:0Ch
		mov	di, 23h	; '#'
		cld

loc_68972:				; CODE XREF: VROOMM_MoveImageAndFixup_68928:loc_68976j
		stosw

loc_68973:
		add	di, 3

loc_68976:
		loop	loc_68972

locret_68978:				; CODE XREF: VROOMM_MoveImageAndFixup_68928+3Cj
		retn
VROOMM_MoveImageAndFixup_68928	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, avance un pointeur de chargement global (off_6D15E) et met à jour une chaîne de
; segments alloués.
; ==============================================================================================
VROOMM_AdvanceLoadPointer_68979	proc near		; CODE XREF: VROOMM_AllocateAndFinalize_6879E+34p
					; VROOMM_ApplyRelocationsMain_687E8+34p
		call	VROOMM_ComputeParagraphs_689E5

loc_6897C:
		add	word ptr off_6D15E+2, ax
		push	ds

loc_68981:
		mov	ax, 69E8h

loc_68984:				; CODE XREF: VROOMM_AdvanceLoadPointer_68979+12j
		mov	ds, ax
		assume ds:nothing
		mov	ax, ds:1Ch
		or	ax, ax
		jnz	short loc_68984
		mov	word ptr ds:1Ch, es

loc_68991:
		mov	es:1Ch,	ax
		pop	ds
		assume ds:seg339
		retn
VROOMM_AdvanceLoadPointer_68979	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, patche une entrée de la table de relogement trouvée (échange avec
; VROOMM_FindRelocationSlot_689A3).
; ==============================================================================================
VROOMM_PatchRelocationEntry_68997	proc near		; CODE XREF: VROOMM_ConditionalPatchTrampoline_688B6:loc_688D4p
					; VROOMM_PatchIntTrampoline_688F5+11p
		call	VROOMM_FindRelocationSlot_689A3
		or	bx, bx
		jz	short locret_689A2
		xchg	cx, ss:[bx+2]

locret_689A2:				; CODE XREF: VROOMM_PatchRelocationEntry_68997+5j
		retn
VROOMM_PatchRelocationEntry_68997	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, recherche binaire/linéaire dans une table de relogement (segment:offset). Appelée par
; VROOMM_MoveImageAndFixup_68928 et VROOMM_PatchRelocationEntry_68997.
; ==============================================================================================
VROOMM_FindRelocationSlot_689A3	proc near		; CODE XREF: VROOMM_MoveImageAndFixup_68928+3Ep VROOMM_PatchRelocationEntry_68997p
		xor	bx, bx
		push	cx
		push	bp
		jmp	short loc_689AD
; ���������������������������������������������������������������������������

loc_689A9:				; CODE XREF: VROOMM_FindRelocationSlot_689A3+11j
					; VROOMM_FindRelocationSlot_689A3+16j ...
		shl	cx, 1
		mov	bp, cx

loc_689AD:				; CODE XREF: VROOMM_FindRelocationSlot_689A3+4j
		mov	cx, [bp+0]
		shr	cx, 1
		jz	short loc_689C6
		jb	short loc_689A9
		cmp	dx, [bp+4]
		jnz	short loc_689A9
		mov	[bp+4],	ax
		or	bx, bx
		jnz	short loc_689A9
		mov	bx, bp

loc_689C4:
		jmp	short loc_689A9
; ���������������������������������������������������������������������������

loc_689C6:				; CODE XREF: VROOMM_FindRelocationSlot_689A3+Fj
		pop	bp

loc_689C7:
		pop	cx

locret_689C8:
		retn
VROOMM_FindRelocationSlot_689A3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, calcule l'espace mémoire restant disponible pour le chargement (comparaison de
; segments).
; ==============================================================================================
VROOMM_ComputeRemainingSpace_689C9	proc near		; CODE XREF: VROOMM_AllocateAndFinalize_6879E:loc_687D6p
					; VROOMM_ApplyRelocationsMain_687E8+46p
		mov	ax, seg_6D16C
		or	ax, ax

loc_689CE:
		jz	short loc_689DC
		mov	es, ax

loc_689D2:
		mov	ax, es:10h
		sub	ax, word ptr off_6D15E+2
		jnb	short locret_689E4

loc_689DC:				; CODE XREF: VROOMM_ComputeRemainingSpace_689C9:loc_689CEj
		mov	ax, word_6D166

loc_689DF:
		sub	ax, word ptr off_6D15E+2
		stc

locret_689E4:				; CODE XREF: VROOMM_ComputeRemainingSpace_689C9+11j
		retn
VROOMM_ComputeRemainingSpace_689C9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, convertit une taille de fichier MZ (champ « pages ») en nombre de paragraphes (arrondi
; au paragraphe supérieur, classique du format MZ).
; ==============================================================================================
VROOMM_ComputeParagraphs_689E5	proc near		; CODE XREF: VROOMM_AllocateAndFinalize_6879E+27p
					; VROOMM_ApplyRelocationsMain_687E8+6Bp ...
		mov	ax, es:8
		add	ax, 11h
		mov	cl, 4
		shr	ax, cl
		retn
VROOMM_ComputeParagraphs_689E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, calcule la taille totale de l'image (pages + paragraphes supplémentaires demandés) à
; partir de l'en-tête MZ — arithmétique standard de calcul de taille d'exécutable DOS.
; ==============================================================================================
VROOMM_ComputeSizeFromHeader_689F1	proc near		; CODE XREF: VROOMM_ReadAndParseHeader_684DF+62p
					; VROOMM_AllocateAndFinalize_6879E+5p
		mov	cl, 4

loc_689F3:
		mov	ax, es:8

loc_689F7:
		add	ax, 11h
		shr	ax, cl

loc_689FC:
		mov	dx, es:0Ah

loc_68A01:
		add	dx, 0Fh
		shr	dx, cl
		add	dx, ax
		retn
VROOMM_ComputeSizeFromHeader_689F1	endp

; ���������������������������������������������������������������������������
		push	ds
		push	es
		mov	ds, cs:seg_68249
		assume ds:seg216
		cmp	ax, word_69E94
		jb	short loc_68A39
		cmp	ax, word_69E96
		jnb	short loc_68A39
		dec	ax
		mov	es, ax
		mov	es, word ptr es:0Eh

loc_68A24:
		inc	ax
		mov	bx, word_69E80
		cmp	bx, es:0
		jnz	short loc_68A39
		cmp	ax, es:10h
		mov	ax, es
		jz	short loc_68A3C

loc_68A39:				; CODE XREF: seg212:07D4j seg212:07DAj ...
		xor	ax, ax
		stc

loc_68A3C:				; CODE XREF: seg212:07F7j
		pop	es
		pop	ds
		assume ds:seg339
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp

loc_68A42:
		sub	sp, 2

loc_68A45:
		mov	byte ptr [bp-2], 0
		push	ds

loc_68A4A:
		mov	ds, cs:seg_68249
		assume ds:seg216
		push	si
		push	di

loc_68A51:
		mov	bx, bp
		mov	ax, word_69E80

loc_68A56:
		mov	dx, word_69E94
		jmp	short loc_68A60
; ���������������������������������������������������������������������������

loc_68A5C:				; CODE XREF: seg212:082Bj seg212:0833j ...
		shl	si, 1
		mov	bx, si

loc_68A60:				; CODE XREF: seg212:081Aj
		cmp	bx, cx
		jnb	short loc_68A8E
		mov	si, ss:[bx]
		shr	si, 1
		jz	short loc_68A8E
		jb	short loc_68A5C
		mov	di, ss:[bx+4]
		cmp	di, dx
		jnb	short loc_68A5C
		mov	es, di
		mov	di, ss:[bx+2]
		or	di, di
		jnz	short loc_68A5C
		cmp	es:[di], ax
		jnz	short loc_68A5C
		mov	byte ptr [bp-2], 1
		mov	es:[di+2], di
		jmp	short loc_68A5C
; ���������������������������������������������������������������������������

loc_68A8E:				; CODE XREF: seg212:0822j seg212:0829j
		cmp	byte ptr [bp-2], 1
		jz	short loc_68A9B
		jmp	short loc_68AD0
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_68A97:				; CODE XREF: seg212:0862j seg212:086Aj ...
		shl	si, 1
		mov	bx, si

loc_68A9B:				; CODE XREF: seg212:0852j
		mov	si, ss:[bx]
		shr	si, 1
		jz	short loc_68AD0
		jb	short loc_68A97
		mov	di, ss:[bx+4]
		cmp	di, dx
		jnb	short loc_68A97
		mov	es, di
		mov	di, ss:[bx+2]
		or	di, di
		jz	short loc_68A97
		cmp	es:0, ax
		jnz	short loc_68A97
		cmp	word ptr es:2, 0
		jnz	short loc_68A97
		xchg	di, es:2
		mov	ss:[bx+2], di
		jmp	short loc_68A97
; ���������������������������������������������������������������������������

loc_68AD0:				; CODE XREF: seg212:0854j seg212:0860j
		pop	di
		pop	si
		pop	ds
		assume ds:seg339
		mov	sp, bp
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	ds
		mov	ds, cs:seg_68249
		assume ds:seg216
		mov	es, word ptr [bp+8]

loc_68AE3:
		mov	cx, word_69E80

loc_68AE7:
		cmp	cx, es:0
		jnz	short loc_68B2C

loc_68AEE:
		cmp	word ptr es:10h, 0
		jz	short loc_68AFE
		cmp	byte ptr es:20h, 0CDh ;	'�'
		jnz	short loc_68B25

loc_68AFE:				; CODE XREF: seg212:08B4j
		mov	word ptr [bp+8], 0
		push	si
		push	di
		call	VROOMM_ApplyRelocationsMain_687E8
		pop	di
		pop	si
		mov	bx, [bp+6]
		push	es
		mov	al, es:1Ah
		and	al, 8
		and	byte ptr es:1Ah, 0F7h
		cbw
		mov	ds, cs:seg_68249
		call	off_69DF6
		pop	es

loc_68B25:				; CODE XREF: seg212:08BCj
		mov	ax, es:10h
		mov	[bp+8],	ax

loc_68B2C:				; CODE XREF: seg212:08ACj
		pop	ds
		assume ds:seg339
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; ⭐ far, 80 lignes, référencée via vtable (DATA XREF seg339) — point d'entrée principal du
; loader VROOMM : appelle VROOMM_ReadAndParseHeader_684DF puis enchaîne le chargement complet
; de l'image d'overlay (parsing MZ, relogement, patch de trampolines JMP/INT).
; ==============================================================================================
VROOMM_MainEntry_68B2F:				; DATA XREF: seg339:off_71F62o
		push	ds
		push	si

loc_68B31:
		push	di

loc_68B32:
		mov	ax, seg	seg216
		mov	ds, ax
		assume ds:seg216

loc_68B37:
		call	VROOMM_ReadAndParseHeader_684DF
		mov	bx, word_69E8A

loc_68B3E:
		mov	ax, seg	seg339

loc_68B41:
		mov	ds, ax
		assume ds:seg339

loc_68B43:
		mov	ax, seg	seg339

loc_68B46:
		mov	es, ax
		assume es:seg339
		cmp	bx, es:word_71A1C
		jnb	short loc_68B56
		mov	bx, es:word_71A1C
		jmp	short loc_68B58
; ���������������������������������������������������������������������������

loc_68B56:				; CODE XREF: seg212:090Dj
		shl	bx, 1

loc_68B58:				; CODE XREF: seg212:0914j
		inc	bx
		push	bx
		mov	ax, 10h
		mul	bx
		push	dx
		push	ax
		call	PagedResourceB_Read_5D90E
		pop	bx
		pop	bx
		pop	bx
		mov	cx, ax
		or	cx, dx
		jcxz	short loc_68B85
		inc	dx
		add	bx, dx
		push	dx
		push	bx
		xor	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr VROOMM_LocateAndValidate_68254
		or	ax, ax
		jnz	short loc_68B85
		pop	di
		pop	si

loc_68B83:
		pop	ds
		retf
; ���������������������������������������������������������������������������

loc_68B85:				; CODE XREF: seg212:092Dj seg212:093Fj
		jmp	far ptr	loc_2AD
; ���������������������������������������������������������������������������
		retn
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_7. PRESS KEYPAD "+" TO EXPAND]
; ���������������������������������������������������������������������������

; Segment type:	Regular
