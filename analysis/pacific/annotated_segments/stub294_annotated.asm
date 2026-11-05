stub294		segment	para public 'CODE' use16
		assume cs:stub294
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_740B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2D990h		; fileoff
		dw 0F47h		; codesize
		dw 10Ah		; relsize
		dw 0Ch			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740D0	proc far
		jmp	sub_AA35F
sub_740D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740D5	proc far
		jmp	sub_AA357
sub_740D5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740DA	proc far
		jmp	sub_AA34F
sub_740DA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740DF	proc far
		jmp	TerrainTile_Helper_AA340
sub_740DF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740E4	proc far
		jmp	TerrainTile_ConstructDescriptor_AA311
sub_740E4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740E9	proc far
		jmp	Terrain_ProcessTileThunks_A9450
sub_740E9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740EE	proc far
		jmp	Terrain_ProcessTileThunksB_A94CC
sub_740EE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740F3	proc far
		jmp	sub_A956F
sub_740F3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740F8	proc far
		jmp	Terrain_AllocateAndFormatMultiple_AA1B4
sub_740F8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_740FD	proc far
		jmp	Terrain_ClearTileList_A9FA3
sub_740FD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74102	proc far
		jmp	sub_AA03E
sub_74102	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74107	proc far
		jmp	sub_A952E
sub_74107	endp
		db 0, 0, 0, 0
stub294		ends
