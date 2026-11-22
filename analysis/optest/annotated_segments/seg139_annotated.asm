seg139		segment	byte public 'CODE' use16
		assume cs:seg139
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_5. PRESS KEYPAD "+" TO EXPAND]

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; File_ReadOrDelegateToPaged_630E7 (sub_630E7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 188 lignes, NON DÉTAILLÉE — vérifie une
; taille demandée contre un seuil global (word_709D6) ; si dépassé, délègue à
; File_ReadViaPagedMemory_63294, sinon effectue une lecture conventionnelle (LSEEK+read).
; Référencée par sub_64353 et sub_A1173.
; ==============================================================================================
File_ReadOrDelegateToPaged_3A957	proc far		; CODE XREF: FileStream_Method_Read_3BBC3+27P
					; sub_BEFD9+87P
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
		mov	ax, word_46AB8
		or	ax, ax
		jz	short loc_3A989
		cmp	[bp+arg_2], ax
		jb	short loc_3A989
		push	large dword ptr	[bp+6]
		push	large [bp+arg_4]
		push	large [bp+arg_8]
		push	[bp+arg_C]
		push	cs
		call	near ptr File_ReadViaPagedMemory_3AB04
		add	sp, 0Eh
		pop	cx
		pop	bx
		pop	di
		pop	si
		leave
		retf	0Eh
; ���������������������������������������������������������������������������

loc_3A989:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+Dj
					; File_ReadOrDelegateToPaged_3A957+12j
		mov	word_478B0, 0
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		cmp	ax, 0
		jnz	short loc_3A9A0
		clc
		xor	dx, dx
		jmp	loc_3AA4B
; ���������������������������������������������������������������������������

loc_3A9A0:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+41j
					; File_ReadOrDelegateToPaged_3A957+D9j
		xor	ax, ax
		mov	word ptr dword_478AC+2,	ax
		mov	word ptr dword_478AC, ax
		inc	ax
		cmp	[bp+arg_2], 0
		jnz	short loc_3A9B7
		cmp	[bp+arg_0], 0
		jnz	short loc_3A9B7
		jmp	short loc_3AA1E
; ���������������������������������������������������������������������������

loc_3A9B7:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+56j
					; File_ReadOrDelegateToPaged_3A957+5Cj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	bx, [bp+arg_C]
		mov	dx, word ptr [bp+arg_8]
		mov	cx, word ptr [bp+arg_8+2]
		cmp	cx, 0FFFFh
		jz	short loc_3A9D8
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		jb	short loc_3AA1E

loc_3A9D8:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+78j
		mov	di, word ptr [bp+arg_4+2]
		mov	si, word ptr [bp+arg_4]

loc_3A9DE:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+B8j
		or	di, di
		jnz	short loc_3A9E8
		cmp	si, 0FFF0h
		jbe	short loc_3AA11

loc_3A9E8:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+89j
		mov	cx, 0FFF0h
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ds
		jb	short loc_3AA1E
		add	word ptr dword_478AC, ax
		adc	word ptr dword_478AC+2,	0
		cmp	ax, 0
		jz	short loc_3AA3B
		sub	si, ax
		sbb	di, 0
		shr	ax, 4
		add	word ptr [bp+var_4+2], ax
		jmp	short loc_3A9DE
; ���������������������������������������������������������������������������

loc_3AA11:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+8Fj
		mov	cx, si
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ds
		jnb	short loc_3AA3B

loc_3AA1E:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+5Ej
					; File_ReadOrDelegateToPaged_3A957+7Fj ...
		or	ax, ax
		jnz	short loc_3AA23
		inc	ax

loc_3AA23:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+C9j
		mov	word_478B0, ax
		call	off_478B2
		test	word_478B0, 0FFFFh
		jz	loc_3A9A0
		xor	ax, ax
		xor	dx, dx
		stc
		jmp	short loc_3AA4B
; ���������������������������������������������������������������������������

loc_3AA3B:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+ABj
					; File_ReadOrDelegateToPaged_3A957+C5j
		add	word ptr dword_478AC, ax
		adc	word ptr dword_478AC+2,	0
		mov	ax, word ptr dword_478AC
		mov	dx, word ptr dword_478AC+2

loc_3AA4B:				; CODE XREF: File_ReadOrDelegateToPaged_3A957+46j
					; File_ReadOrDelegateToPaged_3A957+E2j
		pop	cx
		pop	bx
		pop	di
		pop	si
		leave
		retf	0Eh
File_ReadOrDelegateToPaged_3A957	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; File_WriteOrDelegateToPaged_631E3 (sub_631E3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 138 lignes, NON DÉTAILLÉE — même motif que
; File_ReadOrDelegateToPaged_630E7 pour l'écriture : délègue à
; File_SeekAndWriteViaPagedMemory_63362 si la taille dépasse le seuil word_709D6. Référencée
; depuis seg192 et sub_A10C0.
; ==============================================================================================
File_WriteOrDelegateToPaged_3AA53	proc far		; CODE XREF: seg146:006AP
					; sub_BEF10+A1P

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h

		enter	4, 0
		push	si
		push	di
		mov	ax, word_46AB8
		or	ax, ax
		jz	short loc_3AA81
		cmp	[bp+arg_2], ax
		jb	short loc_3AA81
		push	large dword ptr	[bp+6]
		push	large [bp+arg_4]
		push	large [bp+arg_8]
		push	[bp+arg_C]
		push	cs
		call	near ptr File_SeekAndWriteViaPagedMemory_3ABD2
		add	sp, 0Eh
		pop	di
		pop	si
		leave
		retf	0Eh
; ���������������������������������������������������������������������������

loc_3AA81:				; CODE XREF: File_WriteOrDelegateToPaged_3AA53+Bj
					; File_WriteOrDelegateToPaged_3AA53+10j ...
		mov	ax, [bp+arg_0]
		mov	word ptr [bp+var_4], ax
		mov	ax, [bp+arg_2]
		mov	word ptr [bp+var_4+2], ax
		mov	bx, [bp+arg_C]
		mov	dx, word ptr [bp+arg_8]
		mov	cx, word ptr [bp+arg_8+2]
		cmp	cx, 0FFFFh
		jz	short loc_3AAA2
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		jb	short loc_3AAE5

loc_3AAA2:				; CODE XREF: File_WriteOrDelegateToPaged_3AA53+46j
		mov	di, word ptr [bp+arg_4+2]
		mov	si, word ptr [bp+arg_4]

loc_3AAA8:				; CODE XREF: File_WriteOrDelegateToPaged_3AA53+7Cj
		or	di, di
		jnz	short loc_3AAB2
		cmp	si, 0FFF0h
		jbe	short loc_3AAD1

loc_3AAB2:				; CODE XREF: File_WriteOrDelegateToPaged_3AA53+57j
		mov	cx, 0FFF0h
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		pop	ds
		jb	short loc_3AAE5
		cmp	ax, cx
		jb	short loc_3AAE2
		sub	si, ax
		sbb	di, 0
		shr	ax, 4
		add	word ptr [bp+var_4+2], ax
		jmp	short loc_3AAA8
; ���������������������������������������������������������������������������

loc_3AAD1:				; CODE XREF: File_WriteOrDelegateToPaged_3AA53+5Dj
		mov	cx, si
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		pop	ds
		jb	short loc_3AAE5
		cmp	ax, cx
		jnb	short loc_3AAFB

loc_3AAE2:				; CODE XREF: File_WriteOrDelegateToPaged_3AA53+6Fj
		mov	ax, 0FFFFh

loc_3AAE5:				; CODE XREF: File_WriteOrDelegateToPaged_3AA53+4Dj
					; File_WriteOrDelegateToPaged_3AA53+6Bj ...
		mov	word_478B0, ax
		call	off_478B2
		test	word_478B0, 0FFFFh
		jnz	short loc_3AAF6
		jmp	short loc_3AA81
; ���������������������������������������������������������������������������

loc_3AAF6:				; CODE XREF: File_WriteOrDelegateToPaged_3AA53+9Fj
		xor	ax, ax
		stc
		jmp	short loc_3AAFE
; ���������������������������������������������������������������������������

loc_3AAFB:				; CODE XREF: File_WriteOrDelegateToPaged_3AA53+8Dj
		mov	ax, 1

loc_3AAFE:				; CODE XREF: File_WriteOrDelegateToPaged_3AA53+A6j
		pop	di
		pop	si
		leave
		retf	0Eh
File_WriteOrDelegateToPaged_3AA53	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; File_ReadViaPagedMemory_63294 (sub_63294 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 138 lignes, NON DÉTAILLÉE — positionne le
; pointeur fichier (int 21h LSEEK) puis lit via le système de mémoire paginée
; (sub_5BC94/sub_5BBCC, seg127, et int 15h) — support de lecture « gros fichier » au-delà de
; la limite conventionnelle. Appelée par File_ReadOrDelegateToPaged_630E7.
; ==============================================================================================
File_ReadViaPagedMemory_3AB04	proc far		; CODE XREF: File_ReadOrDelegateToPaged_3A957+24p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		enter	8, 0
		xor	eax, eax
		mov	word_478B0, ax
		mov	dword_478AC, eax
		mov	bx, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		cmp	cx, 0FFFFh
		jz	short loc_3AB29
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		jb	loc_3ABAB

loc_3AB29:				; CODE XREF: File_ReadViaPagedMemory_3AB04+1Aj
		push	large [bp+arg_A]
		call	PagedMemory_Helper_2AD82
		add	sp, 4
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		int	15h
		popf
		mov	edx, [bp+var_4]

loc_3AB49:				; CODE XREF: File_ReadViaPagedMemory_3AB04+A5j
		mov	[bp+var_4], edx
		mov	ax, 4
		push	ax
		push	edx
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		movzx	ecx, dx
		shl	ecx, 4
		movzx	eax, ax
		add	ecx, eax
		sub	ecx, dword_46ABA
		neg	cx
		dec	cx
		cmp	ecx, [bp+arg_6]
		jbe	short loc_3AB81
		mov	cx, word ptr [bp+arg_6]

loc_3AB81:				; CODE XREF: File_ReadViaPagedMemory_3AB04+78j
					; File_ReadViaPagedMemory_3AB04+B4j
		mov	bx, [bp+arg_0]
		push	ds
		lds	dx, [bp+var_8]
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ds
		jb	short loc_3ABAB
		movzx	eax, ax
		add	dword_478AC, eax
		cmp	ax, cx
		jb	short loc_3ABBB
		mov	edx, [bp+var_4]
		add	edx, eax
		sub	[bp+arg_6], eax
		jz	short loc_3ABBB
		jmp	short loc_3AB49
; ���������������������������������������������������������������������������

loc_3ABAB:				; CODE XREF: File_ReadViaPagedMemory_3AB04+21j
					; File_ReadViaPagedMemory_3AB04+89j
		mov	word_478B0, ax
		call	off_478B2
		test	word_478B0, 0FFFFh
		jz	short loc_3AB81
		stc

loc_3ABBB:				; CODE XREF: File_ReadViaPagedMemory_3AB04+96j
					; File_ReadViaPagedMemory_3AB04+A3j
		pushf
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
		int	15h
		popf
		mov	eax, dword_478AC
		shld	edx, eax, 10h
		popf
		leave
		retf
File_ReadViaPagedMemory_3AB04	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; File_SeekAndWriteViaPagedMemory_63362 (sub_63362 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 135 lignes, NON DÉTAILLÉE — positionne
; le pointeur fichier (int 21h LSEEK, gère le cas offset -1 = position courante) puis écrit
; via le système de mémoire paginée (sub_5BC94, int 15h). Appelée par
; File_WriteOrDelegateToPaged_631E3.
; ==============================================================================================
File_SeekAndWriteViaPagedMemory_3ABD2	proc far		; CODE XREF: File_WriteOrDelegateToPaged_3AA53+22p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		enter	8, 0
		xor	eax, eax
		mov	word_478B0, ax
		mov	dword_478AC, eax
		mov	bx, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		cmp	cx, 0FFFFh
		jz	short loc_3ABF7
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		jb	loc_3AC7C

loc_3ABF7:				; CODE XREF: File_SeekAndWriteViaPagedMemory_3ABD2+1Aj
		push	large [bp+arg_A]
		call	PagedMemory_Helper_2AD82
		add	sp, 4
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		int	15h
		popf
		mov	edx, [bp+var_4]

loc_3AC17:				; CODE XREF: File_SeekAndWriteViaPagedMemory_3ABD2+A5j
		mov	[bp+var_4], edx
		mov	ax, 4
		push	ax
		push	edx
		call	PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		movzx	ecx, dx
		shl	ecx, 4
		movzx	eax, ax
		add	ecx, eax
		sub	ecx, dword_46ABA
		neg	cx
		dec	cx
		cmp	ecx, [bp+arg_6]
		jbe	short loc_3AC4F
		mov	cx, word ptr [bp+arg_6]

loc_3AC4F:				; CODE XREF: File_SeekAndWriteViaPagedMemory_3ABD2+78j
					; File_SeekAndWriteViaPagedMemory_3ABD2+B7j
		mov	bx, [bp+arg_0]
		push	ds
		lds	dx, [bp+var_8]
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		pop	ds
		jb	short loc_3AC7C
		movzx	eax, ax
		add	dword_478AC, eax
		cmp	ax, cx
		jb	short loc_3AC79
		mov	edx, [bp+var_4]
		add	edx, eax
		sub	[bp+arg_6], eax
		jz	short loc_3AC8C
		jmp	short loc_3AC17
; ���������������������������������������������������������������������������

loc_3AC79:				; CODE XREF: File_SeekAndWriteViaPagedMemory_3ABD2+96j
		mov	ax, 0FFFFh

loc_3AC7C:				; CODE XREF: File_SeekAndWriteViaPagedMemory_3ABD2+21j
					; File_SeekAndWriteViaPagedMemory_3ABD2+89j
		mov	word_478B0, ax
		call	off_478B2
		test	word_478B0, 0FFFFh
		jz	short loc_3AC4F
		stc

loc_3AC8C:				; CODE XREF: File_SeekAndWriteViaPagedMemory_3ABD2+A3j
		pushf
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
		int	15h
		popf
		mov	eax, dword_478AC
		shld	edx, eax, 10h
		popf
		leave
		retf
File_SeekAndWriteViaPagedMemory_3ABD2	endp

seg139		ends
