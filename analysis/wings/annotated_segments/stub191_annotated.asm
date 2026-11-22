stub191		segment	para public 'CODE' use16
		assume cs:stub191
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58C20	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0CE10h		; fileoff
		dw 0D3Bh		; codesize
		dw 0BEh		; relsize
		dw 0Dh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C40	proc far
		jmp	AudioQueue_ReleaseAndDestruct_6DC16
sub_58C40	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C45	proc far
		jmp	AudioQueue_Helper_6DBF3
sub_58C45	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C4A	proc far
		jmp	sub_6D45E
sub_58C4A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C4F	proc far
		jmp	sub_6D5F7
sub_58C4F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C54	proc far
		jmp	sub_6D760
sub_58C54	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C59	proc far
		jmp	AudioQueue_RegisterTickModule_6CF30
sub_58C59	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C5E	proc far
		jmp	sub_6CF51
sub_58C5E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C63	proc far
		jmp	sub_6CF64
sub_58C63	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C68	proc far
		jmp	AudioQueue_ReleaseAllSlots_6DA12
sub_58C68	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C6D	proc far
		jmp	sub_6DB9F
sub_58C6D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C72	proc far
		jmp	sub_6D8C4
sub_58C72	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C77	proc far
		jmp	sub_6D904
sub_58C77	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58C7C	proc far
		jmp	Music_StopWithFade_6D944
sub_58C7C	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub191		ends
