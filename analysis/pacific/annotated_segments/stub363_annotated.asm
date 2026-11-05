stub363		segment	para public 'CODE' use16
		assume cs:stub363
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_758C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 50470h		; fileoff
		dw 14Ah		; codesize
		dw 16h		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_758E0	proc far
		jmp	Gameflow_ApplyChange_CA290
sub_758E0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_758E5	proc far
		jmp	Gameflow_EmptyKillMarks_CA3D2
sub_758E5	endp
		db 0, 0, 0, 0, 0, 0
stub363		ends
