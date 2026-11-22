stub349		segment	para public 'CODE' use16
		assume cs:stub349
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_754D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 46B00h		; fileoff
		dw 567h		; codesize
		dw 50h		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754F0	proc far
		jmp	sub_C18A4
sub_754F0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754F5	proc far
		jmp	sub_C13A0
sub_754F5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754FA	proc far
		jmp	sub_C13C7
sub_754FA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754FF	proc far
		jmp	sub_C13FA
sub_754FF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75504	proc far
		jmp	sub_C183C
sub_75504	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75509	proc far
		jmp	sub_C1459
sub_75509	endp
		db 0, 0
stub349		ends
