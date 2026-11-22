ovr245		segment	para public 'OVERLAY' use16
		assume cs:ovr245
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88DF0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+8]
		cmp	ax, [si+2]
		jge	short loc_88E19
		mov	ax, [si+0Ah]
		cmp	ax, [si+4]
		jge	short loc_88E19
		mov	al, byte_5D918
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		jmp	short loc_88E5A

loc_88E19:
		mov	ax, [si+8]
		cmp	ax, [si+2]
		jge	short loc_88E33
		mov	al, byte_5D918
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+2]
		push	word ptr [si+4]
		push	word ptr [si+8]
		jmp	short loc_88E5A

loc_88E33:
		mov	ax, [si+0Ah]
		cmp	ax, [si+4]
		jge	short loc_88E4A
		mov	al, byte_5D918
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+8]
		push	word ptr [si+0Ah]
		jmp	short loc_88E57

loc_88E4A:
		mov	al, byte_5D918
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+4]

loc_88E57:
		push	word ptr [si+2]

loc_88E5A:
		push	word_5DD42
		call	sub_49DD0
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_88DF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88E69		proc far

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
		mov	byte_5D918, al
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
sub_88E69		endp
ovr245		ends
