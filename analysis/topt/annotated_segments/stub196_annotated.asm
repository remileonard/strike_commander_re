stub196		segment	para public 'CODE' use16
		assume cs:stub196
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47B60	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 17790h		; fileoff
		dw 178Fh		; codesize
		dw 11Ah		; relsize
		dw 0Dh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B80	proc far
		jmp	sub_67565
sub_47B80	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B85	proc far
		jmp	sub_67552
sub_47B85	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B8A	proc far
		jmp	sub_674E8
sub_47B8A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B8F	proc far
		jmp	sub_674D5
sub_47B8F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B94	proc far
		jmp	sub_6749B
sub_47B94	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B99	proc far
		jmp	sub_66111
sub_47B99	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B9E	proc far
		jmp	sub_67013
sub_47B9E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47BA3	proc far
		jmp	sub_6709B
sub_47BA3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47BA8	proc far
		jmp	sub_66F54
sub_47BA8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47BAD	proc far
		jmp	sub_65E10
sub_47BAD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47BB2	proc far
		jmp	sub_65EA8
sub_47BB2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47BB7	proc far
		jmp	sub_66038
sub_47BB7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47BBC	proc far
		jmp	sub_670AD
sub_47BBC	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub196		ends
