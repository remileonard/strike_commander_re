stub400		segment	para public 'CODE' use16
		assume cs:stub400
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76440	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6CD30h		; fileoff
		dw 1F1h		; codesize
		dw 1Ch		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76460	proc far
		jmp	sub_E5200
sub_76460	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76465	proc far
		jmp	sub_E529C
sub_76465	endp
		db 0, 0, 0, 0, 0, 0
stub400		ends
