stub212		segment	para public 'CODE' use16
		assume cs:stub212
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42690	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:075Eo
		dw 0			; memswap
		dd 7B650h		; fileoff
		dw 1A0h			; codesize
		dw 16h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_426B0	proc far		; CODE XREF: sub_E52D+22FP
		jmp	sub_BEF10
sub_426B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_426B5	proc far		; CODE XREF: sub_E77F+14AP
		jmp	sub_BEFD9
sub_426B5	endp

stub212		ends
