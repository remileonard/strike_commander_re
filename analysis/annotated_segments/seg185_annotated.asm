seg185		segment	byte public 'CODE' use16
		assume cs:seg185
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_5. PRESS KEYPAD "+" TO EXPAND]

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 188 lignes, NON DÉTAILLÉE — vérifie une taille demandée contre un seuil global
; (word_709D6) ; si dépassé, délègue à File_ReadViaPagedMemory_63294, sinon effectue une
; lecture conventionnelle (LSEEK+read). Référencée par sub_64353 et sub_A1173.
; ==============================================================================================
File_ReadOrDelegateToPaged_630E7	proc far		; CODE XREF: FileStream_Method_Read_64353+27P
					; SaveGame_ReadFile_A1173:loc_A11F0P
					; DATA XREF: ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h

		enter	4, 0
		push	si
		push	di
		push	bx
		push	cx
		mov	ax, word_709D6
		or	ax, ax
		jz	short loc_63119
		cmp	[bp+arg_2], ax
		jb	short loc_63119
		push	large dword ptr	[bp+6]
		push	large [bp+arg_4]
		push	large [bp+arg_8]
		push	[bp+arg_C]
		push	cs
		call	near ptr File_ReadViaPagedMemory_63294
		add	sp, 0Eh
		pop	cx
		pop	bx

loc_63113:
		pop	di
		pop	si
		leave

locret_63116:
		retf	0Eh
; ���������������������������������������������������������������������������

loc_63119:				; CODE XREF: File_ReadOrDelegateToPaged_630E7+Dj
					; File_ReadOrDelegateToPaged_630E7+12j
		mov	word_70FBA, 0

loc_6311F:
		mov	ax, word ptr [bp+arg_4]

loc_63122:
		or	ax, word ptr [bp+arg_4+2]

loc_63125:
		cmp	ax, 0

loc_63128:
		jnz	short loc_63130
		clc
		xor	dx, dx

loc_6312D:
		jmp	loc_631DB
; ���������������������������������������������������������������������������

loc_63130:				; CODE XREF: File_ReadOrDelegateToPaged_630E7:loc_63128j
					; File_ReadOrDelegateToPaged_630E7:loc_631C0j
		xor	ax, ax
		mov	word ptr dword_70FB6+2,	ax
		mov	word ptr dword_70FB6, ax
		inc	ax
		cmp	[bp+arg_2], 0
		jnz	short loc_63147

loc_6313F:
		cmp	[bp+arg_0], 0

loc_63143:
		jnz	short loc_63147
		jmp	short loc_631AE
; ���������������������������������������������������������������������������

loc_63147:				; CODE XREF: File_ReadOrDelegateToPaged_630E7+56j
					; File_ReadOrDelegateToPaged_630E7:loc_63143j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_63153:
		mov	bx, [bp+arg_C]

loc_63156:
		mov	dx, word ptr [bp+arg_8]
		mov	cx, word ptr [bp+arg_8+2]

loc_6315C:
		cmp	cx, 0FFFFh
		jz	short loc_63168
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		jb	short loc_631AE

loc_63168:				; CODE XREF: File_ReadOrDelegateToPaged_630E7+78j
		mov	di, word ptr [bp+arg_4+2]
		mov	si, word ptr [bp+arg_4]

loc_6316E:				; CODE XREF: File_ReadOrDelegateToPaged_630E7+B8j
		or	di, di
		jnz	short loc_63178
		cmp	si, 0FFF0h
		jbe	short loc_631A1

loc_63178:				; CODE XREF: File_ReadOrDelegateToPaged_630E7+89j
		mov	cx, 0FFF0h
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ds
		jb	short loc_631AE
		add	word ptr dword_70FB6, ax
		adc	word ptr dword_70FB6+2,	0
		cmp	ax, 0

loc_63192:
		jz	short loc_631CB
		sub	si, ax
		sbb	di, 0
		shr	ax, 4
		add	word ptr [bp+var_4+2], ax
		jmp	short loc_6316E
; ���������������������������������������������������������������������������

