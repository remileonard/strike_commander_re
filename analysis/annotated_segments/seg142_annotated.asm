seg142		segment	byte public 'CODE' use16
		assume cs:seg142
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_1811 (conversion/encodage, buffer 16 octets) pour produire un octet encodé
; stocké dans l'objet cible. Référencée par TextRenderer_Main (sub_27477, seg048) et seg047.
; ==============================================================================================
TextRenderer_EncodeCharA_5E27B	proc far		; CODE XREF: seg047:036CP
					; TextRenderer_Main+28P

var_20		= word ptr -20h
var_F		= byte ptr -0Fh
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_F], 0Fh
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp-10h]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		mov	al, byte ptr [bp+var_20]
		mov	[si], al
		pop	si
		leave
		retf
TextRenderer_EncodeCharA_5E27B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de TextRenderer_EncodeCharA_5E27B (lit un octet depuis l'objet source avant
; conversion via sub_1811), suivi d'un appel à sub_5E7D6. Référencée par TextRenderer_Main et
; seg144.
; ==============================================================================================
TextRenderer_EncodeCharB_5E2A3	proc far		; CODE XREF: TextRenderer_Main+3CP
					; seg144:001AP

var_20		= word ptr -20h
var_10		= word ptr -10h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_10+1],	0
		mov	al, [si]
		mov	byte ptr [bp+var_10], al
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		call	Video_ReadCRTCPortBase_5E7D6
		pop	si
		leave
		retf
TextRenderer_EncodeCharB_5E2A3	endp

seg142		ends
