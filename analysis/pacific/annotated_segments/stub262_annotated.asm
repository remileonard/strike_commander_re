stub262		segment	para public 'CODE' use16
		assume cs:stub262
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73930	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 21CB0h		; fileoff
		dw 7AFh		; codesize
		dw 5Eh		; relsize
		dw 0Ch			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73950	proc far
		jmp	sub_9E293
sub_73950	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73955	proc far
		jmp	sub_9E36A
sub_73955	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7395A	proc far
		jmp	sub_9E3B4
sub_7395A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7395F	proc far
		jmp	sub_9E50F
sub_7395F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73964	proc far
		jmp	sub_9E428
sub_73964	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73969	proc far
		jmp	Options_LoadDefaults_9E583
sub_73969	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7396E	proc far
		jmp	sub_9E4BB
sub_7396E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73973	proc far
		jmp	sub_9E1B2
sub_73973	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73978	proc far
		jmp	sub_9DFD0
sub_73978	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7397D	proc far
		jmp	sub_9E619
sub_7397D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73982	proc far
		jmp	sub_9E638
sub_73982	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73987	proc far
		jmp	sub_9E702
sub_73987	endp
		db 0, 0, 0, 0
stub262		ends
