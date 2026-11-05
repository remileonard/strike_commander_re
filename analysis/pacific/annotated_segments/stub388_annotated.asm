stub388		segment	para public 'CODE' use16
		assume cs:stub388
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76080	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 62010h		; fileoff
		dw 58h		; codesize
		dw 4		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760A0	proc far
		jmp	sub_DAF50
sub_760A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760A5	proc far
		jmp	sub_DAF7E
sub_760A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760AA	proc far
		jmp	sub_DAF94
sub_760AA	endp
		db 0
stub388		ends
