stub206		segment	para public 'CODE' use16
		assume cs:stub206
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42570	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:072Eo
		dw 0			; memswap
		dd 589C0h		; fileoff
		dw 5BA7h		; codesize
		dw 540h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42590	proc far		; CODE XREF: sub_4ABE0+EAP
		jmp	sub_9E080
sub_42590	endp

stub206		ends
