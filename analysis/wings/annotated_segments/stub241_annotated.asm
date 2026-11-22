stub241		segment	para public 'CODE' use16
		assume cs:stub241
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59900	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 2A4B0h		; fileoff
		dw 312h		; codesize
		dw 20h		; relsize
		dw 4			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59920	proc far
		jmp	GaugeWidgetVariantD_ConstructAndInit_886A0
sub_59920	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59925	proc far
		jmp	GaugeWidget_ReleaseAllResources_8893E
sub_59925	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5992A	proc far
		jmp	sub_887B8
sub_5992A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5992F	proc far
		jmp	GaugeWidget_HitTestEntries_888E3
sub_5992F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub241		ends
