stub199		segment	para public 'CODE' use16
		assume cs:stub199
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42420	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06F6o
		dw 0			; memswap
		dd 29820h		; fileoff
		dw 526Bh		; codesize
		dw 460h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42440	proc far		; CODE XREF: Gameflow_PlayMidgame_4ABE0:loc_4AC2DP
		jmp	sub_71680
sub_42440	endp

stub199		ends
