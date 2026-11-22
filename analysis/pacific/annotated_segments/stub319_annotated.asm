stub319		segment	para public 'CODE' use16
		assume cs:stub319
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_747B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 35940h		; fileoff
		dw 73h		; codesize
		dw 0Ch		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_747D0	proc far
		jmp	IFF_LoadAngleParam_Wrapper_B0DF0
sub_747D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_747D5	proc far
		jmp	PlayerComponentVariantS_ConstructAndInit_B0E04
sub_747D5	endp
		db 0, 0, 0, 0, 0, 0
stub319		ends
