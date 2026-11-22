stub204		segment	para public 'CODE' use16
		assume cs:stub204
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_590A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 12A80h		; fileoff
		dw 0BE8h		; codesize
		dw 8Eh		; relsize
		dw 16h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590C0	proc far
		jmp	sub_732F5
sub_590C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590C5	proc far
		jmp	sub_732B5
sub_590C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590CA	proc far
		jmp	sub_72760
sub_590CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590CF	proc far
		jmp	sub_72BFC
sub_590CF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590D4	proc far
		jmp	sub_729F5
sub_590D4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590D9	proc far
		jmp	sub_72A61
sub_590D9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590DE	proc far
		jmp	TextureRecord_LoadFromPakOrFile_72B65
sub_590DE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590E3	proc far
		jmp	sub_72AC9
sub_590E3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590E8	proc far
		jmp	sub_72B18
sub_590E8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590ED	proc far
		jmp	sub_728E3
sub_590ED	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590F2	proc far
		jmp	TextCycler_ReleaseResource_72D59
sub_590F2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590F7	proc far
		jmp	sub_72D87
sub_590F7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_590FC	proc far
		jmp	sub_72E29
sub_590FC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59101	proc far
		jmp	sub_72E83
sub_59101	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59106	proc far
		jmp	sub_72ED4
sub_59106	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5910B	proc far
		jmp	sub_72F96
sub_5910B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59110	proc far
		jmp	sub_73041
sub_59110	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59115	proc far
		jmp	TextureTable_Allocate_730A4
sub_59115	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5911A	proc far
		jmp	sub_73140
sub_5911A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5911F	proc far
		jmp	TextureTable_LoadAnimated_731ED
sub_5911F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59124	proc far
		jmp	sub_7322F
sub_59124	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59129	proc far
		jmp	TextCycler_ReleaseResource_73287
sub_59129	endp
		db 0, 0
stub204		ends
