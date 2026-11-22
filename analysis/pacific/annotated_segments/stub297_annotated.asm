stub297		segment	para public 'CODE' use16
		assume cs:stub297
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_741A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2EDE0h		; fileoff
		dw 0C55h		; codesize
		dw 9Eh		; relsize
		dw 9			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_741C0	proc far
		jmp	sub_AB387
sub_741C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_741C5	proc far
		jmp	sub_AB351
sub_741C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_741CA	proc far
		jmp	sub_AAB8C
sub_741CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_741CF	proc far
		jmp	sub_AAC15
sub_741CF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_741D4	proc far
		jmp	sub_AB1E0
sub_741D4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_741D9	proc far
		jmp	sub_AA750
sub_741D9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_741DE	proc far
		jmp	sub_AA8B7
sub_741DE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_741E3	proc far
		jmp	Debris_ListAllocateAndInsert_AB304
sub_741E3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_741E8	proc far
		jmp	Debris_ListFindAndDispatch_AB2B4
sub_741E8	endp
		db 0, 0, 0
stub297		ends
