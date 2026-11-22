stub227		segment	para public 'CODE' use16
		assume cs:stub227
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42BA0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07D6o
		dw 0			; memswap
		dd 80E70h		; fileoff
		dw 6C5h			; codesize
		dw 48h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42BC0	proc far		; CODE XREF: sub_C5950+3FP
		jmp	sub_C4390
sub_42BC0	endp

stub227		ends
