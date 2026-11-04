stub239		segment	para public 'CODE' use16
		assume cs:stub239
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48680	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 74B00h		; fileoff
		dw 1C5h		; codesize
		dw 12h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_486A0	proc far
		jmp	sub_BDD10
sub_486A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_486A5	proc far
		jmp	sub_BDD64
sub_486A5	endp
		db 0, 0, 0, 0, 0, 0
stub239		ends
