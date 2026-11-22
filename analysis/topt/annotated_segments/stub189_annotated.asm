stub189		segment	para public 'CODE' use16
		assume cs:stub189
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_478B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2730h		; fileoff
		dw 24DDh		; codesize
		dw 1EEh		; relsize
		dw 19h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478D0	proc far
		jmp	sub_54234
sub_478D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478D5	proc far
		jmp	sub_541DB
sub_478D5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478DA	proc far
		jmp	sub_541B2
sub_478DA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478DF	proc far
		jmp	sub_54176
sub_478DF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478E4	proc far
		jmp	sub_54109
sub_478E4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478E9	proc far
		jmp	sub_5409C
sub_478E9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478EE	proc far
		jmp	sub_5402F
sub_478EE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478F3	proc far
		jmp	sub_53FC2
sub_478F3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478F8	proc far
		jmp	sub_53F55
sub_478F8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478FD	proc far
		jmp	sub_53EB3
sub_478FD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47902	proc far
		jmp	sub_53A02
sub_47902	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47907	proc far
		jmp	Gameflow_SaveGameFile_5357F
sub_47907	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4790C	proc far
		jmp	sub_53D54
sub_4790C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47911	proc far
		jmp	sub_51EC7
sub_47911	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47916	proc far
		jmp	Gameflow_SaveRequester_5341B
sub_47916	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4791B	proc far
		jmp	Gameflow_LoadRequester_53893
sub_4791B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47920	proc far
		jmp	sub_51DB0
sub_47920	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47925	proc far
		jmp	sub_51DD6
sub_47925	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4792A	proc far
		jmp	sub_533F1
sub_4792A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4792F	proc far
		jmp	sub_53406
sub_4792F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47934	proc far
		jmp	sub_52028
sub_47934	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47939	proc far
		jmp	sub_5293B
sub_47939	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4793E	proc far
		jmp	sub_52956
sub_4793E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47943	proc far
		jmp	sub_52973
sub_47943	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47948	proc far
		jmp	sub_527B7
sub_47948	endp
		db 0, 0, 0
stub189		ends
