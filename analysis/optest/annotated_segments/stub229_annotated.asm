stub229		segment	para public 'CODE' use16
		assume cs:stub229
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42C00	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07E6o
		dw 0			; memswap
		dd 818F0h		; fileoff
		dw 308h			; codesize
		dw 22h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42C20	proc far		; CODE XREF: sub_1B385+38P
		jmp	sub_C4DB0
sub_42C20	endp

stub229		ends
