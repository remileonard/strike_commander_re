stub195		segment	para public 'CODE' use16
		assume cs:stub195
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58D50	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0F1E0h		; fileoff
		dw 0A51h		; codesize
		dw 5Eh		; relsize
		dw 1Dh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D70	proc far
		jmp	sub_6FB23
sub_58D70	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D75	proc far
		jmp	sub_6FB19
sub_58D75	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D7A	proc far
		jmp	EntityTracker_EntryConstructObj
sub_58D7A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D7F	proc far
		jmp	sub_6F1A8
sub_58D7F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D84	proc far
		jmp	sub_6F2C0
sub_58D84	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D89	proc far
		jmp	EntityTracker_EntryDestruct
sub_58D89	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D8E	proc far
		jmp	EntityTracker_EntryDestructFull
sub_58D8E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D93	proc far
		jmp	EntityTracker_ClearAllFull
sub_58D93	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D98	proc far
		jmp	sub_6F986
sub_58D98	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58D9D	proc far
		jmp	sub_6FA03
sub_58D9D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DA2	proc far
		jmp	EntityTracker_Destruct
sub_58DA2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DA7	proc far
		jmp	EntityTracker_AddEntryObj
sub_58DA7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DAC	proc far
		jmp	EntityTracker_AddEntryText
sub_58DAC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DB1	proc far
		jmp	EntityTracker_FindByID
sub_58DB1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DB6	proc far
		jmp	sub_6F4C4
sub_58DB6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DBB	proc far
		jmp	sub_6F4FB
sub_58DBB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DC0	proc far
		jmp	sub_6F692
sub_58DC0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DC5	proc far
		jmp	EntityTracker_FindByIDContinue
sub_58DC5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DCA	proc far
		jmp	EntityTracker_RenderByCode
sub_58DCA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DCF	proc far
		jmp	sub_6F5E2
sub_58DCF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DD4	proc far
		jmp	EntityTracker_RemoveByTarget
sub_58DD4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DD9	proc far
		jmp	EntityTracker_ClearAll
sub_58DD9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DDE	proc far
		jmp	EntityTracker_RemoveByTargetUpdateHead
sub_58DDE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DE3	proc far
		jmp	ResourceRecord_WriteFieldWrapper_6F683
sub_58DE3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DE8	proc far
		jmp	EntityTracker_SelectByID
sub_58DE8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DED	proc far
		jmp	sub_6F81C
sub_58DED	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DF2	proc far
		jmp	sub_6F854
sub_58DF2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DF7	proc far
		jmp	Kneeboard_ProcessSelected
sub_58DF7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58DFC	proc far
		jmp	EntityTracker_ResetAndRefresh
sub_58DFC	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub195		ends
