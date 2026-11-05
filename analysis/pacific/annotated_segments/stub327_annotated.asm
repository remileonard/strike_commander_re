stub327		segment	para public 'CODE' use16
		assume cs:stub327
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74A00	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 38160h		; fileoff
		dw 172h		; codesize
		dw 16h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A20	proc far
		jmp	SaveGame_WriteFile_B3490
sub_74A20	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A25	proc far
		jmp	SaveGame_ReadFile_B3543
sub_74A25	endp
		db 0, 0, 0, 0, 0, 0
stub327		ends
