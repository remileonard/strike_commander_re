stub188		segment	para public 'CODE' use16
		assume cs:stub188
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
stru_42070	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg170:069Eo
		dw 0			; memswap
		dd 7DF0h		; fileoff
		dw 27FEh		; codesize
		dw 1C6h			; relsize
		dw 8			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, stub VROOMM : jmp ResourceHandle_Destruct_53FD9. Passé en paramètre aux
; constructeurs/destructeurs de tableaux d'objets (CRT_Doprnt_Core/Dispatch d'après la reprise
; de STRIKE).
; ==============================================================================================
Stub_ResourceHandle_Destruct_42090	proc far		; DATA XREF: sub_28EDF+40o
					; sub_52662+F0Co ...
		jmp	ResourceHandle_Destruct_53FD9
Stub_ResourceHandle_Destruct_42090	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, stub VROOMM : jmp ResourceHandle_Construct_53F9F.
; ==============================================================================================
Stub_ResourceHandle_Construct_42095	proc far		; DATA XREF: sub_52662+96o
					; ConvData_LoadBackground_5A4E6+1BEo ...
		jmp	ResourceHandle_Construct_53F9F
Stub_ResourceHandle_Construct_42095	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4209A	proc far		; DATA XREF: sub_52662+4Fo
		jmp	sub_53F6F
sub_4209A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_4209F	proc far
		jmp	sub_51830
sub_4209F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_420A4	proc far		; CODE XREF: sub_36CF+2B1P
					; sub_597B2+BBP
		jmp	sub_51AB3
sub_420A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_420A9	proc far
		jmp	sub_523F3
sub_420A9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_420AE	proc far		; CODE XREF: sub_36CF+2CBP
		jmp	sub_52662
sub_420AE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

sub_420B3	proc far		; CODE XREF: sub_36CF+2F0P
		jmp	sub_53686
sub_420B3	endp

stub188		ends
