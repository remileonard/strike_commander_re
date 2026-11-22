stub213		segment	para public 'CODE' use16
		assume cs:stub213
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_426C0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0766o
		dw 0			; memswap
		dd 7B810h		; fileoff
		dw 979h			; codesize
		dw 40h			; relsize
		dw 10			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_426E0	proc far
		jmp	sub_BF945
sub_426E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_426E5	proc far
		jmp	sub_BF35F
sub_426E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_426EA	proc far
		jmp	sub_BF164
sub_426EA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_426EF	proc far
		jmp	sub_BF3ED
sub_426EF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_426F4	proc far
		jmp	sub_BF0C8
sub_426F4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_426F9	proc far
		jmp	sub_BF8C6
sub_426F9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_426FE	proc far
		jmp	sub_BF9B7
sub_426FE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42703	proc far
		jmp	sub_BF0B0
sub_42703	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42708	proc far
		jmp	sub_BF0B8
sub_42708	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4270D	proc far
		jmp	sub_BF0C0
sub_4270D	endp

stub213		ends
