seg096		segment	para public 'CODE' use16
		assume cs:seg096
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C762		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3C762		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C76A		proc far

var_10		= word ptr -10h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_3C784
		mov	al, 0
		jmp	loc_3C8B7

loc_3C784:
		mov	ax, [si+5Ah]
		add	ax, 8Eh
		push	word ptr [si+5Ch]
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	sub_38D6
		add	sp, 8
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_Strupr_30EF
		pop	cx
		push	seg seg008
		push	offset loc_634B
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C7D0
		push	large 2004Dh
		call	GameVar_Set_564BB
		add	sp, 4
		push	927h
		jmp	loc_3C8A1

loc_3C7D0:
		push	seg seg008
		push	offset loc_634F
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C7FB
		push	large 2004Ah
		call	GameVar_Set_564BB
		add	sp, 4
		push	924h
		jmp	loc_3C8A1

loc_3C7FB:
		push	seg seg008
		push	offset loc_6357
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C825
		push	large 2004Ch
		call	GameVar_Set_564BB
		add	sp, 4
		push	926h
		jmp	short loc_3C8A1

loc_3C825:
		push	seg seg008
		push	offset loc_635F
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C84F
		push	large 2004Fh
		call	GameVar_Set_564BB
		add	sp, 4
		push	929h
		jmp	short loc_3C8A1

loc_3C84F:
		push	seg seg008
		push	offset loc_6365
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C879
		push	large 2004Eh
		call	GameVar_Set_564BB
		add	sp, 4
		push	928h
		jmp	short loc_3C8A1

loc_3C879:
		push	seg seg008
		push	offset loc_636B
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_3C8B5
		push	large 2004Bh
		call	GameVar_Set_564BB
		add	sp, 4
		push	925h

loc_3C8A1:
		call	GameVar_SetFlag_5646D
		pop	cx
		push	large 10897h
		call	GameVar_Set_564BB
		add	sp, 4

loc_3C8B5:
		mov	al, 1

loc_3C8B7:
		pop	si
		leave
		retf
sub_3C76A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C8BA		proc far

var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, di
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		mov	[bp+var_1], al
		mov	eax, [si+5Ah]
		mov	[bp+var_6], eax
		cmp	word_7CADA, di
		jz	short loc_3C903
		les	bx, word ptr [bp+var_6]
		cmp	byte ptr es:[bx+6], 1
		jz	short loc_3C903
		push	0C009h
		call	sub_1DDFE
		pop	cx

loc_3C903:
		cmp	word_7CADA, di
		jnz	short loc_3C92B
		mov	byte_77698, 1
		cmp	byte_7769A, 0
		jnz	short loc_3C918
		jmp	loc_3C9EF

loc_3C918:
		push	[bp+arg_6]
		push	di
		push	large [bp+arg_0]
		call	sub_372E4
		add	sp, 8
		jmp	loc_3CA65

loc_3C92B:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+6Dh], 0
		jnz	short loc_3C938
		jmp	loc_3C9CC

loc_3C938:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_3C944
		jmp	loc_3C9CC

loc_3C944:
		les	bx, word ptr [bp+var_6]
		cmp	byte ptr es:[bx+0BCh], 1
		jz	short loc_3C981
		mov	ax, 1Eh
		call	Math_RandomChance_56C8A
		or	al, al
		jz	short loc_3C9BD
		push	0
		push	2
		push	6B04h
		call	Memory_TypedAllocDispatchC_6538A
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, 0C800h
		jle	short loc_3C9BD
		les	bx, word ptr [bp+var_6]
		cmp	byte ptr es:[bx+0BCh], 2
		jz	short loc_3C9BD

loc_3C981:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		push	si
		call	sub_750CF
		add	sp, 6
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		and	byte ptr [bx+92h], 0DFh

loc_3C9A7:
		push	0
		push	9
		push	word_7CADA
		push	large [bp+var_6]
		call	Radio_SendMessage_EA0E
		add	sp, 0Ah
		jmp	short loc_3C9EF

loc_3C9BD:
		les	bx, word ptr [bp+var_6]
		cmp	byte ptr es:[bx+0BCh], 1
		jnz	short loc_3C9D5
		jmp	short loc_3C9A7
		jmp	short loc_3C9D5

loc_3C9CC:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3C9EF

loc_3C9D5:
		push	0
		push	0Ah
		push	word_7CADA
		push	large [bp+var_6]
		call	Radio_SendMessage_EA0E
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_3C76A
		pop	cx

loc_3C9EF:
		mov	al, [si+77h]
		and	ax, 1
		or	al, al
		jnz	short loc_3CA09
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+78h]
		call	Math_RandomChance_56C8A
		or	al, al
		jz	short loc_3CA1D

loc_3CA09:
		cmp	word_7CADA, di
		jz	short loc_3CA12
		jmp	loc_3C918

loc_3CA12:
		mov	byte_77699, 1
		jmp	loc_3C918
		jmp	loc_3C918

loc_3CA1D:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3CA4F
		push	[bp+arg_6]
		push	di
		call	sub_553B6
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+6Bh]
		mov	[si+59h], al
		push	di
		call	SmokeTrail_EnableIfModelHasSmok_3BD75
		pop	cx
		push	word ptr [di+52h]
		mov	bx, [di+52h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		pop	cx

loc_3CA4F:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+23h]
		push	di
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_370D5
sub_3C8BA		endp
seg096		ends
