stub221		segment	para public 'CODE' use16
		assume cs:stub221
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59480	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 17CB0h		; fileoff
		dw 40Ch		; codesize
		dw 24h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_594A0	proc far
		jmp	AircraftComponent_ReleaseMultiple_775A0
sub_594A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_594A5	proc far
		jmp	sub_77767
sub_594A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_594AA	proc far
		jmp	AircraftComponent_ReleaseAndDestructGeneric_77891
sub_594AA	endp
		db 0
stub221		ends
