stub247		segment	para public 'CODE' use16
		assume cs:stub247
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59A30	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2ADB0h		; fileoff
		dw 0		; codesize
		dw 0		; relsize
		dw 0			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea
stub247		ends
