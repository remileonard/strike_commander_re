stub280		segment	para public 'CODE' use16
		assume cs:stub280
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73D30	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 29DC0h		; fileoff
		dw 1D8h		; codesize
		dw 16h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73D50	proc far
		jmp	sub_A5AE0
sub_73D50	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73D55	proc far
		jmp	AircraftComponent_ConstructWidget_A5BCB
sub_73D55	endp
		db 0, 0, 0, 0, 0, 0
stub280		ends
