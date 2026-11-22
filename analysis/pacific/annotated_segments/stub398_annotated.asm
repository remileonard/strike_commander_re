stub398		segment	para public 'CODE' use16
		assume cs:stub398
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_763E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6CAD0h		; fileoff
		dw 0FBh		; codesize
		dw 0Eh		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76400	proc far
		jmp	TextRenderer_ReleaseCachedGlyph_E4FD0
sub_76400	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76405	proc far
		jmp	Memory_AllocatorSlot_Helper_E5062
sub_76405	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7640A	proc far
		jmp	Memory_AllocatorSlotArray_Construct_E5095
sub_7640A	endp
		db 0
stub398		ends
