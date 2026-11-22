stub200		segment	para public 'CODE' use16
		assume cs:stub200
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58FA0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 11E50h		; fileoff
		dw 0D2h		; codesize
		dw 0Eh		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58FC0	proc far
		jmp	sub_71C98
sub_58FC0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58FC5	proc far
		jmp	sub_71C90
sub_58FC5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58FCA	proc far
		jmp	Debris_FindAndUnregister_71BD0
sub_58FCA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58FCF	proc far
		jmp	Debris_ContainerOpWrapperB_71C5D
sub_58FCF	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub200		ends
