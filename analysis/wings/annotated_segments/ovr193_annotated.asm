ovr193		segment	para public 'OVERLAY' use16
		assume cs:ovr193
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; SaveGame_WriteFile_B3490 (sub_B3490 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à SaveGame_WriteFile_A10C0 (sub_A10C0 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 126 lignes, NON DÉTAILLÉE —
; bascule le mode vidéo (sub_2962), crée un fichier (File_CreateWithRetry_630BA, seg184),
; écrit son contenu (File_WriteOrDelegateToPaged_631E3, seg185, avec support gros fichier via
; mémoire paginée) puis le ferme (File_CloseWithRetry_63463, seg186). Probable écriture d'une
; sauvegarde de partie.
; ==============================================================================================
SaveGame_WriteFile_6E740		proc far

var_146		= word ptr -146h
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 146h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, word_5D91C
		jz	short loc_6E769
		lea	ax, [bp+arg_4]
		mov	word ptr [bp+var_6+2], ax
		push	ax
		push	dx
		push	word_5D91C
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_6E769:
		push	ds
		push	word_5D91C
		call	Dos_Create_51BAE
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_6E780

loc_6E77C:
		xor	ax, ax
		jmp	short loc_6E7EF

loc_6E780:
		mov	di, [si+6]
		jmp	short loc_6E7DF

loc_6E785:
		mov	bx, word_5DD44
		mov	ax, [bx]
		mov	dx, di
		shl	dx, 1
		mov	bx, [bx+2]
		add	bx, dx
		mov	dx, [bx]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		mov	ax, [si+4]
		add	word ptr [bp+var_6], ax
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		push	large [bp+var_6]
		push	ss
		lea	ax, [bp+var_146]
		push	ax
		call	sub_3609
		add	sp, 0Ah
		push	[bp+var_2]
		push	large 0FFFFFFFFh
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		movsx	eax, ax
		push	eax
		push	ss
		lea	ax, [bp+var_146]
		push	ax
		call	sub_4570
		or	ax, dx
		jz	short loc_6E77C
		inc	di

loc_6E7DF:
		cmp	[si+0Ah], di
		jge	short loc_6E785
		push	[bp+var_2]
		call	sub_51C09
		mov	ax, 1

loc_6E7EF:
		pop	di
		pop	si
		leave
		retf
SaveGame_WriteFile_6E740		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; SaveGame_ReadFile_B3543 (sub_B3543 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à SaveGame_ReadFile_A1173 (sub_A1173 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 134 lignes, NON DÉTAILLÉE — pendant en
; lecture de SaveGame_WriteFile_A10C0 : bascule le mode vidéo, ouvre
; (File_OpenWithRetry_63434, seg186), lit (File_ReadOrDelegateToPaged_630E7, seg185) puis
; ferme (File_CloseWithRetry_63463) le fichier. Probable chargement d'une sauvegarde de
; partie.
; ==============================================================================================
SaveGame_ReadFile_6E7F3		proc far

var_146		= word ptr -146h
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 146h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, word_5D91C
		jz	short loc_6E81C
		lea	ax, [bp+arg_4]
		mov	word ptr [bp+var_6+2], ax
		push	ax
		push	dx
		push	word_5D91C
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_6E81C:
		push	ds
		push	word_5D91C
		push	2
		call	Dos_Open_51BDA
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_6E835

loc_6E831:
		xor	ax, ax
		jmp	short loc_6E8AE

loc_6E835:
		mov	di, [si+6]
		jmp	short loc_6E894

loc_6E83A:
		mov	bx, word_5DD44
		mov	ax, [bx]
		mov	dx, di
		shl	dx, 1
		mov	bx, [bx+2]
		add	bx, dx
		mov	dx, [bx]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		mov	ax, [si+4]
		add	word ptr [bp+var_6], ax
		push	[bp+var_2]
		push	large 0FFFFFFFFh
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		movsx	eax, ax
		push	eax
		push	ss
		lea	ax, [bp+var_146]
		push	ax
		call	sub_442A
		or	ax, dx
		jz	short loc_6E831
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		push	ss
		lea	ax, [bp+var_146]
		push	ax
		push	large [bp+var_6]
		call	sub_3609
		add	sp, 0Ah
		inc	di

loc_6E894:
		cmp	[si+0Ah], di
		jge	short loc_6E83A
		push	[bp+var_2]
		call	sub_51C09
		push	word_5D91C
		call	CRT_Unlink
		pop	cx
		mov	ax, 1

loc_6E8AE:
		pop	di
		pop	si
		leave
		retf
SaveGame_ReadFile_6E7F3		endp
ovr193		ends
