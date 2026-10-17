stub208		segment	para public 'CODE' use16
		assume cs:stub208
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_425D0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:073Eo
		dw 0			; memswap
		dd 6B4E0h		; fileoff
		dw 7460h		; codesize
		dw 678h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_425F0	proc far		; CODE XREF: sub_4ABE0:loc_4ACF4P
		jmp	sub_AFB90
sub_425F0	endp

stub208		ends
