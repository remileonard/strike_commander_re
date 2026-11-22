stub238		segment	para public 'CODE' use16
		assume cs:stub238
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48650	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 74910h		; fileoff
		dw 1BDh		; codesize
		dw 30h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48670	proc far
		jmp	sub_BDB50
sub_48670	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub238		ends
