stub205		segment	para public 'CODE' use16
		assume cs:stub205
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_59130	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 13700h		; fileoff
		dw 12FCh		; codesize
		dw 100h		; relsize
		dw 14h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59150	proc far
		jmp	sub_74647
sub_59150	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59155	proc far
		jmp	sub_7462B
sub_59155	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5915A	proc far
		jmp	sub_74624
sub_5915A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5915F	proc far
		jmp	sub_7461F
sub_5915F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59164	proc far
		jmp	sub_74603
sub_59164	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59169	proc far
		jmp	sub_745FE
sub_59169	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5916E	proc far
		jmp	sub_73ADC
sub_5916E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59173	proc far
		jmp	sub_74361
sub_59173	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59178	proc far
		jmp	sub_73568
sub_59178	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5917D	proc far
		jmp	sub_739B5
sub_5917D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59182	proc far
		jmp	sub_738A2
sub_59182	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59187	proc far
		jmp	TextScrollDisplayB_TickHelper_739BA
sub_59187	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5918C	proc far
		jmp	World_LoadLGHTChunk_738A7
sub_5918C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59191	proc far
		jmp	sub_739CD
sub_59191	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_59196	proc far
		jmp	sub_73A1C
sub_59196	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_5919B	proc far
		jmp	sub_733FF
sub_5919B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_591A0	proc far
		jmp	World_OpenAndParseFile_73350
sub_591A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_591A5	proc far
		jmp	MissionLoader_ReleaseRosterAndDestruct_73A21
sub_591A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_591AA	proc far
		jmp	sub_73A45
sub_591AA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_591AF	proc far
		jmp	sub_745E7
sub_591AF	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub205		ends
