stub249		segment	para public 'CODE' use16
		assume cs:stub249
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_488D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 76A60h		; fileoff
		dw 34Ch		; codesize
		dw 2Ah		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_488F0	proc far
		jmp	sub_BFBDE
sub_488F0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_488F5	proc far
		jmp	sub_BFB60
sub_488F5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_488FA	proc far
		jmp	sub_BFE4A
sub_488FA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_488FF	proc far
		jmp	sub_BFBBA
sub_488FF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48904	proc far
		jmp	sub_BFD37
sub_48904	endp
		db 0, 0, 0, 0, 0, 0, 0
stub249		ends
