stub237		segment	para public 'CODE' use16
		assume cs:stub237
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42D80	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0826o
		dw 0			; memswap
		dd 82DD0h		; fileoff
		dw 4Eh			; codesize
		dw 4			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42DA0	proc far		; CODE XREF: sub_C5950+113P
		jmp	sub_C61A0
sub_42DA0	endp

stub237		ends
