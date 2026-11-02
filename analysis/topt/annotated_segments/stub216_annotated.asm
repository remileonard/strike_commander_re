stub216		segment	para public 'CODE' use16
		assume cs:stub216
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47FC0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D150h		; fileoff
		dw 1A0h		; codesize
		dw 16h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47FE0	proc far
		jmp	sub_B6860
sub_47FE0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47FE5	proc far
		jmp	sub_B6929
sub_47FE5	endp
		db 0, 0, 0, 0, 0, 0
stub216		ends
