ovr360		segment	para public 'OVERLAY' use16
		assume cs:ovr360
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C8260		proc far

var_F8		= word ptr -0F8h
var_A8		= word ptr -0A8h
var_4B		= dword ptr -4Bh
var_47		= dword ptr -47h
var_43		= dword ptr -43h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_A8], 508h
		mov	[bp+var_47], 100h
		mov	[bp+var_4B], 0
		mov	[bp+var_A8], 520h
		mov	[bp+var_2C], 0
		xor	ax, ax
		mov	[bp+var_2E], ax
		movsx	eax, ax
		mov	[bp+var_43], eax
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aMisc
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		mov	bx, [bp+var_A8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4353494Dh
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C8306
		jmp	loc_C83AF

loc_C8306:
		push	0
		push	large 4C4C494Bh
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C8322
		jmp	loc_C83AF

loc_C8322:
		mov	di, 1
		jmp	loc_C83A7

loc_C8328:
		push	ds
		mov	ax, di
		imul	ax, ax, 1Bh
		mov	dx, si
		add	dx, ax
		add	dx, 56Bh
		push	dx
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_ReadViaHelper_6DB52
		add	sp, 6
		mov	ax, di
		add	ax, 48h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_C8360
		mov	bx, di
		imul	bx, bx, 1Bh
		mov	byte ptr [bx+si+585h], 1
		jmp	short loc_C836A

loc_C8360:
		mov	bx, di
		imul	bx, bx, 1Bh
		mov	byte ptr [bx+si+585h], 0

loc_C836A:
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		pop	cx
		mov	bx, di
		imul	bx, bx, 1Bh
		mov	[bx+si+57Fh], ax
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		pop	cx
		mov	bx, di
		imul	bx, bx, 1Bh
		mov	[bx+si+581h], ax
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		pop	cx
		mov	bx, di
		imul	bx, bx, 1Bh
		mov	[bx+si+583h], ax
		inc	di

loc_C83A7:
		cmp	di, 8
		jg	short loc_C83AF
		jmp	loc_C8328

loc_C83AF:
		mov	byte ptr [si+585h], 1
		mov	word ptr [si+57Fh], 0
		mov	word ptr [si+581h], 0
		mov	word ptr [si+583h], 0
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		mov	[bp+var_A8], 520h
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C8260		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C83F5		proc far

var_D2		= word ptr -0D2h
var_5A		= word ptr -5Ah
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0D2h
		push	si
		mov	si, [bp+arg_0]
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
		lea	ax, [bp+var_5A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_D2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	2
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	0Ch
		lea	ax, [bp+var_D2]
		push	ax
		call	sub_75B60
		add	sp, 8
		lea	ax, word ptr [bp+var_A]
		push	ax
		mov	ax, si
		add	ax, 6A9h
		push	ax
		call	sub_76281
		add	sp, 4
		cmp	[bp+var_5], 0
		jz	short loc_C84AF
		cmp	[bp+var_A], 0
		jz	short loc_C84AF
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C84AF

loc_C84AF:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	2
		lea	ax, [bp+var_D2]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		pop	si
		leave
		retf
sub_C83F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C84D5		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+4EAh], 1
		mov	byte ptr [si+4EBh], 0
		mov	byte ptr [si+4ECh], 0
		mov	byte ptr [si+7C5h], 0
		mov	byte ptr [si+7C6h], 0
		mov	byte ptr [si+65Eh], 0
		mov	byte ptr [si+4EFh], 0
		mov	byte ptr [si+4EEh], 0FFh
		mov	byte ptr [si+4F0h], 0FFh
		mov	byte ptr [si+4F1h], 0FFh
		xor	dx, dx
		jmp	short loc_C8525

loc_C8515:
		mov	[bp+var_1], dl
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	bx, ax
		mov	byte ptr [bx+si+4F2h], 0
		inc	dx

loc_C8525:
		cmp	dx, 64h
		jl	short loc_C8515
		mov	dword ptr [si+567h], 0
		mov	word ptr [si+69Bh], 0
		mov	word ptr [si+4E8h], 0
		call	sub_5660A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C854F
		call	sub_5629F

loc_C854F:
		push	258h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	259h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	si
		push	cs
		call	near ptr sub_C8260
		pop	cx
		pop	si
		leave
		retf
sub_C84D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C856A		proc far

var_5C		= word ptr -5Ch
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_C84D5
		pop	cx
		push	si
		call	sub_75808
		pop	cx
		push	si
		push	cs
		call	near ptr sub_C83F5
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+4E2h], ax
		mov	al, [bp+arg_8]
		mov	[bp+var_1], al
		mov	[si+4EFh], al
		mov	byte ptr [si+4E5h], 0
		mov	byte ptr [si+4E6h], 0
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aGameflow
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		mov	ax, si
		add	ax, 3F0h
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		xor	di, di
		jmp	loc_C8705

