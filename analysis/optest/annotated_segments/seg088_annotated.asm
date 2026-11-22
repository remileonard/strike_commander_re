seg088		segment	byte public 'CODE' use16
		assume cs:seg088
		;org 7
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+6]
		cmp	word ptr [di], 0
		jnz	short loc_2ED18

loc_2ED14:				; CODE XREF: seg088:0034j
		mov	al, 0
		jmp	short loc_2ED3E
; ���������������������������������������������������������������������������

loc_2ED18:				; CODE XREF: seg088:0012j
		xor	cx, cx
		jmp	short loc_2ED37
; ���������������������������������������������������������������������������

loc_2ED1C:				; CODE XREF: seg088:003Aj
		mov	ax, cx
		shl	ax, 1
		mov	bx, [di]
		add	bx, ax
		mov	dx, [bp+8]
		inc	dx
		mov	ax, cx
		imul	dx
		mov	si, [di]
		mov	dx, [si]
		add	dx, ax
		cmp	[bx], dx
		jnz	short loc_2ED14
		inc	cx

loc_2ED37:				; CODE XREF: seg088:001Aj
		cmp	cx, [bp+0Ah]
		jb	short loc_2ED1C
		mov	al, 1

loc_2ED3E:				; CODE XREF: seg088:0016j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextFormat_RebuildLinearTable_5E66E (sub_5E66E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, réalloue (libère l'ancienne via sub_338,
; alloue la nouvelle via sub_658) et remplit une table avec une progression arithmétique
; (valeur = index×pas + décalage). Référencée par TextFormat_ResolveStyleEntry_5E4C8 (seg143)
; — génère une table d'index de style/attribut de texte.
; ==============================================================================================
TextFormat_RebuildLinearTable_2ED42	proc far		; CODE XREF: TextFormat_ResolveStyleEntry_2EB9C+3FP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		cmp	word ptr [si], 0
		jz	short loc_2ED5A
		push	word ptr [si]
		call	sub_308
		pop	cx

loc_2ED5A:				; CODE XREF: TextFormat_RebuildLinearTable_2ED42+Ej
		mov	ax, di
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		cmp	word ptr [si], 0
		jz	short loc_2ED8D
		xor	cx, cx
		jmp	short loc_2ED85
; ���������������������������������������������������������������������������

loc_2ED70:				; CODE XREF: TextFormat_RebuildLinearTable_2ED42+45j
		mov	ax, cx
		shl	ax, 1
		mov	bx, [si]
		add	bx, ax
		mov	ax, cx
		imul	[bp+arg_2]
		mov	dx, [bp+arg_6]
		add	dx, ax
		mov	[bx], dx
		inc	cx

loc_2ED85:				; CODE XREF: TextFormat_RebuildLinearTable_2ED42+2Cj
		cmp	cx, di
		jb	short loc_2ED70
		mov	al, 1
		jmp	short loc_2ED8F
; ���������������������������������������������������������������������������

loc_2ED8D:				; CODE XREF: TextFormat_RebuildLinearTable_2ED42+28j
		mov	al, 0

loc_2ED8F:				; CODE XREF: TextFormat_RebuildLinearTable_2ED42+49j
		pop	di
		pop	si
		pop	bp
		retf
TextFormat_RebuildLinearTable_2ED42	endp

seg088		ends
