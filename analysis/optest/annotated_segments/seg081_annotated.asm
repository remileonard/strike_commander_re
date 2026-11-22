seg081		segment	byte public 'CODE' use16
		assume cs:seg081
		;org 0Bh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextRenderer_GetOrInitFormatState_5D9FD (sub_5D9FD de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, singleton d'état de formatage
; (word_70E62) : l'initialise si absent (14 octets), applique un paramètre (arg_2) via
; sub_5E41D, met à jour la liste globale word_70E60 (même liste que
; SmallObject_RegisterInList_5D999, seg139). Référencée directement par TextRenderer_Main
; (sub_27477, seg048).
; ==============================================================================================
TextRenderer_GetOrInitFormatState_2CC2B	proc far		; CODE XREF: sub_5D287+55P
					; DATA XREF: seg170:035Eo

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		cmp	word_46F46, 0
		jnz	short loc_2CC73
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2CC56
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+0Dh], 0
		jmp	short loc_2CC58
; ���������������������������������������������������������������������������

loc_2CC56:				; CODE XREF: TextRenderer_GetOrInitFormatState_2CC2B+1Aj
		mov	ax, si

loc_2CC58:				; CODE XREF: TextRenderer_GetOrInitFormatState_2CC2B+29j
		mov	word_46F46, ax
		mov	al, [bp+arg_2]
		push	ax
		push	0
		push	word_46F46
		call	TextFormat_SetAttribute_2EAF1
		add	sp, 6
		mov	ax, word_46F46
		mov	word_46F44, ax

loc_2CC73:				; CODE XREF: TextRenderer_GetOrInitFormatState_2CC2B+Cj
		pop	si
		pop	bp
		retf
TextRenderer_GetOrInitFormatState_2CC2B	endp

seg081		ends
