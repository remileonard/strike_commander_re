ovr224		segment	para public 'OVERLAY' use16
		assume cs:ovr224
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA000		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_BA014
		jmp	loc_BA0A5

loc_BA014:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 38A8h
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+8], 0
		jz	short loc_BA05B
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		call	sub_194AF
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BA05B

loc_BA05B:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_BA084
		push	3
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+17h]
		push	word ptr es:[bx+15h]
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_BA084

loc_BA084:
		test	si, 1
		jz	short loc_BA0A5
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_BA0A5:
		pop	si
		leave
		retf
sub_BA000		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA0A8		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		or	si, si
		jz	short loc_BA0CD
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 19h
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	eax, [bp+var_4]
		mov	[si+6], eax

loc_BA0CD:
		pop	si
		leave
		retf
sub_BA0A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA0D0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0Fh], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0Dh], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+2], 1
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+3], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+4], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+6], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+15h], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+8], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 0
		pop	bp
		retf
sub_BA0D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA129		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_49DEF, cl
		mov	byte_4C34C, 0
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_BA0D0
		add	sp, 4
		push	1
		push	0
		push	2
		push	large 17h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_BA1C5
		mov	[bp+var_8], 5DC00h
		mov	eax, [bp+var_8]
		les	bx, [bp+var_4]
		mov	es:[bx+10h], eax
		les	bx, [bp+var_4]
		xor	eax, eax
		mov	es:[bx+4], eax
		les	bx, [bp+var_4]
		mov	es:[bx], eax
		les	bx, [bp+var_4]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		les	bx, [bp+var_4]
		mov	es:[bx+8], eax
		les	bx, [bp+var_4]
		mov	word ptr es:[bx+14h], 0
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx+16h], 0
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_BA1CB

loc_BA1C5:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_BA1CB:
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], dx
		mov	es:[bx+8], ax
		push	0
		push	large 474D4144h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BA20F
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+6], 0FFFFh
		jnz	short loc_BA20D
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+3], 1

loc_BA20D:
		jmp	short loc_BA218

loc_BA20F:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+6], 0Ah

loc_BA218:
		pop	si
		leave
		retf
sub_BA129		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA21B		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_49DEF, cl
		push	0
		push	large 45545845h
		push	di
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_BA24E
		jmp	loc_BA32E

loc_BA24E:
		push	di
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+10h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_2], ax
		push	di
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+16h], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	word ptr es:[bx+14h], 0
		xor	si, si
		jmp	loc_BA326

loc_BA29E:
		push	di
		call	sub_48144
		add	sp, 2
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_BA325
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		inc	word ptr es:[bx+14h]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+4]
		or	ax, es:[bx+6]
		jnz	short loc_BA2F5
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short loc_BA323

loc_BA2F5:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+4]
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+4], ax
		mov	es:[bx+2], dx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	ax, word ptr [bp+var_6+2]
		mov	dx, word ptr [bp+var_6]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx

loc_BA323:
		jmp	short loc_BA325

loc_BA325:
		inc	si

loc_BA326:
		cmp	si, [bp+var_2]
		jge	short loc_BA32E
		jmp	loc_BA29E

loc_BA32E:
		pop	di
		pop	si
		leave
		retf
sub_BA21B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA332		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_BA37B

loc_BA343:
		mov	bx, [bp+var_2]
		cmp	dword ptr [bx+4], 0
		jz	short loc_BA368
		push	3
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		mov	bx, [bp+var_2]
		les	bx, [bx+4]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_BA368

loc_BA368:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		mov	[bp+var_2], 0

loc_BA37B:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_BA343
		pop	si
		leave
		retf
sub_BA332		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA38F		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_6], eax
		push	8
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_BA3CB
		mov	word ptr [di], 4F8h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 38A4h
		mov	eax, [bp+var_6]
		mov	[di+4], eax
		mov	ax, di
		jmp	short loc_BA3CD

loc_BA3CB:
		mov	ax, di

loc_BA3CD:
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_36616
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_BA38F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA3E0		proc far
		push	bp
		mov	bp, sp
		push	si
		mov	si, 0Ah
		jmp	short loc_BA3FF

loc_BA3E9:
		push	si
		call	PC_SoundOn
		add	sp, 2
		push	5
		call	PIT_DelayLoop
		add	sp, 2
		add	si, 1Eh

loc_BA3FF:
		cmp	si, 1388h
		jl	short loc_BA3E9
		call	sub_2159
		pop	si
		pop	bp
		retf
sub_BA3E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA40D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large 4D524F46h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BA442
		push	si
		call	ResourceRecord_ReadDwordAdvance_42BAE
		add	sp, 2
		push	si
		call	sub_42C34
		add	sp, 2
		mov	al, 1
		pop	si
		pop	bp
		retf
		jmp	short loc_BA447

loc_BA442:
		mov	al, 0
		pop	si
		pop	bp
		retf
sub_BA40D		endp

; START OF FUNCTION CHUNK FOR sub_BA40D

loc_BA447:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BA40D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA44A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_BA46C
		test	di, 1
		jz	short loc_BA46A
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_BA46A

loc_BA46A:
		jmp	short loc_BA46C

loc_BA46C:
		pop	di
		pop	si
		pop	bp
		retf
sub_BA44A		endp

; START OF FUNCTION CHUNK FOR sub_BA44A
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BA44A
ovr224		ends
