ovr359		segment	para public 'OVERLAY' use16
		assume cs:ovr359
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C7210		proc far

var_AA		= word ptr -0AAh
var_4D		= dword ptr -4Dh
var_49		= dword ptr -49h
var_45		= dword ptr -45h
var_3D		= dword ptr -3Dh
var_38		= word ptr -38h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0AAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_AA], 508h
		mov	[bp+var_49], 100h
		mov	[bp+var_4D], 0
		mov	[bp+var_AA], 520h
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_30], ax
		movsx	eax, ax
		mov	[bp+var_45], eax
		push	1
		mov	ax, si
		add	ax, 3F0h
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		mov	bx, [bp+var_AA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_6DC9A
		pop	cx
		mov	[bp+var_1], 0
		jmp	loc_C736E

loc_C727E:
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_6D754
		pop	cx
		or	ax, ax
		jnz	short loc_C7290
		jmp	loc_C7365

loc_C7290:
		cmp	[bp+var_3D], 5353494Dh
		jnz	short loc_C729F
		mov	ax, 1
		jmp	short loc_C72A1

loc_C729F:
		xor	ax, ax

loc_C72A1:
		or	ax, ax
		jnz	short loc_C72A8
		jmp	loc_C7365

loc_C72A8:
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C72CF
		jmp	loc_C7350

loc_C72CF:
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	dl, [si+4EFh]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_C7346
		mov	eax, [bp+var_34]
		mov	[bp+var_45], eax
		push	0
		push	large 54434645h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C7337
		mov	ax, [bp+var_38]
		mov	[si+6], ax
		cmp	word ptr [si+6], 3E8h
		jbe	short loc_C731B
		push	0DA38h
		call	sub_1DDFE
		pop	cx

loc_C731B:
		xor	di, di
		jmp	short loc_C7330

loc_C731F:
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, di
		mov	[bx+si+8], al
		inc	di

loc_C7330:
		cmp	[si+6], di
		ja	short loc_C731F
		jmp	short loc_C7340

loc_C7337:
		push	0DA1h
		call	sub_1DDFE
		pop	cx

loc_C7340:
		mov	[bp+var_1], 1
		jmp	short loc_C739C

loc_C7346:
		mov	eax, [bp+var_34]
		mov	[bp+var_45], eax
		jmp	short loc_C7359

loc_C7350:
		push	0DA2h
		call	sub_1DDFE
		pop	cx

loc_C7359:
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_C736D

loc_C7365:
		push	0DA3h
		call	sub_1DDFE

loc_C736D:
		pop	cx

loc_C736E:
		cmp	[bp+var_2E], 0
		jnz	short loc_C7381
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_C7395

loc_C7381:
		mov	bx, [bp+var_2E]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_45]
		jg	short loc_C7393
		mov	ax, 1
		jmp	short loc_C7395

loc_C7393:
		xor	ax, ax

loc_C7395:
		or	ax, ax
		jnz	short loc_C739C
		jmp	loc_C727E

loc_C739C:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C73AE
		push	0DA4h
		call	sub_1DDFE
		pop	cx

loc_C73AE:
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		mov	[bp+var_AA], 520h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C7210		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. (structure seulement) Lecture d'une scène de GAMEFLOW.IFF : chunks
; SPRT, REQU (push large 55514552h) et EFCT (push large 54434645h).
; ==============================================================================================
Gameflow_LoadScene_C73DD		proc far

var_B0		= word ptr -0B0h
var_53		= dword ptr -53h
var_4F		= dword ptr -4Fh
var_4B		= dword ptr -4Bh
var_43		= dword ptr -43h
var_3E		= word ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+4E7h], 0FFh
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_B0], 508h
		mov	[bp+var_4F], 100h
		mov	[bp+var_53], 0
		mov	[bp+var_B0], 520h
		mov	[bp+var_34], 0
		xor	ax, ax
		mov	[bp+var_36], ax
		movsx	eax, ax
		mov	[bp+var_4B], eax
		push	si
		call	sub_603AB
		pop	cx
		push	1
		mov	ax, si
		add	ax, 3F0h
		push	ax
		lea	ax, [bp+var_B0]
		push	ax
		mov	bx, [bp+var_B0]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_6DC9A
		pop	cx
		mov	[bp+var_1], 0
		jmp	loc_C74EA

