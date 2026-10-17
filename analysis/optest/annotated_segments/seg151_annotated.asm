seg151		segment	byte public 'CODE' use16
		assume cs:seg151
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
word_3D790	dw 0			; DATA XREF: seg151:loc_3D7EEr
					; LZW_ReadCode_3D83E+41r ...
word_3D792	dw 0			; DATA XREF: seg151:0048r
					; LZW_ReadCode_3D83E+4Cr ...
word_3D794	dw 0			; DATA XREF: LZW_Decompress_3D8D8+18r
					; LZW_Decompress_3D8D8+20r ...
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, word_47A03
		mov	bx, bp
		sub	bx, 3
		add	bx, word_47A05
		mov	dx, word_479F0
		mov	ax, word_47A07
		mov	cx, ax
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		add	ax, word_479FF
		mov	word_479FF, ax
		mov	ax, cx
		and	ax, 7
		mov	cx, ax
		add	ax, word_479EC
		mov	word_47A09, ax
		push	cx
		push	ds
		lds	ax, dword ptr word_479FF
		mov	cx, ax
		cmp	ax, bx
		jb	short loc_3D818
		mov	si, ds
		pop	ds
		push	ds
		test	cs:word_3D792, 0FFFFh
		jz	short loc_3D7EE
		and	word_47A07, 7
		pop	ds
		pop	cx
		pop	bp
		pop	ax
		pop	si
		pop	di
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3D7EE:				; CODE XREF: seg151:004Fj
		mov	ax, cs:word_3D790
		mov	word_479FF, ax
		mov	word_47A05, ax
		mov	ds, si
		push	es
		push	ax
		push	ds
		pop	es
		assume es:dseg
		mov	di, ax
		mov	si, cx
		sub	cx, bp
		sub	ax, cx
		mov	cx, ax
		rep movsb
		sub	bp, ax
		mov	cx, bp
		mov	bx, dx
		mov	dx, di
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ax
		pop	es
		assume es:nothing

loc_3D818:				; CODE XREF: seg151:0042j
		mov	si, ax
		lodsw
		mov	bx, ax
		lodsb
		pop	ds
		pop	cx
		jcxz	short loc_3D828

loc_3D822:				; CODE XREF: seg151:0096j
		shr	al, 1
		rcr	bx, 1
		loop	loc_3D822

