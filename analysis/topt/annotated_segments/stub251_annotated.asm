stub251		segment	para public 'CODE' use16
		assume cs:stub251
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_489A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 773E0h		; fileoff
		dw 363h		; codesize
		dw 24h		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_489C0	proc far
		jmp	sub_C0460
sub_489C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_489C5	proc far
		jmp	sub_C0749
sub_489C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_489CA	proc far
		jmp	sub_C058E
sub_489CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_489CF	proc far
		jmp	sub_C06E5
sub_489CF	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub251		ends
