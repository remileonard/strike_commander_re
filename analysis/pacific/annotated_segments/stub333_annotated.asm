stub333		segment	para public 'CODE' use16
		assume cs:stub333
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74DD0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3BD70h		; fileoff
		dw 0A08h		; codesize
		dw 6Ah		; relsize
		dw 1Fh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DF0	proc far
		jmp	sub_B787E
sub_74DF0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DF5	proc far
		jmp	sub_B7840
sub_74DF5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DFA	proc far
		jmp	sub_B77F5
sub_74DFA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74DFF	proc far
		jmp	sub_B77D4
sub_74DFF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E04	proc far
		jmp	sub_B779E
sub_74E04	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E09	proc far
		jmp	PaletteScreen_ReleaseStyleAndObject_B7775
sub_74E09	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E0E	proc far
		jmp	PaletteScreen_ReleaseStyleAndObject_B774C
sub_74E0E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E13	proc far
		jmp	sub_B6EB0
sub_74E13	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E18	proc far
		jmp	sub_B6ECD
sub_74E18	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E1D	proc far
		jmp	sub_B6EF6
sub_74E1D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E22	proc far
		jmp	sub_B6F26
sub_74E22	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E27	proc far
		jmp	sub_B6F68
sub_74E27	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E2C	proc far
		jmp	sub_B7062
sub_74E2C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E31	proc far
		jmp	sub_B6FE2
sub_74E31	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E36	proc far
		jmp	sub_B70B0
sub_74E36	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E3B	proc far
		jmp	sub_B70EF
sub_74E3B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E40	proc far
		jmp	sub_B713A
sub_74E40	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E45	proc far
		jmp	sub_B7142
sub_74E45	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E4A	proc far
		jmp	sub_B727B
sub_74E4A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E4F	proc far
		jmp	sub_B7631
sub_74E4F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E54	proc far
		jmp	sub_B73BD
sub_74E54	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E59	proc far
		jmp	sub_B767C
sub_74E59	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E5E	proc far
		jmp	sub_B76B5
sub_74E5E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E63	proc far
		jmp	sub_B76EE
sub_74E63	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E68	proc far
		jmp	sub_B72CB
sub_74E68	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E6D	proc far
		jmp	sub_B72DB
sub_74E6D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E72	proc far
		jmp	sub_B72F2
sub_74E72	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E77	proc far
		jmp	AITargeting_Helper4_B765C
sub_74E77	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E7C	proc far
		jmp	sub_B734E
sub_74E7C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E81	proc far
		jmp	sub_B7379
sub_74E81	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74E86	proc far
		jmp	sub_B7730
sub_74E86	endp
		db 0, 0, 0, 0, 0
stub333		ends
