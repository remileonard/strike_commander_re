stub283		segment	para public 'CODE' use16
		assume cs:stub283
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73E10	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2A8B0h		; fileoff
		dw 0B29h		; codesize
		dw 0A2h		; relsize
		dw 10h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E30	proc far
		jmp	sub_A7068
sub_73E30	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E35	proc far
		jmp	sub_A6560
sub_73E35	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E3A	proc far
		jmp	sub_A65C8
sub_73E3A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E3F	proc far
		jmp	TextureLoader_LoadMixedFields_A6A25
sub_73E3F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E44	proc far
		jmp	TextureLoader_LoadWithDwordFields_A6DAE
sub_73E44	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E49	proc far
		jmp	TextureLoader_LoadWithDwordFieldsB_A6EE7
sub_73E49	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E4E	proc far
		jmp	TextureLoader_FormatAndLoad_A6C20
sub_73E4E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E53	proc far
		jmp	Palette_LoadFadeFile_A6C9A
sub_73E53	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E58	proc far
		jmp	TextureLoader_LoadWithDwordFieldsC_A6F80
sub_73E58	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E5D	proc far
		jmp	Palette_LoadFadeTables_A6FE2
sub_73E5D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E62	proc far
		jmp	TextureLoader_LoadMixedFieldsB_A6B51
sub_73E62	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E67	proc far
		jmp	sub_A662C
sub_73E67	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E6C	proc far
		jmp	TextureLoader_SelectMipLevel_A671A
sub_73E6C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E71	proc far
		jmp	TextureLoader_OpenAndDecode_A6634
sub_73E71	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E76	proc far
		jmp	TextureLoader_ReleaseMultiple_A677B
sub_73E76	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73E7B	proc far
		jmp	TextureLoader_ReleaseMultipleB_A68C7
sub_73E7B	endp
stub283		ends
