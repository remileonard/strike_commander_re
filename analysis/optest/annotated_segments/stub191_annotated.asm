stub191		segment	para public 'CODE' use16
		assume cs:stub191
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42170	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06B6o
		dw 0			; memswap
		dd 10520h		; fileoff
		dw 369Dh		; codesize
		dw 2FEh			; relsize
		dw 34			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42190	proc far		; DATA XREF: dseg:1264o
		jmp	sub_5D047
sub_42190	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42195	proc far		; DATA XREF: dseg:1260o
		jmp	sub_5D038
sub_42195	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4219A	proc far		; DATA XREF: dseg:1250o
		jmp	sub_5D029
sub_4219A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4219F	proc far		; DATA XREF: dseg:1248o
		jmp	sub_5D01A
sub_4219F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421A4	proc far		; DATA XREF: dseg:1238o
		jmp	sub_5CFE2
sub_421A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421A9	proc far		; DATA XREF: dseg:1234o
		jmp	sub_5CF9A
sub_421A9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421AE	proc far		; DATA XREF: dseg:1230o
		jmp	sub_5CF77
sub_421AE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421B3	proc far		; DATA XREF: dseg:122Co
		jmp	sub_5CF54
sub_421B3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421B8	proc far		; DATA XREF: dseg:1228o
		jmp	sub_5CF0A
sub_421B8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421BD	proc far		; DATA XREF: dseg:1224o
		jmp	sub_5CEFA
sub_421BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421C2	proc far		; DATA XREF: dseg:1220o
		jmp	sub_5CEEA
sub_421C2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421C7	proc far		; DATA XREF: dseg:121Co
		jmp	sub_5CEDA
sub_421C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421CC	proc far		; DATA XREF: dseg:1218o
		jmp	sub_5CECA
sub_421CC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421D1	proc far		; DATA XREF: dseg:11D8o
		jmp	sub_5CEC2
sub_421D1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421D6	proc far		; DATA XREF: dseg:11D4o dseg:11E4o ...
		jmp	sub_5CE95
sub_421D6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421DB	proc far		; DATA XREF: dseg:11D0o dseg:11E0o ...
		jmp	sub_5CE5F
sub_421DB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421E0	proc far		; DATA XREF: dseg:11C8o
		jmp	sub_5CE57
sub_421E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421E5	proc far		; DATA XREF: dseg:11A0o dseg:11A8o ...
		jmp	sub_5CE4B
sub_421E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421EA	proc far
		jmp	Conv_LoadScriptFromPak_59DAA
sub_421EA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421EF	proc far
		jmp	sub_59E81
sub_421EF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421F4	proc far
		jmp	sub_59F28
sub_421F4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421F9	proc far
		jmp	sub_59F42
sub_421F9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_421FE	proc far
		jmp	Conv_DrawText_59F54
sub_421FE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42203	proc far
		jmp	sub_5A451
sub_42203	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42208	proc far
		jmp	sub_5A46F
sub_42208	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4220D	proc far
		jmp	sub_5A4AA
sub_4220D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42212	proc far
		jmp	sub_5A4C8
sub_42212	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42217	proc far
		jmp	sub_5A225
sub_42217	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4221C	proc far
		jmp	ConvData_LoadBackground_5A4E6
sub_4221C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42221	proc far
		jmp	Conv_Init_59A20
sub_42221	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42226	proc far
		jmp	sub_59C24
sub_42226	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4222B	proc far		; CODE XREF: Gameflow_PlayConversation_4AAAB+48P
		jmp	Conv_Construct_59B67
sub_4222B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42230	proc far		; CODE XREF: Gameflow_PlayConversation_4AAAB+83P
		jmp	sub_59CDE
sub_42230	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42235	proc far		; CODE XREF: Gameflow_PlayConversation_4AAAB+67P
		jmp	Conv_PlayScript_5AA4E
sub_42235	endp

stub191		ends
