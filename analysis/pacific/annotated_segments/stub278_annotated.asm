stub278		segment	para public 'CODE' use16
		assume cs:stub278
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73CB0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 27F10h		; fileoff
		dw 1C4Ah		; codesize
		dw 62h		; relsize
		dw 8			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CD0	proc far
		jmp	sub_A58DB
sub_73CD0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CD5	proc far
		jmp	sub_A58CC
sub_73CD5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CDA	proc far
		jmp	sub_A58BB
sub_73CDA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CDF	proc far
		jmp	sub_A588E
sub_73CDF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CE4	proc far
		jmp	sub_A3CC0
sub_73CE4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CE9	proc far
		jmp	sub_A50D7
sub_73CE9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CEE	proc far
		jmp	sub_A5860
sub_73CEE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73CF3	proc far
		jmp	sub_A5880
sub_73CF3	endp
		db 0, 0, 0, 0, 0, 0, 0, 0
stub278		ends
