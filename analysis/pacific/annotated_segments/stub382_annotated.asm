stub382		segment	para public 'CODE' use16
		assume cs:stub382
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75EA0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 5E020h		; fileoff
		dw 2378h		; codesize
		dw 0BCh		; relsize
		dw 28h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75EC0	proc far
		jmp	ResourceFile_ReleaseAndStyle_D9535
sub_75EC0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75EC5	proc far
		jmp	Memory_AllocatorSlotArray_Construct_D7220
sub_75EC5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75ECA	proc far
		jmp	sub_D7252
sub_75ECA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75ECF	proc far
		jmp	sub_D80CC
sub_75ECF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75ED4	proc far
		jmp	sub_D912B
sub_75ED4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75ED9	proc far
		jmp	sub_D9141
sub_75ED9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75EDE	proc far
		jmp	sub_D9509
sub_75EDE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75EE3	proc far
		jmp	sub_D951F
sub_75EE3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75EE8	proc far
		jmp	sub_D90C1
sub_75EE8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75EED	proc far
		jmp	sub_D9107
sub_75EED	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75EF2	proc far
		jmp	sub_D947D
sub_75EF2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75EF7	proc far
		jmp	sub_D94E5
sub_75EF7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75EFC	proc far
		jmp	sub_D909F
sub_75EFC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F01	proc far
		jmp	sub_D90E3
sub_75F01	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F06	proc far
		jmp	sub_D949F
sub_75F06	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F0B	proc far
		jmp	sub_D94C1
sub_75F0B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F10	proc far
		jmp	sub_D907D
sub_75F10	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F15	proc far
		jmp	sub_D92CD
sub_75F15	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F1A	proc far
		jmp	sub_D9157
sub_75F1A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F1F	proc far
		jmp	sub_D92F1
sub_75F1F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F24	proc far
		jmp	sub_D9179
sub_75F24	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F29	proc far
		jmp	sub_D9315
sub_75F29	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F2E	proc far
		jmp	sub_D919B
sub_75F2E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F33	proc far
		jmp	sub_D9339
sub_75F33	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F38	proc far
		jmp	sub_D91BD
sub_75F38	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F3D	proc far
		jmp	sub_D935D
sub_75F3D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F42	proc far
		jmp	sub_D91DF
sub_75F42	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F47	proc far
		jmp	sub_D9381
sub_75F47	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F4C	proc far
		jmp	sub_D9201
sub_75F4C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F51	proc far
		jmp	sub_D93A5
sub_75F51	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F56	proc far
		jmp	sub_D9223
sub_75F56	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F5B	proc far
		jmp	sub_D93C9
sub_75F5B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F60	proc far
		jmp	sub_D9245
sub_75F60	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F65	proc far
		jmp	sub_D93ED
sub_75F65	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F6A	proc far
		jmp	sub_D9267
sub_75F6A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F6F	proc far
		jmp	sub_D9411
sub_75F6F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F74	proc far
		jmp	sub_D9289
sub_75F74	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F79	proc far
		jmp	sub_D9435
sub_75F79	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F7E	proc far
		jmp	sub_D92AB
sub_75F7E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75F83	proc far
		jmp	sub_D9459
sub_75F83	endp
		db 0, 0, 0, 0, 0, 0, 0, 0
stub382		ends
