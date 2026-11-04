stub233		segment	para public 'CODE' use16
		assume cs:stub233
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48560	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 739A0h		; fileoff
		dw 2F6h		; codesize
		dw 20h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48580	proc far
		jmp	sub_BCC90
sub_48580	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub233		ends
