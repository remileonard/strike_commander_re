seg187		segment	byte public 'CODE' use16
		assume cs:seg187
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, positionne le pointeur de fichier (int 21h, AH=42h, DOS LSEEK) avec retry via le
; callback configurable (off_70FCE) — même famille que
; File_OpenWithRetry_63434/File_CloseWithRetry_63463 (seg186). Référencée massivement depuis
; seg192.
; ==============================================================================================
File_SeekWithRetry_63482	proc far		; CODE XREF: seg192:00AAP seg192:0167P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp

loc_63483:				; DATA XREF: seg216:069Eo
		mov	bp, sp
		push	si
		push	di
		mov	word_70FCC, 0

loc_6348D:				; CODE XREF: File_SeekWithRetry_63482+2Aj
		mov	bx, [bp+arg_6]
		mov	ax, [bp+arg_0]

loc_63493:
		mov	dx, [bp+arg_2]

loc_63496:
		mov	cx, [bp+arg_4]
		mov	ah, 42h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method:
					; 0-from beginnig,1-from current,2-from	end
		jnb	short loc_634B4
		mov	word_70FCC, ax
		call	off_70FCE
		test	word_70FCC, 0FFFFh
		jz	short loc_6348D

loc_634AE:
		mov	ax, 0FFFFh

loc_634B1:
		mov	dx, ax

loc_634B3:
		stc

loc_634B4:				; CODE XREF: File_SeekWithRetry_63482+1Bj
		pop	di
		pop	si
		pop	bp

locret_634B7:
		retf	8
File_SeekWithRetry_63482	endp

seg187		ends
