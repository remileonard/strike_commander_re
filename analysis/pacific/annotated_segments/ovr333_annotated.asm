ovr333		segment	para public 'OVERLAY' use16
		assume cs:ovr333
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6EB0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_B6EC5
		mov	ax, [si+4]
		jmp	short loc_B6EC9

loc_B6EC5:
		dec	word ptr [di]
		xor	ax, ax

loc_B6EC9:
		pop	di
		pop	si
		pop	bp
		retf
sub_B6EB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6ECD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	word ptr [si+4]
		push	[bp+arg_2]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_B6EEE
		mov	al, 1
		jmp	short loc_B6EF2

loc_B6EEE:
		inc	word ptr [di]
		mov	al, 0

loc_B6EF2:
		pop	di
		pop	si
		pop	bp
		retf
sub_B6ECD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6EF6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		cmp	ax, [si+7]
		jl	short loc_B6F11
		mov	ax, [si+7]
		sub	[di], ax
		xor	ax, ax
		jmp	short loc_B6F22

loc_B6F11:
		mov	dx, [si+4]
		jmp	short loc_B6F1B

loc_B6F16:
		add	dx, [si+9]
		dec	word ptr [di]

loc_B6F1B:
		cmp	word ptr [di], 0
		jg	short loc_B6F16
		mov	ax, dx

loc_B6F22:
		pop	di
		pop	si
		pop	bp
		retf
sub_B6EF6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6F26		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+4]
		mov	[bp+var_2], 0
		jmp	short loc_B6F5A

loc_B6F3B:
		push	di
		push	[bp+arg_2]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_B6F4F
		mov	al, 1
		jmp	short loc_B6F64

loc_B6F4F:
		mov	bx, [bp+arg_4]
		inc	word ptr [bx]
		inc	[bp+var_2]
		add	di, [si+9]

loc_B6F5A:
		mov	ax, [si+7]
		cmp	ax, [bp+var_2]
		jg	short loc_B6F3B
		mov	al, 0

loc_B6F64:
		pop	di
		pop	si
		leave
		retf
sub_B6F26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6F68		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+6], 0
		jnz	short loc_B6F8F
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_B70EF
		add	sp, 4
		cmp	ax, 0FFFFh
		jz	short loc_B6F8F
		mov	al, 0
		jmp	short loc_B6FDE

loc_B6F8F:
		mov	[bp+var_2], di
		push	7
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_B6FC1
		mov	word ptr [di], 9B2h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 2CB0h
		push	[bp+var_2]
		call	CRT_Strdup
		pop	cx
		mov	[di+4], ax
		mov	byte ptr [di+6], 1
		mov	ax, di
		jmp	short loc_B6FC3

loc_B6FC1:
		mov	ax, di

loc_B6FC3:
		mov	di, ax
		or	di, di
		jz	short loc_B6FD3
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_68A21
		add	sp, 4

loc_B6FD3:
		or	di, di
		jz	short loc_B6FDC
		mov	ax, 1
		jmp	short loc_B6FDE

loc_B6FDC:
		xor	ax, ax

loc_B6FDE:
		pop	di
		pop	si
		leave
		retf
sub_B6F68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6FE2		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	0Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_B7041
		mov	word ptr [di], 9B2h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 2CB0h
		mov	word ptr [di+4], 0
		mov	byte ptr [di+6], 0
		mov	word ptr [di], 2CA4h
		mov	ax, [bp+var_4]
		mov	[di+7], ax
		mov	ax, [bp+var_6]
		mov	[di+9], ax
		mov	ax, [bp+var_2]
		mov	[di+4], ax
		mov	byte ptr [di+6], 0
		mov	ax, di
		jmp	short loc_B7043

loc_B7041:
		mov	ax, di

loc_B7043:
		mov	di, ax
		or	di, di
		jz	short loc_B7053
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_68A21
		add	sp, 4

loc_B7053:
		or	di, di
		jz	short loc_B705C
		mov	ax, 1
		jmp	short loc_B705E

loc_B705C:
		xor	ax, ax

loc_B705E:
		pop	di
		pop	si
		leave
		retf
sub_B6FE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7062		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B709A

