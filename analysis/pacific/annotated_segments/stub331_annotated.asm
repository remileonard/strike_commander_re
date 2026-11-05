stub331		segment	para public 'CODE' use16
		assume cs:stub331
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74D00	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3B560h		; fileoff
		dw 2FEh		; codesize
		dw 20h		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D20	proc far
		jmp	GaugeWidgetVariantD_ConstructAndInit_B6700
sub_74D20	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D25	proc far
		jmp	GaugeWidget_ReleaseAllResources_B698A
sub_74D25	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D2A	proc far
		jmp	GaugeWidget_DrawWithLabel_B6818
sub_74D2A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74D2F	proc far
		jmp	GaugeWidget_HitTestEntries_B692F
sub_74D2F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub331		ends
