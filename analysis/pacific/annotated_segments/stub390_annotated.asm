stub390		segment	para public 'CODE' use16
		assume cs:stub390
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76100	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 64B60h		; fileoff
		dw 191h		; codesize
		dw 4		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76120	proc far
		jmp	sub_DD830
sub_76120	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76125	proc far
		jmp	sub_DD86D
sub_76125	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7612A	proc far
		jmp	sub_DD8B4
sub_7612A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7612F	proc far
		jmp	sub_DD8F6
sub_7612F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76134	proc far
		jmp	sub_DD91A
sub_76134	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76139	proc far
		jmp	sub_DD934
sub_76139	endp
		db 0, 0
stub390		ends
