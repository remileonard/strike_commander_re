stub250		segment	para public 'CODE' use16
		assume cs:stub250
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48910	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 76DE0h		; fileoff
		dw 5A8h		; codesize
		dw 52h		; relsize
		dw 14h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48930	proc far
		jmp	sub_BFEB0
sub_48930	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48935	proc far
		jmp	InfoWidget_CopyFieldB_BFEC2
sub_48935	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4893A	proc far
		jmp	sub_BFEDA
sub_4893A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4893F	proc far
		jmp	sub_BFEEC
sub_4893F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48944	proc far
		jmp	sub_BFF73
sub_48944	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48949	proc far
		jmp	sub_BFF93
sub_48949	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4894E	proc far
		jmp	sub_C001A
sub_4894E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48953	proc far
		jmp	sub_C003A
sub_48953	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48958	proc far
		jmp	sub_C006B
sub_48958	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4895D	proc far
		jmp	sub_C01A5
sub_4895D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48962	proc far
		jmp	sub_C01C5
sub_48962	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48967	proc far
		jmp	sub_C01F6
sub_48967	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4896C	proc far
		jmp	sub_C0215
sub_4896C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48971	proc far
		jmp	InfoWidget_Method_DispatchField2A_C024B
sub_48971	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48976	proc far
		jmp	sub_C0258
sub_48976	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4897B	proc far
		jmp	sub_C0271
sub_4897B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48980	proc far
		jmp	sub_C029A
sub_48980	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48985	proc far
		jmp	sub_C0382
sub_48985	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4898A	proc far
		jmp	sub_C03AC
sub_4898A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4898F	proc far
		jmp	sub_C042E
sub_4898F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub250		ends
