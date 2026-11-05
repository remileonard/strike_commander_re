stub335		segment	para public 'CODE' use16
		assume cs:stub335
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74ED0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3C8F0h		; fileoff
		dw 0C66h		; codesize
		dw 5Eh		; relsize
		dw 1Ch			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74EF0	proc far
		jmp	sub_B7A54
sub_74EF0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74EF5	proc far
		jmp	PlayerComponent_Helper_B7A07
sub_74EF5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74EFA	proc far
		jmp	sub_B79C0
sub_74EFA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74EFF	proc far
		jmp	PlayerComponent_ResetFieldsWrapper_B79EF
sub_74EFF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F04	proc far
		jmp	sub_B7A30
sub_74F04	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F09	proc far
		jmp	AircraftDynamics_ReadAtmoChunk_B7AB1
sub_74F09	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F0E	proc far
		jmp	PlayerComponent_HelperB_B7A62
sub_74F0E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F13	proc far
		jmp	sub_B7A79
sub_74F13	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F18	proc far
		jmp	PlayerComponent_LoadFieldsWithRetryG_B7E09
sub_74F18	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F1D	proc far
		jmp	sub_B7E48
sub_74F1D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F22	proc far
		jmp	sub_B7BD3
sub_74F22	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F27	proc far
		jmp	sub_B7C73
sub_74F27	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F2C	proc far
		jmp	sub_B7D38
sub_74F2C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F31	proc far
		jmp	AircraftDynamics_ReadThrustChunk_B81AC
sub_74F31	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F36	proc far
		jmp	sub_B80EC
sub_74F36	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F3B	proc far
		jmp	PlayerComponent_LoadFieldsWithRetryH_B812D
sub_74F3B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F40	proc far
		jmp	sub_B8170
sub_74F40	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F45	proc far
		jmp	sub_B7E7C
sub_74F45	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F4A	proc far
		jmp	sub_B7F2C
sub_74F4A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F4F	proc far
		jmp	sub_B8006
sub_74F4F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F54	proc far
		jmp	AircraftDynamics_ReadStblChunk_B8279
sub_74F54	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F59	proc far
		jmp	PlayerComponent_HelperE_B85C3
sub_74F59	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F5E	proc far
		jmp	PlayerComponent_LoadFieldsWithRetryK_B85DA
sub_74F5E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F63	proc far
		jmp	PlayerComponent_HelperD_B82BE
sub_74F63	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F68	proc far
		jmp	sub_B8235
sub_74F68	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F6D	proc far
		jmp	sub_B82EB
sub_74F6D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F72	proc far
		jmp	sub_B83B7
sub_74F72	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74F77	proc far
		jmp	sub_B84B7
sub_74F77	endp
		db 0, 0, 0, 0
stub335		ends
