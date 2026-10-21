stub196		segment	para public 'CODE' use16
		assume cs:stub196
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42390	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06DEo
		dw 0			; memswap
		dd 16DA0h		; fileoff
		dw 74C5h		; codesize
		dw 73Ch			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_423B0	proc far		; DATA XREF: dseg:1DADo
		jmp	TranslucentFont_Destruct_67184
sub_423B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_423B5	proc far		; CODE XREF: sub_3D2E+10EP
					; sub_3D2E:loc_3F83P ...
		jmp	Midgame1_PlayPart1_5FCF0
sub_423B5	endp

stub196		ends
