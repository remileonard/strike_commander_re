ovr221		segment	para public 'OVERLAY' use16
		assume cs:ovr221
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B90C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_B90DF
		push	10h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B9124

loc_B90DF:
		mov	ax, si
		add	ax, 8
		mov	ax, [di]
		mov	[si+6], ax
		mov	ax, [di+2]
		mov	[si+0Ch], ax
		mov	ax, [di+4]
		mov	[si+0Eh], ax
		mov	al, [di+6]
		mov	[si+8], al
		mov	al, [di+7]
		mov	[si+9], al
		mov	al, [di+8]
		mov	[si+0Ah], al
		mov	al, [di+9]
		mov	[si+2], al
		mov	al, [di+0Ah]
		mov	[si+3], al
		mov	al, [di+0Bh]
		mov	[si+4], al
		mov	al, [di+0Ch]
		mov	[si+5], al
		mov	ax, [bp+arg_4]
		mov	[si], ax

loc_B9124:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_B90C0		endp

; START OF FUNCTION CHUNK FOR sub_B90C0
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_B90C0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B912E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= byte ptr  16h
arg_12		= byte ptr  18h
arg_14		= byte ptr  1Ah
arg_16		= byte ptr  1Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B9149
		push	10h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B918F

loc_B9149:
		mov	ax, si
		add	ax, 8
		mov	ax, [bp+arg_2]
		mov	[si+6], ax
		mov	al, [bp+arg_4]
		mov	[si+8], al
		mov	al, [bp+arg_6]
		mov	[si+9], al
		mov	al, [bp+arg_8]
		mov	[si+0Ah], al
		mov	ax, [bp+arg_A]
		mov	[si+0Ch], ax
		mov	ax, [bp+arg_C]
		mov	[si+0Eh], ax
		mov	ax, [bp+arg_E]
		mov	[si], ax
		mov	al, [bp+arg_10]
		mov	[si+2], al
		mov	al, [bp+arg_12]
		mov	[si+3], al
		mov	al, [bp+arg_14]
		mov	[si+4], al
		mov	al, [bp+arg_16]
		mov	[si+5], al

loc_B918F:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_B912E		endp

; START OF FUNCTION CHUNK FOR sub_B912E
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_B912E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9197		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B9197		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B919F		proc far

var_F8		= word ptr -0F8h
var_9B		= dword ptr -9Bh
var_97		= dword ptr -97h
var_93		= dword ptr -93h
var_8B		= dword ptr -8Bh
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		mov	si, [bp+arg_0]
		push	seg seg182
		push	0
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aPALETTE
		lea	ax, [bp+var_50]
		push	ax
		call	sub_11166
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_F8], 480h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 498h
		mov	[bp+var_7C], 0
		xor	ax, ax
		mov	[bp+var_7E], ax
		movsx	eax, ax
		mov	[bp+var_93], eax
		push	1
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		mov	bx, [bp+var_F8]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_B9268
		cmp	[bp+var_8B], 544C4150h
		jnz	short loc_B922B
		mov	ax, 1
		jmp	short loc_B922D

loc_B922B:
		xor	ax, ax

loc_B922D:
		or	ax, ax
		jz	short loc_B925B
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_42C34
		add	sp, 2
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_B9298
		add	sp, 4
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	short loc_B9266

loc_B925B:
		push	9003h
		call	sub_13451
		add	sp, 2

loc_B9266:
		jmp	short loc_B9273

loc_B9268:
		push	9004h
		call	sub_13451
		add	sp, 2

loc_B9273:
		mov	[bp+var_F8], 498h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	si
		leave
		retf
sub_B919F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9298		proc far

var_A		= word ptr -0Ah
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		lea	ax, [bp+var_A]
		push	ax
		call	sub_1109C
		add	sp, 2
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_B95AD
		add	sp, 4
		push	0
		push	large 4C424154h
		push	di
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_B92EB
		push	di
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_B9849
		add	sp, 4

loc_B92EB:
		push	large 0
		push	si
		call	sub_23AA5
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_B9298		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B92FB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_B930D
		jmp	loc_B9447

loc_B930D:
		push	si
		nop
		push	cs
		call	near ptr sub_B944B
		add	sp, 2
		cmp	byte ptr [si+63h], 0
		jz	short loc_B933C
		cmp	dword ptr [si+5Eh], 0
		jz	short loc_B933C
		push	0
		mov	al, [si+62h]
		push	ax
		mov	ax, si
		add	ax, 5Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B933C

