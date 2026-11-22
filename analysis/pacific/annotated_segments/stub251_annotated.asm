stub251		segment	para public 'CODE' use16
		assume cs:stub251
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73470	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 16BA0h		; fileoff
		dw 3B9h		; codesize
		dw 14h		; relsize
		dw 7			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73490	proc far
		jmp	sub_93AB2
sub_73490	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73495	proc far
		jmp	sub_93B69
sub_73495	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7349A	proc far
		jmp	sub_93970
sub_7349A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7349F	proc far
		jmp	Cockpit_PanElevationFrame_93BA0
sub_7349F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_734A4	proc far
		jmp	Camera_PanTransitionWrapper_93C72
sub_734A4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_734A9	proc far
		jmp	HUDSymbol_Helper13_93CD8
sub_734A9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_734AE	proc far
		jmp	HUDSymbol_Helper12_93B05
sub_734AE	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub251		ends