loc_B7073:
		push	[bp+arg_2]
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_B709A
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6
		mov	al, 1
		jmp	short loc_B70AD

loc_B709A:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_B7073
		mov	al, 0

loc_B70AD:
		pop	si
		leave
		retf
sub_B7062		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B70B0		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B70D9

loc_B70C1:
		lea	ax, [bp+arg_2]
		push	ax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jnz	short loc_B70EC

loc_B70D9:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_B70C1
		xor	ax, ax

loc_B70EC:
		pop	si
		leave
		retf
sub_B70B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B70EF		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_B7123

loc_B7105:
		lea	ax, [bp+var_4]
		push	ax
		push	[bp+arg_2]
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 6
		or	al, al
		jz	short loc_B7123
		mov	ax, [bp+var_4]
		jmp	short loc_B7137

loc_B7123:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_B7105
		mov	ax, 0FFFFh

loc_B7137:
		pop	si
		leave
		retf
sub_B70EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B713A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B713A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7142		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		add	ax, [si+1Eh]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [si+1Eh]
		mov	di, ax
		mov	ax, [si+8]
		sub	ax, [si+1Eh]
		mov	[bp+var_4], ax
		push	si
		call	sub_74AD7
		pop	cx
		mov	[bp+var_8], 0
		jmp	short loc_B71F1

loc_B7175:
		mov	bx, [si+2Eh]
		mov	ax, [bx]
		add	ax, [bp+var_8]
		mov	[bp+var_A], ax
		push	ax
		mov	ax, si
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_B70B0
		add	sp, 4
		mov	[bp+var_C], ax
		cmp	word ptr [si+2Ch], 0
		jz	short loc_B71A8
		mov	ax, [si+2Ch]
		cmp	ax, [bp+var_C]
		jnz	short loc_B71A8
		mov	dx, word_791F8
		mov	ax, word_79216
		jmp	short loc_B71AF

loc_B71A8:
		mov	dx, word_79220
		mov	ax, word_7921A

loc_B71AF:
		mov	[bp+var_6], ax
		push	dx
		mov	ax, di
		add	ax, [si+20h]
		dec	ax
		push	ax
		push	[bp+var_4]
		push	di
		push	[bp+var_2]
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		cmp	[bp+var_C], 0
		jz	short loc_B71EB
		push	word_79260
		push	[bp+var_6]
		push	[bp+var_C]
		push	di
		mov	ax, [bp+var_2]
		inc	ax
		push	ax
		call	sub_74BA9
		add	sp, 0Ah

loc_B71EB:
		inc	[bp+var_8]
		add	di, [si+20h]

loc_B71F1:
		mov	ax, [si+30h]
		cmp	ax, [bp+var_8]
		jle	short loc_B71FC
		jmp	loc_B7175

loc_B71FC:
		mov	al, byte ptr word_79222
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_79222
		push	ax
		mov	ax, [si+0Ah]
		dec	ax
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_7921C
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		mov	ax, [si+6]
		inc	ax
		push	ax
		push	word ptr [si+8]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_7921C
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+0Ah]
		push	word ptr [si+4]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_B7142		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B727B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_4]
		sub	ax, [si+1Eh]
		cwd
		idiv	word ptr [si+20h]
		mov	[bp+var_2], ax
		mov	bx, [si+2Eh]
		mov	dx, [bx]
		add	dx, [bp+var_2]
		cmp	[si+22h], dx
		jle	short loc_B72C8
		push	dx
		mov	ax, si
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_B70B0
		add	sp, 4
		mov	dx, ax
		cmp	[si+2Ch], dx
		jnz	short loc_B72BD
		mov	bx, [si+32h]
		mov	word ptr [bx], 1
		jmp	short loc_B72C8

loc_B72BD:
		mov	[si+2Ch], dx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_B72C8:
		pop	si
		leave
		retf
sub_B727B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B72CB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+84h], 0
		pop	si
		pop	bp
		retf
sub_B72CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B72DB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+36h], 0
		jz	short loc_B72EF
		push	si
		call	sub_74CEE
		pop	cx

loc_B72EF:
		pop	si
		pop	bp
		retf