loc_C7457:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_6D754
		pop	cx
		or	ax, ax
		jz	short loc_C74E1
		cmp	[bp+var_43], 5353494Dh
		jnz	short loc_C7475
		mov	ax, 1
		jmp	short loc_C7477

loc_C7475:
		xor	ax, ax

loc_C7477:
		or	ax, ax
		jz	short loc_C74E1
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C74CC
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	dl, [si+4EFh]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_C74C2
		mov	[bp+var_1], 1
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_C7518

loc_C74C2:
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_C74D5

loc_C74CC:
		push	0DA5h
		call	sub_1DDFE
		pop	cx

loc_C74D5:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_C74E9

loc_C74E1:
		push	0DA6h
		call	sub_1DDFE

loc_C74E9:
		pop	cx

loc_C74EA:
		cmp	[bp+var_34], 0
		jnz	short loc_C74FD
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_C7511

loc_C74FD:
		mov	bx, [bp+var_34]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4B]
		jg	short loc_C750F
		mov	ax, 1
		jmp	short loc_C7511

loc_C750F:
		xor	ax, ax

loc_C7511:
		or	ax, ax
		jnz	short loc_C7518
		jmp	loc_C7457

loc_C7518:
		cmp	[bp+var_1], 0
		jnz	short loc_C7521
		jmp	loc_C77E6

loc_C7521:
		mov	[bp+var_2], 0
		jmp	loc_C75BB

loc_C7528:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_6D754
		pop	cx
		or	ax, ax
		jz	short loc_C75B3
		cmp	[bp+var_43], 4E454353h
		jnz	short loc_C7546
		mov	ax, 1
		jmp	short loc_C7548

loc_C7546:
		xor	ax, ax

loc_C7548:
		or	ax, ax
		jz	short loc_C75B3
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C759D
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	dl, [si+4F1h]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_C7593
		mov	[bp+var_2], 1
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_C75E9

loc_C7593:
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_C75A6

loc_C759D:
		push	0DA7h
		call	sub_1DDFE
		pop	cx

loc_C75A6:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		jmp	short loc_C75BB

loc_C75B3:
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax

loc_C75BB:
		cmp	[bp+var_34], 0
		jnz	short loc_C75CE
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_C75E2

loc_C75CE:
		mov	bx, [bp+var_34]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4B]
		jg	short loc_C75E0
		mov	ax, 1
		jmp	short loc_C75E2

loc_C75E0:
		xor	ax, ax

loc_C75E2:
		or	ax, ax
		jnz	short loc_C75E9
		jmp	loc_C7528

loc_C75E9:
		cmp	[bp+var_2], 0
		jnz	short loc_C75F2
		jmp	loc_C77E1

loc_C75F2:
		jmp	loc_C77B1

loc_C75F5:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ComputeRecordBounds_6D754
		pop	cx
		or	ax, ax
		jnz	short loc_C7607
		jmp	loc_C777A

loc_C7607:
		cmp	[bp+var_43], 54525053h
		jnz	short loc_C7616
		mov	ax, 1
		jmp	short loc_C7618

loc_C7616:
		xor	ax, ax

loc_C7618:
		or	ax, ax
		jnz	short loc_C761F
		jmp	loc_C777A

loc_C761F:
		lea	ax, [bp+var_B0]
		push	ax
		call	sub_6DC9A
		pop	cx
		mov	[bp+var_4], 0
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C765F
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_3], al
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_C7668

loc_C765F:
		push	0DA8h
		call	sub_1DDFE
		pop	cx

loc_C7668:
		push	0
		push	large 55514552h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C76EB
		mov	al, byte ptr [bp+var_3E]
		mov	[bp+var_5], al
		mov	ah, 0
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_8], ax
		xor	di, di
		jmp	short loc_C76AA

loc_C7697:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	bx, [bp+var_8]
		add	bx, di
		mov	[bx], al
		inc	di

loc_C76AA:
		mov	al, [bp+var_5]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_C7697
		push	[bp+var_8]
		mov	al, [bp+var_5]
		push	ax
		push	si
		call	sub_6041C
		add	sp, 6
		or	al, al
		jz	short loc_C76D8
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	sub_60317
		add	sp, 4
		mov	[bp+var_4], 1

