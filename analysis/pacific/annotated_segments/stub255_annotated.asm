stub255		segment	para public 'CODE' use16
		assume cs:stub255
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73680	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1A580h		; fileoff
		dw 336h		; codesize
		dw 46h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_736A0	proc far
		jmp	sub_97050
sub_736A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_736A5	proc far
		jmp	sub_972BB
sub_736A5	endp
		db 0, 0, 0, 0, 0, 0
stub255		ends
