stub276		segment	para public 'CODE' use16
		assume cs:stub276
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73C50	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 27890h		; fileoff
		dw 36Dh		; codesize
		dw 24h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73C70	proc far
		jmp	sub_A3690
sub_73C70	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73C75	proc far
		jmp	sub_A38EA
sub_73C75	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73C7A	proc far
		jmp	sub_A37D7
sub_73C7A	endp
		db 0
stub276		ends
