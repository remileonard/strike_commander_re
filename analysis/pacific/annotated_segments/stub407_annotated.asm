stub407		segment	para public 'CODE' use16
		assume cs:stub407
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76580	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D160h		; fileoff
		dw 1EAh		; codesize
		dw 22h		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765A0	proc far
		jmp	DisplaySurface_Helper_E575E
sub_765A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765A5	proc far
		jmp	DisplaySurface_Construct_E5600
sub_765A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765AA	proc far
		jmp	DisplaySurface_CloneOrResize_E5685
sub_765AA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765AF	proc far
		jmp	CachedObject_DestructSubobjects_E5741
sub_765AF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765B4	proc far
		jmp	DisplaySurface_ConstructWithMode_E5790
sub_765B4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765B9	proc far
		jmp	sub_E57D0
sub_765B9	endp
		db 0, 0
stub407		ends
