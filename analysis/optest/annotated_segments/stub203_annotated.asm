stub203		segment	para public 'CODE' use16
		assume cs:stub203
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_424E0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0716o
		dw 0			; memswap
		dd 44F00h		; fileoff
		dw 93FFh		; codesize
		dw 7E2h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42500	proc far		; CODE XREF: sub_4ABE0+A9P
		jmp	sub_8B630
sub_42500	endp

stub203		ends
