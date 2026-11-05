stub356		segment	para public 'CODE' use16
		assume cs:stub356
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_756F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4BA50h		; fileoff
		dw 2EDh		; codesize
		dw 3Ch		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75710	proc far
		jmp	sub_C5DE0
sub_75710	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75715	proc far
		jmp	sub_C5E51
sub_75715	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7571A	proc far
		jmp	sub_C604E
sub_7571A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7571F	proc far
		jmp	sub_C6080
sub_7571F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75724	proc far
		jmp	Palette_Destruct_C609E
sub_75724	endp
		db 0, 0, 0, 0, 0, 0, 0
stub356		ends
