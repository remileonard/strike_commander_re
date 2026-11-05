stub342		segment	para public 'CODE' use16
		assume cs:stub342
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75140	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3FA10h		; fileoff
		dw 0DFCh		; codesize
		dw 96h		; relsize
		dw 15h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75160	proc far
		jmp	sub_BB649
sub_75160	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75165	proc far
		jmp	sub_BB609
sub_75165	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7516A	proc far
		jmp	sub_BA8A0
sub_7516A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7516F	proc far
		jmp	sub_BAEB3
sub_7516F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75174	proc far
		jmp	sub_BADC7
sub_75174	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75179	proc far
		jmp	sub_BAD4F
sub_75179	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7517E	proc far
		jmp	sub_BAE1C
sub_7517E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75183	proc far
		jmp	sub_BABC2
sub_75183	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75188	proc far
		jmp	sub_BAAAE
sub_75188	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7518D	proc far
		jmp	TextCycler_ReleaseResource_BB01A
sub_7518D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75192	proc far
		jmp	sub_BB048
sub_75192	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75197	proc far
		jmp	sub_BB144
sub_75197	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7519C	proc far
		jmp	sub_BB244
sub_7519C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751A1	proc far
		jmp	sub_BB331
sub_751A1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751A6	proc far
		jmp	sub_BB1A4
sub_751A6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751AB	proc far
		jmp	sub_BB407
sub_751AB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751B0	proc far
		jmp	sub_BB46A
sub_751B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751B5	proc far
		jmp	sub_BB506
sub_751B5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751BA	proc far
		jmp	sub_BB541
sub_751BA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751BF	proc far
		jmp	sub_BB583
sub_751BF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_751C4	proc far
		jmp	TextCycler_ReleaseResource_BB5DB
sub_751C4	endp
		db 0, 0, 0, 0, 0, 0, 0
stub342		ends
