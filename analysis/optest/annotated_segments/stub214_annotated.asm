stub214		segment	para public 'CODE' use16
		assume cs:stub214
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42720	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:076Eo
		dw 0			; memswap
		dd 7C1D0h		; fileoff
		dw 0B1Eh		; codesize
		dw 5Ch			; relsize
		dw 29			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42740	proc far		; DATA XREF: dseg:2DD0o
		jmp	sub_C04EA
sub_42740	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42745	proc far		; DATA XREF: dseg:2DC8o
		jmp	sub_C04DE
sub_42745	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4274A	proc far
		jmp	sub_BFA30
sub_4274A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4274F	proc far
		jmp	sub_BFAC0
sub_4274F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42754	proc far		; CODE XREF: sub_13BC8+7BP
		jmp	sub_BFBCE
sub_42754	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42759	proc far		; CODE XREF: sub_13BC8+50P
		jmp	sub_BFC61
sub_42759	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4275E	proc far
		jmp	sub_BFCBD
sub_4275E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42763	proc far
		jmp	sub_C0116
sub_42763	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42768	proc far		; CODE XREF: seg055:0868P
		jmp	sub_C0346
sub_42768	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4276D	proc far		; CODE XREF: sub_C39E3+9P
		jmp	sub_C03D0
sub_4276D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42772	proc far		; CODE XREF: seg055:093CP
					; DATA XREF: dseg:2DA8o
		jmp	sub_C0395
sub_42772	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42777	proc far
		jmp	EntityTracker_AddEntryObj
sub_42777	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4277C	proc far
		jmp	EntityTracker_AddEntryText
sub_4277C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42781	proc far
		jmp	sub_BFD95
sub_42781	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42786	proc far
		jmp	sub_BFDF1
sub_42786	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4278B	proc far
		jmp	sub_BFE2F
sub_4278B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42790	proc far		; CODE XREF: sub_C3A75+17P
		jmp	sub_C0007
sub_42790	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42795	proc far
		jmp	sub_BFE6E
sub_42795	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4279A	proc far
		jmp	sub_BFEE0
sub_4279A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4279F	proc far
		jmp	sub_BFF31
sub_4279F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_427A4	proc far
		jmp	sub_C0071
sub_427A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_427A9	proc far
		jmp	sub_C003D
sub_427A9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_427AE	proc far
		jmp	sub_C00D4
sub_427AE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_427B3	proc far
		jmp	sub_BFFF4
sub_427B3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_427B8	proc far
		jmp	sub_C017F
sub_427B8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_427BD	proc far		; CODE XREF: sub_13BC8+BEP
		jmp	sub_C01BA
sub_427BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_427C2	proc far
		jmp	sub_C01FB
sub_427C2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_427C7	proc far
		jmp	sub_C02D0
sub_427C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_427CC	proc far		; CODE XREF: sub_C39F6+23P
		jmp	sub_C0162
sub_427CC	endp

stub214		ends
