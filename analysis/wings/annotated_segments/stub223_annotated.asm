stub223		segment	para public 'CODE' use16
		assume cs:stub223
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_594F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 18690h		; fileoff
		dw 0A64h		; codesize
		dw 80h		; relsize
		dw 0Bh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59510	proc far
		jmp	sub_78957
sub_59510	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59515	proc far
		jmp	GlyphObject_AllocateExtended_78150
sub_59515	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5951A	proc far
		jmp	GlyphObject_ReleaseStylesAndBuffer_782EC
sub_5951A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5951F	proc far
		jmp	Font_OpenDefinitionFile_781B1
sub_5951F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59524	proc far
		jmp	sub_783DD
sub_59524	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59529	proc far
		jmp	GlyphObject_MeasureAndAllocateB_78677
sub_59529	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5952E	proc far
		jmp	sub_78707
sub_5952E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59533	proc far
		jmp	sub_788E6
sub_59533	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59538	proc far
		jmp	sub_77F20
sub_59538	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5953D	proc far
		jmp	sub_78090
sub_5953D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59542	proc far
		jmp	sub_780D1
sub_59542	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0
stub223		ends