sub_B72DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B72F2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ah], 0
		jz	short loc_B734A
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_2], ax
		mov	di, ax
		push	word ptr [si+7Ah]
		call	sub_74B9A
		pop	cx
		mov	dx, ax
		mov	bx, [si+1Ah]
		sub	bx, di
		sub	bx, di
		cmp	dx, bx
		jge	short loc_B732C
		mov	ax, bx
		sub	ax, dx
		sar	ax, 1
		add	di, ax

loc_B732C:
		push	word_79260
		push	0FFFFh
		push	word ptr [si+7Ah]
		mov	ax, [si+6]
		add	ax, [bp+var_2]
		push	ax
		mov	ax, [si+4]
		add	ax, di
		push	ax
		call	sub_74BA9
		add	sp, 0Ah

loc_B734A:
		pop	di
		pop	si
		leave
		retf
sub_B72F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B734E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_74AA5
		pop	cx
		cmp	word ptr [si+7Ah], 0
		jz	short loc_B7368
		push	si
		push	cs
		call	near ptr sub_B72F2
		pop	cx

loc_B7368:
		push	si
		nop
		push	cs
		call	near ptr AITargeting_Helper4_B765C
		pop	cx
		push	si
		call	sub_74C58
		pop	cx
		pop	si
		pop	bp
		retf
sub_B734E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7379		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		jmp	short loc_B7391

loc_B7386:
		push	1
		push	si
		call	sub_74CE4
		add	sp, 4

loc_B7391:
		cmp	word ptr [si+7Ch], 0
		jz	short loc_B7386
		mov	bx, [si+84h]
		cmp	word ptr [bx+2Ch], 0
		jz	short loc_B73B6
		push	word ptr [bx+2Ch]
		push	di
		call	CRT_Strcpy
		add	sp, 4
		push	di
		call	CRT_Strupr_30EF
		pop	cx
		jmp	short loc_B73B9

loc_B73B6:
		mov	byte ptr [di], 0

loc_B73B9:
		pop	di
		pop	si
		pop	bp
		retf
sub_B7379		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B73BD		proc far

var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_74CBC
		pop	cx
		mov	[bp+var_6], 2
		mov	[bp+var_8], 0Ah
		mov	ax, [si+1Ah]
		add	ax, 0FFFCh
		mov	[bp+var_A], ax
		mov	ax, [si+1Ch]
		add	ax, 0FFE2h
		mov	[bp+var_C], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_8]
		add	ax, [bp+var_C]
		add	ax, 8
		mov	[bp+var_10], ax
		mov	ax, [si+1Ah]
		add	ax, 0FFFCh
		mov	[bp+var_12], ax
		mov	di, [bp+var_6]
		add	di, 0Bh
		mov	ax, [bp+var_8]
		mov	[bp+var_2], ax
		mov	cx, [bp+var_C]
		mov	ax, [bp+var_A]
		add	ax, 0FFF5h
		mov	[bp+var_4], ax
		mov	ax, cx
		add	ax, 0FFFEh
		mov	bx, 8
		cwd
		idiv	bx
		mov	[si+76h], ax
		mov	[bp+var_14], di
		mov	ax, [bp+var_2]
		mov	[bp+var_16], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_18], ax
		mov	[bp+var_1A], cx
		mov	ax, [si+76h]
		mov	[bp+var_1C], ax
		mov	ax, si
		add	ax, 74h
		mov	[bp+var_1E], ax
		mov	ax, si
		add	ax, 7Ch
		mov	[bp+var_20], ax
		push	34h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_B74C1
		push	[bp+var_1A]
		push	[bp+var_18]
		push	[bp+var_16]
		push	[bp+var_14]
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 2C70h
		mov	word ptr [di+24h], 909h
		xor	ax, ax
		mov	[di+28h], ax
		mov	[di+26h], ax
		mov	word ptr [di+24h], 2C6Ch
		mov	word ptr [di+2Ah], 0
		mov	word ptr [di+2Ch], 0
		and	byte ptr [di+10h], 0FDh
		mov	word ptr [di+16h], 0
		mov	ax, [bp+var_1C]
		mov	[di+30h], ax
		mov	ax, [bp+var_20]
		mov	[di+32h], ax
		mov	ax, [bp+var_1E]
		mov	[di+2Eh], ax
		mov	word ptr [di+1Eh], 2
		mov	word ptr [di+20h], 8
		mov	ax, di
		jmp	short loc_B74C3

