seg141		segment	byte public 'CODE' use16
		assume cs:seg141
		;org 2
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; File_SeekWithRetry_63482 (sub_63482 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, positionne le pointeur de fichier (int 21h, AH=42h, DOS
; LSEEK) avec retry via le callback configurable (off_70FCE) — même famille que
; File_OpenWithRetry_63434/File_CloseWithRetry_63463 (seg186). Référencée massivement depuis
; seg192.
; ==============================================================================================
File_SeekWithRetry_3ACF2	proc far		; CODE XREF: seg146:00AAP seg146:0167P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp

loc_3ACF3:				; DATA XREF: seg170:053Eo
		mov	bp, sp
		push	si
		push	di
		mov	word_478C2, 0

loc_3ACFD:				; CODE XREF: File_SeekWithRetry_3ACF2+2Aj
		mov	bx, [bp+arg_6]
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	ah, 42h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method:
					; 0-from beginnig,1-from current,2-from	end
		jnb	short loc_3AD24
		mov	word_478C2, ax
		call	off_478C4
		test	word_478C2, 0FFFFh
		jz	short loc_3ACFD
		mov	ax, 0FFFFh
		mov	dx, ax
		stc

loc_3AD24:				; CODE XREF: File_SeekWithRetry_3ACF2+1Bj
		pop	di
		pop	si
		pop	bp
		retf	8
File_SeekWithRetry_3ACF2	endp

seg141		ends
