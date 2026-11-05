stub318		segment	para public 'CODE' use16
		assume cs:stub318
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74780	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 35890h		; fileoff
		dw 0A1h		; codesize
		dw 0Eh		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_747A0	proc far
		jmp	sub_B0D40
sub_747A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_747A5	proc far
		jmp	PlayerComponentVariantR_ConstructAndInit_B0D54
sub_747A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_747AA	proc far
		jmp	sub_B0DD9
sub_747AA	endp
		db 0
stub318		ends
