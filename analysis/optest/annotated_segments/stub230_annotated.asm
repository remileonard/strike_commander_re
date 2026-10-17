stub230		segment	para public 'CODE' use16
		assume cs:stub230
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42C30	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07EEo
		dw 0			; memswap
		dd 81C20h		; fileoff
		dw 6B4h			; codesize
		dw 40h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42C50	proc far		; CODE XREF: sub_C5EB6+CAP
		jmp	sub_C50C0
sub_42C50	endp

stub230		ends
