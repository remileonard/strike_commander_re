stub198		segment	para public 'CODE' use16
		assume cs:stub198
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58ED0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 10DA0h		; fileoff
		dw 0D35h		; codesize
		dw 0B2h		; relsize
		dw 11h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EF0	proc far
		jmp	sub_71924
sub_58EF0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EF5	proc far
		jmp	sub_70C10
sub_58EF5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EFA	proc far
		jmp	sub_70C78
sub_58EFA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58EFF	proc far
		jmp	TextureLoader_LoadMixedFields_71236
sub_58EFF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F04	proc far
		jmp	sub_715D4
sub_58F04	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F09	proc far
		jmp	sub_71753
sub_58F09	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F0E	proc far
		jmp	sub_71440
sub_58F0E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F13	proc far
		jmp	Palette_LoadFadeFile_714C0
sub_58F13	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F18	proc far
		jmp	sub_7180F
sub_58F18	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F1D	proc far
		jmp	sub_7187B
sub_58F1D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F22	proc far
		jmp	sub_71362
sub_58F22	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F27	proc far
		jmp	sub_70CDC
sub_58F27	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F2C	proc far
		jmp	sub_70E0C
sub_58F2C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F31	proc far
		jmp	sub_70CFB
sub_58F31	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F36	proc far
		jmp	sub_70F4C
sub_58F36	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F3B	proc far
		jmp	TextureLoader_ReleaseMultipleB_710D8
sub_58F3B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58F40	proc far
		jmp	sub_71916
sub_58F40	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub198		ends
