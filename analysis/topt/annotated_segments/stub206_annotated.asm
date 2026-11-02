stub206		segment	para public 'CODE' use16
		assume cs:stub206
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47DE0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 360C0h		; fileoff
		dw 35F0h		; codesize
		dw 33Ah		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47E00	proc far
		jmp	Midgame14_Play_829F0
sub_47E00	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub206		ends
