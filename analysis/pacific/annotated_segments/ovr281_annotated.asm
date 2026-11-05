ovr281		segment	para public 'OVERLAY' use16
		assume cs:ovr281
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A5CC0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+5Ch], 0
		jz	short loc_A5D45
		push	si
		push	62D4h
		call	Camera_CopyState
		add	sp, 4
		push	si
		call	sub_2D6FC
		pop	cx
		push	si
		push	67ADh
		call	sub_1E40E
		add	sp, 4
		push	6496h
		call	sub_293A6
		pop	cx
		push	6496h
		call	sub_292D9
		pop	cx
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+14h]
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	word_7AF7C
		call	sub_6FC2E
		pop	cx
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx
		push	word_7AF7C
		call	sub_6FC40
		pop	cx
		call	TextScrollDisplayB_ApplyHelperC_6FABB
		push	6496h
		call	sub_292BC
		pop	cx

loc_A5D45:
		pop	di
		pop	si
		pop	bp
		retf
sub_A5CC0		endp
ovr281		ends
