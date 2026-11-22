stub224		segment	para public 'CODE' use16
		assume cs:stub224
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42AE0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07BEo
		dw 0			; memswap
		dd 80080h		; fileoff
		dw 48Fh			; codesize
		dw 4Ch			; relsize
		dw 12			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B00	proc far
		jmp	sub_C3874
sub_42B00	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B05	proc far
		jmp	sub_C39DE
sub_42B05	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B0A	proc far
		jmp	sub_C38BE
sub_42B0A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B0F	proc far
		jmp	sub_C39E3
sub_42B0F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B14	proc far
		jmp	sub_C38C3
sub_42B14	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B19	proc far		; CODE XREF: sub_11FFE+78P
		jmp	sub_C39F6
sub_42B19	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B1E	proc far
		jmp	sub_C3A4A
sub_42B1E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B23	proc far
		jmp	sub_C36F7
sub_42B23	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B28	proc far		; CODE XREF: sub_1220C+2AP
		jmp	sub_C3640
sub_42B28	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B2D	proc far
		jmp	sub_C3A4F
sub_42B2D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B32	proc far		; CODE XREF: sub_1220C+216P
		jmp	sub_C3A75
sub_42B32	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42B37	proc far		; DATA XREF: dseg:591Co
		jmp	sub_C3AB8
sub_42B37	endp

stub224		ends
