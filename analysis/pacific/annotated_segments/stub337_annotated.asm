stub337		segment	para public 'CODE' use16
		assume cs:stub337
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74FE0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3E000h		; fileoff
		dw 7DAh		; codesize
		dw 88h		; relsize
		dw 0Ah			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75000	proc far
		jmp	sub_B978D
sub_75000	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75005	proc far
		jmp	sub_B9758
sub_75005	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7500A	proc far
		jmp	SmokeGen_LoadFromIFF_B9049
sub_7500A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7500F	proc far
		jmp	SmokeGen_SpawnInstance_B8FE0
sub_7500F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75014	proc far
		jmp	TextLabel_Helper_B90E3
sub_75014	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75019	proc far
		jmp	sub_B9108
sub_75019	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7501E	proc far
		jmp	sub_B916C
sub_7501E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75023	proc far
		jmp	TextLabel_AllocateBuffer_B925D
sub_75023	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75028	proc far
		jmp	sub_B92A5
sub_75028	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7502D	proc far
		jmp	SmokeSet_LoadFromIFF_B9441
sub_7502D	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub337		ends
