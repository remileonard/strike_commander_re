stub246		segment	para public 'CODE' use16
		assume cs:stub246
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42FE0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:086Eo
		dw 0			; memswap
		dd 855A0h		; fileoff
		dw 363h			; codesize
		dw 24h			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_43000	proc far
		jmp	sub_C87E0
sub_43000	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_43005	proc far		; DATA XREF: dseg:38A8o
		jmp	sub_C8AC9
sub_43005	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4300A	proc far		; DATA XREF: dseg:3890o
		jmp	sub_C890E
sub_4300A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4300F	proc far		; DATA XREF: dseg:38A4o
		jmp	sub_C8A65
sub_4300F	endp

stub246		ends
