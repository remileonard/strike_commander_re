stub261		segment	para public 'CODE' use16
		assume cs:stub261
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_738F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 21A70h		; fileoff
		dw 218h		; codesize
		dw 1Ah		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73910	proc far
		jmp	Controller_InitStructDefault
sub_73910	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73915	proc far
		jmp	sub_9DDDD
sub_73915	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7391A	proc far
		jmp	sub_9DE11
sub_7391A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7391F	proc far
		jmp	sub_9DE74
sub_7391F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub261		ends
