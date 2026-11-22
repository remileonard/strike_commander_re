stub221		segment	para public 'CODE' use16
		assume cs:stub221
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42A10	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07A6o
		dw 0			; memswap
		dd 7F560h		; fileoff
		dw 40Dh			; codesize
		dw 42h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42A30	proc far		; DATA XREF: dseg:3378o
		jmp	sub_C2F81
sub_42A30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42A35	proc far		; CODE XREF: sub_21BA2+31P
					; seg051:0401P
		jmp	sub_C2BC0
sub_42A35	endp

stub221		ends
