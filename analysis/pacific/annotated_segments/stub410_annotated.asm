stub410		segment	para public 'CODE' use16
		assume cs:stub410
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76650	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D650h		; fileoff
		dw 80h		; codesize
		dw 4		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76670	proc far
		jmp	DisplayContext_CommitFrame_E5AB8
sub_76670	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76675	proc far
		jmp	DisplayContext_CommitFrameWithTag_E5B01
sub_76675	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7667A	proc far
		jmp	sub_E5B17
sub_7667A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7667F	proc far
		jmp	sub_E5AB0
sub_7667F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub410		ends
