stub204		segment	para public 'CODE' use16
		assume cs:stub204
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47D80	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2F1C0h		; fileoff
		dw 0AFFh		; codesize
		dw 0B8h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47DA0	proc far
		jmp	MidgameTO3_Play_7C1D0
sub_47DA0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub204		ends
