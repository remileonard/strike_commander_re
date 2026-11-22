stub219		segment	para public 'CODE' use16
		assume cs:stub219
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48110	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6E860h		; fileoff
		dw 952h		; codesize
		dw 38h		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48130	proc far
		jmp	sub_B87ED
sub_48130	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48135	proc far
		jmp	sub_B87C0
sub_48135	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4813A	proc far
		jmp	sub_B8797
sub_4813A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4813F	proc far
		jmp	sub_B7EA0
sub_4813F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48144	proc far
		jmp	sub_B7EEA
sub_48144	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48149	proc far
		jmp	sub_B83B6
sub_48149	endp
		db 0, 0
stub219		ends
