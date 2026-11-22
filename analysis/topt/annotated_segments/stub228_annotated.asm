stub228		segment	para public 'CODE' use16
		assume cs:stub228
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48420	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 71B70h		; fileoff
		dw 0AC3h		; codesize
		dw 88h		; relsize
		dw 11h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48440	proc far
		jmp	sub_BBA42
sub_48440	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48445	proc far
		jmp	sub_BBA39
sub_48445	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4844A	proc far
		jmp	sub_BBA30
sub_4844A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4844F	proc far
		jmp	sub_BB7D1
sub_4844F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48454	proc far
		jmp	sub_BB93B
sub_48454	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48459	proc far
		jmp	sub_BB81B
sub_48459	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4845E	proc far
		jmp	TextScrollDisplayB_TickHelper_BB940
sub_4845E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48463	proc far
		jmp	sub_BB820
sub_48463	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48468	proc far
		jmp	sub_BB953
sub_48468	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4846D	proc far
		jmp	sub_BB9AB
sub_4846D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48472	proc far
		jmp	sub_BB647
sub_48472	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48477	proc far
		jmp	sub_BAFA0
sub_48477	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4847C	proc far
		jmp	sub_BB9B0
sub_4847C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48481	proc far
		jmp	sub_BB9D6
sub_48481	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48486	proc far
		jmp	sub_BB057
sub_48486	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4848B	proc far
		jmp	sub_BB4CB
sub_4848B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48490	proc far
		jmp	sub_BBA19
sub_48490	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub228		ends
