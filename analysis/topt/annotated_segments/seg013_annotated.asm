seg013		segment	para public 'CODE' use16
		assume cs:seg013
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E9h, 0B5h, 0FEh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8543		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+0FDh]
		mov	ah, 0
		mov	dl, [bp+arg_2]
		mov	bx, ax
		mov	[bx+si+0E9h], dl
		inc	byte ptr [si+0FDh]
		pop	si
		pop	bp
		retf
sub_8543		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8560		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0FDh], 0
		jz	short loc_85BB
		mov	[bp+var_1], 0
		xor	cx, cx
		jmp	short loc_858B

loc_8579:
		mov	bx, cx
		mov	al, [bx+si+0E9h]
		cmp	al, [bp+arg_2]
		jnz	short loc_858A
		mov	[bp+var_1], 1
		jmp	short loc_8595

loc_858A:
		inc	cx

loc_858B:
		mov	al, [si+0FDh]
		mov	ah, 0
		cmp	ax, cx
		jg	short loc_8579

loc_8595:
		cmp	[bp+var_1], 0
		jz	short loc_85BB
		mov	dx, cx
		jmp	short loc_85AC

loc_859F:
		mov	bx, dx
		mov	al, [bx+si+0EAh]
		mov	bx, dx
		mov	[bx+si+0E9h], al
		inc	dx

loc_85AC:
		mov	al, [si+0FDh]
		mov	ah, 0
		dec	ax
		cmp	ax, dx
		jg	short loc_859F
		dec	byte ptr [si+0FDh]

loc_85BB:
		pop	si
		leave
		retf
sub_8560		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85BE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0FDh], 0
		pop	si
		pop	bp
		retf
sub_85BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85CD		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+108h]
		mov	ah, 0
		mov	dl, [bp+arg_2]
		mov	bx, ax
		mov	[bx+si+0FEh], dl
		inc	byte ptr [si+108h]
		pop	si
		pop	bp
		retf
sub_85CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85EA		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+108h], 0
		jz	short loc_8645
		mov	[bp+var_1], 0
		xor	cx, cx
		jmp	short loc_8615

loc_8603:
		mov	bx, cx
		mov	al, [bx+si+0FEh]
		cmp	al, [bp+arg_2]
		jnz	short loc_8614
		mov	[bp+var_1], 1
		jmp	short loc_861F

loc_8614:
		inc	cx

loc_8615:
		mov	al, [si+108h]
		mov	ah, 0
		cmp	ax, cx
		jg	short loc_8603

loc_861F:
		cmp	[bp+var_1], 0
		jz	short loc_8645
		mov	dx, cx
		jmp	short loc_8636

loc_8629:
		mov	bx, dx
		mov	al, [bx+si+0FFh]
		mov	bx, dx
		mov	[bx+si+0FEh], al
		inc	dx

loc_8636:
		mov	al, [si+108h]
		mov	ah, 0
		dec	ax
		cmp	ax, dx
		jg	short loc_8629
		dec	byte ptr [si+108h]

loc_8645:
		pop	si
		leave
		retf
sub_85EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8648		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+108h], 0
		pop	si
		pop	bp
		retf
sub_8648		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8657		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_8684

loc_8668:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_2]
		jnz	short loc_8684
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		pop	si
		leave
		retf

loc_8684:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E2h
		push	ax
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_8668
		xor	ax, ax
		pop	si
		leave
		retf
sub_8657		endp

; START OF FUNCTION CHUNK FOR sub_8657
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_8657

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_86A2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], 0
		jmp	short loc_86F1

loc_86B7:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_2]
		jnz	short loc_86F1
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	ax
		call	sub_330E8
		add	sp, 2
		push	di
		call	CRT_Strdup
		add	sp, 2
		push	ax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4

loc_86F1:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E2h
		push	ax
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_86B7
		pop	di
		pop	si
		leave
		retf
sub_86A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_870B		proc far

var_358		= word ptr -358h
var_2E0		= word ptr -2E0h
var_258		= word ptr -258h
var_1E0		= word ptr -1E0h
var_168		= word ptr -168h
var_F0		= word ptr -0F0h
var_A0		= word ptr -0A0h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
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
var_30		= dword ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_15		= word ptr -15h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= word ptr -0Fh
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 358h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset aIff
		push	ds
		push	offset aOptions2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_A0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_A0]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	si
		call	sub_42C34
		add	sp, 2
		cmp	[bp+arg_2], 0
		jnz	short loc_8783
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_A0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_F0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_87EF

