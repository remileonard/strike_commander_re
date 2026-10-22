stub185		segment	para public 'CODE' use16
		assume cs:stub185
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_41F60	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0686o
		dw 0			; memswap
		dd 25C0h		; fileoff
		dw 21B8h		; codesize
		dw 1AEh			; relsize
		dw 24			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F80	proc far		; DATA XREF: dseg:08ACo
		jmp	sub_4E5FF
sub_41F80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F85	proc far		; DATA XREF: dseg:0878o
		jmp	sub_4E5A6
sub_41F85	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F8A	proc far		; DATA XREF: dseg:0854o dseg:0888o
		jmp	sub_4E57D
sub_41F8A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F8F	proc far		; DATA XREF: dseg:0844o
		jmp	sub_4E541
sub_41F8F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F94	proc far		; DATA XREF: dseg:0840o
		jmp	sub_4E4D4
sub_41F94	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F99	proc far		; DATA XREF: dseg:080Co
		jmp	sub_4E467
sub_41F99	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41F9E	proc far		; DATA XREF: dseg:07D8o
		jmp	sub_4E3FA
sub_41F9E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FA3	proc far		; DATA XREF: dseg:07A4o
		jmp	sub_4E38D
sub_41FA3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FA8	proc far		; DATA XREF: dseg:0770o
		jmp	sub_4E320
sub_41FA8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FAD	proc far		; DATA XREF: dseg:0734o
		jmp	sub_4E27E
sub_41FAD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FB2	proc far		; CODE XREF: sub_3D2E+EEP
					; sub_3D2E+13CP ...
		jmp	sub_4DF4B
sub_41FB2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FB7	proc far		; CODE XREF: Gameflow_RunScriptPairs_36CF+227P
					; Gameflow_RunScriptPairs_36CF+24CP ...
		jmp	sub_4DAE8
sub_41FB7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FBC	proc far
		jmp	sub_4C58B
sub_41FBC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FC1	proc far		; CODE XREF: Gameflow_RunScriptPairs_36CF+212P
		jmp	sub_4D984
sub_41FC1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FC6	proc far		; CODE XREF: Gameflow_RunScriptPairs_36CF+25AP
					; sub_4F1A7+CBEP
		jmp	sub_4DDDC
sub_41FC6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FCB	proc far		; DATA XREF: dseg:08A8o
		jmp	sub_4C4A0
sub_41FCB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FD0	proc far		; DATA XREF: dseg:0894o
		jmp	sub_4C4C6
sub_41FD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FD5	proc far		; DATA XREF: dseg:07A0o
		jmp	sub_4D95A
sub_41FD5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FDA	proc far		; DATA XREF: dseg:076Co
		jmp	sub_4D96F
sub_41FDA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FDF	proc far
		jmp	sub_4C62A
sub_41FDF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FE4	proc far
		jmp	sub_4CF3D
sub_41FE4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FE9	proc far
		jmp	sub_4CF58
sub_41FE9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FEE	proc far
		jmp	sub_4CF75
sub_41FEE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_41FF3	proc far
		jmp	sub_4CDB9
sub_41FF3	endp

stub185		ends
