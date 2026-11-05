stub284		segment	para public 'CODE' use16
		assume cs:stub284
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73E80	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2B490h		; fileoff
		dw 285h		; codesize
		dw 28h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73EA0	proc far
		jmp	TerrainTextures_LoadAccList_A7090
sub_73EA0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub284		ends
