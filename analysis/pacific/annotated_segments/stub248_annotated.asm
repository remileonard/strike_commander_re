stub248		segment	para public 'CODE' use16
		assume cs:stub248
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_732E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 11660h		; fileoff
		dw 69Ah		; codesize
		dw 6Ah		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73300	proc far
		jmp	sub_8ECFD
sub_73300	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73305	proc far
		jmp	GlyphObject_AllocateExtended_8E7D5
sub_73305	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7330A	proc far
		jmp	GlyphObject_ReleaseStylesAndBuffer_8E971
sub_7330A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7330F	proc far
		jmp	Font_OpenDefinitionFile_8E836
sub_7330F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73314	proc far
		jmp	sub_8EA62
sub_73314	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73319	proc far
		jmp	GlyphObject_LoadMetricsFromIFFB_8E690
sub_73319	endp
		db 0, 0
stub248		ends
