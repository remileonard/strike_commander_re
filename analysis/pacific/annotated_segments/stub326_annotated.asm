stub326		segment	para public 'CODE' use16
		assume cs:stub326
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74970	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 37390h		; fileoff
		dw 0D5Ch		; codesize
		dw 6Ah		; relsize
		dw 14h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74990	proc far
		jmp	sub_B278D
sub_74990	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74995	proc far
		jmp	sub_B27BD
sub_74995	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7499A	proc far
		jmp	sub_B27E2
sub_7499A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7499F	proc far
		jmp	sub_B285B
sub_7499F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749A4	proc far
		jmp	sub_B2BA7
sub_749A4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749A9	proc far
		jmp	sub_B2730
sub_749A9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749AE	proc far
		jmp	sub_B28A9
sub_749AE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749B3	proc far
		jmp	sub_B28E8
sub_749B3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749B8	proc far
		jmp	sub_B2C26
sub_749B8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749BD	proc far
		jmp	sub_B291A
sub_749BD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749C2	proc far
		jmp	sub_B2C7A
sub_749C2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749C7	proc far
		jmp	sub_B2D0C
sub_749C7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749CC	proc far
		jmp	sub_B2EB5
sub_749CC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749D1	proc far
		jmp	sub_B3024
sub_749D1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749D6	proc far
		jmp	sub_B3055
sub_749D6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749DB	proc far
		jmp	sub_B3086
sub_749DB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749E0	proc far
		jmp	sub_B3118
sub_749E0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749E5	proc far
		jmp	sub_B32BB
sub_749E5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749EA	proc far
		jmp	sub_B342A
sub_749EA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_749EF	proc far
		jmp	sub_B345B
sub_749EF	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub326		ends
