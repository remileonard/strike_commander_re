stub256		segment	para public 'CODE' use16
		assume cs:stub256
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59C20	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2B590h		; fileoff
		dw 711h		; codesize
		dw 30h		; relsize
		dw 17h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C40	proc far
		jmp	ResourceRecord_WriteField_89690
sub_59C40	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C45	proc far
		jmp	ResourceRecord_WriteFieldGroupA_896C3
sub_59C45	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C4A	proc far
		jmp	ResourceRecord_WriteFieldGroupB_89733
sub_59C4A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C4F	proc far
		jmp	sub_897C9
sub_59C4F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C54	proc far
		jmp	ResourceRecord_WriteFieldGroupD_898E6
sub_59C54	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C59	proc far
		jmp	ResourceRecord_SeekAndRelease_8985A
sub_59C59	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C5E	proc far
		jmp	ResourceRecord_WriteFieldGroupC_89891
sub_59C5E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C63	proc far
		jmp	ResourceRecord_WriteFieldWrapper_8984B
sub_59C63	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C68	proc far
		jmp	sub_89872
sub_59C68	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C6D	proc far
		jmp	ResourceRecord_ReadAndWriteBridge_89941
sub_59C6D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C72	proc far
		jmp	ResourceRecord_ReadAndWriteBridgeB_899CB
sub_59C72	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C77	proc far
		jmp	ResourceRecord_BridgeWrapperA_89A52
sub_59C77	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C7C	proc far
		jmp	sub_89A8C
sub_59C7C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C81	proc far
		jmp	ResourceRecord_BridgeWrapperB_89AA5
sub_59C81	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C86	proc far
		jmp	sub_89AC5
sub_59C86	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C8B	proc far
		jmp	sub_89AE4
sub_59C8B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C90	proc far
		jmp	ResourceRecord_CopyOrTransform_89B48
sub_59C90	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C95	proc far
		jmp	sub_89B83
sub_59C95	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C9A	proc far
		jmp	ResourceRecord_CopyChunksUntilTag_89BF9
sub_59C9A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59C9F	proc far
		jmp	sub_89C6F
sub_59C9F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59CA4	proc far
		jmp	sub_89CB7
sub_59CA4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59CA9	proc far
		jmp	sub_89CE6
sub_59CA9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59CAE	proc far
		jmp	sub_89D40
sub_59CAE	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub256		ends
