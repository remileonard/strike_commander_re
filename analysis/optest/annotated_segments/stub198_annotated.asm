stub198		segment	para public 'CODE' use16
		assume cs:stub198
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_423F0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06EEo
		dw 0			; memswap
		dd 23630h		; fileoff
		dw 5CBAh		; codesize
		dw 534h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42410	proc far		; CODE XREF: sub_4ABE0+42P
		jmp	sub_6B9C0
sub_42410	endp

stub198		ends
