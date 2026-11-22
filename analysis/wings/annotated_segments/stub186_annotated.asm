stub186		segment	para public 'CODE' use16
		assume cs:stub186
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_58A70	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 5F70h		; fileoff
		dw 1E67h		; codesize
		dw 224h		; relsize
		dw 12h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A90	proc far
		jmp	sub_685A8
sub_58A90	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A95	proc far
		jmp	StreamReader_DestructWrapper_68599
sub_58A95	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A9A	proc far
		jmp	sub_68561
sub_58A9A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58A9F	proc far
		jmp	sub_66770
sub_58A9F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AA4	proc far
		jmp	sub_66885
sub_58AA4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AA9	proc far
		jmp	sub_66A85
sub_58AA9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AAE	proc far
		jmp	sub_66CAC
sub_58AAE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AB3	proc far
		jmp	Gameflow_PlayConversation_6719B
sub_58AB3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AB8	proc far
		jmp	Gameflow_PlayMidgame_6741E
sub_58AB8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58ABD	proc far
		jmp	sub_67591
sub_58ABD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AC2	proc far
		jmp	Gameflow_ReadMisn2Op_67CD9
sub_58AC2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AC7	proc far
		jmp	sub_6816B
sub_58AC7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58ACC	proc far
		jmp	Gameflow_WriteOp2Misn_681AA
sub_58ACC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AD1	proc far
		jmp	sub_68559
sub_58AD1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AD6	proc far
		jmp	sub_67259
sub_58AD6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58ADB	proc far
		jmp	sub_67294
sub_58ADB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AE0	proc far
		jmp	sub_67305
sub_58AE0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_58AE5	proc far
		jmp	sub_66C75
sub_58AE5	endp
		db 0, 0, 0, 0, 0, 0
stub186		ends
