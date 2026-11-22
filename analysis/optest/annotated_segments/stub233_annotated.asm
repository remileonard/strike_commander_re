stub233		segment	para public 'CODE' use16
		assume cs:stub233
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42CC0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0806o
		dw 0			; memswap
		dd 826B0h		; fileoff
		dw 1CDh			; codesize
		dw 0Ch			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42CE0	proc far		; CODE XREF: sub_1B3D1+DFP
		jmp	sub_C5AD0
sub_42CE0	endp

stub233		ends
