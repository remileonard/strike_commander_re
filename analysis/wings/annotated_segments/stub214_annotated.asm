stub214		segment	para public 'CODE' use16
		assume cs:stub214
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59330	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 172B0h		; fileoff
		dw 27Ch		; codesize
		dw 16h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59350	proc far
		jmp	sub_76C00
sub_59350	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59355	proc far
		jmp	sub_76DB5
sub_59355	endp
		db 0, 0, 0, 0, 0, 0
stub214		ends
