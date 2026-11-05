stub185		segment	para public 'CODE' use16
		assume cs:stub185
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58A20	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0		; fileoff
		dw 5F69h		; codesize
		dw 0		; relsize
		dw 8			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A40	proc far
		jmp	sub_6563A
sub_58A40	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A45	proc far
		jmp	sub_6542B
sub_58A45	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A4A	proc far
		jmp	sub_653A4
sub_58A4A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A4F	proc far
		jmp	sub_65677
sub_58A4F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A54	proc far
		jmp	sub_653A7
sub_58A54	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A59	proc far
		jmp	sub_65671
sub_58A59	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A5E	proc far
		jmp	sub_653C5
sub_58A5E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A63	proc far
		jmp	sub_66766
sub_58A63	endp
		db 0, 0, 0, 0, 0, 0, 0, 0
stub185		ends
