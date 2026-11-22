stub231		segment	para public 'CODE' use16
		assume cs:stub231
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42C60	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07F6o
		dw 0			; memswap
		dd 82320h		; fileoff
		dw 1CBh			; codesize
		dw 1Eh			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42C80	proc far		; CODE XREF: sub_C5950+6FP
		jmp	sub_C5780
sub_42C80	endp

stub231		ends
