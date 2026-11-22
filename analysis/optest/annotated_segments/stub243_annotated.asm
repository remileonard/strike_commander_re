stub243		segment	para public 'CODE' use16
		assume cs:stub243
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42EE0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0856o
		dw 0			; memswap
		dd 84C70h		; fileoff
		dw 27h			; codesize
		dw 2			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F00	proc far		; DATA XREF: dseg:37AAo
		jmp	sub_C7F20
sub_42F00	endp

stub243		ends
