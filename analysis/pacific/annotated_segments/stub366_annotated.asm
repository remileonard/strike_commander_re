stub366		segment	para public 'CODE' use16
		assume cs:stub366
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_759A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 52CD0h		; fileoff
		dw 0F0Ah		; codesize
		dw 142h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_759C0	proc far
		jmp	sub_CCC2F
sub_759C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_759C5	proc far
		jmp	sub_CC810
sub_759C5	endp
		db 0, 0, 0, 0, 0, 0
stub366		ends