loc_8783:
		cmp	[bp+arg_2], 1
		jnz	short loc_87BD
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_A0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_F0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_87EF

loc_87BD:
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_A0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_F0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_87EF:
		push	1
		lea	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_168]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	1
		lea	ax, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_1E0]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		jmp	short loc_8865

loc_8819:
		push	si
		call	sub_42C34
		add	sp, 2
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_1A], al
		mov	al, [si+0E8h]
		cmp	al, [bp+var_1A]
		jnz	short loc_8854
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	short loc_8888
		jmp	short loc_8865

loc_8854:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_8865:
		push	si
		call	ResourceRecord_ComputeRecordBounds_426EE
		add	sp, 2
		or	ax, ax
		jz	short loc_8888
		mov	eax, [si+6Dh]
		cmp	eax, dword_49D87
		jnz	short loc_8882
		mov	ax, 1
		jmp	short loc_8884

loc_8882:
		xor	ax, ax

loc_8884:
		or	ax, ax
		jnz	short loc_8819

loc_8888:
		push	0
		push	large 524C4F43h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_88B4
		push	si
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[si+0D7h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	short loc_88C2

loc_88B4:
		push	0
		push	138Eh
		push	si
		call	DisplayContext_CommitFrame_30078
		add	sp, 6

loc_88C2:
		push	0
		push	large 454E5554h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_88EC
		push	si
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[si+116h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_88EC:
		push	0
		push	large 50435345h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_8916
		push	si
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[si+0DAh], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_8916:
		push	0
		push	large 4B434142h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_2], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		cmp	[bp+var_2], 30h
		jle	short loc_89BE
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_F0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_258]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_258]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	2
		lea	ax, [bp+var_258]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		jmp	short loc_89D4

loc_89BE:
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_1E0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8

loc_89D4:
		mov	[bp+var_12], 0
		mov	[bp+var_F], 0
		lea	ax, word ptr [bp+var_C]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		jmp	loc_8B19

loc_89F1:
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_2], ax
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		cmp	byte ptr [si+0E8h], 88h
		jbe	short loc_8A70
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_F0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_258]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	3
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_258]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	2
		lea	ax, [bp+var_258]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		jmp	short loc_8A86

loc_8A70:
		push	3
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_168]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8

loc_8A86:
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_8AB8
		push	0
		push	0
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	di
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [di], 13DCh
		mov	word ptr [di+0Ah], 13FCh
		mov	byte ptr [di+1Dh], 0
		mov	ax, di
		jmp	short loc_8ABA

loc_8AB8:
		mov	ax, di

loc_8ABA:
		mov	[bp+var_26], ax
		mov	[bp+var_1F], 0
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+16h], 1
		push	[bp+var_26]
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		cmp	[bp+var_1F], 0
		jz	short loc_8B05
		cmp	[bp+var_24], 0
		jz	short loc_8B05
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_8B05

loc_8B05:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0

loc_8B19:
		push	1
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_8B31
		jmp	loc_89F1

loc_8B31:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		mov	[bp+var_18], 0
		mov	[bp+var_15], 0
		mov	[bp+var_19], 0
		push	0
		push	large 45524F46h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_8B60
		jmp	loc_909F

loc_8B60:
		mov	[bp+var_19], 1
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_2], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		cmp	[bp+var_2], 30h
		jle	short loc_8BFB
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_F0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_258]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_258]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	2
		lea	ax, [bp+var_258]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		jmp	short loc_8C11

loc_8BFB:
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_1E0]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8

loc_8C11:
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		jmp	loc_9046

loc_8C24:
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_8C47
		push	si
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	byte ptr [bp+var_26+1], al
		jmp	short loc_8C55

loc_8C47:
		push	1
		push	138Eh
		push	si
		call	DisplayContext_CommitFrame_30078
		add	sp, 6

loc_8C55:
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_2], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_30], 0
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	byte ptr [bp+var_26+1], 88h
		jbe	short loc_8CDB
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_F0]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F0]
		push	ax
		lea	ax, [bp+var_358]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	3
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_358]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	2
		lea	ax, [bp+var_358]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		jmp	short loc_8CF1

loc_8CDB:
		push	3
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_168]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8

