seg085		segment	byte public 'CODE' use16
		assume cs:seg085
		;org 0Fh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextRenderer_EncodeCharA_5E27B (sub_5E27B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_1811 (conversion/encodage, buffer
; 16 octets) pour produire un octet encodé stocké dans l'objet cible. Référencée par
; TextRenderer_Main (sub_27477, seg048) et seg047.
; ==============================================================================================
TextRenderer_EncodeCharA_2E94F	proc far		; CODE XREF: seg007:01CEP
					; sub_5D287+28P

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
TextRenderer_EncodeCharA_2E94F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextRenderer_EncodeCharB_5E2A3 (sub_5E2A3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, variante de TextRenderer_EncodeCharA_5E27B
; (lit un octet depuis l'objet source avant conversion via sub_1811), suivi d'un appel à
; sub_5E7D6. Référencée par TextRenderer_Main et seg144.
; ==============================================================================================
TextRenderer_EncodeCharB_2E977	proc far		; CODE XREF: seg087:000EP
					; sub_5D287+3EP

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
		call	sub_2EFEE
		pop	si
		leave
		retf
TextRenderer_EncodeCharB_2E977	endp

seg085		ends
