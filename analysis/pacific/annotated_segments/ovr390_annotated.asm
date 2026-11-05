ovr390		segment	para public 'OVERLAY' use16
		assume cs:ovr390
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DD830		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_DD849
		push	3Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_DD868

loc_DD849:
		push	si
		push	large 4A424F4Ah
		call	sub_75910
		add	sp, 6
		xor	ax, ax
		jmp	short loc_DD863

loc_DD85C:
		mov	bx, ax
		mov	byte ptr [bx+si+3Ch], 1
		inc	ax

loc_DD863:
		cmp	ax, 3
		jl	short loc_DD85C

loc_DD868:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_DD830		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DD86D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, di
		inc	cx
		cmp	cx, 3
		jl	short loc_DD883
		mov	cx, 2

loc_DD883:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+3Ch], 0
		jz	short loc_DD891

loc_DD88D:
		mov	ax, cx
		jmp	short loc_DD8B0

loc_DD891:
		mov	si, cx
		jmp	short loc_DD8A9

loc_DD895:
		inc	cx
		cmp	cx, 3
		jl	short loc_DD89E
		mov	cx, 2

loc_DD89E:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+3Ch], 0
		jnz	short loc_DD88D
		inc	si

loc_DD8A9:
		cmp	si, 3
		jl	short loc_DD895
		mov	ax, di

loc_DD8B0:
		pop	di
		pop	si
		pop	bp
		retf
sub_DD86D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DD8B4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, di
		dec	cx
		or	cx, cx
		jge	short loc_DD8C8
		xor	cx, cx

loc_DD8C8:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+3Ch], 0
		jz	short loc_DD8D6

loc_DD8D2:
		mov	ax, cx
		jmp	short loc_DD8F2

loc_DD8D6:
		mov	si, cx
		jmp	short loc_DD8EC

loc_DD8DA:
		dec	cx
		or	cx, cx
		jge	short loc_DD8E1
		xor	cx, cx

loc_DD8E1:
		mov	bx, dx
		add	bx, cx
		cmp	byte ptr [bx+3Ch], 0
		jnz	short loc_DD8D2
		dec	si

loc_DD8EC:
		or	si, si
		jg	short loc_DD8DA
		mov	ax, di

loc_DD8F2:
		pop	di
		pop	si
		pop	bp
		retf
sub_DD8B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DD8F6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	cx, [bp+arg_2]
		or	cx, cx
		jl	short loc_DD918
		cmp	cx, 3
		jge	short loc_DD918
		mov	bx, dx
		add	bx, cx
		mov	al, 1
		and	al, [bx+3Ch]
		mov	bx, dx
		add	bx, cx
		mov	[bx+3Ch], al

loc_DD918:
		pop	bp
		retf
sub_DD8F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DD91A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_DD92D

loc_DD924:
		mov	bx, ax
		add	bx, dx
		mov	byte ptr [bx+3Ch], 0
		inc	dx

loc_DD92D:
		cmp	dx, 3
		jl	short loc_DD924
		pop	bp
		retf
sub_DD91A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DD934		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_DD91A
		pop	cx
		mov	bx, [bp+arg_2]
		cmp	bx, 17h
		ja	short loc_DD98E
		shl	bx, 1
		jmp	cs:off_DD991[bx]	; switch jump

loc_DD950:
		mov	byte ptr [si+3Ch], 1
		mov	byte ptr [si+3Eh], 1
		jmp	short loc_DD98E

loc_DD95A:
		jmp	short loc_DD950

loc_DD95C:
		jmp	short loc_DD982

loc_DD95E:
		jmp	short loc_DD950

loc_DD960:
		jmp	short loc_DD982

loc_DD962:
		jmp	short loc_DD982

loc_DD964:
		jmp	short loc_DD982

loc_DD966:
		jmp	short loc_DD982

loc_DD968:
		jmp	short loc_DD950

loc_DD96A:
		jmp	short loc_DD98A

loc_DD96C:
		jmp	short loc_DD982

loc_DD96E:
		jmp	short loc_DD982

loc_DD970:
		jmp	short loc_DD982

loc_DD972:
		jmp	short loc_DD982

loc_DD974:
		jmp	short loc_DD950

loc_DD976:
		jmp	short loc_DD98A

loc_DD978:
		jmp	short loc_DD98A

loc_DD97A:
		jmp	short loc_DD982

loc_DD97C:
		jmp	short loc_DD982

loc_DD97E:
		jmp	short loc_DD982

loc_DD980:
		jmp	short loc_DD982

loc_DD982:
		mov	byte ptr [si+3Ch], 1
		mov	byte ptr [si+3Eh], 1

loc_DD98A:
		mov	byte ptr [si+3Dh], 1

loc_DD98E:
		pop	si
		pop	bp
		retf
sub_DD934		endp

; START OF FUNCTION CHUNK FOR sub_DD934
off_DD991	dw offset loc_DD950
		dw offset loc_DD95A
		dw offset loc_DD95C
		dw offset loc_DD95C
		dw offset loc_DD95E
		dw offset loc_DD960
		dw offset loc_DD962
		dw offset loc_DD964
		dw offset loc_DD966
		dw offset loc_DD968
		dw offset loc_DD96A
		dw offset loc_DD96C
		dw offset loc_DD96E
		dw offset loc_DD970
		dw offset loc_DD972
		dw offset loc_DD974
		dw offset loc_DD976
		dw offset loc_DD978
		dw offset loc_DD97A
		dw offset loc_DD97C
		dw offset loc_DD97E
		dw offset loc_DD980
		dw offset loc_DD982
		dw offset loc_DD982
; END OF FUNCTION CHUNK FOR sub_DD934
ovr390		ends
