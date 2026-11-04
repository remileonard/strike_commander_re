stub221		segment	para public 'CODE' use16
		assume cs:stub221
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_481E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 6FAF0h		; fileoff
		dw 0BA4h		; codesize
		dw 0A4h		; relsize
		dw 10h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48200	proc far
		jmp	sub_B9C3C
sub_48200	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48205	proc far
		jmp	sub_B90C0
sub_48205	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4820A	proc far
		jmp	sub_B912E
sub_4820A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4820F	proc far
		jmp	sub_B95AD
sub_4820F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48214	proc far
		jmp	sub_B996B
sub_48214	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48219	proc far
		jmp	sub_B9AB8
sub_48219	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4821E	proc far
		jmp	sub_B97CF
sub_4821E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48223	proc far
		jmp	sub_B9849
sub_48223	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48228	proc far
		jmp	sub_B9B5D
sub_48228	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4822D	proc far
		jmp	sub_B9BC5
sub_4822D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48232	proc far
		jmp	sub_B96E5
sub_48232	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48237	proc far
		jmp	sub_B9197
sub_48237	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4823C	proc far
		jmp	sub_B9298
sub_4823C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48241	proc far
		jmp	sub_B919F
sub_48241	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_48246	proc far
		jmp	sub_B92FB
sub_48246	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_4824B	proc far
		jmp	sub_B944B
sub_4824B	endp
stub221		ends
