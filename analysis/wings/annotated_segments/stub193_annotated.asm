stub193		segment	para public 'CODE' use16
		assume cs:stub193
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58CC0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0E7A0h		; fileoff
		dw 172h		; codesize
		dw 16h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58CE0	proc far
		jmp	SaveGame_WriteFile_6E740
sub_58CE0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58CE5	proc far
		jmp	SaveGame_ReadFile_6E7F3
sub_58CE5	endp
		db 0, 0, 0, 0, 0, 0
stub193		ends
