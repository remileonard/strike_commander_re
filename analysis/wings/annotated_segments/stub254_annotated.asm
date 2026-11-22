stub254		segment	para public 'CODE' use16
		assume cs:stub254
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59B90	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2B320h		; fileoff
		dw 1C9h		; codesize
		dw 0Ch		; relsize
		dw 7			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59BB0	proc far
		jmp	Video_PrintString_89440
sub_59BB0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59BB5	proc far
		jmp	sub_89487
sub_59BB5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59BBA	proc far
		jmp	sub_894B9
sub_59BBA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59BBF	proc far
		jmp	sub_894ED
sub_59BBF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59BC4	proc far
		jmp	sub_89521
sub_59BC4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59BC9	proc far
		jmp	sub_8959E
sub_59BC9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59BCE	proc far
		jmp	sub_895C6
sub_59BCE	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub254		ends
