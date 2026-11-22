stub254		segment	para public 'CODE' use16
		assume cs:stub254
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_735E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 19440h		; fileoff
		dw 1043h		; codesize
		dw 0D4h		; relsize
		dw 19h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73600	proc far
		jmp	sub_9703B
sub_73600	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73605	proc far
		jmp	sub_96FC7
sub_73605	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7360A	proc far
		jmp	sub_96F98
sub_7360A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7360F	proc far
		jmp	sub_96F90
sub_7360F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73614	proc far
		jmp	sub_96F61
sub_73614	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73619	proc far
		jmp	sub_96F32
sub_73619	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7361E	proc far
		jmp	sub_96F03
sub_7361E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73623	proc far
		jmp	sub_96ED4
sub_73623	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73628	proc far
		jmp	sub_96EA5
sub_73628	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7362D	proc far
		jmp	sub_96E76
sub_7362D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73632	proc far
		jmp	sub_96E47
sub_73632	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73637	proc far
		jmp	sub_96E18
sub_73637	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7363C	proc far
		jmp	sub_96DE9
sub_7363C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73641	proc far
		jmp	sub_96DBA
sub_73641	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73646	proc far
		jmp	sub_96D8B
sub_73646	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7364B	proc far
		jmp	sub_96D5C
sub_7364B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73650	proc far
		jmp	sub_96D2D
sub_73650	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73655	proc far
		jmp	sub_96CFE
sub_73655	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7365A	proc far
		jmp	sub_96CE0
sub_7365A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7365F	proc far
		jmp	sub_96CBF
sub_7365F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73664	proc far
		jmp	Cockpit_LoadInstruments_96000
sub_73664	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73669	proc far
		jmp	TextScroll_ListHelperB_96C57
sub_73669	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7366E	proc far
		jmp	UI_NotifyListRepaint
sub_7366E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73673	proc far
		jmp	TextScroll_AllocateAndInsert_96BC1
sub_73673	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73678	proc far
		jmp	sub_96C0A
sub_73678	endp
		db 0, 0, 0
stub254		ends
