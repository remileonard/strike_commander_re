stub252		segment	para public 'CODE' use16
		assume cs:stub252
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59B10	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2B010h		; fileoff
		dw 1EAh		; codesize
		dw 22h		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B30	proc far
		jmp	DisplaySurface_Helper_892BE
sub_59B30	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B35	proc far
		jmp	DisplaySurface_Construct_89160
sub_59B35	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B3A	proc far
		jmp	DisplaySurface_CloneOrResize_891E5
sub_59B3A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B3F	proc far
		jmp	CachedObject_DestructSubobjects_892A1
sub_59B3F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B44	proc far
		jmp	DisplaySurface_ConstructWithMode_892F0
sub_59B44	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B49	proc far
		jmp	sub_89330
sub_59B49	endp
		db 0, 0
stub252		ends
