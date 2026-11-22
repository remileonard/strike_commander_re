stub186		segment	para public 'CODE' use16
		assume cs:stub186
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42000	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:068Eo
		dw 0			; memswap
		dd 4930h		; fileoff
		dw 1AF9h		; codesize
		dw 18Ah			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42020	proc far		; CODE XREF: Gameflow_MainLoop_3D2E+1D5P
		jmp	sub_4E660
sub_42020	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42025	proc far		; CODE XREF: Gameflow_MainLoop_3D2E+1A3P
		jmp	Gameflow_MainMenu_4F1A7
sub_42025	endp

stub186		ends
