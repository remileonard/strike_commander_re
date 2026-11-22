stub238		segment	para public 'CODE' use16
		assume cs:stub238
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42DB0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:082Eo
		dw 0			; memswap
		dd 82E30h		; fileoff
		dw 67h			; codesize
		dw 6			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42DD0	proc far		; CODE XREF: sub_C5950+139P
		jmp	sub_C61F0
sub_42DD0	endp

stub238		ends
