stub211		segment	para public 'CODE' use16
		assume cs:stub211
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_592A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 16400h		; fileoff
		dw 8CBh		; codesize
		dw 58h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_592C0	proc far
		jmp	sub_75E20
sub_592C0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub211		ends