loc_3D828:				; CODE XREF: seg151:0090j
		mov	ax, bx
		mov	bx, word_479EC
		shl	bx, 1
		and	ax, [bx+49D9h]
		mov	bx, word_47A09
		mov	word_47A07, bx
		pop	bp
		retn

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LZW_ReadCode_65FCE (sub_65FCE de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ near, extraction d'un
; code à largeur variable depuis un flux de bits compressé (décalage/masquage sur des
; compteurs de position en bits) — brique de base d'un décodeur LZW. Appelée par
; LZW_Decompress_66068.
; ==============================================================================================
LZW_ReadCode_3D83E	proc near		; CODE XREF: LZW_Decompress_3D8D8+48p
					; LZW_Decompress_3D8D8:loc_3D959p
		push	bp
		mov	bp, word_47A03
		mov	bx, bp
		sub	bx, 3
		add	bx, word_47A05
		mov	dx, word_479F0
		mov	ax, word_47A07
		mov	cx, ax
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		add	ax, word_479FF
		mov	word_479FF, ax
		mov	ax, cx
		and	ax, 7
		mov	cx, ax
		add	ax, word_479EC
		mov	word_47A07, ax
		push	cx
		push	ds
		lds	ax, dword ptr word_479FF
		mov	cx, ax
		cmp	ax, bx
		jl	short loc_3D8BA
		mov	si, ds
		pop	ds
		mov	ax, cs:word_3D790
		mov	word_479FF, ax
		mov	word_47A05, ax
		push	ds
		test	cs:word_3D792, 0FFFFh
		jz	short loc_3D89A
		add	sp, 8
		pop	si
		pop	di
		pop	bp
		retn
; ���������������������������������������������������������������������������

loc_3D89A:				; CODE XREF: LZW_ReadCode_3D83E+53j
		mov	ds, si
		push	es
		push	ax
		push	ds
		pop	es
		assume es:dseg
		mov	di, ax
		mov	si, cx
		sub	cx, bp
		sub	ax, cx
		mov	cx, ax
		rep movsb
		sub	bp, ax
		mov	cx, bp
		mov	bx, dx
		mov	dx, di
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ax
		pop	es
		assume es:nothing

loc_3D8BA:				; CODE XREF: LZW_ReadCode_3D83E+3Cj
		mov	si, ax
		lodsw
		mov	bx, ax
		lodsb
		pop	ds
		pop	cx
		jcxz	short loc_3D8CA

loc_3D8C4:				; CODE XREF: LZW_ReadCode_3D83E+8Aj
		shr	al, 1
		rcr	bx, 1
		loop	loc_3D8C4

loc_3D8CA:				; CODE XREF: LZW_ReadCode_3D83E+84j
		mov	ax, bx
		mov	bx, word_479EC
		shl	bx, 1
		and	ax, [bx+49D9h]
		pop	bp
		retn
LZW_ReadCode_3D83E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LZW_Decompress_66068 (sub_66068 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, 185 lignes, NON
; DÉTAILLÉE EN PROFONDEUR — décodeur LZW complet : initialise la largeur de code à 9 bits
; (word_710F6=9), la table à 512 entrées (word_710F8=0x200), le prochain code libre à 258
; (word_710FC=0x102, soit 256 codes de base + code clear 256 + code fin 257), gère les codes
; spéciaux 0x100 (clear) et 0x101 (end-of-data). Appelée par
; IndexedRecordReader_ReadIndexTable_65B73 (seg196) — confirme que le format d'enregistrement
; structuré ResourceRecord peut contenir des données compressées LZW (probable pour textures
; ou grosses ressources). Candidat prioritaire pour session dédiée si le format de compression
; exact doit être confirmé.
; ==============================================================================================
LZW_Decompress_3D8D8	proc far		; CODE XREF: IndexedRecordReader_ReadIndexTable_3D3E3+C6P
		push	bp
		push	di
		push	si
		mov	ax, word_479FF
		mov	cs:word_3D790, ax
		mov	word_47A05, ax
		mov	ax, word_479E8
		mov	cs:word_3D792, ax
		mov	es, word_479F4
		cmp	cs:word_3D794, 1
		jz	short loc_3D919
		cmp	cs:word_3D794, 2
		jz	short loc_3D959
		cld
		mov	word_479EC, 9
		mov	word_479EE, 200h
		mov	word_479F2, 102h
		mov	word_479EA, 0

loc_3D919:				; CODE XREF: LZW_Decompress_3D8D8+1Ej
					; LZW_Decompress_3D8D8:loc_3D973j	...
		mov	cs:word_3D794, 1
		call	LZW_ReadCode_3D83E
		cmp	ax, 101h
		jnz	short loc_3D939
		mov	word_479E8, 0
		mov	cs:word_3D794, 0
		pop	si
		pop	di
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3D939:				; CODE XREF: LZW_Decompress_3D8D8+4Ej
		cmp	ax, 100h
		jz	short loc_3D940
		jmp	short loc_3D975
; ���������������������������������������������������������������������������

loc_3D940:				; CODE XREF: LZW_Decompress_3D8D8+64j
		mov	word_479EC, 9
		mov	word_479EE, 200h
		mov	word_479F2, 102h
		mov	cs:word_3D794, 2

loc_3D959:				; CODE XREF: LZW_Decompress_3D8D8+26j
		call	LZW_ReadCode_3D83E
		mov	word_479F9, ax
		mov	byte_479F8, al
		push	es
		les	di, dword ptr word_479FB
		stosb
		pop	es
		inc	word_479FB
		jnz	short loc_3D973
		inc	seg_479FD

loc_3D973:				; CODE XREF: LZW_Decompress_3D8D8+95j
		jmp	short loc_3D919
; ���������������������������������������������������������������������������

loc_3D975:				; CODE XREF: LZW_Decompress_3D8D8+66j
		mov	word_479F6, ax
		mov	bx, ax
		shl	bx, 1
		add	bx, ax
		cmp	ax, word_479F2
		jl	short loc_3D998
		mov	al, byte_479F8
		push	ax
		inc	word_479EA
		mov	es:[bx+2], al
		mov	ax, word_479F9
		mov	es:[bx], ax
		jmp	short loc_3D9A9
; ���������������������������������������������������������������������������

loc_3D998:				; CODE XREF: LZW_Decompress_3D8D8+AAj
					; LZW_Decompress_3D8D8+D7j
		cmp	ax, 0FFh
		jle	short loc_3D9B1
		mov	al, es:[bx+2]
		push	ax
		inc	word_479EA
		mov	ax, es:[bx]

loc_3D9A9:				; CODE XREF: LZW_Decompress_3D8D8+BEj
		mov	bx, ax
		shl	bx, 1
		add	bx, ax
		jmp	short loc_3D998
; ���������������������������������������������������������������������������

loc_3D9B1:				; CODE XREF: LZW_Decompress_3D8D8+C3j
		mov	byte_479F8, al
		push	ax
		inc	word_479EA
		mov	dx, es
		les	di, dword ptr word_479FB
		mov	cx, word_479EA
		jcxz	short loc_3D9DD
		mov	bx, es

loc_3D9C7:				; CODE XREF: LZW_Decompress_3D8D8:loc_3D9D3j
		pop	ax
		stosb
		or	di, di
		jnz	short loc_3D9D3
		add	bx, 1000h
		mov	es, bx
		assume es:nothing

loc_3D9D3:				; CODE XREF: LZW_Decompress_3D8D8+F3j
		loop	loc_3D9C7
		mov	seg_479FD, bx
		mov	word_479FB, di

loc_3D9DD:				; CODE XREF: LZW_Decompress_3D8D8+EBj
		mov	word_479EA, cx
		mov	es, dx
		assume es:nothing
		mov	ax, word_479F2
		mov	bx, ax
		shl	ax, 1
		add	bx, ax
		mov	al, byte_479F8
		mov	es:[bx+2], al
		mov	ax, word_479F9
		mov	es:[bx], ax
		inc	word_479F2
		mov	ax, word_479F6
		mov	word_479F9, ax
		mov	bx, word_479F2
		cmp	bx, word_479EE
		jl	short loc_3DA1C
		cmp	word_479EC, 0Ch
		jz	short loc_3DA1C
		inc	word_479EC
		shl	word_479EE, 1

loc_3DA1C:				; CODE XREF: LZW_Decompress_3D8D8+133j
					; LZW_Decompress_3D8D8+13Aj
		jmp	loc_3D919
LZW_Decompress_3D8D8	endp

seg151		ends
