stub216		segment	para public 'CODE' use16
		assume cs:stub216
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59390	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 17560h		; fileoff
		dw 18Fh		; codesize
		dw 12h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_593B0	proc far
		jmp	sub_76E90
sub_593B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_593B5	proc far
		jmp	sub_76EDB
sub_593B5	endp
		db 0, 0, 0, 0, 0, 0
stub216		ends
