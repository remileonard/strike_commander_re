stub202		segment	para public 'CODE' use16
		assume cs:stub202
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_424B0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:070Eo
		dw 0			; memswap
		dd 41370h		; fileoff
		dw 385Eh		; codesize
		dw 32Ah			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_424D0	proc far		; CODE XREF: Gameflow_PlayMidgame_4ABE0:loc_4AC6FP
		jmp	sub_87DD0
sub_424D0	endp

stub202		ends
