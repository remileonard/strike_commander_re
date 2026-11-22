stub401		segment	para public 'CODE' use16
		assume cs:stub401
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76470	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6CF40h		; fileoff
		dw 0B9h		; codesize
		dw 2		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76490	proc far
		jmp	sub_E5400
sub_76490	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76495	proc far
		jmp	sub_E5479
sub_76495	endp
		db 0, 0, 0, 0, 0, 0
stub401		ends
