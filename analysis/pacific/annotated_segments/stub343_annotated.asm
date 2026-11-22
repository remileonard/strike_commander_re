stub343		segment	para public 'CODE' use16
		assume cs:stub343
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_751D0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 408B0h		; fileoff
		dw 1C8Eh		; codesize
		dw 19Eh		; relsize
		dw 14h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751F0	proc far
		jmp	sub_BD329
sub_751F0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751F5	proc far
		jmp	sub_BD30D
sub_751F5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751FA	proc far
		jmp	sub_BD306
sub_751FA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751FF	proc far
		jmp	sub_BC892
sub_751FF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75204	proc far
		jmp	sub_BD09E
sub_75204	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75209	proc far
		jmp	sub_BBE39
sub_75209	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7520E	proc far
		jmp	MissionLoader_SpawnEntity_BC305
sub_7520E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75213	proc far
		jmp	sub_BC0C9
sub_75213	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75218	proc far
		jmp	TextScrollDisplayB_TickHelper_BC475
sub_75218	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7521D	proc far
		jmp	World_LoadLGHTChunk_BC1F7
sub_7521D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75222	proc far
		jmp	World_LoadSmokeSet_BC488
sub_75222	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75227	proc far
		jmp	sub_BC52D
sub_75227	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7522C	proc far
		jmp	sub_BC590
sub_7522C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75231	proc far
		jmp	sub_BC6E1
sub_75231	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75236	proc far
		jmp	sub_BB76A
sub_75236	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7523B	proc far
		jmp	sub_BBB05
sub_7523B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75240	proc far
		jmp	sub_BB6A0
sub_75240	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75245	proc far
		jmp	MissionLoader_ReleaseRosterAndDestruct_BC7D7
sub_75245	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7524A	proc far
		jmp	sub_BC7FB
sub_7524A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7524F	proc far
		jmp	sub_BD2EF
sub_7524F	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub343		ends
