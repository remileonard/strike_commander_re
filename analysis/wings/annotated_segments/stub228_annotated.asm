stub228		segment	para public 'CODE' use16
		assume cs:stub228
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59610	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1F420h		; fileoff
		dw 7DFh		; codesize
		dw 94h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59630	proc far
		jmp	sub_7E3C0
sub_59630	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub228		ends
