stub187		segment	para public 'CODE' use16
		assume cs:stub187
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42030	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:0696o
		dw 0			; memswap
		dd 65C0h		; fileoff
		dw 16CCh		; codesize
		dw 160h			; relsize
		dw 5			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42050	proc far		; DATA XREF: Gameflow_ShowKillMarks_506AA+8Co
					; Gameflow_ShowKillMarks_506AA+A5o
		jmp	sub_51809
sub_42050	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42055	proc far		; CODE XREF: Gameflow_RunScriptPairs_36CF+363P
		jmp	Gameflow_ApplyChange_50160
sub_42055	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4205A	proc far		; CODE XREF: Gameflow_RunScriptPairs_36CF+331P
		jmp	Gameflow_CheckLossConversations_50645
sub_4205A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4205F	proc far		; CODE XREF: Gameflow_RunScriptPairs_36CF+30AP
		jmp	Gameflow_ShowKillMarks_506AA
sub_4205F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42064	proc far		; CODE XREF: Gameflow_RunScriptPairs_36CF+282P
		jmp	Gameflow_KillBoard_51049
sub_42064	endp

stub187		ends
