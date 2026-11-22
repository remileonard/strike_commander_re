stub228		segment	para public 'CODE' use16
		assume cs:stub228
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42BD0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07DEo
		dw 0			; memswap
		dd 81580h		; fileoff
		dw 341h			; codesize
		dw 20h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42BF0	proc far		; CODE XREF: sub_1B339+38P
		jmp	sub_C4A60
sub_42BF0	endp

stub228		ends
