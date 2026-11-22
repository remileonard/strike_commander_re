seg081		segment	para public 'CODE' use16
		assume cs:seg081
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F262		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+8]
		cmp	ax, [si+2]
		jge	short loc_2F28B
		mov	ax, [si+0Ah]
		cmp	ax, [si+4]
		jge	short loc_2F28B
		mov	al, byte_4CDFE
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		jmp	short loc_2F2CC

loc_2F28B:
		mov	ax, [si+8]
		cmp	ax, [si+2]
		jge	short loc_2F2A5
		mov	al, byte_4CDFE
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+2]
		push	word ptr [si+4]
		push	word ptr [si+8]
		jmp	short loc_2F2CC

loc_2F2A5:
		mov	ax, [si+0Ah]
		cmp	ax, [si+4]
		jge	short loc_2F2BC
		mov	al, byte_4CDFE
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+8]
		push	word ptr [si+0Ah]
		jmp	short loc_2F2C9

loc_2F2BC:
		mov	al, byte_4CDFE
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+4]

loc_2F2C9:
		push	word ptr [si+2]

loc_2F2CC:
		push	word_4D36C
		call	sub_38150
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_2F262		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F2DB		proc far

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
sub_2F2DB		endp

; START OF FUNCTION CHUNK FOR sub_2F2DB
		db 0A2h
; END OF FUNCTION CHUNK FOR sub_2F2DB
seg081		ends
