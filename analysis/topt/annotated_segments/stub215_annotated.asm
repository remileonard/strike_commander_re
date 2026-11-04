stub215		segment	para public 'CODE' use16
		assume cs:stub215
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47F90	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6BF10h		; fileoff
		dw 110Dh		; codesize
		dw 132h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47FB0	proc far
		jmp	sub_B67C6
sub_47FB0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47FB5	proc far
		jmp	sub_B6775
sub_47FB5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47FBA	proc far
		jmp	sub_B5750
sub_47FBA	endp
		db 0
stub215		ends
