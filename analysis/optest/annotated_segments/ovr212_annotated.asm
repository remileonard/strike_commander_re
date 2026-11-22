ovr212		segment	para public 'OVERLAY' use16
		assume cs:ovr212
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BEF10	proc far		; CODE XREF: sub_426B0J

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
		cmp	ax, word_47034
		jz	short loc_BEF3D
		lea	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+arg_2]
		push	word_47034
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_BEF3D:				; CODE XREF: sub_BEF10+13j
		push	ds
		push	word_47034
		call	File_CreateWithRetry_3A92A
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_BEF56
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BEF56:				; CODE XREF: sub_BEF10+3Ej
		mov	di, [si+6]
		jmp	short loc_BEFC1
; ���������������������������������������������������������������������������

loc_BEF5B:				; CODE XREF: sub_BEF10+B4j
		mov	bx, word_46F46
		mov	ax, [bx]
		mov	dx, di
		shl	dx, 1
		mov	bx, word_46F46
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
		call	CRT_MemFamily_Extra1
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
		call	File_WriteOrDelegateToPaged_3AA53
		or	ax, dx
		jnz	short loc_BEFC0
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BEFC0:				; CODE XREF: sub_BEF10+A8j
		inc	di

loc_BEFC1:				; CODE XREF: sub_BEF10+49j
		cmp	[si+0Ah], di
		jge	short loc_BEF5B
		push	[bp+var_2]
		call	File_CloseWithRetry_3ACD3
		mov	ax, 1
		pop	di
		pop	si
		leave
		retf
sub_BEF10	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BEFD9	proc far		; CODE XREF: sub_426B5J

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
		cmp	ax, word_47034
		jz	short loc_BF006
		lea	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+arg_2]
		push	word_47034
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_BF006:				; CODE XREF: sub_BEFD9+13j
		push	ds
		push	word_47034
		push	2
		call	File_OpenWithRetry_3ACA4
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0FFFFh
		jnz	short loc_BF021
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BF021:				; CODE XREF: sub_BEFD9+40j
		mov	di, [si+6]
		jmp	short loc_BF08C
; ���������������������������������������������������������������������������

loc_BF026:				; CODE XREF: sub_BEFD9+B6j
		mov	bx, word_46F46
		mov	ax, [bx]
		mov	dx, di
		shl	dx, 1
		mov	bx, word_46F46
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
		call	File_ReadOrDelegateToPaged_3A957
		or	ax, dx
		jnz	short loc_BF06F
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BF06F:				; CODE XREF: sub_BEFD9+8Ej
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		push	ss
		lea	ax, [bp+var_146]
		push	ax
		push	[bp+var_4]
		push	[bp+var_6]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		inc	di

loc_BF08C:				; CODE XREF: sub_BEFD9+4Bj
		cmp	[si+0Ah], di
		jge	short loc_BF026
		push	[bp+var_2]
		call	File_CloseWithRetry_3ACD3
		push	word_47034
		call	CRT_Unlink
		add	sp, 2
		mov	ax, 1
		pop	di
		pop	si
		leave
		retf
sub_BEFD9	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
ovr212		ends
