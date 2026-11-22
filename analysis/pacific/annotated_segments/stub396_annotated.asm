stub396		segment	para public 'CODE' use16
		assume cs:stub396
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76370	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6B3C0h		; fileoff
		dw 116Bh		; codesize
		dw 14Ah		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76390	proc far
		jmp	Gameflow_MeditScreen_E3D9D
sub_76390	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76395	proc far
		jmp	sub_E3A60
sub_76395	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7639A	proc far
		jmp	sub_E3B00
sub_7639A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7639F	proc far
		jmp	sub_E3B9D
sub_7639F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub396		ends
