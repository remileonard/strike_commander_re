seg150		segment	byte public 'CODE' use16
		assume cs:seg150
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, compare le mode demandé à un mode courant global (word_70EA2) ; si différent, appelle
; sub_2962 (probable wrapper de changement de mode vidéo, int 10h) ; dans tous les cas
; confirme/committe le mode via sub_5EFD3. Référencée par Memory_TypedAllocDispatchE_5C916
; (seg131) — suggère que la table d'allocateurs typés du seg131 sert en réalité de registre de
; gestionnaires de ressources plus large que la seule mémoire (au moins un type gère le mode
; vidéo).
; ==============================================================================================
Video_SetModeIfChanged_5E7EA	proc far		; CODE XREF: seg131:0339P seg131:0349P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_5E7ED:
		sub	sp, 2

loc_5E7F0:
		mov	dx, [bp+arg_0]

loc_5E7F3:
		cmp	dx, word_70EA2
		jz	short loc_5E80D
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_70EA2
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_5E80D:				; CODE XREF: Video_SetModeIfChanged_5E7EA+Dj
		push	word_70EA2

loc_5E811:
		call	Video_PrintString_5EFD3
		pop	cx
		leave
		retf
Video_SetModeIfChanged_5E7EA	endp

seg150		ends
