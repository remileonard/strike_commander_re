ovr319		segment	para public 'OVERLAY' use16
		assume cs:ovr319
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; IFF_LoadAngleParam_Wrapper (sub_460E8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,16L — wrapper direct vers IFF_LoadAngleParam
; (sub_3C942, seg084) : chargement d'un paramètre angulaire IFF, appelé depuis le chargeur de
; modèle principal.
; ==============================================================================================
IFF_LoadAngleParam_Wrapper_B0DF0		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	sub_3B14C
		add	sp, 6
		pop	bp
		retf
IFF_LoadAngleParam_Wrapper_B0DF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponentVariantS_ConstructAndInit_A1054
; (sub_A1054 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658), initialise une classe de base (sub_3C9BC), appelle sub_6B630
; et sub_45C0D (fonction précédemment signalée comme possible duplicat non vérifié, cf. notes
; méthodologiques du projet), enregistre dans un conteneur (sub_6C00E).
; ==============================================================================================
PlayerComponentVariantS_ConstructAndInit_B0E04		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0EAh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B0E4D
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si], 26F5h
		push	ds
		mov	ax, si
		add	ax, 52h
		push	ax
		call	sub_736DA
		add	sp, 4
		push	large [bp+var_4]
		push	si
		call	sub_43752
		add	sp, 6
		mov	ax, si
		jmp	short loc_B0E4F

loc_B0E4D:
		mov	ax, si

loc_B0E4F:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantS_ConstructAndInit_B0E04		endp
ovr319		ends
