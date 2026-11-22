stub206		segment	para public 'CODE' use16
		assume cs:stub206
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_591C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 14B10h		; fileoff
		dw 3E9h		; codesize
		dw 4Ah		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_591E0	proc far
		jmp	UIScreen_RenderGraphVGA_Wrapper_74A1D
sub_591E0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_591E5	proc far
		jmp	sub_74650
sub_591E5	endp
		db 0, 0, 0, 0, 0, 0
stub206		ends
