ovr289		segment	para public 'OVERLAY' use16
		assume cs:ovr289
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 297 lignes, NON DÉTAILLÉE — chargement complet de texture résolue par chemin,
; combine ResourceRecord_SeekAndReadB_647B2 et ReadFieldGroupB_64A54.
; ==============================================================================================
TextureLoader_OpenAndLoadFull_98A60	proc far		; CODE XREF: VROOMM_StubThunk_6BCD0J

var_1E4		= word ptr -1E4h
var_1D6		= word ptr -1D6h
var_1D4		= word ptr -1D4h
var_1CB		= byte ptr -1CBh
var_1C6		= word ptr -1C6h
var_14E		= word ptr -14Eh
var_FE		= word ptr -0FEh
var_A1		= dword	ptr -0A1h
var_9D		= dword	ptr -9Dh
var_99		= dword	ptr -99h
var_8C		= dword	ptr -8Ch
var_84		= word ptr -84h
var_82		= word ptr -82h
var_56		= word ptr -56h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1E4h
		push	si
		push	di
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	offset aAcc_list ; "ACC_LIST"
		push	ds
		push	offset unk_70432
		lea	ax, [bp+var_56]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_FE]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_FE], 2C8h
		mov	[bp+var_9D], 100h
		mov	[bp+var_A1], 0
		mov	[bp+var_FE], 2E0h
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
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_98B02
		jmp	loc_98CC9
; ���������������������������������������������������������������������������

loc_98B02:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+9Dj
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_98B40
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		jmp	short loc_98B49
; ���������������������������������������������������������������������������

loc_98B40:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+B9j
		push	0E002h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_98B49:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+DEj
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	word ptr [bp+arg_0+2]
		push	bx

loc_98B57:
		call	VROOMM_StubThunk_6CD62
		add	sp, 8
		push	ds
		push	offset a_pak_1	; ".PAK"
		push	ds
		push	offset aAccpack	; "ACCPACK"
		push	ds
		push	offset unk_70432
		lea	ax, [bp+var_14E]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_1C6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_65A1A
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
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_98BB5
		jmp	loc_98CBA
; ���������������������������������������������������������������������������

loc_98BB5:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+150j
		mov	eax, [bp+var_8C]
		mov	ebx, 0Fh
		cdq
		idiv	ebx
		mov	[bp+var_4], ax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+4], 0
		jnz	short loc_98BD5
		jmp	loc_98CBA
; ���������������������������������������������������������������������������

loc_98BD5:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+170j
		xor	di, di
		jmp	loc_98CB2
; ���������������������������������������������������������������������������

loc_98BDA:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+257j
		push	large 0Fh
		push	ss
		lea	ax, [bp+var_1D6]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		or	di, di
		jnz	short loc_98BFB
		mov	ax, [bp+var_1D6]
		mov	[bp+var_2], ax

loc_98BFB:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+192j
		mov	ax, [bp+var_2]
		sub	[bp+var_1D6], ax
		cmp	[bp+var_1D6], 0FFh
		jnz	short loc_98C0D
		jmp	loc_98CB1
; ���������������������������������������������������������������������������

loc_98C0D:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+1A8j
		cmp	[bp+var_1CB], 1
		jnz	short loc_98C34
		push	[bp+var_1D6]
		lea	ax, [bp+var_1C6]
		push	ax
		lea	ax, [bp+var_1D4]
		push	ax
		push	[bp+var_1D6]
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6CD67
		add	sp, 0Ch
		jmp	short loc_98CB1
; ���������������������������������������������������������������������������

loc_98C34:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+1B2j
		mov	al, [bp+var_1CB]
		mov	ah, 0
		and	ax, 7Fh
		mov	[bp+var_6], ax
		test	[bp+var_1CB], 80h
		jz	short loc_98C6A
		push	[bp+var_1D6]
		lea	ax, [bp+var_1C6]
		push	ax
		push	[bp+var_6]

loc_98C53:
		lea	ax, [bp+var_1D4]
		push	ax

loc_98C58:
		push	[bp+var_1D6]
		push	large [bp+arg_0]

loc_98C60:
		call	VROOMM_StubThunk_6CD6C

loc_98C65:
		add	sp, 0Eh
		jmp	short loc_98CB1
; ���������������������������������������������������������������������������

loc_98C6A:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+1E5j
		mov	si, 1
		jmp	short loc_98CAC
; ���������������������������������������������������������������������������

loc_98C6F:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+24Fj
		push	si
		lea	ax, [bp+var_1D4]
		push	ax
		push	1953h
		lea	ax, [bp+var_1E4]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
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
		call	VROOMM_StubThunk_6CD67
		add	sp, 0Ch
		inc	si

loc_98CAC:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+20Dj
		cmp	si, [bp+var_6]
		jle	short loc_98C6F

loc_98CB1:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+1AAj
					; TextureLoader_OpenAndLoadFull_98A60+1D2j ...
		inc	di

loc_98CB2:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+177j
		cmp	di, [bp+var_4]
		jge	short loc_98CBA
		jmp	loc_98BDA
; ���������������������������������������������������������������������������

loc_98CBA:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+152j
					; TextureLoader_OpenAndLoadFull_98A60+172j ...
		push	2
		lea	ax, [bp+var_1C6]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4

loc_98CC9:				; CODE XREF: TextureLoader_OpenAndLoadFull_98A60+9Fj
		mov	[bp+var_FE], 2E0h
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_FE]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
TextureLoader_OpenAndLoadFull_98A60	endp

ovr289		ends
