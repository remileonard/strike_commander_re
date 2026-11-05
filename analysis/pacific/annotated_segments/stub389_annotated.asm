stub389		segment	para public 'CODE' use16
		assume cs:stub389
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_760B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 62070h		; fileoff
		dw 287Fh		; codesize
		dw 262h		; relsize
		dw 9			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760D0	proc far
		jmp	sub_DB462
sub_760D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760D5	proc far
		jmp	sub_DAFB0
sub_760D5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760DA	proc far
		jmp	sub_DB001
sub_760DA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760DF	proc far
		jmp	sub_DC99A
sub_760DF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760E4	proc far
		jmp	sub_DB07A
sub_760E4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760E9	proc far
		jmp	sub_DB120
sub_760E9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760EE	proc far
		jmp	sub_DC45C
sub_760EE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760F3	proc far
		jmp	sub_DC62D
sub_760F3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_760F8	proc far
		jmp	sub_DC811
sub_760F8	endp
		db 0, 0, 0
stub389		ends
