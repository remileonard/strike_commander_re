stub351		segment	para public 'CODE' use16
		assume cs:stub351
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_75540	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 47760h		; fileoff
		dw 2505h		; codesize
		dw 2CEh		; relsize
		dw 16h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75560	proc far
		jmp	sub_C43C5
sub_75560	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75565	proc far
		jmp	sub_C43B8
sub_75565	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7556A	proc far
		jmp	sub_C43AB
sub_7556A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7556F	proc far
		jmp	sub_C439E
sub_7556F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75574	proc far
		jmp	sub_C4394
sub_75574	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75579	proc far
		jmp	sub_C2264
sub_75579	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7557E	proc far
		jmp	sub_C234E
sub_7557E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75583	proc far
		jmp	sub_C23E6
sub_75583	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75588	proc far
		jmp	Debris_GetSubpartAttrib_C23FE
sub_75588	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7558D	proc far
		jmp	sub_C240E
sub_7558D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75592	proc far
		jmp	ConvData_LoadByName_C27EC
sub_75592	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75597	proc far
		jmp	sub_C2804
sub_75597	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7559C	proc far
		jmp	ConvData_LoadByName_C2834
sub_7559C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755A1	proc far
		jmp	sub_C284C
sub_755A1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755A6	proc far
		jmp	sub_C287C
sub_755A6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755AB	proc far
		jmp	sub_C257F
sub_755AB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755B0	proc far
		jmp	sub_C29CD
sub_755B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755B5	proc far
		jmp	sub_C1F30
sub_755B5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755BA	proc far
		jmp	sub_C20F5
sub_755BA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755BF	proc far
		jmp	sub_C2045
sub_755BF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755C4	proc far
		jmp	sub_C21A4
sub_755C4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_755C9	proc far
		jmp	Conv_PlayScript_C2ED0
sub_755C9	endp
		db 0, 0
stub351		ends
