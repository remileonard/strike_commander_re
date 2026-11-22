ovr244		segment	para public 'OVERLAY' use16
		assume cs:ovr244
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88BF0		proc far

var_20A		= word ptr -20Ah
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20Ah
		push	si
		xor	si, si
		mov	ax, word_5DC70
		xor	dx, dx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		push	[bp+arg_0]
		push	3B2Eh
		lea	ax, [bp+var_20A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6

loc_88C1E:
		les	bx, word ptr [bp+var_4]
		movsx	eax, word ptr es:[bx]
		shl	eax, 4
		add	eax, 0FFFFFFFCh
		push	eax
		push	word ptr [bp+var_4+2]
		push	si
		push	3B4Fh
		lea	ax, [bp+var_20A]
		push	ax
		call	CRT_Strlen
		pop	cx
		lea	dx, [bp+var_20A]
		add	ax, dx
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		inc	si
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+6]
		mov	[bp+var_A], ax
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], 0
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_8]
		jz	short loc_88C7E
		lea	ax, [bp+var_20A]
		push	ax
		call	CRT_Strlen
		pop	cx
		cmp	ax, 1D6h
		jb	short loc_88C1E

loc_88C7E:
		lea	ax, [bp+var_20A]
		push	ax
		call	sub_9D78
		pop	cx
		pop	si
		leave
		retf
sub_88BF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88C8C		proc far

var_66		= word ptr -66h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, word_5DC73
		xor	eax, eax
		mov	[bp+var_C], eax
		mov	[bp+var_8], eax
		push	3B7Ch
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		or	di, di
		jz	short loc_88CC8
		push	di
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_88CD2

loc_88CC8:
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_88CD2:
		mov	[bp+var_E], 0
		jmp	loc_88DA5
		jmp	loc_88D6D

loc_88CDD:
		les	bx, [bp+var_4]
		mov	ax, es:[bx]
		mov	[bp+var_10], ax
		mov	[bp+var_12], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		shl	eax, 4
		push	eax
		push	si
		cmp	[bp+var_10], 0
		jg	short loc_88D04
		mov	ax, 3BB7h
		jmp	short loc_88D07

loc_88D04:
		mov	ax, 3BC1h

loc_88D07:
		push	ax
		push	3B94h
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	di, di
		jz	short loc_88D2A
		push	di
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_88D34

loc_88D2A:
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_88D34:
		cmp	[bp+var_10], 0
		jg	short loc_88D53
		mov	ax, [bp+var_10]
		mov	[bp+var_14], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		shl	eax, 4
		add	[bp+var_C], eax
		jmp	short loc_88D60

loc_88D53:
		movsx	eax, [bp+var_10]
		shl	eax, 4
		add	[bp+var_8], eax

loc_88D60:
		mov	ax, [bp+var_10]
		mov	[bp+var_16], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		add	si, ax

loc_88D6D:
		mov	[bp+var_2], si
		mov	[bp+var_4], 0
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_88D81
		jmp	loc_88CDD

loc_88D81:
		cmp	word ptr es:[bx+4], 1209h
		jz	short loc_88D8C
		jmp	loc_88CDD

loc_88D8C:
		cmp	[bp+var_E], 0
		jnz	short loc_88D98
		mov	si, word_5DC75
		jmp	short loc_88DA2

loc_88D98:
		cmp	[bp+var_E], 1
		jnz	short loc_88DA9
		mov	si, word_5DC77

loc_88DA2:
		inc	[bp+var_E]

loc_88DA5:
		or	si, si
		jnz	short loc_88D6D

loc_88DA9:
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	3BC6h
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	di, di
		jz	short loc_88DD3
		push	di
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_88DDD

loc_88DD3:
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_88DDD:
		pop	di
		pop	si
		leave
		retf
sub_88C8C		endp
ovr244		ends
