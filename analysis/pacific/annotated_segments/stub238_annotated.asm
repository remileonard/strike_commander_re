stub238		segment	para public 'CODE' use16
		assume cs:stub238
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73030	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0A460h		; fileoff
		dw 2C1h		; codesize
		dw 50h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73050	proc far
		jmp	sub_877A0
sub_73050	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub238		ends
