seg033		segment	para public 'CODE' use16
		assume cs:seg033
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_132B2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	large [si+5Dh]
		push	large 5Ah
		push	ds
		mov	ax, si
		add	ax, 0A3h
		push	ax
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		mov	[bp+var_2], ax
		mov	word ptr [si+61h], 0
		jmp	short loc_132FE

loc_132DD:
		mov	bx, [si+61h]
		mov	al, [bx+si+0A3h]
		cbw
		mov	dx, ax
		cmp	dx, 0Dh
		jnz	short loc_132FB
		mov	bx, [si+61h]
		mov	byte ptr [bx+si+0A5h], 0
		add	dword ptr [si+5Dh], 2
		jmp	short loc_13306

loc_132FB:
		inc	word ptr [si+61h]

loc_132FE:
		mov	ax, [si+61h]
		cmp	ax, [bp+var_2]
		jl	short loc_132DD

loc_13306:
		movsx	eax, word ptr [si+61h]
		add	[si+5Dh], eax
		pop	si
		leave
		retf
sub_132B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13312		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_2], ax
		xor	di, di
		jmp	short loc_13355

loc_1332F:
		push	[bp+var_2]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, di
		add	ax, 0A3h
		push	ax
		call	sub_2D0F
		add	sp, 6
		or	ax, ax
		jnz	short loc_13354
		mov	ax, si
		add	ax, di
		add	ax, 0A3h
		pop	di
		pop	si
		leave
		retf

loc_13354:
		inc	di

loc_13355:
		mov	ax, [si+61h]
		sub	ax, [bp+var_2]
		cmp	ax, di
		jg	short loc_1332F
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_13312		endp

; START OF FUNCTION CHUNK FOR sub_13312
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_13312

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13369		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0FFFFh
		jmp	loc_1340E

loc_1337C:
		push	si
		push	cs
		call	near ptr sub_132B2
		add	sp, 2
		push	30F4h
		push	si
		push	cs
		call	near ptr sub_13312
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_133A8
		lea	ax, [bp+var_2]
		push	ax
		push	30F7h
		push	di
		call	CRT_Msg_Sprintf3
		add	sp, 6
		jmp	loc_13446

loc_133A8:
		push	30FAh
		push	si
		push	cs
		call	near ptr sub_13312
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_1340E
		add	di, 4
		jmp	short loc_133BF

loc_133BE:
		inc	di

loc_133BF:
		cmp	byte ptr [di], 3Ah
		jz	short loc_133BE
		cmp	byte ptr [di], 20h
		jz	short loc_133BE
		cmp	byte ptr [di], 9
		jz	short loc_133BE
		mov	[bp+var_6], 0
		jmp	short loc_133E1

loc_133D5:
		mov	al, [di]
		mov	bx, [bp+var_6]
		mov	[bx+si+63h], al
		inc	di
		inc	[bp+var_6]

loc_133E1:
		cmp	[bp+var_6], 40h
		jge	short loc_133F9
		mov	ax, [si+61h]
		cmp	ax, [bp+var_6]
		jle	short loc_133F9
		cmp	byte ptr [di], 20h
		jz	short loc_133F9
		cmp	byte ptr [di], 0Dh
		jnz	short loc_133D5

loc_133F9:
		mov	ax, si
		add	ax, 63h
		push	ax
		call	CRT_Strupr_2E71
		add	sp, 2
		mov	bx, [bp+var_6]
		mov	byte ptr [bx+si+63h], 0

loc_1340E:
		mov	[bp+var_4], 1
		push	si
		call	StreamReader_ValidateState_412A1
		add	sp, 2
		or	al, al
		jz	short loc_1343D
		push	si
		call	StreamReader_GetCapacity_4154E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		cmp	eax, [si+5Dh]
		jle	short loc_1343D
		dec	[bp+var_4]
		jmp	short loc_1343D

loc_1343D:
		cmp	[bp+var_4], 0
		jnz	short loc_13446
		jmp	loc_1337C

loc_13446:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_13369		endp

; START OF FUNCTION CHUNK FOR sub_13369
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_13369

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_13451		proc far

var_15E		= word ptr -15Eh
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 15Eh
		push	si
		mov	si, [bp+arg_0]
		mov	ax, ss
		mov	ds, ax
		call	sub_A06B
		mov	ax, seg seg002
		mov	es, ax
		mov	byte ptr es:6, 0
		cmp	si, 1209h
		jnz	short loc_13497
		mov	byte_4BAD3, 1
		call	sub_35DEB
		push	30FFh
		call	CRT_Msg_NullPtrAssign
		add	sp, 2
		push	1
		call	CRT_Exit
		add	sp, 2
		jmp	short loc_134E0

loc_13497:
		cmp	si, 0EEEEh
		jz	short loc_134AA
		cmp	si, 150Bh
		jz	short loc_134AA
		cmp	byte_4BAD3, 0
		jz	short loc_134CB

loc_134AA:
		mov	byte_4BAD3, 1
		call	sub_35DEB
		push	3134h
		call	CRT_Msg_NullPtrAssign
		add	sp, 2
		push	1
		call	CRT_Exit
		add	sp, 2
		jmp	short loc_134E0

loc_134CB:
		push	word_4BAD1
		push	si
		push	315Eh
		lea	ax, [bp+var_15E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8

loc_134E0:
		lea	ax, [bp+var_15E]
		push	ax
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2
		pop	si
		leave
		retf
sub_13451		endp
seg033		ends
