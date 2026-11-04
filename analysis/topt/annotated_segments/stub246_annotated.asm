stub246		segment	para public 'CODE' use16
		assume cs:stub246
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48800	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 75A20h		; fileoff
		dw 423h		; codesize
		dw 20h		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48820	proc far
		jmp	sub_BEBC0
sub_48820	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48825	proc far
		jmp	sub_BEBE6
sub_48825	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4882A	proc far
		jmp	sub_BEDD1
sub_4882A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4882F	proc far
		jmp	sub_BEEF4
sub_4882F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48834	proc far
		jmp	sub_BEE29
sub_48834	endp
		db 0, 0, 0, 0, 0, 0, 0
stub246		ends
