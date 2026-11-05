stub250		segment	para public 'CODE' use16
		assume cs:stub250
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59AB0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2AE40h		; fileoff
		dw 16Fh		; codesize
		dw 12h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59AD0	proc far
		jmp	Palette_StepTowardTarget_88FC0
sub_59AD0	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub250		ends
