stub220		segment	para public 'CODE' use16
		assume cs:stub220
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_429B0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:079Eo
		dw 0			; memswap
		dd 7F0C0h		; fileoff
		dw 474h			; codesize
		dw 2Ch			; relsize
		dw 10			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_429D0	proc far		; DATA XREF: dseg:3360o
		jmp	sub_C2B8A
sub_429D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_429D5	proc far		; CODE XREF: sub_C2BC0+1FFP
					; sub_C2BC0+2A0P
		jmp	sub_C2810
sub_429D5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_429DA	proc far		; CODE XREF: sub_21E33+1EP
					; sub_C2BC0+171P
		jmp	sub_C2869
sub_429DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_429DF	proc far		; CODE XREF: sub_C2BC0+303P
		jmp	sub_C295B
sub_429DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_429E4	proc far		; CODE XREF: sub_C2F81+19P
					; DATA XREF: dseg:3364o
		jmp	sub_C2740
sub_429E4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_429E9	proc far		; CODE XREF: seg051:006BP seg052:0088P
		jmp	sub_C27E8
sub_429E9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_429EE	proc far		; CODE XREF: sub_C2BC0+312P
		jmp	sub_C2ACF
sub_429EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_429F3	proc far
		jmp	sub_C2A72
sub_429F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_429F8	proc far
		jmp	sub_C2B20
sub_429F8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_429FD	proc far		; CODE XREF: sub_C2BC0+24BP
		jmp	sub_C2B4D
sub_429FD	endp

stub220		ends
