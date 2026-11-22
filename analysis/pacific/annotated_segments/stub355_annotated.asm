stub355		segment	para public 'CODE' use16
		assume cs:stub355
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75670	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4B440h		; fileoff
		dw 5DCh		; codesize
		dw 26h		; relsize
		dw 11h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75690	proc far
		jmp	ConvRec_ReadName_C5800
sub_75690	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75695	proc far
		jmp	ConvRec_ReadCloseup_C5827
sub_75695	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7569A	proc far
		jmp	ConvRec_ReadMarks_C5960
sub_7569A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7569F	proc far
		jmp	ConvRec_ReadFigure_C59CE
sub_7569F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756A4	proc far
		jmp	sub_C5A41
sub_756A4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756A9	proc far
		jmp	ConvRec_ReadText_C5B07
sub_756A9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756AE	proc far
		jmp	sub_C5BEC
sub_756AE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756B3	proc far
		jmp	ConvRec_ReadNumber_C5BAE
sub_756B3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756B8	proc far
		jmp	ConvRec_FlagNotSet_C5B91
sub_756B8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756BD	proc far
		jmp	sub_C5C2A
sub_756BD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756C2	proc far
		jmp	sub_C5C68
sub_756C2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756C7	proc far
		jmp	sub_C5C91
sub_756C7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756CC	proc far
		jmp	sub_C5CB8
sub_756CC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756D1	proc far
		jmp	sub_C5CE7
sub_756D1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756D6	proc far
		jmp	sub_C5D67
sub_756D6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756DB	proc far
		jmp	sub_C5DA2
sub_756DB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_756E0	proc far
		jmp	HUDSymbol_ReleaseListEntry_C5DAF
sub_756E0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub355		ends
