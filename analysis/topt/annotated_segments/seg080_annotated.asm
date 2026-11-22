seg080		segment	para public 'CODE' use16
		assume cs:seg080
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F071		proc far

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
		mov	ax, word_4D29A
		xor	dx, dx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		push	[bp+arg_0]
		push	4354h
		lea	ax, [bp+var_20A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6

loc_2F09F:
		les	bx, word ptr [bp+var_4]
		movsx	eax, word ptr es:[bx]
		shl	eax, 4
		add	eax, 0FFFFFFFCh
		push	eax
		push	word ptr [bp+var_4+2]
		push	si
		push	4375h
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
		jz	short loc_2F0FF
		lea	ax, [bp+var_20A]
		push	ax
		call	CRT_Strlen
		pop	cx
		cmp	ax, 1D6h
		jb	short loc_2F09F

loc_2F0FF:
		lea	ax, [bp+var_20A]
		push	ax
		call	Runtime_FatalErrorHandler_36797
		pop	cx
		pop	si
		leave
		retf
sub_2F071		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F10D		proc far

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
		mov	si, word_4D29D
		xor	eax, eax
		mov	[bp+var_C], eax
		mov	[bp+var_8], eax
		push	43A2h
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		or	di, di
		jz	short loc_2F149
		push	di
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_2F153

loc_2F149:
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_2F153:
		mov	[bp+var_E], 0
		jmp	loc_2F226
		jmp	loc_2F1EE

loc_2F15E:
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
		jg	short loc_2F185
		mov	ax, 43DDh
		jmp	short loc_2F188

loc_2F185:
		mov	ax, 43E7h

loc_2F188:
		push	ax
		push	43BAh
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	di, di
		jz	short loc_2F1AB
		push	di
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_2F1B5

loc_2F1AB:
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_2F1B5:
		cmp	[bp+var_10], 0
		jg	short loc_2F1D4
		mov	ax, [bp+var_10]
		mov	[bp+var_14], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		shl	eax, 4
		add	[bp+var_C], eax
		jmp	short loc_2F1E1

loc_2F1D4:
		movsx	eax, [bp+var_10]
		shl	eax, 4
		add	[bp+var_8], eax

loc_2F1E1:
		mov	ax, [bp+var_10]
		mov	[bp+var_16], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		add	si, ax

loc_2F1EE:
		mov	[bp+var_2], si
		mov	[bp+var_4], 0
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_2F202
		jmp	loc_2F15E

loc_2F202:
		cmp	word ptr es:[bx+4], 1209h
		jz	short loc_2F20D
		jmp	loc_2F15E

loc_2F20D:
		cmp	[bp+var_E], 0
		jnz	short loc_2F219
		mov	si, word_4D29F
		jmp	short loc_2F223

loc_2F219:
		cmp	[bp+var_E], 1
		jnz	short loc_2F22A
		mov	si, word_4D2A1

loc_2F223:
		inc	[bp+var_E]

loc_2F226:
		or	si, si
		jnz	short loc_2F1EE

loc_2F22A:
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	43ECh
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	di, di
		jz	short loc_2F254
		push	di
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_2F25E

loc_2F254:
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_2F25E:
		pop	di
		pop	si
sub_2F10D		endp
seg080		ends