loc_631A1:				; CODE XREF: File_ReadOrDelegateToPaged_630E7+8Fj
		mov	cx, si
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ds
		jnb	short loc_631CB

loc_631AE:				; CODE XREF: File_ReadOrDelegateToPaged_630E7+5Ej
					; File_ReadOrDelegateToPaged_630E7+7Fj ...
		or	ax, ax
		jnz	short loc_631B3

loc_631B2:
		inc	ax

loc_631B3:				; CODE XREF: File_ReadOrDelegateToPaged_630E7+C9j
		mov	word_70FBA, ax
		call	off_70FBC

loc_631BA:
		test	word_70FBA, 0FFFFh

loc_631C0:
		jz	loc_63130

loc_631C4:
		xor	ax, ax
		xor	dx, dx
		stc
		jmp	short loc_631DB
; ���������������������������������������������������������������������������

loc_631CB:				; CODE XREF: File_ReadOrDelegateToPaged_630E7:loc_63192j
					; File_ReadOrDelegateToPaged_630E7+C5j
		add	word ptr dword_70FB6, ax
		adc	word ptr dword_70FB6+2,	0

loc_631D4:
		mov	ax, word ptr dword_70FB6
		mov	dx, word ptr dword_70FB6+2

loc_631DB:				; CODE XREF: File_ReadOrDelegateToPaged_630E7:loc_6312Dj
					; File_ReadOrDelegateToPaged_630E7+E2j
		pop	cx
		pop	bx
		pop	di
		pop	si
		leave
		retf	0Eh
File_ReadOrDelegateToPaged_630E7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 138 lignes, NON DÉTAILLÉE — même motif que File_ReadOrDelegateToPaged_630E7 pour
; l'écriture : délègue à File_SeekAndWriteViaPagedMemory_63362 si la taille dépasse le seuil
; word_709D6. Référencée depuis seg192 et sub_A10C0.
; ==============================================================================================
File_WriteOrDelegateToPaged_631E3	proc far		; CODE XREF: seg192:006AP
					; SaveGame_WriteFile_A10C0:loc_A1155P

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h

		enter	4, 0
		push	si
		push	di
		mov	ax, word_709D6
		or	ax, ax
		jz	short loc_63211
		cmp	[bp+arg_2], ax
		jb	short loc_63211
		push	large dword ptr	[bp+6]
		push	large [bp+arg_4]
		push	large [bp+arg_8]
		push	[bp+arg_C]
		push	cs
		call	near ptr File_SeekAndWriteViaPagedMemory_63362
		add	sp, 0Eh
		pop	di
		pop	si
		leave
		retf	0Eh
; ���������������������������������������������������������������������������

loc_63211:				; CODE XREF: File_WriteOrDelegateToPaged_631E3+Bj
					; File_WriteOrDelegateToPaged_631E3+10j ...
		mov	ax, [bp+arg_0]
		mov	word ptr [bp+var_4], ax

loc_63217:
		mov	ax, [bp+arg_2]

loc_6321A:
		mov	word ptr [bp+var_4+2], ax

loc_6321D:
		mov	bx, [bp+arg_C]

loc_63220:
		mov	dx, word ptr [bp+arg_8]

loc_63223:
		mov	cx, word ptr [bp+arg_8+2]
		cmp	cx, 0FFFFh
		jz	short loc_63232
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		jb	short loc_63275

loc_63232:				; CODE XREF: File_WriteOrDelegateToPaged_631E3+46j
		mov	di, word ptr [bp+arg_4+2]

loc_63235:
		mov	si, word ptr [bp+arg_4]

loc_63238:				; CODE XREF: File_WriteOrDelegateToPaged_631E3+7Cj
		or	di, di
		jnz	short loc_63242
		cmp	si, 0FFF0h
		jbe	short loc_63261

loc_63242:				; CODE XREF: File_WriteOrDelegateToPaged_631E3+57j
		mov	cx, 0FFF0h
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		pop	ds
		jb	short loc_63275

loc_63250:
		cmp	ax, cx

loc_63252:
		jb	short loc_63272

loc_63254:
		sub	si, ax

