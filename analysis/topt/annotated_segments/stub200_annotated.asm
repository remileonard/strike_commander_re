stub200		segment	para public 'CODE' use16
		assume cs:stub200
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47CC0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1AF00h		; fileoff
		dw 7015h		; codesize
		dw 752h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47CE0	proc far
		jmp	TranslucentFont_Destruct_70254
sub_47CE0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47CE5	proc far
		jmp	Midgame1_PlayPart1_69270
sub_47CE5	endp
		db 0, 0, 0, 0, 0, 0
stub200		ends
