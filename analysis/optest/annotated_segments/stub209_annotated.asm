stub209		segment	para public 'CODE' use16
		assume cs:stub209
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42600	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0746o
		dw 0			; memswap
		dd 72FC0h		; fileoff
		dw 6DCAh		; codesize
		dw 62Eh			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42620	proc near		; CODE XREF: Gameflow_PlayMidgame_4ABE0+12DP
		jmp	far ptr	loc_B6FF0
sub_42620	endp

stub209		ends
