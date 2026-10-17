stub190		segment	para public 'CODE' use16
		assume cs:stub190
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_420F0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06AEo
		dw 0			; memswap
		dd 0BB40h		; fileoff
		dw 473Bh		; codesize
		dw 288h			; relsize
		dw 18			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42110	proc far		; DATA XREF: dseg:0EC7o
		jmp	sub_599BB
sub_42110	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42115	proc far		; DATA XREF: dseg:0EC3o
		jmp	sub_5997F
sub_42115	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4211A	proc far
		jmp	sub_598FC
sub_4211A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4211F	proc far		; CODE XREF: sub_3D2E+224P
		jmp	sub_597B2
sub_4211F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42124	proc far
		jmp	sub_552E0
sub_42124	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42129	proc far
		jmp	sub_55431
sub_42129	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4212E	proc far
		jmp	sub_58E74
sub_4212E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42133	proc far
		jmp	sub_58E2A
sub_42133	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42138	proc far
		jmp	sub_56366
sub_42138	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4213D	proc far
		jmp	sub_56B04
sub_4213D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42142	proc far
		jmp	sub_57FDA
sub_42142	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42147	proc far
		jmp	sub_55C92
sub_42147	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4214C	proc far
		jmp	sub_584BD
sub_4214C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42151	proc far
		jmp	sub_58A9D
sub_42151	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42156	proc far
		jmp	sub_55BDC
sub_42156	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4215B	proc far
		jmp	sub_55C7B
sub_4215B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42160	proc far
		jmp	sub_5547D
sub_42160	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42165	proc far
		jmp	sub_58EEA
sub_42165	endp

stub190		ends
