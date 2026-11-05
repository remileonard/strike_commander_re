stub320		segment	para public 'CODE' use16
		assume cs:stub320
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_747E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 359C0h		; fileoff
		dw 335h		; codesize
		dw 38h		; relsize
		dw 8			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74800	proc far
		jmp	sub_B0E70
sub_74800	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74805	proc far
		jmp	sub_B0F1F
sub_74805	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7480A	proc far
		jmp	StreamReader_DestructWrapper_B1005
sub_7480A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7480F	proc far
		jmp	sub_B1014
sub_7480F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74814	proc far
		jmp	sub_B1041
sub_74814	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74819	proc far
		jmp	sub_B10D0
sub_74819	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7481E	proc far
		jmp	sub_B1114
sub_7481E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74823	proc far
		jmp	sub_B1144
sub_74823	endp
		db 0, 0, 0, 0, 0, 0, 0, 0
stub320		ends
