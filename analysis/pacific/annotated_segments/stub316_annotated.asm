stub316		segment	para public 'CODE' use16
		assume cs:stub316
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_746F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 351F0h		; fileoff
		dw 48Dh		; codesize
		dw 4Ah		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74710	proc far
		jmp	sub_B0710
sub_74710	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74715	proc far
		jmp	sub_B0922
sub_74715	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7471A	proc far
		jmp	sub_B0976
sub_7471A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7471F	proc far
		jmp	sub_B09C1
sub_7471F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74724	proc far
		jmp	sub_B0A21
sub_74724	endp
		db 0, 0, 0, 0, 0, 0, 0
stub316		ends
