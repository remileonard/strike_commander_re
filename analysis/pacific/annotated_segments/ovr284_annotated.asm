ovr284		segment	para public 'OVERLAY' use16
		assume cs:ovr284
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Charge la table des matériaux des pistes (structure word_7CC8E : +0
; nombre d'images simples, +2 nombre d'images animées, +4 table des images simples, pas de 14
; octets, +8 table des animées, pas de 24). Ouvre TXM\ACC_LIST (FORM TXMS, push large
; 534D5854h) ; chunk INFO = 2 mots (les deux nombres) -> TextureTable_Allocate_BB46A ; ouvre
; TXM\ACCPACK.PAK ; chunk MAPS = enregistrements de 15 octets (taille ÷ 15) : mot = numéro
; (moins le numéro du premier enregistrement = place dans la table ; 255 = sauté), nom, octet
; 11 = nombre d'images (1 : une image au nom donné ; bit 7 : image animée,
; TextureTable_LoadAnimated_BB541 ; sinon n images nommées « %s%d » de 1 à n, places
; successives) ; chaque image = l'entrée de ACCPACK.PAK de même numéro que sa place
; (TextureTable_LoadImage_BB506). Équivalent de TextureLoader_OpenAndLoadFull_98A60 de
; STRIKE.EXE.
; ==============================================================================================
TerrainTextures_LoadAccList_A7090		proc far

var_1E4		= word ptr -1E4h
var_1D6		= word ptr -1D6h
var_1D4		= word ptr -1D4h
var_1CB		= byte ptr -1CBh
var_1C6		= word ptr -1C6h
var_14E		= word ptr -14Eh
var_FE		= word ptr -0FEh
var_A1		= dword ptr -0A1h
var_9D		= dword ptr -9Dh
var_99		= dword ptr -99h
var_8C		= dword ptr -8Ch
var_84		= word ptr -84h
var_82		= word ptr -82h
var_56		= word ptr -56h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1E4h
		push	si
		push	di
		push	seg seg225
		push	0
		push	ds
		push	offset aACCLIST
		push	ds
		push	offset aTXM
		lea	ax, [bp+var_56]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_FE]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_FE], 508h
		mov	[bp+var_9D], 100h
		mov	[bp+var_A1], 0
		mov	[bp+var_FE], 520h
		mov	[bp+var_82], 0
		xor	ax, ax
		mov	[bp+var_84], ax
		movsx	eax, ax
		mov	[bp+var_99], eax
		push	1
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		mov	bx, [bp+var_FE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 534D5854h
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A7122
		jmp	loc_A72F1

loc_A7122:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A7160
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx], ax
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], ax
		jmp	short loc_A7169

loc_A7160:
		push	0E002h
		call	sub_1DDFE
		pop	cx

loc_A7169:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_751B0
		add	sp, 8
		push	ds
		push	offset aPAK
		push	ds
		push	offset aACCPACK
		push	ds
		push	offset aTXM
		lea	ax, [bp+var_14E]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_1C6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	1
		lea	ax, [bp+var_14E]
		push	ax
		lea	ax, [bp+var_1C6]
		push	ax
		mov	bx, [bp+var_1C6]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 5350414Dh
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A71D5
		jmp	loc_A72E2

loc_A71D5:
		mov	eax, [bp+var_8C]
		mov	ebx, 0Fh
		cdq
		idiv	ebx
		mov	[bp+var_4], ax
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+4], 0
		jnz	short loc_A71F6
		jmp	loc_A72E2

loc_A71F6:
		xor	di, di
		jmp	loc_A72DA

loc_A71FB:
		push	large 0Fh
		push	ss
		lea	ax, [bp+var_1D6]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		or	di, di
		jnz	short loc_A721C
		mov	ax, [bp+var_1D6]
		mov	[bp+var_2], ax

loc_A721C:
		mov	ax, [bp+var_2]
		sub	[bp+var_1D6], ax
		cmp	[bp+var_1D6], 0FFh
		jnz	short loc_A722E
		jmp	loc_A72D9

loc_A722E:
		cmp	[bp+var_1CB], 1
		jnz	short loc_A7256
		push	[bp+var_1D6]
		lea	ax, [bp+var_1C6]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		push	[bp+var_1D6]
		push	large [bp+arg_0]
		call	sub_751B5
		add	sp, 0Ch
		jmp	loc_A72D9

loc_A7256:
		mov	al, [bp+var_1CB]
		mov	ah, 0
		and	ax, 7Fh
		mov	[bp+var_6], ax
		test	[bp+var_1CB], 80h
		jz	short loc_A728C
		push	[bp+var_1D6]
		lea	ax, [bp+var_1C6]
		push	ax
		push	[bp+var_6]
		lea	ax, [bp+var_1D4]
		push	ax
		push	[bp+var_1D6]
		push	large [bp+arg_0]
		call	sub_751BA
		add	sp, 0Eh
		jmp	short loc_A72D9

loc_A728C:
		mov	si, 1
		jmp	short loc_A72D4

loc_A7291:
		push	si
		lea	ax, [bp+var_1D4]
		push	ax
		push	1443h
		lea	ax, [bp+var_1E4]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	word_77B60, 1
		mov	ax, si
		add	ax, [bp+var_1D6]
		dec	ax
		push	ax
		lea	ax, [bp+var_1C6]
		push	ax
		lea	ax, [bp+var_1E4]
		push	ax
		mov	ax, si
		add	ax, [bp+var_1D6]
		dec	ax
		push	ax
		push	large [bp+arg_0]
		call	sub_751B5
		add	sp, 0Ch
		inc	si

loc_A72D4:
		cmp	si, [bp+var_6]
		jle	short loc_A7291

loc_A72D9:
		inc	di

loc_A72DA:
		cmp	di, [bp+var_4]
		jge	short loc_A72E2
		jmp	loc_A71FB

loc_A72E2:
		push	2
		lea	ax, [bp+var_1C6]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_A72F1:
		mov	[bp+var_FE], 520h
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_FE]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
TerrainTextures_LoadAccList_A7090		endp
ovr284		ends
