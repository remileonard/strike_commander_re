stub359		segment	para public 'CODE' use16
		assume cs:stub359
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_757C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4CFF0h		; fileoff
		dw 1048h		; codesize
		dw 156h		; relsize
		dw 0Ah			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_757E0	proc far
		jmp	sub_C78EF
sub_757E0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_757E5	proc far
		jmp	sub_C7210
sub_757E5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_757EA	proc far
		jmp	Gameflow_LoadScene_C73DD
sub_757EA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_757EF	proc far
		jmp	sub_C781E
sub_757EF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_757F4	proc far
		jmp	sub_C798D
sub_757F4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_757F9	proc far
		jmp	sub_C78B3
sub_757F9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_757FE	proc far
		jmp	sub_C792C
sub_757FE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75803	proc far
		jmp	sub_C7A2C
sub_75803	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75808	proc far
		jmp	sub_C821B
sub_75808	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7580D	proc far
		jmp	sub_C8244
sub_7580D	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub359		ends
