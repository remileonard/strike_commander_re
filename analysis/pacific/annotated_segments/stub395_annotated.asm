stub395		segment	para public 'CODE' use16
		assume cs:stub395
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76300	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 68DF0h		; fileoff
		dw 23B2h		; codesize
		dw 21Ch		; relsize
		dw 0Fh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76320	proc far
		jmp	sub_E3517
sub_76320	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76325	proc far
		jmp	sub_E16A0
sub_76325	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7632A	proc far
		jmp	sub_E16DE
sub_7632A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7632F	proc far
		jmp	sub_E1833
sub_7632F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76334	proc far
		jmp	sub_E191D
sub_76334	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76339	proc far
		jmp	sub_E1998
sub_76339	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7633E	proc far
		jmp	sub_E1C1D
sub_7633E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76343	proc far
		jmp	sub_E1DC9
sub_76343	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76348	proc far
		jmp	sub_E1FFD
sub_76348	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7634D	proc far
		jmp	sub_E2229
sub_7634D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76352	proc far
		jmp	sub_E2825
sub_76352	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76357	proc far
		jmp	sub_E2AE4
sub_76357	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7635C	proc far
		jmp	sub_E2DBF
sub_7635C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76361	proc far
		jmp	sub_E2F72
sub_76361	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76366	proc far
		jmp	sub_E3243
sub_76366	endp
		db 0, 0, 0, 0, 0
stub395		ends
