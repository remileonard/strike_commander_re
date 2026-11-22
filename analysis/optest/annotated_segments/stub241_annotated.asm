stub241		segment	para public 'CODE' use16
		assume cs:stub241
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42E40	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0846o
		dw 0			; memswap
		dd 83C60h		; fileoff
		dw 423h			; codesize
		dw 20h			; relsize
		dw 5			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42E60	proc far
		jmp	UI_DrawRect
sub_42E60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42E65	proc far		; CODE XREF: sub_22487+1FFP
		jmp	sub_C6FD6
sub_42E65	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42E6A	proc far		; CODE XREF: sub_22487+2CAP
		jmp	sub_C71C1
sub_42E6A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42E6F	proc far		; CODE XREF: seg046:0016P
		jmp	sub_C72E4
sub_42E6F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42E74	proc far
		jmp	sub_C7219
sub_42E74	endp

stub241		ends
