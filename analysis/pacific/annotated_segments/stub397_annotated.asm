stub397		segment	para public 'CODE' use16
		assume cs:stub397
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_763B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6C680h		; fileoff
		dw 3F6h		; codesize
		dw 4Ch		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_763D0	proc far
		jmp	sub_E4EBB
sub_763D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_763D5	proc far
		jmp	sub_E4BD0
sub_763D5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_763DA	proc far
		jmp	sub_E4C5A
sub_763DA	endp
		db 0
stub397		ends
