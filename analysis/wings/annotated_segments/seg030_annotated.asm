seg030		segment	para public 'CODE' use16
		assume cs:seg030
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 36h, 83h, 47h, 4, 0F2h, 90h, 90h, 0E9h, 0C0h, 0FDh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17EAA		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+0FCh]
		mov	ah, 0
		mov	dl, [bp+arg_2]
		mov	bx, ax
		mov	[bx+si+0E8h], dl
		inc	byte ptr [si+0FCh]
		pop	si
		pop	bp
		retf
sub_17EAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17EC7		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0FCh], 0
		jz	short loc_17F15
		mov	cl, 0
		xor	dx, dx
		jmp	short loc_17EEB

loc_17EDB:
		mov	bx, dx
		mov	al, [bx+si+0E8h]
		cmp	al, [bp+arg_2]
		jnz	short loc_17EEA
		mov	cl, 1
		jmp	short loc_17EF5

loc_17EEA:
		inc	dx

loc_17EEB:
		mov	al, [si+0FCh]
		mov	ah, 0
		cmp	ax, dx
		jg	short loc_17EDB

loc_17EF5:
		or	cl, cl
		jz	short loc_17F15
		jmp	short loc_17F06

loc_17EFB:
		mov	bx, dx
		mov	al, [bx+si+0E9h]
		mov	[bx+si+0E8h], al
		inc	dx

loc_17F06:
		mov	al, [si+0FCh]
		mov	ah, 0
		dec	ax
		cmp	ax, dx
		jg	short loc_17EFB
		dec	byte ptr [si+0FCh]

loc_17F15:
		pop	si
		pop	bp
		retf
sub_17EC7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17F18		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0FCh], 0
		pop	si
		pop	bp
		retf
sub_17F18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17F27		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+107h]
		mov	ah, 0
		mov	dl, [bp+arg_2]
		mov	bx, ax
		mov	[bx+si+0FDh], dl
		inc	byte ptr [si+107h]
		pop	si
		pop	bp
		retf
sub_17F27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17F44		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+107h], 0
		jz	short loc_17F92
		mov	cl, 0
		xor	dx, dx
		jmp	short loc_17F68

loc_17F58:
		mov	bx, dx
		mov	al, [bx+si+0FDh]
		cmp	al, [bp+arg_2]
		jnz	short loc_17F67
		mov	cl, 1
		jmp	short loc_17F72

loc_17F67:
		inc	dx

loc_17F68:
		mov	al, [si+107h]
		mov	ah, 0
		cmp	ax, dx
		jg	short loc_17F58

loc_17F72:
		or	cl, cl
		jz	short loc_17F92
		jmp	short loc_17F83

loc_17F78:
		mov	bx, dx
		mov	al, [bx+si+0FEh]
		mov	[bx+si+0FDh], al
		inc	dx

loc_17F83:
		mov	al, [si+107h]
		mov	ah, 0
		dec	ax
		cmp	ax, dx
		jg	short loc_17F78
		dec	byte ptr [si+107h]

loc_17F92:
		pop	si
		pop	bp
		retf
sub_17F44		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17F95		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+107h], 0
		pop	si
		pop	bp
		retf
sub_17F95		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17FA4		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_17FC9

loc_17FB5:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_2]
		jnz	short loc_17FC9
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		jmp	short loc_17FE1

loc_17FC9:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E1h
		push	ax
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_17FB5
		xor	ax, ax

loc_17FE1:
		pop	si
		leave
		retf
sub_17FA4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17FE4		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_18026

loc_17FF5:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_2]
		jnz	short loc_18026
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		push	ax
		call	sub_45058
		pop	cx
		push	[bp+arg_4]
		call	CRT_Strdup
		pop	cx
		push	ax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4

loc_18026:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E1h
		push	ax
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_17FF5
		pop	si
		leave
		retf
sub_17FE4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1803F		proc far

