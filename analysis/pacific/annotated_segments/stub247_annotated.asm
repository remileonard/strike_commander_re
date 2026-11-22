stub247		segment	para public 'CODE' use16
		assume cs:stub247
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73220	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0F710h		; fileoff
		dw 1E30h		; codesize
		dw 118h		; relsize
		dw 1Eh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73240	proc far
		jmp	sub_8E663
sub_73240	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73245	proc far
		jmp	GlyphObject_Helper4_8D62E
sub_73245	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7324A	proc far
		jmp	NavMap_ReserveBox_8D63D
sub_7324A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7324F	proc far
		jmp	NavMap_IsBoxFree_8D6EB
sub_7324F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73254	proc far
		jmp	NavMap_PlaceLabel_8D766
sub_73254	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73259	proc far
		jmp	GlyphObject_ResolveHierarchyOffset_8D0C3
sub_73259	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7325E	proc far
		jmp	GlyphObject_StoreComputedPosition_8D161
sub_7325E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73263	proc far
		jmp	sub_8E489
sub_73263	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73268	proc far
		jmp	GlyphObject_ReleaseMultiple_8E5B5
sub_73268	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7326D	proc far
		jmp	sub_8CBC6
sub_7326D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73272	proc far
		jmp	GlyphObject_Helper_8D1B2
sub_73272	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73277	proc far
		jmp	GlyphObject_Helper2_8D1D9
sub_73277	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7327C	proc far
		jmp	NavMap_WorldToScreen_8D1FC
sub_7327C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73281	proc far
		jmp	sub_8D29D
sub_73281	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73286	proc far
		jmp	sub_8D8EB
sub_73286	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7328B	proc far
		jmp	sub_8D2F9
sub_7328B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73290	proc far
		jmp	sub_8D4DE
sub_73290	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73295	proc far
		jmp	sub_8E09E
sub_73295	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7329A	proc far
		jmp	sub_8E0F2
sub_7329A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7329F	proc far
		jmp	Lexer_AdvanceWrapper_8E1EC
sub_7329F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_732A4	proc far
		jmp	Lexer_RewindWrapper_8E215
sub_732A4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_732A9	proc far
		jmp	NavMap_SetObjective_8E11F
sub_732A9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_732AE	proc far
		jmp	sub_8E26D
sub_732AE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_732B3	proc far
		jmp	sub_8E23E
sub_732B3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_732B8	proc far
		jmp	sub_8C860
sub_732B8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_732BD	proc far
		jmp	sub_8C9B1
sub_732BD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_732C2	proc far
		jmp	GlyphObject_MeasureAndAllocate_8C966
sub_732C2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_732C7	proc far
		jmp	sub_8C9F8
sub_732C7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_732CC	proc far
		jmp	sub_8CAB9
sub_732CC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_732D1	proc far
		jmp	NavMap_ClampBox_8D693
sub_732D1	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub247		ends
