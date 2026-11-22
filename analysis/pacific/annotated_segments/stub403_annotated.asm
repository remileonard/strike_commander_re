stub403		segment	para public 'CODE' use16
		assume cs:stub403
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_764D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D090h		; fileoff
		dw 0		; codesize
		dw 0		; relsize
		dw 0			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea
stub403		ends
