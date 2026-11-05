stub275		segment	para public 'CODE' use16
		assume cs:stub275
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73C20	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 27820h		; fileoff
		dw 62h		; codesize
		dw 6		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73C40	proc far
		jmp	sub_A3620
sub_73C40	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub275		ends
