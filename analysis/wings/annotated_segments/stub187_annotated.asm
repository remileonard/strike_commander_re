stub187		segment	para public 'CODE' use16
		assume cs:stub187
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58AF0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 8000h		; fileoff
		dw 182Bh		; codesize
		dw 13Ch		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B10	proc far
		jmp	sub_685E0
sub_58B10	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58B15	proc far
		jmp	sub_68D43
sub_58B15	endp
		db 0, 0, 0, 0, 0, 0
stub187		ends
