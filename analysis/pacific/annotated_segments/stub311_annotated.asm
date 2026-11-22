stub311		segment	para public 'CODE' use16
		assume cs:stub311
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_744B0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 32810h		; fileoff
		dw 1546h		; codesize
		dw 70h		; relsize
		dw 22h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744D0	proc far
		jmp	Weapon_IdToMask_ADEA0
sub_744D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744D5	proc far
		jmp	sub_ADF9D
sub_744D5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744DA	proc far
		jmp	sub_ADF5F
sub_744DA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744DF	proc far
		jmp	sub_ADEFA
sub_744DF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744E4	proc far
		jmp	sub_AE006
sub_744E4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744E9	proc far
		jmp	PlayerComponent_Helper_AE13C
sub_744E9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744EE	proc far
		jmp	sub_AE16C
sub_744EE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744F3	proc far
		jmp	sub_AE058
sub_744F3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744F8	proc far
		jmp	sub_AE27F
sub_744F8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_744FD	proc far
		jmp	sub_AE30F
sub_744FD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74502	proc far
		jmp	sub_AE22A
sub_74502	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74507	proc far
		jmp	WeaponSys_LoadStoresOnHardpoint_AE513
sub_74507	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7450C	proc far
		jmp	PlayerComponent_HelperVariantA_AEBA4
sub_7450C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74511	proc far
		jmp	PlayerComponent_DispatchPair_AE6B1
sub_74511	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74516	proc far
		jmp	PlayerComponent_HelperVariantE_AEF7E
sub_74516	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7451B	proc far
		jmp	sub_AE7D0
sub_7451B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74520	proc far
		jmp	WeaponSys_LoadFormWEAP_AE98A
sub_74520	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74525	proc far
		jmp	WeaponSys_LoadFromFile_AE9D4
sub_74525	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7452A	proc far
		jmp	sub_AEA95
sub_7452A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7452F	proc far
		jmp	sub_AE832
sub_7452F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74534	proc far
		jmp	WeaponSys_DistributeStores_AEC5A
sub_74534	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74539	proc far
		jmp	sub_AEEDF
sub_74539	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7453E	proc far
		jmp	sub_AEF98
sub_7453E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74543	proc far
		jmp	PlayerComponent_ReleaseAndReload_AF1D4
sub_74543	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74548	proc far
		jmp	sub_AF182
sub_74548	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7454D	proc far
		jmp	sub_AE6EE
sub_7454D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74552	proc far
		jmp	sub_AE7AC
sub_74552	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74557	proc far
		jmp	PlayerComponent_ReleaseFull_AF2B5
sub_74557	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7455C	proc far
		jmp	PlayerComponent_ReleaseHelperB_AF26E
sub_7455C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74561	proc far
		jmp	PlayerComponent_HelperVariantF_AF24A
sub_74561	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74566	proc far
		jmp	sub_AEBE6
sub_74566	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7456B	proc far
		jmp	sub_AEC20
sub_7456B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74570	proc far
		jmp	sub_AF36C
sub_74570	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74575	proc far
		jmp	sub_AE64B
sub_74575	endp
		db 0, 0, 0, 0, 0, 0
stub311		ends
