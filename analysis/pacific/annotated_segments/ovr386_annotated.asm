ovr386		segment	para public 'OVERLAY' use16
		assume cs:ovr386
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DAEC0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_DAEC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DAEC8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, [di+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_DAEE3
		les	bx, [di+1Eh]
		mov	ax, [di+22h]
		mov	es:[bx], ax

loc_DAEE3:
		pop	di
		pop	si
		pop	bp
		retf
sub_DAEC8		endp
ovr386		ends
