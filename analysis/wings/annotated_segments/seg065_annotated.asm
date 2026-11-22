seg065		segment	para public 'CODE' use16
		assume cs:seg065
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F3C3		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2F3C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F3C8		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2F3C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F3CD		proc far

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
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_2F3F7
		jmp	loc_2F4BB

loc_2F3F7:
		mov	[bp+var_6], si
		push	1
		push	0
		push	2
		push	large 0A6h
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_8], dx
		mov	[bp+var_A], ax
		or	ax, dx
		jnz	short loc_2F41E
		jmp	loc_2F4AF

loc_2F41E:
		les	bx, [bp+var_A]
		mov	word ptr es:[bx], 260Ch
		mov	word ptr es:[bx], 2618h
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		mov	dword ptr es:[bx+12h], 0
		mov	byte ptr es:[bx+16h], 2
		mov	byte ptr es:[bx+17h], 0
		mov	dword ptr es:[bx+18h], 0
		mov	dword ptr es:[bx+1Ch], 0
		mov	byte ptr es:[bx+20h], 2
		mov	byte ptr es:[bx+21h], 0
		mov	dword ptr es:[bx+22h], 0
		xor	ax, ax
		mov	es:[bx+8Ch], ax
		mov	es:[bx+8Ah], ax
		xor	eax, eax
		mov	es:[bx+92h], eax
		mov	es:[bx+8Eh], eax
		push	[bp+var_6]
		push	dx
		push	bx
		call	sub_593B5
		add	sp, 6
		mov	dx, [bp+var_8]
		mov	ax, [bp+var_A]
		jmp	short loc_2F4B5

loc_2F4AF:
		mov	dx, [bp+var_8]
		mov	ax, [bp+var_A]

loc_2F4B5:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2F4BB:
		cmp	[bp+var_4], 0
		jnz	short loc_2F4CC
		push	6002h
		call	sub_9D47
		jmp	short loc_2F4D2

loc_2F4CC:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4

loc_2F4D2:
		pop	cx
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_2F3CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F4DC		proc far

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
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_2F507
		jmp	loc_2F5EB

loc_2F507:
		push	0
		push	large 454C4946h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_2F51F
		jmp	loc_2F5D8

loc_2F51F:
		mov	[bp+var_10], si
		push	[bp+var_10]
		lea	ax, [bp+var_E]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_B8], 9B5h
		mov	[bp+var_57], 100h
		mov	[bp+var_5B], 0
		mov	[bp+var_B8], 9CDh
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
		jnz	short loc_2F58E
		mov	ax, 1
		jmp	short loc_2F590

loc_2F58E:
		xor	ax, ax

loc_2F590:
		or	ax, ax
		jz	short loc_2F5AD
		push	si
		call	sub_541A0
		pop	cx
		lea	ax, [bp+var_B8]
		push	ax
		push	cs
		call	near ptr sub_2F3CD
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_2F5B6

loc_2F5AD:
		push	6003h
		call	sub_9D47
		pop	cx

loc_2F5B6:
		mov	[bp+var_B8], 9CDh
		lea	ax, [bp+var_B8]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		jmp	short loc_2F5E4

loc_2F5D8:
		push	si
		push	cs
		call	near ptr sub_2F3CD
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2F5E4:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_2F5EB:
		mov	dx, word ptr [bp+var_4+2]
sub_2F4DC		endp

; START OF FUNCTION CHUNK FOR sub_2F4DC
		db 8Bh
		inc	si
; END OF FUNCTION CHUNK FOR sub_2F4DC
seg065		ends
