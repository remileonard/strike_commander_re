stub239		segment	para public 'CODE' use16
		assume cs:stub239
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73060	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 0A780h		; fileoff
		dw 1FBBh		; codesize
		dw 80h		; relsize
		dw 0Ch			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73080	proc far
		jmp	sub_89A21
sub_73080	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73085	proc far
		jmp	AI_ManeuverHelper2_89A13
sub_73085	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7308A	proc far
		jmp	AI_ManeuverCleanup_89998
sub_7308A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7308F	proc far
		jmp	sub_89990
sub_7308F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73094	proc far
		jmp	AIManeuver_LoadFormationData_87B18
sub_73094	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73099	proc far
		jmp	AIManeuver_Helper_87D45
sub_73099	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7309E	proc far
		jmp	AIManeuver_LoadFormationDataB_87C6A
sub_7309E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_730A3	proc far
		jmp	AIManeuver_AllocateField_87A70
sub_730A3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_730A8	proc far
		jmp	AIManeuver_Helper3_87E2E
sub_730A8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_730AD	proc far
		jmp	AIManeuver_Helper4_87E5C
sub_730AD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_730B2	proc far
		jmp	sub_87E70
sub_730B2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_730B7	proc far
		jmp	sub_87E24
sub_730B7	endp
		db 0, 0, 0, 0
stub239		ends
