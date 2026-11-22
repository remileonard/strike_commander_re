stub301		segment	para public 'CODE' use16
		assume cs:stub301
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_742A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 309E0h		; fileoff
		dw 11B3h		; codesize
		dw 0F6h		; relsize
		dw 9			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_742C0	proc far
		jmp	sub_AD38E
sub_742C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_742C5	proc far
		jmp	sub_AD349
sub_742C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_742CA	proc far
		jmp	sub_AD304
sub_742CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_742CF	proc far
		jmp	sub_AD2BF
sub_742CF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_742D4	proc far
		jmp	sub_AD27A
sub_742D4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_742D9	proc far
		jmp	sub_AD275
sub_742D9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_742DE	proc far
		jmp	sub_AD26E
sub_742DE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_742E3	proc far
		jmp	sub_AD229
sub_742E3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_742E8	proc far
		jmp	sub_AC220
sub_742E8	endp
		db 0, 0, 0
stub301		ends
