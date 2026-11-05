stub402		segment	para public 'CODE' use16
		assume cs:stub402
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_764A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D000h		; fileoff
		dw 87h		; codesize
		dw 4		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_764C0	proc far
		jmp	sub_E54C0
sub_764C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_764C5	proc far
		jmp	sub_E54E5
sub_764C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_764CA	proc far
		jmp	Primitive_SetRectColorAndDraw_E5501
sub_764CA	endp
		db 0
stub402		ends