var_28A		= word ptr -28Ah
var_18A		= word ptr -18Ah
var_112		= word ptr -112h
var_9A		= word ptr -9Ah
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_23		= byte ptr -23h
var_22		= dword ptr -22h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_14		= byte ptr -14h
var_13		= word ptr -13h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
var_D		= word ptr -0Dh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset aIFF
		push	ds
		push	offset aWwiopts
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_9A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_9A]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	si
		call	sub_541A0
		pop	cx
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwishps
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_9A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aWwipals
		push	ds
		push	offset aDataGameflow_3
		lea	ax, [bp+var_9A]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_18A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		jmp	short loc_1811B

loc_180D7:
		push	si
		call	sub_541A0
		pop	cx
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_18], al
		mov	al, [si+0E7h]
		cmp	al, [bp+var_18]
		jnz	short loc_1810C
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	short loc_1813C

loc_1810C:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_1811B:
		push	si
		call	ResourceRecord_ComputeRecordBounds_53C5A
		pop	cx
		or	ax, ax
		jz	short loc_1813C
		mov	eax, [si+6Dh]
		cmp	eax, dword_5B351
		jnz	short loc_18136
		mov	ax, 1
		jmp	short loc_18138

loc_18136:
		xor	ax, ax

loc_18138:
		or	ax, ax
		jnz	short loc_180D7

loc_1813C:
		push	0
		push	large 524C4F43h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_18166
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[si+0D7h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	short loc_18174

loc_18166:
		push	0
		push	1618h
		push	si
		call	sub_59C00
		add	sp, 6

loc_18174:
		push	0
		push	large 454E5554h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_1819C
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[si+115h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_1819C:
		push	0
		push	large 50435345h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_181C4
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[si+0DAh], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_181C4:
		push	0
		push	large 4B434142h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	dx, ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	2
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	dx
		lea	ax, [bp+var_18A]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		mov	[bp+var_10], 0
		mov	[bp+var_D], 0
		lea	ax, word ptr [bp+var_A]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	sub_46A98
		add	sp, 4
		jmp	loc_182FF

loc_18240:
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	dx, ax
		mov	[bp+var_22], 0
		mov	[bp+var_1E], 2
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	3
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	dx
		lea	ax, [bp+var_112]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_182A4
		push	large 0
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	di
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [di], 1666h
		mov	word ptr [di+0Ah], 1686h
		mov	byte ptr [di+1Dh], 0
		mov	ax, di
		jmp	short loc_182A6

loc_182A4:
		mov	ax, di

loc_182A6:
		mov	di, ax
		mov	[bp+var_1D], 0
		mov	byte ptr [di+16h], 1
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		cmp	[bp+var_1D], 0
		jz	short loc_182EB
		cmp	[bp+var_22], 0
		jz	short loc_182EB
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_182EB

loc_182EB:
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0

loc_182FF:
		push	1
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_18317
		jmp	loc_18240

loc_18317:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		mov	[bp+var_16], 0
		mov	[bp+var_13], 0
		mov	[bp+var_17], 0
		push	0
		push	large 45524F46h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_18344
		jmp	loc_1879B

loc_18344:
		mov	[bp+var_17], 1
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	dx, ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_22], 0
		mov	[bp+var_1E], 2
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	2
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	dx
		lea	ax, [bp+var_18A]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		lea	ax, word ptr [bp+var_22]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	sub_46A98
		add	sp, 4
		jmp	loc_18744

loc_183A9:
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_183CA
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_23], al
		jmp	short loc_183D8

loc_183CA:
		push	1
		push	1618h
		push	si
		call	sub_59C00
		add	sp, 6

loc_183D8:
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	dx, ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	3
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	dx
		lea	ax, [bp+var_112]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	2Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_18447
		push	large 0
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	di
		call	Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [di], 1636h
		mov	word ptr [di+0Ah], 1656h
		push	di
		call	sub_16E69
		pop	cx
		mov	ax, di
		jmp	short loc_18449

loc_18447:
		mov	ax, di

loc_18449:
		mov	di, ax
		mov	[bp+var_29], 0
		mov	byte ptr [di+16h], 1
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_18489
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_34], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_36], ax
		push	ax
		push	[bp+var_34]
		push	di
		call	sub_16F35
		add	sp, 6

