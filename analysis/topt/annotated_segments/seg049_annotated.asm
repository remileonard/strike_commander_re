seg049		segment	para public 'CODE' use16
		assume cs:seg049
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E660		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1E660		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E665		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		push	0
		push	large 594C4F50h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_1E68F
		jmp	loc_1E75D

loc_1E68F:
		mov	[bp+var_6], si
		push	1
		push	0
		push	2
		push	large 94h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_8], dx
		mov	[bp+var_A], ax
		or	ax, dx
		jnz	short loc_1E6B6
		jmp	loc_1E751

loc_1E6B6:
		les	bx, [bp+var_A]
		mov	word ptr es:[bx], 371Eh
		les	bx, [bp+var_A]
		mov	word ptr es:[bx], 372Ah
		les	bx, [bp+var_A]
		mov	dword ptr es:[bx+8], 0
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+0Ch], 2
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+0Dh], 0
		les	bx, [bp+var_A]
		mov	dword ptr es:[bx+0Eh], 0
		les	bx, [bp+var_A]
		mov	dword ptr es:[bx+12h], 0
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+16h], 2
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+17h], 0
		les	bx, [bp+var_A]
		mov	dword ptr es:[bx+18h], 0
		les	bx, [bp+var_A]
		xor	ax, ax
		mov	es:[bx+7Eh], ax
		les	bx, [bp+var_A]
		mov	es:[bx+7Ch], ax
		les	bx, [bp+var_A]
		xor	ax, ax
		mov	es:[bx+82h], ax
		les	bx, [bp+var_A]
		mov	es:[bx+80h], ax
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_A]
		call	sub_486A5
		add	sp, 6
		mov	dx, [bp+var_8]
		mov	ax, [bp+var_A]
		jmp	short loc_1E757

loc_1E751:
		mov	dx, [bp+var_8]
		mov	ax, [bp+var_A]

loc_1E757:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_1E75D:
		cmp	[bp+var_4], 0
		jnz	short loc_1E771
		push	6002h
		call	sub_13451
		add	sp, 2
		jmp	short loc_1E77A

loc_1E771:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_1E77A:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_1E665		endp

; START OF FUNCTION CHUNK FOR sub_1E665
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1E665

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E786		proc far

var_B8		= word ptr -0B8h
var_5B		= dword ptr -5Bh
var_57		= dword ptr -57h
var_53		= dword ptr -53h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B8h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		push	0
		push	large 52505041h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_1E7B1
		jmp	loc_1E8A3

loc_1E7B1:
		push	0
		push	large 454C4946h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_1E7C9
		jmp	loc_1E88C

loc_1E7C9:
		mov	[bp+var_10], si
		push	[bp+var_10]
		lea	ax, [bp+var_E]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_B8], 480h
		mov	[bp+var_57], 100h
		mov	[bp+var_5B], 0
		mov	[bp+var_B8], 498h
		mov	[bp+var_3C], 0
		xor	ax, ax
		mov	[bp+var_3E], ax
		movsx	eax, ax
		mov	[bp+var_53], eax
		push	1
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		mov	bx, [bp+var_B8]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	dword ptr [si+6Dh], 52505041h
		jnz	short loc_1E83A
		mov	ax, 1
		jmp	short loc_1E83C

loc_1E83A:
		xor	ax, ax

loc_1E83C:
		or	ax, ax
		jz	short loc_1E85D
		push	si
		call	sub_42C34
		add	sp, 2
		lea	ax, [bp+var_B8]
		push	ax
		push	cs
		call	near ptr sub_1E665
		add	sp, 2
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_1E868

loc_1E85D:
		push	6003h
		call	sub_13451
		add	sp, 2

loc_1E868:
		mov	[bp+var_B8], 498h
		lea	ax, [bp+var_B8]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		jmp	short loc_1E89A

loc_1E88C:
		push	si
		push	cs
		call	near ptr sub_1E665
		add	sp, 2
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_1E89A:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
sub_1E786		endp
seg049		ends
