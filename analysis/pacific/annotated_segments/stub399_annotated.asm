stub399		segment	para public 'CODE' use16
		assume cs:stub399
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76410	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6CBE0h		; fileoff
		dw 122h		; codesize
		dw 20h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76430	proc far
		jmp	Memory_AllocatorTable_PopulateSlots_E50D0
sub_76430	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub399		ends
