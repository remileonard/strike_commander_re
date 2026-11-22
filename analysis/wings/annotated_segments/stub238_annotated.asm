stub238		segment	para public 'CODE' use16
		assume cs:stub238
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_597F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 28F50h		; fileoff
		dw 0AF9h		; codesize
		dw 0D2h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59810	proc far
		jmp	sub_87290
sub_59810	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub238		ends
