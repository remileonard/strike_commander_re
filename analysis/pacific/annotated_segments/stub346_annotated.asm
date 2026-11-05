stub346		segment	para public 'CODE' use16
		assume cs:stub346
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_753E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 45460h		; fileoff
		dw 0DB5h		; codesize
		dw 0B0h		; relsize
		dw 0Bh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75400	proc far
		jmp	sub_C0316
sub_75400	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75405	proc far
		jmp	sub_C04BE
sub_75405	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7540A	proc far
		jmp	sub_C0630
sub_7540A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7540F	proc far
		jmp	AudioQueue_RegisterTickModule_BFE20
sub_7540F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75414	proc far
		jmp	Music_StopAndResetCombat_BFE41
sub_75414	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75419	proc far
		jmp	sub_BFE5E
sub_75419	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7541E	proc far
		jmp	sub_C0948
sub_7541E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75423	proc far
		jmp	sub_C0BA7
sub_75423	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75428	proc far
		jmp	sub_C07FA
sub_75428	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7542D	proc far
		jmp	sub_C083A
sub_7542D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75432	proc far
		jmp	Music_StopWithFade_C087A
sub_75432	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0
stub346		ends
