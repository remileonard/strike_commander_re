stub315		segment	para public 'CODE' use16
		assume cs:stub315
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_746B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 34E00h		; fileoff
		dw 3AFh		; codesize
		dw 32h		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_746D0	proc far
		jmp	sub_B0360
sub_746D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_746D5	proc far
		jmp	Weapon_LoadWDATWrapper_B03EF
sub_746D5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_746DA	proc far
		jmp	PlayerComponentVariantN_ConstructAndInit_B0412
sub_746DA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_746DF	proc far
		jmp	sub_B049F
sub_746DF	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub315		ends