loc_8CF1:
		push	2Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_32], ax
		or	ax, ax
		jz	short loc_8D34
		push	0
		push	0
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	[bp+var_32]
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	bx, [bp+var_32]
		mov	word ptr [bx], 13ACh
		mov	bx, [bp+var_32]
		mov	word ptr [bx+0Ah], 13CCh
		push	[bp+var_32]
		call	sub_7802
		add	sp, 2
		mov	ax, [bp+var_32]
		jmp	short loc_8D37

loc_8D34:
		mov	ax, [bp+var_32]

loc_8D37:
		mov	di, ax
		mov	[bp+var_2B], 0
		mov	byte ptr [di+16h], 1
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_8D7D
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_3A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_3C], ax
		push	[bp+var_3C]
		push	[bp+var_3A]
		push	di
		call	sub_78BE
		add	sp, 6

loc_8D7D:
		mov	[bp+var_36], 0
		mov	[bp+var_34], 0
		push	0
		push	large 4B434C43h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_8DA4
		mov	byte ptr [di+1Dh], 0
		mov	byte ptr [di+1Eh], 1

loc_8DA4:
		push	0
		push	large 4C42414Ch
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_8DEF
		mov	ax, [si+72h]
		mov	[bp+var_3A], ax
		movsx	eax, [bp+var_3A]
		push	eax
		push	ss
		lea	ax, [bp+var_2E0]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2E0]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	DisplaySurface_Construct_2F5AC
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_8DEF:
		push	0
		push	large 55514553h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_8E69
		mov	eax, [si+72h]
		sar	eax, 1
		mov	[bp+var_38], ax
		mov	ax, [bp+var_38]
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[di+26h], ax
		mov	ax, [bp+var_38]
		mov	[di+2Ah], ax
		mov	[bp+var_3A], 0
		jmp	short loc_8E50

loc_8E2C:
		mov	ax, [bp+var_3A]
		mov	[bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_3E], ax
		mov	ax, [bp+var_3C]
		shl	ax, 1
		mov	bx, [di+26h]
		add	bx, ax
		mov	ax, [bp+var_3E]
		mov	[bx], ax
		inc	[bp+var_3A]

loc_8E50:
		movsx	eax, [bp+var_3A]
		mov	edx, [si+72h]
		sar	edx, 1
		cmp	eax, edx
		jl	short loc_8E2C
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_8E69:
		push	0
		push	large 54434552h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_8E81
		jmp	loc_8F18

loc_8E81:
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_3A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_3E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_40], ax
		mov	ax, [bp+var_3A]
		mov	[bp+var_4A], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_4C], ax
		mov	ax, [bp+var_3E]
		mov	[bp+var_4E], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_50], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_48], ax
		mov	ax, [bp+var_4C]
		mov	[bp+var_46], ax
		mov	ax, [bp+var_4E]
		mov	[bp+var_44], ax
		mov	ax, [bp+var_50]
		mov	[bp+var_42], ax
		push	[bp+var_36]
		mov	al, byte ptr [bp+var_26+1]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_7AC8
		add	sp, 8
		mov	al, byte ptr [bp+var_26+1]
		push	ax
		push	di
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_7C8A
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	loc_8FD0

loc_8F18:
		push	0
		push	large 44415551h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_8F30
		jmp	loc_8FD0

loc_8F30:
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_3A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_44], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_42], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_40], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_3E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_48], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_46], ax
		push	[bp+var_36]
		mov	al, byte ptr [bp+var_26+1]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_7BBC
		add	sp, 0Eh
		mov	al, byte ptr [bp+var_26+1]
		push	ax
		push	di
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_7C8A
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_8FD0:
		push	0
		push	large 454E5554h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_8FF9
		push	si
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[di+2Dh], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_8FF9:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		lea	ax, [bp+var_36]
		push	ax
		call	Member_ClearAndFree_2F796
		add	sp, 2
		cmp	[bp+var_2B], 0
		jz	short loc_9032
		cmp	[bp+var_30], 0
		jz	short loc_9032
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_9032

loc_9032:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0

loc_9046:
		push	1
		push	large 54525053h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jz	short loc_905E
		jmp	loc_8C24

loc_905E:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		cmp	[bp+var_1F], 0
		jz	short loc_908B
		cmp	[bp+var_24], 0
		jz	short loc_908B
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_908B

loc_908B:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0

