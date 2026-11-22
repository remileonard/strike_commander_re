stub203		segment	para public 'CODE' use16
		assume cs:stub203
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59070	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 129C0h		; fileoff
		dw 0A7h		; codesize
		dw 0Eh		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59090	proc far
		jmp	sub_726B0
sub_59090	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59095	proc far
		jmp	AI_ComputeGeometryWrapper_72730
sub_59095	endp
		db 0, 0, 0, 0, 0, 0
stub203		ends
