stub194		segment	para public 'CODE' use16
		assume cs:stub194
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58CF0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0E930h		; fileoff
		dw 86Ah		; codesize
		dw 40h		; relsize
		dw 0Ah			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D10	proc far
		jmp	sub_6F068
sub_58D10	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D15	proc far
		jmp	sub_6EB2B
sub_58D15	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D1A	proc far
		jmp	sub_6E95B
sub_58D1A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D1F	proc far
		jmp	sub_6EBAF
sub_58D1F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D24	proc far
		jmp	sub_6E8D8
sub_58D24	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D29	proc far
		jmp	sub_6F001
sub_58D29	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D2E	proc far
		jmp	sub_6F0CE
sub_58D2E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D33	proc far
		jmp	sub_6E8C0
sub_58D33	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D38	proc far
		jmp	sub_6E8C8
sub_58D38	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D3D	proc far
		jmp	sub_6E8D0
sub_58D3D	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub194		ends
