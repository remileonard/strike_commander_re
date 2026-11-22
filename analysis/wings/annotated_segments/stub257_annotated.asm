stub257		segment	para public 'CODE' use16
		assume cs:stub257
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59CC0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2BCE0h		; fileoff
		dw 1EAh		; codesize
		dw 14h		; relsize
		dw 0Bh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59CE0	proc far
		jmp	sub_89F6C
sub_59CE0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59CE5	proc far
		jmp	sub_89E71
sub_59CE5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59CEA	proc far
		jmp	sub_89EDA
sub_59CEA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59CEF	proc far
		jmp	sub_89DB0
sub_59CEF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59CF4	proc far
		jmp	sub_89DD2
sub_59CF4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59CF9	proc far
		jmp	sub_89DF4
sub_59CF9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59CFE	proc far
		jmp	sub_89E3D
sub_59CFE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59D03	proc far
		jmp	sub_89E4A
sub_59D03	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59D08	proc far
		jmp	sub_89E57
sub_59D08	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59D0D	proc far
		jmp	sub_89E64
sub_59D0D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59D12	proc far
		jmp	sub_89F24
sub_59D12	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0
stub257		ends
