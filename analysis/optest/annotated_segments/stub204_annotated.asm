stub204		segment	para public 'CODE' use16
		assume cs:stub204
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42510	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:071Eo
		dw 0			; memswap
		dd 4EAF0h		; fileoff
		dw 37D9h		; codesize
		dw 308h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42530	proc far		; CODE XREF: sub_4ABE0:loc_4AC94P
		jmp	sub_94A30
sub_42530	endp

stub204		ends
