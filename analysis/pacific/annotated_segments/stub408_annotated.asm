stub408		segment	para public 'CODE' use16
		assume cs:stub408
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_765C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D370h		; fileoff
		dw 0EAh		; codesize
		dw 8		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765E0	proc far
		jmp	Member_AllocateAndCopy_E5810
sub_765E0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765E5	proc far
		jmp	Member_ClearAndFree_E57F0
sub_765E5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765EA	proc far
		jmp	Member_CopyRaw_E5852
sub_765EA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765EF	proc far
		jmp	Member_NullTerminateIfSet_E58A1
sub_765EF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765F4	proc far
		jmp	sub_E58B5
sub_765F4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_765F9	proc far
		jmp	sub_E58CD
sub_765F9	endp
		db 0, 0
stub408		ends
