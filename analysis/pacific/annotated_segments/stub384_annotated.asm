stub384		segment	para public 'CODE' use16
		assume cs:stub384
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75FC0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 604F0h		; fileoff
		dw 0F75h		; codesize
		dw 148h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75FE0	proc far
		jmp	sub_D9A80
sub_75FE0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75FE5	proc far
		jmp	sub_D9630
sub_75FE5	endp
		db 0, 0, 0, 0, 0, 0
stub384		ends
