stub244		segment	para public 'CODE' use16
		assume cs:stub244
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_599A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2AA50h		; fileoff
		dw 1F1h		; codesize
		dw 1Ch		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_599C0	proc far
		jmp	sub_88BF0
sub_599C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_599C5	proc far
		jmp	sub_88C8C
sub_599C5	endp
		db 0, 0, 0, 0, 0, 0
stub244		ends