loc_909F:
		push	0
		push	large 52545845h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_90B7
		jmp	loc_9190

loc_90B7:
		jmp	loc_916F

loc_90BA:
		push	si
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_1A], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_2], ax
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	3
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_168]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	di, ax
		mov	[bp+var_1F], 0
		mov	byte ptr [di+16h], 1
		push	di
		mov	al, [bp+var_1A]
		push	ax
		mov	ax, si
		add	ax, 10Bh
		push	ax
		call	sub_6E81
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		cmp	[bp+var_1F], 0
		jz	short loc_915B
		cmp	[bp+var_24], 0
		jz	short loc_915B
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_915B

loc_915B:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0

loc_916F:
		push	1
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_9187
		jmp	loc_90BA

loc_9187:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_9190:
		push	si
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 111h
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		cmp	[bp+var_19], 0
		jz	short loc_91D1
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		mov	ax, si
		add	ax, 111h
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8

loc_91D1:
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_12]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_7], 0
		jz	short loc_920D
		cmp	[bp+var_C], 0
		jz	short loc_920D
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_920D

loc_920D:
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_1E0]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_168]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_870B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9243		proc far

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
		jmp	short loc_9284

loc_9255:
		xor	dx, dx
		jmp	short loc_927A

loc_9259:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		mov	bx, dx
		cmp	al, [bx+si+0E9h]
		jnz	short loc_9272
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+7], 1
		jmp	short loc_9284
		jmp	short loc_9279

loc_9272:
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+7], 0

loc_9279:
		inc	dx

loc_927A:
		mov	al, [si+0FDh]
		mov	ah, 0
		cmp	ax, dx
		jg	short loc_9259

loc_9284:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E2h
		push	ax
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_9255
		xor	di, di
		jmp	short loc_92C8

loc_929E:
		mov	bx, di
		mov	al, [bx+si+0FEh]
		push	ax
		mov	ax, si
		add	ax, 10Bh
		push	ax
		call	sub_6E3C
		add	sp, 4
		mov	[bp+var_6], ax
		push	[bp+var_6]
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_92C8:
		mov	al, [si+108h]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_929E
		push	0
		push	word ptr [si+111h]
		mov	al, [si+113h]
		push	ax
		mov	ax, si
		add	ax, 111h
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		mov	al, [si+0E8h]
		mov	ah, 0
		cmp	ax, 87h
		jz	short loc_92F8
		jmp	short loc_92FF

loc_92F8:
		mov	byte ptr [si+0E1h], 1
		jmp	short loc_9304

loc_92FF:
		mov	byte ptr [si+0E1h], 0

loc_9304:
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_7E14
		add	sp, 2
		mov	[bp+var_3], al
		call	sub_44AA3
		mov	word_49D83, ax
		call	sub_44ABB
		mov	word_49D85, ax
		xor	di, di
		jmp	short loc_9353

loc_9329:
		mov	bx, di
		mov	al, [bx+si+0FEh]
		push	ax
		mov	ax, si
		add	ax, 10Bh
		push	ax
		call	sub_6E3C
		add	sp, 4
		mov	[bp+var_6], ax
		push	[bp+var_6]
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		inc	di

loc_9353:
		mov	al, [si+108h]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_9329
		mov	byte ptr [si+108h], 0
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_9243		endp

; START OF FUNCTION CHUNK FOR sub_9243
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_9243

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_936D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_93B3
		mov	word ptr [si], 13ACh
		mov	word ptr [si+0Ah], 13CCh
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 2
		push	word ptr [si+26h]
		call	sub_39C
		add	sp, 2
		push	0
		push	si
		call	sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_93B3
		push	si
		call	sub_39C
		add	sp, 2

loc_93B3:
		pop	di
		pop	si
		pop	bp
		retf
sub_936D		endp

; ----------------------------------------------------------------------

sub_93B7		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_78D4
sub_93B7		endp

; ----------------------------------------------------------------------

sub_93C3		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_93C3		endp

; ----------------------------------------------------------------------

sub_93CF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_93CF		endp

; ----------------------------------------------------------------------

sub_93DB		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_3427B
sub_93DB		endp

; ----------------------------------------------------------------------

sub_93E7		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
sub_93E7		endp

; START OF FUNCTION CHUNK FOR sub_93E7
		db 0EAh, 0DAh
; END OF FUNCTION CHUNK FOR sub_93E7
seg013		ends
