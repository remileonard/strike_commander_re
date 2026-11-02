seg156		segment	para public 'CODE' use16
		assume cs:seg156
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

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
File_OpenWithRetry_40380		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	word_4DC1E, 0

loc_40389:
		push	ds
		lds	dx, [bp+arg_2]
		mov	ah, 3Dh
		mov	al, [bp+arg_0]
		int	21h
		pop	ds
		jnb	short loc_403AA
		mov	word_4DC1E, ax
		call	dword ptr dword_4DC20
		test	word_4DC1E, 0FFFFh
		jz	short loc_40389
		mov	ax, 0FFFFh
		stc

loc_403AA:
		pop	bp
		retf	6
File_OpenWithRetry_40380		endp

; ----------------------------------------------------------------------

sub_403AE		proc far
		retf
sub_403AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_403AF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ah, 3Eh
		int	21h
		jnb	short loc_403CA
		mov	word_4DC1E, ax
sub_403AF		endp

; START OF FUNCTION CHUNK FOR sub_403AF
		db 0FFh
		push	ds
; END OF FUNCTION CHUNK FOR sub_403AF
seg156		ends
