seg016		segment	para public 'CODE' use16
		assume cs:seg016
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ah, 0EBh, 0Ch, 4Ah, 63h, 83h, 0C4h, 0Ch, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_940A		proc far
		push	bp
		mov	bp, sp
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		or	ax, ax
		jnz	short loc_9424
		cmp	bx, 1209h
		jnz	short loc_9424
		mov	ax, 1
		jmp	short loc_9426

loc_9424:
		xor	ax, ax

loc_9426:
		pop	bp
		retf
sub_940A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9428		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	word_7BCF2, 800h
		push	cs
		call	near ptr sub_940A
		mov	dx, seg seg223
		mov	es, dx
		mov	es:0, al
		or	al, al
		jnz	short loc_944A
		call	sub_8C2D

loc_944A:
		call	sub_66300
		mov	byte_7B1D4, 0
		call	sub_68194
		push	1
		call	sub_67399
		pop	cx
		mov	word_7C9F1, 0
		mov	word_7C9F3, 0FFFFh
		mov	byte_7C9F0, 0FFh
		mov	ax, word_7AF7E
		mov	word_7C9E0, ax
		mov	byte_7C9F0, 0
		mov	word_7C9F5, 0
		cmp	byte_7C9F0, 0
		jz	short loc_9495
		push	0EEE0h
		call	sub_1DDFE
		pop	cx
		jmp	short loc_9495

loc_9495:
		mov	byte_7C9F0, 2
		push	62B0h
		call	sub_1DF9E
		pop	cx
		cmp	byte_7C9F0, 2
		jnz	short loc_94E5
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_2], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_2], 0
		jnz	short loc_94E5
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_94E5

loc_94E5:
		push	0
		call	PagedMemory_ReadTextResource_4ACD
		pop	cx
		mov	word_76ADA, ax
		leave
		retf
sub_9428		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_94F2		proc far
		push	bp
		mov	bp, sp
		call	PagedMemory_CheckDriverPresent_637D5
		mov	ax, seg seg223
		mov	es, ax
		mov	al, es:0
		mov	ah, 0
		or	ax, ax
		jnz	short loc_950E
		call	sub_8CC5

loc_950E:
		pop	bp
		retf
sub_94F2		endp
seg016		ends
