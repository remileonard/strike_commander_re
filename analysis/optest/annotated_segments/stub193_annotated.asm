stub193		segment	para public 'CODE' use16
		assume cs:stub193
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_422A0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06C6o
		dw 0			; memswap
		dd 15060h		; fileoff
		dw 99Fh			; codesize
		dw 0D8h			; relsize
		dw 6			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_422C0	proc far		; DATA XREF: sub_5E851+A5o
		jmp	sub_5EAF4
sub_422C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_422C5	proc far		; CODE XREF: sub_D157+51P
					; sub_5D287+84DP
		jmp	sub_5E1A1
sub_422C5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_422CA	proc far		; CODE XREF: sub_5D287+2EDP
		jmp	sub_5E851
sub_422CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_422CF	proc far		; CODE XREF: sub_5DC96+73P
		jmp	sub_5E9CD
sub_422CF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_422D4	proc far		; CODE XREF: seg007:021EP
		jmp	sub_5EA97
sub_422D4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_422D9	proc far
		jmp	sub_5E180
sub_422D9	endp

stub193		ends
