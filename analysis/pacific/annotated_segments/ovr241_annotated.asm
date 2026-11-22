ovr241		segment	para public 'OVERLAY' use16
		assume cs:ovr241
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8A4C0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 104h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	word ptr [si+1Eh]
		mov	bx, [si+1Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 5
		jz	short loc_8A4F3
		push	word ptr [si+1DCh]
		push	67ADh
		call	sub_1E642
		add	sp, 4

loc_8A4F3:
		push	si
		call	sub_73495
		pop	cx
		mov	byte ptr [si+17Bh], 0
		mov	byte ptr [si+17Ch], 0
		pop	si
		pop	bp
		retf
sub_8A4C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8A507		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+1DCh], 0
		jnz	short loc_8A51F
		jmp	loc_8A5E9

loc_8A51F:
		mov	ax, si
		add	ax, 104h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 5
		jz	short loc_8A546
		push	word ptr [si+1DCh]
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4

loc_8A546:
		mov	byte ptr [si+17Bh], 1
		mov	word ptr [si+0E6h], 0FFFFh
		mov	word ptr [si+1E1h], 0FFFFh
		push	word ptr [si+0E6h]
		push	si
		call	sub_735B4
		add	sp, 4
		mov	ax, si
		add	ax, 2
		push	ax
		push	di
		call	sub_73DC4
		add	sp, 4
		xor	ax, ax
		mov	[si+148h], ax
		mov	[si+14Ah], ax
		mov	eax, [si+176h]
		mov	[di+8], eax
		mov	eax, [si+15Eh]
		mov	[di+0Ch], eax
		mov	eax, [si+162h]
		mov	[di+10h], eax
		mov	eax, [si+15Ah]
		mov	[di], eax
		mov	ax, [si+154h]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[di+60h], eax
		mov	eax, [si+156h]
		mov	[di+64h], eax
		mov	eax, [si+166h]
		mov	[di+68h], eax
		mov	eax, [si+16Ah]
		mov	[di+6Ch], eax
		mov	eax, [si+16Eh]
		mov	[di+70h], eax
		mov	eax, [si+172h]
		mov	[di+74h], eax

loc_8A5E9:
		pop	di
		pop	si
		leave
		retf
sub_8A507		endp
ovr241		ends
