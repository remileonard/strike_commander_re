stub217		segment	para public 'CODE' use16
		assume cs:stub217
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47FF0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6D310h		; fileoff
		dw 979h		; codesize
		dw 40h		; relsize
		dw 0Ah			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48010	proc far
		jmp	sub_B7295
sub_48010	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48015	proc far
		jmp	sub_B6CAF
sub_48015	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4801A	proc far
		jmp	sub_B6AB4
sub_4801A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4801F	proc far
		jmp	sub_B6D3D
sub_4801F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48024	proc far
		jmp	sub_B6A18
sub_48024	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48029	proc far
		jmp	sub_B7216
sub_48029	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4802E	proc far
		jmp	sub_B7307
sub_4802E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48033	proc far
		jmp	sub_B6A00
sub_48033	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48038	proc far
		jmp	sub_B6A08
sub_48038	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4803D	proc far
		jmp	sub_B6A10
sub_4803D	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub217		ends
