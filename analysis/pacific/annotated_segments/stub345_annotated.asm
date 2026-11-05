stub345		segment	para public 'CODE' use16
		assume cs:stub345
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_752E0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 43FD0h		; fileoff
		dw 13C4h		; codesize
		dw 0C4h		; relsize
		dw 2Bh			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75300	proc far
		jmp	ExprSlot_ReleaseObjectAndFree_BFDED
sub_75300	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75305	proc far
		jmp	ExprSlot_Helper10_BFDDE
sub_75305	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7530A	proc far
		jmp	ProgBuffer_ResetState_BF8C0
sub_7530A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7530F	proc far
		jmp	ProgBuffer_ResetAndSetSize_BF8D3
sub_7530F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75314	proc far
		jmp	sub_BF8E9
sub_75314	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75319	proc far
		jmp	sub_BF959
sub_75319	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7531E	proc far
		jmp	sub_BEA50
sub_7531E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75323	proc far
		jmp	sub_BEAE9
sub_75323	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75328	proc far
		jmp	sub_BEB65
sub_75328	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7532D	proc far
		jmp	sub_BEC90
sub_7532D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75332	proc far
		jmp	sub_BED37
sub_75332	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75337	proc far
		jmp	sub_BED4A
sub_75337	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7533C	proc far
		jmp	ExprSlot_ReleaseArray_BEEFA
sub_7533C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75341	proc far
		jmp	sub_BFCAD
sub_75341	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75346	proc far
		jmp	sub_BFCC3
sub_75346	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7534B	proc far
		jmp	sub_BFDAE
sub_7534B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75350	proc far
		jmp	sub_BF758
sub_75350	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75355	proc far
		jmp	sub_BF76B
sub_75355	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7535A	proc far
		jmp	Member_ClearAndFree_BF7C1
sub_7535A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7535F	proc far
		jmp	sub_BF694
sub_7535F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75364	proc far
		jmp	sub_BF6AA
sub_75364	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75369	proc far
		jmp	sub_BF728
sub_75369	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7536E	proc far
		jmp	sub_BEF64
sub_7536E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75373	proc far
		jmp	ExprSlot_ReleaseSingle_BF062
sub_75373	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75378	proc far
		jmp	sub_BF382
sub_75378	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7537D	proc far
		jmp	sub_BF3D5
sub_7537D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75382	proc far
		jmp	MissionScenario_DispatchDecodeA_BF56D
sub_75382	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75387	proc far
		jmp	sub_BF5E8
sub_75387	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7538C	proc far
		jmp	MissionScenario_DispatchWrapper_BF664
sub_7538C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75391	proc far
		jmp	sub_BF7E3
sub_75391	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_75396	proc far
		jmp	sub_BF7F9
sub_75396	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_7539B	proc far
		jmp	sub_BF890
sub_7539B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753A0	proc far
		jmp	sub_BF981
sub_753A0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753A5	proc far
		jmp	ExprSlot_ReleaseObjectB_BFA85
sub_753A5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753AA	proc far
		jmp	MissionScenario_ResolveMultipleFields_BFAA8
sub_753AA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753AF	proc far
		jmp	ExprSlot_Helper7_BFB57
sub_753AF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753B4	proc far
		jmp	ExprSlot_Helper8_BFB6A
sub_753B4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753B9	proc far
		jmp	sub_BFB80
sub_753B9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753BE	proc far
		jmp	MissionScenario_Helper_BFC81
sub_753BE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753C3	proc far
		jmp	MissionScenario_DecodeFieldA_BF099
sub_753C3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753C8	proc far
		jmp	MissionScenario_DecodeFieldB_BF15D
sub_753C8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753CD	proc far
		jmp	MissionScenario_LoadAndDecodeField_BF248
sub_753CD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_753D2	proc far
		jmp	ExprSlot_WriteFieldGroup_BF2EB
sub_753D2	endp
		db 0, 0, 0, 0, 0, 0, 0, 0, 0
stub345		ends
