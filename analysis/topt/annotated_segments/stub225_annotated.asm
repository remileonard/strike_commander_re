stub225		segment	para public 'CODE' use16
		assume cs:stub225
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48340	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 70FB0h		; fileoff
		dw 40Dh		; codesize
		dw 42h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48360	proc far
		jmp	sub_BA841
sub_48360	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48365	proc far
		jmp	sub_BA480
sub_48365	endp
		db 0, 0, 0, 0, 0, 0
stub225		ends
