stub372		segment	para public 'CODE' use16
		assume cs:stub372
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75B70	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 56B50h		; fileoff
		dw 315h		; codesize
		dw 26h		; relsize
		dw 0Bh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B90	proc far
		jmp	sub_D0340
sub_75B90	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B95	proc far
		jmp	sub_D035D
sub_75B95	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B9A	proc far
		jmp	sub_D03AE
sub_75B9A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B9F	proc far
		jmp	sub_D03BD
sub_75B9F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75BA4	proc far
		jmp	sub_D03DA
sub_75BA4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75BA9	proc far
		jmp	sub_D042B
sub_75BA9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75BAE	proc far
		jmp	sub_D043A
sub_75BAE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75BB3	proc far
		jmp	sub_D047A
sub_75BB3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75BB8	proc far
		jmp	sub_D055B
sub_75BB8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75BBD	proc far
		jmp	sub_D04D5
sub_75BBD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75BC2	proc far
		jmp	sub_D050A
sub_75BC2	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0
stub372		ends
