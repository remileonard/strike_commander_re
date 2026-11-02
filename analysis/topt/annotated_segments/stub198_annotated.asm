stub198		segment	para public 'CODE' use16
		assume cs:stub198
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47C10	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 19CB0h		; fileoff
		dw 35Fh		; codesize
		dw 22h		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C30	proc far
		jmp	sub_68453
sub_47C30	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C35	proc far
		jmp	sub_68120
sub_47C35	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C3A	proc far
		jmp	sub_68169
sub_47C3A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C3F	proc far
		jmp	sub_6817C
sub_47C3F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C44	proc far
		jmp	sub_683A7
sub_47C44	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47C49	proc far
		jmp	sub_6836B
sub_47C49	endp
		db 0, 0
stub198		ends
