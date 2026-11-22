stub234		segment	para public 'CODE' use16
		assume cs:stub234
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42CF0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:080Eo
		dw 0			; memswap
		dd 82890h		; fileoff
		dw 1BDh			; codesize
		dw 30h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42D10	proc far		; CODE XREF: seg046:020CP
		jmp	sub_C5CA0
sub_42D10	endp

stub234		ends
