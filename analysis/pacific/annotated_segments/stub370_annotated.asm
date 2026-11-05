stub370		segment	para public 'CODE' use16
		assume cs:stub370
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75AC0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 54DF0h		; fileoff
		dw 1AF4h		; codesize
		dw 110h		; relsize
		dw 11h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AE0	proc far
		jmp	sub_D016E
sub_75AE0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AE5	proc far
		jmp	sub_D00F8
sub_75AE5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AEA	proc far
		jmp	GaugeWidget_ReleaseAllResources_D0084
sub_75AEA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AEF	proc far
		jmp	ResourceFile_ReleaseAndStyle_D0021
sub_75AEF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AF4	proc far
		jmp	ResourceFile_ReleaseAndStyle_CFFBE
sub_75AF4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AF9	proc far
		jmp	ResourceFile_ReleaseAndStyle_CFF5B
sub_75AF9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75AFE	proc far
		jmp	ResourceFile_ReleaseAndStyle_CFEF8
sub_75AFE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B03	proc far
		jmp	ResourceFile_ReleaseAndStyle_CFE95
sub_75B03	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B08	proc far
		jmp	sub_CE6F0
sub_75B08	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B0D	proc far
		jmp	sub_CE786
sub_75B0D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B12	proc far
		jmp	sub_CE943
sub_75B12	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B17	proc far
		jmp	sub_CF4DC
sub_75B17	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B1C	proc far
		jmp	sub_CFC39
sub_75B1C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B21	proc far
		jmp	sub_CF7E7
sub_75B21	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B26	proc far
		jmp	sub_CE892
sub_75B26	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B2B	proc far
		jmp	sub_CE92D
sub_75B2B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75B30	proc far
		jmp	sub_CFD84
sub_75B30	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub370		ends
