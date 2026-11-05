stub344		segment	para public 'CODE' use16
		assume cs:stub344
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75260	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 42700h		; fileoff
		dw 1714h		; codesize
		dw 1A8h		; relsize
		dw 12h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75280	proc far
		jmp	sub_BEA0C
sub_75280	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75285	proc far
		jmp	sub_BD330
sub_75285	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7528A	proc far
		jmp	MissionScenario_ConvertFieldValue_BE154
sub_7528A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7528F	proc far
		jmp	MissionScenario_Helper_BE01E
sub_7528F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75294	proc far
		jmp	MissionScenario_ResolveFieldEntryB_BE16E
sub_75294	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75299	proc far
		jmp	MissionScenario_ResolveFieldChain_BE197
sub_75299	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7529E	proc far
		jmp	sub_BD594
sub_7529E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752A3	proc far
		jmp	sub_BD68B
sub_752A3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752A8	proc far
		jmp	MissionScenario_LoadFromIFF_BD743
sub_752A8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752AD	proc far
		jmp	sub_BD38F
sub_752AD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752B2	proc far
		jmp	sub_BD45E
sub_752B2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752B7	proc far
		jmp	sub_BD54A
sub_752B7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752BC	proc far
		jmp	sub_BE20B
sub_752BC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752C1	proc far
		jmp	sub_BE4C4
sub_752C1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752C6	proc far
		jmp	sub_BE97E
sub_752C6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752CB	proc far
		jmp	sub_BE066
sub_752CB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752D0	proc far
		jmp	MissionScenario_ResolveFieldEntry_BE0FB
sub_752D0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_752D5	proc far
		jmp	sub_BE9FE
sub_752D5	endp
		db 0, 0, 0, 0, 0, 0
stub344		ends