loc_C85D8:
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		cmp	byte ptr [bx], 2Dh
		jz	short loc_C85EB
		jmp	loc_C8704

loc_C85EB:
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		cmp	byte ptr [bx+1], 2Eh
		jz	short loc_C85FF
		jmp	loc_C8704

loc_C85FF:
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		push	word ptr [bx]
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_4], ax
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	bx, [bx]
		mov	al, [bx+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		sub	ax, 43h
		mov	bx, ax
		cmp	bx, 13h
		jbe	short loc_C8636
		jmp	loc_C86FB

loc_C8636:
		shl	bx, 1
		jmp	cs:off_C8722[bx]	; switch jump

loc_C863D:
		mov	byte ptr [si+4E5h], 1
		jmp	loc_C86FB

loc_C8645:
		mov	byte ptr [si+4E5h], 2
		jmp	loc_C86FB

loc_C864D:
		mov	byte ptr [si+4E6h], 1
		jmp	loc_C86FB

loc_C8655:
		mov	byte ptr [si+4EAh], 0
		jmp	loc_C86FB

loc_C865D:
		mov	ax, [bp+var_4]
		add	ax, 3
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	2Eh
		lea	ax, [bp+var_5C]
		push	ax
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	[bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_C86A1
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_C86A1:
		push	ds
		push	offset unk_7A14B
		push	ss
		lea	ax, [bp+var_5C]
		push	ax
		push	ds
		push	offset unk_7A14A
		mov	ax, si
		add	ax, 3F0h
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		jmp	short loc_C86FB

loc_C86BE:
		mov	ax, [bp+var_4]
		add	ax, 3
		mov	[bp+var_6], ax
		push	ax
		call	sub_2189
		pop	cx
		mov	[bp+var_7], al
		mov	[si+4EFh], al
		jmp	short loc_C86FB

loc_C86D7:
		push	large 0
		call	sub_755FA
		jmp	short loc_C86F8

loc_C86E1:
		mov	ax, [bp+var_4]
		add	ax, 3
		mov	[bp+var_A], ax
		push	ax
		call	sub_2189
		pop	cx
		push	ax
		push	si
		call	sub_757EF

loc_C86F8:
		add	sp, 4

loc_C86FB:
		push	[bp+var_4]
		call	sub_65A86
		pop	cx

loc_C8704:
		inc	di

loc_C8705:
		cmp	di, [bp+arg_4]
		jge	short loc_C870D
		jmp	loc_C85D8

loc_C870D:
		cmp	byte_7C87C, 0
		jz	short loc_C871E
		mov	byte_7C87C, 0
		mov	byte ptr [si+4E6h], 1

loc_C871E:
		pop	di
		pop	si
		leave
		retf
sub_C856A		endp

; START OF FUNCTION CHUNK FOR sub_C856A
off_C8722	dw offset loc_C86D7
		dw offset loc_C86FB
		dw offset loc_C86FB
		dw offset loc_C865D
		dw offset loc_C86FB
		dw offset loc_C86FB
		dw offset loc_C86FB
		dw offset loc_C86FB
		dw offset loc_C86FB
		dw offset loc_C8655
		dw offset loc_C864D
		dw offset loc_C8645
		dw offset loc_C86FB
		dw offset loc_C86FB
		dw offset loc_C863D
		dw offset loc_C86FB
		dw offset loc_C86BE
		dw offset loc_C86FB
		dw offset loc_C86FB
		dw offset loc_C86E1
; END OF FUNCTION CHUNK FOR sub_C856A
ovr360		ends
