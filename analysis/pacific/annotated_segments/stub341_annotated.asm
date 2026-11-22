stub341		segment	para public 'CODE' use16
		assume cs:stub341
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_750E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3F270h		; fileoff
		dw 746h		; codesize
		dw 4Ah		; relsize
		dw 0Bh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75100	proc far
		jmp	sub_BA150
sub_75100	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75105	proc far
		jmp	sub_BA157
sub_75105	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7510A	proc far
		jmp	sub_BA1E7
sub_7510A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7510F	proc far
		jmp	sub_BA1A2
sub_7510F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75114	proc far
		jmp	sub_BA1AC
sub_75114	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75119	proc far
		jmp	sub_BA41A
sub_75119	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7511E	proc far
		jmp	Ctor_CompositeObjectC_RebindPointers_BA80E
sub_7511E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75123	proc far
		jmp	sub_BA44F
sub_75123	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75128	proc far
		jmp	sub_BA55C
sub_75128	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7512D	proc far
		jmp	sub_BA6AF
sub_7512D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75132	proc far
		jmp	sub_BA397
sub_75132	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0
stub341		ends
