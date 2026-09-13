seg140		segment	byte public 'CODE' use16
		assume cs:seg140
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, singleton d'état de formatage (word_70E62) : l'initialise si absent (14 octets),
; applique un paramètre (arg_2) via sub_5E41D, met à jour la liste globale word_70E60 (même
; liste que SmallObject_RegisterInList_5D999, seg139). Référencée directement par
; TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
TextRenderer_GetOrInitFormatState_5D9FD	proc far		; CODE XREF: TextRenderer_Main+51P

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_5DA01:
		mov	ax, [bp+arg_0]
		cmp	word_70E62, 0
		jnz	short loc_5DA45
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5DA28
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+0Dh], 0
		jmp	short loc_5DA2A
; ���������������������������������������������������������������������������

loc_5DA28:				; CODE XREF: TextRenderer_GetOrInitFormatState_5D9FD+1Aj
		mov	ax, si

loc_5DA2A:				; CODE XREF: TextRenderer_GetOrInitFormatState_5D9FD+29j
		mov	word_70E62, ax
		mov	al, [bp+arg_2]
		push	ax

loc_5DA31:
		push	0

loc_5DA33:
		push	word_70E62
		call	TextFormat_SetAttribute_5E41D
		add	sp, 6

loc_5DA3F:
		mov	ax, word_70E62
		mov	word_70E60, ax

loc_5DA45:				; CODE XREF: TextRenderer_GetOrInitFormatState_5D9FD+Cj
		pop	si
		pop	bp
		retf
TextRenderer_GetOrInitFormatState_5D9FD	endp

seg140		ends
