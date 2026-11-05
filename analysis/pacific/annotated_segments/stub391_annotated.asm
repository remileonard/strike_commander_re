stub391		segment	para public 'CODE' use16
		assume cs:stub391
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76140	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 64D00h		; fileoff
		dw 1C18h		; codesize
		dw 1B2h		; relsize
		dw 26h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76160	proc far
		jmp	sub_DF5BD
sub_76160	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76165	proc far
		jmp	sub_DF593
sub_76165	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7616A	proc far
		jmp	sub_DF586
sub_7616A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7616F	proc far
		jmp	sub_DF579
sub_7616F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76174	proc far
		jmp	sub_DF530
sub_76174	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76179	proc far
		jmp	sub_DF4F9
sub_76179	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7617E	proc far
		jmp	sub_DF4AF
sub_7617E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76183	proc far
		jmp	sub_DF48C
sub_76183	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76188	proc far
		jmp	sub_DF45B
sub_76188	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7618D	proc far
		jmp	sub_DF434
sub_7618D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76192	proc far
		jmp	sub_DF404
sub_76192	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76197	proc far
		jmp	sub_DF3DD
sub_76197	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7619C	proc far
		jmp	sub_DF394
sub_7619C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761A1	proc far
		jmp	sub_DF35B
sub_761A1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761A6	proc far
		jmp	sub_DF310
sub_761A6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761AB	proc far
		jmp	sub_DF2EA
sub_761AB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761B0	proc far
		jmp	sub_DF2C4
sub_761B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761B5	proc far
		jmp	sub_DF29F
sub_761B5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761BA	proc far
		jmp	sub_DF27A
sub_761BA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761BF	proc far
		jmp	sub_DF22A
sub_761BF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761C4	proc far
		jmp	sub_DF1EE
sub_761C4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761C9	proc far
		jmp	sub_DF1C2
sub_761C9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761CE	proc far
		jmp	sub_DF186
sub_761CE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761D3	proc far
		jmp	sub_DF154
sub_761D3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761D8	proc far
		jmp	sub_DF111
sub_761D8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761DD	proc far
		jmp	sub_DF0DA
sub_761DD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761E2	proc far
		jmp	LinkedList_Helper_DF0AF
sub_761E2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761E7	proc far
		jmp	LinkedList_Helper_DF083
sub_761E7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761EC	proc far
		jmp	sub_DF056
sub_761EC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761F1	proc far
		jmp	sub_DF02B
sub_761F1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761F6	proc far
		jmp	sub_DEE62
sub_761F6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_761FB	proc far
		jmp	sub_DEF72
sub_761FB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76200	proc far
		jmp	sub_DEEAD
sub_76200	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76205	proc far
		jmp	sub_DDB18
sub_76205	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7620A	proc far
		jmp	sub_DE0BE
sub_7620A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7620F	proc far
		jmp	sub_DDC2D
sub_7620F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76214	proc far
		jmp	sub_DD9D0
sub_76214	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76219	proc far
		jmp	sub_DE11F
sub_76219	endp
		db 0, 0
stub391		ends
