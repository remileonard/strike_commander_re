stub409		segment	para public 'CODE' use16
		assume cs:stub409
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76600	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D470h		; fileoff
		dw 1C9h		; codesize
		dw 0Ch		; relsize
		dw 7			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76620	proc far
		jmp	Video_PrintString_E58E0
sub_76620	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76625	proc far
		jmp	sub_E5927
sub_76625	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7662A	proc far
		jmp	sub_E5959
sub_7662A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7662F	proc far
		jmp	sub_E598D
sub_7662F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76634	proc far
		jmp	sub_E59C1
sub_76634	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76639	proc far
		jmp	sub_E5A3E
sub_76639	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7663E	proc far
		jmp	sub_E5A66
sub_7663E	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub409		ends
