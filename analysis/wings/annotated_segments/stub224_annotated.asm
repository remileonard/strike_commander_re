stub224		segment	para public 'CODE' use16
		assume cs:stub224
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59550	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 19180h		; fileoff
		dw 21h		; codesize
		dw 2		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59570	proc far
		jmp	sub_78990
sub_59570	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub224		ends
