stub368		segment	para public 'CODE' use16
		assume cs:stub368
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75A00	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 540B0h		; fileoff
		dw 892h		; codesize
		dw 78h		; relsize
		dw 11h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A20	proc far
		jmp	sub_CDFCC
sub_75A20	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A25	proc far
		jmp	sub_CE2A0
sub_75A25	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A2A	proc far
		jmp	sub_CE047
sub_75A2A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A2F	proc far
		jmp	TalkingHead_SetBaseFrame_CE08B
sub_75A2F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A34	proc far
		jmp	sub_CE09F
sub_75A34	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A39	proc far
		jmp	sub_CE0B5
sub_75A39	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A3E	proc far
		jmp	sub_CE113
sub_75A3E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A43	proc far
		jmp	sub_CE121
sub_75A43	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A48	proc far
		jmp	sub_CE12F
sub_75A48	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A4D	proc far
		jmp	sub_CDF74
sub_75A4D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A52	proc far
		jmp	sub_CDAB6
sub_75A52	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A57	proc far
		jmp	sub_CDAD2
sub_75A57	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A5C	proc far
		jmp	sub_CDB6E
sub_75A5C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A61	proc far
		jmp	sub_CDBBB
sub_75A61	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A66	proc far
		jmp	sub_CDBB3
sub_75A66	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A6B	proc far
		jmp	sub_CDA70
sub_75A6B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75A70	proc far
		jmp	sub_CDBE5
sub_75A70	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub368		ends
