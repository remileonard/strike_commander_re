seg197		segment	para public 'CODE' use16
		assume cs:seg197
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 5Dh, 0CAh, 4, 0, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à File_OpenWithRetry_3ACA4 (sub_3ACA4 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à File_OpenWithRetry_63434
; (sub_63434 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, ouvre un fichier existant (int 21h, AH=3Dh, DOS OPEN) avec retry via le callback
; configurable (off_70FCE) en cas d'erreur — même motif que File_CreateWithRetry_630BA
; (seg184). Référencée par sub_64413 et sub_A1173.
; ==============================================================================================
File_OpenWithRetry_6B3E6		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	word_7B11E, 0

loc_6B3EF:
		push	ds
		lds	dx, [bp+arg_2]
		mov	ah, 3Dh
		mov	al, [bp+arg_0]
		int	21h
		pop	ds
		jnb	short loc_6B410
		mov	word_7B11E, ax
		call	dword ptr dword_7B120
		test	word_7B11E, 0FFFFh
		jz	short loc_6B3EF
		mov	ax, 0FFFFh
		stc

loc_6B410:
		pop	bp
		retf	6
File_OpenWithRetry_6B3E6		endp

; ----------------------------------------------------------------------

sub_6B414		proc far
		retf
sub_6B414		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6B415		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_6B418:
		mov	bx, [bp+arg_0]
		mov	ah, 3Eh
		int	21h
		jnb	short loc_6B430
		mov	word_7B11E, ax
		call	dword ptr dword_7B120
		test	word_7B11E, 0FFFFh
		jz	short loc_6B418
sub_6B415		endp
seg197		ends
