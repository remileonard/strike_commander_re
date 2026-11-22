stub323		segment	para public 'CODE' use16
		assume cs:stub323
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_748A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 366C0h		; fileoff
		dw 0E9h		; codesize
		dw 10h		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_748C0	proc far
		jmp	sub_B1BCC
sub_748C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_748C5	proc far
		jmp	IFF_LoadAngleParam_Wrapper_B1B69
sub_748C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_748CA	proc far
		jmp	sub_B1B10
sub_748CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_748CF	proc far
		jmp	sub_B1B7D
sub_748CF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_748D4	proc far
		jmp	sub_B1BAB
sub_748D4	endp
		db 0, 0, 0, 0, 0, 0, 0
stub323		ends
