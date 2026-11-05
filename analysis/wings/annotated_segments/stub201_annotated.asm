stub201		segment	para public 'CODE' use16
		assume cs:stub201
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58FE0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 11F30h		; fileoff
		dw 64Bh		; codesize
		dw 52h		; relsize
		dw 0Bh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59000	proc far
		jmp	sub_722DD
sub_59000	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59005	proc far
		jmp	Debris_ConstructEmptyWithFormation_722B9
sub_59005	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5900A	proc far
		jmp	sub_71EC3
sub_5900A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5900F	proc far
		jmp	sub_71F0D
sub_5900F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59014	proc far
		jmp	sub_720F2
sub_59014	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59019	proc far
		jmp	sub_71CB0
sub_59019	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5901E	proc far
		jmp	sub_71D7A
sub_5901E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59023	proc far
		jmp	sub_72216
sub_59023	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59028	proc far
		jmp	Debris_ListFindAndDispatch_721C6
sub_59028	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5902D	proc far
		jmp	sub_7225D
sub_5902D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59032	proc far
		jmp	sub_72286
sub_59032	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0
stub201		ends
