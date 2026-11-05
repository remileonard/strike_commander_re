stub287		segment	para public 'CODE' use16
		assume cs:stub287
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73F10	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2C0E0h		; fileoff
		dw 3A5h		; codesize
		dw 16h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73F30	proc far
		jmp	sub_A7C90
sub_73F30	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73F35	proc far
		jmp	Terrain_LoadATRIChunk_A7F09
sub_73F35	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73F3A	proc far
		jmp	Terrain_ReleaseTileDescriptor_A800A
sub_73F3A	endp
		db 0
stub287		ends
