stub235		segment	para public 'CODE' use16
		assume cs:stub235
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42D20	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0816o
		dw 0			; memswap
		dd 82A80h		; fileoff
		dw 1C8h			; codesize
		dw 12h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42D40	proc far
		jmp	sub_C5E60
sub_42D40	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42D45	proc far		; CODE XREF: sub_1A1CC+106P
		jmp	sub_C5EB6
sub_42D45	endp

stub235		ends