loc_63256:
		sbb	di, 0
		shr	ax, 4
		add	word ptr [bp+var_4+2], ax
		jmp	short loc_63238
; ���������������������������������������������������������������������������

loc_63261:				; CODE XREF: File_WriteOrDelegateToPaged_631E3+5Dj
		mov	cx, si
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		pop	ds
		jb	short loc_63275
		cmp	ax, cx

loc_63270:
		jnb	short loc_6328B

loc_63272:				; CODE XREF: File_WriteOrDelegateToPaged_631E3:loc_63252j
		mov	ax, 0FFFFh

loc_63275:				; CODE XREF: File_WriteOrDelegateToPaged_631E3+4Dj
					; File_WriteOrDelegateToPaged_631E3+6Bj ...
		mov	word_70FBA, ax
		call	off_70FBC
		test	word_70FBA, 0FFFFh
		jnz	short loc_63286

loc_63284:
		jmp	short loc_63211
; ���������������������������������������������������������������������������

loc_63286:				; CODE XREF: File_WriteOrDelegateToPaged_631E3+9Fj
		xor	ax, ax
		stc
		jmp	short loc_6328E
; ���������������������������������������������������������������������������

loc_6328B:				; CODE XREF: File_WriteOrDelegateToPaged_631E3:loc_63270j
		mov	ax, 1

loc_6328E:				; CODE XREF: File_WriteOrDelegateToPaged_631E3+A6j
		pop	di
		pop	si
		leave
		retf	0Eh
File_WriteOrDelegateToPaged_631E3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 138 lignes, NON DÉTAILLÉE — positionne le pointeur fichier (int 21h LSEEK) puis lit
; via le système de mémoire paginée (sub_5BC94/sub_5BBCC, seg127, et int 15h) — support de
; lecture « gros fichier » au-delà de la limite conventionnelle. Appelée par
; File_ReadOrDelegateToPaged_630E7.
; ==============================================================================================
File_ReadViaPagedMemory_63294	proc far		; CODE XREF: File_ReadOrDelegateToPaged_630E7+24p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		enter	8, 0
		xor	eax, eax
		mov	word_70FBA, ax
		mov	dword_70FB6, eax
		mov	bx, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		cmp	cx, 0FFFFh
		jz	short loc_632B9
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		jb	loc_6333B

loc_632B9:				; CODE XREF: File_ReadViaPagedMemory_63294+1Aj
		push	large [bp+arg_A]
		call	PagedMemory_Helper_5BC94

loc_632C2:
		add	sp, 4
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf

loc_632D2:
		int	15h

loc_632D4:
		popf

loc_632D5:
		mov	edx, [bp+var_4]

loc_632D9:				; CODE XREF: File_ReadViaPagedMemory_63294+A5j
		mov	[bp+var_4], edx

loc_632DD:
		mov	ax, 4

loc_632E0:
		push	ax

loc_632E1:
		push	edx

loc_632E3:
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax

loc_632F1:
		movzx	ecx, dx

loc_632F5:
		shl	ecx, 4
		movzx	eax, ax
		add	ecx, eax
		sub	ecx, dword_709D8
		neg	cx
		dec	cx
		cmp	ecx, [bp+arg_6]
		jbe	short loc_63311
		mov	cx, word ptr [bp+arg_6]

loc_63311:				; CODE XREF: File_ReadViaPagedMemory_63294+78j
					; File_ReadViaPagedMemory_63294:loc_63348j
		mov	bx, [bp+arg_0]
		push	ds
		lds	dx, [bp+var_8]
		mov	ah, 3Fh

loc_6331A:				; DOS -	2+ - READ FROM FILE WITH HANDLE
		int	21h		; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer

loc_6331C:
		pop	ds
		jb	short loc_6333B
		movzx	eax, ax

loc_63323:
		add	dword_70FB6, eax
		cmp	ax, cx
		jb	short loc_6334B
		mov	edx, [bp+var_4]
		add	edx, eax

loc_63333:
		sub	[bp+arg_6], eax
		jz	short loc_6334B
		jmp	short loc_632D9
; ���������������������������������������������������������������������������

