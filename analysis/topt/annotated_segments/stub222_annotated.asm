stub222		segment	para public 'CODE' use16
		assume cs:stub222
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48250	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 70750h		; fileoff
		dw 2A0h		; codesize
		dw 28h		; relsize
		dw 7			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48270	proc far
		jmp	sub_B9C70
sub_48270	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48275	proc far
		jmp	sub_B9CB6
sub_48275	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4827A	proc far
		jmp	sub_B9D7D
sub_4827A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4827F	proc far
		jmp	sub_B9DC0
sub_4827F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48284	proc far
		jmp	Debris_ContainerOpWrapper_B9E38
sub_48284	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48289	proc far
		jmp	sub_B9E56
sub_48289	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4828E	proc far
		jmp	sub_B9EDA
sub_4828E	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub222		ends
