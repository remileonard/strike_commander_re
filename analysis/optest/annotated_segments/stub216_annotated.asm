stub216		segment	para public 'CODE' use16
		assume cs:stub216
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42820	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:077Eo
		dw 0			; memswap
		dd 7D780h		; fileoff
		dw 8BDh			; codesize
		dw 36h			; relsize
		dw 21			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42840	proc far		; DATA XREF: dseg:3253o
		jmp	sub_C17B8
sub_42840	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42845	proc far		; DATA XREF: dseg:324Fo dseg:3263o
		jmp	sub_C17B0
sub_42845	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4284A	proc far
		jmp	MissionText_ApplyDualStyle_C0F30
sub_4284A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4284F	proc far		; DATA XREF: dseg:3243o dseg:3257o
		jmp	sub_C0FBC
sub_4284F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42854	proc far		; DATA XREF: dseg:324Bo dseg:325Fo
		jmp	sub_C0FE2
sub_42854	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42859	proc far		; DATA XREF: dseg:3267o
		jmp	sub_C1008
sub_42859	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4285E	proc far
		jmp	sub_C1056
sub_4285E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42863	proc far
		jmp	sub_C147E
sub_42863	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42868	proc far
		jmp	MissionText_Helper4_C14F9
sub_42868	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4286D	proc far
		jmp	sub_C157F
sub_4286D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42872	proc far		; CODE XREF: sub_C02D0+68P
		jmp	sub_C1537
sub_42872	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42877	proc far
		jmp	MissionText_Helper5_C1512
sub_42877	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4287C	proc far
		jmp	sub_C10AF
sub_4287C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42881	proc far
		jmp	sub_C110F
sub_42881	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42886	proc far
		jmp	sub_C1155
sub_42886	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4288B	proc far
		jmp	sub_C1213
sub_4288B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42890	proc far		; CODE XREF: sub_BFBCE+76P
		jmp	sub_C11E4
sub_42890	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42895	proc far		; DATA XREF: dseg:2DACo
		jmp	sub_C13D5
sub_42895	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4289A	proc far		; DATA XREF: dseg:2DB0o
		jmp	sub_C1460
sub_4289A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4289F	proc far		; DATA XREF: dseg:2DB4o
		jmp	sub_C1365
sub_4289F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428A4	proc far		; DATA XREF: dseg:2DB8o
		jmp	sub_C1387
sub_428A4	endp

stub216		ends
