stub385		segment	para public 'CODE' use16
		assume cs:stub385
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75FF0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 615B0h		; fileoff
		dw 90Eh		; codesize
		dw 0A8h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76010	proc far
		jmp	sub_DA5B0
sub_76010	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub385		ends
