stub223		segment	para public 'CODE' use16
		assume cs:stub223
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_482A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 70A20h		; fileoff
		dw 0E1h		; codesize
		dw 0Eh		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_482C0	proc far
		jmp	sub_B9FE5
sub_482C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_482C5	proc far
		jmp	sub_B9FDD
sub_482C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_482CA	proc far
		jmp	sub_B9F10
sub_482CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_482CF	proc far
		jmp	sub_B9FA8
sub_482CF	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub223		ends