loc_B74C1:
		mov	ax, di

loc_B74C3:
		mov	[si+84h], ax
		push	0
		push	word ptr [si+84h]
		push	si
		call	sub_74C8A
		add	sp, 6
		mov	di, [bp+var_6]
		mov	ax, [bp+var_8]
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0Bh
		mov	cx, [bp+var_C]
		push	0
		mov	[bp+var_22], di
		mov	[bp+var_24], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_26], ax
		mov	[bp+var_28], cx
		push	58h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_B7543
		push	[bp+var_28]
		push	[bp+var_26]
		push	[bp+var_24]
		push	[bp+var_22]
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 2BF4h
		push	di
		call	sub_749A9
		pop	cx
		mov	word ptr [di+0Eh], 2C30h
		mov	byte ptr [di+1Eh], 1
		mov	ax, [bp+var_26]
		mov	[di+1Fh], ax
		mov	ax, [di+1Fh]
		add	ax, 0FFFEh
		mov	[di+45h], ax
		mov	ax, di
		jmp	short loc_B7545

loc_B7543:
		mov	ax, di

loc_B7545:
		mov	[si+7Eh], ax
		push	ax
		push	si
		call	sub_74C8A
		add	sp, 6
		push	word ptr [si+84h]
		mov	ax, si
		add	ax, 74h
		push	ax
		push	word ptr [si+76h]
		push	word ptr [si+78h]
		push	word ptr [si+7Eh]
		mov	bx, [si+7Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+38h]
		add	sp, 0Ah
		mov	di, [bp+var_E]
		add	di, [bp+var_12]
		add	di, 0FFE7h
		mov	ax, [bp+var_10]
		mov	[bp+var_2], ax
		mov	[bp+var_4], 18h
		mov	cx, 0Ah
		mov	al, [si+73h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_B7594
		jmp	loc_B762D

loc_B7594:
		push	1
		mov	[bp+var_2A], di
		mov	ax, [bp+var_2]
		mov	[bp+var_2C], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_2E], ax
		mov	[bp+var_30], cx
		mov	ax, si
		add	ax, 7Ch
		mov	[bp+var_32], ax
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_B7621
		mov	word ptr [bp+var_36+2], ds
		mov	word ptr [bp+var_36], 2BF0h
		push	[bp+var_30]
		push	[bp+var_2E]
		push	[bp+var_2C]
		push	[bp+var_2A]
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 0C9Ah
		mov	dword ptr [di+24h], 0
		push	large [bp+var_36]
		push	di
		call	sub_74B18
		add	sp, 6
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+20h], 0
		mov	ax, word_7921A
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	word ptr [di+22h], 0FFFFh
		mov	word ptr [di+0Eh], 0C66h
		mov	ax, [bp+var_32]
		mov	[di+2Ch], ax
		mov	word ptr [di+2Eh], 1
		mov	ax, di
		jmp	short loc_B7623

loc_B7621:
		mov	ax, di

loc_B7623:
		push	ax
		push	si
		call	sub_74C8A
		add	sp, 6

loc_B762D:
		pop	di
		pop	si
		leave
		retf
