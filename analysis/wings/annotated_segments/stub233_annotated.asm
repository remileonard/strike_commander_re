stub233		segment	para public 'CODE' use16
		assume cs:stub233
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59700	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 24230h		; fileoff
		dw 301h		; codesize
		dw 42h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59720	proc far
		jmp	sub_82C40
sub_59720	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub233		ends
