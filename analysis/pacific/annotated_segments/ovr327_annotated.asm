ovr327		segment	para public 'OVERLAY' use16
		assume cs:ovr327
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; SaveGame_WriteFile_A10C0 (sub_A10C0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — ⚠️ far, 126 lignes, NON DÉTAILLÉE — bascule le mode vidéo
; (sub_2962), crée un fichier (File_CreateWithRetry_630BA, seg184), écrit son contenu
; (File_WriteOrDelegateToPaged_631E3, seg185, avec support gros fichier via mémoire paginée)
; puis le ferme (File_CloseWithRetry_63463, seg186). Probable écriture d'une sauvegarde de
; partie.
; ==============================================================================================
SaveGame_WriteFile_B3490		proc far

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
		cmp	dx, word_7AB7A
		jz	short loc_B34B9
		lea	ax, [bp+arg_4]
		mov	word ptr [bp+var_6+2], ax
		push	ax
		push	dx
		push	word_7AB7A
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_B34B9:
		push	ds
		push	word_7AB7A
		call	sub_6B3BA
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_B34D0

loc_B34CC:
		xor	ax, ax
		jmp	short loc_B353F

loc_B34D0:
		mov	di, [si+6]
		jmp	short loc_B352F

loc_B34D5:
		mov	bx, word_7AF7E
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
		call	sub_37C3
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
		call	sub_45D8
		or	ax, dx
		jz	short loc_B34CC
		inc	di

loc_B352F:
		cmp	[si+0Ah], di
		jge	short loc_B34D5
		push	[bp+var_2]
		call	sub_6B415
		mov	ax, 1

loc_B353F:
		pop	di
		pop	si
		leave
		retf
SaveGame_WriteFile_B3490		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à SaveGame_ReadFile_A1173
; (sub_A1173 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⚠️ far, 134 lignes, NON DÉTAILLÉE — pendant en lecture de SaveGame_WriteFile_A10C0 :
; bascule le mode vidéo, ouvre (File_OpenWithRetry_63434, seg186), lit
; (File_ReadOrDelegateToPaged_630E7, seg185) puis ferme (File_CloseWithRetry_63463) le
; fichier. Probable chargement d'une sauvegarde de partie.
; ==============================================================================================
SaveGame_ReadFile_B3543		proc far

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
		cmp	dx, word_7AB7A
		jz	short loc_B356C
		lea	ax, [bp+arg_4]
		mov	word ptr [bp+var_6+2], ax
		push	ax
		push	dx
		push	word_7AB7A
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_B356C:
		push	ds
		push	word_7AB7A
		push	2
		call	File_OpenWithRetry_6B3E6
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_B3585

loc_B3581:
		xor	ax, ax
		jmp	short loc_B35FE

loc_B3585:
		mov	di, [si+6]
		jmp	short loc_B35E4

loc_B358A:
		mov	bx, word_7AF7E
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
		call	sub_4492
		or	ax, dx
		jz	short loc_B3581
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		push	ss
		lea	ax, [bp+var_146]
		push	ax
		push	large [bp+var_6]
		call	sub_37C3
		add	sp, 0Ah
		inc	di

loc_B35E4:
		cmp	[si+0Ah], di
		jge	short loc_B358A
		push	[bp+var_2]
		call	sub_6B415
		push	word_7AB7A
		call	CRT_Unlink
		pop	cx
		mov	ax, 1

loc_B35FE:
		pop	di
		pop	si
		leave
		retf
SaveGame_ReadFile_B3543		endp
ovr327		ends
