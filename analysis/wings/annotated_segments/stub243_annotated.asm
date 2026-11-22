stub243		segment	para public 'CODE' use16
		assume cs:stub243
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59970	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2A900h		; fileoff
		dw 122h		; codesize
		dw 20h		; relsize
		dw 1			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59990	proc far
		jmp	Memory_AllocatorTable_PopulateSlots_88AC0
sub_59990	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub243		ends
