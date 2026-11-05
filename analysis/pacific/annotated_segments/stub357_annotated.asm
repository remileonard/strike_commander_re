stub357		segment	para public 'CODE' use16
		assume cs:stub357
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75730	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4BD80h		; fileoff
		dw 0D2Fh		; codesize
		dw 0ECh		; relsize
		dw 0Ch			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75750	proc far
		jmp	sub_C60D0
sub_75750	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75755	proc far
		jmp	sub_C6CBB
sub_75755	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7575A	proc far
		jmp	sub_C6D68
sub_7575A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7575F	proc far
		jmp	sub_C6D91
sub_7575F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75764	proc far
		jmp	sub_C611F
sub_75764	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75769	proc far
		jmp	sub_C61B7
sub_75769	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7576E	proc far
		jmp	sub_C686C
sub_7576E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75773	proc far
		jmp	sub_C6AA2
sub_75773	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75778	proc far
		jmp	sub_C6AEA
sub_75778	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7577D	proc far
		jmp	sub_C6B26
sub_7577D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75782	proc far
		jmp	sub_C6B6C
sub_75782	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75787	proc far
		jmp	sub_C6B9F
sub_75787	endp
		db 0, 0, 0, 0
stub357		ends
