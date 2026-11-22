stub259		segment	para public 'CODE' use16
		assume cs:stub259
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_737F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1CFE0h		; fileoff
		dw 1DD9h		; codesize
		dw 1FEh		; relsize
		dw 17h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73810	proc far
		jmp	sub_9B630
sub_73810	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73815	proc far
		jmp	sub_9B5FA
sub_73815	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7381A	proc far
		jmp	StreamReader_DestructWrapper_9B5EB
sub_7381A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7381F	proc far
		jmp	sub_9B585
sub_7381F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73824	proc far
		jmp	StreamReader_DestructWrapper_9B576
sub_73824	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73829	proc far
		jmp	AircraftDamageModel_ReleaseStreamAndDestruct_9B540
sub_73829	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7382E	proc far
		jmp	StreamReader_DestructWrapper_9B531
sub_7382E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73833	proc far
		jmp	sub_9B4C3
sub_73833	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73838	proc far
		jmp	StreamReader_DestructWrapper_9B4B4
sub_73838	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7383D	proc far
		jmp	sub_9B3EA
sub_7383D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73842	proc far
		jmp	sub_9B3BB
sub_73842	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73847	proc far
		jmp	StreamReader_DestructWrapper_9B3AC
sub_73847	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7384C	proc far
		jmp	sub_9B36A
sub_7384C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73851	proc far
		jmp	sub_9B331
sub_73851	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73856	proc far
		jmp	sub_99B3B
sub_73856	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7385B	proc far
		jmp	sub_9AA8F
sub_7385B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73860	proc far
		jmp	sub_9AB48
sub_73860	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73865	proc far
		jmp	CPU_SpeedCalibration
sub_73865	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7386A	proc far
		jmp	TextObj_Construct
sub_7386A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7386F	proc far
		jmp	TextObj_CommandInterp
sub_7386F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73874	proc far
		jmp	sub_99A1F
sub_73874	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73879	proc far
		jmp	sub_9AB56
sub_73879	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7387E	proc far
		jmp	sub_9B2E9
sub_7387E	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub259		ends
