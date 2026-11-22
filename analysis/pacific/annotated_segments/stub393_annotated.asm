stub393		segment	para public 'CODE' use16
		assume cs:stub393
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76290	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 670E0h		; fileoff
		dw 299h		; codesize
		dw 10h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_762B0	proc far
		jmp	sub_DFB70
sub_762B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_762B5	proc far
		jmp	sub_DFBB5
sub_762B5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_762BA	proc far
		jmp	sub_DFBEF
sub_762BA	endp
		db 0
stub393		ends
