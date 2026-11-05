stub361		segment	para public 'CODE' use16
		assume cs:stub361
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75860	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4E6D0h		; fileoff
		dw 0FF9h		; codesize
		dw 15Eh		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75880	proc far
		jmp	sub_C8750
sub_75880	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75885	proc far
		jmp	sub_C9077
sub_75885	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7588A	proc far
		jmp	sub_C9158
sub_7588A	endp
		db 0
stub361		ends
