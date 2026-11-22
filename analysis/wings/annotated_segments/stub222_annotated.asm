stub222		segment	para public 'CODE' use16
		assume cs:stub222
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_594B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 180E0h		; fileoff
		dw 568h		; codesize
		dw 3Eh		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_594D0	proc far
		jmp	sub_779B0
sub_594D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_594D5	proc far
		jmp	sub_779D6
sub_594D5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_594DA	proc far
		jmp	Text_TypewriterTimer
sub_594DA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_594DF	proc far
		jmp	sub_77D8A
sub_594DF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_594E4	proc far
		jmp	Text_TypewriterDrawChar
sub_594E4	endp
		db 0, 0, 0, 0, 0, 0, 0
stub222		ends