loc_6333B:				; CODE XREF: File_ReadViaPagedMemory_63294+21j
					; File_ReadViaPagedMemory_63294+89j
		mov	word_70FBA, ax

loc_6333E:
		call	off_70FBC

loc_63342:
		test	word_70FBA, 0FFFFh

loc_63348:
		jz	short loc_63311
		stc

loc_6334B:				; CODE XREF: File_ReadViaPagedMemory_63294+96j
					; File_ReadViaPagedMemory_63294+A3j
		pushf

loc_6334C:
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
		int	15h
		popf
		mov	eax, dword_70FB6
		shld	edx, eax, 10h

loc_6335F:
		popf
		leave
		retf
File_ReadViaPagedMemory_63294	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 135 lignes, NON DÉTAILLÉE — positionne le pointeur fichier (int 21h LSEEK, gère le
; cas offset -1 = position courante) puis écrit via le système de mémoire paginée (sub_5BC94,
; int 15h). Appelée par File_WriteOrDelegateToPaged_631E3.
; ==============================================================================================
File_SeekAndWriteViaPagedMemory_63362	proc far		; CODE XREF: File_WriteOrDelegateToPaged_631E3+22p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		enter	8, 0

loc_63366:
		xor	eax, eax
		mov	word_70FBA, ax
		mov	dword_70FB6, eax
		mov	bx, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		cmp	cx, 0FFFFh
		jz	short loc_63387

loc_6337E:
		mov	ax, 4200h

loc_63381:				; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
		int	21h		; AL = method: offset from beginning of	file

loc_63383:
		jb	loc_6340C

loc_63387:				; CODE XREF: File_SeekAndWriteViaPagedMemory_63362+1Aj
		push	large [bp+arg_A]
		call	PagedMemory_Helper_5BC94
		add	sp, 4
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		int	15h
		popf
		mov	edx, [bp+var_4]

loc_633A7:				; CODE XREF: File_SeekAndWriteViaPagedMemory_63362:loc_63407j
		mov	[bp+var_4], edx
		mov	ax, 4
		push	ax
		push	edx
		call	PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		movzx	ecx, dx
		shl	ecx, 4
		movzx	eax, ax
		add	ecx, eax
		sub	ecx, dword_709D8
		neg	cx
		dec	cx

loc_633D6:
		cmp	ecx, [bp+arg_6]
		jbe	short loc_633DF
		mov	cx, word ptr [bp+arg_6]

loc_633DF:				; CODE XREF: File_SeekAndWriteViaPagedMemory_63362+78j
					; File_SeekAndWriteViaPagedMemory_63362:loc_63419j
		mov	bx, [bp+arg_0]
		push	ds
		lds	dx, [bp+var_8]
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		pop	ds
		jb	short loc_6340C
		movzx	eax, ax
		add	dword_70FB6, eax
		cmp	ax, cx
		jb	short loc_63409
		mov	edx, [bp+var_4]

loc_633FE:
		add	edx, eax

loc_63401:
		sub	[bp+arg_6], eax
		jz	short loc_6341C

loc_63407:
		jmp	short loc_633A7
; ���������������������������������������������������������������������������

loc_63409:				; CODE XREF: File_SeekAndWriteViaPagedMemory_63362+96j
		mov	ax, 0FFFFh

loc_6340C:				; CODE XREF: File_SeekAndWriteViaPagedMemory_63362:loc_63383j
					; File_SeekAndWriteViaPagedMemory_63362+89j
		mov	word_70FBA, ax

loc_6340F:
		call	off_70FBC

loc_63413:
		test	word_70FBA, 0FFFFh

loc_63419:
		jz	short loc_633DF
		stc

loc_6341C:				; CODE XREF: File_SeekAndWriteViaPagedMemory_63362+A3j
		pushf
		mov	ax, 1209h

loc_63420:
		mov	bx, 534Dh

loc_63423:
		pushf
		int	15h

loc_63426:
		popf

loc_63427:
		mov	eax, dword_70FB6

loc_6342B:
		shld	edx, eax, 10h

loc_63430:
		popf
		leave
		retf
File_SeekAndWriteViaPagedMemory_63362	endp

seg185		ends
