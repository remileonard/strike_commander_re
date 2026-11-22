stub405		segment	para public 'CODE' use16
		assume cs:stub405
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76520	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D100h		; fileoff
		dw 17h		; codesize
		dw 2		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76540	proc far
		jmp	sub_E55B0
sub_76540	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub405		ends
