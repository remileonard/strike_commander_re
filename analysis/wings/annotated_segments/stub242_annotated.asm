stub242		segment	para public 'CODE' use16
		assume cs:stub242
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59940	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2A7F0h		; fileoff
		dw 0FBh		; codesize
		dw 0Eh		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59960	proc far
		jmp	TextRenderer_ReleaseCachedGlyph_889C0
sub_59960	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59965	proc far
		jmp	Memory_AllocatorSlot_Helper_88A52
sub_59965	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5996A	proc far
		jmp	Memory_AllocatorSlotArray_Construct_88A85
sub_5996A	endp
		db 0
stub242		ends
