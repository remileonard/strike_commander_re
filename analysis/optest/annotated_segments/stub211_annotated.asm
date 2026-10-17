stub211		segment	para public 'CODE' use16
		assume cs:stub211
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42660	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0756o
		dw 0			; memswap
		dd 7A420h		; fileoff
		dw 10F1h		; codesize
		dw 130h			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42680	proc far		; DATA XREF: dseg:29EAo sub_BDE10+F99o
		jmp	sub_BEE6A
sub_42680	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42685	proc far		; DATA XREF: sub_BDE10+78Do
		jmp	sub_BEE19
sub_42685	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4268A	proc far		; CODE XREF: sub_4A239+17DP
					; sub_4ABE0+137P ...
		jmp	sub_BDE10
sub_4268A	endp

stub211		ends
