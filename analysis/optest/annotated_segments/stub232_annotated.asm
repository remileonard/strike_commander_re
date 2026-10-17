stub232		segment	para public 'CODE' use16
		assume cs:stub232
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42C90	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07FEo
		dw 0			; memswap
		dd 82510h		; fileoff
		dw 172h			; codesize
		dw 20h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42CB0	proc far		; CODE XREF: sub_1B3D1+68P
		jmp	sub_C5950
sub_42CB0	endp

stub232		ends
