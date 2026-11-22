stub239		segment	para public 'CODE' use16
		assume cs:stub239
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59820	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 29B20h		; fileoff
		dw 2BDh		; codesize
		dw 26h		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59840	proc far
		jmp	sub_87DD1
sub_59840	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59845	proc far
		jmp	AudioQueue_Helper2_87D90
sub_59845	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5984A	proc far
		jmp	AudioQueue_ReleaseAndCoalesce_87FED
sub_5984A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5984F	proc far
		jmp	Speech_StopPlayback_87DB3
sub_5984F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59854	proc far
		jmp	AudioQueue_LoadFromMultipleReaders_87F17
sub_59854	endp
		db 0, 0, 0, 0, 0, 0, 0
stub239		ends
