stub237		segment	para public 'CODE' use16
		assume cs:stub237
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_72FC0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 80B0h		; fileoff
		dw 22C9h		; codesize
		dw 0CAh		; relsize
		dw 0Fh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FE0	proc far
		jmp	sub_85AAC
sub_72FE0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FE5	proc far
		jmp	sub_85809
sub_72FE5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FEA	proc far
		jmp	sub_86080
sub_72FEA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FEF	proc far
		jmp	sub_862E7
sub_72FEF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FF4	proc far
		jmp	sub_868EC
sub_72FF4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FF9	proc far
		jmp	sub_86B4A
sub_72FF9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FFE	proc far
		jmp	sub_8597B
sub_72FFE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73003	proc far
		jmp	sub_854D0
sub_73003	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73008	proc far
		jmp	sub_870EA
sub_73008	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7300D	proc far
		jmp	sub_87453
sub_7300D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73012	proc far
		jmp	Takeoff_Phase2_GearFlapsUp_87584
sub_73012	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73017	proc far
		jmp	sub_875B0
sub_73017	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7301C	proc far
		jmp	sub_87671
sub_7301C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73021	proc far
		jmp	sub_87079
sub_73021	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73026	proc far
		jmp	sub_86D39
sub_73026	endp
		db 0, 0, 0, 0, 0
stub237		ends
