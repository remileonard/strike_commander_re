stub240		segment	para public 'CODE' use16
		assume cs:stub240
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_730C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0C7C0h		; fileoff
		dw 0A87h		; codesize
		dw 48h		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_730E0	proc far
		jmp	sub_8A44A
sub_730E0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_730E5	proc far
		jmp	sub_89DD1
sub_730E5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_730EA	proc far
		jmp	sub_89A30
sub_730EA	endp
		db 0
stub240		ends
