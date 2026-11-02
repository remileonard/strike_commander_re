stub203		segment	para public 'CODE' use16
		assume cs:stub203
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47D50	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2DB60h		; fileoff
		dw 14F7h		; codesize
		dw 15Eh		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47D70	proc far
		jmp	sub_7ACD0
sub_47D70	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub203		ends
