stub213		segment	para public 'CODE' use16
		assume cs:stub213
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59300	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 170E0h		; fileoff
		dw 196h		; codesize
		dw 2Ch		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59320	proc far
		jmp	sub_76A60
sub_59320	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59325	proc far
		jmp	sub_76B80
sub_59325	endp
		db 0, 0, 0, 0, 0, 0
stub213		ends
