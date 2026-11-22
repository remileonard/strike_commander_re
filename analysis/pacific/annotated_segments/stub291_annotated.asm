stub291		segment	para public 'CODE' use16
		assume cs:stub291
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74020	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2D450h		; fileoff
		dw 31Eh		; codesize
		dw 2Eh		; relsize
		dw 3			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74040	proc far
		jmp	TerrainTile_Allocate_A8F50
sub_74040	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74045	proc far
		jmp	sub_A8FBA
sub_74045	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7404A	proc far
		jmp	TerrainTile_ReleaseSimple_A8F85
sub_7404A	endp
		db 0
stub291		ends
