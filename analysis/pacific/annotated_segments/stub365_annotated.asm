stub365		segment	para public 'CODE' use16
		assume cs:stub365
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75920	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 50850h		; fileoff
		dw 21D1h		; codesize
		dw 2A6h		; relsize
		dw 11h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75940	proc far
		jmp	sub_CC7DA
sub_75940	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75945	proc far
		jmp	Gameflow_ChooseAircraft_CAAF2
sub_75945	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7594A	proc far
		jmp	Gameflow_LaunchMission_CAD9D
sub_7594A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7594F	proc far
		jmp	sub_CA630
sub_7594F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75954	proc far
		jmp	sub_CA675
sub_75954	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75959	proc far
		jmp	sub_CA6F2
sub_75959	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7595E	proc far
		jmp	sub_CA9BD
sub_7595E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75963	proc far
		jmp	sub_CA730
sub_75963	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75968	proc far
		jmp	sub_CA848
sub_75968	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7596D	proc far
		jmp	Gameflow_WriteInstantMission_CAEBB
sub_7596D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75972	proc far
		jmp	sub_CAE2F
sub_75972	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75977	proc far
		jmp	sub_CAE8A
sub_75977	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7597C	proc far
		jmp	sub_CBBE2
sub_7597C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75981	proc far
		jmp	sub_CBF46
sub_75981	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75986	proc far
		jmp	sub_CC298
sub_75986	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7598B	proc far
		jmp	sub_CC38B
sub_7598B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75990	proc far
		jmp	sub_CC437
sub_75990	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub365		ends
