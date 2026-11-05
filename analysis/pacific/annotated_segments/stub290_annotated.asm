stub290		segment	para public 'CODE' use16
		assume cs:stub290
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73FC0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2CA50h		; fileoff
		dw 99Dh		; codesize
		dw 5Ah		; relsize
		dw 0Bh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73FE0	proc far
		jmp	sub_A8F28
sub_73FE0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73FE5	proc far
		jmp	sub_A8F03
sub_73FE5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73FEA	proc far
		jmp	TerrainTextures_LoadTerrainList_A864D
sub_73FEA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73FEF	proc far
		jmp	sub_A8BD0
sub_73FEF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73FF4	proc far
		jmp	sub_A885F
sub_73FF4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73FF9	proc far
		jmp	TerrainSector_ReleaseDouble_A8B0D
sub_73FF9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73FFE	proc far
		jmp	TerrainSector_ReleaseTriple_A8AD1
sub_73FFE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74003	proc far
		jmp	TerrainSector_Helper2_A8BAA
sub_74003	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74008	proc far
		jmp	TerrainTextures_PrepareCache_A85B0
sub_74008	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7400D	proc far
		jmp	TerrainTextures_ReserveSlot_A85E2
sub_7400D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74012	proc far
		jmp	TerrainSector_ParseTriple_A8EAE
sub_74012	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0
stub290		ends
