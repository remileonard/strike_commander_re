stub362		segment	para public 'CODE' use16
		assume cs:stub362
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75890	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4F830h		; fileoff
		dw 0B3Fh		; codesize
		dw 0F4h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_758B0	proc far
		jmp	PaletteScreen_ReleaseStyleAndObject_CA266
sub_758B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_758B5	proc far
		jmp	sub_C9750
sub_758B5	endp
		db 0, 0, 0, 0, 0, 0
stub362		ends
