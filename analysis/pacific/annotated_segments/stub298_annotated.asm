stub298		segment	para public 'CODE' use16
		assume cs:stub298
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_741F0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2FAE0h		; fileoff
		dw 999h		; codesize
		dw 60h		; relsize
		dw 5			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74210	proc far
		jmp	Debris_AllocateExtended_ABD24
sub_74210	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74215	proc far
		jmp	sub_AB3B0
sub_74215	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7421A	proc far
		jmp	sub_AB40E
sub_7421A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7421F	proc far
		jmp	sub_AB5D5
sub_7421F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74224	proc far
		jmp	sub_AB9BC
sub_74224	endp
		db 0, 0, 0, 0, 0, 0, 0
stub298		ends
