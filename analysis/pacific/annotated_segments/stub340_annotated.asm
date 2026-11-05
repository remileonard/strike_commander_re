stub340		segment	para public 'CODE' use16
		assume cs:stub340
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_750A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3EDE0h		; fileoff
		dw 45Ch		; codesize
		dw 26h		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_750C0	proc far
		jmp	EjectSeat_LoadFromIFF_B9CF0
sub_750C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_750C5	proc far
		jmp	EjectSeat_SpawnInstance_B9D68
sub_750C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_750CA	proc far
		jmp	sub_B9DF2
sub_750CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_750CF	proc far
		jmp	sub_B9E42
sub_750CF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_750D4	proc far
		jmp	sub_BA0FD
sub_750D4	endp
		db 0, 0, 0, 0, 0, 0, 0
stub340		ends
