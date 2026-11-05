stub299		segment	para public 'CODE' use16
		assume cs:stub299
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74230	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 304E0h		; fileoff
		dw 2B1h		; codesize
		dw 26h		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74250	proc far
		jmp	sub_ABD50
sub_74250	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74255	proc far
		jmp	sub_ABD98
sub_74255	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7425A	proc far
		jmp	sub_ABE0B
sub_7425A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7425F	proc far
		jmp	sub_ABF6D
sub_7425F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74264	proc far
		jmp	Debris_ReleaseWrapperC_ABF48
sub_74264	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74269	proc far
		jmp	sub_ABFCD
sub_74269	endp
		db 0, 0
stub299		ends
