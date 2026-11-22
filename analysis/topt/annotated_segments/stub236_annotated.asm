stub236		segment	para public 'CODE' use16
		assume cs:stub236
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_485F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 74590h		; fileoff
		dw 172h		; codesize
		dw 20h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48610	proc far
		jmp	sub_BD800
sub_48610	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub236		ends
