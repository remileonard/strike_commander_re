stub224		segment	para public 'CODE' use16
		assume cs:stub224
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_482E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 70B10h		; fileoff
		dw 474h		; codesize
		dw 2Ch		; relsize
		dw 0Ah			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48300	proc far
		jmp	sub_BA44A
sub_48300	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48305	proc far
		jmp	sub_BA0D0
sub_48305	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4830A	proc far
		jmp	sub_BA129
sub_4830A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4830F	proc far
		jmp	sub_BA21B
sub_4830F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48314	proc far
		jmp	sub_BA000
sub_48314	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48319	proc far
		jmp	sub_BA0A8
sub_48319	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4831E	proc far
		jmp	sub_BA38F
sub_4831E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48323	proc far
		jmp	sub_BA332
sub_48323	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48328	proc far
		jmp	sub_BA3E0
sub_48328	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4832D	proc far
		jmp	sub_BA40D
sub_4832D	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub224		ends
