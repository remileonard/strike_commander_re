stub263		segment	para public 'CODE' use16
		assume cs:stub263
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_73990	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 224D0h		; fileoff
		dw 244Bh		; codesize
		dw 220h		; relsize
		dw 11h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739B0	proc far
		jmp	sub_A0B73
sub_739B0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739B5	proc far
		jmp	sub_A0ADF
sub_739B5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739BA	proc far
		jmp	sub_A09BD
sub_739BA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739BF	proc far
		jmp	sub_A08AE
sub_739BF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739C4	proc far
		jmp	sub_9EADA
sub_739C4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739C9	proc far
		jmp	sub_A0806
sub_739C9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739CE	proc far
		jmp	sub_A083E
sub_739CE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739D3	proc far
		jmp	sub_A0876
sub_739D3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739D8	proc far
		jmp	sub_9E780
sub_739D8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739DD	proc far
		jmp	sub_9E932
sub_739DD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739E2	proc far
		jmp	sub_9E789
sub_739E2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739E7	proc far
		jmp	sub_9E7E1
sub_739E7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739EC	proc far
		jmp	sub_9E846
sub_739EC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739F1	proc far
		jmp	sub_9E85F
sub_739F1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739F6	proc far
		jmp	sub_9E999
sub_739F6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_739FB	proc far
		jmp	sub_9EAAF
sub_739FB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_73A00	proc far
		jmp	sub_9E9DB
sub_73A00	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stub263		ends
