seg197		segment	byte public 'CODE' use16
		assume cs:seg197
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
word_65F20	dw 0			; DATA XREF: seg197:loc_65F7Er
					; LZW_ReadCode_65FCE+41r ...
word_65F22	dw 0			; DATA XREF: seg197:0048r
					; LZW_ReadCode_65FCE:loc_6601Ar	...
word_65F24	dw 0			; DATA XREF: LZW_Decompress_66068+18r
					; LZW_Decompress_66068+20r ...
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, word_7110D
		mov	bx, bp

loc_65F2D:
		sub	bx, 3

loc_65F30:
		add	bx, word_7110F

loc_65F34:
		mov	dx, word_710FA
		mov	ax, word_71111
		mov	cx, ax
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		add	ax, word_71109
		mov	word_71109, ax
		mov	ax, cx
		and	ax, 7
		mov	cx, ax

loc_65F51:
		add	ax, word_710F6
		mov	word_71113, ax

loc_65F58:
		push	cx
		push	ds

loc_65F5A:
		lds	ax, dword ptr word_71109
		mov	cx, ax
		cmp	ax, bx
		jb	short loc_65FA8
		mov	si, ds
		pop	ds
		push	ds
		test	cs:word_65F22, 0FFFFh
		jz	short loc_65F7E
		and	word_71111, 7
		pop	ds
		pop	cx
		pop	bp
		pop	ax
		pop	si
		pop	di
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_65F7E:				; CODE XREF: seg197:004Fj
		mov	ax, cs:word_65F20
		mov	word_71109, ax
		mov	word_7110F, ax
		mov	ds, si
		push	es
		push	ax
		push	ds
		pop	es
		assume es:seg339
		mov	di, ax
		mov	si, cx
		sub	cx, bp
		sub	ax, cx
		mov	cx, ax
		rep movsb

loc_65F9A:
		sub	bp, ax
		mov	cx, bp
		mov	bx, dx

loc_65FA0:
		mov	dx, di

loc_65FA2:
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ax

loc_65FA7:
		pop	es
		assume es:nothing

loc_65FA8:				; CODE XREF: seg197:0042j
		mov	si, ax
		lodsw
		mov	bx, ax

loc_65FAD:
		lodsb
		pop	ds
		pop	cx

loc_65FB0:
		jcxz	short loc_65FB8

loc_65FB2:				; CODE XREF: seg197:0096j
		shr	al, 1

loc_65FB4:
		rcr	bx, 1
		loop	loc_65FB2

loc_65FB8:				; CODE XREF: seg197:loc_65FB0j
		mov	ax, bx
		mov	bx, word_710F6
		shl	bx, 1
		and	ax, [bx+4053h]
		mov	bx, word_71113

loc_65FC8:
		mov	word_71111, bx
		pop	bp
		retn

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⭐ near, extraction d'un code à largeur variable depuis un flux de bits compressé
; (décalage/masquage sur des compteurs de position en bits) — brique de base d'un décodeur
; LZW. Appelée par LZW_Decompress_66068.
; ==============================================================================================
LZW_ReadCode_65FCE	proc near		; CODE XREF: LZW_Decompress_66068+48p
					; LZW_Decompress_66068:loc_660E9p
		push	bp
		mov	bp, word_7110D
		mov	bx, bp
		sub	bx, 3
		add	bx, word_7110F
		mov	dx, word_710FA
		mov	ax, word_71111

loc_65FE3:
		mov	cx, ax
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		add	ax, word_71109

loc_65FEF:
		mov	word_71109, ax

loc_65FF2:
		mov	ax, cx

loc_65FF4:
		and	ax, 7
		mov	cx, ax
		add	ax, word_710F6
		mov	word_71111, ax
		push	cx
		push	ds
		lds	ax, dword ptr word_71109
		mov	cx, ax
		cmp	ax, bx
		jl	short loc_6604A
		mov	si, ds
		pop	ds
		mov	ax, cs:word_65F20

loc_66013:
		mov	word_71109, ax
		mov	word_7110F, ax
		push	ds

loc_6601A:
		test	cs:word_65F22, 0FFFFh
		jz	short loc_6602A

loc_66023:
		add	sp, 8
		pop	si
		pop	di
		pop	bp
		retn
; ���������������������������������������������������������������������������

loc_6602A:				; CODE XREF: LZW_ReadCode_65FCE+53j
		mov	ds, si
		push	es
		push	ax
		push	ds
		pop	es
		assume es:seg339
		mov	di, ax

loc_66032:
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

loc_6604A:				; CODE XREF: LZW_ReadCode_65FCE+3Cj
		mov	si, ax
		lodsw
		mov	bx, ax
		lodsb
		pop	ds
		pop	cx
		jcxz	short loc_6605A

loc_66054:				; CODE XREF: LZW_ReadCode_65FCE+8Aj
		shr	al, 1
		rcr	bx, 1
		loop	loc_66054

loc_6605A:				; CODE XREF: LZW_ReadCode_65FCE+84j
		mov	ax, bx
		mov	bx, word_710F6
		shl	bx, 1
		and	ax, [bx+4053h]
		pop	bp
		retn