loc_C76D8:
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		push	[bp+var_8]
		call	sub_3B2
		pop	cx
		jmp	short loc_C76FC

loc_C76EB:
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	sub_60317
		add	sp, 4
		mov	[bp+var_4], 1

loc_C76FC:
		cmp	[bp+var_4], 0
		jz	short loc_C776E
		push	0
		push	large 54434645h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C7765
		mov	al, [bp+var_3]
		push	ax
		push	si
		call	sub_603E3
		add	sp, 4
		mov	di, ax
		mov	ax, [bp+var_3E]
		mov	[di+8], ax
		mov	[bp+var_5], al
		mov	ah, 0
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+6], ax
		mov	al, [bp+var_5]
		mov	ah, 0
		movsx	eax, ax
		push	eax
		push	ds
		push	word ptr [di+6]
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_C776E

loc_C7765:
		push	0DA9h
		call	sub_1DDFE
		pop	cx

loc_C776E:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		jmp	short loc_C77B0

loc_C777A:
		cmp	[bp+var_43], 454E5554h
		jnz	short loc_C7789
		mov	ax, 1
		jmp	short loc_C778B

loc_C7789:
		xor	ax, ax

loc_C778B:
		or	ax, ax
		jz	short loc_C77A8
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+4E7h], al
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax
		jmp	short loc_C77B1

loc_C77A8:
		push	0DA10h
		call	sub_1DDFE

loc_C77B0:
		pop	cx

loc_C77B1:
		cmp	[bp+var_34], 0
		jnz	short loc_C77C4
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_C77D8

loc_C77C4:
		mov	bx, [bp+var_34]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_4B]
		jg	short loc_C77D6
		mov	ax, 1
		jmp	short loc_C77D8

loc_C77D6:
		xor	ax, ax

loc_C77D8:
		or	ax, ax
		jnz	short loc_C77DF
		jmp	loc_C75F5

loc_C77DF:
		jmp	short loc_C77EF

loc_C77E1:
		push	0DA11h
		jmp	short loc_C77E9

loc_C77E6:
		push	0DA12h

loc_C77E9:
		call	sub_1DDFE
		pop	cx

loc_C77EF:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		mov	[bp+var_B0], 520h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_LoadScene_C73DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C781E		proc far

var_78		= word ptr -78h
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	byte ptr [si+7C5h], 0
		mov	byte ptr [si+7C6h], 1
		mov	word_7D14A, dx
		mov	[bp+var_A], 0F94h
		mov	[bp+var_8], 0FA8h
		mov	[bp+var_6], 0FBCh
		mov	ax, [si+4E8h]
		mov	[bp+var_4], ax
		mov	ax, [si+69Bh]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 65Eh
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		push	dx
		lea	ax, [bp+var_78]
		push	ax
		call	sub_755BF
		add	sp, 8
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		lea	ax, [bp+var_78]
		push	ax
		call	sub_755C9
		pop	cx
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	byte ptr [si+7C6h], 0
		mov	byte ptr [si+7C5h], 1
		push	2
		lea	ax, [bp+var_78]
		push	ax
		call	sub_755C4
		add	sp, 4
		pop	si
		leave
		retf
sub_C781E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C78B3		proc far

var_14		= word ptr -14h
var_D		= byte ptr -0Dh
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	large 0FFFFFFFFh
		push	large 7
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	[bp+arg_0]
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	[bp+var_D], 0
		lea	ax, [bp+var_14]
		push	ax
		push	word_76D3E
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_C78EB
		mov	al, 1
		jmp	short loc_C78ED

loc_C78EB:
		mov	al, 0

loc_C78ED:
		leave
		retf
sub_C78B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C78EF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 1
		jmp	short loc_C7923

loc_C78FC:
		mov	ax, di
		add	ax, 48h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C7918
		mov	bx, di
		imul	bx, bx, 1Bh
		mov	byte ptr [bx+si+585h], 1
		jmp	short loc_C7922

loc_C7918:
		mov	bx, di
		imul	bx, bx, 1Bh
		mov	byte ptr [bx+si+585h], 0

loc_C7922:
		inc	di

loc_C7923:
		cmp	di, 8
		jle	short loc_C78FC
		pop	di
		pop	si
		pop	bp
		retf
