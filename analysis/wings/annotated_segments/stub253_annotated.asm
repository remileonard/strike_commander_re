stub253		segment	para public 'CODE' use16
		assume cs:stub253
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59B50	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2B220h		; fileoff
		dw 0EAh		; codesize
		dw 8		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B70	proc far
		jmp	Member_AllocateAndCopy_89370
sub_59B70	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B75	proc far
		jmp	Member_ClearAndFree_89350
sub_59B75	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B7A	proc far
		jmp	Member_CopyRaw_893B2
sub_59B7A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B7F	proc far
		jmp	Member_NullTerminateIfSet_89401
sub_59B7F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B84	proc far
		jmp	sub_89415
sub_59B84	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59B89	proc far
		jmp	sub_8942D
sub_59B89	endp
		db 0, 0
stub253		ends