LZW_ReadCode_65FCE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; ⭐ far, 185 lignes, NON DÉTAILLÉE EN PROFONDEUR — décodeur LZW complet : initialise la
; largeur de code à 9 bits (word_710F6=9), la table à 512 entrées (word_710F8=0x200), le
; prochain code libre à 258 (word_710FC=0x102, soit 256 codes de base + code clear 256 + code
; fin 257), gère les codes spéciaux 0x100 (clear) et 0x101 (end-of-data). Appelée par
; IndexedRecordReader_ReadIndexTable_65B73 (seg196) — confirme que le format d'enregistrement
; structuré ResourceRecord peut contenir des données compressées LZW (probable pour textures
; ou grosses ressources). Candidat prioritaire pour session dédiée si le format de compression
; exact doit être confirmé.
; ==============================================================================================
LZW_Decompress_66068	proc far		; CODE XREF: IndexedRecordReader_ReadIndexTable_65B73+C6P
		push	bp
		push	di
		push	si
		mov	ax, word_71109
		mov	cs:word_65F20, ax
		mov	word_7110F, ax
		mov	ax, word_710F2
		mov	cs:word_65F22, ax
		mov	es, word_710FE
		cmp	cs:word_65F24, 1
		jz	short loc_660A9
		cmp	cs:word_65F24, 2
		jz	short loc_660E9
		cld

loc_66091:
		mov	word_710F6, 9

loc_66097:
		mov	word_710F8, 200h

loc_6609D:
		mov	word_710FC, 102h

loc_660A3:
		mov	word_710F4, 0

loc_660A9:				; CODE XREF: LZW_Decompress_66068+1Ej
					; LZW_Decompress_66068:loc_66103j	...
		mov	cs:word_65F24, 1
		call	LZW_ReadCode_65FCE

loc_660B3:
		cmp	ax, 101h
		jnz	short loc_660C9
		mov	word_710F2, 0

loc_660BE:
		mov	cs:word_65F24, 0
		pop	si
		pop	di
		pop	bp

locret_660C8:
		retf
; ���������������������������������������������������������������������������

loc_660C9:				; CODE XREF: LZW_Decompress_66068+4Ej
		cmp	ax, 100h
		jz	short loc_660D0
		jmp	short loc_66105
; ���������������������������������������������������������������������������

loc_660D0:				; CODE XREF: LZW_Decompress_66068+64j
		mov	word_710F6, 9

loc_660D6:
		mov	word_710F8, 200h
		mov	word_710FC, 102h
		mov	cs:word_65F24, 2

loc_660E9:				; CODE XREF: LZW_Decompress_66068+26j
		call	LZW_ReadCode_65FCE
		mov	word_71103, ax
		mov	byte_71102, al
		push	es
		les	di, dword ptr word_71105
		stosb
		pop	es
		inc	word_71105
		jnz	short loc_66103

loc_660FF:
		inc	seg_71107

loc_66103:				; CODE XREF: LZW_Decompress_66068+95j
		jmp	short loc_660A9
; ���������������������������������������������������������������������������

loc_66105:				; CODE XREF: LZW_Decompress_66068+66j
		mov	word_71100, ax

loc_66108:
		mov	bx, ax
		shl	bx, 1
		add	bx, ax
		cmp	ax, word_710FC
		jl	short loc_66128
		mov	al, byte_71102
		push	ax

loc_66118:
		inc	word_710F4
		mov	es:[bx+2], al
		mov	ax, word_71103

loc_66123:
		mov	es:[bx], ax
		jmp	short loc_66139
; ���������������������������������������������������������������������������

loc_66128:				; CODE XREF: LZW_Decompress_66068+AAj
					; LZW_Decompress_66068+D7j
		cmp	ax, 0FFh
		jle	short loc_66141
		mov	al, es:[bx+2]
		push	ax
		inc	word_710F4
		mov	ax, es:[bx]

loc_66139:				; CODE XREF: LZW_Decompress_66068+BEj
		mov	bx, ax
		shl	bx, 1
		add	bx, ax
		jmp	short loc_66128
; ���������������������������������������������������������������������������

loc_66141:				; CODE XREF: LZW_Decompress_66068+C3j
		mov	byte_71102, al
		push	ax

loc_66145:
		inc	word_710F4

loc_66149:
		mov	dx, es
		les	di, dword ptr word_71105

loc_6614F:
		mov	cx, word_710F4

loc_66153:
		jcxz	short loc_6616D
		mov	bx, es

loc_66157:				; CODE XREF: LZW_Decompress_66068:loc_66163j
		pop	ax
		stosb
		or	di, di
		jnz	short loc_66163
		add	bx, 1000h
		mov	es, bx
		assume es:nothing

loc_66163:				; CODE XREF: LZW_Decompress_66068+F3j
		loop	loc_66157
		mov	seg_71107, bx
		mov	word_71105, di

loc_6616D:				; CODE XREF: LZW_Decompress_66068:loc_66153j
		mov	word_710F4, cx
		mov	es, dx
		assume es:nothing
		mov	ax, word_710FC
		mov	bx, ax
		shl	ax, 1
		add	bx, ax
		mov	al, byte_71102
		mov	es:[bx+2], al
		mov	ax, word_71103
		mov	es:[bx], ax
		inc	word_710FC
		mov	ax, word_71100

loc_66190:
		mov	word_71103, ax
		mov	bx, word_710FC

loc_66197:
		cmp	bx, word_710F8
		jl	short loc_661AC

loc_6619D:
		cmp	word_710F6, 0Ch

loc_661A2:
		jz	short loc_661AC
		inc	word_710F6
		shl	word_710F8, 1

loc_661AC:				; CODE XREF: LZW_Decompress_66068+133j
					; LZW_Decompress_66068:loc_661A2j
		jmp	loc_660A9
LZW_Decompress_66068	endp

seg197		ends
