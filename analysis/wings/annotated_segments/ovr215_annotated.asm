ovr215		segment	para public 'OVERLAY' use16
		assume cs:ovr215
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_76E80		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_76E80		endp
ovr215		ends
