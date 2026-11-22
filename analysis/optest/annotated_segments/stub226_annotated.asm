stub226		segment	para public 'CODE' use16
		assume cs:stub226
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42B70	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07CEo
		dw 0			; memswap
		dd 80A10h		; fileoff
		dw 453h			; codesize
		dw 0			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B90	proc far		; CODE XREF: Camera_UpdateViewportClip+27P
		jmp	sub_C4118
sub_42B90	endp

stub226		ends
