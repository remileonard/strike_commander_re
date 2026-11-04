stub220		segment	para public 'CODE' use16
		assume cs:stub220
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48150	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6F1F0h		; fileoff
		dw 8BDh		; codesize
		dw 36h		; relsize
		dw 15h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48170	proc far
		jmp	sub_B9088
sub_48170	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48175	proc far
		jmp	sub_B9080
sub_48175	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4817A	proc far
		jmp	MissionText_ApplyDualStyle_B8800
sub_4817A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4817F	proc far
		jmp	sub_B888C
sub_4817F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48184	proc far
		jmp	sub_B88B2
sub_48184	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48189	proc far
		jmp	sub_B88D8
sub_48189	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4818E	proc far
		jmp	sub_B8926
sub_4818E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48193	proc far
		jmp	sub_B8D4E
sub_48193	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48198	proc far
		jmp	MissionText_Helper4_B8DC9
sub_48198	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4819D	proc far
		jmp	sub_B8E4F
sub_4819D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481A2	proc far
		jmp	sub_B8E07
sub_481A2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481A7	proc far
		jmp	MissionText_Helper5_B8DE2
sub_481A7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481AC	proc far
		jmp	sub_B897F
sub_481AC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481B1	proc far
		jmp	sub_B89DF
sub_481B1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481B6	proc far
		jmp	sub_B8A25
sub_481B6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481BB	proc far
		jmp	sub_B8AE3
sub_481BB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481C0	proc far
		jmp	sub_B8AB4
sub_481C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481C5	proc far
		jmp	sub_B8CA5
sub_481C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481CA	proc far
		jmp	sub_B8D30
sub_481CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481CF	proc far
		jmp	sub_B8C35
sub_481CF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_481D4	proc far
		jmp	sub_B8C57
sub_481D4	endp
		db 0, 0, 0, 0, 0, 0, 0
stub220		ends
