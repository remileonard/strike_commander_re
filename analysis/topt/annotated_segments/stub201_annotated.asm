stub201		segment	para public 'CODE' use16
		assume cs:stub201
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47CF0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 22670h		; fileoff
		dw 496Dh		; codesize
		dw 492h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

; ==============================================================================================
; Reprise de OPTEST.EXE : relais VROOMM de Midgame1_PlayPart2_70290, comme
; Stub_Midgame1_PlayPart2_423E0 de OPTEST.EXE.
; ==============================================================================================
Stub_Midgame1_PlayPart2_47D10	proc far
		jmp	Midgame1_PlayPart2_70290
Stub_Midgame1_PlayPart2_47D10	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub201		ends