sub_C78EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C792C		proc far

var_6A		= word ptr -6Ah
var_D		= dword ptr -0Dh
var_9		= dword ptr -9
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], ax
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_6A], 508h
		mov	[bp+var_9], 100h
		mov	[bp+var_D], 0
		mov	[bp+var_6A], 0E61h
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_6A]
		push	ax
		mov	bx, [bp+var_6A]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_6A]
		push	ax
		push	cs
		call	near ptr sub_C78B3
		pop	cx
		mov	[bp+var_3], al
		push	0
		lea	ax, [bp+var_6A]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	al, [bp+var_3]
		leave
		retf
sub_C792C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C798D		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	dx, [bp+arg_0]
		mov	cl, [bp+arg_2]
		mov	al, cl
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 5
		ja	short loc_C7A17
		shl	bx, 1
		jmp	cs:off_C7A20[bx]	; switch jump

loc_C79AC:
		mov	al, cl
		mov	ah, 0
		push	ax
		push	dx
		call	sub_76320
		add	sp, 4
		mov	[bp+var_E], 0
		mov	[bp+var_C], 0
		mov	[bp+var_A], 0
		mov	[bp+var_8], 0
		mov	[bp+var_6], 13Fh
		mov	[bp+var_4], 0C7h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		push	word_7AF7E
		lea	ax, [bp+var_E]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	5
		call	Music_SetPendingTune_5ED30
		pop	cx
		lea	ax, [bp+var_E]
		push	ax
		push	0
		call	sub_755FA
		add	sp, 4
		lea	ax, [bp+var_E]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		jmp	short loc_C7A1D

loc_C7A17:
		push	dx
		call	sub_763D0

loc_C7A1D:
		pop	cx
		leave
		retf
sub_C798D		endp

; START OF FUNCTION CHUNK FOR sub_C798D
off_C7A20	dw offset loc_C79AC
		dw offset loc_C79AC
		dw offset loc_C79AC
		dw offset loc_C79AC
		dw offset loc_C79AC
		dw offset loc_C79AC
; END OF FUNCTION CHUNK FOR sub_C798D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C7A2C		proc far

var_244		= word ptr -244h
var_222		= word ptr -222h
var_1C5		= dword ptr -1C5h
var_1C1		= dword ptr -1C1h
var_1BD		= dword ptr -1BDh
var_1B5		= dword ptr -1B5h
var_1AC		= dword ptr -1ACh
var_1A8		= word ptr -1A8h
var_1A6		= word ptr -1A6h
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_176		= word ptr -176h
var_174		= word ptr -174h
var_172		= word ptr -172h
var_170		= word ptr -170h
var_16C		= word ptr -16Ch
var_F4		= word ptr -0F4h
var_7C		= word ptr -7Ch
var_2C		= word ptr -2Ch
var_2A		= byte ptr -2Ah
var_29		= word ptr -29h
var_28		= dword ptr -28h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= byte ptr -12h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 244h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_7D13E
		mov	ah, 0
		or	ax, ax
		jz	short loc_C7A44
		jmp	loc_C8209

loc_C7A44:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	37h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_F4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	38h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	ax, word_7AF7E
		mov	[bp+var_6], ax
		mov	[bp+var_17A], 0
		mov	[bp+var_178], 0
		push	ax
		lea	ax, [bp+var_17A]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		mov	[bp+var_176], 0
		mov	[bp+var_174], 18h
		mov	[bp+var_172], 13Fh
		mov	[bp+var_170], 97h
		lea	ax, [bp+var_222]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_222], 508h
		mov	[bp+var_1C1], 100h
		mov	[bp+var_1C5], 0
		mov	[bp+var_222], 520h
		mov	[bp+var_1A6], 0
		xor	ax, ax
		mov	[bp+var_1A8], ax
		movsx	eax, ax
		mov	[bp+var_1BD], eax
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	36h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_222]
		push	ax
		mov	bx, [bp+var_222]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 42545345h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		mov	[bp+var_7], 0
		jmp	short loc_C7BF4

loc_C7BBB:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_1C], al
		cmp	al, [bp+arg_2]
		jnz	short loc_C7BE9
		mov	[bp+var_7], 1
		jmp	short loc_C7C0D

