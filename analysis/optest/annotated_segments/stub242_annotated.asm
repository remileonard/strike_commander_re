stub242		segment	para public 'CODE' use16
		assume cs:stub242
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42E80	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:084Eo
		dw 0			; memswap
		dd 840B0h		; fileoff
		dw 0B36h		; codesize
		dw 7Ch			; relsize
		dw 11			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42EA0	proc far		; DATA XREF: dseg:3800o
		jmp	sub_C7EE1
sub_42EA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42EA5	proc far		; CODE XREF: seg055:0874P
		jmp	sub_C7603
sub_42EA5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42EAA	proc far		; CODE XREF: seg055:08EAP
					; sub_C39F6+45P
		jmp	sub_C77C4
sub_42EAA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42EAF	proc far		; CODE XREF: sub_C36F7+F9P
		jmp	sub_C7675
sub_42EAF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42EB4	proc far
		jmp	sub_C78EA
sub_42EB4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42EB9	proc far		; CODE XREF: sub_C6FD6+4CP
					; sub_C6FD6+E1P
		jmp	sub_C7BE8
sub_42EB9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42EBE	proc far
		jmp	sub_C7C7F
sub_42EBE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42EC3	proc far		; CODE XREF: sub_22487+143P
		jmp	sub_C7E76
sub_42EC3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42EC8	proc far
		jmp	sub_C73E0
sub_42EC8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42ECD	proc far		; CODE XREF: sub_C6FD6+38P
		jmp	GlyphObject_MeasureWrapperB_C754D
sub_42ECD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42ED2	proc far		; CODE XREF: UI_DrawRect+1CP
					; sub_C6FD6+1DFP
		jmp	GlyphObject_ResolveAndMeasureB_C758E
sub_42ED2	endp

stub242		ends
