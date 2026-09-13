seg184		segment	byte public 'CODE' use16
		assume cs:seg184
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, crée un fichier (int 21h, AH=3Ch, DOS CREATE FILE) ; en cas d'erreur, appelle un
; callback de reprise (off_70FCE, pointeur de fonction configurable) et retente si celui-ci
; l'indique, sinon retourne une erreur. Référencée par sub_64413 et sub_A10C0.
; ==============================================================================================
File_CreateWithRetry_630BA	proc far		; CODE XREF: FileStream_Method_Open_64413+1EP
					; SaveGame_WriteFile_A10C0+2EP

arg_0		= dword	ptr  6

		push	bp

loc_630BB:
		mov	bp, sp
		push	si
		push	di

loc_630BF:				; CODE XREF: File_CreateWithRetry_630BA+1Fj
		push	ds

loc_630C0:
		lds	dx, [bp+arg_0]
		xor	cx, cx
		mov	ah, 3Ch
		int	21h		; DOS -	2+ - CREATE A FILE WITH	HANDLE (CREAT)
					; CX = attributes for file
					; DS:DX	-> ASCIZ filename (may include drive and path)
		pop	ds
		jnb	short loc_630DF
		mov	word_70FCC, ax
		call	off_70FCE
		test	word_70FCC, 0FFFFh
		jz	short loc_630BF
		mov	ax, 0FFFFh
		stc

loc_630DF:				; CODE XREF: File_CreateWithRetry_630BA+10j
		pop	di

loc_630E0:
		pop	si
		pop	bp

locret_630E2:
		retf	4
File_CreateWithRetry_630BA	endp

seg184		ends
