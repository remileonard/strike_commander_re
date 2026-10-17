stub200		segment	para public 'CODE' use16
		assume cs:stub200
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42450	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06FEo
		dw 0			; memswap
		dd 2EEF0h		; fileoff
		dw 0AB7Ch		; codesize
		dw 992h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42470	proc far		; CODE XREF: sub_4ABE0+67P
		jmp	sub_768F0
sub_42470	endp

stub200		ends
