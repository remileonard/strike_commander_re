stub195		segment	para public 'CODE' use16
		assume cs:stub195
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42320	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06D6o
		dw 0			; memswap
		dd 15E90h		; fileoff
		dw 0E3Fh		; codesize
		dw 0BEh			; relsize
		dw 13			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42340	proc far		; DATA XREF: sub_5FBFA+36o
		jmp	sub_5FC92
sub_42340	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42345	proc far		; DATA XREF: sub_5F39F+21o
		jmp	AudioQueue_Helper_5FC6C
sub_42345	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4234A	proc far
		jmp	sub_5F39F
sub_4234A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4234F	proc far
		jmp	sub_5F569
sub_4234F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42354	proc far
		jmp	sub_5F6FF
sub_42354	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42359	proc far		; CODE XREF: sub_5D287+8D0P
		jmp	AudioQueue_RegisterTickModule_5EEB0
sub_42359	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4235E	proc far		; CODE XREF: seg062:001AP
		jmp	sub_5EED1
sub_4235E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42363	proc far		; CODE XREF: sub_28CFC+1EP
		jmp	sub_5EEE6
sub_42363	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42368	proc far
		jmp	sub_5FA57
sub_42368	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4236D	proc far		; CODE XREF: sub_28EDF+7FP
					; sub_5E11E+8P
		jmp	sub_5FBFA
sub_4236D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42372	proc far		; CODE XREF: sub_28CAB+EP
		jmp	sub_5F8FE
sub_42372	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42377	proc far		; CODE XREF: sub_28CC3+EP
		jmp	sub_5F940
sub_42377	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4237C	proc far		; CODE XREF: sub_8EAD+FP Music_Stop_28CDB+12P
		jmp	sub_5F982
sub_4237C	endp

stub195		ends
