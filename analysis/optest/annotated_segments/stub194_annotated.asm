stub194		segment	para public 'CODE' use16
		assume cs:stub194
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_422E0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06CEo
		dw 0			; memswap
		dd 15AE0h		; fileoff
		dw 388h			; codesize
		dw 22h			; relsize
		dw 6			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42300	proc far
		jmp	sub_5EE7C
sub_42300	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42305	proc far
		jmp	sub_5EB20
sub_42305	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4230A	proc far		; CODE XREF: seg062:0034P
		jmp	sub_5EB69
sub_4230A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4230F	proc far
		jmp	sub_5EB7C
sub_4230F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42314	proc far		; CODE XREF: sub_28EDF+1AP
					; seg062:0679P
		jmp	sub_5EDD0
sub_42314	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42319	proc far		; CODE XREF: seg062:0240P seg062:025FP
		jmp	sub_5ED94
sub_42319	endp

stub194		ends
