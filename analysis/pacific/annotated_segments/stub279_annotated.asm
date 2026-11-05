stub279		segment	para public 'CODE' use16
		assume cs:stub279
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73D00	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 29BD0h		; fileoff
		dw 1C5h		; codesize
		dw 1Ah		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73D20	proc far
		jmp	AircraftComponent_LoadMixedFieldsC_A5934
sub_73D20	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73D25	proc far
		jmp	AircraftComponent_LoadWithDwordFieldsD_A5985
sub_73D25	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73D2A	proc far
		jmp	AircraftComponent_Helper2_A5910
sub_73D2A	endp
		db 0
stub279		ends
