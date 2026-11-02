stub229		segment	para public 'CODE' use16
		assume cs:stub229
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_484A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 726D0h		; fileoff
		dw 353h		; codesize
		dw 44h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_484C0	proc far
		jmp	EntityTracker_RegisterAndSelect
sub_484C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_484C5	proc far
		jmp	sub_BBA70
sub_484C5	endp
		db 0, 0, 0, 0, 0, 0
stub229		ends
