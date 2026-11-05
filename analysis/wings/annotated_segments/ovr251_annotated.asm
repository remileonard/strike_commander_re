ovr251		segment	para public 'OVERLAY' use16
		assume cs:ovr251
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Video_SetModeIfChanged_E55D0 (sub_E55D0 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Video_SetModeIfChanged_2F05F (sub_2F05F de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Video_SetModeIfChanged_5E7EA (sub_5E7EA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; compare le mode demandé à un mode courant global (word_70EA2) ; si différent, appelle
; sub_2962 (probable wrapper de changement de mode vidéo, int 10h) ; dans tous les cas
; confirme/committe le mode via sub_5EFD3. Référencée par Memory_TypedAllocDispatchE_5C916
; (seg131) — suggère que la table d'allocateurs typés du seg131 sert en réalité de registre de
; gestionnaires de ressources plus large que la seule mémoire (au moins un type gère le mode
; vidéo).
; ==============================================================================================
Video_SetModeIfChanged_89130		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+arg_0]
		cmp	dx, word_5D91C
		jz	short loc_89153
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_5D91C
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_89153:
		push	word_5D91C
		call	sub_59BB0
		pop	cx
		leave
		retf
Video_SetModeIfChanged_89130		endp
ovr251		ends