loc_B933C:
		mov	dword ptr [si+5Eh], 0
		mov	byte ptr [si+63h], 0
		mov	dword ptr [si+64h], 0
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_B9376
		cmp	dword ptr [si+27h], 0
		jz	short loc_B9376
		push	0
		mov	al, [si+2Bh]
		push	ax
		mov	ax, si
		add	ax, 27h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B9376

loc_B9376:
		mov	dword ptr [si+27h], 0
		mov	byte ptr [si+2Ch], 0
		mov	dword ptr [si+2Dh], 0
		cmp	byte ptr [si+22h], 0
		jz	short loc_B93B0
		cmp	dword ptr [si+1Dh], 0
		jz	short loc_B93B0
		push	0
		mov	al, [si+21h]
		push	ax
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B93B0

loc_B93B0:
		mov	dword ptr [si+1Dh], 0
		mov	byte ptr [si+22h], 0
		mov	dword ptr [si+23h], 0
		cmp	byte ptr [si+18h], 0
		jz	short loc_B93EA
		cmp	dword ptr [si+13h], 0
		jz	short loc_B93EA
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B93EA

loc_B93EA:
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		cmp	byte ptr [si+0Eh], 0
		jz	short loc_B9424
		cmp	dword ptr [si+9], 0
		jz	short loc_B9424
		push	0
		mov	al, [si+0Dh]
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B9424

loc_B9424:
		mov	dword ptr [si+9], 0
		mov	byte ptr [si+0Eh], 0
		mov	dword ptr [si+0Fh], 0
		test	di, 1
		jz	short loc_B9447
		push	si
		call	sub_39C
		add	sp, 2

loc_B9447:
		pop	di
		pop	si
		pop	bp
		retf
sub_B92FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B944B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Eh], 0
		jz	short loc_B9478
		cmp	dword ptr [si+9], 0
		jz	short loc_B9478
		push	0
		mov	al, [si+0Dh]
		push	ax
		mov	ax, si
		add	ax, 9
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B9478

loc_B9478:
		mov	dword ptr [si+9], 0
		mov	byte ptr [si+0Eh], 0
		mov	dword ptr [si+0Fh], 0
		cmp	byte ptr [si+18h], 0
		jz	short loc_B94B2
		cmp	dword ptr [si+13h], 0
		jz	short loc_B94B2
		push	0
		mov	al, [si+17h]
		push	ax
		mov	ax, si
		add	ax, 13h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B94B2

loc_B94B2:
		mov	dword ptr [si+13h], 0
		mov	byte ptr [si+18h], 0
		mov	dword ptr [si+19h], 0
		cmp	byte ptr [si+22h], 0
		jz	short loc_B94EC
		cmp	dword ptr [si+1Dh], 0
		jz	short loc_B94EC
		push	0
		mov	al, [si+21h]
		push	ax
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B94EC

loc_B94EC:
		mov	dword ptr [si+1Dh], 0
		mov	byte ptr [si+22h], 0
		mov	dword ptr [si+23h], 0
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_B9526
		cmp	dword ptr [si+27h], 0
		jz	short loc_B9526
		push	0
		mov	al, [si+2Bh]
		push	ax
		mov	ax, si
		add	ax, 27h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B9526

loc_B9526:
		mov	dword ptr [si+27h], 0
		mov	byte ptr [si+2Ch], 0
		mov	dword ptr [si+2Dh], 0
		cmp	byte ptr [si+63h], 0
		jz	short loc_B9560
		cmp	dword ptr [si+5Eh], 0
		jz	short loc_B9560
		push	0
		mov	al, [si+62h]
		push	ax
		mov	ax, si
		add	ax, 5Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B9560

loc_B9560:
		mov	dword ptr [si+5Eh], 0
		mov	byte ptr [si+63h], 0
		mov	dword ptr [si+64h], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 42h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		mov	dword ptr [si+42h], 0
		push	word ptr [si+5Ah]
		call	sub_39C
		add	sp, 2
		mov	word ptr [si+5Ah], 0
		push	si
		call	Palette_DestructResource
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_B944B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B95AD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_B95D0
		jmp	loc_B965E

