stub306		segment	para public 'CODE' use16
		assume cs:stub306
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_743C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 322F0h		; fileoff
		dw 58h		; codesize
		dw 4		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_743E0	proc far
		jmp	sub_AD9D0
sub_743E0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_743E5	proc far
		jmp	Camera_InitAndGetHandleWrapper_AD9F5
sub_743E5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_743EA	proc far
		jmp	WorldObject_LoadAIProfileViaEntity_ADA12
sub_743EA	endp
		db 0
stub306		ends
