stub225		segment	para public 'CODE' use16
		assume cs:stub225
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59580	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 191B0h		; fileoff
		dw 44FAh		; codesize
		dw 6DCh		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_595A0	proc far
		jmp	sub_78A05
sub_595A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_595A5	proc far
		jmp	sub_789C0
sub_595A5	endp
		db 0, 0, 0, 0, 0, 0
stub225		ends