loc_18489:
		mov	[bp+var_32], 0
		mov	[bp+var_30], 0
		push	0
		push	large 4B434C43h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_184B0
		mov	byte ptr [di+1Dh], 0
		mov	byte ptr [di+1Eh], 1

loc_184B0:
		push	0
		push	large 4C42414Ch
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_184FB
		mov	ax, [si+72h]
		mov	[bp+var_34], ax
		movsx	eax, [bp+var_34]
		push	eax
		push	ss
		lea	ax, [bp+var_28A]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_28A]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		call	sub_59B35
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_184FB:
		push	0
		push	large 47414C46h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_18522
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[di+2Dh], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_18522:
		push	0
		push	large 55514553h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_185A3
		mov	eax, [si+72h]
		sar	eax, 1
		mov	[bp+var_34], ax
		mov	[bp+var_36], ax
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+26h], ax
		mov	ax, [bp+var_36]
		mov	[di+2Ah], ax
		mov	[bp+var_38], 0
		jmp	short loc_18585

loc_1855D:
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_38]
		mov	[bp+var_3E], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_40], ax
		mov	ax, [bp+var_3E]
		shl	ax, 1
		mov	bx, [di+26h]
		add	bx, ax
		mov	ax, [bp+var_40]
		mov	[bx], ax
		inc	[bp+var_38]

loc_18585:
		mov	ax, [bp+var_38]
		cmp	ax, [bp+var_34]
		jl	short loc_1855D
		mov	ax, [bp+var_34]
		call	Math_RandomScale_39596
		mov	[bp+var_3A], ax
		mov	[di+28h], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_185A3:
		push	0
		push	large 54434552h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_1862C
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_34], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_36], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_38], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_34]
		mov	[bp+var_44], ax
		mov	ax, [bp+var_36]
		mov	[bp+var_46], ax
		mov	ax, [bp+var_38]
		mov	[bp+var_48], ax
		mov	ax, [bp+var_3A]
		mov	[bp+var_4A], ax
		mov	ax, [bp+var_44]
		mov	[bp+var_42], ax
		mov	ax, [bp+var_46]
		mov	[bp+var_40], ax
		mov	ax, [bp+var_48]
		mov	[bp+var_3E], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_3C], ax
		push	[bp+var_32]
		mov	al, [bp+var_23]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_1713E
		add	sp, 8
		jmp	loc_186B9

loc_1862C:
		push	0
		push	large 44415551h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_18644
		jmp	loc_186D4

loc_18644:
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_36], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_34], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_3E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_3A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_38], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_42], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_40], ax
		push	[bp+var_32]
		mov	al, [bp+var_23]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_17212
		add	sp, 0Eh

loc_186B9:
		mov	al, [bp+var_23]
		push	ax
		push	di
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_172D3
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_186D4:
		push	0
		push	large 454E5554h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_186FB
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[di+2Eh], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_186FB:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		lea	ax, [bp+var_32]
		push	ax
		call	sub_59B75
		pop	cx
		cmp	[bp+var_29], 0
		jz	short loc_18730
		cmp	[bp+var_2E], 0
		jz	short loc_18730
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_18730

loc_18730:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0

loc_18744:
		push	1
		push	large 54525053h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_1875C
		jmp	loc_183A9

loc_1875C:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		cmp	[bp+var_1D], 0
		jz	short loc_18787
		cmp	[bp+var_22], 0
		jz	short loc_18787
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_18787

loc_18787:
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0

loc_1879B:
		push	0
		push	large 52545845h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_187B3
		jmp	loc_18882

loc_187B3:
		jmp	loc_18863

loc_187B6:
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_18], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	dx, ax
		mov	[bp+var_22], 0
		mov	[bp+var_1E], 2
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0
		push	3
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	dx
		lea	ax, [bp+var_112]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	large 0
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	0
		call	Layer_Construct_45F57
		add	sp, 8
		mov	di, ax
		mov	[bp+var_1D], 0
		mov	byte ptr [di+16h], 1
		push	ax
		mov	al, [bp+var_18]
		push	ax
		mov	ax, si
		add	ax, 10Ah
		push	ax
		call	sub_B68C
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		cmp	[bp+var_1D], 0
		jz	short loc_1884F
		cmp	[bp+var_22], 0
		jz	short loc_1884F
		push	0
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1884F

