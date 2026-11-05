stub312		segment	para public 'CODE' use16
		assume cs:stub312
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74580	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 33DE0h		; fileoff
		dw 2AAh		; codesize
		dw 2Ch		; relsize
		dw 8			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745A0	proc far
		jmp	sub_AF66D
sub_745A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745A5	proc far
		jmp	BombModel_LoadDATAChunk_AF3F0
sub_745A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745AA	proc far
		jmp	PlayerComponentVariantA_ConstructAndInit_AF45F
sub_745AA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745AF	proc far
		jmp	Bomb_InitArmingDelay_AF614
sub_745AF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745B4	proc far
		jmp	PlayerComponent_SubHelperA_AF650
sub_745B4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745B9	proc far
		jmp	sub_AF4FE
sub_745B9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745BE	proc far
		jmp	sub_AF5A1
sub_745BE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745C3	proc far
		jmp	sub_AF5EE
sub_745C3	endp
		db 0, 0, 0, 0, 0, 0, 0, 0
stub312		ends
