stub189		segment	para public 'CODE' use16
		assume cs:stub189
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_420C0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06A6o
		dw 0			; memswap
		dd 0A7C0h		; fileoff
		dw 12A2h		; codesize
		dw 0D2h			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_420E0	proc far		; DATA XREF: Gameflow_ShowMap_542AC+1Ao
		jmp	sub_552AF
sub_420E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_420E5	proc far
		jmp	sub_54030
sub_420E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_420EA	proc far		; CODE XREF: Gameflow_RunScriptPairs_36CF+276P
		jmp	Gameflow_ShowMap_542AC
sub_420EA	endp

stub189		ends
