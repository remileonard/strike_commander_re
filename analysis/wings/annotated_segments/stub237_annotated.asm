stub237		segment	para public 'CODE' use16
		assume cs:stub237
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_597C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 28C00h		; fileoff
		dw 301h		; codesize
		dw 42h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_597E0	proc far
		jmp	sub_86F80
sub_597E0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub237		ends