loc_1884F:
		mov	[bp+var_22], 0
		mov	[bp+var_1D], 0
		mov	[bp+var_1C], 0

loc_18863:
		push	1
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_1887B
		jmp	loc_187B6

loc_1887B:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_18882:
		push	si
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	[bp+var_10]
		mov	al, [bp+var_E]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		mov	ax, si
		add	ax, 110h
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8
		cmp	[bp+var_17], 0
		jz	short loc_188C1
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		mov	ax, si
		add	ax, 110h
		push	ax
		call	Palette_CopyInto_46D40
		add	sp, 8

loc_188C1:
		lea	ax, [bp+var_16]
		push	ax
		call	sub_46E08
		pop	cx
		lea	ax, [bp+var_10]
		push	ax
		call	sub_46E08
		pop	cx
		cmp	[bp+var_5], 0
		jz	short loc_188F9
		cmp	[bp+var_A], 0
		jz	short loc_188F9
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_188F9

loc_188F9:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	2
		lea	ax, [bp+var_18A]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		push	2
		lea	ax, [bp+var_112]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_1803F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1892F		proc far

var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1896E

loc_18941:
		xor	dx, dx
		jmp	short loc_18964

loc_18945:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		mov	bx, dx
		cmp	al, [bx+si+0E8h]
		jnz	short loc_1895C
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+7], 1
		jmp	short loc_1896E

loc_1895C:
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+7], 0
		inc	dx

loc_18964:
		mov	al, [si+0FCh]
		mov	ah, 0
		cmp	ax, dx
		jg	short loc_18945

loc_1896E:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E1h
		push	ax
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_18941
		xor	di, di
		jmp	short loc_189B0

loc_18988:
		mov	bx, di
		mov	al, [bx+si+0FDh]
		push	ax
		mov	ax, si
		add	ax, 10Ah
		push	ax
		call	sub_B64C
		add	sp, 4
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	LayerGroup_Add_45B40
		add	sp, 4
		inc	di

loc_189B0:
		mov	al, [si+107h]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_18988
		mov	ax, si
		add	ax, 110h
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_17445
		add	sp, 4
		mov	[bp+var_3], al
		call	sub_55FFC
		mov	word_5B34D, ax
		call	sub_56014
		mov	word_5B34F, ax
		xor	di, di
		jmp	short loc_18A0D

loc_189E5:
		mov	bx, di
		mov	al, [bx+si+0FDh]
		push	ax
		mov	ax, si
		add	ax, 10Ah
		push	ax
		call	sub_B64C
		add	sp, 4
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_45B7D
		add	sp, 4
		inc	di

loc_18A0D:
		mov	al, [si+107h]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_189E5
		mov	byte ptr [si+107h], 0
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_1892F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18A23		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_18A63
		mov	word ptr [si], 1636h
		mov	word ptr [si+0Ah], 1656h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		pop	cx
		push	word ptr [si+26h]
		call	sub_33B
		pop	cx
		push	0
		push	si
		call	sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_18A63
		push	si
		call	sub_33B
		pop	cx

loc_18A63:
		pop	di
		pop	si
		pop	bp
		retf
sub_18A23		endp

; ----------------------------------------------------------------------

sub_18A67		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_16F4B
sub_18A67		endp

; ----------------------------------------------------------------------

sub_18A73		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_46268
sub_18A73		endp

; ----------------------------------------------------------------------

sub_18A7F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_461CC
sub_18A7F		endp

; ----------------------------------------------------------------------

sub_18A8B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_461F9
sub_18A8B		endp

; ----------------------------------------------------------------------

sub_18A97		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
sub_18A97		endp

; START OF FUNCTION CHUNK FOR sub_18A97
		db 0EAh, 0E8h
; END OF FUNCTION CHUNK FOR sub_18A97
seg030		ends
