stub277		segment	para public 'CODE' use16
		assume cs:stub277
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73C80	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 27C30h		; fileoff
		dw 2BCh		; codesize
		dw 1Ch		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CA0	proc far
		jmp	sub_A3A00
sub_73CA0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CA5	proc far
		jmp	sub_A3B7D
sub_73CA5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CAA	proc far
		jmp	sub_A3C4F
sub_73CAA	endp
		db 0
stub277		ends
