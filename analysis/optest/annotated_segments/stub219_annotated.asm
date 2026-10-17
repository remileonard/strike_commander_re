stub219		segment	para public 'CODE' use16
		assume cs:stub219
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42970	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0796o
		dw 0			; memswap
		dd 7EFD0h		; fileoff
		dw 0E1h			; codesize
		dw 0Eh			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42990	proc far		; DATA XREF: dseg:3334o dseg:340Co
		jmp	sub_C2725
sub_42990	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42995	proc far		; DATA XREF: dseg:32D0o
		jmp	sub_C271D
sub_42995	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4299A	proc far		; CODE XREF: seg052:01B4P
					; DATA XREF: dseg:32CCo
		jmp	sub_C2650
sub_4299A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4299F	proc far
		jmp	sub_C26E8
sub_4299F	endp

stub219		ends
