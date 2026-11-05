stub373		segment	para public 'CODE' use16
		assume cs:stub373
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75BD0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 56E90h		; fileoff
		dw 131h		; codesize
		dw 8		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75BF0	proc far
		jmp	sub_D0660
sub_75BF0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75BF5	proc far
		jmp	sub_D06E9
sub_75BF5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75BFA	proc far
		jmp	sub_D073D
sub_75BFA	endp
		db 0
stub373		ends
