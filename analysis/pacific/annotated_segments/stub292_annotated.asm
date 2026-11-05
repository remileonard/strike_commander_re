stub292		segment	para public 'CODE' use16
		assume cs:stub292
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74050	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2D7A0h		; fileoff
		dw 16Ch		; codesize
		dw 10h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74070	proc far
		jmp	Terrain_LoadHeightmapFromIFFC_A9270
sub_74070	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74075	proc far
		jmp	Terrain_Helper5_A936A
sub_74075	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7407A	proc far
		jmp	Terrain_ReleaseTileDescriptorC_A9396
sub_7407A	endp
		db 0
stub292		ends
