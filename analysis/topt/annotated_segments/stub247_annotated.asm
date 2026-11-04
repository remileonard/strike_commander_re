stub247		segment	para public 'CODE' use16
		assume cs:stub247
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48840	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 75E70h		; fileoff
		dw 0B36h		; codesize
		dw 7Ch		; relsize
		dw 0Bh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48860	proc far
		jmp	sub_BFAF1
sub_48860	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48865	proc far
		jmp	sub_BF213
sub_48865	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4886A	proc far
		jmp	sub_BF3D4
sub_4886A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4886F	proc far
		jmp	sub_BF285
sub_4886F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48874	proc far
		jmp	sub_BF4FA
sub_48874	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48879	proc far
		jmp	sub_BF7F8
sub_48879	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4887E	proc far
		jmp	sub_BF88F
sub_4887E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48883	proc far
		jmp	sub_BFA86
sub_48883	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48888	proc far
		jmp	sub_BEFF0
sub_48888	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4888D	proc far
		jmp	GlyphObject_MeasureWrapperB_BF15D
sub_4888D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48892	proc far
		jmp	GlyphObject_ResolveAndMeasureB_BF19E
sub_48892	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0
stub247		ends
