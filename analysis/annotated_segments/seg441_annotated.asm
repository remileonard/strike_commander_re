seg441		segment	para public 'OVERLAY' use16
		assume cs:seg441
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 126 lignes, NON DÉTAILLÉE — bascule le mode vidéo (sub_2962), crée un fichier
; (File_CreateWithRetry_630BA, seg184), écrit son contenu (File_WriteOrDelegateToPaged_631E3,
; seg185, avec support gros fichier via mémoire paginée) puis le ferme
; (File_CloseWithRetry_63463, seg186). Probable écriture d'une sauvegarde de partie.
; ==============================================================================================
SaveGame_WriteFile_A10C0	proc far		; CODE XREF: VROOMM_StubThunk_6C700J

var_146		= word ptr -146h
var_6		= dword	ptr -6
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
		cmp	dx, word_70EA2
		jz	short loc_A10E9

loc_A10D5:
		lea	ax, [bp+arg_4]
		mov	word ptr [bp+var_6+2], ax
		push	ax
		push	dx

loc_A10DD:
		push	word_70EA2

loc_A10E1:
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_A10E9:				; CODE XREF: SaveGame_WriteFile_A10C0+13j
		push	ds
		push	word_70EA2
		call	File_CreateWithRetry_630BA
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_A1100

loc_A10FC:				; CODE XREF: SaveGame_WriteFile_A10C0:loc_A115Cj
		xor	ax, ax
		jmp	short loc_A116F
; ���������������������������������������������������������������������������

loc_A1100:				; CODE XREF: SaveGame_WriteFile_A10C0+3Aj
		mov	di, [si+6]
		jmp	short loc_A115F
; ���������������������������������������������������������������������������

loc_A1105:				; CODE XREF: SaveGame_WriteFile_A10C0:loc_A1162j
		mov	bx, word_70E62
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

loc_A1122:
		mov	ax, [si+8]
		sub	ax, [si+4]

loc_A1128:
		inc	ax
		push	ax

loc_A112A:
		push	large [bp+var_6]
		push	ss

loc_A112F:
		lea	ax, [bp+var_146]
		push	ax

loc_A1134:
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		push	[bp+var_2]
		push	large 0FFFFFFFFh
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		movsx	eax, ax
		push	eax
		push	ss

loc_A1150:
		lea	ax, [bp+var_146]
		push	ax

loc_A1155:
		call	File_WriteOrDelegateToPaged_631E3
		or	ax, dx

loc_A115C:
		jz	short loc_A10FC
		inc	di

loc_A115F:				; CODE XREF: SaveGame_WriteFile_A10C0+43j
		cmp	[si+0Ah], di

loc_A1162:
		jge	short loc_A1105

loc_A1164:
		push	[bp+var_2]
		call	File_CloseWithRetry_63463

loc_A116C:
		mov	ax, 1

loc_A116F:				; CODE XREF: SaveGame_WriteFile_A10C0+3Ej
		pop	di

loc_A1170:
		pop	si
		leave

locret_A1172:
		retf
SaveGame_WriteFile_A10C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 134 lignes, NON DÉTAILLÉE — pendant en lecture de SaveGame_WriteFile_A10C0 : bascule
; le mode vidéo, ouvre (File_OpenWithRetry_63434, seg186), lit
; (File_ReadOrDelegateToPaged_630E7, seg185) puis ferme (File_CloseWithRetry_63463) le
; fichier. Probable chargement d'une sauvegarde de partie.
; ==============================================================================================
SaveGame_ReadFile_A1173	proc far		; CODE XREF: VROOMM_StubThunk_6C705J

var_146		= word ptr -146h
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp

loc_A1174:
		mov	bp, sp

loc_A1176:
		sub	sp, 146h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]

loc_A1182:
		cmp	dx, word_70EA2
		jz	short loc_A119C
		lea	ax, [bp+arg_4]
		mov	word ptr [bp+var_6+2], ax
		push	ax
		push	dx
		push	word_70EA2

loc_A1194:
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_A119C:				; CODE XREF: SaveGame_ReadFile_A1173+13j
		push	ds
		push	word_70EA2
		push	2
		call	File_OpenWithRetry_63434
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_A11B5

loc_A11B1:				; CODE XREF: SaveGame_ReadFile_A1173:loc_A11F7j
		xor	ax, ax
		jmp	short loc_A122E
; ���������������������������������������������������������������������������

loc_A11B5:				; CODE XREF: SaveGame_ReadFile_A1173+3Cj
		mov	di, [si+6]
		jmp	short loc_A1214
; ���������������������������������������������������������������������������

loc_A11BA:				; CODE XREF: SaveGame_ReadFile_A1173:loc_A1217j
		mov	bx, word_70E62
		mov	ax, [bx]
		mov	dx, di
		shl	dx, 1
		mov	bx, [bx+2]
		add	bx, dx
		mov	dx, [bx]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx

loc_A11D1:
		mov	ax, [si+4]
		add	word ptr [bp+var_6], ax
		push	[bp+var_2]

loc_A11DA:
		push	large 0FFFFFFFFh
		mov	ax, [si+8]
		sub	ax, [si+4]

loc_A11E3:
		inc	ax
		movsx	eax, ax
		push	eax
		push	ss
		lea	ax, [bp+var_146]
		push	ax

loc_A11F0:
		call	File_ReadOrDelegateToPaged_630E7
		or	ax, dx

loc_A11F7:
		jz	short loc_A11B1

loc_A11F9:
		mov	ax, [si+8]
		sub	ax, [si+4]

loc_A11FF:
		inc	ax
		push	ax
		push	ss

loc_A1202:
		lea	ax, [bp+var_146]

loc_A1206:
		push	ax
		push	large [bp+var_6]

loc_A120B:
		call	CRT_MemFamily_Extra1

loc_A1210:
		add	sp, 0Ah
		inc	di

loc_A1214:				; CODE XREF: SaveGame_ReadFile_A1173+45j
		cmp	[si+0Ah], di

loc_A1217:
		jge	short loc_A11BA
		push	[bp+var_2]
		call	File_CloseWithRetry_63463

loc_A1221:
		push	word_70EA2

loc_A1225:
		call	CRT_Unlink
		pop	cx
		mov	ax, 1

loc_A122E:				; CODE XREF: SaveGame_ReadFile_A1173+40j
		pop	di
		pop	si
		leave
		retf
SaveGame_ReadFile_A1173	endp

seg441		ends
