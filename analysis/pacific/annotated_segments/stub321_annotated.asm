stub321		segment	para public 'CODE' use16
		assume cs:stub321
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74830	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 35D30h		; fileoff
		dw 5D4h		; codesize
		dw 1Ch		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74850	proc far
		jmp	sub_B11B0
sub_74850	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74855	proc far
		jmp	sub_B11C2
sub_74855	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7485A	proc far
		jmp	sub_B169C
sub_7485A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7485F	proc far
		jmp	sub_B177C
sub_7485F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub321		ends
