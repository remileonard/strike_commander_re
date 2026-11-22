ovr400		segment	para public 'OVERLAY' use16
		assume cs:ovr400
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E5200		proc far

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
		mov	ax, word_7AE7A
		xor	dx, dx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		push	[bp+arg_0]
		push	437Eh
		lea	ax, [bp+var_20A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6

loc_E522E:
		les	bx, word ptr [bp+var_4]
		movsx	eax, word ptr es:[bx]
		shl	eax, 4
		add	eax, 0FFFFFFFCh
		push	eax
		push	word ptr [bp+var_4+2]
		push	si
		push	439Fh
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
		jz	short loc_E528E
		lea	ax, [bp+var_20A]
		push	ax
		call	CRT_Strlen
		pop	cx
		cmp	ax, 1D6h
		jb	short loc_E522E

loc_E528E:
		lea	ax, [bp+var_20A]
		push	ax
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
		pop	si
		leave
		retf
sub_E5200		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E529C		proc far

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
		mov	si, word_7AE7D
		xor	eax, eax
		mov	[bp+var_C], eax
		mov	[bp+var_8], eax
		push	43CCh
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		or	di, di
		jz	short loc_E52D8
		push	di
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_E52E2

loc_E52D8:
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_E52E2:
		mov	[bp+var_E], 0
		jmp	loc_E53B5
		jmp	loc_E537D

loc_E52ED:
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
		jg	short loc_E5314
		mov	ax, 4407h
		jmp	short loc_E5317

loc_E5314:
		mov	ax, 4411h

loc_E5317:
		push	ax
		push	43E4h
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	di, di
		jz	short loc_E533A
		push	di
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_E5344

loc_E533A:
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_E5344:
		cmp	[bp+var_10], 0
		jg	short loc_E5363
		mov	ax, [bp+var_10]
		mov	[bp+var_14], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		shl	eax, 4
		add	[bp+var_C], eax
		jmp	short loc_E5370

loc_E5363:
		movsx	eax, [bp+var_10]
		shl	eax, 4
		add	[bp+var_8], eax

loc_E5370:
		mov	ax, [bp+var_10]
		mov	[bp+var_16], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		add	si, ax

loc_E537D:
		mov	[bp+var_2], si
		mov	[bp+var_4], 0
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_E5391
		jmp	loc_E52ED

loc_E5391:
		cmp	word ptr es:[bx+4], 1209h
		jz	short loc_E539C
		jmp	loc_E52ED

loc_E539C:
		cmp	[bp+var_E], 0
		jnz	short loc_E53A8
		mov	si, word_7AE7F
		jmp	short loc_E53B2

loc_E53A8:
		cmp	[bp+var_E], 1
		jnz	short loc_E53B9
		mov	si, word_7AE81

loc_E53B2:
		inc	[bp+var_E]

loc_E53B5:
		or	si, si
		jnz	short loc_E537D

loc_E53B9:
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	4416h
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	di, di
		jz	short loc_E53E3
		push	di
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_E53ED

loc_E53E3:
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_E53ED:
		pop	di
		pop	si
		leave
		retf
sub_E529C		endp
ovr400		ends
