seg140		segment	byte public 'CODE' use16
		assume cs:seg140
		;org 4
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; File_OpenWithRetry_63434 (sub_63434 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, ouvre un fichier existant (int 21h, AH=3Dh, DOS OPEN)
; avec retry via le callback configurable (off_70FCE) en cas d'erreur — même motif que
; File_CreateWithRetry_630BA (seg184). Référencée par sub_64413 et sub_A1173.
; ==============================================================================================
File_OpenWithRetry_3ACA4	proc far		; CODE XREF: FileStream_Method_Open_3BC83+38P
					; sub_BEFD9+34P

arg_0		= byte ptr  6
arg_2		= dword	ptr  8

		push	bp

loc_3ACA5:				; DATA XREF: seg170:0536o
		mov	bp, sp
		mov	word_478C2, 0

loc_3ACAD:				; CODE XREF: File_OpenWithRetry_3ACA4+24j
		push	ds
		lds	dx, [bp+arg_2]
		mov	ah, 3Dh	; '='
		mov	al, [bp+arg_0]
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read, 1 -	write, 2 - read	& write
		pop	ds
		jnb	short loc_3ACCE
		mov	word_478C2, ax
		call	off_478C4
		test	word_478C2, 0FFFFh
		jz	short loc_3ACAD
		mov	ax, 0FFFFh
		stc

loc_3ACCE:				; CODE XREF: File_OpenWithRetry_3ACA4+15j
		pop	bp
		retf	6
File_OpenWithRetry_3ACA4	endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_6. PRESS KEYPAD "+" TO EXPAND]

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; File_CloseWithRetry_63463 (sub_63463 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, ferme un fichier (int 21h, AH=3Eh, DOS CLOSE) avec
; retry via le callback configurable (off_70FCE). Référencée depuis seg192 et sub_A10C0.
; ==============================================================================================
File_CloseWithRetry_3ACD3	proc far		; CODE XREF: seg146:0132P
					; sub_BEF10+B9P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_3ACD6:				; CODE XREF: File_CloseWithRetry_3ACD3+19j
		mov	bx, [bp+arg_0]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		jnb	short loc_3ACEE
		mov	word_478C2, ax
		call	off_478C4
		test	word_478C2, 0FFFFh
		jz	short loc_3ACD6

loc_3ACEE:				; CODE XREF: File_CloseWithRetry_3ACD3+Aj
		pop	bp
		retf	2
File_CloseWithRetry_3ACD3	endp

seg140		ends
