stub236		segment	para public 'CODE' use16
		assume cs:stub236
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_72F30	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6E50h		; fileoff
		dw 118Fh		; codesize
		dw 0BCh		; relsize
		dw 15h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F50	proc far
		jmp	AircraftDamageModel_ReleaseStreamAndDestruct_85499
sub_72F50	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F55	proc far
		jmp	sub_85454
sub_72F55	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F5A	proc far
		jmp	sub_8540F
sub_72F5A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F5F	proc far
		jmp	sub_853CA
sub_72F5F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F64	proc far
		jmp	sub_85361
sub_72F64	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F69	proc far
		jmp	sub_8530A
sub_72F69	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F6E	proc far
		jmp	sub_852C5
sub_72F6E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F73	proc far
		jmp	sub_85280
sub_72F73	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F78	proc far
		jmp	sub_85229
sub_72F78	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F7D	proc far
		jmp	sub_851E4
sub_72F7D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F82	proc far
		jmp	sub_8519F
sub_72F82	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F87	proc far
		jmp	sub_8515A
sub_72F87	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F8C	proc far
		jmp	sub_85115
sub_72F8C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F91	proc far
		jmp	sub_843EA
sub_72F91	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F96	proc far
		jmp	sub_849F2
sub_72F96	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72F9B	proc far
		jmp	sub_84B24
sub_72F9B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FA0	proc far
		jmp	sub_84AA0
sub_72FA0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FA5	proc far
		jmp	sub_84CDA
sub_72FA5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FAA	proc far
		jmp	sub_84CE8
sub_72FAA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FAF	proc far
		jmp	sub_84340
sub_72FAF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_72FB4	proc far
		jmp	sub_84F79
sub_72FB4	endp
		db 0, 0, 0, 0, 0, 0, 0
stub236		ends
