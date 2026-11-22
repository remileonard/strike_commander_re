stub218		segment	para public 'CODE' use16
		assume cs:stub218
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42920	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:078Eo
		dw 0			; memswap
		dd 7ED00h		; fileoff
		dw 2A0h			; codesize
		dw 28h			; relsize
		dw 7			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42940	proc far
		jmp	sub_C23B0
sub_42940	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42945	proc far		; CODE XREF: sub_C2FD0+BP
					; DATA XREF: dseg:32D4o
		jmp	sub_C23F6
sub_42945	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4294A	proc far		; CODE XREF: sub_C304B+20P
					; DATA XREF: dseg:32D8o
		jmp	sub_C24BD
sub_4294A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4294F	proc far
		jmp	sub_C2500
sub_4294F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42954	proc far		; CODE XREF: seg051:0574P
		jmp	Debris_ContainerOpWrapper_C2578
sub_42954	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42959	proc far
		jmp	sub_C2596
sub_42959	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4295E	proc far
		jmp	sub_C261A
sub_4295E	endp

stub218		ends