loc_C7BE9:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_C7BF4:
		push	1
		push	large 544F4853h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C7BBB

loc_C7C0D:
		mov	al, [bp+var_7]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C7C1F
		push	0A100h
		call	sub_1DDFE
		pop	cx

loc_C7C1F:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_1], al
		mov	eax, [bp+var_1AC]
		mov	[bp+var_1BD], eax
		lea	ax, [bp+var_17A]
		push	ax
		push	0
		push	0Fh
		lea	ax, [bp+var_244]
		push	ax
		call	sub_60273
		add	sp, 8
		mov	[bp+var_A], 0
		push	0
		push	large 454E5554h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_C7C91
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+4E7h], al
		mov	al, [si+4E7h]
		mov	ah, 0
		push	ax
		call	Music_SetPendingTune_5ED30
		pop	cx
		mov	eax, [bp+var_1AC]
		mov	[bp+var_1BD], eax

loc_C7C91:
		push	0
		push	large 53504853h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C7CAD
		jmp	loc_C7EB0

loc_C7CAD:
		jmp	loc_C7E7D

loc_C7CB0:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		cmp	[bp+var_1B5], 50414853h
		jnz	short loc_C7CCB
		mov	ax, 1
		jmp	short loc_C7CCD

loc_C7CCB:
		xor	ax, ax

loc_C7CCD:
		or	ax, ax
		jnz	short loc_C7CD4
		jmp	loc_C7D8D

loc_C7CD4:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	si, ax
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	di, ax
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_4], ax
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+2], 2
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	si
		lea	ax, [bp+var_F4]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	[bp+var_4]
		push	di
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	si, ax
		mov	byte ptr [bp+var_24+3], 0
		mov	byte ptr [si+16h], 1
		push	ax
		lea	ax, [bp+var_244]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_C7D76
		cmp	[bp+var_26], 0
		jz	short loc_C7D76
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C7D76

loc_C7D76:
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		jmp	loc_C7E73

loc_C7D8D:
		cmp	[bp+var_1B5], 4C424F4Dh
		jnz	short loc_C7D9D
		mov	ax, 1
		jmp	short loc_C7D9F

loc_C7D9D:
		xor	ax, ax

loc_C7D9F:
		or	ax, ax
		jnz	short loc_C7DA6
		jmp	loc_C7E6A

loc_C7DA6:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	si, ax
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	di, ax
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_4], ax
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+2], 2
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	si
		lea	ax, [bp+var_F4]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	0
		push	[bp+var_4]
		push	di
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	0
		call	sub_62CAA
		add	sp, 0Ah
		mov	si, ax
		mov	byte ptr [bp+var_24+3], 0
		mov	byte ptr [si+16h], 1
		push	ax
		lea	ax, [bp+var_244]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		push	si
		call	sub_62CEA
		pop	cx
		mov	[bp+var_A], si
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_C7E54
		cmp	[bp+var_26], 0
		jz	short loc_C7E54
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C7E54

loc_C7E54:
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		jmp	short loc_C7E73

loc_C7E6A:
		push	0DA13h
		call	sub_1DDFE
		pop	cx

loc_C7E73:
		mov	eax, [bp+var_1AC]
		mov	[bp+var_1BD], eax

loc_C7E7D:
		cmp	[bp+var_1A6], 0
		jnz	short loc_C7E91
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_C7EA7

loc_C7E91:
		mov	bx, [bp+var_1A6]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_1BD]
		jg	short loc_C7EA5
		mov	ax, 1
		jmp	short loc_C7EA7

loc_C7EA5:
		xor	ax, ax

loc_C7EA7:
		or	ax, ax
		jnz	short loc_C7EAE
		jmp	loc_C7CB0

loc_C7EAE:
		jmp	short loc_C7EB9

loc_C7EB0:
		push	0DA14h
		call	sub_1DDFE
		pop	cx

loc_C7EB9:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	byte ptr [bp+var_E], 0
		mov	byte ptr [bp+var_E+1], 0
		mov	[bp+var_C], 0
		push	100h
		push	0
		lea	ax, [bp+var_14]
		push	ax
		call	sub_76245
		add	sp, 6
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_14]
		mov	al, [bp+var_12]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_76259
		add	sp, 8
		push	0
		push	large 534C4150h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C7F37
		jmp	loc_C804D

