stub225		segment	para public 'CODE' use16
		assume cs:stub225
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42B40	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07C6o
		dw 0			; memswap
		dd 80570h		; fileoff
		dw 455h			; codesize
		dw 48h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B60	proc far		; CODE XREF: seg046:0264P
		jmp	sub_C3F07
sub_42B60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B65	proc far
		jmp	sub_C3AD0
sub_42B65	endp

stub225		ends
