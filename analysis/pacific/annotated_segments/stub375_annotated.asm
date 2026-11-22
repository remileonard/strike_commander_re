stub375		segment	para public 'CODE' use16
		assume cs:stub375
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75C40	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 57230h		; fileoff
		dw 22Dh		; codesize
		dw 0Ah		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75C60	proc far
		jmp	sub_D09D0
sub_75C60	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75C65	proc far
		jmp	sub_D0A0F
sub_75C65	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75C6A	proc far
		jmp	sub_D0A58
sub_75C6A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75C6F	proc far
		jmp	sub_D0A9C
sub_75C6F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub375		ends
