stub207		segment	para public 'CODE' use16
		assume cs:stub207
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_425A0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0736o
		dw 0			; memswap
		dd 5EAB0h		; fileoff
		dw 0BF51h		; codesize
		dw 0AD2h		; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_425C0	proc far		; CODE XREF: sub_4ABE0+10AP
		jmp	sub_A3C30
sub_425C0	endp

stub207		ends
