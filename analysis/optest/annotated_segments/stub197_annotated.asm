stub197		segment	para public 'CODE' use16
		assume cs:stub197
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_423C0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:06E6o
		dw 0			; memswap
		dd 1E9B0h		; fileoff
		dw 47FDh		; codesize
		dw 478h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, stub VROOMM : jmp Midgame1_PlayPart2_671C0.
; ==============================================================================================
Stub_Midgame1_PlayPart2_423E0	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+6D40P
		jmp	Midgame1_PlayPart2_671C0
Stub_Midgame1_PlayPart2_423E0	endp

stub197		ends