loc_C7F37:
		jmp	loc_C801A

loc_C7F3A:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		cmp	[bp+var_1B5], 544C4150h
		jnz	short loc_C7F55
		mov	ax, 1
		jmp	short loc_C7F57

loc_C7F55:
		xor	ax, ax

loc_C7F57:
		or	ax, ax
		jnz	short loc_C7F5E
		jmp	loc_C8007

loc_C7F5E:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	si, ax
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+2], 2
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	si
		lea	ax, [bp+var_16C]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_29], 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	[bp+var_2C]
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_76272
		add	sp, 8
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_C7FF1
		cmp	[bp+var_26], 0
		jz	short loc_C7FF1
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C7FF1

loc_C7FF1:
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		jmp	short loc_C8010

loc_C8007:
		push	0DA15h
		call	sub_1DDFE
		pop	cx

loc_C8010:
		mov	eax, [bp+var_1AC]
		mov	[bp+var_1BD], eax

loc_C801A:
		cmp	[bp+var_1A6], 0
		jnz	short loc_C802E
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_C8044

loc_C802E:
		mov	bx, [bp+var_1A6]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_1BD]
		jg	short loc_C8042
		mov	ax, 1
		jmp	short loc_C8044

loc_C8042:
		xor	ax, ax

loc_C8044:
		or	ax, ax
		jnz	short loc_C804B
		jmp	loc_C7F3A

loc_C804B:
		jmp	short loc_C8056

loc_C804D:
		push	0DA16h
		call	sub_1DDFE
		pop	cx

loc_C8056:
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_C809B
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 13Fh
		mov	word ptr [si+0Ah], 0C7h
		push	0
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		mov	ax, si
		jmp	short loc_C809D

loc_C809B:
		mov	ax, si

loc_C809D:
		mov	si, ax
		mov	[bp+var_1A], si
		push	[bp+var_1A]
		lea	ax, [bp+var_18]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	0
		push	si
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		call	sub_75750
		push	1
		lea	ax, [bp+var_244]
		push	ax
		call	sub_75BF0
		add	sp, 4
		push	100h
		push	0
		push	2
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_7628B
		add	sp, 0Ah
		cmp	[bp+var_A], 0
		jnz	short loc_C80F6
		push	0DA17h
		call	sub_1DDFE
		pop	cx

loc_C80F6:
		mov	[bp+var_1B], 0
		jmp	short loc_C811A

loc_C80FC:
		call	sub_7575F
		or	al, al
		jz	short loc_C810B
		mov	[bp+var_1B], 1
		jmp	short loc_C8129

loc_C810B:
		push	1
		lea	ax, [bp+var_244]
		push	ax
		call	sub_75BF0
		add	sp, 4

loc_C811A:
		push	[bp+var_A]
		call	sub_62D3A
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_C80FC

loc_C8129:
		mov	al, [bp+var_1B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C8177
		xor	eax, eax
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	al, [bp+var_1]
		mov	ah, 0
		movsx	eax, ax
		mov	[bp+var_28], eax
		mov	[bp+var_20], eax
		mov	eax, dword_7B29D
		mov	[bp+var_24], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Stopwatch_WaitElapsed_6F93E
		pop	cx
		push	100h
		push	0
		push	0
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_76286
		add	sp, 0Ah

loc_C8177:
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		or	si, si
		jz	short loc_C819D
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_C819D

loc_C819D:
		lea	ax, [bp+var_18]
		push	ax
		call	sub_67383
		pop	cx
		lea	ax, [bp+var_14]
		push	ax
		call	sub_7627C
		pop	cx
		push	0
		lea	ax, [bp+var_244]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		mov	[bp+var_222], 520h
		lea	ax, [bp+var_222]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_222]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		lea	ax, [bp+var_17A]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_16C]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_F4]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_C8209:
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C7A2C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C821B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	54h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+7C3h], ax
		mov	bx, [si+7C3h]
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+2Ch], 0
		mov	word ptr [bx+48h], 0
		pop	si
		pop	bp
		retf
sub_C821B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C8244		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+7C3h]
		call	sub_3B2
		pop	cx
		pop	si
		pop	bp
		retf
sub_C8244		endp
ovr359		ends
