seg186		segment	byte public 'CODE' use16
		assume cs:seg186
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, ouvre un fichier existant (int 21h, AH=3Dh, DOS OPEN) avec retry via le callback
; configurable (off_70FCE) en cas d'erreur — même motif que File_CreateWithRetry_630BA
; (seg184). Référencée par sub_64413 et sub_A1173.
; ==============================================================================================
File_OpenWithRetry_63434	proc far		; CODE XREF: FileStream_Method_Open_64413:loc_6444BP
					; SaveGame_ReadFile_A1173+30P

arg_0		= byte ptr  6
arg_2		= dword	ptr  8

		push	bp

loc_63435:				; DATA XREF: seg216:off_6A476o
		mov	bp, sp
		mov	word_70FCC, 0

loc_6343D:				; CODE XREF: File_OpenWithRetry_63434:loc_63458j
		push	ds
		lds	dx, [bp+arg_2]
		mov	ah, 3Dh	; '='
		mov	al, [bp+arg_0]
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read, 1 -	write, 2 - read	& write
		pop	ds
		jnb	short loc_6345E
		mov	word_70FCC, ax

loc_6344E:
		call	off_70FCE

loc_63452:
		test	word_70FCC, 0FFFFh

loc_63458:
		jz	short loc_6343D

loc_6345A:
		mov	ax, 0FFFFh
		stc

loc_6345E:				; CODE XREF: File_OpenWithRetry_63434+15j
		pop	bp
		retf	6
File_OpenWithRetry_63434	endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_6. PRESS KEYPAD "+" TO EXPAND]

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, ferme un fichier (int 21h, AH=3Eh, DOS CLOSE) avec retry via le callback configurable
; (off_70FCE). Référencée depuis seg192 et sub_A10C0.
; ==============================================================================================
File_CloseWithRetry_63463	proc far		; CODE XREF: seg192:0132P
					; SaveGame_WriteFile_A10C0+A7P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_63466:				; CODE XREF: File_CloseWithRetry_63463:loc_6347Cj
		mov	bx, [bp+arg_0]
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		jnb	short loc_6347E
		mov	word_70FCC, ax
		call	off_70FCE

loc_63476:
		test	word_70FCC, 0FFFFh

loc_6347C:
		jz	short loc_63466

loc_6347E:				; CODE XREF: File_CloseWithRetry_63463+Aj
		pop	bp

locret_6347F:
		retf	2
File_CloseWithRetry_63463	endp

seg186		ends
