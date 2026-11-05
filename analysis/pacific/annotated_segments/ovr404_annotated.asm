ovr404		segment	para public 'OVERLAY' use16
		assume cs:ovr404
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E5550		proc far

var_20		= word ptr -20h
var_10		= word ptr -10h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_10+1], 0Fh
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		mov	al, byte ptr [bp+var_20]
		mov	[si], al
		pop	si
		leave
		retf
sub_E5550		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextRenderer_EncodeCharB_2E977 (sub_2E977 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextRenderer_EncodeCharB_5E2A3 (sub_5E2A3 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, variante de
; TextRenderer_EncodeCharA_5E27B (lit un octet depuis l'objet source avant conversion via
; sub_1811), suivi d'un appel à sub_5E7D6. Référencée par TextRenderer_Main et seg144.
; ==============================================================================================
TextRenderer_EncodeCharB_E5578		proc far

var_20		= word ptr -20h
var_10		= word ptr -10h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_10+1], 0
		mov	al, [si]
		mov	byte ptr [bp+var_10], al
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		call	sub_68194
		pop	si
		leave
		retf
TextRenderer_EncodeCharB_E5578		endp
ovr404		ends
