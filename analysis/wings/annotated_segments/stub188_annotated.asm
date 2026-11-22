stub188		segment	para public 'CODE' use16
		assume cs:stub188
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58B20	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 9970h		; fileoff
		dw 1420h		; codesize
		dw 11Ah		; relsize
		dw 0Fh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B40	proc far
		jmp	sub_6B1FA
sub_58B40	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B45	proc far
		jmp	StreamReader_DestructWrapper_6B1EB
sub_58B45	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B4A	proc far
		jmp	sub_6B185
sub_58B4A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B4F	proc far
		jmp	StreamReader_DestructWrapper_6B176
sub_58B4F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B54	proc far
		jmp	AircraftDamageModel_ReleaseStreamAndDestruct_6B140
sub_58B54	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B59	proc far
		jmp	sub_6A0EB
sub_58B59	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B5E	proc far
		jmp	Dialog_Close
sub_58B5E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B63	proc far
		jmp	sub_6AB14
sub_58B63	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B68	proc far
		jmp	sub_6AC57
sub_58B68	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B6D	proc far
		jmp	CPU_SpeedCalibration
sub_58B6D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B72	proc far
		jmp	sub_69E10
sub_58B72	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B77	proc far
		jmp	sub_69F3D
sub_58B77	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B7C	proc far
		jmp	TextObj_CommandInterp
sub_58B7C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B81	proc far
		jmp	sub_6AC65
sub_58B81	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B86	proc far
		jmp	sub_6B0F8
sub_58B86	endp
		db 0, 0, 0, 0, 0
stub188		ends
