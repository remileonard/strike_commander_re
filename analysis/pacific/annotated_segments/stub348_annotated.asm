stub348		segment	para public 'CODE' use16
		assume cs:stub348
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75480	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 465F0h		; fileoff
		dw 4D0h		; codesize
		dw 30h		; relsize
		dw 7			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754A0	proc far
		jmp	sub_C11F4
sub_754A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754A5	proc far
		jmp	sub_C0F72
sub_754A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754AA	proc far
		jmp	sub_C0ED0
sub_754AA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754AF	proc far
		jmp	sub_C1348
sub_754AF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754B4	proc far
		jmp	sub_C0F50
sub_754B4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754B9	proc far
		jmp	sub_C1112
sub_754B9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_754BE	proc far
		jmp	sub_C12A8
sub_754BE	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub348		ends
