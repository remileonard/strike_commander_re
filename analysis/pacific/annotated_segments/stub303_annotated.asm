stub303		segment	para public 'CODE' use16
		assume cs:stub303
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74320	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 31E30h		; fileoff
		dw 0B7h		; codesize
		dw 0Eh		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74340	proc far
		jmp	sub_AD570
sub_74340	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74345	proc far
		jmp	AI_ComputeGeometryWrapper_AD5F0
sub_74345	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7434A	proc far
		jmp	sub_AD617
sub_7434A	endp
		db 0
stub303		ends
