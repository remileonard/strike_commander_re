stub245		segment	para public 'CODE' use16
		assume cs:stub245
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42F50	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0866o
		dw 0			; memswap
		dd 84FA0h		; fileoff
		dw 5A8h			; codesize
		dw 52h			; relsize
		dw 20			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F70	proc far		; DATA XREF: dseg:2B9Ao
		jmp	sub_C8230
sub_42F70	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F75	proc far
		jmp	InfoWidget_CopyFieldB_C8242
sub_42F75	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F7A	proc far		; DATA XREF: dseg:0808o dseg:083Co
		jmp	sub_C825A
sub_42F7A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F7F	proc far		; DATA XREF: dseg:0758o dseg:078Co ...
		jmp	sub_C826C
sub_42F7F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F84	proc far
		jmp	sub_C82F3
sub_42F84	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F89	proc far		; DATA XREF: dseg:2C7Do dseg:2CB1o
		jmp	sub_C8313
sub_42F89	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F8E	proc far		; DATA XREF: dseg:2C91o
		jmp	sub_C839A
sub_42F8E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F93	proc far		; DATA XREF: dseg:2CC5o
		jmp	sub_C83BA
sub_42F93	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F98	proc far		; DATA XREF: dseg:2D19o dseg:2D4Do
		jmp	sub_C83EB
sub_42F98	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F9D	proc far		; DATA XREF: dseg:2D2Do
		jmp	sub_C8525
sub_42F9D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42FA2	proc far		; DATA XREF: dseg:2D61o
		jmp	sub_C8545
sub_42FA2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42FA7	proc far
		jmp	sub_C8576
sub_42FA7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42FAC	proc far
		jmp	sub_C8595
sub_42FAC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42FB1	proc far
		jmp	InfoWidget_Method_DispatchField2A_C85CB
sub_42FB1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42FB6	proc far
		jmp	sub_C85D8
sub_42FB6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42FBB	proc far
		jmp	sub_C85F1
sub_42FBB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42FC0	proc far
		jmp	sub_C861A
sub_42FC0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42FC5	proc far
		jmp	sub_C8702
sub_42FC5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42FCA	proc far
		jmp	sub_C872C
sub_42FCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42FCF	proc far
		jmp	sub_C87AE
sub_42FCF	endp

stub245		ends