sub_B73BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7631		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+84h]
		mov	ax, si
		add	ax, 74h
		push	ax
		push	word ptr [si+76h]
		push	word ptr [si+78h]
		push	word ptr [si+7Eh]
		mov	bx, [si+7Eh]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+38h]
		add	sp, 0Ah
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_B7631		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AITargeting_Helper4_86948 (sub_86948 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (21 lignes).
; ==============================================================================================
AITargeting_Helper4_B765C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+84h], 0
		jz	short loc_B7679
		push	word ptr [si+84h]
		mov	bx, [si+84h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_B7679:
		pop	si
		pop	bp
		retf
AITargeting_Helper4_B765C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B767C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, [si+84h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_B6F68
		add	sp, 4
		or	al, al
		jz	short loc_B769F
		inc	word ptr [si+78h]

loc_B769F:
		mov	ax, [si+78h]
		mov	[bp+var_2], ax
		mov	bx, [si+84h]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_B7631
		pop	cx
		pop	si
		leave
		retf
sub_B767C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B76B5		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, [si+84h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_B7062
		add	sp, 4
		or	al, al
		jz	short loc_B76D8
		dec	word ptr [si+78h]

loc_B76D8:
		mov	ax, [si+78h]
		mov	[bp+var_2], ax
		mov	bx, [si+84h]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_B7631
		pop	cx
		pop	si
		leave
		retf
sub_B76B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B76EE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	[bp+arg_6]
		push	di
		push	[bp+arg_2]
		mov	ax, [si+84h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_B6FE2
		add	sp, 8
		or	al, al
		jz	short loc_B7719
		add	[si+78h], di

loc_B7719:
		mov	ax, [si+78h]
		mov	[bp+var_2], ax
		mov	bx, [si+84h]
		mov	[bx+22h], ax
		push	si
		push	cs
		call	near ptr sub_B7631
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_B76EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7730		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		mov	ax, [si+84h]
		add	ax, 24h
		push	ax
		push	cs
		call	near ptr sub_B70EF
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_B7730		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ReleaseStyleAndObject_A2BFF (sub_A2BFF
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine TextFormat_ReleaseStyleList_5E526 et libération d'objet (sub_338).
; ==============================================================================================
PaletteScreen_ReleaseStyleAndObject_B774C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B7771
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_B7771
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_B7771

loc_B7771:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_ReleaseStyleAndObject_B774C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ReleaseStyleAndObject_A2BFF (sub_A2BFF
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine TextFormat_ReleaseStyleList_5E526 et libération d'objet (sub_338).
; ==============================================================================================
PaletteScreen_ReleaseStyleAndObject_B7775		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B779A
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_B779A
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_B779A

loc_B779A:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_ReleaseStyleAndObject_B7775		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B779E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B77D0
		mov	word ptr [si], 2C6Ch
		push	si
		nop
		push	cs
		call	near ptr sub_B713A
		pop	cx
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_B77D0
		push	si
		call	sub_3B2
		pop	cx

loc_B77D0:
		pop	di
		pop	si
		pop	bp
		retf
sub_B779E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B77D4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		cmp	ax, 1
		jnz	short loc_B77F0
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		mov	ax, 1
		jmp	short loc_B77F2

loc_B77F0:
		xor	ax, ax

loc_B77F2:
		pop	si
		pop	bp
		retf
sub_B77D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B77F5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B783C
		mov	word ptr [si+24h], 2C6Ch
		mov	ax, si
		add	ax, 24h
		push	ax
		nop
		push	cs
		call	near ptr sub_B713A
		pop	cx
		mov	word ptr [si+24h], 909h
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_68B0D
		pop	cx
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_B783C
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_B783C

loc_B783C:
		pop	di
		pop	si
		pop	bp
		retf
sub_B77F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7840		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B787A
		mov	word ptr [si], 2CA4h
		mov	word ptr [si], 2CB0h
		cmp	byte ptr [si+6], 0
		jz	short loc_B7868
		push	word ptr [si+4]
		call	sub_3B2
		pop	cx
		jmp	short loc_B7868

loc_B7868:
		mov	word ptr [si+4], 0
		test	di, 1
		jz	short loc_B787A
		push	si
		call	sub_3B2
		pop	cx

loc_B787A:
		pop	di
		pop	si
		pop	bp
		retf
sub_B7840		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B787E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B78B4
		mov	word ptr [si], 2CB0h
		cmp	byte ptr [si+6], 0
		jz	short loc_B78A2
		push	word ptr [si+4]
		call	sub_3B2
		pop	cx
		jmp	short loc_B78A2

loc_B78A2:
		mov	word ptr [si+4], 0
		test	di, 1
		jz	short loc_B78B4
		push	si
		call	sub_3B2
		pop	cx

loc_B78B4:
		pop	di
		pop	si
		pop	bp
		retf
sub_B787E		endp
ovr333		ends
