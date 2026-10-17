seg138		segment	byte public 'CODE' use16
		assume cs:seg138
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; File_CreateWithRetry_630BA (sub_630BA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, crée un fichier (int 21h, AH=3Ch, DOS CREATE
; FILE) ; en cas d'erreur, appelle un callback de reprise (off_70FCE, pointeur de fonction
; configurable) et retente si celui-ci l'indique, sinon retourne une erreur. Référencée par
; sub_64413 et sub_A10C0.
; ==============================================================================================
File_CreateWithRetry_3A92A	proc far		; CODE XREF: FileStream_Method_Open_3BC83+1EP
					; sub_BEF10+32P

arg_0		= dword	ptr  6

		push	bp

loc_3A92B:				; DATA XREF: seg170:0526o
		mov	bp, sp
		push	si
		push	di

loc_3A92F:				; CODE XREF: File_CreateWithRetry_3A92A+1Fj
		push	ds
		lds	dx, [bp+arg_0]
		xor	cx, cx
		mov	ah, 3Ch
		int	21h		; DOS -	2+ - CREATE A FILE WITH	HANDLE (CREAT)
					; CX = attributes for file
					; DS:DX	-> ASCIZ filename (may include drive and path)
		pop	ds
		jnb	short loc_3A94F
		mov	word_478C2, ax
		call	off_478C4
		test	word_478C2, 0FFFFh
		jz	short loc_3A92F
		mov	ax, 0FFFFh
		stc

loc_3A94F:				; CODE XREF: File_CreateWithRetry_3A92A+10j
		pop	di
		pop	si
		pop	bp
		retf	4
File_CreateWithRetry_3A92A	endp

seg138		ends
