stub360		segment	para public 'CODE' use16
		assume cs:stub360
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75820	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4E190h		; fileoff
		dw 4EAh		; codesize
		dw 56h		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75840	proc far
		jmp	sub_C84D5
sub_75840	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75845	proc far
		jmp	sub_C856A
sub_75845	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7584A	proc far
		jmp	sub_C83F5
sub_7584A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7584F	proc far
		jmp	sub_C8260
sub_7584F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub360		ends
