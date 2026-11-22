stub358		segment	para public 'CODE' use16
		assume cs:stub358
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75790	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4CBA0h		; fileoff
		dw 402h		; codesize
		dw 42h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_757B0	proc far
		jmp	sub_C6FBA
sub_757B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_757B5	proc far
		jmp	sub_C6E00
sub_757B5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_757BA	proc far
		jmp	sub_C6E8B
sub_757BA	endp
		db 0
stub358		ends
