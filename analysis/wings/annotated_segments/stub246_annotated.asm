stub246		segment	para public 'CODE' use16
		assume cs:stub246
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59A00	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2AD20h		; fileoff
		dw 87h		; codesize
		dw 4		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59A20	proc far
		jmp	sub_88EB0
sub_59A20	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59A25	proc far
		jmp	sub_88ED5
sub_59A25	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59A2A	proc far
		jmp	Primitive_SetRectColorAndDraw_88EF1
sub_59A2A	endp
		db 0
stub246		ends
