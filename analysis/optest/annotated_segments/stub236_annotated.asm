stub236		segment	para public 'CODE' use16
		assume cs:stub236
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42D50	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:081Eo
		dw 0			; memswap
		dd 82C60h		; fileoff
		dw 164h			; codesize
		dw 0Ah			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42D70	proc far		; CODE XREF: sub_C5EB6+DBP
		jmp	sub_C6030
sub_42D70	endp

stub236		ends
