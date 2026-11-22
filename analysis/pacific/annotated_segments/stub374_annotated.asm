stub374		segment	para public 'CODE' use16
		assume cs:stub374
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75C00	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 56FD0h		; fileoff
		dw 225h		; codesize
		dw 2Ah		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75C20	proc far
		jmp	sub_D07A0
sub_75C20	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75C25	proc far
		jmp	sub_D07D5
sub_75C25	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75C2A	proc far
		jmp	sub_D091D
sub_75C2A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75C2F	proc far
		jmp	sub_D0966
sub_75C2F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75C34	proc far
		jmp	sub_D09AA
sub_75C34	endp
		db 0, 0, 0, 0, 0, 0, 0
stub374		ends
