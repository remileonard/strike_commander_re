stub411		segment	para public 'CODE' use16
		assume cs:stub411
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76690	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D6E0h		; fileoff
		dw 711h		; codesize
		dw 30h		; relsize
		dw 17h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766B0	proc far
		jmp	ResourceRecord_WriteField_E5B30
sub_766B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766B5	proc far
		jmp	ResourceRecord_WriteFieldGroupA_E5B63
sub_766B5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766BA	proc far
		jmp	ResourceRecord_WriteFieldGroupB_E5BD3
sub_766BA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766BF	proc far
		jmp	sub_E5C69
sub_766BF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766C4	proc far
		jmp	ResourceRecord_WriteFieldGroupD_E5D86
sub_766C4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766C9	proc far
		jmp	ResourceRecord_SeekAndRelease_E5CFA
sub_766C9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766CE	proc far
		jmp	ResourceRecord_WriteFieldGroupC_E5D31
sub_766CE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766D3	proc far
		jmp	ResourceRecord_WriteFieldWrapper_E5CEB
sub_766D3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766D8	proc far
		jmp	sub_E5D12
sub_766D8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766DD	proc far
		jmp	ResourceRecord_ReadAndWriteBridge_E5DE1
sub_766DD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766E2	proc far
		jmp	ResourceRecord_ReadAndWriteBridgeB_E5E6B
sub_766E2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766E7	proc far
		jmp	ResourceRecord_BridgeWrapperA_E5EF2
sub_766E7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766EC	proc far
		jmp	sub_E5F2C
sub_766EC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766F1	proc far
		jmp	ResourceRecord_BridgeWrapperB_E5F45
sub_766F1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766F6	proc far
		jmp	sub_E5F65
sub_766F6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_766FB	proc far
		jmp	sub_E5F84
sub_766FB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76700	proc far
		jmp	ResourceRecord_CopyOrTransform_E5FE8
sub_76700	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76705	proc far
		jmp	sub_E6023
sub_76705	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7670A	proc far
		jmp	ResourceRecord_CopyChunksUntilTag_E6099
sub_7670A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7670F	proc far
		jmp	sub_E610F
sub_7670F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76714	proc far
		jmp	sub_E6157
sub_76714	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76719	proc far
		jmp	sub_E6186
sub_76719	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7671E	proc far
		jmp	sub_E61E0
sub_7671E	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub411		ends
