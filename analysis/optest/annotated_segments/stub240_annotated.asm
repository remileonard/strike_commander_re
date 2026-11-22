stub240		segment	para public 'CODE' use16
		assume cs:stub240
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42E10	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:083Eo
		dw 0			; memswap
		dd 82FE0h		; fileoff
		dw 0C1Eh		; codesize
		dw 5Ch			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42E30	proc far		; DATA XREF: dseg:2FDEo
		jmp	sub_C6390
sub_42E30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42E35	proc far		; CODE XREF: seg039:0E61P
		jmp	sub_C658C
sub_42E35	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42E3A	proc far		; DATA XREF: dseg:37D6o
		jmp	sub_C6E6A
sub_42E3A	endp

stub240		ends
