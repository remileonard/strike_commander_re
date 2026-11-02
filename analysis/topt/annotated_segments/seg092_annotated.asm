seg092		segment	para public 'CODE' use16
		assume cs:seg092
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30070		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_30070		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; DisplayContext_CommitFrame_2FCD5 (sub_2FCD5 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à DisplayContext_CommitFrame_5F460 (sub_5F460 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, fonction de
; rendu/validation de trame : bascule le mode vidéo (sub_2962) si le mode demandé diffère du
; mode courant (word_70EA2), détruit les sous-objets mis en cache
; (CachedObject_DestructSubobjects_5E95A), puis dispatche deux appels virtuels ([bx] et
; [si+2]). Référencée dans des dizaines de segments (constructeurs de classes du cluster
; mémoire paginée/texte : PagedResourceC_Construct_5CD3A,
; TextObjectCluster_DestructVariantA_5C42C, etc.) — probable point de synchronisation
; d'affichage commun à toutes ces classes.
; ==============================================================================================
DisplayContext_CommitFrame_30078		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, word_4CE02
		jz	short loc_3009F
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_4CE02
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_3009F:
		push	word_4CE02
		mov	ax, si
		add	ax, 6
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		push	word ptr [si+6]
		call	dword ptr [si+2]
		pop	cx
		pop	si
		leave
		retf
DisplayContext_CommitFrame_30078		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à DisplayContext_CommitFrameWithTag_2FD1E (sub_2FD1E de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à DisplayContext_CommitFrameWithTag_5F4A9 (sub_5F4A9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe fine appelant DisplayContext_CommitFrame_5F460 avec un tag fixe (3E13h).
; Référencée par PagedMemory_ReadTextResource_5C14E (seg128).
; ==============================================================================================
DisplayContext_CommitFrameWithTag_300C1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	49CFh
		push	ax
		push	cs
		call	near ptr DisplayContext_CommitFrame_30078
		add	sp, 6
		pop	bp
		retf
DisplayContext_CommitFrameWithTag_300C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_300D7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	49DDh
		push	ax
		push	cs
		call	near ptr DisplayContext_CommitFrame_30078
		add	sp, 8
		pop	bp
		retf
sub_300D7		endp
seg092		ends
