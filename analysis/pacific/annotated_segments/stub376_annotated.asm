stub376		segment	para public 'CODE' use16
		assume cs:stub376
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75C80	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 57470h		; fileoff
		dw 235h		; codesize
		dw 0Ah		; relsize
		dw 9			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CA0	proc far
		jmp	sub_D0C00
sub_75CA0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CA5	proc far
		jmp	sub_D0C3F
sub_75CA5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CAA	proc far
		jmp	sub_D0C88
sub_75CAA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CAF	proc far
		jmp	sub_D0CAD
sub_75CAF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CB4	proc far
		jmp	sub_D0CF4
sub_75CB4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CB9	proc far
		jmp	sub_D0D42
sub_75CB9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CBE	proc far
		jmp	sub_D0D7A
sub_75CBE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CC3	proc far
		jmp	sub_D0D9F
sub_75CC3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75CC8	proc far
		jmp	sub_D0DC1
sub_75CC8	endp
		db 0, 0, 0
stub376		ends
