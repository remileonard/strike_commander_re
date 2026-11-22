stub293		segment	para public 'CODE' use16
		assume cs:stub293
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74080	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2D920h		; fileoff
		dw 65h		; codesize
		dw 2		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740A0	proc far
		jmp	Terrain_Helper6_A93E0
sub_740A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740A5	proc far
		jmp	sub_A9429
sub_740A5	endp
		db 0, 0, 0, 0, 0, 0
stub293		ends
