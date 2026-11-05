stub252		segment	para public 'CODE' use16
		assume cs:stub252
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_734C0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 16F70h		; fileoff
		dw 145Ah		; codesize
		dw 10Eh		; relsize
		dw 1Fh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_734E0	proc far
		jmp	sub_9514F
sub_734E0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_734E5	proc far
		jmp	sub_95114
sub_734E5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_734EA	proc far
		jmp	sub_950A4
sub_734EA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_734EF	proc far
		jmp	HUDSymbol_ReleaseListEntry_95079
sub_734EF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_734F4	proc far
		jmp	sub_95071
sub_734F4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_734F9	proc far
		jmp	sub_95035
sub_734F9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_734FE	proc far
		jmp	sub_9502D
sub_734FE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73503	proc far
		jmp	StreamReader_DestructWrapper_9501E
sub_73503	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73508	proc far
		jmp	sub_94FE2
sub_73508	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7350D	proc far
		jmp	sub_94FA7
sub_7350D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73512	proc far
		jmp	HUDSymbol_Helper14_93D30
sub_73512	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73517	proc far
		jmp	HUDSymbol_ConstructVariantJ_93D7F
sub_73517	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7351C	proc far
		jmp	sub_93E79
sub_7351C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73521	proc far
		jmp	HUDSymbol_ConstructVariantK_93DFC
sub_73521	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73526	proc far
		jmp	HUDSymbol_ConstructWithContainerOpB_93F61
sub_73526	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7352B	proc far
		jmp	sub_93FB9
sub_7352B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73530	proc far
		jmp	HUDSymbol_ReleaseRefConditionalB_94014
sub_73530	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73535	proc far
		jmp	HUDSymbol_ConstructVariantL_94031
sub_73535	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7353A	proc far
		jmp	sub_9416B
sub_7353A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7353F	proc far
		jmp	Cinematic_CamEntryConstruct_CHAS_940CE
sub_7353F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73544	proc far
		jmp	Camera_OrbitReset_94253
sub_73544	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73549	proc far
		jmp	Cinematic_CamEntryConstruct_CKPT_943A2
sub_73549	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7354E	proc far
		jmp	sub_944A6
sub_7354E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73553	proc far
		jmp	HUDSymbol_ConstructVariantO_94424
sub_73553	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73558	proc far
		jmp	sub_946AE
sub_73558	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7355D	proc far
		jmp	sub_94915
sub_7355D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73562	proc far
		jmp	sub_9493C
sub_73562	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73567	proc far
		jmp	sub_94A58
sub_73567	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7356C	proc far
		jmp	sub_949CA
sub_7356C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73571	proc far
		jmp	sub_94C9E
sub_73571	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73576	proc far
		jmp	sub_94F72
sub_73576	endp
		db 0, 0, 0, 0, 0
stub252		ends
