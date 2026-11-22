stub194		segment	para public 'CODE' use16
		assume cs:stub194
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47A50	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0D850h		; fileoff
		dw 476Ah		; codesize
		dw 28Ah		; relsize
		dw 12h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A70	proc far
		jmp	sub_60D3A
sub_47A70	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A75	proc far
		jmp	sub_60CFE
sub_47A75	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A7A	proc far
		jmp	sub_60C7B
sub_47A7A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A7F	proc far
		jmp	sub_60AFC
sub_47A7F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A84	proc far
		jmp	sub_5C630
sub_47A84	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A89	proc far
		jmp	sub_5C781
sub_47A89	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A8E	proc far
		jmp	sub_601BE
sub_47A8E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A93	proc far
		jmp	sub_60174
sub_47A93	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A98	proc far
		jmp	sub_5D6B0
sub_47A98	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47A9D	proc far
		jmp	sub_5DE4E
sub_47A9D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AA2	proc far
		jmp	sub_5F324
sub_47AA2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AA7	proc far
		jmp	sub_5CFDC
sub_47AA7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AAC	proc far
		jmp	sub_5F807
sub_47AAC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AB1	proc far
		jmp	sub_5FDE7
sub_47AB1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AB6	proc far
		jmp	sub_5CF26
sub_47AB6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47ABB	proc far
		jmp	sub_5CFC5
sub_47ABB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AC0	proc far
		jmp	sub_5C7CD
sub_47AC0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AC5	proc far
		jmp	sub_60234
sub_47AC5	endp
		db 0, 0, 0, 0, 0, 0
stub194		ends
