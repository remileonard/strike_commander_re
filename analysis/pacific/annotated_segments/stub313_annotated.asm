stub313		segment	para public 'CODE' use16
		assume cs:stub313
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_745D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 340C0h		; fileoff
		dw 3A1h		; codesize
		dw 38h		; relsize
		dw 0Fh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745F0	proc far
		jmp	sub_AF6A0
sub_745F0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745F5	proc far
		jmp	PlayerComponentVariantJ_ConstructAndInit_AF706
sub_745F5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745FA	proc far
		jmp	Missile_InitFlightTimer_AF7A5
sub_745FA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_745FF	proc far
		jmp	PlayerComponent_SubHelperP_AF7D8
sub_745FF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74604	proc far
		jmp	sub_AF8C4
sub_74604	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74609	proc far
		jmp	sub_AF9C3
sub_74609	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7460E	proc far
		jmp	sub_AF9D1
sub_7460E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74613	proc far
		jmp	sub_AF7FC
sub_74613	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74618	proc far
		jmp	sub_AF810
sub_74618	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7461D	proc far
		jmp	DynMissile_LoadMISSChunk_AF833
sub_7461D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74622	proc far
		jmp	PlayerComponent_SubHelperW_AFA0A
sub_74622	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74627	proc far
		jmp	PlayerComponent_SubHelperV_AF9E7
sub_74627	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7462C	proc far
		jmp	PlayerComponentVariantK_ConstructAndInit_AF8DD
sub_7462C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74631	proc far
		jmp	PlayerComponentVariantL_ConstructAndInit_AF91B
sub_74631	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74636	proc far
		jmp	PlayerComponentVariantM_ConstructAndInit_AF967
sub_74636	endp
		db 0, 0, 0, 0, 0
stub313		ends
