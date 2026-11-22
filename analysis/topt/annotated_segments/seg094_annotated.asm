seg094		segment	para public 'CODE' use16
		assume cs:seg094
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30801		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3081A
		push	63h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3084C

loc_3081A:
		push	si
		call	StreamReader_ConstructVariantA_40ED4
		pop	cx
		mov	word ptr [si], 4552h
		push	0A0h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+5Dh], ax
		cmp	word ptr [si+5Dh], 0
		jnz	short loc_30843
		push	33E0h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_30843:
		mov	ax, [si+5Dh]
		mov	[si+5Fh], ax
		mov	[si+61h], ax

loc_3084C:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_30801		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30851		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3089D
		mov	word ptr [si], 4552h
		cmp	word ptr [si+5Dh], 0
		jz	short loc_30873
		push	word ptr [si+5Dh]
		call	sub_39C
		pop	cx

loc_30873:
		push	si
		call	StreamReader_ValidateState_412A1
		pop	cx
		or	al, al
		jz	short loc_30885
		push	si
		call	sub_4123E
		pop	cx

loc_30885:
		push	0
		push	si
		call	StreamReader_Close_410AA
		add	sp, 4
		test	di, 1
		jz	short loc_3089D
		push	si
		call	sub_39C
		pop	cx

loc_3089D:
		pop	di
		pop	si
		pop	bp
		retf
sub_30851		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_308A1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+5Fh]
		cmp	ax, [si+61h]
		jb	short loc_308F3
		push	si
		call	StreamReader_GetCapacity_4154E
		pop	cx
		push	ax
		push	si
		call	StreamReader_GetCapacity_41561
		pop	cx
		pop	dx
		sub	dx, ax
		mov	di, dx
		cmp	di, 0A0h
		jle	short loc_308CE
		mov	di, 0A0h

loc_308CE:
		or	di, di
		jz	short loc_308E8
		push	large 0FFFFFFFFh
		movsx	eax, di
		push	eax
		push	ds
		push	word ptr [si+5Dh]
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh

loc_308E8:
		mov	ax, [si+5Dh]
		mov	[si+5Fh], ax
		add	ax, di
		mov	[si+61h], ax

loc_308F3:
		mov	ax, [si+5Fh]
		cmp	ax, [si+61h]
		jnb	short loc_30900
		mov	ax, 1
		jmp	short loc_30902

loc_30900:
		xor	ax, ax

loc_30902:
		pop	di
		pop	si
		pop	bp
		retf
sub_308A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30906		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	[bp+arg_4], 0
		jz	short loc_3094F
		jmp	short loc_3093B

loc_3091E:
		mov	bx, [di+5Fh]
		inc	word ptr [di+5Fh]
		mov	dl, [bx]
		cmp	dl, 0Ah
		jz	short loc_3094F
		cmp	dl, 0Dh
		jz	short loc_3093B
		mov	bx, [bp+arg_2]
		mov	[bx], dl
		inc	[bp+arg_2]
		inc	[bp+var_2]

loc_3093B:
		dec	[bp+arg_4]
		mov	ax, [bp+arg_4]
		or	ax, ax
		jz	short loc_3094F
		push	di
		push	cs
		call	near ptr sub_308A1
		pop	cx
		or	al, al
		jnz	short loc_3091E
sub_30906		endp

; START OF FUNCTION CHUNK FOR sub_30906

loc_3094F:
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_30906
seg094		ends
