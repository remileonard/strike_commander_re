stub272		segment	para public 'CODE' use16
		assume cs:stub272
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73B90	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 274F0h		; fileoff
		dw 18Eh		; codesize
		dw 12h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73BB0	proc far
		jmp	sub_A3300
sub_73BB0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73BB5	proc far
		jmp	sub_A334B
sub_73BB5	endp
		db 0, 0, 0, 0, 0, 0
stub272		ends
