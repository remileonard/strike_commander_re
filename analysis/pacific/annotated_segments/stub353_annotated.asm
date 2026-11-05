stub353		segment	para public 'CODE' use16
		assume cs:stub353
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75600	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 4AC50h		; fileoff
		dw 636h		; codesize
		dw 50h		; relsize
		dw 6			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75620	proc far
		jmp	sub_C5070
sub_75620	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75625	proc far
		jmp	sub_C5150
sub_75625	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7562A	proc far
		jmp	sub_C5403
sub_7562A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7562F	proc far
		jmp	sub_C54EE
sub_7562F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75634	proc far
		jmp	sub_C55A4
sub_75634	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75639	proc far
		jmp	sub_C55B1
sub_75639	endp
		db 0, 0
stub353		ends
