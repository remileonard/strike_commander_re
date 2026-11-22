stub394		segment	para public 'CODE' use16
		assume cs:stub394
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_762C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 67390h		; fileoff
		dw 1884h		; codesize
		dw 1D6h		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_762E0	proc far
		jmp	sub_E10EB
sub_762E0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_762E5	proc far
		jmp	sub_DFE10
sub_762E5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_762EA	proc far
		jmp	sub_DFF70
sub_762EA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_762EF	proc far
		jmp	sub_E079D
sub_762EF	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub394		ends
