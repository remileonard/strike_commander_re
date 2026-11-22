stub386		segment	para public 'CODE' use16
		assume cs:stub386
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76020	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 61F70h		; fileoff
		dw 27h		; codesize
		dw 0		; relsize
		dw 2			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76040	proc far
		jmp	sub_DAEC0
sub_76040	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76045	proc far
		jmp	sub_DAEC8
sub_76045	endp
		db 0, 0, 0, 0, 0, 0
stub386		ends
