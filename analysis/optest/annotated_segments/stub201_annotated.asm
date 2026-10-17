stub201		segment	para public 'CODE' use16
		assume cs:stub201
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42480	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0706o
		dw 0			; memswap
		dd 3A400h		; fileoff
		dw 6951h		; codesize
		dw 616h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_424A0	proc far		; CODE XREF: sub_4ABE0+84P
		jmp	sub_81470
sub_424A0	endp

stub201		ends
