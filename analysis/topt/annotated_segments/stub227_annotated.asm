stub227		segment	para public 'CODE' use16
		assume cs:stub227
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_483A0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 714C0h		; fileoff
		dw 65Ah		; codesize
		dw 54h		; relsize
		dw 13h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483C0	proc far
		jmp	sub_BAF5C
sub_483C0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483C5	proc far
		jmp	sub_BAF2E
sub_483C5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483CA	proc far
		jmp	TextCycler_ReleaseEntry_BA940
sub_483CA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483CF	proc far
		jmp	TextCycler_ReleaseBuffer_BAB64
sub_483CF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483D4	proc far
		jmp	sub_BA99A
sub_483D4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483D9	proc far
		jmp	sub_BAA20
sub_483D9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483DE	proc far
		jmp	sub_BAAA0
sub_483DE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483E3	proc far
		jmp	sub_BAB00
sub_483E3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483E8	proc far
		jmp	sub_BAB9E
sub_483E8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483ED	proc far
		jmp	sub_BABC8
sub_483ED	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483F2	proc far
		jmp	sub_BAC5A
sub_483F2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483F7	proc far
		jmp	sub_BACB0
sub_483F7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_483FC	proc far
		jmp	sub_BAD03
sub_483FC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48401	proc far
		jmp	sub_BAD23
sub_48401	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48406	proc far
		jmp	sub_BAD71
sub_48406	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4840B	proc far
		jmp	sub_BADDF
sub_4840B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48410	proc far
		jmp	sub_BAE92
sub_48410	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48415	proc far
		jmp	sub_BAEA2
sub_48415	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4841A	proc far
		jmp	sub_BAEFC
sub_4841A	endp
		db 0
stub227		ends
