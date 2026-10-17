stub223		segment	para public 'CODE' use16
		assume cs:stub223
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42A70	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:07B6o
		dw 0			; memswap
		dd 7FA70h		; fileoff
		dw 5BAh			; codesize
		dw 4Ch			; relsize
		dw 15			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42A90	proc far		; DATA XREF: sub_C3449+4Do
		jmp	sub_C35FF
sub_42A90	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42A95	proc far		; DATA XREF: sub_C3281+32o
					; sub_C334F+24o ...
		jmp	sub_C35D1
sub_42A95	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42A9A	proc far		; CODE XREF: sub_C5780+FCP
		jmp	TextCycler_ReleaseEntry_C3080
sub_42A9A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42A9F	proc far
		jmp	TextCycler_ReleaseBuffer_C321D
sub_42A9F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42AA4	proc far
		jmp	sub_C30DA
sub_42AA4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42AA9	proc far
		jmp	sub_C3170
sub_42AA9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42AAE	proc far		; DATA XREF: sub_C33FB+1Do
					; sub_C3545+6o
		jmp	sub_C3257
sub_42AAE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42AB3	proc far		; CODE XREF: sub_C5780+180P
		jmp	sub_C3281
sub_42AB3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42AB8	proc far
		jmp	sub_C334F
sub_42AB8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42ABD	proc far		; DATA XREF: sub_C3545+21o
		jmp	sub_C33FB
sub_42ABD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42AC2	proc far		; CODE XREF: sub_C5780+72P
					; sub_C5950+EFP
		jmp	sub_C3449
sub_42AC2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42AC7	proc far		; CODE XREF: sub_C61A0+37P
		jmp	sub_C34B7
sub_42AC7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42ACC	proc far		; CODE XREF: sub_C61F0+50P
		jmp	sub_C34F9
sub_42ACC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42AD1	proc far
		jmp	sub_C3545
sub_42AD1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42AD6	proc far		; CODE XREF: sub_C6390+ABP
					; sub_C6E6A+50P
		jmp	sub_C359F
sub_42AD6	endp

stub223		ends
