ovr249		segment	para public 'OVERLAY' use16
		assume cs:ovr249
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88FA0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+7], 0
		jz	short loc_88FB4
		push	si
		call	sub_59A75
		pop	cx

loc_88FB4:
		pop	si
		pop	bp
		retf
sub_88FA0		endp
ovr249		ends
