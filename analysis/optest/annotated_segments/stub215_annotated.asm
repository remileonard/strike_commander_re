stub215		segment	para public 'CODE' use16
		assume cs:stub215
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_427E0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0776o
		dw 0			; memswap
		dd 7CD60h		; fileoff
		dw 9D7h			; codesize
		dw 3Ah			; relsize
		dw 5			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42800	proc far		; DATA XREF: dseg:2EB2o dseg:2EC6o ...
		jmp	sub_C0F22
sub_42800	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42805	proc far		; DATA XREF: dseg:2E9Eo
		jmp	sub_C0EF5
sub_42805	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4280A	proc far		; DATA XREF: sub_C0550+400o
					; sub_C0550+421o ...
		jmp	sub_C0ECC
sub_4280A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4280F	proc far		; CODE XREF: sub_C295B+84P
		jmp	sub_C0550
sub_4280F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42814	proc far
		jmp	sub_C0AC8
sub_42814	endp

stub215		ends
