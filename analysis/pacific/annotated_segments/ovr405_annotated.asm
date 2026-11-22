ovr405		segment	para public 'OVERLAY' use16
		assume cs:ovr405
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E55B0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+7], 0
		jz	short loc_E55C4
		push	si
		call	sub_76515
		pop	cx

loc_E55C4:
		pop	si
		pop	bp
		retf
sub_E55B0		endp
ovr405		ends
