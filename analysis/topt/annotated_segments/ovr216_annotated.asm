ovr216		segment	para public 'OVERLAY' use16
		assume cs:ovr216
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6860		proc far

var_146		= word ptr -146h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 146h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		cmp	ax, word_4CE02
		jz	short loc_B688D
		lea	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+arg_2]
		push	word_4CE02
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_B688D:
		push	ds
		push	word_4CE02
		call	File_CreateWithRetry_40354
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_B68A6
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf

loc_B68A6:
		mov	di, [si+6]
		jmp	short loc_B6911

loc_B68AB:
		mov	bx, word_4D36E
		mov	ax, [bx]
		mov	dx, di
		shl	dx, 1
		mov	bx, word_4D36E
		mov	bx, [bx+2]
		add	bx, dx
		mov	dx, [bx]
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		mov	ax, [si+4]
		add	[bp+var_6], ax
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		push	[bp+var_4]
		push	[bp+var_6]
		push	ss
		lea	ax, [bp+var_146]
		push	ax
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_2]
		push	large 0FFFFFFFFh
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		movsx	eax, ax
		push	eax
		push	ss
		lea	ax, [bp+var_146]
		push	ax
		call	sub_41EA
		or	ax, dx
		jnz	short loc_B6910
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf

loc_B6910:
		inc	di

loc_B6911:
		cmp	[si+0Ah], di
		jge	short loc_B68AB
		push	[bp+var_2]
		call	sub_403AF
		mov	ax, 1
		pop	di
		pop	si
		leave
		retf
sub_B6860		endp

; START OF FUNCTION CHUNK FOR sub_B6860
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B6860

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6929		proc far

var_146		= word ptr -146h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 146h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		cmp	ax, word_4CE02
		jz	short loc_B6956
		lea	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+arg_2]
		push	word_4CE02
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_B6956:
		push	ds
		push	word_4CE02
		push	2
		call	File_OpenWithRetry_40380
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_B6971
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf

loc_B6971:
		mov	di, [si+6]
		jmp	short loc_B69DC

loc_B6976:
		mov	bx, word_4D36E
		mov	ax, [bx]
		mov	dx, di
		shl	dx, 1
		mov	bx, word_4D36E
		mov	bx, [bx+2]
		add	bx, dx
		mov	dx, [bx]
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		mov	ax, [si+4]
		add	[bp+var_6], ax
		push	[bp+var_2]
		push	large 0FFFFFFFFh
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		movsx	eax, ax
		push	eax
		push	ss
		lea	ax, [bp+var_146]
		push	ax
		call	sub_40A4
		or	ax, dx
		jnz	short loc_B69BF
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf

loc_B69BF:
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		push	ss
		lea	ax, [bp+var_146]
		push	ax
		push	[bp+var_4]
		push	[bp+var_6]
		call	sub_3545
		add	sp, 0Ah
		inc	di

loc_B69DC:
		cmp	[si+0Ah], di
		jge	short loc_B6976
		push	[bp+var_2]
		call	sub_403AF
		push	word_4CE02
		call	CRT_Unlink
		add	sp, 2
		mov	ax, 1
		pop	di
		pop	si
		leave
		retf
sub_B6929		endp

; START OF FUNCTION CHUNK FOR sub_B6929
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B6929
ovr216		ends
