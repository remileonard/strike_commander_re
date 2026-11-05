ovr372		segment	para public 'OVERLAY' use16
		assume cs:ovr372
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0340		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+101h]
		mov	ah, 0
		mov	dl, [bp+arg_2]
		mov	bx, ax
		mov	[bx+si+0EDh], dl
		inc	byte ptr [si+101h]
		pop	si
		pop	bp
		retf
sub_D0340		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D035D		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+101h], 0
		jz	short loc_D03AB
		mov	cl, 0
		xor	dx, dx
		jmp	short loc_D0381

loc_D0371:
		mov	bx, dx
		mov	al, [bx+si+0EDh]
		cmp	al, [bp+arg_2]
		jnz	short loc_D0380
		mov	cl, 1
		jmp	short loc_D038B

loc_D0380:
		inc	dx

loc_D0381:
		mov	al, [si+101h]
		mov	ah, 0
		cmp	ax, dx
		jg	short loc_D0371

loc_D038B:
		or	cl, cl
		jz	short loc_D03AB
		jmp	short loc_D039C

loc_D0391:
		mov	bx, dx
		mov	al, [bx+si+0EEh]
		mov	[bx+si+0EDh], al
		inc	dx

loc_D039C:
		mov	al, [si+101h]
		mov	ah, 0
		dec	ax
		cmp	ax, dx
		jg	short loc_D0391
		dec	byte ptr [si+101h]

loc_D03AB:
		pop	si
		pop	bp
		retf
sub_D035D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D03AE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+101h], 0
		pop	si
		pop	bp
		retf
sub_D03AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D03BD		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+10Ch]
		mov	ah, 0
		mov	dl, [bp+arg_2]
		mov	bx, ax
		mov	[bx+si+102h], dl
		inc	byte ptr [si+10Ch]
		pop	si
		pop	bp
		retf
sub_D03BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D03DA		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+10Ch], 0
		jz	short loc_D0428
		mov	cl, 0
		xor	dx, dx
		jmp	short loc_D03FE

loc_D03EE:
		mov	bx, dx
		mov	al, [bx+si+102h]
		cmp	al, [bp+arg_2]
		jnz	short loc_D03FD
		mov	cl, 1
		jmp	short loc_D0408

loc_D03FD:
		inc	dx

loc_D03FE:
		mov	al, [si+10Ch]
		mov	ah, 0
		cmp	ax, dx
		jg	short loc_D03EE

loc_D0408:
		or	cl, cl
		jz	short loc_D0428
		jmp	short loc_D0419

loc_D040E:
		mov	bx, dx
		mov	al, [bx+si+103h]
		mov	[bx+si+102h], al
		inc	dx

loc_D0419:
		mov	al, [si+10Ch]
		mov	ah, 0
		dec	ax
		cmp	ax, dx
		jg	short loc_D040E
		dec	byte ptr [si+10Ch]

loc_D0428:
		pop	si
		pop	bp
		retf
sub_D03DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D042B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+10Ch], 0
		pop	si
		pop	bp
		retf
sub_D042B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D043A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_D045F

loc_D044B:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_2]
		jnz	short loc_D045F
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		jmp	short loc_D0477

loc_D045F:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E6h
		push	ax
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_D044B
		xor	ax, ax

loc_D0477:
		pop	si
		leave
		retf
sub_D043A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D047A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_D04BC

loc_D048B:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_2]
		jnz	short loc_D04BC
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		push	ax
		call	sub_65A86
		pop	cx
		push	[bp+arg_4]
		call	CRT_Strdup
		pop	cx
		push	ax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4

loc_D04BC:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E6h
		push	ax
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_D048B
		pop	si
		leave
		retf
sub_D047A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D04D5		proc far
		push	bp
		mov	bp, sp
		push	70h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	72h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	71h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	6Fh
		call	GameVar_ClearFlag_56520
		pop	cx
		push	73h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	74h
		call	GameVar_ClearFlag_56520
		pop	cx
		pop	bp
		retf
sub_D04D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D050A		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	ah, 0
		sub	ax, 22h
		mov	bx, ax
		cmp	bx, 10h
		ja	short loc_D0537
		shl	bx, 1
		jmp	cs:off_D0539[bx]	; switch jump

loc_D0523:
		push	6Fh
		jmp	short loc_D0531

loc_D0527:
		push	70h
		jmp	short loc_D0531

loc_D052B:
		push	71h
		jmp	short loc_D0531

loc_D052F:
		push	72h

loc_D0531:
		call	GameVar_SetFlag_5646D
		pop	cx

loc_D0537:
		pop	bp
		retf
sub_D050A		endp

; START OF FUNCTION CHUNK FOR sub_D050A
off_D0539	dw offset loc_D0523
		dw offset loc_D0527
		dw offset loc_D0537
		dw offset loc_D052B
		dw offset loc_D052F
		dw offset loc_D0537
		dw offset loc_D0537
		dw offset loc_D0537
		dw offset loc_D0537
		dw offset loc_D0537
		dw offset loc_D0537
		dw offset loc_D0537
		dw offset loc_D0523
		dw offset loc_D0527
		dw offset loc_D0537
		dw offset loc_D052B
		dw offset loc_D052F
; END OF FUNCTION CHUNK FOR sub_D050A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D055B		proc far

var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		push	cs
		call	near ptr sub_D04D5
		jmp	short loc_D05A8

loc_D0571:
		xor	dx, dx
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+7], 0

loc_D057A:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		mov	bx, dx
		cmp	al, [bx+si+0EDh]
		jnz	short loc_D059D
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+7], 1
		push	ax
		push	cs
		call	near ptr sub_D050A
		pop	cx
		mov	al, [si+101h]
		mov	ah, 0
		mov	dx, ax

loc_D059D:
		inc	dx
		mov	al, [si+101h]
		mov	ah, 0
		cmp	ax, dx
		jg	short loc_D057A

loc_D05A8:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E6h
		push	ax
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_D0571
		xor	di, di
		jmp	short loc_D05EA

loc_D05C2:
		mov	bx, di
		mov	al, [bx+si+102h]
		push	ax
		mov	ax, si
		add	ax, 10Fh
		push	ax
		call	sub_617D4
		add	sp, 4
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		inc	di

loc_D05EA:
		mov	al, [si+10Ch]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_D05C2
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_75A70
		pop	cx
		mov	[bp+var_3], al
		call	sub_6F5C0
		mov	word_79E7C, ax
		call	sub_6F5D8
		mov	word_79E7E, ax
		xor	di, di
		jmp	short loc_D063F

loc_D0617:
		mov	bx, di
		mov	al, [bx+si+102h]
		push	ax
		mov	ax, si
		add	ax, 10Fh
		push	ax
		call	sub_617D4
		add	sp, 4
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_665AB
		add	sp, 4
		inc	di

loc_D063F:
		mov	al, [si+10Ch]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_D0617
		mov	byte ptr [si+10Ch], 0
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_D055B		endp
ovr372		ends
