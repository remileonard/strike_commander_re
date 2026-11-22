ovr226		segment	para public 'OVERLAY' use16
		assume cs:ovr226
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA890		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		call	sub_48275
		add	sp, 4
		cmp	word ptr [si+26h], 0
		jz	short loc_BA8C1
		mov	ax, si
		add	ax, 2Ch
		push	ax
		push	word ptr [si+26h]
		call	sub_2A606
		add	sp, 4
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 2

loc_BA8C1:
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	sub_2B004
		add	sp, 4
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_BA8F7
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_BA8F7:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_BA908
		push	word ptr [si+1Eh]
		call	sub_259DD
		add	sp, 2

loc_BA908:
		pop	si
		pop	bp
		retf
sub_BA890		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA90B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+78h]
		add	sp, 2
		push	ax
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	sub_2A606
		add	sp, 4
		push	si
		call	sub_4827A
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_BA90B		endp
ovr226		ends
