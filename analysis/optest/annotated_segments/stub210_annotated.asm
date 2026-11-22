stub210		segment	para public 'CODE' use16
		assume cs:stub210
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42630	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:074Eo
		dw 0			; memswap
		dd 7A3C0h		; fileoff
		dw 50h			; codesize
		dw 4			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_42650	proc far		; DATA XREF: dseg:1DB1o
		jmp	TranslucentFont_DrawGlyph_BDDC0
sub_42650	endp

stub210		ends
