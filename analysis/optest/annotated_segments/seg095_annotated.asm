seg095		segment	byte public 'CODE' use16
		assume cs:seg095
		;org 0Fh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Video_SetModeIfChanged_5E7EA (sub_5E7EA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, compare le mode demandé à un mode courant
; global (word_70EA2) ; si différent, appelle sub_2962 (probable wrapper de changement de mode
; vidéo, int 10h) ; dans tous les cas confirme/committe le mode via sub_5EFD3. Référencée par
; Memory_TypedAllocDispatchE_5C916 (seg131) — suggère que la table d'allocateurs typés du
; seg131 sert en réalité de registre de gestionnaires de ressources plus large que la seule
; mémoire (au moins un type gère le mode vidéo).
; ==============================================================================================
Video_SetModeIfChanged_2F05F	proc far		; CODE XREF: seg070:0337P seg070:0347P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+arg_0]
		cmp	dx, word_47034
		jz	short loc_2F082
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_47034
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_2F082:				; CODE XREF: Video_SetModeIfChanged_2F05F+Dj
		push	word_47034
		call	Video_PrintString_2F848
		pop	cx
		leave
		retf
Video_SetModeIfChanged_2F05F	endp

seg095		ends
