stub184		segment	para public 'CODE' use16
		assume cs:stub184
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_41EF0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0676o
					; seg170:067Eo
		dw 0			; memswap
		dd 0			; fileoff
		dw 2354h		; codesize
		dw 25Ah			; relsize
		dw 15			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F10	proc far		; DATA XREF: dseg:0697o
		jmp	sub_4C463
sub_41F10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F15	proc far		; DATA XREF: dseg:0693o
		jmp	sub_4C450
sub_41F15	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F1A	proc far		; DATA XREF: dseg:067Fo
		jmp	sub_4C40E
sub_41F1A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F1F	proc far		; CODE XREF: sub_3D2E+1C5P
		jmp	sub_4A140
sub_41F1F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F24	proc far		; CODE XREF: sub_3166+192P
		jmp	sub_4A239
sub_41F24	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F29	proc far		; CODE XREF: sub_3D2E+285P
		jmp	sub_4A440
sub_41F29	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F2E	proc far		; CODE XREF: sub_3B0B+2DP
		jmp	sub_4A60B
sub_41F2E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F33	proc far		; CODE XREF: sub_36CF+144P
					; sub_36CF+3A9P ...
		jmp	sub_4AAAB
sub_41F33	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F38	proc far		; CODE XREF: sub_36CF+163P
					; sub_3D2E+C3P
		jmp	sub_4ABE0
sub_41F38	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F3D	proc far		; CODE XREF: sub_4DF4B+58P
					; sub_4F1A7+9AP ...
		jmp	sub_4AB39
sub_41F3D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F42	proc far		; CODE XREF: sub_4C58B+39P
		jmp	sub_4AB79
sub_41F42	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F47	proc far		; CODE XREF: sub_36CF+1ADP
		jmp	sub_4AD86
sub_41F47	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F4C	proc far		; CODE XREF: sub_3D2E+9DP
		jmp	sub_4B544
sub_41F4C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F51	proc far		; CODE XREF: sub_3D2E+2F5P
		jmp	sub_4BBA0
sub_41F51	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F56	proc far		; CODE XREF: sub_3D2E+2FEP
		jmp	sub_4BBF7
sub_41F56	endp

stub184		ends
