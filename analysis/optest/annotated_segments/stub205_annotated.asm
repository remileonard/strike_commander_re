stub205		segment	para public 'CODE' use16
		assume cs:stub205
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42540	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0726o
		dw 0			; memswap
		dd 525E0h		; fileoff
		dw 5E69h		; codesize
		dw 56Ah			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42560	proc far		; CODE XREF: Gameflow_PlayMidgame_4ABE0+CEP
		jmp	sub_98210
sub_42560	endp

stub205		ends
