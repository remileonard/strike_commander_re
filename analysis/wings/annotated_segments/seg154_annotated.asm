seg154		segment	para public 'CODE' use16
		assume cs:seg154
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh, 0FFh, 0F9h

loc_51BD3:
		db 5Fh, 5Eh, 5Dh, 0CAh, 4, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; File_OpenWithRetry_6B3E6 (sub_6B3E6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; File_OpenWithRetry_3ACA4 (sub_3ACA4 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à File_OpenWithRetry_63434 (sub_63434 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, ouvre un fichier existant (int
; 21h, AH=3Dh, DOS OPEN) avec retry via le callback configurable (off_70FCE) en cas d'erreur —
; même motif que File_CreateWithRetry_630BA (seg184). Référencée par sub_64413 et sub_A1173.
; ==============================================================================================
File_OpenWithRetry_51BDA		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	word_5E5FA, 0

loc_51BE3:
		push	ds
		lds	dx, [bp+arg_2]
		mov	ah, 3Dh
		mov	al, [bp+arg_0]
		int	21h
		pop	ds
		jnb	short loc_51C04
		mov	word_5E5FA, ax
		call	dword ptr dword_5E5FC
		test	word_5E5FA, 0FFFFh
		jz	short loc_51BE3
		mov	ax, 0FFFFh
		stc

loc_51C04:
		pop	bp
		retf	6
File_OpenWithRetry_51BDA		endp

; ----------------------------------------------------------------------

sub_51C08		proc far
		retf
sub_51C08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51C09		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ah, 3Eh
		int	21h
		jnb	short loc_51C24
		mov	word_5E5FA, ax
		call	dword ptr dword_5E5FC
sub_51C09		endp

; START OF FUNCTION CHUNK FOR sub_51C09
		db 0F7h, 6, 0DAh
		dec	ax
; END OF FUNCTION CHUNK FOR sub_51C09
seg154		ends
