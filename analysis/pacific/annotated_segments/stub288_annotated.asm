stub288		segment	para public 'CODE' use16
		assume cs:stub288
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73F40	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2C4A0h		; fileoff
		dw 0A2h		; codesize
		dw 2		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73F60	proc far
		jmp	Terrain_Helper_A8040
sub_73F60	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73F65	proc far
		jmp	sub_A80C6
sub_73F65	endp
		db 0, 0, 0, 0, 0, 0
stub288		ends
