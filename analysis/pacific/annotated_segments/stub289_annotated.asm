stub289		segment	para public 'CODE' use16
		assume cs:stub289
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73F70	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2C550h		; fileoff
		dw 4BFh		; codesize
		dw 3Ch		; relsize
		dw 7			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73F90	proc far
		jmp	sub_A81CF
sub_73F90	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73F95	proc far
		jmp	sub_A80F0
sub_73F95	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73F9A	proc far
		jmp	sub_A832F
sub_73F9A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73F9F	proc far
		jmp	Terrain_ReleaseTileDescriptorB_A84BD
sub_73F9F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73FA4	proc far
		jmp	Terrain_Helper2_A84FD
sub_73FA4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73FA9	proc far
		jmp	Terrain_Helper3_A8516
sub_73FA9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73FAE	proc far
		jmp	Terrain_Helper4_A855D
sub_73FAE	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub289		ends
