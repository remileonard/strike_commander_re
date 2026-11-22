stub325		segment	para public 'CODE' use16
		assume cs:stub325
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74920	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 36AC0h		; fileoff
		dw 863h		; codesize
		dw 62h		; relsize
		dw 9			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74940	proc far
		jmp	sub_B1EC0
sub_74940	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74945	proc far
		jmp	sub_B25F2
sub_74945	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7494A	proc far
		jmp	sub_B1FD8
sub_7494A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7494F	proc far
		jmp	sub_B20B7
sub_7494F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74954	proc far
		jmp	sub_B2145
sub_74954	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74959	proc far
		jmp	sub_B217B
sub_74959	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7495E	proc far
		jmp	PlayerComponent_SubHelperP_B2204
sub_7495E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74963	proc far
		jmp	sub_B2659
sub_74963	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74968	proc far
		jmp	sub_B2228
sub_74968	endp
		db 0, 0, 0
stub325		ends
