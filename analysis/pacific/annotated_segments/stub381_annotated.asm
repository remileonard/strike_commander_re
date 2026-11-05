stub381		segment	para public 'CODE' use16
		assume cs:stub381
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75E10	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 5BBB0h		; fileoff
		dw 227Fh		; codesize
		dw 1E4h		; relsize
		dw 15h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E30	proc far
		jmp	PaletteScreen_ReleaseStyleAndObject_D71F6
sub_75E30	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E35	proc far
		jmp	sub_D71B8
sub_75E35	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E3A	proc far
		jmp	sub_D7175
sub_75E3A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E3F	proc far
		jmp	sub_D7149
sub_75E3F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E44	proc far
		jmp	sub_D6C6E
sub_75E44	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E49	proc far
		jmp	sub_D4FA0
sub_75E49	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E4E	proc far
		jmp	sub_D50D3
sub_75E4E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E53	proc far
		jmp	sub_D5289
sub_75E53	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E58	proc far
		jmp	sub_D52F4
sub_75E58	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E5D	proc far
		jmp	sub_D532A
sub_75E5D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E62	proc far
		jmp	sub_D53FA
sub_75E62	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E67	proc far
		jmp	sub_D54F6
sub_75E67	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E6C	proc far
		jmp	sub_D5548
sub_75E6C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E71	proc far
		jmp	sub_D56C6
sub_75E71	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E76	proc far
		jmp	sub_D5868
sub_75E76	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E7B	proc far
		jmp	sub_D5BA8
sub_75E7B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E80	proc far
		jmp	sub_D5D0D
sub_75E80	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E85	proc far
		jmp	sub_D5EAF
sub_75E85	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E8A	proc far
		jmp	sub_D61AC
sub_75E8A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E8F	proc far
		jmp	sub_D649D
sub_75E8F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75E94	proc far
		jmp	sub_D68B6
sub_75E94	endp
		db 0, 0, 0, 0, 0, 0, 0
stub381		ends
