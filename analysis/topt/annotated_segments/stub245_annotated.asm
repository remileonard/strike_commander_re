stub245		segment	para public 'CODE' use16
		assume cs:stub245
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_487A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 75500h		; fileoff
		dw 4F1h		; codesize
		dw 1Eh		; relsize
		dw 0Ch			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487C0	proc far
		jmp	sub_BEB87
sub_487C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487C5	proc far
		jmp	sub_BEB41
sub_487C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487CA	proc far
		jmp	sub_BE6C0
sub_487CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487CF	proc far
		jmp	sub_BEAEC
sub_487CF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487D4	proc far
		jmp	sub_BE7D8
sub_487D4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487D9	proc far
		jmp	sub_BE7F4
sub_487D9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487DE	proc far
		jmp	sub_BE8EC
sub_487DE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487E3	proc far
		jmp	sub_BE9BC
sub_487E3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487E8	proc far
		jmp	sub_BE9C4
sub_487E8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487ED	proc far
		jmp	sub_BEA04
sub_487ED	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487F2	proc far
		jmp	sub_BEA9F
sub_487F2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_487F7	proc far
		jmp	sub_BEAE0
sub_487F7	endp
		db 0, 0, 0, 0
stub245		ends
