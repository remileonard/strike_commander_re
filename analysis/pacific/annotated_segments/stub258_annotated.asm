stub258		segment	para public 'CODE' use16
		assume cs:stub258
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73730	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 1C100h		; fileoff
		dw 0E2Ah		; codesize
		dw 0A0h		; relsize
		dw 1Fh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73750	proc far
		jmp	sub_9982C
sub_73750	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73755	proc far
		jmp	EntityTracker_EntryConstructObj
sub_73755	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7375A	proc far
		jmp	EntityTracker_EntryConstructText
sub_7375A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7375F	proc far
		jmp	EntityTracker_RenderEntry
sub_7375F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73764	proc far
		jmp	EntityTracker_EntryDestruct
sub_73764	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73769	proc far
		jmp	EntityTracker_EntryDestructFull
sub_73769	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7376E	proc far
		jmp	sub_99236
sub_7376E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73773	proc far
		jmp	sub_9947A
sub_73773	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73778	proc far
		jmp	sub_994BB
sub_73778	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7377D	proc far
		jmp	sub_99514
sub_7377D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73782	proc far
		jmp	sub_994DF
sub_73782	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73787	proc far
		jmp	EntityTracker_AddEntryObj
sub_73787	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7378C	proc far
		jmp	EntityTracker_AddEntryText
sub_7378C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73791	proc far
		jmp	EntityTracker_FindByID
sub_73791	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73796	proc far
		jmp	sub_98F69
sub_73796	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7379B	proc far
		jmp	sub_98FA0
sub_7379B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737A0	proc far
		jmp	EntityTracker_Init
sub_737A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737A5	proc far
		jmp	EntityTracker_FindByIDContinue
sub_737A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737AA	proc far
		jmp	EntityTracker_RenderByCode
sub_737AA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737AF	proc far
		jmp	sub_99087
sub_737AF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737B4	proc far
		jmp	EntityTracker_RemoveByTarget
sub_737B4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737B9	proc far
		jmp	EntityTracker_ClearAll
sub_737B9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737BE	proc far
		jmp	EntityTracker_RemoveByTargetUpdateHead
sub_737BE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737C3	proc far
		jmp	ResourceRecord_WriteFieldWrapper_99128
sub_737C3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737C8	proc far
		jmp	EntityTracker_SelectByID
sub_737C8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737CD	proc far
		jmp	EntityTracker_SelectByStateCode
sub_737CD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737D2	proc far
		jmp	sub_99332
sub_737D2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737D7	proc far
		jmp	Kneeboard_ProcessSelected
sub_737D7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737DC	proc far
		jmp	sub_99282
sub_737DC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737E1	proc far
		jmp	sub_99710
sub_737E1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_737E6	proc far
		jmp	sub_9979B
sub_737E6	endp
		db 0, 0, 0, 0, 0
stub258		ends
