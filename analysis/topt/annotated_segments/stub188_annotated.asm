stub188		segment	para public 'CODE' use16
		assume cs:stub188
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47840	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0		; fileoff
		dw 24AAh		; codesize
		dw 278h		; relsize
		dw 0Fh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47860	proc far
		jmp	sub_51D79
sub_47860	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47865	proc far
		jmp	sub_51D66
sub_47865	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4786A	proc far
		jmp	sub_51D24
sub_4786A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4786F	proc far
		jmp	Gameflow_InitNewGame_4F900
sub_4786F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47874	proc far
		jmp	sub_4F9F9
sub_47874	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47879	proc far
		jmp	sub_4FC00
sub_47879	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4787E	proc far
		jmp	sub_4FDCB
sub_4787E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47883	proc far
		jmp	sub_5026B
sub_47883	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47888	proc far
		jmp	sub_503A5
sub_47888	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4788D	proc far
		jmp	sub_502FE
sub_4788D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47892	proc far
		jmp	sub_5033E
sub_47892	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47897	proc far
		jmp	sub_50554
sub_47897	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4789C	proc far
		jmp	Gameflow_ReadMissionResult_50D85
sub_4789C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478A1	proc far
		jmp	Gameflow_SaveTmpState_5140A
sub_478A1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_478A6	proc far
		jmp	sub_51461
sub_478A6	endp
		db 0, 0, 0, 0, 0
stub188		ends
