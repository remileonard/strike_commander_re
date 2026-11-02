stub195		segment	para public 'CODE' use16
		assume cs:stub195
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_47AD0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 12260h		; fileoff
		dw 506Eh		; codesize
		dw 4B8h		; relsize
		dw 15h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AF0	proc far
		jmp	sub_65D98
sub_47AF0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AF5	proc far
		jmp	sub_65D89
sub_47AF5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AFA	proc far
		jmp	sub_65D7A
sub_47AFA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47AFF	proc far
		jmp	sub_65D6B
sub_47AFF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B04	proc far
		jmp	sub_65D5F
sub_47B04	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B09	proc far
		jmp	sub_6112A
sub_47B09	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B0E	proc far
		jmp	sub_6120E
sub_47B0E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B13	proc far
		jmp	sub_612B5
sub_47B13	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B18	proc far
		jmp	Debris_GetSubpartAttrib_612CF
sub_47B18	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B1D	proc far
		jmp	Conv_DrawText_612E1
sub_47B1D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B22	proc far
		jmp	ConvData_FindFace_617FE
sub_47B22	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B27	proc far
		jmp	ConvData_FindFacePalette_6181C
sub_47B27	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B2C	proc far
		jmp	ConvData_FindFigure_61857
sub_47B2C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B31	proc far
		jmp	ConvData_FindFigurePalette_61875
sub_47B31	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B36	proc far
		jmp	sub_615B2
sub_47B36	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B3B	proc far
		jmp	sub_61893
sub_47B3B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B40	proc far
		jmp	Conv_Init_60DA0
sub_47B40	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B45	proc far
		jmp	sub_60FA4
sub_47B45	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B4A	proc far
		jmp	Conv_Construct_60EE7
sub_47B4A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B4F	proc far
		jmp	sub_6105E
sub_47B4F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_47B54	proc far
		jmp	sub_61E1C
sub_47B54	endp
		db 0, 0, 0, 0, 0, 0, 0
stub195		ends
