stub378		segment	para public 'CODE' use16
		assume cs:stub378
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75D60	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 57E10h		; fileoff
		dw 2988h		; codesize
		dw 248h		; relsize
		dw 9			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D80	proc far
		jmp	sub_D3ECF
sub_75D80	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D85	proc far
		jmp	sub_D3E8B
sub_75D85	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D8A	proc far
		jmp	sub_D1570
sub_75D8A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D8F	proc far
		jmp	sub_D160F
sub_75D8F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D94	proc far
		jmp	sub_D1840
sub_75D94	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D99	proc far
		jmp	sub_D18E3
sub_75D99	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75D9E	proc far
		jmp	sub_D1A1C
sub_75D9E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75DA3	proc far
		jmp	sub_D1EB9
sub_75DA3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75DA8	proc far
		jmp	sub_D254D
sub_75DA8	endp
		db 0, 0, 0
stub378		ends
