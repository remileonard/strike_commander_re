ovr401		segment	para public 'OVERLAY' use16
		assume cs:ovr401
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E5400		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+8]
		cmp	ax, [si+2]
		jge	short loc_E5429
		mov	ax, [si+0Ah]
		cmp	ax, [si+4]
		jge	short loc_E5429
		mov	al, byte_7AB78
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		jmp	short loc_E546A

loc_E5429:
		mov	ax, [si+8]
		cmp	ax, [si+2]
		jge	short loc_E5443
		mov	al, byte_7AB78
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+2]
		push	word ptr [si+4]
		push	word ptr [si+8]
		jmp	short loc_E546A

loc_E5443:
		mov	ax, [si+0Ah]
		cmp	ax, [si+4]
		jge	short loc_E545A
		mov	al, byte_7AB78
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+8]
		push	word ptr [si+0Ah]
		jmp	short loc_E5467

loc_E545A:
		mov	al, byte_7AB78
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+4]

loc_E5467:
		push	word ptr [si+2]

loc_E546A:
		push	word_7AF7C
		call	sub_6A150
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_E5400		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E5479		proc far

var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+2], ax
		mov	ax, [bp+var_4]
		mov	[si+4], ax
		mov	ax, [bp+arg_6]
		mov	[si+8], ax
		mov	ax, [bp+arg_8]
		mov	[si+0Ah], ax
		mov	al, [bp+arg_A]
		mov	[bp+var_5], al
		mov	byte_7AB78, al
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
sub_E5479		endp
ovr401		ends
