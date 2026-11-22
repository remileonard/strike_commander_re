stub218		segment	para public 'CODE' use16
		assume cs:stub218
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_48050	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6DCD0h		; fileoff
		dw 0B1Eh		; codesize
		dw 5Ch		; relsize
		dw 1Dh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48070	proc far
		jmp	sub_B7E3A
sub_48070	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48075	proc far
		jmp	sub_B7E2E
sub_48075	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4807A	proc far
		jmp	sub_B7380
sub_4807A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4807F	proc far
		jmp	sub_B7410
sub_4807F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48084	proc far
		jmp	sub_B751E
sub_48084	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48089	proc far
		jmp	sub_B75B1
sub_48089	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4808E	proc far
		jmp	sub_B760D
sub_4808E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48093	proc far
		jmp	sub_B7A66
sub_48093	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48098	proc far
		jmp	sub_B7C96
sub_48098	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4809D	proc far
		jmp	sub_B7D20
sub_4809D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480A2	proc far
		jmp	sub_B7CE5
sub_480A2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480A7	proc far
		jmp	EntityTracker_AddEntryObj
sub_480A7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480AC	proc far
		jmp	EntityTracker_AddEntryText
sub_480AC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480B1	proc far
		jmp	sub_B76E5
sub_480B1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480B6	proc far
		jmp	sub_B7741
sub_480B6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480BB	proc far
		jmp	sub_B777F
sub_480BB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480C0	proc far
		jmp	sub_B7957
sub_480C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480C5	proc far
		jmp	sub_B77BE
sub_480C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480CA	proc far
		jmp	sub_B7830
sub_480CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480CF	proc far
		jmp	sub_B7881
sub_480CF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480D4	proc far
		jmp	sub_B79C1
sub_480D4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480D9	proc far
		jmp	sub_B798D
sub_480D9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480DE	proc far
		jmp	sub_B7A24
sub_480DE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480E3	proc far
		jmp	sub_B7944
sub_480E3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480E8	proc far
		jmp	sub_B7ACF
sub_480E8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480ED	proc far
		jmp	sub_B7B0A
sub_480ED	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480F2	proc far
		jmp	sub_B7B4B
sub_480F2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480F7	proc far
		jmp	sub_B7C20
sub_480F7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_480FC	proc far
		jmp	sub_B7AB2
sub_480FC	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub218		ends
