stub239		segment	para public 'CODE' use16
		assume cs:stub239
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42DE0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0836o
		dw 0			; memswap
		dd 82EA0h		; fileoff
		dw 12Ch			; codesize
		dw 0Ch			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42E00	proc far		; CODE XREF: sub_C5950+15DP
		jmp	sub_C6260
sub_42E00	endp

stub239		ends
