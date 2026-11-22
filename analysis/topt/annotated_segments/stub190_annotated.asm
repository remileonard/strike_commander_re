stub190		segment	para public 'CODE' use16
		assume cs:stub190
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47950	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4E00h		; fileoff
		dw 1B71h		; codesize
		dw 192h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47970	proc far
		jmp	sub_54290
sub_47970	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47975	proc far
		jmp	sub_54DF7
sub_47975	endp
		db 0, 0, 0, 0, 0, 0
stub190		ends
