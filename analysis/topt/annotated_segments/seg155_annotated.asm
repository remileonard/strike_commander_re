seg155		segment	para public 'CODE' use16
		assume cs:seg155
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E9h, 50h, 0FFh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à File_CreateWithRetry_3A92A (sub_3A92A de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à File_CreateWithRetry_630BA
; (sub_630BA de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, crée un fichier (int 21h, AH=3Ch, DOS CREATE FILE) ; en cas d'erreur, appelle un
; callback de reprise (off_70FCE, pointeur de fonction configurable) et retente si celui-ci
; l'indique, sinon retourne une erreur. Référencée par sub_64413 et sub_A10C0.
; ==============================================================================================
File_CreateWithRetry_40354		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_40359:
		push	ds
		lds	dx, [bp+arg_0]
		xor	cx, cx
		mov	ah, 3Ch
		int	21h
		pop	ds
		jnb	short loc_40379
		mov	word_4DC1E, ax
		call	dword ptr dword_4DC20
		test	word_4DC1E, 0FFFFh
		jz	short loc_40359
		mov	ax, 0FFFFh
		stc

loc_40379:
		pop	di
		pop	si
		pop	bp
		retf	4
File_CreateWithRetry_40354		endp

; START OF FUNCTION CHUNK FOR File_CreateWithRetry_40354
		db 0
; END OF FUNCTION CHUNK FOR File_CreateWithRetry_40354
seg155		ends
