stub369		segment	para public 'CODE' use16
		assume cs:stub369
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75A80	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 549C0h		; fileoff
		dw 3DDh		; codesize
		dw 50h		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AA0	proc far
		jmp	sub_CE6B7
sub_75AA0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AA5	proc far
		jmp	sub_CE687
sub_75AA5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AAA	proc far
		jmp	TextCycler_AllocateA_CE661
sub_75AAA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AAF	proc far
		jmp	sub_CE310
sub_75AAF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AB4	proc far
		jmp	sub_CE39F
sub_75AB4	endp
		db 0, 0, 0, 0, 0, 0, 0
stub369		ends