loc_B95D0:
		push	di
		call	ResourceRecord_ReadFieldGroupC_42A91
		add	sp, 2
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+68h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+52h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+4Eh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+46h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+7Ah], ax
		mov	cl, [si+68h]
		mov	eax, 1
		shl	eax, cl
		mov	[si+6Ah], eax
		mov	eax, [si+6Ah]
		sar	eax, 1
		mov	[si+6Eh], eax
		mov	word ptr [si+54h], 0
		mov	ax, [si+52h]
		mov	[si+56h], ax
		mov	ax, [si+56h]
		shl	ax, 8
		mov	[si+50h], ax
		mov	cl, [si+4Eh]
		mov	ax, 1
		shl	ax, cl
		mov	[si+4Ch], ax
		movsx	eax, word ptr [si+46h]
		mov	cl, [si+7Ah]
		shl	eax, cl
		mov	[si+7Ch], eax

loc_B965E:
		push	0
		push	large 544C4150h
		push	di
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_B967D
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_B996B
		add	sp, 4

loc_B967D:
		push	0
		push	large 43594B53h
		push	di
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_B969C
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_B96E5
		add	sp, 4

loc_B969C:
		push	0
		push	large 48574C42h
		push	di
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_B96BB
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_B9AB8
		add	sp, 4

loc_B96BB:
		push	0
		push	large 474E4152h
		push	di
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_B96DC
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_B97CF
		add	sp, 4
		jmp	short loc_B96E1

loc_B96DC:
		mov	word ptr [si+58h], 0

loc_B96E1:
		pop	di
		pop	si
		pop	bp
		retf
sub_B95AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B96E5		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+33h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+35h], ax
		mov	ax, [si+33h]
		imul	word ptr [si+35h]
		mov	dx, ax
		shl	dx, 1
		add	dx, ax
		movsx	eax, dx
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	large [bp+var_8]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+27h], eax
		mov	byte ptr [si+2Bh], 2
		mov	byte ptr [si+2Ch], 1
		mov	dword ptr [si+2Dh], 0
		mov	eax, [bp+var_8]
		mov	[si+2Dh], eax
		push	0
		mov	al, [si+2Bh]
		push	ax
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		push	large [bp+var_4]
		push	[bp+var_E]
		push	[bp+var_10]
		push	di
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	word ptr [si+31h], 0
		mov	[bp+var_14], 4D6400h
		mov	ax, [si+33h]
		mov	[bp+var_16], ax
		movsx	ebx, [bp+var_16]
		mov	eax, [bp+var_14]
		cdq
		idiv	ebx
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[si+37h], eax
		mov	byte ptr [si+3Bh], 0
		pop	di
		pop	si
		leave
		retf
sub_B96E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B97CF		proc far

var_1E		= word ptr -1Eh
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[si+58h], ax
		push	seg stub221
		push	offset sub_48200
		push	1
		push	word ptr [si+58h]
		push	10h
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+5Ah], ax
		xor	di, di
		jmp	short loc_B9840

loc_B9806:
		push	large 0Dh
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	ax, di
		shl	ax, 4
		mov	dx, [si+5Ah]
		add	dx, ax
		push	ds
		push	dx
		push	si
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		push	cs
		call	near ptr sub_B90C0
		add	sp, 6
		push	ds
		push	ax
		mov	cx, 10h
		call	CRT_Fmemcpy
		inc	di

loc_B9840:
		cmp	[si+58h], di
		jg	short loc_B9806
		pop	di
		pop	si
		leave
		retf
sub_B97CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9849		proc far

var_F8		= word ptr -0F8h
var_9B		= dword ptr -9Bh
var_97		= dword ptr -97h
var_93		= dword ptr -93h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		mov	si, [bp+arg_0]
		push	seg seg182
		push	0
		push	ds
		push	[bp+arg_2]
		push	ds
		push	offset aPALETTE
		lea	ax, [bp+var_50]
		push	ax
		call	sub_11166
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_F8], 480h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 498h
		mov	[bp+var_7C], 0
		xor	ax, ax
		mov	[bp+var_7E], ax
		movsx	eax, ax
		mov	[bp+var_93], eax
		push	1
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		mov	bx, [bp+var_F8]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_B993B
		push	0
		push	large 4C425446h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jz	short loc_B992E
		push	0
		push	large 5A485F44h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_B9905
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_B9B5D
		add	sp, 4

loc_B9905:
		push	0
		push	large 45444146h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_B992C
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_B9BC5
		add	sp, 4

