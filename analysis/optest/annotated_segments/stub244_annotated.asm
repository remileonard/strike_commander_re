stub244		segment	para public 'CODE' use16
		assume cs:stub244
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42F10	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:085Eo
		dw 0			; memswap
		dd 84CA0h		; fileoff
		dw 2D6h			; codesize
		dw 26h			; relsize
		dw 5			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F30	proc far
		jmp	sub_C7F93
sub_42F30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F35	proc far
		jmp	AudioQueue_Helper2_C7F50
sub_42F35	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F3A	proc far
		jmp	sub_C81C4
sub_42F3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F3F	proc far		; CODE XREF: seg062:004EP
		jmp	sub_C7F73
sub_42F3F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42F44	proc far		; CODE XREF: seg062:0284P
		jmp	sub_C80EC
sub_42F44	endp

stub244		ends
