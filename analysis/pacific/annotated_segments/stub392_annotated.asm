stub392		segment	para public 'CODE' use16
		assume cs:stub392
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_76220	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 66B30h		; fileoff
		dw 57Bh		; codesize
		dw 26h		; relsize
		dw 10h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76240	proc far
		jmp	TextureLoader_AllocateC_DFB51
sub_76240	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76245	proc far
		jmp	Palette_Alloc_DF5F0
sub_76245	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7624A	proc far
		jmp	sub_DF61F
sub_7624A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7624F	proc far
		jmp	Palette_LoadFromResource_DF65F
sub_7624F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76254	proc far
		jmp	sub_DF718
sub_76254	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76259	proc far
		jmp	Palette_Upload_DF75B
sub_76259	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7625E	proc far
		jmp	sub_DF73D
sub_7625E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76263	proc far
		jmp	sub_DF827
sub_76263	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76268	proc far
		jmp	Palette_FillRange_DF882
sub_76268	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7626D	proc far
		jmp	sub_DF963
sub_7626D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76272	proc far
		jmp	Palette_CopyInto_DF8FA
sub_76272	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76277	proc far
		jmp	sub_DF98D
sub_76277	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7627C	proc far
		jmp	sub_DF9CD
sub_7627C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76281	proc far
		jmp	Palette_LoadAndUpload_DF9E5
sub_76281	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_76286	proc far
		jmp	sub_DFA0A
sub_76286	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7628B	proc far
		jmp	sub_DFAD1
sub_7628B	endp
stub392		ends