loc_B992C:
		jmp	short loc_B9939

loc_B992E:
		push	9005h
		call	sub_13451
		add	sp, 2

loc_B9939:
		jmp	short loc_B9946

loc_B993B:
		push	9006h
		call	sub_13451
		add	sp, 2

loc_B9946:
		mov	[bp+var_F8], 498h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	si
		leave
		retf
sub_B9849		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B996B		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	large [bp+var_8]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+9], eax
		mov	byte ptr [si+0Dh], 2
		mov	byte ptr [si+0Eh], 1
		mov	dword ptr [si+0Fh], 0
		mov	eax, [bp+var_8]
		mov	[si+0Fh], eax
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	word ptr [si+0Bh]
		push	word ptr [si+9]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_B99EA
		push	9007h
		call	sub_13451
		add	sp, 2

loc_B99EA:
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	word ptr [si+0Bh]
		push	word ptr [si+9]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	word ptr [si+0Bh]
		push	word ptr [si+9]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	sub_23870
		add	sp, 6
		mov	byte ptr [si+3Dh], 0
		mov	byte ptr [si+3Eh], 0FFh
		mov	al, 0
		mov	[si+41h], al
		mov	[si+40h], al
		mov	[si+3Fh], al
		mov	ax, word ptr [bp+var_4]
		add	ax, 0FFFCh
		mov	[si+7], ax
		movsx	eax, word ptr [si+7]
		mov	[bp+var_10], eax
		push	1
		push	0
		push	2
		push	large [bp+var_10]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_14]
		mov	[si+1Dh], eax
		mov	byte ptr [si+21h], 2
		mov	byte ptr [si+22h], 1
		mov	dword ptr [si+23h], 0
		mov	eax, [bp+var_10]
		mov	[si+23h], eax
		push	0
		mov	al, [si+21h]
		push	ax
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_B9AB4
		push	9030h
		call	sub_13451
		add	sp, 2

loc_B9AB4:
		pop	di
		pop	si
		leave
		retf
sub_B996B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9AB8		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	large [bp+var_8]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+13h], eax
		mov	byte ptr [si+17h], 2
		mov	byte ptr [si+18h], 1
		mov	dword ptr [si+19h], 0
		mov	eax, [bp+var_8]
		mov	[si+19h], eax
		push	0
		mov	al, [si+17h]
		push	ax
		push	word ptr [si+15h]
		push	word ptr [si+13h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_B9B37
		push	9009h
		call	sub_13451
		add	sp, 2

loc_B9B37:
		push	0
		mov	al, [si+17h]
		push	ax
		push	word ptr [si+15h]
		push	word ptr [si+13h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_B9AB8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9B5D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+46h]
		mov	cl, [si+4Eh]
		shl	ax, cl
		shl	ax, 2
		movzx	eax, ax
		cmp	eax, [di+72h]
		jz	short loc_B9B88
		push	900Ah
		call	sub_13451
		add	sp, 2

loc_B9B88:
		push	1
		push	0
		push	2
		push	large [di+72h]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[si+44h], dx
		mov	[si+42h], ax
		or	ax, dx
		jnz	short loc_B9BB2
		push	900Bh
		call	sub_13451
		add	sp, 2

loc_B9BB2:
		push	word ptr [si+44h]
		push	word ptr [si+42h]
		push	di
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_B9B5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9BC5		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+72h]
		mov	[si+5Ch], ax
		movsx	eax, word ptr [si+5Ch]
		mov	[bp+var_4], eax
		push	37C4h
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	6C14h
		call	Memory_TypedFreeWrapperB_328F2
		add	sp, 0Eh
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+5Eh], eax
		mov	byte ptr [si+62h], 2
		mov	byte ptr [si+63h], 1
		mov	dword ptr [si+64h], 0
		mov	eax, [bp+var_4]
		mov	[si+64h], eax
		mov	ax, [si+5Ch]
		shr	ax, 8
		mov	[si+5Ch], ax
		push	word ptr [si+60h]
		push	word ptr [si+5Eh]
		push	di
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_B9BC5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9C3C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B9C57
		push	10h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B9C5C

loc_B9C57:
		mov	ax, si
		add	ax, 8

loc_B9C5C:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_B9C3C		endp

; START OF FUNCTION CHUNK FOR sub_B9C3C
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_B9C3C
ovr221		ends
