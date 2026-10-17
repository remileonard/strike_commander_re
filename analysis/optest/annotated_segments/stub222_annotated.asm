stub222		segment	para public 'CODE' use16
		assume cs:stub222
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42A40	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07AEo
		dw 0			; memswap
		dd 7F9B0h		; fileoff
		dw 0A6h			; codesize
		dw 0Ch			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42A60	proc far		; DATA XREF: dseg:33ACo
		jmp	sub_C2FD0
sub_42A60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42A65	proc far		; DATA XREF: dseg:33B0o
		jmp	sub_C304B
sub_42A65	endp

stub222		ends
