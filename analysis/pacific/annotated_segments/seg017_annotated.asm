seg017		segment	para public 'CODE' use16
		assume cs:seg017
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9510		proc far

var_3C		= word ptr -3Ch

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	seg seg017
		push	offset sub_9532
		push	large 10005h
		push	0Ch
		lea	ax, [bp+var_3C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		leave
		retf
sub_9510		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9532		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_954A
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_9554

loc_954A:
		mov	ax, dx
		add	ax, 4
sub_9532		endp

; START OF FUNCTION CHUNK FOR sub_9532
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_9532
seg017		ends
