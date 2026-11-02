seg083		segment	para public 'CODE' use16
		assume cs:seg083
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F3A2		proc far

var_20		= word ptr -20h
var_10		= word ptr -10h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_10+1], 0Fh
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		mov	al, byte ptr [bp+var_20]
		mov	[si], al
		pop	si
		leave
		retf
sub_2F3A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F3CA		proc far

var_20		= word ptr -20h
var_10		= word ptr -10h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_10+1], 0
		mov	al, [si]
		mov	byte ptr [bp+var_10], al
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
sub_2F3CA		endp

; START OF FUNCTION CHUNK FOR sub_2F3CA
		db 9Ah
; END OF FUNCTION CHUNK FOR sub_2F3CA
seg083		ends
