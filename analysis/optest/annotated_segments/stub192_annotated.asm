stub192		segment	para public 'CODE' use16
		assume cs:stub192
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42240	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06BEo
		dw 0			; memswap
		dd 13ED0h		; fileoff
		dw 10BEh		; codesize
		dw 0C4h			; relsize
		dw 10			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42260	proc far		; DATA XREF: dseg:13EDo
		jmp	sub_5E144
sub_42260	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42265	proc far		; DATA XREF: dseg:13E5o
		jmp	sub_5E131
sub_42265	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4226A	proc far		; DATA XREF: dseg:13E1o
		jmp	sub_5E11E
sub_4226A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4226F	proc far		; CODE XREF: sub_3166+2EP
		jmp	sub_5D287
sub_4226F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42274	proc far		; CODE XREF: seg007:0211P
		jmp	sub_5DC96
sub_42274	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42279	proc far		; DATA XREF: dseg:13A8o
		jmp	sub_5DD1E
sub_42279	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4227E	proc far		; CODE XREF: seg063:01A7P
		jmp	sub_5DBD7
sub_4227E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42283	proc far
		jmp	sub_5D0C0
sub_42283	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42288	proc far
		jmp	sub_5D135
sub_42288	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4228D	proc far
		jmp	sub_5DD30
sub_4228D	endp

stub192		ends
