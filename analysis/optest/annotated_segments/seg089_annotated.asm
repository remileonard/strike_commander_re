seg089		segment	byte public 'CODE' use16
		assume cs:seg089
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Fondu incrémental de type Bresenham sur n octets. Au premier appel
; (word_47030 = 1) : écart et sens de chaque composante, nombre d'étapes = plus grand écart,
; accumulateurs à la moitié. Chaque appel suivant : chaque composante avance de 1 quand son
; accumulateur dépasse le nombre d'étapes, si bien que toutes arrivent ensemble. Renvoie 1
; tant qu'il reste des étapes.
; ==============================================================================================
Palette_StepTowardTarget_2ED93	proc far		; CODE XREF: Palette_FadeStep_2D013+2CP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_2ED97:				; DATA XREF: seg170:039Eo
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_0]
		cmp	word_47030, 0
		jnz	short loc_2EDA8
		jmp	loc_2EE84
; ���������������������������������������������������������������������������

loc_2EDA8:				; CODE XREF: Palette_StepTowardTarget_2ED93+10j
		push	si
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word_49656, ax
		push	si
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word_49658, ax
		push	si
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word_4965A, ax
		cmp	word_49656, 0
		jz	short loc_2EDDB
		cmp	word_49658, 0
		jz	short loc_2EDDB
		cmp	word_4965A, 0
		jnz	short loc_2EE13

loc_2EDDB:				; CODE XREF: Palette_StepTowardTarget_2ED93+38j
					; Palette_StepTowardTarget_2ED93+3Fj
		cmp	word_49656, 0
		jz	short loc_2EDEC
		push	word_49656
		call	sub_308
		pop	cx

loc_2EDEC:				; CODE XREF: Palette_StepTowardTarget_2ED93+4Dj
		cmp	word_49658, 0
		jz	short loc_2EDFD
		push	word_49658
		call	sub_308
		pop	cx

loc_2EDFD:				; CODE XREF: Palette_StepTowardTarget_2ED93+5Ej
		cmp	word_4965A, 0
		jz	short loc_2EE0E
		push	word_4965A
		call	sub_308
		pop	cx

loc_2EE0E:				; CODE XREF: Palette_StepTowardTarget_2ED93+6Fj
					; Palette_StepTowardTarget_2ED93+120j
		xor	ax, ax
		jmp	loc_2EEFC
; ���������������������������������������������������������������������������

loc_2EE13:				; CODE XREF: Palette_StepTowardTarget_2ED93+46j
		mov	word_4965C, 0
		xor	cx, cx
		jmp	short loc_2EE5D
; ���������������������������������������������������������������������������

loc_2EE1D:				; CODE XREF: Palette_StepTowardTarget_2ED93+CCj
		mov	bx, cx
		mov	al, [bx+di]
		mov	ah, 0
		mov	bx, [bp+arg_2]
		add	bx, cx
		mov	dl, [bx]
		mov	dh, 0
		sub	ax, dx
		mov	dx, ax
		or	dx, dx
		jge	short loc_2EE41
		neg	dx
		mov	bx, word_4965A
		add	bx, cx
		mov	byte ptr [bx], 1
		jmp	short loc_2EE4A
; ���������������������������������������������������������������������������

loc_2EE41:				; CODE XREF: Palette_StepTowardTarget_2ED93+9Fj
		mov	bx, word_4965A
		add	bx, cx
		mov	byte ptr [bx], 0FFh

loc_2EE4A:				; CODE XREF: Palette_StepTowardTarget_2ED93+ACj
		mov	bx, word_49658
		add	bx, cx
		mov	[bx], dl
		cmp	dx, word_4965C
		jbe	short loc_2EE5C
		mov	word_4965C, dx

loc_2EE5C:				; CODE XREF: Palette_StepTowardTarget_2ED93+C3j
		inc	cx

loc_2EE5D:				; CODE XREF: Palette_StepTowardTarget_2ED93+88j
		cmp	cx, si
		jb	short loc_2EE1D
		mov	dx, word_4965C
		shr	dx, 1
		xor	cx, cx
		jmp	short loc_2EE74
; ���������������������������������������������������������������������������

loc_2EE6B:				; CODE XREF: Palette_StepTowardTarget_2ED93+E3j
		mov	bx, word_49656
		add	bx, cx
		mov	[bx], dl
		inc	cx

loc_2EE74:				; CODE XREF: Palette_StepTowardTarget_2ED93+D6j
		cmp	cx, si
		jb	short loc_2EE6B
		mov	ax, word_4965C
		mov	word_4965E, ax
		mov	word_47030, 0

loc_2EE84:				; CODE XREF: Palette_StepTowardTarget_2ED93+12j
		mov	ax, word_4965E
		dec	word_4965E
		or	ax, ax
		jnz	short loc_2EEB6
		push	word_49656
		call	sub_308
		pop	cx
		push	word_49658
		call	sub_308
		pop	cx
		push	word_4965A
		call	sub_308
		pop	cx
		mov	word_47030, 1
		jmp	loc_2EE0E
; ���������������������������������������������������������������������������

loc_2EEB6:				; CODE XREF: Palette_StepTowardTarget_2ED93+FAj
		xor	cx, cx
		jmp	short loc_2EEF5
; ���������������������������������������������������������������������������

loc_2EEBA:				; CODE XREF: Palette_StepTowardTarget_2ED93+164j
		mov	bx, word_49658
		add	bx, cx
		mov	al, [bx]
		mov	bx, word_49656
		add	bx, cx
		add	[bx], al
		mov	al, [bx]
		mov	ah, 0
		cmp	ax, word_4965C
		jbe	short loc_2EEF4
		mov	bx, word_49656
		add	bx, cx
		mov	al, [bx]
		sub	al, byte ptr word_4965C
		mov	bx, word_49656
		add	bx, cx
		mov	[bx], al
		mov	bx, word_4965A
		add	bx, cx
		mov	al, [bx]
		mov	bx, cx
		add	[bx+di], al

loc_2EEF4:				; CODE XREF: Palette_StepTowardTarget_2ED93+13Fj
		inc	cx

loc_2EEF5:				; CODE XREF: Palette_StepTowardTarget_2ED93+125j
		cmp	cx, si
		jb	short loc_2EEBA
		mov	ax, 1

loc_2EEFC:				; CODE XREF: Palette_StepTowardTarget_2ED93+7Dj
		pop	di
		pop	si
		pop	bp
		retf	6
Palette_StepTowardTarget_2ED93	endp

seg089		ends
