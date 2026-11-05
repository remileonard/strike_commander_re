stub364		segment	para public 'CODE' use16
		assume cs:stub364
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_758F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 505D0h		; fileoff
		dw 244h		; codesize
		dw 32h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75910	proc far
		jmp	sub_CA536
sub_75910	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75915	proc far
		jmp	sub_CA3E0
sub_75915	endp
		db 0, 0, 0, 0, 0, 0
stub364		ends
