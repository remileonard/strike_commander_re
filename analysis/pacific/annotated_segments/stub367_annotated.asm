stub367		segment	para public 'CODE' use16
		assume cs:stub367
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_759D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 53D20h		; fileoff
		dw 346h		; codesize
		dw 42h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_759F0	proc far
		jmp	sub_CD8A6
sub_759F0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_759F5	proc far
		jmp	sub_CD720
sub_759F5	endp
		db 0, 0, 0, 0, 0, 0
stub367		ends
