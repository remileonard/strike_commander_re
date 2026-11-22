stub242		segment	para public 'CODE' use16
		assume cs:stub242
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73120	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0D3D0h		; fileoff
		dw 108h		; codesize
		dw 2		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73140	proc far
		jmp	Input_ProcessFrame_8A5F0
sub_73140	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub242		ends
