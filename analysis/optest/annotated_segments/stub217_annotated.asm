stub217		segment	para public 'CODE' use16
		assume cs:stub217
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_428B0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0786o
		dw 0			; memswap
		dd 7E080h		; fileoff
		dw 0BB9h		; codesize
		dw 0A6h			; relsize
		dw 16			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428D0	proc far		; DATA XREF: sub_C1EFF+1Co
		jmp	sub_C2381
sub_428D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428D5	proc far
		jmp	sub_C17F0
sub_428D5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428DA	proc far
		jmp	sub_C185E
sub_428DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428DF	proc far
		jmp	sub_C1CDD
sub_428DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428E4	proc far
		jmp	sub_C209D
sub_428E4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428E9	proc far
		jmp	sub_C21EA
sub_428E9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428EE	proc far
		jmp	sub_C1EFF
sub_428EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428F3	proc far
		jmp	sub_C1F7B
sub_428F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428F8	proc far
		jmp	sub_C228F
sub_428F8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_428FD	proc far
		jmp	sub_C22F7
sub_428FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42902	proc far
		jmp	sub_C1E15
sub_42902	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42907	proc far		; CODE XREF: seg047:0B46P
		jmp	sub_C18C7
sub_42907	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4290C	proc far
		jmp	sub_C19C8
sub_4290C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42911	proc far		; CODE XREF: sub_5E1A1+177P
					; sub_C3874+3FP
		jmp	sub_C18CF
sub_42911	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42916	proc far		; CODE XREF: seg047:0B58P
		jmp	sub_C1A2B
sub_42916	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4291B	proc far		; CODE XREF: sub_11FFE+70P
		jmp	sub_C1B7B
sub_4291B	endp

stub217		ends
